#!/usr/bin/env python3
"""Parse a codex-labelled issue and write one entry. Census-gated.

Reads ISSUE_BODY. Header lines above the first line that is exactly '---',
then the entry body below it. Header keys: section (psp|protocols), id, title.
Writes {section}/{id}.md, rebuilds INDEX.md, reconciles a pre-build census
against a post-build census. Any dropped identifier is a FAULT and fails the
run so nothing is committed. Emits commit_message and result as step outputs.
"""
import os, re, sys, datetime
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import build_index as bi

ROOT = os.environ.get("GITHUB_WORKSPACE", ".")

def out(key, val):
    gh = os.environ.get("GITHUB_OUTPUT")
    if gh:
        with open(gh, "a") as f:
            f.write(f"{key}<<__EOF__\n{val}\n__EOF__\n")

def fail(msg):
    out("result", "FAILED: " + msg)
    out("commit_message", "")
    print("FAILED:", msg)
    sys.exit(1)

body = (os.environ.get("ISSUE_BODY", "") or "").replace("\r\n", "\n")
lines = body.split("\n")
sep = next((i for i, ln in enumerate(lines) if ln.strip() == "---"), None)
if sep is None:
    fail("no '---' separator line between header and body")

header = "\n".join(lines[:sep])
entry_body = "\n".join(lines[sep + 1:]).strip()

def key(k):
    m = re.search(rf"(?im)^\s*{k}\s*:\s*(.+?)\s*$", header)
    return m.group(1).strip() if m else ""

section = key("section").lower()
ident = key("id")
title = key("title")

if section not in ("psp", "protocols"):
    fail(f"section must be psp or protocols, got '{section}'")
if not re.fullmatch(r"[A-Za-z0-9._-]+", ident or ""):
    fail(f"id missing or has unsafe characters: '{ident}'")
if not title:
    fail("title missing")
if not entry_body:
    fail("body is empty")

before = bi.census(ROOT)
path = os.path.join(ROOT, section, f"{ident}.md")
os.makedirs(os.path.dirname(path), exist_ok=True)
added = datetime.date.today().isoformat()
verb = "add"
if os.path.exists(path):
    verb = "update"
    for line in open(path, encoding="utf-8"):
        if line.startswith("Added:"):
            added = line.split(":", 1)[1].strip(); break

hdr = (f"# {ident} · {title}\n\nStatus: ACTIVE\n"
       f"Added: {added}\nSupersedes: (none)\n\n")
with open(path, "w", encoding="utf-8") as f:
    f.write(hdr + entry_body + "\n")

bi.write_index(ROOT)
dropped, _ = bi.reconcile(before, bi.census(ROOT))
if dropped:
    fail(f"census fault, entries dropped: {dropped}")

n = len(bi.census(ROOT))
issue = os.environ.get("ISSUE_NUMBER", "")
out("commit_message", f"{verb}: {ident} · {title} (issue #{issue})")
out("result", f"Done. {verb} of {ident} committed. {n} live entries.")
print(f"{verb} {ident}; {n} entries")
