#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""index_snapshot.py | append one telegraphic S line to INDEX.md, grammar-validated, ghost-verified.

Local write only; the push is the caller's. A REMOVE or MOVE verb also appends the
L6 Rule 6 line to CODEX_DELETIONS.log beside it, so the deletion manifest can never be
skipped by forgetting. Rolls the SNAPSHOT into INDEX_ARCHIVE/<year>.md past --roll-at
lines, leaving one R line in its place.

Usage:
  python3 index_snapshot.py --index INDEX.md --commit 4da9866a --verb SEAT --reg LIB \
      --path "Publication Library/…/TRISDUCTION_Already_That_v1_0_0.pdf" \
      --receipt "sha 57823f14" --receipt "seal af3"
  python3 index_snapshot.py --index INDEX.md --commit f43de632 --verb REMOVE --reg EXEC \
      --path "protocols/Executable Thesis/TRISDUCTION_The_Lock_Is_A_Determination_v1_0_0.pdf" \
      --receipt 'over "Only keep 1 thesis file + 1 pdf. delete the unaudited stale files."' \
      --deletions CODEX_DELETIONS.log --ghost 1200ae6b
"""
import argparse, datetime, os, re, sys

VERBS={"SEAT","BUMP","SUPERSEDE","REMOVE","MOVE","PATCH","MINT","CLAIM","LEDGER","INDEX","ROLL"}
REGS={"CODEX","THEO","PSP","PROTO","EXEC","LIB","HIST","GEQ","QT","SKILL","LEDG","TOOL","ZSNAP","CI","ROOT","OTHER","KB","ARCH","PAPER"}
HEX=re.compile(r'^[0-9a-f]{7,12}$')

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument("--index",default="INDEX.md"); ap.add_argument("--date",default=datetime.date.today().isoformat())
    ap.add_argument("--commit",required=True); ap.add_argument("--verb",required=True); ap.add_argument("--reg",required=True)
    ap.add_argument("--path",required=True); ap.add_argument("--receipt",action="append",default=[])
    ap.add_argument("--deletions",default=None); ap.add_argument("--ghost",default=None); ap.add_argument("--roll-at",type=int,default=400)
    ap.add_argument("--clone-dir",default=None,help="a clone of the target; if given, a REMOVE/MOVE ghost is verified to contain the path, and the line halts if it does not")
    a=ap.parse_args()
    if a.verb not in VERBS: sys.exit(f"HALT verb {a.verb!r} not in {sorted(VERBS)}")
    if a.reg not in REGS: sys.exit(f"HALT reg {a.reg!r} not in {sorted(REGS)}")
    if not HEX.match(a.commit): sys.exit("HALT commit must be 7-12 hex")
    if not re.match(r'^\d{4}-\d{2}-\d{2}$',a.date): sys.exit("HALT date must be YYYY-MM-DD")
    if " | " in a.path or any(" | " in r for r in a.receipt): sys.exit("HALT the field separator ' | ' may not appear inside a field")
    if a.verb in {"REMOVE","MOVE"} and not (a.deletions and a.ghost): sys.exit("HALT REMOVE/MOVE require --deletions and --ghost (L6 Rule 6)")
    if a.verb in {"REMOVE","MOVE"} and a.clone_dir:
        import subprocess
        ok = subprocess.run(["git","cat-file","-e",f"{a.ghost}:{a.path}"],cwd=a.clone_dir,capture_output=True).returncode==0
        if not ok: sys.exit(f"HALT ghost {a.ghost} does not contain {a.path}; a ghost pointer must name a commit where the file is readable")
    line=" | ".join(["S",a.date,a.commit[:7],a.verb,a.reg,a.path]+a.receipt)
    txt=open(a.index,encoding="utf-8").read()
    i=txt.find("\n## SNAPSHOT"); j=txt.find("\n## MAP")
    if i<0 or j<0: sys.exit("HALT INDEX.md lacks SNAPSHOT/MAP sections; run index_build.py first")
    snap=txt[i+1:j].rstrip("\n").split("\n"); head=snap[:2]; body=snap[2:]
    body.append(line)
    if len(body)>a.roll_at:
        keep=a.roll_at//4; rolled=body[:-keep]; body=body[-keep:]
        year=a.date[:4]; os.makedirs("INDEX_ARCHIVE",exist_ok=True); arch=f"INDEX_ARCHIVE/{year}.md"
        with open(arch,"a",encoding="utf-8") as f: f.write("\n".join(rolled)+"\n")
        body.insert(0," | ".join(["R",a.date,a.commit[:7],"ROLL","ROOT",arch,f"lines {len(rolled)}"]))
        print(f"ROLLED {len(rolled)} lines into {arch}")
    new=txt[:i+1]+"\n".join(head+body)+"\n"+txt[j:]
    open(a.index,"w",encoding="utf-8").write(new)
    print("S  "+line)
    if a.verb in {"REMOVE","MOVE"}:
        over=next((r for r in a.receipt if r.startswith("over ")),"")
        dl=f"{a.date} | {a.path} | {'RETIRED' if a.verb=='REMOVE' else 'MOVED'} | ghost at {a.ghost} | {over or 'no instruction quoted'}"
        with open(a.deletions,"a",encoding="utf-8") as f: f.write(dl+"\n")
        print("L6 "+dl)
if __name__=="__main__": main()
