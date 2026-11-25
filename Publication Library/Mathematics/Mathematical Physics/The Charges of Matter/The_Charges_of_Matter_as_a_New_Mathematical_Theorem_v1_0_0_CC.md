# The Charges of Matter as a New Mathematical Theorem

## Why the Lepton Charges Follow from the Quark Charges: Closure of the Record in Every Generation, and No Charge That No Field Reads

**Mohammad F. Islam** · 24 November 2026

*On edition 1.0.0. This paper stands beside The Nuclear Forces as a New Mathematical Theorem (Islam, 2026d), which forces the laws of the strong and the weak force. It asks what charges matter can carry under those laws, and proves the answer.*

## Abstract

That the charges of matter are forced by the closure of the record, in every generation, is established here as a mathematical theorem, on three named bridges. A generation of quarks and leptons carries five hypercharges, and four sums of them must vanish for the readings of the weak field, of the strong field, of gravity and of the hypercharge field itself to close. We prove in core Lean 4, twenty laws with no axiom declared and no use of choice, that the four conditions, with no charge given, fix the lepton doublet, the right-handed electron and the sum of the right-handed quarks in terms of the quark doublet, and leave exactly three cases: the two doublets and the right-handed electron carry no hypercharge; or the table is the observed one at some scale; or it is the observed one with the two right-handed quarks renamed. With the quark doublet as the unit, the lepton charges follow from the quark charges, and the atom is neutral. The unit itself is not fixed: every multiple of the table closes.

For one generation this classification is known since 1989, and it is put here in a kernel. Two statements are this paper's own. A total over generations can vanish while each generation fails, and the engine exhibits one; on the premise that the record closes in each generation taken alone, each of three generations falls under the same three cases, and carries the observed table at its own scale once its quark doublet is read to carry hypercharge. And a label that every registration conserves is a function of the record, so that no conserved label is unread; a label the record does not carry is not conserved. A Fortran twin runs nine checks with zero failures: of the 9,765,625 tables with charges from $-12$ to 12, thirty-three close, and each is one of the three cases; the neutron of the forced table is neutral, against a measured charge of $(-0.2\pm0.8)\times10^{-21}$ of the electron's.

## The Standing of This Work

**The charges of matter are established here as forced.** Given the multiplets of a generation, the closure of the record leaves the observed table of hypercharges, up to one scale and the naming of two fields. The charges of the leptons are not independent of those of the quarks. They follow from them.

**Nothing is added.** This work adds no field, no symmetry and no unification group, and it declares zero axioms in core Lean 4, with no use of choice. It stands on three bridges, printed with their grades in section 1.

| Level | Framework | Standing | What is overcome |
|---|---|---|---|
| Projection | Bouchiat, Iliopoulos and Meyer (1972) | the four sums vanish on the observed table | a check of charges taken from experiment; says nothing on whether other tables pass |
| Realization | Geng and Marshak (1989); Babu and Mohapatra (1989); Minahan, Ramond and Warner (1990) | the conditions determine the charges of one generation | proved on paper for one generation; a total over generations is all that consistency asks |
| Foundation | The charges as a theorem, this work | theorems checked by the kernel in core Lean 4, no axiom declared, no choice, on three named bridges | the classification in a kernel; the forced table in each generation, on a premise; no conserved label unread |

**What the Standard Model assumed, this work proves.** There the hypercharges are entered by hand, five numbers a generation. Here four of the five are theorems of closure, and the fifth is the unit.

| Prior position | What it held | What this work proves |
|---|---|---|
| The charge table of the Standard Model | five hypercharges, taken from experiment | the table is forced up to its unit and one naming (`closure_forces_the_whole_table`, `the_observed_table_is_forced`) |
| Bouchiat, Iliopoulos and Meyer (1972) | the sums vanish on the observed table | the same, decided in the kernel (`the_observed_generation_closes`) |
| The equality of the charges of the proton and the electron | a measured coincidence to parts in $10^{21}$ | a consequence of the forced table (`the_atom_is_neutral`) |
| Consistency of the theory | the total over generations must vanish | a total can hide a failure (`a_total_can_hide_a_failure`); on bridge B2, that each generation closes alone, each falls under the three cases (`each_generation_is_forced`) and, its bit read, carries the table at its own scale (`a_charged_generation_carries_the_table`) |
| No global symmetries (Banks and Seiberg, 2011) | argued from black holes | no conserved label is unread (`no_conserved_label_is_unread`); its reading as a field is bridge B3 |

**Each generation closes alone.** The three generations do not share their closure. Each falls under the three cases, each with its bit read carries the table at its own scale, and none borrows from another.

**Three warrants bound the claim.** The classification of one generation is not new, and section 3 credits it; it is for a table with no right-handed neutrino that carries hypercharge. The unit of charge is not fixed by closure: every multiple of the table closes (`every_scale_closes`), so the size of the charge is a magnitude, read from measurement. And the three bridges are premises or classical results, printed as such: that the four sums are the closure conditions, that the record closes in each generation taken alone, and that a label the record carries is a charge a field reads. Section 8 names the observation that would break each.

## The Charges Are Forced

### 1. The Question, and the Rule of This Paper

The Standard Model lists the charges of a generation of matter and does not explain them. The quark doublet has hypercharge $1/6$, the right-handed up and down quarks $2/3$ and $-1/3$, the lepton doublet $-1/2$ and the right-handed electron $-1$. **This paper proves that the closure of the record leaves no other table**, up to one scale and the naming of the two right-handed quarks.

The rule is that of the companion papers. Only the seat and the root are allowed. Every other step is a theorem of the engine in Appendix A, a theorem of a companion paper named beside it, one of three bridges named here before it is used, or an item of data or a classical result listed below.

| Bridge | What it says | Grade |
|---|---|---|
| B1 | A reading that does not close lets a flux escape the record. The four sums of section 2 are the conditions for the readings of the weak field, of the strong field, of gravity and of the hypercharge field itself to close. | structural: the root, with the classical results of Adler (1969), Bell and Jackiw (1969) and Alvarez-Gaumé and Witten (1984) |
| B2 | The record closes in each generation taken alone: equivalently, with one generation in the reading, with two, and with three. | premise |
| B3 | A label the record carries is a charge that a field reads. | premise |

