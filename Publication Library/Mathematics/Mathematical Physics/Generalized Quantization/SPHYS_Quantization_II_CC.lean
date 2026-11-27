import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Algebra.Module.LinearMap.End
import Mathlib.Algebra.Star.Basic
import Mathlib.GroupTheory.Perm.Basic
import Mathlib.Tactic.Ring

/-! # SPHYS_Quantization_II_CC.lean · GENERALIZED QUANTIZATION, SECOND KERNEL (26 November 2026, _CC)

RATIONALE. The first kernel proves the theorem for one fold, an involution. This kernel widens it from first
  principles, each part answering a limit the first edition names of itself.
DESIGN.
  Part I   ANY SYMMETRY, AND THE FINEST REGISTRATION. The fold is replaced by any family of maps of the set, with no
           structure asked of it: an involution, a group, a gauge family are all cases. The orbit map is proved to
           be a registration through which every other registration factors.
  Part II  IDENTICAL QUANTA. The maps are the relabellings of n quanta; the occupation numbers are kept; the fixed
           configurations are those with every quantum in one mode.
  Part III AN ODD READING SUMS TO ZERO. A finite configuration closed under a fold has zero total of every reading
           the fold reverses, where the values have no element of order two. For particles: matter with its
           antimatter is neutral as a whole.
  Part IV  WHERE ISOLATED VALUES COME FROM. A label of a linear symmetry of period n is an n-th root of one, and
           there are at most n of them. The isolation of the values is derived from the period. It is not assumed.
  Part V   THE SPECTRAL SEAT. For an operator symmetric under a form, every registration (eigenvalue) on a state of
           nonzero norm is fixed by conjugation, and two such states with different registrations are orthogonal.
  Part VI  GRAVITY'S WAVE. Two polarisations, parity as the fold, the energy as the registration.
STANDING. Parts I to V are proved for every set, family, ring, field, module and form of the stated kind. Parts
  III (particles) and VI are proved in printed models.
WHAT IS NOT CLAIMED. No constant is derived. Part IV derives that the labels of a linear symmetry of finite period
  are isolated and at most n; it does not derive which symmetry nature has. Part V does not construct any operator.
RISK. Part II proves that the occupation numbers are kept and where relabelling fixes a configuration. That they
  are the finest registration of the relabellings is proved in SPHYS_Field_Quantization_CC.lean, Part XV, and the
  symmetry with no finite period, which Part IV leaves, is proved there too.
NON-NEGOTIABLE. No axiom declared, no `sorry`, every cone pinned at the end of the file. -/

set_option autoImplicit false

namespace SPHYS.QuantizationII

/-- A reading counts a configuration when it gives no two members the same value. -/
def Counts {X Y : Type} (r : X → Y) (S : X → Prop) : Prop := ∀ a b, S a → S b → r a = r b → a = b

/-! ## PART I · ANY SYMMETRY, AND THE FINEST REGISTRATION -/
section Moves
variable {X ι : Type} (Φ : ι → X → X)

/-- The orbits: the set with every point identified with each of its images. -/
def Orb : Type := Quot (fun a b : X => ∃ i, b = Φ i a)

/-- The orbit map. -/
def orb (a : X) : Orb Φ := Quot.mk _ a

/-- THE ORBIT MAP IS A REGISTRATION: every map of the family keeps it. -/
theorem the_orbit_map_is_a_registration (i : ι) (a : X) : orb Φ (Φ i a) = orb Φ a :=
  (Quot.sound ⟨i, rfl⟩).symm

/-- EVERY REGISTRATION FACTORS THROUGH THE ORBIT MAP. Whatever the reading and whatever its values. -/
theorem every_registration_factors_through_the_orbit_map {Y : Type} (r : X → Y)
    (kept : ∀ i a, r (Φ i a) = r a) : ∃ f : Orb Φ → Y, ∀ a, r a = f (orb Φ a) :=
  ⟨Quot.lift r (fun a b ⟨i, h⟩ => by rw [h, kept]), fun _ => rfl⟩

