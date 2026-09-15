# Prosecution · cycle twin1 · round 1 · registers: kinematic, definitional
Artifact: twin_r1_seeded.f90 (the twin, read alone).

P-1 [kinematic] The spine routine prints per-theorem "instances", and for T3, T6a, T6b and T13 the count is taken inside the loop over the reading f although none of those statements mentions f. Each genuine instance (tau, d, x) is therefore counted 2^n times, once per irrelevant f; T13 prints 7984 where the distinct instances number a sixteenth of that at n = 4. The checks themselves are sound, since a repeated check is still a check; the printed count is a receipt for instances that are repetitions. Falsifier: move the count outside the f loop and compare.

P-2 [definitional] The spine section header says every theorem runs on |X| = 1..4, and the banner says the same, while T2 and T14 are guarded to n <= 3 inside the routine. Two theorems have a ceiling the header does not print. Falsifier: read the two guards.

P-3 [definitional] The Omega section's label says "four deeds counted" for the AEGIS guard, and no counter exists: the guard is a pure function that returns a constant, the loop calls it four times, and nothing counts. The label describes the Lean's deed counter, not the twin's. Falsifier: search the guard for a counter.

P-4 [kinematic] The super-halt "first failure terminal" check decodes the first false bit of each pattern and then re-checks its own decoding; the check is consistent with itself and with nothing else. It is recorded here as weak, not false: no artifact claim rests on it beyond the forced counts, which are read from computed state.