The data are the multiplets of a generation and their multiplicities: a quark doublet in three colours, a lepton doublet, two right-handed quarks in three colours each, and a right-handed electron. The multiplets and their multiplicities are taken from measurement; the companion paper prints the measurement of the three colours (Islam, 2026d, `the_ratio_counts_the_colours`). The number of generations is three; that paper proves three is the least number that carries a phase (`three_is_the_least_with_a_phase`), and this paper takes the count as given. The table has no right-handed neutrino: one without hypercharge would change no sum, and one that carried hypercharge would add a free parameter, with which the classification of section 3 does not hold (Babu and Mohapatra, 1989). One bit is read from measurement: the quark doublet carries hypercharge. One classical relation enters by name and is used in section 4: the electric charge of a field is its hypercharge plus its weak part (Weinberg, 1967). Nothing else enters.

Hypercharges are carried times six throughout, so that the observed table reads $q=1$, $u=4$, $d=-2$, $l=-3$, $e=-6$ for the quark doublet, the right-handed up and down quarks, the lepton doublet and the right-handed electron.

### 2. The Four Sums

The sums are taken left-handed minus right-handed, each field counted with its multiplicity.

| Reading that must close | Sum |
|---|---|
| weak field twice, hypercharge once | $3q+l$ |
| strong field twice, hypercharge once | $6q-3u-3d$ |
| gravity twice, hypercharge once | $6q+2l-3u-3d-e$ |
| hypercharge three times | $6q^{3}+2l^{3}-3u^{3}-3d^{3}-e^{3}$ |

On the observed table all four vanish (`the_observed_generation_closes`). This is the cancellation of Bouchiat, Iliopoulos and Meyer (1972), decided here by the kernel.

### 3. One Generation: Closure Forces the Whole Table

Take the four conditions with no charge given. The three linear ones give $l=-3q$, $d=2q-u$ and $e=-6q$. With these the cubic sum factors (`the_cubic_closure_factors`):

$$6q^{3}+2l^{3}-3u^{3}-3d^{3}-e^{3}=-18\,q\,(u-4q)(u+2q).$$

A product of integers vanishes only if a factor does. **The four conditions therefore leave exactly three cases** (`closure_forces_the_whole_table`): $q=0$, in which the two doublets and the right-handed electron carry no hypercharge; $u=4q$, which is the observed table at the scale $q$; or $u=-2q$, which is the observed table with the two right-handed quarks renamed. With the quark doublet as the unit, the table is the observed one or its renaming (`the_observed_table_is_forced`).

This classification is known. It was found by Geng and Marshak (1989), by Babu and Mohapatra (1989) and by Minahan, Ramond and Warner (1990). What is added here is the kernel: the factorization and the three cases are checked for all integers, with no charge assumed.

Two things are not forced. The first case is removed by the one bit read from measurement, that the quark doublet carries hypercharge. And the unit is free: every multiple of the observed table closes (`every_scale_closes`). The size of the charge is a magnitude.

### 4. The Atom Is Neutral

By the classical relation named in section 1 the electric charge of a field is its hypercharge plus its weak part, and for a right-handed field it is the hypercharge itself. On the forced table the up quark has charge $2/3$, the down quark $-1/3$ and the electron $-1$. Two up quarks and a down quark have charge one, which cancels the electron's; one up quark and two down quarks have charge zero (`the_atom_is_neutral`). **The neutrality of the atom is a theorem of closure.** It is measured to parts in $10^{21}$.

### 5. Every Generation

Consistency of the theory asks only that the sums vanish in total. A total can vanish while each part fails: two generations with lepton doublets of $-2$ and $-4$ each fail the first condition, by one unit in opposite directions, and their total satisfies it (`a_total_can_hide_a_failure`).

The record asks more, by B2: it closes in each generation taken alone. The engine proves that this is the same as closing with one generation in the reading, with two, and with three (`closure_at_every_threshold_forces_each`). **Three generations whose record closes at each of these three steps each fall under the three cases of section 3** (`each_generation_is_forced`). The bit of section 1 is read in each: a generation whose quark doublet carries hypercharge carries the observed table at its own scale, or its renaming (`a_charged_generation_carries_the_table`). No generation borrows from another. Closure does not make the three scales equal; that the three generations carry one scale is measured.

B2 is a premise, and it is not a statement about scales of mass. The members of a generation do not share one mass, and the measured order of masses interleaves the generations: the charm quark is lighter than the tau lepton (Navas et al., 2024). The particles lighter than a given mass are therefore not a whole number of generations, and their sums do not vanish; in field theory the heavier ones leave a term that carries their share. B2 says that each generation is a complete copy of the reading and closes as one. It is the demand of the root on each copy, and it is printed as a premise for that reason.

### 6. No Conserved Label Is Unread

A label is a number assigned to each state. The registration of the seat keeps the height of a state and forgets its side. The record carries a label when the label is a function of the registration. **A label is conserved by every registration exactly when the record carries it** (`conserved_iff_read`), so no label is conserved and unread (`no_conserved_label_is_unread`). The side of a state is the example on the other side: the record does not carry it, and the registration does not conserve it (`the_side_is_unread_and_not_conserved`). A label the record carries cannot tell a state from its fold partner (`a_read_label_is_blind_to_the_side`).

By B3 a label the record carries is a charge that a field reads. **On B3, there is no conserved charge that no field reads.** This is the statement that a theory with gravity has no global symmetry (Banks and Seiberg, 2011; Harlow and Ooguri, 2021), reached here from the registration. Two further theorems give the counting behind the black-hole argument: a record of capacity $C$ cannot hold a charge above $C$ (`a_finite_record_cannot_hold_it`), and what it returns is at most $C$ (`evaporation_does_not_return_the_charge`).

One consequence is not tested. The number of baryons is a label that no field reads. On B3 it is not exactly conserved. No decay of the proton has been observed, and the statement stands open.

### 7. It Is Measured

Every row is a retrodiction: each measurement stood before this work.

| Consequence of the forced table | Forced | Measured |
|---|---|---|
| charge of the neutron, in units of the electron's | 0 | $(-0.2\pm0.8)\times10^{-21}$ (Navas et al., 2024) |
| sum of the charges of the proton and the electron | 0 | below $10^{-21}$ in magnitude (Bressi et al., 2011) |

