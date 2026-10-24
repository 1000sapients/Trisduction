#!/bin/bash
# build.sh MATHLIB_PROJECT · compile the Millennium Grand Master v1.0.0_CC, each module in its own environment.
#
# MATHLIB_PROJECT is any Lake project pinned to Lean 4.19.0 and Mathlib v4.19.0 with its .olean files built
# (lake exe cache get). Every module of src/Millennium is compiled in import order with `lean -R src -o build/...`
# inside `lake env`, the build directory first on LEAN_PATH, so each original keeps exactly the cones it pinned;
# then the root. A drifted cone fails its #guard_msgs and the build. The RH master prints its own 259 unpinned
# axiom reports, as published; every other module, the root included, must print nothing.
# Afterwards: python3 certify.py src originals cert   (the eighteen provenance certificates and the census)
set -u
HERE=$(cd "$(dirname "$0")" && pwd)
ML=${1:-${MATHLIB_PROJECT:-}}
if [ -z "$ML" ] || [ ! -d "$ML" ]; then
  echo "usage: build.sh /path/to/a/Lake/project/with/Mathlib-v4.19.0"; exit 2
fi
export PATH="$HOME/.elan/bin:$PATH"
mkdir -p "$HERE/build/Millennium" "$HERE/logs"
: > "$HERE/logs/summary.txt"
fail=0
for m in TOE_Zero Triaxial_Actuation Root_Grade_Ledger FTOE_Shared PNP NS YM Hodge BSD PC GB RH \
         NSBind BSDBind PCBind GBBind Hunt ROOT; do
  s=$(date +%s)
  if [ "$m" = ROOT ]; then
    src="$HERE/src/Millennium_Grand_Master_v1_0_0_CC.lean"; out="$HERE/build/Millennium_Grand_Master_v1_0_0_CC.olean"
  else
    src="$HERE/src/Millennium/$m.lean"; out="$HERE/build/Millennium/$m.olean"
  fi
  (cd "$ML" && lake env bash -c "LEAN_PATH=$HERE/build:\$LEAN_PATH lean -R $HERE/src -o $out $src") \
    > "$HERE/logs/$m.log" 2>&1
  e=$?
  n=$(wc -l < "$HERE/logs/$m.log"); er=$(grep -c ': error' "$HERE/logs/$m.log"); w=$(grep -c ': warning' "$HERE/logs/$m.log")
  echo "$m exit=$e $(( $(date +%s) - s ))s lines=$n errors=$er warnings=$w" | tee -a "$HERE/logs/summary.txt"
  if [ "$e" != 0 ] || [ "$er" != 0 ] || [ "$w" != 0 ]; then fail=1; fi
  if [ "$m" != RH ] && [ "$n" != 0 ]; then fail=1; fi
done
if [ "$fail" = 0 ]; then echo "BUILD PASS: every module exit 0, no error, no warning, every module silent but RH"
else echo "BUILD FAIL: see logs/"; exit 1; fi
