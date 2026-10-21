#!/bin/bash
# Trisduction scribe toolchain, installed into the Claude cloud environment's root:
#   Lean 4.19.0 (elan), Mathlib v4.19.0 pinned at c44e0c8e with prebuilt .olean files, gfortran (GCC 13).
#
# WHERE IT GOES. claude.ai/code -> environment selector under the message box -> settings icon on the
# environment -> "Setup script" field. Paste this whole file. The script runs as root before Claude starts.
# When it finishes inside about five minutes the platform snapshots the filesystem, and every later
# session in that environment starts with the toolchain already on disk; the snapshot is rebuilt on its
# own about every seven days or when this script changes.
#
# NETWORK. Mathlib's prebuilt files come from lakecache.blob.core.windows.net (fallback
# mathlib4.lean-cache.cloud), which the default "Trusted" level does not include. In the same dialog set
# Network access to Custom, tick "Also include default list", and add both hosts. Without them the
# script still installs Lean, gfortran and the Mathlib sources, and says so in /root/toolchain/STATUS.
#
# USE, in any session:  lean --version  ·  gfortran --version  ·  lean-mathlib File.lean
#                       bash /root/toolchain/check.sh   (prints and tests everything)
#
# The script always exits 0, so a failed download can never stop a session from starting.

set -u
export HOME="${HOME:-/root}"
TC="${TC_ROOT:-/root/toolchain}"           # TC_ROOT and TC_TEST exist only to rehearse the script safely
SYS=1; [ "${TC_TEST:-0}" = 1 ] && SYS=0
LEAN_TC="leanprover/lean4:v4.19.0"
BUDGET=280                                  # seconds; the snapshot needs the whole script under ~300
T0=$(date +%s)
mkdir -p "$TC/lean" "$TC/logs"
el(){ echo $(( $(date +%s) - T0 )); }
log(){ echo "[toolchain $(el)s] $*" | tee -a "$TC/logs/setup.log"; }
log "start"

export GIT_TERMINAL_PROMPT=0

# 1 · gfortran, and zstd for the Lean archive, in the background (Ubuntu archive: default allowlist)
( export DEBIAN_FRONTEND=noninteractive
  { command -v gfortran && command -v zstd; } >/dev/null 2>&1 || { apt-get update -qq && apt-get install -y -qq gfortran zstd; }
) > "$TC/logs/apt.log" 2>&1 &
APT_PID=$!

# 2 · elan, and the Lean 4.19.0 release archive straight from GitHub. elan's own download host is not
#     on the default allowlist, so the archive is fetched from the GitHub release and unpacked where elan
#     keeps installed toolchains; elan then treats it as installed.
LEAN_DIR="$HOME/.elan/toolchains/leanprover--lean4---v4.19.0"
LEAN_URL="https://github.com/leanprover/lean4/releases/download/v4.19.0/lean-4.19.0-linux.tar.zst"
if [ ! -x "$LEAN_DIR/bin/lean" ]; then
  curl -sSfL --retry 3 "$LEAN_URL" -o "$TC/logs/lean.tar.zst" > "$TC/logs/lean_dl.log" 2>&1 &
  DL_PID=$!
else
  DL_PID=""
fi
if [ ! -x "$HOME/.elan/bin/elan" ]; then
  curl -sSfL --retry 3 https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -o "$TC/logs/elan-init.sh" \
    && bash "$TC/logs/elan-init.sh" -y --default-toolchain none --no-modify-path >> "$TC/logs/elan.log" 2>&1
fi
export PATH="$HOME/.elan/bin:$PATH"

# 3 · the pinned Mathlib project at $TC/lean
cd "$TC/lean" || exit 0
echo "$LEAN_TC" > lean-toolchain
cat > lakefile.toml <<'EOF'
name = "trisduction-toolchain"
version = "1.0.0"
defaultTargets = ["Toolchain"]

[leanOptions]
pp.unicode.fun = true
autoImplicit = false

[[require]]
name = "mathlib"
scope = "leanprover-community"
rev = "v4.19.0"