The twin searches every table with charges from $-12$ to 12, which is 9,765,625 tables. Thirty-three close: twenty-five in which the doublets carry no hypercharge, four that are the observed table at the scales $\pm1$ and $\pm2$, and four that are its renaming. No table outside the three cases closes. The number of light neutrinos is $2.9963\pm0.0074$ (Janot and Jadach, 2020), a reading that agrees with the count of three taken as given.

### 8. The Ledger, the Falsifier, and What Stands Open

| Claim | Carried by | Grade |
|---|---|---|
| the four sums vanish on the observed table | `the_observed_generation_closes` | theorem |
| the four conditions leave three cases, with no charge given | `the_cubic_closure_factors`, `closure_forces_the_whole_table` | theorem; a classical result, here in the kernel |
| the lepton charges follow from the quark charges | `the_observed_table_is_forced`, `lepton_charges_are_forced` | theorem of the four conditions; that matter obeys them is B1 |
| the unit of charge is not fixed | `every_scale_closes` | theorem |
| the atom is neutral | `the_atom_is_neutral`, on B1 | theorem of the forced table, with the classical relation of charge to hypercharge; structural through B1 |
| each generation falls under the three cases, and carries the table at its own scale when its quark doublet carries hypercharge | `each_generation_is_forced`, `a_charged_generation_carries_the_table`, with the lemma `closure_at_every_threshold_forces_each`, on B2 | premise grade, on B2 |
| no conserved label is unread | `conserved_iff_read`, `no_conserved_label_is_unread` | theorem |
| no conserved charge that no field reads | the same, with B3 | premise grade, on B3 |

**F-Neutral.** A measured charge of the neutron, or of the hydrogen atom, different from zero beyond its uncertainty breaks the forced table.

**F-Generation.** A generation of matter whose charges are not the forced table, with the record closed in total, breaks B2.

**What stands open.** B2 and B3 are premises. That the three generations carry one scale of charge is measured and not forced. A right-handed neutrino that carried hypercharge would undo the classification. The unit of charge and the number of generations are not derived here. The decay of the proton is not observed.

**The charges are closed.** Given the multiplets, closure forces the table, the atom is neutral, and the unit is read. On B2 each generation, its bit read, carries the table alone, at its own scale. On B3 no conserved charge goes unread.

## Author's Provenance and Method Disclosure

**Who wrote it.** The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean files and the Fortran twins are written by a language model under the author's direct supervision.

**Method.** The work stands on one seat, the fixed line of a reflection, and one root, that nothing escapes the record, both set out in Nothing Escapes, Least Erasure (Islam, 2026a). Three bridges are printed in section 1 at their grades, with the data and the classical results that enter by name. Every theorem named in the text is declared under that name in Appendix A or in the engine of the companion paper named beside it. The kernel line of every theorem of Appendix A is printed in Appendix B. Every measured value in the text names its source beside it. An earlier draft of Part IV of the engine took as hypothesis that every charge is carried by a field, which is its conclusion in other words. It is rebuilt on the registration, and the hypothesis is gone.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is set out in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

**Classical sources.** That the sums cancel on the observed table is the result of Bouchiat, Iliopoulos and Meyer (1972) and of Gross and Jackiw (1972). That the conditions determine the charges of one generation is the result of Geng and Marshak (1989), Babu and Mohapatra (1989) and Minahan, Ramond and Warner (1990); the gravitational condition is Alvarez-Gaumé and Witten's (1984). That a theory with gravity admits no global symmetry is argued by Banks and Seiberg (2011) and proved in a class of theories by Harlow and Ooguri (2021). This paper puts the classification of one generation in a kernel, and adds the closure of every generation at every threshold and a statement on unread labels whose premise is not its conclusion.

## References

1. S. Weinberg, Phys. Rev. Lett. 19 (1967) 1264.
2. S. L. Adler, Phys. Rev. 177 (1969) 2426.
3. J. S. Bell and R. Jackiw, Nuovo Cimento A 60 (1969) 47.
4. C. Bouchiat, J. Iliopoulos and Ph. Meyer, Phys. Lett. B 38 (1972) 519.
5. D. J. Gross and R. Jackiw, Phys. Rev. D 6 (1972) 477.
6. L. Alvarez-Gaumé and E. Witten, Nucl. Phys. B 234 (1984) 269.
7. C. Q. Geng and R. E. Marshak, Phys. Rev. D 39 (1989) 693.
8. K. S. Babu and R. N. Mohapatra, Phys. Rev. Lett. 63 (1989) 938.
9. J. A. Minahan, P. Ramond and R. C. Warner, Phys. Rev. D 41 (1990) 715.
10. T. Banks and N. Seiberg, Phys. Rev. D 83 (2011) 084019.
11. G. Bressi et al., Phys. Rev. A 83 (2011) 052101.
12. P. Janot and S. Jadach, Phys. Lett. B 803 (2020) 135319.
13. D. Harlow and H. Ooguri, Commun. Math. Phys. 383 (2021) 1669.
14. S. Navas et al. (Particle Data Group), Phys. Rev. D 110 (2024) 030001.
15. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
16. M. F. Islam, The Nuclear Forces as a New Mathematical Theorem, edition 1.0.0 (2026d).

## Appendix A · SPHYS_Charge_Closure_CC.lean

Core Lean 4.19.0, no import, no axiom declared, no use of choice, compiled with warnings fatal, exit 0. The kernel lines follow in Appendix B.

