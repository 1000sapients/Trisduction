# -*- coding: utf-8 -*-
"""PUBLIC LABEL MAP ENGINE · protocols/label_map.py

Single self-contained file. Harvests the codex index and the legacy supersession
block, runs the deterministic reduction, and emits the registry in Markdown and
JSON. Shipped rather than described, because under an append-only law two
sessions minting two labels for one coordinate is unrecoverable once one ships.

  python3 label_map.py <master_codex.md> [outdir]

Determinism is the contract: same codex in, byte-identical registry out.
Append-safety is the load-bearing property: adding coordinates never moves an
existing label. Both are asserted by self_test().
"""
import re, io, json, os, sys

PREFIXES  = ["APEX-PSP-", "MD-PSP-", "CN-PSP-", "sPSP-", "PSP-", "APEX-", "MD-", "CN-"]
REGISTER  = {"SPSP", "PSP", "APEX", "MD", "CN"}          # never carried forward
FAMILY_KEEP = {"TP","LL","SE","MA","ODE","BA","AP","DF","SUB","ESC","AD","FT","P","W"}
GENERIC   = {"MASTER","PROTOCOL","CASCADE","LAW","VERDICT","THE","OF","AND","ON","CERT","PSP"}
ABBREV    = {"ADMISSION":"ADMIT","COMPOSITE":"COMP","COMPARATIVE":"COMP","SUSPENSION":"SUSP",
             "FOUNDATION":"FOUND","DISSOLUTION":"DISSOL","INCOMPLETENESS":"INCOMP",
             "ORTHOGONAL":"ORTHO","REGISTRATION":"REGIS","ATTRIBUTION":"ATTRIB",
             "PROCLAMATION":"PROCLAM","IDENTIFICATION":"IDENT","QUARANTINE":"QUAR",
             "DETERMINACY":"DETERM","GENEALOGY":"GENEAL","INVARIANCE":"INVAR",
             "GROUNDLESS":"GRNDLESS","UNPROVABILITY":"UNPROV","TERMINALITY":"TERMINAL",
             "EXECUTION":"EXEC","PHYSICAL":"PHYS","BARRIERS":"BARRIER","OUROBOROS":"OUROB",
             "COMPLEXITY":"CPLX","MINDSET":"MIND","HOLOGRAM":"HOLO","EMBODIED":"EMBOD"}
CAP = 12

def clean(native):
    n = re.sub(r'\s*·.*$', '', native).strip()          # drop trailing status marks
    return n

def split_id(n):
    m = re.search(r'-(\d{1,3})([A-Za-z])?$', n)
    if m:
        return n[:m.start()], int(m.group(1)), (m.group(2) or "").upper()
    return n, 1, ""

def family_form(n):
    """FAM-NNN or FAM-NNNa with no descriptive token."""
    m = re.match(r'^([A-Za-z]+)-?(\d+)([A-Za-z])?$', n)
    if not m:
        return None
    fam, num, suf = m.group(1).upper(), int(m.group(2)), (m.group(3) or "").upper()
    if fam not in FAMILY_KEEP and fam not in REGISTER:
        return None                                      # a named coordinate, not a family code
    return fam, num, suf

def stem_tokens(n):
    for p in PREFIXES:
        if n.upper().startswith(p.upper()):
            n = n[len(p):]; break
    toks = [t.upper() for t in n.split('-') if t]
    kept = [ABBREV.get(t, t) for t in toks if t not in GENERIC and t not in REGISTER]
    if not kept:
        kept = [ABBREV.get(t, t) for t in toks if t not in REGISTER] or \
               [ABBREV.get(t, t) for t in toks]
    return kept

def assemble(kept, ntok=2):
    use = kept[:ntok]
    stem = "-".join(use)
    while len(stem) > CAP and len(use) > 1:
        use = use[:-1] + [use[-1][:3]]
        stem = "-".join(use)
        if len(stem) > CAP and len(use) > 1:
            use = use[:-1]; stem = "-".join(use)
    if len(stem) > CAP:
        stem = stem[:CAP].rstrip('-')
    return stem

def reduce_one(native, ntok=2):
    n = clean(native)
    ff = family_form(n)
    if ff:
        fam, num, suf = ff
        if fam in FAMILY_KEEP:
            return "P-%s-%d%s" % (fam, num, suf), "family"
        return None, "register"                          # index form, assigned by caller
    base, num, suf = split_id(n)
    if not stem_tokens(base):
        return None, "register"
    return "P-%s-%d%s" % (assemble(stem_tokens(base), ntok), num, suf), "named"

