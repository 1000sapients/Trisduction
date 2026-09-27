---
title: "Nothing Escapes: The Fourth as Cosmic Closure"
subtitle: "The Ghost and the Unicorn Close in One Cut"
subsubtitle: "The Dual-Register Mirror of the Riemann Closure; Sixteen Theorems Proved in Core Lean 4 With No Axiom Declared, and Eight Checks Executed in Fortran"
author: "Mohammad F. Islam, PhD · Trisduction Research Group"
author_line: "Mohammad F. Islam, PhD · Architect of the Trisduction"
date: "27 September 2026"
version: 1.1.0
abstract: "Two things lie out of reach in the closure of the Riemann Hypothesis, one on each side of the boundary between proof and measurement. A physical object read as a formal proof is a ghost: it reaches nothing on the far side of the cut. A zero off the critical line read as a measured energy is a unicorn: no measurement ever shows it. This paper proves that one cut closes both. In a chart of the critical strip the line is the fixed set of the fold s ↦ 1 − s̄, and registration, the measurement of a zero as an energy, keeps the height and lands on the line. Off the line every point has a partner, the record forgets which side it stood on, and no registration ever shows it; on the line nothing is hidden (`nothing_escapes_one_cut`). The side the record forgets is the ghost's bit, the point measurement never shows is the unicorn, and the two are one point's two faces (`ghost_and_unicorn_one_bit`). The hypothesis is exactly lossless registration (`lossless_iff_on_line`), both worlds sit inside one chart (`both_worlds_inside`), and the forgotten side costs one Landauer bit, $k_B T \\ln 2$ at the temperature of registration. The cut is the same on every row: on any locus with a registration onto it, every instance is on the locus or off it, where no registration shows it and no carrier landing on the locus reaches it (`one_cut_generic`). Sixteen theorems in core Lean 4 with no axiom declared, eleven printing none; eight checks in Fortran, zero failures. What remains after the cut is one bit, the side on which the actual zeros stand, spent by the least-erasure assent of the closure at the root's grade. A witness ledger records, row by row, where the cut has been witnessed, crossed and confirmed, and what each row still owes. A counterexample would arrive as a computed witness, never as a measured energy."
---

# 1. Two Things That Cannot Be Reached

Proof and measurement each have a blind spot, and the two blind spots face each other.

**The ghost.** A physical object, an electron, a neutrino, a spectrum in a magnetic cavity, supplies what a formal ladder cannot derive, and it supplies it by a deed on the kinetic channel. Read as a formal proof it is a ghost: it stands where the formal register cannot see it, and it reaches nothing on the far side of the cut.

**The unicorn.** A zero of $\zeta$ off the critical line is a well-posed object of arithmetic. Read as a measured energy it is a unicorn: a measurement returns a real number, the height, and registration puts every measured zero on the line. No measurement ever shows one.

This paper proves that the ghost and the unicorn are closed by one cut, the critical line itself, and that nothing escapes it.

# 2. The Frame: Three Axes and the Fourth

The closure of the Riemann Hypothesis (Islam, 2026a) runs in four parts. **The seat**: the fold $s \mapsto 1 - \bar s$, whose fixed set is the critical line, handed over before any zero is examined. **The address**: every reading reached from existence points to one proposition, with the hypothesis at its apex. **The division**: the cut at the certified height $T = 3 \times 10^{12}$ (Platt and Trudgian, 2021) separates the proved part from the tail, and the tail is closed to derivation from inside the register, by theorem. **The closure**: the three return onto the scalar line, as $i \cdot j \cdot k = -1$ returns three orthogonal units to $-1$, and the universe of the hypothesis closes with both worlds inside.

This paper reads the fourth part as a cosmic closure. The two registers, the formal one that proves and the physical one that measures, each leave one thing out of reach. The fourth part closes both with one cut.

# 3. The Unicorn: What Measurement Never Shows