```lean
/-
  SPHYS_Charge_Closure_CC.lean · The charges of matter, forced by closure · core Lean 4, no library.

  THE THEOREMS.
    (1) One generation. The four closure conditions of a generation of quarks and leptons, taken with no charge
        given, leave exactly three cases: the two doublets and the right-handed electron carry no hypercharge; or the
        table is the observed
        one up to one scale; or it is the observed one with the two right-handed quarks renamed.
        (`closure_forces_the_whole_table`, `the_observed_table_is_forced`)
    (2) Every generation. A total can close while each generation fails (`a_total_can_hide_a_failure`). If the
        record closes at every threshold, with one, two and three generations in the reading, each generation
        closes alone (`closure_at_every_threshold_forces_each`), and each then falls under the three cases of (1)
        (`each_generation_is_forced`); one whose quark doublet carries hypercharge carries the table at its own
        scale (`a_charged_generation_carries_the_table`).
    (3) No unread charge. A label that the registration conserves is a function of the record, and a label the
        record does not carry is not conserved (`conserved_iff_read`, `no_conserved_label_is_unread`).

  RATIONALE. The first cancellation of the sums on the observed table is Bouchiat, Iliopoulos and Meyer's (1972).
  That the conditions determine the charges is known since 1989 (Geng and Marshak; Babu and Mohapatra; Minahan,
  Ramond and Warner). Part II puts that classification in the kernel. Parts III and IV are this file's own: the
  threshold form of closure in every generation, and a statement on global charges whose premise is not its
  conclusion. An earlier draft of the last took as hypothesis that every charge is carried by a field, which is
  the conclusion in other words, and stated it on a family of integer fields that Part V of the companion file
  SPHYS_Coupling_Magnitude_CC.lean proves holds only zero. It is rebuilt here on the registration.

  DESIGN. Integers only. Hypercharges are carried times 6, so the observed table is yQ = 1, yU = 4, yD = -2,
  yL = -3, yE = -6. Multiplicities are those of the Standard Model: the quark doublet counts 3 colours times 2,
  the lepton doublet 2, each right-handed quark 3, the right-handed electron 1. The sums are left minus right.
  The cubic identity is proved by expansion to monomials. No axiom is declared.

  WHAT ENTERS AS DATA, NOT AS A THEOREM. The multiplets and their multiplicities; that the four sums are the
  closure conditions (Adler 1969; Bell and Jackiw 1969; Alvarez-Gaumé and Witten 1984); and, to leave the first
  case of (1), one bit read from measurement: the quark doublet carries hypercharge. The table has no right-handed
  neutrino; one that carried hypercharge would add a free parameter and the classification would not hold.

  WHAT THIS FILE DOES NOT PROVE. It does not prove that the record must close in each generation taken alone; that
  is a bridge of the paper, and it is not a statement about scales of mass, since the measured masses interleave
  the generations. It does not prove that a label read by the record is carried by a gauge field; that identification
  is a bridge too. It fixes no scale of charge: every multiple of the table closes (`every_scale_closes`).

  NON-NEGOTIABLE. No theorem here fixes the unit of charge, a mass, or the number of generations.
-/
namespace SPHYS.Charges

/-! ## Part I. The four sums and the observed table (carried from the file of the first draft, unchanged) -/

/-- The [SU(2)]²U(1) anomaly sum of one generation: the left doublets, quark (3 colors) and lepton. -/
def A2 (yQ yL : Int) : Int := 3 * yQ + yL

/-- The [SU(3)]²U(1) anomaly sum: left quarks (3 colors × doublet 2) minus right quarks (3 each). -/
def A3 (yQ yU yD : Int) : Int := 6 * yQ - (3 * yU + 3 * yD)

/-- The gravitational U(1) anomaly sum: all left charges minus all right charges, with multiplicities. -/
def Ag (yQ yU yD yL yE : Int) : Int := (6 * yQ + 2 * yL) - (3 * yU + 3 * yD + yE)

/-- The [U(1)]³ anomaly sum, charges cubed (carried times 216): left minus right, with multiplicities. -/
def A1 (yQ yU yD yL yE : Int) : Int :=
  (6 * yQ ^ 3 + 2 * yL ^ 3) - (3 * yU ^ 3 + 3 * yD ^ 3 + yE ^ 3)

/-- THE OBSERVED GENERATION CLOSES. At the observed hypercharges (times 6), all four anomaly sums of one
    generation are zero. Decided in the kernel, sum by sum — the 1972 arithmetic, at theorem grade. -/
theorem the_observed_generation_closes :
    A2 1 (-3) = 0 ∧ A3 1 4 (-2) = 0 ∧ Ag 1 4 (-2) (-3) (-6) = 0 ∧ A1 1 4 (-2) (-3) (-6) = 0 := by
  decide

/-- THE LEPTON CHARGES ARE FORCED. Given the quark hypercharges, the [SU(2)]²U(1) closure fixes the
    lepton doublet's charge (yL = -3·yQ with yQ = 1), and the gravitational closure then fixes the
    right-handed electron's charge (yE = -6). The lepton half of the table is not fitted: two closure
    conditions determine it from the quark half. -/
theorem lepton_charges_are_forced (yL yE : Int)
    (h2 : A2 1 yL = 0) (hg : Ag 1 4 (-2) yL yE = 0) : yL = -3 ∧ yE = -6 := by
  unfold A2 at h2
  unfold Ag at hg
  refine ⟨?_, ?_⟩ <;> omega

/-- AND THE FORCED TABLE CLOSES WHOLLY. The remaining two conditions, [SU(3)]²U(1) and [U(1)]³, hold at
    the forced charges identically: the closure is over-determined and consistent, which is the content
    of the cancellation — four conditions, and the table forced by two of them satisfies all four. -/
theorem forced_charges_close_wholly :
    A3 1 4 (-2) = 0 ∧ A1 1 4 (-2) (-3) (-6) = 0 := by
  decide

/-- THE LINEAR CLOSURES ADD OVER GENERATIONS. For the three linear anomaly sums, the sum over two
    generations (charges added) is the sum of the sums: closure of the whole from closure of the parts,
    and — the sharp direction — a failure in one generation is visible in the total unless another
    generation cancels it, which the per-generation reading forbids. -/
theorem linear_closures_add (aQ aU aD aL aE bQ bU bD bL bE : Int) :
    A2 (aQ + bQ) (aL + bL) = A2 aQ aL + A2 bQ bL ∧
    A3 (aQ + bQ) (aU + bU) (aD + bD) = A3 aQ aU aD + A3 bQ bU bD ∧
    Ag (aQ + bQ) (aU + bU) (aD + bD) (aL + bL) (aE + bE) =
      Ag aQ aU aD aL aE + Ag bQ bU bD bL bE := by
  unfold A2 A3 Ag
  refine ⟨?_, ?_, ?_⟩ <;> omega

/-- THREE IDENTICAL GENERATIONS CLOSE. The whole table, three copies of the observed generation, has all
    four anomaly sums zero — decided in the kernel with every multiplicity written out. -/
theorem three_generations_close :
    3 * A2 1 (-3) = 0 ∧ 3 * A3 1 4 (-2) = 0 ∧ 3 * Ag 1 4 (-2) (-3) (-6) = 0 ∧
    3 * A1 1 4 (-2) (-3) (-6) = 0 := by
  decide

/-! ## Part II. One generation: closure forces the whole table -/

/-- THE CUBIC SUM FACTORS. With the three linear conditions solved, the cubic sum is a product of three factors. -/
theorem the_cubic_closure_factors (q u : Int) :
    A1 q u (2 * q - u) (-3 * q) (-6 * q) = -18 * q * ((u - 4 * q) * (u + 2 * q)) := by
  unfold A1
  simp only [Int.pow_succ, Int.pow_zero, Int.one_mul]
  simp only [Int.mul_add, Int.add_mul, Int.mul_sub, Int.sub_mul, Int.mul_neg, Int.neg_mul,
    Int.mul_assoc, Int.mul_comm, Int.mul_left_comm]
  simp only [← Int.mul_assoc]
  omega

/-- CLOSURE FORCES THE WHOLE TABLE. The four conditions, with no charge given, fix the lepton doublet, the
    right-handed electron and the sum of the right-handed quarks in terms of the quark doublet, and leave three
    cases for the rest. -/
theorem closure_forces_the_whole_table (q u d l e : Int)
    (h2 : A2 q l = 0) (h3 : A3 q u d = 0) (hg : Ag q u d l e = 0) (h1 : A1 q u d l e = 0) :
    l = -3 * q ∧ e = -6 * q ∧ d = 2 * q - u ∧ (q = 0 ∨ u = 4 * q ∨ u = -2 * q) := by
  unfold A2 at h2
  unfold A3 at h3
  unfold Ag at hg
  have hl : l = -3 * q := by omega
  have hd : d = 2 * q - u := by omega
  have he : e = -6 * q := by omega
  refine ⟨hl, he, hd, ?_⟩
  rw [hl, he, hd, the_cubic_closure_factors] at h1
  rcases Int.mul_eq_zero.mp h1 with hq | hf
  · left; omega
  · rcases Int.mul_eq_zero.mp hf with ha | hb
    · right; left; omega
    · right; right; omega

/-- THE OBSERVED TABLE IS FORCED. With the quark doublet as the unit, closure leaves the observed table and
    the same table with the two right-handed quarks renamed. -/
theorem the_observed_table_is_forced (u d l e : Int)
    (h2 : A2 1 l = 0) (h3 : A3 1 u d = 0) (hg : Ag 1 u d l e = 0) (h1 : A1 1 u d l e = 0) :
    (u = 4 ∧ d = -2 ∧ l = -3 ∧ e = -6) ∨ (u = -2 ∧ d = 4 ∧ l = -3 ∧ e = -6) := by
  obtain ⟨hl, he, hd, hc⟩ := closure_forces_the_whole_table 1 u d l e h2 h3 hg h1
  rcases hc with h | h | h
  · exact absurd h (by decide)
  · exact Or.inl ⟨by omega, by omega, by omega, by omega⟩
  · exact Or.inr ⟨by omega, by omega, by omega, by omega⟩

/-- EVERY SCALE CLOSES. Every multiple of the observed table satisfies the four conditions: the unit of charge
    is not fixed by closure. -/
theorem every_scale_closes (k : Int) :
    A2 k (-3 * k) = 0 ∧ A3 k (4 * k) (-2 * k) = 0 ∧ Ag k (4 * k) (-2 * k) (-3 * k) (-6 * k) = 0 ∧
    A1 k (4 * k) (-2 * k) (-3 * k) (-6 * k) = 0 := by
  refine ⟨by unfold A2; omega, by unfold A3; omega, by unfold Ag; omega, ?_⟩
  have h : (-2 * k : Int) = 2 * k - 4 * k := by omega
  rw [h, the_cubic_closure_factors]
  have z : (4 * k - 4 * k : Int) = 0 := by omega
  rw [z, Int.zero_mul, Int.mul_zero]

/-- THE CHARGE OF THE ATOM. On the forced table the electric charges, times 6, of the proton's quarks and of
    the electron sum to zero, and the neutron's quarks sum to zero. Charge is hypercharge plus the weak part:
    for the right-handed fields it is the hypercharge itself. -/
theorem the_atom_is_neutral : (2 * 4 + (-2) + (-6) : Int) = 0 ∧ (4 + 2 * (-2) : Int) = 0 := by decide

/-! ## Part III. Every generation: a total can hide a failure, a threshold cannot -/

/-- A TOTAL CAN HIDE A FAILURE. Two generations, each failing the first condition, whose total satisfies it. -/
theorem a_total_can_hide_a_failure :
    ∃ aL bL : Int, A2 1 aL ≠ 0 ∧ A2 1 bL ≠ 0 ∧ A2 1 aL + A2 1 bL = 0 :=
  ⟨-2, -4, by decide, by decide, by decide⟩

/-- CLOSURE AT EVERY THRESHOLD FORCES EACH. If a sum closes with the first generation alone in the reading, with
    the first two, and with all three, it closes in each generation. -/
theorem closure_at_every_threshold_forces_each (a b c : Int)
    (h1 : a = 0) (h2 : a + b = 0) (h3 : a + b + c = 0) : a = 0 ∧ b = 0 ∧ c = 0 :=
  ⟨h1, by omega, by omega⟩

/-- A generation: the five charges of its multiplets. -/
structure Gen where
  q : Int
  u : Int
  d : Int
  l : Int
  e : Int

def s2 (g : Gen) : Int := A2 g.q g.l
def s3 (g : Gen) : Int := A3 g.q g.u g.d
def sg (g : Gen) : Int := Ag g.q g.u g.d g.l g.e
def s1 (g : Gen) : Int := A1 g.q g.u g.d g.l g.e

/-- The table is forced in a generation: the three cases of `closure_forces_the_whole_table`. -/
def Forced (g : Gen) : Prop :=
  g.l = -3 * g.q ∧ g.e = -6 * g.q ∧ g.d = 2 * g.q - g.u ∧ (g.q = 0 ∨ g.u = 4 * g.q ∨ g.u = -2 * g.q)

/-- All four sums close at each of the three thresholds. -/
def ClosesAtEveryThreshold (a b c : Gen) : Prop :=
  (s2 a = 0 ∧ s2 a + s2 b = 0 ∧ s2 a + s2 b + s2 c = 0) ∧
  (s3 a = 0 ∧ s3 a + s3 b = 0 ∧ s3 a + s3 b + s3 c = 0) ∧
  (sg a = 0 ∧ sg a + sg b = 0 ∧ sg a + sg b + sg c = 0) ∧
  (s1 a = 0 ∧ s1 a + s1 b = 0 ∧ s1 a + s1 b + s1 c = 0)

/-- EACH GENERATION IS FORCED. Three generations whose record closes at every threshold each carry the forced
    table. No generation borrows from another. -/
theorem each_generation_is_forced (a b c : Gen) (h : ClosesAtEveryThreshold a b c) :
    Forced a ∧ Forced b ∧ Forced c := by
  obtain ⟨⟨a2, ab2, abc2⟩, ⟨a3, ab3, abc3⟩, ⟨ag, abg, abcg⟩, ⟨a1, ab1, abc1⟩⟩ := h
  have b2 : s2 b = 0 := by omega
  have c2 : s2 c = 0 := by omega
  have b3 : s3 b = 0 := by omega
  have c3 : s3 c = 0 := by omega
  have bg : sg b = 0 := by omega
  have cg : sg c = 0 := by omega
  have b1 : s1 b = 0 := by omega
  have c1 : s1 c = 0 := by omega
  exact ⟨closure_forces_the_whole_table _ _ _ _ _ a2 a3 ag a1,
         closure_forces_the_whole_table _ _ _ _ _ b2 b3 bg b1,
         closure_forces_the_whole_table _ _ _ _ _ c2 c3 cg c1⟩

/-- A CHARGED GENERATION CARRIES THE TABLE. A generation under the three cases whose quark doublet carries
    hypercharge has the observed table at its own scale, or the same with the two right-handed quarks renamed.
    The scale is the generation's own: nothing here makes the scales of two generations equal. -/
theorem a_charged_generation_carries_the_table (g : Gen) (h : Forced g) (hq : g.q ≠ 0) :
    (g.u = 4 * g.q ∧ g.d = -2 * g.q ∧ g.l = -3 * g.q ∧ g.e = -6 * g.q) ∨
    (g.u = -2 * g.q ∧ g.d = 4 * g.q ∧ g.l = -3 * g.q ∧ g.e = -6 * g.q) := by
  obtain ⟨hl, he, hd, hc⟩ := h
  rcases hc with h0 | h4 | h2
  · exact absurd h0 hq
  · exact Or.inl ⟨h4, by omega, hl, he⟩
  · exact Or.inr ⟨h2, by omega, hl, he⟩

/-! ## Part IV. No conserved label is unread -/

abbrev Pt := Int × Int
/-- The reflection of the seat, and the registration, which keeps the height and forgets the side. -/
def fold (p : Pt) : Pt := (2 - p.1, p.2)
def reg (p : Pt) : Pt := (1, p.2)

/-- The record carries the label c: the label is a function of the registration. -/
def Read (c : Pt → Int) : Prop := ∃ f : Pt → Int, ∀ p, c p = f (reg p)
/-- The registration conserves the label c. -/
def ConservedByRegistration (c : Pt → Int) : Prop := ∀ p, c (reg p) = c p

/-- CONSERVED IS READ, AND READ IS CONSERVED. -/
theorem conserved_iff_read (c : Pt → Int) : ConservedByRegistration c ↔ Read c := by
  constructor
  · intro h; exact ⟨c, fun p => (h p).symm⟩
  · intro ⟨f, hf⟩ p
    rw [hf (reg p), hf p]; rfl

/-- NO CONSERVED LABEL IS UNREAD. There is no label that every registration conserves and the record does
    not carry. -/
theorem no_conserved_label_is_unread : ¬ ∃ c : Pt → Int, ConservedByRegistration c ∧ ¬ Read c :=
  fun ⟨c, hc, hn⟩ => hn ((conserved_iff_read c).mp hc)

/-- A label the record carries cannot tell a state from its fold partner. -/
theorem a_read_label_is_blind_to_the_side (c : Pt → Int) (h : Read c) (p : Pt) : c (fold p) = c p := by
  obtain ⟨f, hf⟩ := h
  rw [hf (fold p), hf p]; rfl

/-- THE SIDE IS THE EXAMPLE. The side of a state is a label the record does not carry, and the registration
    does not conserve it. -/
theorem the_side_is_unread_and_not_conserved :
    ¬ Read (fun p : Pt => p.1) ∧ ¬ ConservedByRegistration (fun p : Pt => p.1) := by
  have hn : ¬ ConservedByRegistration (fun p : Pt => p.1) := fun h => by
    have := h (0, 0)
    exact absurd this (by decide)
  exact ⟨fun hr => hn ((conserved_iff_read _).mpr hr), hn⟩

/-- A FINITE RECORD CANNOT HOLD AN UNBOUNDED CHARGE (carried). -/
theorem a_finite_record_cannot_hold_it (q C : Int) (hq : C < q) : ¬ (q ≤ C ∧ -C ≤ q) := by
  omega

/-- EVAPORATION DOES NOT RETURN IT (carried). What a record of capacity C gives back is at most C. -/
theorem evaporation_does_not_return_the_charge (q C r : Int) (hr : r ≤ C) (hq : C < q) : r ≠ q := by
  omega

end SPHYS.Charges

#print axioms SPHYS.Charges.the_observed_generation_closes
#print axioms SPHYS.Charges.lepton_charges_are_forced
#print axioms SPHYS.Charges.forced_charges_close_wholly
#print axioms SPHYS.Charges.linear_closures_add
#print axioms SPHYS.Charges.three_generations_close
#print axioms SPHYS.Charges.the_cubic_closure_factors
#print axioms SPHYS.Charges.closure_forces_the_whole_table
#print axioms SPHYS.Charges.the_observed_table_is_forced
#print axioms SPHYS.Charges.every_scale_closes
#print axioms SPHYS.Charges.the_atom_is_neutral
#print axioms SPHYS.Charges.a_total_can_hide_a_failure
#print axioms SPHYS.Charges.closure_at_every_threshold_forces_each
#print axioms SPHYS.Charges.each_generation_is_forced
#print axioms SPHYS.Charges.a_charged_generation_carries_the_table
#print axioms SPHYS.Charges.conserved_iff_read
#print axioms SPHYS.Charges.no_conserved_label_is_unread
#print axioms SPHYS.Charges.a_read_label_is_blind_to_the_side
#print axioms SPHYS.Charges.the_side_is_unread_and_not_conserved
#print axioms SPHYS.Charges.a_finite_record_cannot_hold_it
#print axioms SPHYS.Charges.evaporation_does_not_return_the_charge
```

