#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""index_check.py | reconcile INDEX.md's MAP against the live tree. Exit 3 halts a push.

Read-only, no credential. Reports three classes of drift and nothing else:
  UNINDEXED  path in the tree, absent from the MAP
  STALE      path in the MAP, absent from the tree
  MOVED      path in both, blob id differs (content changed under the index)
Usage: python3 index_check.py --repo 1000sapients/Trisduction --index INDEX.md [--clone-dir DIR]
"""
import argparse, os, subprocess, sys

def run(cmd, cwd=None): return subprocess.check_output(cmd, cwd=cwd, text=True, stderr=subprocess.DEVNULL)
def clone(repo, d, no_fetch=False):
    if os.path.isdir(os.path.join(d, ".git")):
        if no_fetch: return run(["git", "rev-parse", "HEAD"], cwd=d).strip()
        run(["git","fetch","--quiet","--filter=blob:none"], cwd=d); run(["git","reset","--quiet","--soft","origin/HEAD"], cwd=d)
    else:
        run(["git","clone","--quiet","--filter=blob:none","--no-checkout",f"https://github.com/{repo}.git",d])
    return run(["git","rev-parse","HEAD"], cwd=d).strip()
def tree(d):
    out={}
    for line in run(["git","-c","core.quotepath=false","ls-tree","-r","-l","-z","HEAD"], cwd=d).split("\0"):
        if not line: continue
        meta,path=line.split("\t",1); _m,typ,sha,_s=meta.split()
        if typ=="blob": out[path]=sha[:8]
    return out
def mapof(index):
    out={}
    for l in open(index, encoding="utf-8"):
        if l.startswith("M | "):
            f=l.rstrip("\n").split(" | ")
            if len(f)>=8: out[f[2]]=f[5]
    return out

def main():
    ap=argparse.ArgumentParser(); ap.add_argument("--repo",required=True); ap.add_argument("--index",default="INDEX.md"); ap.add_argument("--clone-dir",default=None); ap.add_argument("--no-fetch",action="store_true")
    a=ap.parse_args(); d=a.clone_dir or f"/tmp/ix_{a.repo.replace('/','_')}"
    head=clone(a.repo,d,a.no_fetch); t=tree(d); m=mapof(a.index)
    m.pop("INDEX.md", None)  # the index never indexes its own blob, which changes on every regeneration
    unindexed=sorted(set(t)-set(m)-{"INDEX.md"}); stale=sorted(set(m)-set(t)); moved=sorted(p for p in set(t)&set(m) if t[p]!=m[p])
    print(f"INDEX CHECK | {a.repo} | head {head[:12]} | tree {len(t)} | map {len(m)}")
    for lab,arr in (("UNINDEXED",unindexed),("STALE",stale),("MOVED",moved)):
        print(f"  {lab:<10} {len(arr)}"); [print("    "+p) for p in arr[:20]]
        if len(arr)>20: print(f"    … {len(arr)-20} more")
    drift=len(unindexed)+len(stale)+len(moved)
    print("  RESULT    " + ("CLEAN, index matches tree" if drift==0 else f"DRIFT {drift}: regenerate with index_build.py before any push"))
    sys.exit(0 if drift==0 else 3)
if __name__=="__main__": main()
