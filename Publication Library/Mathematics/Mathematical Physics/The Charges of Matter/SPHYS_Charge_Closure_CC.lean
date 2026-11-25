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