/-- A REGISTRATION COUNTS ONLY IF THE ORBIT MAP COUNTS. One object stands for every reading, present or future. -/
theorem a_registration_counts_only_if_the_orbit_map_counts {Y : Type} (r : X → Y)
    (kept : ∀ i a, r (Φ i a) = r a) (S : X → Prop) (count : Counts r S) : Counts (orb Φ) S := by
  obtain ⟨f, hf⟩ := every_registration_factors_through_the_orbit_map Φ r kept
  intro a b ha hb h
  exact count a b ha hb (by rw [hf a, hf b, h])

/-- FORM AND WITNESS PUT EVERY EXISTENT ON THE FIXED SET OF THE WHOLE FAMILY. -/
theorem form_and_witness_put_every_existent_on_the_fixed_set {Y : Type} (r : X → Y)
    (kept : ∀ i a, r (Φ i a) = r a) (S : X → Prop) (form : ∀ i a, S a → S (Φ i a)) (count : Counts r S) :
    ∀ a, S a → ∀ i, Φ i a = a :=
  fun a ha i => count _ _ (form i a ha) ha (kept i a)

/-- ONE MOVED EXISTENT ENDS EVERY COUNT. A configuration that holds a point and one of its images, the two being
    two, is counted by no registration. A registration counts at most one point of each orbit. -/
theorem one_moved_existent_ends_every_count {Y : Type} (r : X → Y) (kept : ∀ i a, r (Φ i a) = r a)
    (S : X → Prop) (a : X) (ha : S a) (i : ι) (hm : S (Φ i a)) (off : Φ i a ≠ a) : ¬ Counts r S :=
  fun count => off (count _ _ hm ha (kept i a))

end Moves

/-! ## PART II · IDENTICAL QUANTA -/
section Quanta
variable {n : ℕ} {M : Type}

/-- Relabelling n quanta: the same assignment of modes, read through a permutation of the labels. -/
def relabel (π : Equiv.Perm (Fin n)) (x : Fin n → M) : Fin n → M := fun i => x (π i)

/-- The occupation number of a mode: how many quanta are in it. -/
def occupation [DecidableEq M] (x : Fin n → M) (m : M) : ℕ := (Finset.univ.filter (fun i => x i = m)).card

/-- RELABELLING KEEPS THE OCCUPATION NUMBERS. -/
theorem relabelling_keeps_the_occupation_numbers [DecidableEq M] (π : Equiv.Perm (Fin n)) (x : Fin n → M) :
    occupation (relabel π x) = occupation x := by
  funext m
  unfold occupation relabel
  exact Finset.card_bij (fun i _ => π i) (fun i hi => by simpa using hi)
    (fun _ _ _ _ h => π.injective h)
    (fun j hj => ⟨π.symm j, by simpa using hj, by simp⟩)

/-- FIXED BY EVERY RELABELLING EXACTLY WHEN ALL QUANTA ARE IN ONE MODE. -/
theorem fixed_by_every_relabelling_iff_one_mode (x : Fin n → M) :
    (∀ π, relabel π x = x) ↔ ∀ i j, x i = x j := by
  constructor
  · intro h i j
    have e := congrFun (h (Equiv.swap i j)) i
    unfold relabel at e
    rw [Equiv.swap_apply_left] at e
    exact e.symm
  · intro h π
    funext i
    exact h _ _

/-- THE OCCUPATION NUMBERS COUNT ONLY ONE MODE. A configuration of assignments closed under relabelling and counted
    by the occupation numbers holds only assignments with every quantum in one mode. -/
theorem the_occupation_numbers_count_only_one_mode [DecidableEq M] (S : (Fin n → M) → Prop)
    (form : ∀ π x, S x → S (relabel π x)) (count : Counts (occupation (n := n) (M := M)) S) :
    ∀ x, S x → ∀ i j, x i = x j :=
  fun x hx => (fixed_by_every_relabelling_iff_one_mode x).mp
    (form_and_witness_put_every_existent_on_the_fixed_set relabel occupation
      relabelling_keeps_the_occupation_numbers S form count x hx)

/-- QUANTA IN TWO MODES ARE MANY ON ONE OCCUPATION. Exchanging two quanta that sit in different modes gives a
    second assignment with the same occupation numbers. -/
theorem quanta_in_two_modes_are_many_on_one_occupation [DecidableEq M] (x : Fin n → M) (i j : Fin n)
    (h : x i ≠ x j) :
    relabel (Equiv.swap i j) x ≠ x ∧ occupation (relabel (Equiv.swap i j) x) = occupation x :=
  ⟨fun e => h (by
      have t := congrFun e i
      unfold relabel at t
      rw [Equiv.swap_apply_left] at t
      exact t.symm),
   relabelling_keeps_the_occupation_numbers _ _⟩