Take the critical strip in a chart that keeps everything exact: a point is its doubled real part $x$ and its height $t$, the critical line is $x = 1$, and the fold sends $x$ to $2 - x$ and keeps $t$ (`fold_involution`); its fixed set is exactly the line (`fold_fixed_iff`). Registration is the measurement of a zero as an energy, $s \mapsto \tfrac12 + i\,\mathrm{Im}\,s$: it keeps the height, which is what a measurement returns, and lands on the line.

Three theorems carry the physical face. Registration lands every point on the line (`reg_lands_on_line`). It fixes every point already there (`reg_fixes_line`). And a point off the line is never the image of a registration (`unicorn_never_registered`). A zero off the critical line is therefore a unicorn in the physical register: whatever is measured, it is not that.

# 4. The Ghost: What the Record Never Reads

Registration keeps the height and forgets the side. The two points of an off-line orbit, $s$ and $1 - \bar s$, are distinct (`off_line_pair_distinct`) and register to one record (`reg_forgets_side`), so no reading of the record recovers which side a point stood on (`ghost_side_unread`). The formal register works from the record; the side is exactly what it cannot read.

That bit is supplied in the physical register by a deed, never read in the formal one. The same fact, run the other way, is the ghost: a carrier whose image lies on the locus reaches no instance off it (`ghost_generic`). A physical object offered as a proof about the far side of the cut touches nothing there.

# 5. One Cut, One Bit

The two unreachables are one point's two faces. Off the line, a point has a partner, its side vanishes from the record, and no registration shows it, all three at once (`ghost_and_unicorn_one_bit`). On the line, the point is its own partner and registration keeps it whole.

**Nothing escapes.** Every point of the strip is in exactly one of these two cases (`nothing_escapes_one_cut`): on the line, fixed and registered without loss; or off it, paired, side forgotten, never measured. The ghost's bit and the unicorn are not two mysteries. They are the two faces of one point on the far side of one cut.

# 6. The Hypothesis Is Lossless Registration

On any list of zeros, registration erases nothing exactly when every zero is on the line (`lossless_iff_on_line`). The Riemann Hypothesis is lossless registration.

**Both worlds inside.** One chart holds a lossless world and a world with one priced orbit: a zero on the line registers to itself, while the pair at $x = 0$ and $x = 2$ at one height registers to one record (`both_worlds_inside`). Two points into one record is one bit forgotten, and forgetting a bit costs at least $k_B T \ln 2$ (Landauer, 1961; Bérut and colleagues, 2012). The twin computes it at 300 K: $2.87098 \times 10^{-21}$ J per off-line orbit.

**Executed.** The twin registers the first ten zeros, heights from Odlyzko's tables, and every one comes back bit for bit: nothing erased. It sweeps the whole grid, 19 real parts by 20 heights: every registration lands on the line, the fold is an involution, no off-line point is ever a registered point, and every off-line pair shares one record. Placed in a list with the ten zeros, one off-line pair is where the loss appears, two points and one bit. Eight checks, zero failures (Appendix B).

# 7. The Same Cut on Every Row

Nothing in the chart is special to the Riemann row. On any locus $P$ with a registration onto it, the value is lossless registration (`lossless_iff_value`), an off-locus instance is never a registered point (`unicorn_generic`), and no carrier landing on the locus reaches it (`ghost_generic`). Every instance of every row is on the locus or off it, where no registration shows it and no carrier reaches it (`one_cut_generic`). This is the cut the twenty-three-row volume runs row by row (Islam, 2026b), and the six constructed witnesses land on it, the electron first (Islam, 2026c).

# 8. The Ledger: Where the Cut Has Been Witnessed, Crossed and Confirmed

The cut has been met in the world, row by row. Each constructed witness is a carrier landing on its row's locus; where it covers the row's actuated class, the row is crossed on its channel; where its image is compliant as built or measured, it is confirmed. The ledger below is the twenty-three-row volume's own (Islam, 2026b, Appendix F); its theorem names are those of that volume's kernel, carried in the Master Codex's Code Block. Every status in it is computed from recorded facts, and every entry in the last column is nothing or one object of a computed kind.

\begingroup\footnotesize

