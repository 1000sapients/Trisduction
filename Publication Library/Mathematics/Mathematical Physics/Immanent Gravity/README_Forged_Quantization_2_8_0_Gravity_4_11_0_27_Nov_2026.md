# Forge set, 27 November 2026

Papers (md and Journal pdf, 56 pages each):
- `Generalized_Quantization_as_a_New_Mathematical_Theorem_v2_8_0_CC`
- `Immanent_Gravity_as_a_Machine_Checked_Mathematical_Theorem_v4_11_0_CC`

`Audit_Log_Quantization_2_8_0_Gravity_4_11_0_CC.md`: the audit cycle on the two papers. Seven rounds, twenty-three corrections, verdict SEALED-ROUND at round 7, SELF grade, with a HALT-STALE at round 5 on the record. It is not part of either paper.

`quantization_lean/`: the four kernels of the Quantization paper with their kernel lines, and the numerical twin.
- `SPHYS_Field_Quantization_CC.lean`: 110 theorems, Parts I to XXI (no Part XVIII). Changed by the audit: two theorems of Part XV renamed (`the_labels_of_a_full_turn_are_the_integers`, `a_symmetry_with_a_full_turn_gives_its_states_integers`) and three comments corrected. No statement changed.
- `SPHYS_Quantization_II_CC.lean`, `SPHYS_Quantization_Forced_CC.lean`, `SPHYS_Quantization_Star_CC.lean`, `Quantization_Forced_Twin_CC.f90`: as in the last set.

`gravity_lean/`: the eight kernels of the Gravity paper, the twin, the certificate generator and the kernel lines.
- `SPHYS_Curvature_CC.lean`: new, Appendix L. 37 theorems: the whole curvature of the static spherical form, 256 components, and its invariant.
- `SPHYS_Horizon_CC.lean`: Appendix K, now 18 theorems. Part IV, what an outside clock registers, was added by the audit.
- The six earlier kernels are unchanged since edition 4.2.0.

Each Lean file is the text printed in the matching appendix, byte for byte. All twelve were recompiled at the end of the cycle: exit 0, output only kernel lines.

`gravity_companion_not_cited/`: `SPHYS_Gravity_Atoms_CC.lean`, unchanged. No line of edition 4.11.0 cites it.

Lean 4.19.0 with Mathlib 4.19.0. Not deposited. Nothing was pushed.