end Quanta

/-! ## PART III · AN ODD READING SUMS TO ZERO -/

/-- AN ODD READING SUMS TO ZERO. In a finite configuration closed under an involution, every reading the involution
    reverses has total zero, where the values have no element of additive order two. -/
theorem an_odd_reading_sums_to_zero {X A : Type} [AddCommGroup A] (two : ∀ x : A, x + x = 0 → x = 0)
    (σ : X → X) (inv : ∀ a, σ (σ a) = a) (f : X → A) (odd : ∀ a, f (σ a) = -f a) (s : Finset X)
    (form : ∀ a ∈ s, σ a ∈ s) : ∑ a ∈ s, f a = 0 :=
  Finset.sum_involution (fun a _ => σ a)
    (fun a _ => show f a + f (σ a) = 0 by rw [odd, add_neg_cancel])
    (fun a _ hne (hfix : σ a = a) => hne (two _ (by
      have e := odd a
      rw [hfix] at e
      calc f a + f a = f a + -f a := by rw [← e]
        _ = 0 := add_neg_cancel _)))
    (fun a ha => form a ha) (fun a _ => inv a)

/-- An energy: a frequency and a rate of decay. -/
structure Energy where
  freq : Int
  rate : Int
deriving DecidableEq

/-- A particle: four additive charges and an energy. -/
structure Particle where
  q3 : Int
  colour : Int
  b3 : Int
  lepton : Int
  energy : Energy
deriving DecidableEq

/-- The particle map: every charge reversed, the energy kept. -/
def bar (c : Particle) : Particle := ⟨-c.q3, -c.colour, -c.b3, -c.lepton, c.energy⟩

theorem bar_involutive (c : Particle) : bar (bar c) = c := by
  cases c; simp [bar]

/-- MATTER WITH ITS ANTIMATTER IS NEUTRAL AS A WHOLE. A finite configuration that holds the antiparticle of each
    member has every charge summing to zero. -/
theorem matter_with_its_antimatter_is_neutral_as_a_whole (s : Finset Particle) (form : ∀ c ∈ s, bar c ∈ s) :
    ∑ c ∈ s, c.q3 = 0 ∧ ∑ c ∈ s, c.colour = 0 ∧ ∑ c ∈ s, c.b3 = 0 ∧ ∑ c ∈ s, c.lepton = 0 :=
  have two : ∀ x : Int, x + x = 0 → x = 0 := fun x h => by omega
  ⟨an_odd_reading_sums_to_zero two bar bar_involutive _ (fun _ => rfl) s form,
   an_odd_reading_sums_to_zero two bar bar_involutive _ (fun _ => rfl) s form,
   an_odd_reading_sums_to_zero two bar bar_involutive _ (fun _ => rfl) s form,
   an_odd_reading_sums_to_zero two bar bar_involutive _ (fun _ => rfl) s form⟩

/-! ## PART IV · WHERE ISOLATED VALUES COME FROM -/
section Period
variable {K V : Type} [Field K] [AddCommGroup V] [Module K V]

/-- A LABEL OF A PERIODIC SYMMETRY IS A ROOT OF ONE. If a linear symmetry returns to the identity after n steps,
    every label it gives a nonzero state satisfies `label ^ n = 1`. -/
theorem a_label_of_a_periodic_symmetry_is_a_root_of_one (T : V →ₗ[K] V) (n : ℕ) (period : T ^ n = 1) (v : V)
    (hv : v ≠ 0) (lam : K) (h : T v = lam • v) : lam ^ n = 1 := by
  have key : ∀ k : ℕ, (T ^ k) v = lam ^ k • v := by
    intro k
    induction k with
    | zero => simp
    | succ k ih =>
      rw [pow_succ, Module.End.mul_apply, h, map_smul, ih, smul_smul]
      congr 1
      ring
  have e := key n
  rw [period, Module.End.one_apply] at e
  have z : (lam ^ n - 1) • v = 0 := by rw [sub_smul, one_smul, ← e, sub_self]
  rcases smul_eq_zero.mp z with h0 | h0
  · exact sub_eq_zero.mp h0
  · exact absurd h0 hv