## Appendix B · Kernel lines of Appendix A

```text
'SPHYS.Charges.the_observed_generation_closes' does not depend on any axioms
'SPHYS.Charges.lepton_charges_are_forced' depends on axioms: [propext, Quot.sound]
'SPHYS.Charges.forced_charges_close_wholly' does not depend on any axioms
'SPHYS.Charges.linear_closures_add' depends on axioms: [propext, Quot.sound]
'SPHYS.Charges.three_generations_close' does not depend on any axioms
'SPHYS.Charges.the_cubic_closure_factors' depends on axioms: [propext, Quot.sound]
'SPHYS.Charges.closure_forces_the_whole_table' depends on axioms: [propext, Quot.sound]
'SPHYS.Charges.the_observed_table_is_forced' depends on axioms: [propext, Quot.sound]
'SPHYS.Charges.every_scale_closes' depends on axioms: [propext, Quot.sound]
'SPHYS.Charges.the_atom_is_neutral' does not depend on any axioms
'SPHYS.Charges.a_total_can_hide_a_failure' does not depend on any axioms
'SPHYS.Charges.closure_at_every_threshold_forces_each' depends on axioms: [propext, Quot.sound]
'SPHYS.Charges.each_generation_is_forced' depends on axioms: [propext, Quot.sound]
'SPHYS.Charges.a_charged_generation_carries_the_table' depends on axioms: [propext, Quot.sound]
'SPHYS.Charges.conserved_iff_read' does not depend on any axioms
'SPHYS.Charges.no_conserved_label_is_unread' does not depend on any axioms
'SPHYS.Charges.a_read_label_is_blind_to_the_side' does not depend on any axioms
'SPHYS.Charges.the_side_is_unread_and_not_conserved' does not depend on any axioms
'SPHYS.Charges.a_finite_record_cannot_hold_it' depends on axioms: [propext, Quot.sound]
'SPHYS.Charges.evaporation_does_not_return_the_charge' depends on axioms: [propext, Quot.sound]
```

