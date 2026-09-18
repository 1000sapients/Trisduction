#!/bin/sh
# Verifier for RH_Formal_Proof_Final.lean: toolchain, hash, escape-hatch scan outside comments, compile with cones pinned.
set -u; F=RH_Formal_Proof_Final.lean; LEAN="${LEAN:-lean}"
command -v "$LEAN" >/dev/null 2>&1 || { echo "FAIL: lean not found; set LEAN=/path/to/lean"; exit 2; }
V=$("$LEAN" --version 2>/dev/null)
case "$V" in *"version 4.19.0"*) ;; *) echo "FAIL: toolchain '$V', required 4.19.0"; exit 2;; esac
echo "toolchain: $V"
if [ -f MANIFEST.sha256 ]; then H=$(sha256sum "$F" | cut -c1-64); P=$(grep " $F$" MANIFEST.sha256 | cut -c1-64)
  if [ "$H" = "$P" ]; then echo "hash: $H matches MANIFEST"; else echo "FAIL: hash $H != manifest $P"; exit 3; fi; fi
strip() { awk '{ line=$0; out="";
  while (length(line)>0) {
    if (inb) { i=index(line,"-/"); if (i==0) { line="" } else { line=substr(line,i+2); inb=0 } }
    else { i=index(line,"/-"); j=index(line,"--");
      if (i>0 && (j==0 || i<j)) { out=out substr(line,1,i-1); line=substr(line,i+2); inb=1 }
      else if (j>0) { out=out substr(line,1,j-1); line="" }
      else { out=out line; line="" } } }
  print out }' "$1"; }
PAT='(^|[^A-Za-z_])(sorry|admit|axiom|native_decide|unsafe|implemented_by|extern|opaque)([^A-Za-z_]|$)'
if strip "$F" | grep -nE "$PAT"; then echo "FAIL: escape hatch present"; exit 4; fi
echo "source scan: clean"
if "$LEAN" "$F" >compile.out 2>&1; then echo "compile: exit 0, all pinned cones match"
else echo "FAIL: compile"; cat compile.out; exit 5; fi
echo "VERIFY: PASS"
