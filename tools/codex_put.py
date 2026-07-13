#!/usr/bin/env python3
"""Publish an arbitrary file to a path in the codex repo. Non-destructive.

For document-type tasks: master codex versions and preprints. These are
documents, not ledger entries, so no census runs. Old versions are never
deleted; a new version is a new filename. If --pointer is given, the dest's
basename is written into that pointer file so a 'current' marker stays fresh.

Env:  CODEX_GH_TOKEN, CODEX_REPO, CODEX_BRANCH (default main)
Args: --src FILE --dest REPO_PATH [--pointer POINTER_PATH] [--message MSG]
"""
import os, sys, subprocess, tempfile, shutil, argparse

token = os.environ["CODEX_GH_TOKEN"]
repo = os.environ["CODEX_REPO"]
branch = os.environ.get("CODEX_BRANCH", "main")

def scrub(s): return (s or "").replace(token, "***TOKEN***")

def run(cmd, cwd=None):
    p = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True)
    if p.returncode != 0:
        print("STDOUT:", scrub(p.stdout)); print("STDERR:", scrub(p.stderr)); sys.exit(p.returncode)
    return p

ap = argparse.ArgumentParser()
ap.add_argument("--src", required=True)
ap.add_argument("--dest", required=True)
ap.add_argument("--pointer", default="")
ap.add_argument("--message", default="")
a = ap.parse_args()

work = tempfile.mkdtemp(prefix="codexput_")
url = f"https://x-access-token:{token}@github.com/{repo}.git"
run(["git", "clone", url, work])

dest = os.path.join(work, a.dest)
os.makedirs(os.path.dirname(dest), exist_ok=True)
existed = os.path.exists(dest)
shutil.copy2(a.src, dest)
if a.pointer:
    with open(os.path.join(work, a.pointer), "w", encoding="utf-8") as f:
        f.write(os.path.basename(a.dest) + "\n")

run(["git", "add", "-A"], cwd=work)
if not subprocess.run(["git", "status", "--porcelain"], cwd=work, capture_output=True, text=True).stdout.strip():
    print("RESULT: identical file already present, nothing to commit."); sys.exit(0)

verb = "update" if existed else "add"
msg = a.message or f"{verb}: {a.dest}"
run(["git", "-c", "user.name=codex-bot", "-c", "user.email=codex-bot@local",
     "commit", "-m", msg], cwd=work)
run(["git", "push", url, f"HEAD:{branch}"], cwd=work)
head = subprocess.run(["git", "rev-parse", "--short", "HEAD"], cwd=work, capture_output=True, text=True).stdout.strip()
print(f"RESULT: {verb} {a.dest} commit={head}")