def build(rows):
    """rows: (index, native, title, verdict). Returns records and a collision report."""
    recs = []
    for idx, native, title, verdict in rows:
        lab, kind = reduce_one(native)
        if lab is None:
            lab = "P-%s" % idx
        recs.append(dict(index=idx, native=clean(native), title=title,
                         verdict=verdict, label=lab, kind=kind))
    groups = {}
    for r in recs:
        groups.setdefault(r["label"], []).append(r)
    collisions = []
    for lab, grp in sorted(groups.items()):
        if len(grp) == 1:
            continue
        collisions.append(dict(label=lab, members=[(g["index"], g["native"]) for g in grp]))
        grp.sort(key=lambda g: g["index"])
        # INCUMBENT PIN. The lowest-index member keeps the label it would carry alone.
        # Only later members re-label. Without this, token restoration renames every
        # member of a group, so a label already shipped in a published PDF moves when a
        # later coordinate arrives, which the append-only law cannot survive.
        taken = set(groups.keys()) - {lab}
        taken.add(grp[0]["label"])
        notes = ["incumbent %s pinned" % grp[0]["index"]]
        for g in grp[1:]:
            placed = False
            for n in (3, 4, 5):                          # restore tokens in source order
                cand = reduce_one(g["native"], n)[0]
                if cand and cand not in taken:
                    g["label"] = cand; taken.add(cand)
                    notes.append("%s by token restore at depth %d" % (g["index"], n))
                    placed = True
                    break
            if not placed:
                g["label"] = "P-%s" % g["index"]; taken.add(g["label"])
                notes.append("%s to index form" % g["index"])
        collisions[-1]["resolution"] = "; ".join(notes)
    return recs, collisions

def harvest(path, index_starts_at=12250):
    L = io.open(path, encoding='utf-8', errors='replace').read().split('\n')
    live, legacy = [], []
    for i, l in enumerate(L):
        m = re.match(r'^\|\s*(\d{4}L?)\s*\|\s*(.+?)\s*\|\s*(.*?)\s*\|\s*(.*?)\s*\|\s*$', l)
        if m:
            g = list(m.groups())
        else:
            m3 = re.match(r'^\|\s*(\d{4}L)\s*\|\s*(.+?)\s*\|\s*(.*?)\s*\|\s*$', l)
            if not m3:
                continue
            g = [m3.group(1), m3.group(2), m3.group(3), '']
        g[1] = re.sub(r'\s*·\s*\[SUPERSEDED\]', '', g[1])
        g[2] = g[2].rstrip('\\ ').strip()
        if g[0].endswith('L'):
            legacy.append(tuple(g))
        elif i + 1 >= index_starts_at:
            live.append(tuple(g))
    return live, legacy

def annotate(recs, rows):
    for r, src in zip(recs, rows):
        body = " ".join(src[2:])
        r['status'] = 'SUPERSEDED' if (src[0].endswith('L') or 'SUPERSEDED' in body) else 'LIVE'
        m = re.search(r'[Ss]uperseded by ([A-Za-z0-9\-\.]+)', body)
        r['successor'] = m.group(1).rstrip('.,') if m else ''
    return recs

