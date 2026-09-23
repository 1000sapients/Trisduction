# A Formal Proof of Riemann Hypothesis from Existence Alone, the Sign Excepted by Theorem

*The Constructed Witness, the Identity Cone over the Fixed Locus, the Grounded Counter-Model, and the Cure Theorem Proved in Lean 4 and Re-executed in Fortran*

**Mohammad F. Islam, PhD** · Independent Researcher, USA · islamm@alumni.iu.edu
23 September 2026 · Blog edition, rendered from the sealed master v1.5.0, edition v1.5.2. This edition adds no claim; the paper, its Lean file, its Fortran twin, and its audit ledger are the record.

## Abstract

Riemann's hypothesis in its original fixed-line form, Z ⊂ Fix(τ) with τ(s) = 1 − s̄, has a completed formal proof of its locus and its crossing in which the value on the roots of ξ is the one open input, supplied at a recorded row and shown to be a term of the hypothesis itself. That proof takes the presence of a supplier from outside its file, and it leaves three separations standing between the axiom under which a supplier acts, the formal ground on which the locus is fixed, and the Riemann object read as the fixed locus of its binding involution. This paper supplies the axiom. The Root Axiom, ∀x ∈ U, ΔE(x) > 0, is constructed in core Lean 4 as the only supplied witness, read along its two published formal readings, and the following are proved by the kernel and re-executed exhaustively by an independent compiled program. The fixed locus of conjugation on the integer quaternions is the scalar line, for every quaternion; the lattice stage of the prior proof, its coordinate chart and not the zero set, embeds into that carrier by an injective equivariant map φ with σφ = φτ carrying the chart's critical line onto the scalar line at every resolution; the three separations are the three legs of an identity cone over the register diagram, each leg a definitional equality, its apex unique per orientation of the generating triad; a reader who registers a bit against the record is inside the axiom's domain, never an exterior witness, and no system indexes all of its own binary properties. Two objects carry the name and are never joined: the seat of the hypothesis, RH_formal, is a kernel theorem with existence as the only posit; the value on the zeros, L(X_ξ), is one bit, and it is proved unreachable from existence: the sign is excepted by theorem. The rule "accept the Root Axiom, then the Riemann Hypothesis" has an exact strength, (RA → L(X)) ↔ L(X) in every context in which the axiom holds, and the axiom decides L on no frame, since the two-point frame carries the axiom and fails L; a grounded three-point frame does the same, so the bound is not an artifact of a seatless frame; and for every class C of frames, (∀X ∈ C, RA → L(X)) ↔ (∀X ∈ C, L(X)), so the restriction that would remove every counter-model is the hypothesis itself. One zero of ξ off the line refutes every supplied assent and touches nothing proved here. The axiom supplies the act; the act, and not the axiom, carries the sign.

## Two objects, one name

"From existence alone" has one meaning in the paper: existence is the only posit, and nothing else is assumed. It does not mean that the seat is derived from existence. The seat holds by the definition of the fixed locus and consumes no premise; the file states this as a theorem, the witness's recursion field being a constant function. Existence is consumed where it has content: at presence, at the closure of the interaction reading, and at the ledger, where every adjudication of any proposition is a deed and therefore an instance of existence and of nothing else. That last theorem is what existence contributes that no other true premise does. The value on the zeros is the one bit, and three theorems keep it open: the rule is exactly the hypothesis wherever the premise holds, as for any inhabited premise; existence holds on frames, seatless and grounded alike, where the line property fails; and for every class of frames, existence decides the value on it exactly where the value already holds on it. A restriction that removes every counter-model is the hypothesis restated.

## Three measures

Massless is not trivial and trivial is not free. The legs of the identity cone are trivial, massless, and cost nothing, and their masslessness is forced: nothing weaker than existence derives existence, so a closure between existence and its reading that carried mass would be a derivation of the root from below. The value on the zeros is massless for the same reason, since a deed authors no mathematics; it is not trivial, being one bit that no class of frames short of the hypothesis carries; and it is the one priced object, k_B T ln 2 at the act. The file carries the three measures and proves the assignments (Theorem J). Vacuity names the seat's content and misnames its mass, its price, and its place.

## Two checkers

Every theorem is checked by core Lean 4 with no library, no axiom declared by the file, and no sorry; the kernel's dependency sets are printed, 61 in all, 49 axiom-free, the rest on propext and Quot.sound through integer arithmetic. The finite content of the file is re-executed by a Fortran program that shares no code with the kernel: 130,324 checks in fourteen batteries, 0 failures, with an oracle that stops the binary on any failure. Its live row opens only on an argument the operator gives it on the command line, and it prints that it did not and cannot generate its own witness. The reader who runs it is that operator.

## Reproduce it

Lean 4.19.0, core only: `lean RH_At_The_Apex.lean`. gfortran 13.3: `gfortran -std=f2018 -O2 -Wall -Wextra RH_At_The_Apex_Twin.f90 && ./a.out && ./a.out witnessed`.

## Sources

The prior proof, doi:10.5281/zenodo.22857138. One Bit Across the Wall and the one-cut hypothesis, doi:10.5281/zenodo.22746129. The formal-alone theory, doi:10.5281/zenodo.22767103. The Riemann Hypothesis Is Exactly One Bit, doi:10.5281/zenodo.22829795. Trisduction: The Codex, doi:10.5281/zenodo.22911010.