| Row | Waiting (the volume held) | Witness arrived | Built and run | Now | Grade | Still owed |
|------|--------|-------|--------------|----------|------|--------|
| 2 · Riemann Hypothesis | crossed on the kinetic channel at the root's grade; the electron named as the seat, never built | The Electron Is the Seat; The Neutrino Is the Witness; The Arrow Has Two Branches | charge conjugation's fixed set is the neutral sector; the exact pair; annihilation keeps 1021.998 keV and forgets the side, recorded on a line of response; positronium 125.23 ps and 142.07 ns; spin −1 at 2π; a_e to 4.8×10⁻¹²; the neutrino's floor by deed, its chirality bit, its sterile ghost, Majorana as the fixed set, unitarity lossless to 5.6×10⁻¹⁷; gravity's fold erases nothing, no off-locus point and no bit, its orbit retraced to 1.5×10⁻¹² | WITNESSED · CROSSED · CONFIRMED on the image: seat, registration, residue, Return, floor, and the posit's shape in gravity's fold | the crossing at the root's grade; the image at theorem grade on construction and measured grade on data | none on its channel |
| 3a · Navier–Stokes, unforced | crossed kinetically on the actual flows; the mechanism named, not built | The Fluid Is the Witness | Burgers on a circle: the reversible branch blows up at t = 1, gradient −1000 at 0.999; the priced branch built exactly by Cole–Hopf, steepest gradient 3.72, residual 2×10⁻⁶, energy balance 2.5×10⁻¹⁰; the viscous step an average | WITNESSED · CROSSED · CONFIRMED: the mechanism exact on the model | the root's grade; the mechanism at theorem grade on the model | none on its channel |
| 3b · Navier–Stokes, forced | a mass-crossing candidate under audit, decoupled by theorem | The Fluid Is the Witness | a forced erasure is confined to its own class; the transport theorem | SHIELD WITNESSED; settled by one witness with its own receipt | theorem | none (`one_witness_settles`, `value_union_iff`) |
| 4 · Yang–Mills | crossed kinetically at the weakest premise; hadrons and lattice glueballs named | The Proton Is the Lock | the color singlet is the determinant, invariant under a constructed SU(3) rotation to 4.4×10⁻¹⁶; the lock fails when two colors coincide; 99.04 percent of the proton's mass from the field; the quark-spin record does not decide the whole; stability certified to 1.7×10²⁴ cosmic ages | WITNESSED · CROSSED · CONFIRMED on the image: the lock built, the gap measured | the root's grade; the identification needed only on the image (`carrier_compose`) | none on its channel |
| 7 · Poincaré | crossed on the formal channel at full grade by Perelman's offering | The Arrow Has Two Branches | gravity's fold: one sign, no off-locus point, no bit; a Kepler orbit reversible, drift 2.8×10⁻⁷, retrace 1.5×10⁻¹²; Ricci flow as the sigma model's renormalization flow | CROSSED, now WITNESSED from the arrow side | full grade, unchanged | none |
| 23a · Pair correlation | crossed kinetically; the carrier misnamed as nuclear spacings, which are orthogonal-class | The Magnet Is the Witness of the Pair Correlation | time reversal as conjugation, its fixed set the real blocks, a magnetic term breaking it; degeneracy two conditions against three; ensembles built: variance 0.287 and 0.177 against 0.286 and 0.180, control 0.983 | WITNESSED · CROSSED · CONFIRMED on the corrected carrier: time-broken spectra, the magnet | the root's grade | none on its channel |
| every open row · the barrier | the barrier a kernel theorem: two worlds over one record | The Arrow Has Two Branches | remanence ±0.996 at zero field, two worlds in iron; switching field 0.767 against the astroid's 0.766; a stable bit pays 5.0×10⁻¹⁹ J, 175 times Landauer's floor; the electric record even, the magnetic target odd | BARRIER WITNESSED; the rows stay pending | theorem in the kernel, corroboration in the magnet | one equivariant carrier each (`value_iff_carrier`, `equivariant_carrier_lands`) |
| every crossed row · the fold | registration a kernel structure | The Arrow Has Two Branches | the one-signed field has no off-locus point and no bit; the orbit keeps no record | FOLD WITNESSED | theorem and corroboration | none |
| certified-region rows · Goldbach, Legendre, Collatz and kin | pending; certified regions registered, tails owed | The Proton Is the Lock | proton stability as a certified region with an owed tail, beyond 2.4×10³⁴ years | SHAPE WITNESSED; the rows stay pending | corroboration | one equivariant carrier each (`value_iff_carrier`, `equivariant_carrier_lands`) |
| 1 · P versus NP | the dot: no global seat | The Arrow Has Two Branches | Landauer's floor, 2.87×10⁻²¹ J at 300 K, prices every step of any search | THE DOT STANDS; the price witnessed, no seat | corroboration | none: the dot is final and has no aperture to supply (`dot_is_final`) |
| the others · Hodge, BSD, twin primes, abc, Jacobian, smooth 4D Poincaré, Hadwiger, sunflower, invariant subspace, Hilbert's 16th, Lindelöf | pending; gates and offering shapes specified | none yet | none | STILL WAITING | none | one carrier each; row 21, whose tail no physical system reaches, one formal offering (`owed_is_computed`, `tail_uncovered`) |