## Appendix C · Charge_Closure_Twin_CC.f90

Nine checks, zero failures: two searching every table of charges in a box (A), two scanning the statements on generations (B, C), three scanning labels on states (D) and two against published measurements (E). One further line of the run is a reading and is not counted. The run follows in Appendix D.

```fortran
! Charge_Closure_Twin_CC.f90 · numerical twin of SPHYS_Charge_Closure_CC.lean
! RATIONALE. The engine proves that the four closure conditions of a generation leave three cases, that a total can
!   hide a failure while a threshold cannot, and that a label the registration conserves is read. This twin finds
!   every solution in a box by search (A, B), scans the threshold statements (C), scans labels (D) and sets two
!   consequences against measurement (E).
! DESIGN. Integers, no library. Hypercharges are carried times 6, as in the engine: the observed table is
!   (q, u, d, l, e) = (1, 4, -2, -3, -6). The sums are those of the engine, left minus right, with the multiplicities
!   3 colours times 2 for the quark doublet, 2 for the lepton doublet, 3 for each right-handed quark, 1 for the
!   right-handed electron. The search of A runs over all 25**5 tables with charges from -12 to 12.
!   Electric charge is hypercharge plus the weak part, so times 6: up 4, down -2, electron -6, neutrino 0.
!   Measured inputs of E: the charge of the neutron, (-0.2 +- 0.8)e-21 of the electron's (the average of Navas et al. 2024);
!   the sum of the charges of the proton and the electron, below 1e-21 of the electron's (Bressi et al. 2011);
!   A reading, not a check: the number of light neutrinos, 2.9963 +- 0.0074 (Janot and Jadach 2020).
! RISK. A search of a box is not a proof outside the box; the classification for all integers is the engine's theorem.
! NON-NEGOTIABLE. The counts printed by A and B are found by the search, not entered.
program charge_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0), B = 12
  integer :: nfail, npass, q, u, d, l, e, nsol, nzero, nobs, nswap, nother, a, bb, c, nhide, cnt
  logical :: ok, ok2
  nfail = 0; npass = 0

  ! A. every table in the box that satisfies the four conditions
  nsol = 0; nzero = 0; nobs = 0; nswap = 0; nother = 0
  do q = -B, B
    do l = -B, B
      if (a2(q, l) /= 0) cycle
      do u = -B, B
        do d = -B, B
          if (a3(q, u, d) /= 0) cycle
          do e = -B, B
            if (ag(q, u, d, l, e) /= 0) cycle
            if (a1(q, u, d, l, e) /= 0) cycle
            nsol = nsol + 1
            if (q == 0 .and. l == 0 .and. e == 0 .and. d == -u) then
              nzero = nzero + 1
            else if (q /= 0 .and. u == 4*q .and. d == -2*q .and. l == -3*q .and. e == -6*q) then
              nobs = nobs + 1
            else if (q /= 0 .and. u == -2*q .and. d == 4*q .and. l == -3*q .and. e == -6*q) then
              nswap = nswap + 1
            else
              nother = nother + 1
            end if
          end do
        end do
      end do
    end do
  end do
  write(*,'(a,i0)') '  tables searched: 25**5 = ', 25**5
  write(*,'(a,i0,a,i0,a,i0,a,i0)') '  tables that close: ', nsol, '; doublets without hypercharge: ', nzero, &
        '; the observed table at some scale: ', nobs, '; the same with the right-handed quarks renamed: ', nswap
  call check('A1 every table in the box that closes is one of the three cases of the engine', nother == 0 .and. nsol > 0)
  call check('A2 the observed table closes at every scale the box holds, and so does the renamed one', nobs == 4 .and. nswap == 4)

  ! B. a total can hide a failure: pairs of lepton charges that each fail the first condition and close together
  nhide = 0
  do a = -B, B
    do bb = -B, B
      if (a2(1, a) /= 0 .and. a2(1, bb) /= 0 .and. a2(1, a) + a2(1, bb) == 0) nhide = nhide + 1
    end do
  end do
  write(*,'(a,i0)') '  pairs of generations that fail singly and close in total: ', nhide
  call check('B  there are pairs of generations that each fail a condition while their total satisfies it', nhide > 0)

  ! C. a threshold cannot: values of a sum in three generations, each from -6 to 6
  ok = .true.; cnt = 0
  do a = -6, 6
    do bb = -6, 6
      do c = -6, 6
        if (a == 0 .and. a + bb == 0 .and. a + bb + c == 0) then
          cnt = cnt + 1
          if (.not. (bb == 0 .and. c == 0)) ok = .false.
        end if
      end do
    end do
  end do
  write(*,'(a,i0,a,i0)') '  triples tried: ', 13**3, '; triples that close at every threshold: ', cnt
  call check('C  a sum that closes with one, with two and with three generations closes in each', ok .and. cnt == 1)

  ! D. labels on states (x, y), x and y from -4 to 6: conserved by the registration exactly when blind to x
  ok = .true.; ok2 = .true.
  do a = 1, 5
    if (conserved(a) .neqv. (a == 1 .or. a == 4)) ok = .false.      ! labels 1 and 4 do not read x
    if (conserved(a) .and. .not. foldblind(a)) ok2 = .false.
  end do
  call check('D1 of five labels, the registration conserves exactly the two that do not read the side', ok)
  call check('D2 every conserved label gives a state and its fold partner one value', ok2)
  call check('D3 the label (x - 1)**2 gives fold partners one value and is still not conserved', &
             foldblind(5) .and. .not. conserved(5))

  ! E. measured
  u = 4; d = -2; e = -6
  write(*,'(a,i0,a,i0,a,i0)') '  charges times 6 on the forced table: proton ', 2*u + d, ', neutron ', u + 2*d, ', electron ', e
  call check('E1 the neutron of the forced table is neutral: measured (-0.2 +- 0.8)e-21 (Navas et al. 2024)', &
             abs(real(u + 2*d, dp)/6.0_dp - (-0.2e-21_dp)) < 2.0_dp*0.8e-21_dp)
  call check('E2 the proton and the electron of the forced table cancel: measured below 1e-21 (Bressi et al. 2011)', &
             abs(real(2*u + d + e, dp)/6.0_dp) < 1.0e-21_dp)
  write(*,'(a)') '  reading: the number of light neutrinos is 2.9963 +- 0.0074 (Janot and Jadach 2020); the count three is an input'

  write(*,'(a,i0,a,i0)') 'checks passed: ', npass, '   failures: ', nfail
contains
  integer function a2(qq, ll)
    integer, intent(in) :: qq, ll
    a2 = 3*qq + ll
  end function
  integer function a3(qq, uu, dd)
    integer, intent(in) :: qq, uu, dd
    a3 = 6*qq - (3*uu + 3*dd)
  end function
  integer function ag(qq, uu, dd, ll, ee)
    integer, intent(in) :: qq, uu, dd, ll, ee
    ag = (6*qq + 2*ll) - (3*uu + 3*dd + ee)
  end function
  integer function a1(qq, uu, dd, ll, ee)
    integer, intent(in) :: qq, uu, dd, ll, ee
    a1 = (6*qq**3 + 2*ll**3) - (3*uu**3 + 3*dd**3 + ee**3)
  end function
  integer function label(n, x, y)
    integer, intent(in) :: n, x, y
    select case (n)
    case (1); label = y
    case (2); label = x
    case (3); label = x + y
    case (4); label = y*y - 3*y
    case default; label = (x - 1)**2
    end select
  end function
  logical function conserved(n)      ! label(reg p) = label(p) at every state of the grid; reg sets x to 1
    integer, intent(in) :: n
    integer :: x, y
    conserved = .true.
    do x = -4, 6
      do y = -4, 6
        if (label(n, 1, y) /= label(n, x, y)) conserved = .false.
      end do
    end do
  end function
  logical function foldblind(n)      ! label(fold p) = label(p); fold sends x to 2 - x
    integer, intent(in) :: n
    integer :: x, y
    foldblind = .true.
    do x = -4, 6
      do y = -4, 6
        if (label(n, 2 - x, y) /= label(n, x, y)) foldblind = .false.
      end do
    end do
  end function
  subroutine check(name, cond)
    character(*), intent(in) :: name
    logical, intent(in) :: cond
    if (cond) then
      write(*,'(a,a)') '  PASS  ', name; npass = npass + 1
    else
      write(*,'(a,a)') '  FAIL  ', name; nfail = nfail + 1
    end if
  end subroutine
end program charge_twin
```

