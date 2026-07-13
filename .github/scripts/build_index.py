#!/usr/bin/env python3
"""Regenerate INDEX.md and run the codex census for a given repo root.

The census is the sorted set of identifiers, one per entry file, across psp/ and
protocols/. A pre-build census reconciled against a post-build census guarantees
no existing entry silently disappears. Root is passed explicitly so this tool
lives in the skill, not in the repo.

Usage (root from CODEX_ROOT env, default '.'):
    build_index.py --write | --census | --reconcile FILE
"""
import os, sys, datetime, json

SECTIONS = [
    ("psp", "PSP · Coordinates"),
    ("protocols", "Protocols · Rule-Modules and Updates"),
]

def _first_h1(path):
    with open(path, encoding="utf-8") as f:
        for line in f:
            s = line.strip()
            if s.startswith("# "):
                return s[2:].strip()
    return os.path.splitext(os.path.basename(path))[0]

def collect(root):
    entries = {}
    for folder, _ in SECTIONS:
        d = os.path.join(root, folder)
        if not os.path.isdir(d):
            continue
        for fn in sorted(os.listdir(d)):
            if not fn.endswith(".md"):
                continue
            if fn.startswith("_") or fn.upper() == "README.MD":
                continue
            ident = os.path.splitext(fn)[0]
            entries[ident] = {"folder": folder, "file": fn,
                              "title": _first_h1(os.path.join(d, fn))}
    return entries

def census(root):
    return sorted(collect(root).keys())

def render_index(root):
    entries = collect(root)
    out = ["# CODEX INDEX", "",
           f"Generated {datetime.date.today().isoformat()}. {len(entries)} live "
           f"entries. Auto-generated. Do not hand-edit.", ""]
    for folder, heading in SECTIONS:
        rows = sorted((i, e) for i, e in entries.items() if e["folder"] == folder)
        out += [f"## {heading}", ""]
        if not rows:
            out += ["_none yet_", ""]
            continue
        for ident, e in rows:
            out.append(f"- `{ident}` · {e['title']} · "
                       f"[{e['folder']}/{e['file']}]({e['folder']}/{e['file']})")
        out.append("")
    return "\n".join(out).rstrip() + "\n"

def write_index(root):
    with open(os.path.join(root, "INDEX.md"), "w", encoding="utf-8") as f:
        f.write(render_index(root))
    return census(root)

def reconcile(before, after):
    b, a = set(before), set(after)
    return sorted(b - a), sorted(a - b)

def main(argv):
    root = os.environ.get("CODEX_ROOT", ".")
    if "--census" in argv:
        print("\n".join(census(root))); return 0
    if "--reconcile" in argv:
        before = json.load(open(argv[argv.index("--reconcile") + 1]))
        dropped, added = reconcile(before, census(root))
        print(json.dumps({"dropped": dropped, "added": added}, indent=2))
        return 2 if dropped else 0
    if "--write" in argv:
        ids = write_index(root); print(f"INDEX.md written. {len(ids)} entries."); return 0
    print(__doc__); return 1

if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