[[lean_lib]]
name = "Toolchain"
EOF
echo '-- Root of the toolchain project; scribe files compile against it with `lean-mathlib File.lean`.' > Toolchain.lean
cat > lake-manifest.json <<'EOF'
{"version": "1.3.0",
 "packagesDir": ".lake/packages",
 "packages":
 [{"url": "https://github.com/leanprover-community/mathlib4", "type": "git", "subDir": null,
   "scope": "leanprover-community", "rev": "c44e0c8ee63ca166450922a373c7409c5d26b00b", "name": "mathlib",
   "manifestFile": "lake-manifest.json", "inputRev": "v4.19.0", "inherited": false, "configFile": "lakefile.lean"},
  {"url": "https://github.com/leanprover-community/plausible", "type": "git", "subDir": null,
   "scope": "leanprover-community", "rev": "77e08eddc486491d7b9e470926b3dbe50319451a", "name": "plausible",
   "manifestFile": "lake-manifest.json", "inputRev": "main", "inherited": true, "configFile": "lakefile.toml"},
  {"url": "https://github.com/leanprover-community/LeanSearchClient", "type": "git", "subDir": null,
   "scope": "leanprover-community", "rev": "25078369972d295301f5a1e53c3e5850cf6d9d4c", "name": "LeanSearchClient",
   "manifestFile": "lake-manifest.json", "inputRev": "main", "inherited": true, "configFile": "lakefile.toml"},
  {"url": "https://github.com/leanprover-community/import-graph", "type": "git", "subDir": null,
   "scope": "leanprover-community", "rev": "e6a9f0f5ee3ccf7443a0070f92b62f8db12ae82b", "name": "importGraph",
   "manifestFile": "lake-manifest.json", "inputRev": "main", "inherited": true, "configFile": "lakefile.toml"},
  {"url": "https://github.com/leanprover-community/ProofWidgets4", "type": "git", "subDir": null,
   "scope": "leanprover-community", "rev": "c4919189477c3221e6a204008998b0d724f49904", "name": "proofwidgets",
   "manifestFile": "lake-manifest.json", "inputRev": "v0.0.57", "inherited": true, "configFile": "lakefile.lean"},
  {"url": "https://github.com/leanprover-community/aesop", "type": "git", "subDir": null,
   "scope": "leanprover-community", "rev": "5d50b08dedd7d69b3d9b3176e0d58a23af228884", "name": "aesop",
   "manifestFile": "lake-manifest.json", "inputRev": "master", "inherited": true, "configFile": "lakefile.toml"},
  {"url": "https://github.com/leanprover-community/Qq", "type": "git", "subDir": null,
   "scope": "leanprover-community", "rev": "fa4f7f15d97591a9cf3aa7724ba371c7fc6dda02", "name": "Qq",
   "manifestFile": "lake-manifest.json", "inputRev": "master", "inherited": true, "configFile": "lakefile.toml"},
  {"url": "https://github.com/leanprover-community/batteries", "type": "git", "subDir": null,
   "scope": "leanprover-community", "rev": "f5d04a9c4973d401c8c92500711518f7c656f034", "name": "batteries",
   "manifestFile": "lake-manifest.json", "inputRev": "main", "inherited": true, "configFile": "lakefile.toml"},
  {"url": "https://github.com/leanprover/lean4-cli", "type": "git", "subDir": null,
   "scope": "leanprover", "rev": "02dbd02bc00ec4916e99b04b2245b30200e200d0", "name": "Cli",
   "manifestFile": "lake-manifest.json", "inputRev": "main", "inherited": true, "configFile": "lakefile.toml"}]}
EOF

# shallow clones at the exact pinned commits, all nine in parallel. A repository renamed upstream
# (Qq is now quote4) is fetched from its new name and its origin reset to the manifest URL, so Lake
# sees exactly the URL and commit it pinned and never refetches.
renamed(){ case "$1" in https://github.com/leanprover-community/Qq) echo https://github.com/leanprover-community/quote4;; esac; }
fetch_pkg(){ # name url rev inputRev
  local d=".lake/packages/$1" u
  [ "$(git -C "$d" rev-parse HEAD 2>/dev/null)" = "$3" ] && return 0
  for u in "$2" $(renamed "$2"); do
    rm -rf "$d" && mkdir -p "$d" && git -C "$d" init -q && git -C "$d" remote add origin "$u" || return 1
    if git -C "$d" fetch -q --depth 1 origin "$3" && git -C "$d" checkout -q FETCH_HEAD; then
      # a pinned release tag (v4.19.0, v0.0.57) is fetched too: Lake finds prebuilt releases by tag
      case "$4" in v[0-9]*) git -C "$d" fetch -q --depth 1 origin "refs/tags/$4:refs/tags/$4" \
                              || git -C "$d" tag "$4" "$3";; esac
      git -C "$d" remote set-url origin "$2"
      [ "$(git -C "$d" rev-parse HEAD)" = "$3" ] && return 0
    fi
  done
  return 1
}
python3 -c '
import json
for p in json.load(open("lake-manifest.json"))["packages"]:
    print(p["name"], p["url"], p["rev"], p.get("inputRev") or "-")' > "$TC/logs/packages.txt"