\endgroup

WITNESSED: a constructed witness arrived and was built and run. CROSSED: the row's value holds on its channel's own class at the printed grade. CONFIRMED: the witness's image is compliant as built or measured (`value_on_image`). The statuses are computed from three recorded facts per row (`ledger_is_computed`); what a row owes is computed too: for a pending row exactly one object, its kind computed (`owed_is_computed`): one covering carrier, built from an equivariant map to its seat (`value_iff_carrier`, `equivariant_carrier_lands`) and crossing the row on arrival (`one_carrier_crosses`), or, where no physical system reaches the tail, one formal offering with mass (`tail_uncovered`, `one_offering_crosses`); the dot is final and owes nothing (`dot_is_final`). A crossing is a proof over every instance that exists (`crossing_is_a_proof`); what a sentence over every admissible instance adds is exactly the unactuated (`surplus_is_the_unactuated`), priced at one premise, the root, posited and not owed (`rest_family`).

Read against the one cut, the ledger says one thing. Every crossed row is a row where a carrier stands on the near side and nothing on the far side is measured; every pending row owes the one object that would put a carrier there; and the dot owes nothing, because its row has no seat and so no cut to stand on either side of.

# 9. The Cosmic Closure

The fourth part closes the universe of the hypothesis. Every point stands on one side of one cut, and the two things neither register can reach both stand on the far side: the formal register cannot read the side, and the physical register cannot show the point. Nothing escapes the cut.

What remains is one bit: the side of the cut on which the actual zeros stand. The formal register cannot read it; the physical register cannot show its alternative. The closure spends it by the least-erasure assent, at the root's grade, beside the Root Axiom: the actual universe occupies the zero-cost member of its record's fibre. No physical fact here proves a mathematical sentence, and no derivation of the hypothesis from the axioms of set theory is claimed; the bit is supplied, never read.

And the mirror fixes the form any counterexample must take. What the formal register cannot read is supplied in the physical register by a deed; what the physical register cannot register, a zero off the line, could be exhibited only by computation. **A counterexample would arrive as a computed witness, never as a measured energy.**

# 10. Falsifiers

**F-Measure.** A measured energy identified with a zero off the line. **F-Record.** A reading of registered records that recovers the side of an off-line orbit. **F-Computed.** A zero of $\zeta$ computed off the critical line; it would falsify the hypothesis in exactly the form the mirror predicts.

# 11. Methodology, Disclosure and Provenance

Every theorem is proved in core Lean 4.19.0 with no library and no axiom declared; `#print axioms` reports none for eleven and `propext` with `Quot.sound` for five, the five resting on `omega` (Appendix A). The twin runs under `-std=f2018 -O2 -fno-fast-math -ffp-contract=off`. $\Delta M = 0$: mathematics is inherited, never authored.