/-- A SYMMETRY OF PERIOD n HAS AT MOST n LABELS. The values of its registration are isolated and counted by the
    period. Nothing discrete was assumed. -/
theorem a_symmetry_of_period_n_has_at_most_n_labels (n : ℕ) (hn : 0 < n) (L : Finset K)
    (hL : ∀ x ∈ L, x ^ n = 1) : L.card ≤ n := by
  classical
  have sub : L ⊆ Polynomial.nthRootsFinset n (1 : K) :=
    fun x hx => (Polynomial.mem_nthRootsFinset hn 1).mpr (hL x hx)
  refine (Finset.card_le_card sub).trans ?_
  rw [Polynomial.nthRootsFinset_def]
  exact (Multiset.toFinset_card_le _).trans (Polynomial.card_nthRoots n 1)

end Period

/-! ## PART V · THE SPECTRAL SEAT -/
section Spectral
variable {K V : Type} [Field K] [StarRing K] [AddCommGroup V] [Module K V]

/-- A form on states: a scalar comes out of the second place unchanged and out of the first conjugated. Additivity
    is not asked. -/
structure Form (K V : Type) [Field K] [StarRing K] [AddCommGroup V] [Module K V] where
  ip : V → V → K
  right : ∀ (u v : V) (c : K), ip u (c • v) = c * ip u v
  left : ∀ (u v : V) (c : K), ip (c • u) v = star c * ip u v

/-- THE REGISTRATIONS OF AN OBSERVABLE ARE ON THE LINE. For an operator symmetric under the form, the registration
    it gives a state of nonzero norm is fixed by conjugation. -/
theorem the_registrations_of_an_observable_are_on_the_line (B : Form K V) (T : V → V)
    (sym : ∀ u v, B.ip (T u) v = B.ip u (T v)) (v : V) (lam : K) (h : T v = lam • v)
    (norm : B.ip v v ≠ 0) : star lam = lam := by
  have e := sym v v
  rw [h, B.left, B.right] at e
  exact mul_right_cancel₀ norm e

/-- STATES WITH DIFFERENT REGISTRATIONS ARE ORTHOGONAL. The registration tells the states apart, and the form
    reads the difference as zero overlap. -/
theorem states_with_different_registrations_are_orthogonal (B : Form K V) (T : V → V)
    (sym : ∀ u v, B.ip (T u) v = B.ip u (T v)) (u v : V) (mu lam : K) (hu : T u = mu • u)
    (hv : T v = lam • v) (real : star mu = mu) (ne : mu ≠ lam) : B.ip u v = 0 := by
  have e := sym u v
  rw [hu, hv, B.left, B.right, real] at e
  have z : (mu - lam) * B.ip u v = 0 := by rw [sub_mul, e, sub_self]
  rcases mul_eq_zero.mp z with h0 | h0
  · exact absurd (sub_eq_zero.mp h0) ne
  · exact h0

end Spectral

/-! ## PART VI · GRAVITY'S WAVE -/

/-- A plane gravitational wave: its two polarisations. -/
structure Wave where
  plus : Int
  cross : Int
deriving DecidableEq

/-- Parity: the cross polarisation reversed. It exchanges the two helicities. -/
def parity (w : Wave) : Wave := ⟨w.plus, -w.cross⟩

/-- The energy of the wave: the sum of the squares of its two polarisations. -/
def waveEnergy (w : Wave) : Int := w.plus * w.plus + w.cross * w.cross

theorem parity_involutive (w : Wave) : parity (parity w) = w := by
  cases w; simp [parity]

theorem parity_fixed_iff_no_cross (w : Wave) : parity w = w ↔ w.cross = 0 := by
  cases w with
  | mk p c =>
    show (⟨p, -c⟩ : Wave) = ⟨p, c⟩ ↔ c = 0
    constructor
    · intro h
      have hc : -c = c := congrArg Wave.cross h
      omega
    · intro h; subst h; rfl

/-- PARITY KEEPS THE ENERGY OF THE WAVE. -/
theorem parity_keeps_the_energy (w : Wave) : waveEnergy (parity w) = waveEnergy w := by
  cases w; simp [waveEnergy, parity]

