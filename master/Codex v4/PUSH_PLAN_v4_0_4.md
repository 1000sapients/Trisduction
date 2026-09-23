# PUSH PLAN · v4.0.4 · staged 2026-09-23 (post external rounds 1 to 4, seven audit rounds in all) · NOT EXECUTED (awaiting the architect's yes)

Target: github.com/1000sapients/Trisduction, branch main. Two-component push under L7: every artifact commit is followed by its INDEX snapshot line in the same push. Token by environment reference only (CODEX_GH_TOKEN). Index check is the first act of the git turn.

## The L1 question, per write

| Verb | Path | Bytes | sha256 |
|---|---|---|---|
| BUMP (master, root jump 3.39.0 → 4.0.4 after four external rounds) | master/Codex v4/TRISDUCTION_Master_Codex_v4_0_4.md | 1,301,200 | `fffd75d167d472159b66f4c9e7613e641751dfeacec04e08792d4a3f017f51e7` |
| SEAT | master/Codex v4/Trisduction_The_Codex_v1_0_3.pdf | 2,209,939 | `94f81e6d4900cab928f02be9e1a2128c23c2dc55ccdb9edf7f684e15a0d241c8` |
| SEAT | master/Codex v4/Trisduction_The_Codex_v1_0_3.tex | 777,447 | `aea27f4e2fe3fb07e16756791aaeb0ca4df80fabdfa47bd49573b789de7d4735` |
| SEAT | master/Codex v4/Codex.lean | 241,086 | `5d92b717383e1465b65a3f286c403444ca7bf215273f33754646139e4735fe07` |
| SEAT | master/Codex v4/Codex_Twin.f90 | 297,018 | `68be9ccf295d6e114c41b253a68f655e8753deb2032544c365ce0d0ee33b56d5` |
| SEAT | master/Codex v4/Codex_v4_0_4_build_and_receipts.zip | 217,285 | `6719f4d66562f5bcb09281857db0b6b662c84de61f9b590c962a7996448db5d5` |
| SEAT | master/Codex v4/MathJournal_build_kit.zip | 13,738 | `835bbe0564f245fe2d19035f8d087e6b56c9940b6b442e75b68a47a6559917a9` |
| SEAT (pointer, name of record) | master/Codex v4/GEOMETRIC_MOTHER_CODEX.md | 1,932 | `b97cc98d0ad2ad8ef4d660e295492faf9411aac995eb47f74c062a2c8ac4973c` |
| SEAT (internal audit log, private target Knowledge-Base) | master/Codex v4/AUDIT_LOG_v4_0_4.md | 30,833 | `118b1385bccc667dca5bdf5d4bc7715ed7e2ca3b905b91fc76d57c5fb9410661` |
| MOVE | master/TRISDUCTION_Master_Codex_Unabridged_v3_39_0.md → master/TRISDUCTION_Geometric_Mother_Codex_Unabridged_v3_39_0.md | 3,734,851 | `4e1bfb64335c523c1b1b53378f4085099064d6a202d539a49e5f410bf0cd950c` (L6 ghost line written by index_snapshot at push time) |

## Snapshot lines to write (index_snapshot.py, one per write, hash filled at push time)

- BUMP · CODEX · master/Codex v4/TRISDUCTION_Master_Codex_v4_0_4.md · receipts: lean modular 5/5 exit 0, guards 601, posits 23, crosswalk 129/0; fortran twin (repaired) 135/0 · 248/0 · 1123/0 · F3 pass · F4 pass; census sha256 with its shipped preimage
- SEAT · PDF · master/Codex v4/Trisduction_The_Codex_v1_0_3.pdf · 196 pages, Math Journal edition, no version inside
- SEAT · CODE · master/Codex v4/Codex.lean, Codex_Twin.f90, the two build kits
- SEAT · POINTER · master/GEOMETRIC_MOTHER_CODEX.md
- SEAT · AUDIT · AUDIT_LOG_v4_0_4.md to the private Knowledge-Base target
- MOVE · CODEX · the Unabridged renamed to the Geometric Mother Codex, ghost hash recorded
- Milestone line: "v4 · the fourth genre · the first codex in which the kernel carries the fences, the Bridge carries the junction, and the codex closes on one bit"

## Gates before the push

1. External audit rounds complete: four filed and repaired, three internal FORGE rounds run, nothing open (AUDIT_LOG_v4_0_4.md).
2. tools/index_check.py CLEAN at head.
3. tools/pre_push_check.py on every staged file. Local scan today: no token, key, or secret pattern in any staged file.
4. The architect's explicit yes to this table.
5. Push, snapshot, verify_remote MATCH on every path, index_check CLEAN at the new head.