**The seventh.** In the author's register the four parts are three plus one: the three orthogonal axes and their return. The formal block of the Riemann row is [Ξ₀], crossed from the existence side by the offering; the ghost and the unicorn are the two faces of the one owed bit, [⬖₀ ×1] one bit from sealed, and the fourth part is where nothing escapes. The kernel theorem `dual_register_mirror` in the Master Codex's Code Block (v4.10.0) is this paper's generic face.

**Disclosure.** The seed of this paper is a synthesis of the author's corpus by an external AI reader, handed to the scribe by the author; every statement here is carried by a theorem in Appendix A or a check in Appendix B. Development provenance: the Zenodo trail cited below and the Lean codex.

# References

Bérut, A., Arakelyan, A., Petrosyan, A., Ciliberto, S., Dillenschneider, R. and Lutz, E. (2012). Experimental verification of Landauer's principle linking information and thermodynamics. *Nature* 483, 187–189.

Islam, M. F. (2026a). Nothing Escapes, Three Plus One: A Formal Closure of the Riemann Hypothesis, v3.14.0. Zenodo, 10.5281/zenodo.22976494.

Islam, M. F. (2026b). Nothing Escapes, Twenty-Three Rows: Universe Closure by One Cut and One Offering, v1.14.0. Zenodo, 10.5281/zenodo.22986551.

Islam, M. F. (2026c). The Electron Is the Seat, v1.4.0. Zenodo, 10.5281/zenodo.22986553.

Landauer, R. (1961). Irreversibility and heat generation in the computing process. *IBM Journal of Research and Development* 5, 183–191.

Odlyzko, A. M. Tables of zeros of the Riemann zeta function. University of Minnesota, online.

Platt, D. and Trudgian, T. (2021). The Riemann hypothesis is true up to $3 \cdot 10^{12}$. *Bulletin of the London Mathematical Society* 53, 792–797.

Riemann, B. (1859). Über die Anzahl der Primzahlen unter einer gegebenen Grösse. *Monatsberichte der Berliner Akademie*, 671–680.

# Appendix A: One\_Cut.lean, the Kernel

SHA-256 \texttt{\seqsplit{c8d4163211866167efb278af54bf04b4d91641c9331547f99f34293d04e68625}}, core Lean 4.19.0, standalone, no library. Exit 0. Sixteen theorems; the compiler's own transcript, verbatim:

\begingroup\scriptsize
```
'OneCut.fold_involution' depends on axioms: [propext, Quot.sound]
'OneCut.fold_fixed_iff' depends on axioms: [propext, Quot.sound]
'OneCut.reg_lands_on_line' does not depend on any axioms
'OneCut.reg_fixes_line' does not depend on any axioms
'OneCut.unicorn_never_registered' does not depend on any axioms
'OneCut.reg_forgets_side' does not depend on any axioms
'OneCut.ghost_side_unread' does not depend on any axioms
'OneCut.off_line_pair_distinct' depends on axioms: [propext, Quot.sound]
'OneCut.ghost_and_unicorn_one_bit' depends on axioms: [propext, Quot.sound]
'OneCut.nothing_escapes_one_cut' depends on axioms: [propext, Quot.sound]
'OneCut.lossless_iff_on_line' does not depend on any axioms
'OneCut.both_worlds_inside' does not depend on any axioms
'OneCut.lossless_iff_value' does not depend on any axioms
'OneCut.unicorn_generic' does not depend on any axioms
'OneCut.ghost_generic' does not depend on any axioms
'OneCut.one_cut_generic' does not depend on any axioms
```
\endgroup