FETCH_PIDS=()
while read -r n u r i; do fetch_pkg "$n" "$u" "$r" "$i" > "$TC/logs/git_$n.log" 2>&1 & FETCH_PIDS+=($!); done < "$TC/logs/packages.txt"

# Lean: unpack once the archive and zstd are both in, then make 4.19.0 the default toolchain
[ -n "$DL_PID" ] && wait "$DL_PID"
wait "$APT_PID" 2>/dev/null
if [ ! -x "$LEAN_DIR/bin/lean" ] && [ -s "$TC/logs/lean.tar.zst" ]; then
  mkdir -p "$LEAN_DIR" && tar --zstd -xf "$TC/logs/lean.tar.zst" -C "$LEAN_DIR" --strip-components=1
  rm -f "$TC/logs/lean.tar.zst"
fi
elan default "$LEAN_TC" >> "$TC/logs/elan.log" 2>&1
log "lean: $(lean --version 2>/dev/null | head -1)"
log "gfortran: $(gfortran --version 2>/dev/null | head -1)"

wait "${FETCH_PIDS[@]}" 2>/dev/null
PKG_OK=0; PKG_N=0
while read -r n u r i; do PKG_N=$((PKG_N+1)); [ "$(git -C ".lake/packages/$n" rev-parse HEAD 2>/dev/null)" = "$r" ] && PKG_OK=$((PKG_OK+1)); done < "$TC/logs/packages.txt"
log "packages at pinned commits: $PKG_OK/$PKG_N"

# 4 · prebuilt Mathlib .olean files. One file of this exact build is probed on both cache hosts, so a
#     blocked or retired host costs seconds, not the budget. The corpus's import closure (RiemannZeta,
#     Dirichlet, Nonvanishing, NormedSpace.Connected: 2,812 files) comes first, the rest of Mathlib
#     (6,641 in all) after it while time remains; an unfinished download resumes with `lake exe cache get`.
left(){ echo $(( BUDGET - $(el) )); }
probe(){ local c e; c=$(curl -s -o /dev/null --max-time 20 -w '%{http_code}' "$1"); e=$?
         case "$e" in 0) echo "$c";; 56|7|28|35) echo "blocked";; *) echo "curl$e";; esac; }
PROBE=f/c822a300ceffbdae.ltar
AZ=$(probe "https://lakecache.blob.core.windows.net/mathlib4/$PROBE")
FRO=$(probe "https://mathlib4.lean-cache.cloud/$PROBE")
log "cache hosts: lakecache.blob.core.windows.net $AZ, mathlib4.lean-cache.cloud $FRO"
SRC=none; if [ "$AZ" = 200 ]; then SRC=azure; elif [ "$FRO" = 200 ]; then SRC=fro; fi
if [ "$SRC" = fro ]; then   # this Mathlib's cache tool reads the second host only behind a flag
  sed -i 's/^def useFROCache : Bool := false/def useFROCache : Bool := true/' .lake/packages/mathlib/Cache/Requests.lean
fi
CACHE=not-fetched
if [ "$SRC" != none ] && [ "$PKG_OK" = "$PKG_N" ]; then
  core=(); for m in NumberTheory/LSeries/RiemannZeta NumberTheory/LSeries/Dirichlet \
                    NumberTheory/LSeries/Nonvanishing Analysis/NormedSpace/Connected; do
    core+=(".lake/packages/mathlib/Mathlib/$m.lean"); done
  CACHE=partial
  [ "$(left)" -gt 20 ] && timeout "$(left)" lake exe cache get "${core[@]}" > "$TC/logs/cache_corpus.log" 2>&1 \
    && CACHE=corpus-closure
  [ "$CACHE" = corpus-closure ] && [ "$(left)" -gt 20 ] && timeout "$(left)" lake exe cache get > "$TC/logs/cache_full.log" 2>&1 \
    && CACHE=all-of-mathlib