/-- EVERY READING PARITY KEEPS COUNTS ONLY THE WAVES WITH NO CROSS PART. -/
theorem every_parity_kept_reading_counts_only_the_plus_waves {Y : Type} (r : Wave → Y)
    (kept : ∀ w, r (parity w) = r w) (S : Wave → Prop) (form : ∀ w, S w → S (parity w))
    (count : Counts r S) : ∀ w, S w → w.cross = 0 :=
  fun w hw => (parity_fixed_iff_no_cross w).mp (count _ _ (form w hw) hw (kept w))

/-- THE TWO HELICITIES ARE TWO ON ONE ENERGY. A wave with a cross part and its mirror are two waves, and the
    energy reads them alike. -/
theorem the_two_helicities_are_two_on_one_energy (w : Wave) (h : w.cross ≠ 0) :
    parity w ≠ w ∧ waveEnergy (parity w) = waveEnergy w :=
  ⟨fun e => h ((parity_fixed_iff_no_cross w).mp e), parity_keeps_the_energy w⟩

end SPHYS.QuantizationII

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.QuantizationII.the_orbit_map_is_a_registration' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms SPHYS.QuantizationII.the_orbit_map_is_a_registration
/-- info: 'SPHYS.QuantizationII.every_registration_factors_through_the_orbit_map' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.QuantizationII.every_registration_factors_through_the_orbit_map
/-- info: 'SPHYS.QuantizationII.a_registration_counts_only_if_the_orbit_map_counts' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.QuantizationII.a_registration_counts_only_if_the_orbit_map_counts
/-- info: 'SPHYS.QuantizationII.form_and_witness_put_every_existent_on_the_fixed_set' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.QuantizationII.form_and_witness_put_every_existent_on_the_fixed_set
/-- info: 'SPHYS.QuantizationII.one_moved_existent_ends_every_count' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.QuantizationII.one_moved_existent_ends_every_count
/--
info: 'SPHYS.QuantizationII.relabelling_keeps_the_occupation_numbers' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.relabelling_keeps_the_occupation_numbers
/-- info: 'SPHYS.QuantizationII.fixed_by_every_relabelling_iff_one_mode' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.QuantizationII.fixed_by_every_relabelling_iff_one_mode
/--
info: 'SPHYS.QuantizationII.the_occupation_numbers_count_only_one_mode' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.the_occupation_numbers_count_only_one_mode
/--
info: 'SPHYS.QuantizationII.quanta_in_two_modes_are_many_on_one_occupation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.quanta_in_two_modes_are_many_on_one_occupation
/--
info: 'SPHYS.QuantizationII.an_odd_reading_sums_to_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.an_odd_reading_sums_to_zero
/-- info: 'SPHYS.QuantizationII.bar_involutive' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.QuantizationII.bar_involutive
/--
info: 'SPHYS.QuantizationII.matter_with_its_antimatter_is_neutral_as_a_whole' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.matter_with_its_antimatter_is_neutral_as_a_whole
/--
info: 'SPHYS.QuantizationII.a_label_of_a_periodic_symmetry_is_a_root_of_one' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.a_label_of_a_periodic_symmetry_is_a_root_of_one
/--
info: 'SPHYS.QuantizationII.a_symmetry_of_period_n_has_at_most_n_labels' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.a_symmetry_of_period_n_has_at_most_n_labels
/--
info: 'SPHYS.QuantizationII.the_registrations_of_an_observable_are_on_the_line' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.the_registrations_of_an_observable_are_on_the_line
/--
info: 'SPHYS.QuantizationII.states_with_different_registrations_are_orthogonal' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.states_with_different_registrations_are_orthogonal
/-- info: 'SPHYS.QuantizationII.parity_involutive' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.QuantizationII.parity_involutive
/-- info: 'SPHYS.QuantizationII.parity_fixed_iff_no_cross' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.QuantizationII.parity_fixed_iff_no_cross
/-- info: 'SPHYS.QuantizationII.parity_keeps_the_energy' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.QuantizationII.parity_keeps_the_energy
/--
info: 'SPHYS.QuantizationII.every_parity_kept_reading_counts_only_the_plus_waves' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.every_parity_kept_reading_counts_only_the_plus_waves
/-- info: 'SPHYS.QuantizationII.the_two_helicities_are_two_on_one_energy' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.QuantizationII.the_two_helicities_are_two_on_one_energy