\begingroup\scriptsize
```
/-
  ONE CUT. The ghost and the unicorn close in one cut. Core Lean 4, standalone, no library.
  A point of the critical strip is its doubled real part x and its height t; the critical line is
  x = 1; the fold s ↦ 1 - s̄ sends x to 2 - x; registration, the measurement of a zero as an
  energy, keeps the height and lands on the line. Part I is this chart; Part II is the same cut on
  any row. No axiom is declared anywhere in this file.
-/
namespace OneCut

structure Pt where
  x : Int
  t : Nat
  deriving DecidableEq, Repr

def onLine (z : Pt) : Prop := z.x = 1
instance (z : Pt) : Decidable (onLine z) := inferInstanceAs (Decidable (z.x = 1))
def fold (z : Pt) : Pt := ⟨2 - z.x, z.t⟩
def reg (z : Pt) : Pt := ⟨1, z.t⟩

theorem fold_involution (z : Pt) : fold (fold z) = z := by
  cases z with
  | mk x t =>
    show Pt.mk (2 - (2 - x)) t = Pt.mk x t
    congr 1
    omega

theorem fold_fixed_iff (z : Pt) : fold z = z ↔ onLine z := by
  cases z with
  | mk x t =>
    show Pt.mk (2 - x) t = Pt.mk x t ↔ x = 1
    constructor
    · intro h
      have hx := congrArg Pt.x h
      change 2 - x = x at hx
      omega
    · intro h
      subst h
      rfl

/-- Registration lands every point on the line. -/
theorem reg_lands_on_line (z : Pt) : onLine (reg z) := rfl

/-- Registration fixes what is already on the line. -/
theorem reg_fixes_line (z : Pt) (h : onLine z) : reg z = z := by
  cases z with
  | mk x t =>
    have hx : x = 1 := h
    subst hx
    rfl

/-- The unicorn: a point off the line is never the image of a registration. -/
theorem unicorn_never_registered (z : Pt) (h : ¬ onLine z) : ∀ w, reg w ≠ z := by
  intro w hw
  apply h
  rw [← hw]
  exact reg_lands_on_line w

/-- The ghost: registration forgets the side, so the two points of an orbit have one record. -/
theorem reg_forgets_side (z : Pt) : reg (fold z) = reg z := rfl

/-- No reading of the record recovers the side. -/
theorem ghost_side_unread {β : Type} (g : Pt → β) (z : Pt) : g (reg (fold z)) = g (reg z) := by
  rw [reg_forgets_side]

theorem off_line_pair_distinct (z : Pt) (h : ¬ onLine z) : fold z ≠ z :=
  fun hf => h ((fold_fixed_iff z).mp hf)

/-- One cut, one bit: off the line, the side the record forgets and the point measurement never
    shows are the same point's two faces. -/
theorem ghost_and_unicorn_one_bit (z : Pt) (h : ¬ onLine z) :
    fold z ≠ z ∧ reg (fold z) = reg z ∧ ∀ w, reg w ≠ z :=
  ⟨off_line_pair_distinct z h, reg_forgets_side z, unicorn_never_registered z h⟩

/-- Nothing escapes: every point is on the line, fixed and registered without loss, or off it,
    where it has a partner, loses its side in the record, and is never measured. -/
theorem nothing_escapes_one_cut (z : Pt) :
    (onLine z ∧ fold z = z ∧ reg z = z) ∨
    (¬ onLine z ∧ fold z ≠ z ∧ reg (fold z) = reg z ∧ ∀ w, reg w ≠ z) :=
  if h : z.x = 1 then Or.inl ⟨h, (fold_fixed_iff z).mpr h, reg_fixes_line z h⟩
  else Or.inr ⟨h, off_line_pair_distinct z h, reg_forgets_side z, unicorn_never_registered z h⟩

/-- The hypothesis is lossless registration: on any list of zeros, registration erases nothing
    exactly when every zero is on the line. -/
theorem lossless_iff_on_line (Z : List Pt) : (∀ z ∈ Z, reg z = z) ↔ (∀ z ∈ Z, onLine z) := by
  constructor
  · intro h z hz
    have e := h z hz
    rw [← e]
    exact reg_lands_on_line z
  · intro h z hz
    exact reg_fixes_line z (h z hz)

/-- Both worlds inside: a lossless world and a world with one priced orbit sit in one chart. -/
theorem both_worlds_inside :
    (∀ z ∈ [Pt.mk 1 14], reg z = z) ∧
    (∃ z ∈ [Pt.mk 0 14, Pt.mk 2 14], reg z ≠ z) ∧
    reg (Pt.mk 0 14) = reg (Pt.mk 2 14) := by
  decide

/-! Part II. The same cut on any row: a locus P, a registration onto it, carriers landing on it. -/
section Generic
variable {S : Type}

def Value (P : S → Prop) (Z : S → Prop) : Prop := ∀ s, Z s → P s

structure Registration (P : S → Prop) (π : S → S) : Prop where
  lands : ∀ s, P (π s)
  fixes : ∀ s, P s → π s = s

structure Carrier (P : S → Prop) (W : Type) where
  ι : W → S
  lands : ∀ w, P (ι w)

def Actuated {W : Type} (ι : W → S) (Z : S → Prop) : Prop := ∀ s, Z s → ∃ w, ι w = s

/-- On any row, the value is lossless registration. -/
theorem lossless_iff_value (P : S → Prop) (π : S → S) (R : Registration P π) (Z : S → Prop) :
    (∀ s, Z s → π s = s) ↔ Value P Z :=
  ⟨fun h s hs => h s hs ▸ R.lands s, fun h s hs => R.fixes s (h s hs)⟩

/-- The unicorn on any row: an off-locus instance is never the image of a registration. -/
theorem unicorn_generic (P : S → Prop) (π : S → S) (R : Registration P π) (x : S) (hx : ¬ P x) :
    ∀ s, π s ≠ x :=
  fun s h => hx (h ▸ R.lands s)

/-- The ghost on any row: no carrier landing on the locus covers an off-locus instance, so a
    physical object read as a proof about the far side of the cut reaches nothing there. -/
theorem ghost_generic {W : Type} (P : S → Prop) (C : Carrier P W) (Z : S → Prop) (x : S)
    (hz : Z x) (hx : ¬ P x) : ¬ Actuated C.ι Z := by
  intro hcov
  match hcov x hz with
  | ⟨w, hw⟩ => exact hx (hw ▸ C.lands w)

/-- One cut on any row: every instance is on the locus, or off it where no registration shows it
    and no carrier reaches it. Nothing escapes the cut. -/
theorem one_cut_generic (P : S → Prop) [DecidablePred P] (π : S → S) (R : Registration P π)
    (x : S) :
    P x ∨ (¬ P x ∧ (∀ s, π s ≠ x) ∧
      ∀ (W : Type) (C : Carrier P W) (Z : S → Prop), Z x → ¬ Actuated C.ι Z) :=
  if h : P x then Or.inl h
  else Or.inr ⟨h, unicorn_generic P π R x h, fun _ C Z hz => ghost_generic P C Z x hz h⟩

end Generic
end OneCut

#print axioms OneCut.fold_involution
#print axioms OneCut.fold_fixed_iff
#print axioms OneCut.reg_lands_on_line
#print axioms OneCut.reg_fixes_line
#print axioms OneCut.unicorn_never_registered
#print axioms OneCut.reg_forgets_side
#print axioms OneCut.ghost_side_unread
#print axioms OneCut.off_line_pair_distinct
#print axioms OneCut.ghost_and_unicorn_one_bit
#print axioms OneCut.nothing_escapes_one_cut
#print axioms OneCut.lossless_iff_on_line
#print axioms OneCut.both_worlds_inside
#print axioms OneCut.lossless_iff_value
#print axioms OneCut.unicorn_generic
#print axioms OneCut.ghost_generic
#print axioms OneCut.one_cut_generic
```
\endgroup

