# The Pre-Installed Toolchain

Binding on every scribe who compiles Lean or Fortran. Recorded 2026-10-21.

Lean 4.19.0, Mathlib v4.19.0 and gfortran 13 live at `/root/toolchain` in the cloud environment. The environment's setup script installs them once, and the platform's filesystem snapshot carries them into every new session. Use them in place and never reinstall: a reinstall spends the account holder's tokens on work already done and can pull a different Mathlib.

| Step | Command |
|---|---|
| Check, first | `cat /root/toolchain/STATUS` |
| Test all three | `bash /root/toolchain/check.sh` |
| Lean against Mathlib: MathOS, the RH master | `lean-mathlib File.lean` |
| Lean core: PhysOS kernels | `lean File.lean` |
| Fortran twins | `gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off file.f90 -o file` |

**Pins.** Lean 4.19.0, commit 6caaee842e94, with Lake 5.0.0. Mathlib v4.19.0 at c44e0c8ee63ca166450922a373c7409c5d26b00b. GCC 13.3. The RH master v3.0.34_CC compiles through `lean-mathlib` at exit 0 in about six minutes.

**Prebuilt Mathlib missing.** If STATUS says so, run `cd /root/toolchain/lean && lake exe cache get`. It needs `lakecache.blob.core.windows.net` or `mathlib4.lean-cache.cloud` allowed in the environment's network access. Never start a from-source Mathlib build without telling the account holder: the corpus's import closure alone is 2,812 files and takes hours.

**No `/root/toolchain` at all.** The session's environment has no setup script. Run the script once, as root, and tell the account holder, who installs it for good by pasting it into claude.ai/code, environment settings, Setup script.

Setup script: [Skills/trisduction-toolchain/tools/trisduction_toolchain_setup.sh](../../Skills/trisduction-toolchain/tools/trisduction_toolchain_setup.sh). Skill, carrying the same script: [Skills/trisduction-toolchain/SKILL.md](../../Skills/trisduction-toolchain/SKILL.md).
