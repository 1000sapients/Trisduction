#!/usr/bin/env python3
"""Add or update one codex entry and push it, deletion-proof.

Runs from the skill's tools/ directory. Clones the repo with a token supplied for
this one call, bootstraps missing scaffold (so a brand-new empty repo works on the
first add), writes the entry, rebuilds INDEX.md, reconciles a pre-build census
against a post-build census, and pushes only if no existing identifier dropped.
An add never removes an entry, so any drop is a FAULT and blocks the push. The
token is used for this invocation only and is not written into git config.

Env:
    CODEX_GH_TOKEN   fine-grained PAT, single repo, Contents read/write
    CODEX_REPO       owner/repo
    CODEX_BRANCH     optional, default main
Args:
    --section {psp,protocols} --id ID --title TITLE --body-file FILE
    [--status ACTIVE] [--supersedes "(none)"]
"""
import os, sys, subprocess, tempfile, datetime, argparse, shutil

HERE = os.path.dirname(os.path.abspath(__file__))
SCAFFOLD = os.path.join(os.path.dirname(HERE), "scaffold")
sys.path.insert(0, HERE)
import build_index as bi  # noqa: E402

def run(cmd, cwd=None):
    subprocess.run(cmd, cwd=cwd, check=True)

def ensure_scaffold(root):
    """Copy any missing scaffold file into the repo. Never overwrites."""
    for folder in ("psp", "protocols"):
        os.makedirs(os.path.join(root, folder), exist_ok=True)
    if not os.path.isdir(SCAFFOLD):
        return
    for dirpath, _, files in os.walk(SCAFFOLD):
        rel = os.path.relpath(dirpath, SCAFFOLD)
        dest = root if rel == "." else os.path.join(root, rel)
        os.makedirs(dest, exist_ok=True)
        for fn in files:
            d = os.path.join(dest, fn)
            if not os.path.exists(d):
                shutil.copy2(os.path.join(dirpath, fn), d)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--section", required=True, choices=["psp", "protocols"])
    ap.add_argument("--id", required=True)
    ap.add_argument("--title", required=True)
    ap.add_argument("--body-file", required=True)
    ap.add_argument("--status", default="ACTIVE")
    ap.add_argument("--supersedes", default="(none)")
    a = ap.parse_args()

    token = os.environ["CODEX_GH_TOKEN"]
    repo = os.environ["CODEX_REPO"]
    branch = os.environ.get("CODEX_BRANCH", "main")
    body = open(a.body_file, encoding="utf-8").read().strip()

    work = tempfile.mkdtemp(prefix="codex_")
    url = f"https://x-access-token:{token}@github.com/{repo}.git"
    # plain clone works for empty and non-empty repos alike
    run(["git", "clone", url, work])
    run(["git", "remote", "set-url", "origin",
         f"https://github.com/{repo}.git"], cwd=work)

    ensure_scaffold(work)
    before = bi.census(work)

    path = os.path.join(work, a.section, f"{a.id}.md")
    added = datetime.date.today().isoformat()
    verb = "add"
    if os.path.exists(path):
        verb = "update"
        for line in open(path, encoding="utf-8"):
            if line.startswith("Added:"):
                added = line.split(":", 1)[1].strip(); break

    header = (f"# {a.id} · {a.title}\n\nStatus: {a.status}\n"
              f"Added: {added}\nSupersedes: {a.supersedes}\n\n")
    with open(path, "w", encoding="utf-8") as f:
        f.write(header + body + "\n")

    bi.write_index(work)
    dropped, _ = bi.reconcile(before, bi.census(work))
    if dropped:
        print(f"FAULT: entries dropped during an add: {dropped}. Nothing pushed.")
        sys.exit(2)

    run(["git", "add", "-A"], cwd=work)
    run(["git", "-c", "user.name=codex-bot", "-c", "user.email=codex-bot@local",
         "commit", "-m", f"{verb}: {a.id} · {a.title}"], cwd=work)
    run(["git", "push", url, f"HEAD:{branch}"], cwd=work)
    print(f"pushed {verb} of {a.id} to {repo}@{branch}. "
          f"{len(bi.census(work))} live entries.")

if __name__ == "__main__":
    main()