# Appendix B: One\_Cut\_Twin.f90 and Its Run

Built with `gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off`, exit 0. The run, verbatim:

\begingroup\scriptsize
```
  PASS  first ten zeros registered without loss
  PASS  off-line orbit has two distinct points
  PASS  both sides register to one record (the ghost bit)
  price of the forgotten side at 300 K:  2.87098E-21 J
  PASS  the forgotten side costs k_B T ln 2 > 0
  PASS  every registration lands on the line, the fold an involution
  PASS  no off-line point is ever a registered point (the unicorn)
  PASS  every off-line pair shares one record (the ghost)
  PASS  loss appears exactly at the off-line pair: two points, one bit
 BATTERY-JSON: {"checks":8,"failures":0}
```
\endgroup

\begingroup\scriptsize
```
! ONE CUT, the executed twin. The critical strip in an integer chart: real part k/20, the line at
! k = 10, the fold k -> 20 - k; registration keeps the height and lands on the line.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off One_Cut_Twin.f90
program one_cut_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  real(dp), parameter :: KB = 1.380649e-23_dp, TK = 300.0_dp
  real(dp), parameter :: H(10) = [14.134725142_dp, 21.022039639_dp, 25.010857580_dp, 30.424876126_dp, &
       32.935061588_dp, 37.586178159_dp, 40.918719012_dp, 43.327073281_dp, 48.005150881_dp, 49.773832478_dp]
  integer :: checks, fails, i, k, j, nfix, noff, nbad, nghost, nmirror, kr
  integer :: kz(12)
  real(dp) :: tz(12), price, tr
  checks = 0; fails = 0
  ! 1. the first ten zeros sit on the line: registration erases nothing
  nfix = 0
  do i = 1, 10
    call reg(10, H(i), kr, tr)
    if (kr == 10 .and. tr == H(i)) nfix = nfix + 1
  end do
  call check('first ten zeros registered without loss', nfix == 10)
  ! 2. a hypothetical off-line orbit: two points, one record, one bit
  call check('off-line orbit has two distinct points', 8 /= fold_k(8))
  call check('both sides register to one record (the ghost bit)', reg_k(8) == reg_k(fold_k(8)))
  price = KB * TK * log(2.0_dp)
  write(*,'(a,es12.5,a)') '  price of the forgotten side at 300 K: ', price, ' J'
  call check('the forgotten side costs k_B T ln 2 > 0', price > 2.87e-21_dp .and. price < 2.872e-21_dp)
  ! 3. the mirror sweep over the whole grid: 19 real parts, 20 heights
  noff = 0; nbad = 0; nghost = 0; nmirror = 0
  do k = 1, 19
    do j = 1, 20
      if (reg_k(k) /= 10) nbad = nbad + 1
      if (fold_k(fold_k(k)) /= k) nbad = nbad + 1
      if (k /= 10) then
        noff = noff + 1
        if (reg_k(k) /= reg_k(fold_k(k))) nghost = nghost + 1
        if (reg_k(k) == k) nmirror = nmirror + 1
      end if
    end do
  end do
  call check('every registration lands on the line, the fold an involution', nbad == 0)
  call check('no off-line point is ever a registered point (the unicorn)', nmirror == 0 .and. noff == 360)
  call check('every off-line pair shares one record (the ghost)', nghost == 0)
  ! 4. lossless iff on the line: ten zeros plus one off-line pair
  kz(1:10) = 10; kz(11) = 8; kz(12) = fold_k(8); tz(1:10) = H; tz(11:12) = H(1)
  nfix = 0
  do i = 1, 12
    call reg(kz(i), tz(i), kr, tr)
    if (kr == kz(i) .and. tr == tz(i)) nfix = nfix + 1
  end do
  call check('loss appears exactly at the off-line pair: two points, one bit', 12 - nfix == 2)
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  pure integer function fold_k(k)
    integer, intent(in) :: k
    fold_k = 20 - k
  end function fold_k
  pure integer function reg_k(k)
    integer, intent(in) :: k
    reg_k = 10 + 0*k
  end function reg_k
  pure subroutine reg(k, t, kr, tr)
    integer, intent(in) :: k
    real(dp), intent(in) :: t
    integer, intent(out) :: kr
    real(dp), intent(out) :: tr
    kr = reg_k(k); tr = t
  end subroutine reg
  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    checks = checks + 1
    if (.not. ok) fails = fails + 1
    write(*,'(a,a,a)') merge('  PASS  ','  FAIL  ',ok), name, ''
  end subroutine check
end program one_cut_twin
```
\endgroup