fi
NOLEAN=$(find .lake/packages/mathlib/.lake/build/lib -name '*.olean' 2>/dev/null | wc -l)
[ "$CACHE" = partial ] && [ "$NOLEAN" -lt 100 ] && CACHE=failed
log "mathlib prebuilt: $CACHE from $SRC ($NOLEAN .olean files)"

# 5 · commands on every PATH, and a wrapper that compiles any file against the pinned Mathlib
BIN=/usr/local/bin; [ "$SYS" = 1 ] || { BIN="$TC/bin"; mkdir -p "$BIN"; }
for b in elan lean lake leanc leanmake; do [ -e "$HOME/.elan/bin/$b" ] && ln -sf "$HOME/.elan/bin/$b" "$BIN/$b"; done
cat > "$BIN/lean-mathlib" <<EOF
#!/bin/bash
# lean-mathlib FILE.lean [lean args]: compile against Mathlib v4.19.0 in $TC/lean
a=(); for x in "\$@"; do if [ -e "\$x" ]; then a+=("\$(realpath "\$x")"); else a+=("\$x"); fi; done
cd "$TC/lean" && exec lake env lean "\${a[@]}"
EOF
chmod +x "$BIN/lean-mathlib"
[ "$SYS" = 1 ] && printf 'export PATH="$HOME/.elan/bin:$PATH"\nexport TRISDUCTION_TOOLCHAIN=%s\n' "$TC" > /etc/profile.d/trisduction-toolchain.sh

# 6 · check script for scribes, and the STATUS file
cat > "$TC/check.sh" <<EOF
#!/bin/bash
# Prints and tests the scribe toolchain. Safe to run any time.
export PATH="\$HOME/.elan/bin:\$PATH"
echo "lean      : \$(lean --version 2>/dev/null | head -1)"
echo "lake      : \$(lake --version 2>/dev/null | head -1)"
echo "gfortran  : \$(gfortran --version 2>&1 | head -1)"
echo "mathlib   : \$(git -C $TC/lean/.lake/packages/mathlib rev-parse HEAD 2>/dev/null) (pinned c44e0c8ee63ca166450922a373c7409c5d26b00b)"
echo "oleans    : \$(find $TC/lean/.lake/packages/mathlib/.lake/build/lib -name '*.olean' 2>/dev/null | wc -l)"
t=\$(mktemp -d); cd "\$t"
printf 'theorem t : 2 + 2 = 4 := rfl\n' > Core.lean
lean Core.lean >/dev/null 2>&1 && echo "lean core : ok" || echo "lean core : FAILED"
printf 'import Mathlib.NumberTheory.LSeries.RiemannZeta\n#check riemannZeta\n' > M.lean
(cd $TC/lean && timeout 300 lake env lean "\$t/M.lean") >/dev/null 2>&1 && echo "mathlib   : ok (RiemannZeta imports)" || echo "mathlib   : not ready (run: cd $TC/lean && lake exe cache get)"
printf 'program p\n  implicit none\n  print "(a)", "fortran ok"\nend program p\n' > p.f90
gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off p.f90 -o p >/dev/null 2>&1 && ./p | sed 's/^/fortran   : /' || echo "fortran   : FAILED"
rm -rf "\$t"
EOF
chmod +x "$TC/check.sh"

cat > "$TC/STATUS" <<EOF
built      $(date -u +%Y-%m-%dT%H:%M:%SZ) in $(el)s
lean       $(lean --version 2>/dev/null | head -1)
gfortran   $(gfortran --version 2>/dev/null | head -1)
mathlib    v4.19.0 c44e0c8ee63ca166450922a373c7409c5d26b00b, packages $PKG_OK/$PKG_N, prebuilt $CACHE from $SRC ($NOLEAN .olean files; cache hosts: azure $AZ, fro $FRO)
project    $TC/lean      compile: lean-mathlib File.lean      test: bash $TC/check.sh
EOF
log "done"
exit 0