def emit(recs, outdir="."):
    """Emit registry Markdown and JSON. Byte-identical for identical input."""
    import os
    recs = sorted(recs, key=lambda r: (r['index'].rstrip('L'), r['index']))
    nat2lab = {r['native']: r['label'] for r in recs}
    for r in recs:
        r['successor_label'] = nat2lab.get(r['successor'], '')
    live = sum(1 for r in recs if r['status'] == 'LIVE')
    kinds = {}
    for r in recs:
        kinds[r['kind']] = kinds.get(r['kind'], 0) + 1
    o = []; w = o.append
    w("# PUBLIC LABEL MAP"); w("")
    w("Crosswalk from native codex identifiers to short public labels for PDF rendering, produced by the "
      "deterministic reduction of Module X of the trisduction-publication-format skill and emitted by "
      "`protocols/label_map.py`. %d rows, %d live and %d ghost, harvested from the coordinate index and the "
      "legacy supersession block of the master codex. Never produced or edited by hand."
      % (len(recs), live, len(recs) - live)); w("")
    w("## The law"); w("")
    w("Append-only. Once a label ships in a published PDF it is a citation in the wild and can never move. New "
      "coordinates append. Existing labels never change. A label is never reassigned, recycled, or renumbered. "
      "Regenerating the registry wholesale over a grown census is forbidden: the reduction is deterministic but "
      "collision resolution depends on which coordinates were present, so a fresh run could move a shipped "
      "label. The engine asserts both properties in `self_test()` before it will emit."); w("")
    w("Ghosts are rows, not deletions. A superseded coordinate keeps its label and its row, carrying status "
      "SUPERSEDED and a pointer to its successor's label. This is the codex-hygiene Prime Rule executed at the "
      "label layer, and it is what lets a reader resolve a label cited in an older PDF and reach the live card. "
      "A ghost label is legal to resolve and illegal to cite fresh."); w("")
    w("No register marker is carried forward. APEX, CN, MD, sPSP, and PSP encode internal hierarchy and, in the "
      "CN case, the confessional register; a public PDF printing them leaks exactly what the Module IX "
      "Register-Transit Filter holds at source. Where a coordinate carries a register marker and no descriptive "
      "token, its label is the codex index, the codex's own primary key, stable under append-only."); w("")
    w("Functional families carry. TP, LL, SE, MA, ODE, BA, AP, DF, SUB, ESC, AD, FT, W, and the foundational P "
      "series are functional codes rather than register markers, so they travel as family plus number."); w("")
    w("This map is a rendering aid and carries no warrant. A label names a coordinate; it never states or "
      "implies its verdict, its grade, or its standing."); w("")
    w("## Coverage and the known gap"); w("")
    w("Covers every row of the codex index and every row of the legacy supersession block. Does not cover the "
      "off-index coordinates, which do not appear in the index table and cannot be harvested mechanically. A "
      "paper needing one mints its label by running this engine on that coordinate alone against this registry "
      "and appends the row. An unlabeled coordinate cited in a PDF fails Gate 5, which is intended: the gap is "
      "visible at build time rather than silent on a published page."); w("")
    w("## Reduction summary"); w("")
    w("| branch | rows | form | example |"); w("|---|---|---|---|")
    w("| named | %d | `P-STEM-N`, two tokens, stem capped at twelve characters | `P-TRIAXIS-1` |" % kinds.get('named', 0))
    w("| family | %d | `P-FAM-N`, functional family carried | `P-TP-21` |" % kinds.get('family', 0))
    w("| register | %d | `P-NNNN`, codex index, no descriptive token available | `P-0299` |" % kinds.get('register', 0))
    w("")
    w("## The map"); w("")
    w("| label | status | index | native identifier | successor | title |")
    w("|---|---|---|---|---|---|")
    for r in recs:
        t = r['title'].replace('|', '\\|')
        if len(t) > 78:
            t = t[:75].rstrip() + "..."
        suc = ("`%s`" % r['successor_label']) if r['successor_label'] else (
              ("`%s`" % r['successor']) if r['successor'] else "")
        w("| `%s` | %s | %s | `%s` | %s | %s |"
          % (r['label'], 'live' if r['status'] == 'LIVE' else 'ghost', r['index'], r['native'], suc, t))
    md = "\n".join(o) + "\n"
    side = {r['label']: dict(index=r['index'], native=r['native'], status=r['status'],
                             successor=r['successor_label'] or r['successor'], title=r['title'])
            for r in recs}
    js = json.dumps(side, ensure_ascii=False, indent=1, sort_keys=True)
    io.open(os.path.join(outdir, "PUBLIC_LABEL_MAP.md"), "w", encoding="utf-8").write(md)
    io.open(os.path.join(outdir, "PUBLIC_LABEL_MAP.json"), "w", encoding="utf-8").write(js)
    return md, js


def self_test(path):
    """Assert determinism and append-safety. Emission is refused if either fails."""
    import hashlib
    live, legacy = harvest(path)
    rows = live + legacy

    def run(rs):
        rec, col = build(list(rs))
        annotate(rec, rs)
        return rec, col

    a, ca = run(rows)
    b, cb = run(rows)
    ha = hashlib.sha256(json.dumps([(r['index'], r['label']) for r in a], sort_keys=True).encode()).hexdigest()
    hb = hashlib.sha256(json.dumps([(r['index'], r['label']) for r in b], sort_keys=True).encode()).hexdigest()
    assert ha == hb, "DETERMINISM FAILURE: two runs on one codex disagree"

    # append-safety: seat synthetic coordinates, including deliberate collisions
    extra = [("9001", "APEX-PSP-TRIAXIS-VERDICT-09", "synthetic collision with P-TRIAXIS-1", ""),
             ("9002", "CN-PSP-TAWHID-TRIUNE-LAW-01", "synthetic collision with P-TAWHID-TRI-1", ""),
             ("9003", "sPSP-900", "synthetic register-branch row", ""),
             ("9004", "APEX-PSP-GENEALOGY-77", "synthetic near-miss on a resolved collision", "")]
    c, cc = run(rows + extra)
    before = {r['index']: r['label'] for r in a}
    after = {r['index']: r['label'] for r in c}
    moved = {i: (before[i], after[i]) for i in before if before[i] != after[i]}
    assert not moved, "APPEND-SAFETY FAILURE: existing labels moved -> %s" % moved
    assert len(set(r['label'] for r in c)) == len(c), "uniqueness lost after append"
    return dict(rows=len(a), unique=len(set(r['label'] for r in a)), collisions=len(ca),
                digest=ha[:16], appended=len(extra), moved=0)


if __name__ == "__main__":
    src = sys.argv[1] if len(sys.argv) > 1 else "master_codex.md"
    out = sys.argv[2] if len(sys.argv) > 2 else "."
    report = self_test(src)
    live, legacy = harvest(src)
    rows = live + legacy
    recs, coll = build(rows); annotate(recs, rows)
    emit(recs, out)
    print("PUBLIC LABEL MAP emitted · %(rows)d rows · %(unique)d unique · %(collisions)d collisions "
          "· digest %(digest)s · append-safety verified over %(appended)d synthetic rows, %(moved)d moved"
          % report)
