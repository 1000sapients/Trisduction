#!/usr/bin/env python3
"""Publish a file attached to a 'codex-file' issue. No token in chat.

Reads ISSUE_BODY. Keys anywhere in the body: dest (target folder, default
preprints/), name (optional filename override). The dragged file appears in the
body as a github user-attachments URL; this fetches it and writes the bytes into
dest. Documents are append-only, so an existing path is a same-path update and
is flagged; version-stamped names keep history. Emits commit_message and result.
"""
import os, re, sys, urllib.request

ROOT = os.environ.get("GITHUB_WORKSPACE", ".")

def out(k, v):
    gh = os.environ.get("GITHUB_OUTPUT")
    if gh:
        with open(gh, "a") as f:
            f.write(f"{k}<<__EOF__\n{v}\n__EOF__\n")

def fail(m):
    out("result", "FAILED: " + m); out("commit_message", ""); print("FAILED:", m); sys.exit(1)

body = (os.environ.get("ISSUE_BODY", "") or "").replace("\r\n", "\n")

def key(k, default=""):
    m = re.search(rf"(?im)^[^\S\n]*{k}[^\S\n]*:[^\S\n]*(.*?)[^\S\n]*$", body)
    return m.group(1).strip() if m else default

dest = key("dest", "preprints/").lstrip("/")
name = key("name", "")

m = re.search(r"https://github\.com/user-attachments/[^\s)\]]+", body) \
    or re.search(r"https://[^\s)\]]*githubusercontent\.com/[^\s)\]]+", body)
if not m:
    fail("no attached file found. Drag a file into the issue body.")
url = m.group(0)

if not re.fullmatch(r"[A-Za-z0-9._/-]+", dest):
    fail(f"unsafe dest folder: {dest}")
if not dest.endswith("/"):
    dest += "/"

fname = (name or url.split("/")[-1]).split("?")[0]
if not re.fullmatch(r"[A-Za-z0-9._-]+", fname):
    fail(f"unsafe filename: {fname}")

def download(u, use_auth):
    req = urllib.request.Request(u, headers={"User-Agent": "codex-file"})
    if use_auth and os.environ.get("GH_TOKEN"):
        req.add_header("Authorization", "Bearer " + os.environ["GH_TOKEN"])
    with urllib.request.urlopen(req, timeout=90) as r:
        return r.read()

data = None
for use_auth in (False, True):
    try:
        data = download(url, use_auth); break
    except Exception as e:
        last = e
if not data:
    fail(f"could not download the attached file: {last}")

destdir = os.path.join(ROOT, dest)
os.makedirs(destdir, exist_ok=True)
path = os.path.join(destdir, fname)
existed = os.path.exists(path)
with open(path, "wb") as f:
    f.write(data)

verb = "update" if existed else "add"
issue = os.environ.get("ISSUE_NUMBER", "")
out("commit_message", f"{verb}: {dest}{fname} (issue #{issue})")
warn = "  Note: same-path update of an append-only document; use a version-stamped name to keep history." if existed else ""
out("result", f"Done. {verb} of {dest}{fname} ({len(data)} bytes) committed.{warn}")
print(f"{verb} {dest}{fname} {len(data)}B")
