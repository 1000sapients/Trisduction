#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""index_build.py | regenerate the MAP section of INDEX.md from the live tree.

Read-only against the remote. No credential: a blobless partial clone supplies
tree, blob ids, sizes and last-moved dates in one pass. The SNAPSHOT section of
the existing INDEX.md is preserved byte-for-byte; only the header and the MAP
are regenerated. The tree is the territory; the MAP is its cast.

Usage:
  python3 index_build.py --repo 1000sapients/Trisduction --out INDEX.md [--clone-dir /tmp/ix]
  python3 index_build.py --repo Trisduction/Knowledge-Base --out INDEX.md --register-scheme kb

Grammar of an M line, fields split on ' | ':
  M | REG | path | kind | ver | blob8 | bytes | moved | what
"""
import argparse, os, re, subprocess, sys, datetime, json

PUBLIC_REG = [  # first match wins
    ("protocols/Executable Thesis/", "EXEC"),
    ("protocols/",                   "PROTO"),
    ("master/",                      "CODEX"),
    ("Theological PSP Codex/",       "THEO"),
    ("psp/",                         "PSP"),
    ("Publication Library/",         "LIB"),
    ("History & Theology/",          "HIST"),
    ("Geometric Encyclopedia of the Quran/", "GEQ"),
    ("Quran Translation/",           "QT"),
    ("Skills/",                      "SKILL"),
    ("publication/",                 "LEDG"),
    ("tools/",                       "TOOL"),
    ("Zenodo Snapshot",              "ZSNAP"),
    (".github/",                     "CI"),
]
KB_REG = [("Skills/", "SKILL"), ("Private Archive/", "ARCH"), ("Trisduction Papers/", "PAPER")]

VER_RE = re.compile(r'_v(\d+)[_.](\d+)(?:[_.](\d+))?(?:[_.-]([A-Za-z0-9]+))?(?=\.[A-Za-z0-9]+$|$)')
VER2_RE = re.compile(r'\bv(\d+)\.(\d+)(?:\.(\d+))?\b')

def reg_of(path, scheme):
    table = PUBLIC_REG if scheme == "public" else KB_REG
    for prefix, code in table:
        if path.startswith(prefix): return code
    if "/" not in path: return "ROOT"
    return "KB" if scheme == "kb" else "OTHER"

def ver_of(name):
    name = name.rsplit(".", 1)[0] if "." in name and not name.startswith(".") else name   # strip the extension first
    m = VER_RE.search(name) or VER2_RE.search(name)
    if not m: return "-"
    parts = [p for p in m.groups() if p is not None]
    return "v" + ".".join(parts[:3]) + (("-" + parts[3]) if len(parts) > 3 else "")

def kind_of(path):
    base = path.rsplit("/", 1)[-1]
    return base.rsplit(".", 1)[-1].lower() if "." in base else "-"

def run(cmd, cwd=None):
    return subprocess.check_output(cmd, cwd=cwd, text=True, stderr=subprocess.DEVNULL)

def clone(repo, d, no_fetch=False):
    if os.path.isdir(os.path.join(d, ".git")):
        if no_fetch: return run(["git", "rev-parse", "HEAD"], cwd=d).strip()
        run(["git", "fetch", "--quiet", "--filter=blob:none"], cwd=d)
        run(["git", "reset", "--quiet", "--soft", "origin/HEAD"], cwd=d)
    else:
        run(["git", "clone", "--quiet", "--filter=blob:none", "--no-checkout",
             f"https://github.com/{repo}.git", d])
    return run(["git", "rev-parse", "HEAD"], cwd=d).strip()

def tree(d):
    out = {}
    for line in run(["git", "-c", "core.quotepath=false", "ls-tree", "-r", "-l", "-z", "HEAD"], cwd=d).split("\0"):
        if not line: continue
        meta, path = line.split("\t", 1)
        _mode, typ, sha, size = meta.split()
        if typ == "blob": out[path] = (sha, int(size))
    return out

def moved(d):
    seen = {}; date = None
    for l in run(["git", "-c", "core.quotepath=false", "log", "--format=%cs", "--name-only", "--diff-filter=ACMR"], cwd=d).splitlines():
        if not l: continue
        if len(l) == 10 and l[4] == "-" and l[7] == "-": date = l; continue
        seen.setdefault(l, date)
    return seen

WHAT_LEN = 96

def _first_line(txt):
    for l in txt.splitlines():
        l = l.strip().strip("#").strip()
        if l and not l.startswith(("---","```","<!--","!====","!---")): return l
    return ""

def what_of(full, kind):
    """One line of what the file is, read from the file. Never from the filename."""
    try:
        if kind in ("md","txt","log","yml","yaml","jsonl","tex","csv","f90","css","lean","-","cfg","ini","toml"):
            head = open(full, encoding="utf-8", errors="replace").read(4000)
            if kind == "md":
                m = re.search(r'^title:\s*"?(.+?)"?\s*$', head, re.M)
                if m: return m.group(1)
                m = re.search(r'^#\s+(.+)$', head, re.M)
                if m: return m.group(1).strip()
            if kind == "f90":
                m = re.search(r'^!\s{1,4}([A-Z][^\n]{8,})$', head, re.M)
                if m: return m.group(1).strip()
            if kind == "jsonl":
                try:
                    j = json.loads(head.splitlines()[0]); return "jsonl: " + ", ".join(list(j)[:6])
                except Exception: pass
            return _first_line(head)
        if kind == "py":
            head = open(full, encoding="utf-8", errors="replace").read(3000)
            m = re.search(r'"""(.+?)(?:\n|""")', head, re.S) or re.search(r'^#\s*(.+)$', head, re.M)
            return m.group(1).strip() if m else _first_line(head)
        if kind == "json":
            j = json.load(open(full, encoding="utf-8"))
            if isinstance(j, dict):
                for k in ("title","name","_schema","schema","description"):
                    if k in j and isinstance(j[k], str): return j[k]
                return "json: " + ", ".join(list(j)[:6])
            return f"json: list of {len(j)}"
        if kind == "pdf":
            info = subprocess.run(["pdfinfo", full], capture_output=True, text=True).stdout
            m = re.search(r'^Title:\s*(.+)$', info, re.M)
            pages = re.search(r'^Pages:\s*(\d+)$', info, re.M)
            t = m.group(1).strip() if m and m.group(1).strip() else ""
            if not t or t.lower().endswith((".pdf",".docx",".md",".tex")) or len(t) < 6:
                txt = subprocess.run(["pdftotext","-l","1",full,"-"], capture_output=True, text=True).stdout
                t = _first_line(txt)
            return (t + (f" ({pages.group(1)}p)" if pages else "")).strip()
        if kind == "html":
            head = open(full, encoding="utf-8", errors="replace").read(6000)
            m = re.search(r"<title>(.*?)</title>", head, re.S|re.I)
            return re.sub(r"\s+"," ",m.group(1)).strip() if m else _first_line(re.sub(r"<[^>]+>"," ",head))
        if kind == "docx":
            import zipfile, html
            with zipfile.ZipFile(full) as z:
                names = set(z.namelist())
                if "docProps/core.xml" in names:
                    m = re.search(r"<dc:title>(.*?)</dc:title>", z.read("docProps/core.xml").decode("utf-8", "replace"), re.S)
                    if m and m.group(1).strip(): return html.unescape(m.group(1).strip())
                xml = z.read("word/document.xml").decode("utf-8", "replace")
            for para in re.findall(r"<w:p[ >].*?</w:p>", xml, re.S):
                t = html.unescape("".join(re.findall(r"<w:t[^>]*>(.*?)</w:t>", para, re.S))).strip()
                if t: return re.sub(r"\s+", " ", t)
            return "-"
        if kind == "zip":
            import zipfile
            with zipfile.ZipFile(full) as z: return f"zip: {len(z.namelist())} entries"
        if kind in ("gitignore",): return "git ignore rules"
    except Exception as e:
        return f"unreadable: {type(e).__name__}"
    return "-"

def read_snapshot(path):
    """Everything from the SNAPSHOT heading down to the MAP heading, verbatim; empty if absent."""
    if not os.path.exists(path): return ""
    txt = open(path, encoding="utf-8").read()
    i = txt.find("\n## SNAPSHOT"); j = txt.find("\n## MAP")
    if i < 0: return ""
    return txt[i+1:j if j > i else len(txt)].rstrip("\n") + "\n"

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--repo", required=True)
    ap.add_argument("--out", default="INDEX.md")
    ap.add_argument("--clone-dir", default=None)
    ap.add_argument("--no-fetch", action="store_true", help="use --clone-dir as it stands; the tool touches no network and needs no credential")
    ap.add_argument("--register-scheme", choices=["public", "kb"], default="public")
    ap.add_argument("--content-dir", default=None, help="a full checkout at the same head; supplies the what column")
    a = ap.parse_args()
    d = a.clone_dir or f"/tmp/ix_{a.repo.replace('/', '_')}"
    head = clone(a.repo, d, a.no_fetch)
    t = tree(d); mv = moved(d)
    t.pop("INDEX.md", None)   # the index never indexes its own blob; its id changes on every regeneration
    bad = [p for p in t if " | " in p]
    if bad: sys.exit("HALT paths contain the field separator ' | ': " + "; ".join(bad))
    snap = read_snapshot(a.out)
    if not snap:
        snap = ("## SNAPSHOT | append-only | one line per push | newest last\n"
                "# S | date | commit7 | VERB | REG | path-or-key | receipts…   (decoder at the foot of this file)\n")
    today = datetime.date.today().isoformat()
    lines = [f"# INDEX | {a.repo} | generated {today} | head {head[:12]} | {len(t)} live paths",
             "Advisory map of the tree. The tree governs. MAP regenerated by tools/index_build.py; "
             "SNAPSHOT append-only by tools/index_snapshot.py; drift halts a push via tools/index_check.py.",
             "", snap.rstrip("\n"), "",
             "## MAP | regenerated | one line per live path",
             "# M | REG | path | kind | ver | blob8 | bytes | moved | what"]
    regs = {}
    for p, (sha, size) in t.items(): regs.setdefault(reg_of(p, a.register_scheme), []).append(p)
    for reg in sorted(regs):
        lines.append(f"### {reg} | {len(regs[reg])}")
        for p in sorted(regs[reg]):
            sha, size = t[p]
            w = "-"
            if a.content_dir:
                w = what_of(os.path.join(a.content_dir, p), kind_of(p)).replace(" | ", " / ").replace("\n"," ")
                w = (w[:WHAT_LEN-1] + "…") if len(w) > WHAT_LEN else w
            lines.append(f"M | {reg} | {p} | {kind_of(p)} | {ver_of(p.rsplit('/',1)[-1])} | {sha[:8]} | {size} | {mv.get(p,'-')} | {w}")
    lines += ["", "## DECODER",
              "Fields split on ' | '. S line: S | date | commit7 | VERB | REG | path-or-key | receipts. VERB ∈ SEAT BUMP SUPERSEDE REMOVE MOVE PATCH MINT CLAIM LEDGER INDEX ROLL. "
              "REG ∈ " + " ".join(sorted({c for _, c in (PUBLIC_REG if a.register_scheme=='public' else KB_REG)} | {"ROOT","OTHER","KB"})) + ".",
              "M line: M | REG | path | kind | ver | blob8 | bytes | moved | what. blob8 is the git object id, ver the filename version token or -, moved the last commit date touching the path, what one line read from the file itself (title, heading, docstring, PDF title, schema) and never from the filename.",
              "R line: R | date | commit7 | ROLL | ROOT | INDEX_ARCHIVE/<year>.md | lines n. Emitted when SNAPSHOT is rolled; the archive file holds the rolled lines verbatim.",
              "Receipts are key-value pairs: sha <8> (sha256 head), doi <id>, ia <identifier>, seal <cycle><round>, l9 <lost>/<added>, over \"<architect instruction>\" for REMOVE."]
    open(a.out, "w", encoding="utf-8").write("\n".join(lines) + "\n")
    print(f"INDEX built | {a.repo} | head {head[:12]} | {len(t)} paths | {len(regs)} registers | snapshot lines preserved: {snap.count(chr(10))-2}")

if __name__ == "__main__":
    main()