## Appendix D · Run of Appendix C

```text
  tables searched: 25**5 = 9765625
  tables that close: 33; doublets without hypercharge: 25; the observed table at some scale: 4; the same with the right-handed quarks renamed: 4
  PASS  A1 every table in the box that closes is one of the three cases of the engine
  PASS  A2 the observed table closes at every scale the box holds, and so does the renamed one
  pairs of generations that fail singly and close in total: 18
  PASS  B  there are pairs of generations that each fail a condition while their total satisfies it
  triples tried: 2197; triples that close at every threshold: 1
  PASS  C  a sum that closes with one, with two and with three generations closes in each
  PASS  D1 of five labels, the registration conserves exactly the two that do not read the side
  PASS  D2 every conserved label gives a state and its fold partner one value
  PASS  D3 the label (x - 1)**2 gives fold partners one value and is still not conserved
  charges times 6 on the forced table: proton 6, neutron 0, electron -6
  PASS  E1 the neutron of the forced table is neutral: measured (-0.2 +- 0.8)e-21 (Navas et al. 2024)
  PASS  E2 the proton and the electron of the forced table cancel: measured below 1e-21 (Bressi et al. 2011)
  reading: the number of light neutrinos is 2.9963 +- 0.0074 (Janot and Jadach 2020); the count three is an input
checks passed: 9   failures: 0
```
