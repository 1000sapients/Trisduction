/-
RA_Li_Bridge.lean · the bridge from RA's positivity to Li positivity on ζ, typed.
Nothing here is an axiom. RA, Li's criterion, and the bridge enter as hypotheses,
so #print axioms shows exactly what the kernel used. ΔM = 0.
-/

namespace RALi

/-- The existents and their energies, as in ROOT, but as parameters. -/
structure Substrate where
  U  : Type
  ΔE : U → Int

/-- RA as a hypothesis on a substrate: to exist is to actuate. -/
def RA (S : Substrate) : Prop := ∀ x : S.U, 0 < S.ΔE x

/-- An L-function reduced to what Li's criterion reads: its RH, and the
    sign bit of each Li coefficient λₙ (n ≥ 1). -/
structure LiData where
  RH      : Prop
  nonneg  : Nat → Prop

/-- Li 1997 (Bombieri-Lagarias 1999 for the general case), cited, not proved:
    RH ↔ every λₙ ≥ 0. Carried as a hypothesis on the data. -/
def LiCriterion (L : LiData) : Prop := L.RH ↔ ∀ n, 1 ≤ n → L.nonneg n

/-- THE BRIDGE. One existent per Li step, and a reading that turns its
    positive energy into the sign of λₙ. The whole content lives in `read`. -/
structure Bridge (S : Substrate) (L : LiData) where
  φ    : Nat → S.U
  read : ∀ n, 1 ≤ n → 0 < S.ΔE (φ n) → L.nonneg n

/-- 1. The bridge closes: RA, a bridge, and Li's criterion give RH. -/
theorem bridge_yields_RH (S : Substrate) (L : LiData)
    (hRA : RA S) (hLi : LiCriterion L) (B : Bridge S L) : L.RH :=
  hLi.mpr (fun n hn => B.read n hn (hRA (B.φ n)))

/-- 2. The bridge is keyed: RA alone never supplies it. A substrate where RA
    holds, paired with data carrying one negative λ, admits no bridge. -/
def oneEnergy : Substrate := ⟨Unit, fun _ => 1⟩
def badData : LiData := ⟨False, fun n => n ≠ 5⟩

theorem ra_holds_in_model : RA oneEnergy := fun _ => show (0 : Int) < 1 by decide

theorem bridge_is_keyed : RA oneEnergy ∧ ¬ Nonempty (Bridge oneEnergy badData) := by
  refine ⟨ra_holds_in_model, fun ⟨B⟩ => ?_⟩
  exact B.read 5 (by decide) (ra_holds_in_model (B.φ 5)) rfl

/-- 3. No uniform bridge. If the reading does not consume the L-function,
    it forces positivity on every member of the family. One member with a
    negative λ (the Eisenstein L-function ζ(s)ζ(s-k+1): Euler product and
    functional equation, zeros off its centre, so some λₙ < 0 by
    Bombieri-Lagarias) kills every uniform bridge. -/
structure UniformBridge (S : Substrate) (F : Type) (L : F → LiData) where
  φ    : Nat → S.U
  read : ∀ f n, 1 ≤ n → 0 < S.ΔE (φ n) → (L f).nonneg n

theorem no_uniform_bridge (S : Substrate) (F : Type) (L : F → LiData)
    (hRA : RA S) (hctl : ∃ f n, 1 ≤ n ∧ ¬ (L f).nonneg n) :
    ¬ Nonempty (UniformBridge S F L) := by
  intro ⟨B⟩
  obtain ⟨f, n, hn, hneg⟩ := hctl
  exact hneg (B.read f n hn (hRA (B.φ n)))

/-- 4. The type repair. The arrow supplies one bit; Li turns RH's vanishing
    into one sign bit per step. Given decidable signs, the Li family is a
    Nat → Bool, the shape the deed can supply, and RH is its constancy. -/
theorem li_is_a_bit_stream (L : LiData) (hLi : LiCriterion L)
    [dec : ∀ n, Decidable (L.nonneg n)] :
    L.RH ↔ ∀ n, 1 ≤ n → decide (L.nonneg n) = true := by
  refine hLi.trans ?_
  exact ⟨fun h n hn => decide_eq_true (h n hn), fun h n hn => of_decide_eq_true (h n hn)⟩

end RALi

#print axioms RALi.bridge_yields_RH
#print axioms RALi.bridge_is_keyed
#print axioms RALi.no_uniform_bridge
#print axioms RALi.li_is_a_bit_stream

/-! ## PART II · Does [Ξ₀] retire on the united register? -/
namespace RALi

inductive Grade | premise | structural | theorem deriving DecidableEq, Repr
def Grade.rank : Grade → Nat | .premise => 0 | .structural => 1 | .theorem => 2
def Grade.weakest (a b : Grade) : Grade := if a.rank ≤ b.rank then a else b

inductive Verdict | seal (g : Grade) | xi0 deriving DecidableEq, Repr

/-- The united register. Unity is the claim that the formal reading and the
    kinetic reading are one; on ζ it is stated as the supply of the bridge,
    carried at the grade of whatever supplies it. -/
structure Unity (S : Substrate) (L : LiData) where
  bridge : Bridge S L
  grade  : Grade

/-- The emitter on the formal string: with unity supplied, the verdict is a
    seal at the weakest grade on the chain; without it, [Ξ₀]. -/
def emit {S : Substrate} {L : LiData} : Option (Unity S L) → Verdict
  | some u => .seal (Grade.weakest u.grade .theorem)
  | none   => .xi0

/-- 5. [Ξ₀] retires exactly when unity is supplied, and the seal it becomes
    is sound: it carries RH. -/
theorem xi0_retires_iff_unity (S : Substrate) (L : LiData) (u : Option (Unity S L)) :
    emit u ≠ .xi0 ↔ u.isSome := by
  cases u <;> simp [emit]

theorem retired_seal_is_sound (S : Substrate) (L : LiData)
    (hRA : RA S) (hLi : LiCriterion L) (u : Unity S L) : L.RH :=
  bridge_yields_RH S L hRA hLi u.bridge

/-- 6. The grade law: the retired verdict is never stronger than its unity
    posit. A premise-grade unity yields a premise-grade seal. -/
theorem retired_grade_capped {S : Substrate} {L : LiData} (u : Unity S L) :
    emit (some u) = .seal (Grade.weakest u.grade .theorem) ∧
    (Grade.weakest u.grade .theorem).rank ≤ u.grade.rank := by
  refine ⟨rfl, ?_⟩
  cases h : u.grade <;> decide

/-- 7. Unity is not free: RA does not supply it (from theorem 2). -/
theorem unity_is_keyed : RA oneEnergy ∧ ¬ Nonempty (Unity oneEnergy badData) :=
  ⟨ra_holds_in_model, fun ⟨u⟩ => bridge_is_keyed.2 ⟨u.bridge⟩⟩

/-- 8. The Ghost. A reading that deletes the arrow returns one verdict for a
    claim and its negation: it cannot be a verdict on either. -/
def arrowDeleted (_ : Prop) : Verdict := .xi0
theorem ghost (P : Prop) : arrowDeleted P = arrowDeleted (¬ P) := rfl

end RALi

#print axioms RALi.xi0_retires_iff_unity
#print axioms RALi.retired_seal_is_sound
#print axioms RALi.retired_grade_capped
#print axioms RALi.unity_is_keyed
#print axioms RALi.ghost

/-! ## PART III · The try. Which Codex instruments can supply `Bridge.read` for ζ? -/
namespace RALi

/-- 9. The uniformity trap. A family of bridges that picks its existents
    without reading which L-function it serves is a uniform bridge. Every
    instrument carried at ΔM = 0 (the eliminator, the multi-recursion
    collapse, the one-bit species, the bare arrow) chooses its existents
    that way, so it lands here. -/
theorem common_phi_is_uniform (S : Substrate) (F : Type) (L : F → LiData)
    (φ₀ : Nat → S.U) (B : ∀ f, Bridge S (L f)) (hφ : ∀ f, (B f).φ = φ₀) :
    Nonempty (UniformBridge S F L) :=
  ⟨⟨φ₀, fun f n hn h => (B f).read n hn (by rw [hφ f]; exact h)⟩⟩

/-- 10. Hence dead: with RA and one family member carrying a negative λ,
    no ζ-blind choice of existents can serve every member. -/
theorem blind_constructions_die (S : Substrate) (F : Type) (L : F → LiData)
    (hRA : RA S) (hctl : ∃ f n, 1 ≤ n ∧ ¬ (L f).nonneg n)
    (φ₀ : Nat → S.U) : ¬ ∃ B : (∀ f, Bridge S (L f)), ∀ f, (B f).φ = φ₀ :=
  fun ⟨B, hφ⟩ => no_uniform_bridge S F L hRA hctl (common_phi_is_uniform S F L φ₀ B hφ)

/-- 11. What positivity on the Euler product does reach. Mertens' identity
    3 + 4 cos θ + cos 2θ = 2(1 + cos θ)² ≥ 0, with cos 2θ = 2c² − 1, is the
    positivity that yields ζ(1 + it) ≠ 0: the wall at Re = 1. Checked here on
    integer c as the polynomial identity it is. -/
theorem mertens_identity (c : Int) : 3 + 4 * c + (2 * c * c - 1) = 2 * ((1 + c) * (1 + c)) := by
  simp only [Int.add_mul, Int.mul_add, Int.one_mul, Int.mul_one, Int.mul_assoc]
  omega

theorem mertens_nonneg (c : Int) : 0 ≤ 3 + 4 * c + (2 * c * c - 1) := by
  rw [mertens_identity]
  refine Int.mul_nonneg (by decide) ?_
  rcases Int.le_total 0 (1 + c) with h | h
  · exact Int.mul_nonneg h h
  · have h' : 0 ≤ -(1 + c) := by omega
    have := Int.mul_nonneg h' h'
    rwa [Int.neg_mul_neg] at this

end RALi

#print axioms RALi.common_phi_is_uniform
#print axioms RALi.blind_constructions_die
#print axioms RALi.mertens_nonneg

/-! ## PART IV · Time, made exact. The Li modes on the Bridge plane.
A zero ρ = h/2 + i t sits at (h, t) in half-units, the Bridge plane, fold (h,t) ↦ (2-h, t).
Li's coefficient is λₙ = Σ_ρ [1 - zρⁿ] with the mode zρ = 1 - 1/ρ = (ρ-1)/ρ, so step
n ↦ n+1 multiplies each mode by zρ. |zρ|² = |ρ-1|²/|ρ|², scaled by 4:
  N1 = (h-2)² + 4t²,   N0 = h² + 4t².
A mode is unitary (perpetual, neither growing nor dying) iff N1 = N0; it grows iff N1 > N0. -/
namespace RALi

def N1 (h t : Int) : Int := (h - 2) * (h - 2) + 4 * (t * t)
def N0 (h t : Int) : Int := h * h + 4 * (t * t)

theorem N1_sub_N0 (h t : Int) : N1 h t - N0 h t = 4 - 4 * h := by
  simp only [N1, N0, Int.sub_mul, Int.mul_sub]
  omega

/-- 12. A mode is unitary exactly on the line: perpetuity in time is the fixed locus. -/
theorem unitary_iff_on_line (h t : Int) : N1 h t = N0 h t ↔ h = 1 := by
  have := N1_sub_N0 h t
  exact ⟨fun e => by omega, fun e => by omega⟩

/-- 13. Left of the line the mode grows; right of it the mode dies. -/
theorem grows_left (h t : Int) (hl : h < 1) : N0 h t < N1 h t := by
  have := N1_sub_N0 h t; omega
theorem dies_right (h t : Int) (hr : 1 < h) : N1 h t < N0 h t := by
  have := N1_sub_N0 h t; omega

/-- 14. The fold forbids a quiet exit: any off-line zero, together with its mirror under
the functional equation, carries a growing mode. -/
theorem off_line_forces_growth (h t : Int) (hoff : h ≠ 1) :
    N0 h t < N1 h t ∨ N0 (2 - h) t < N1 (2 - h) t := by
  have a := N1_sub_N0 h t; have b := N1_sub_N0 (2 - h) t; omega

/-- 15. PERPETUAL STABILITY IS THE LINE PROPERTY. For any fold-invariant zero set on the
plane: no mode grows under the time step iff every zero lies on h = 1. -/
theorem stability_iff_line (Z : Int × Int → Prop)
    (hinv : ∀ p, Z p → Z (2 - p.1, p.2)) :
    (∀ p, Z p → N1 p.1 p.2 ≤ N0 p.1 p.2) ↔ (∀ p, Z p → p.1 = 1) := by
  constructor
  · intro hs p hp
    have a := hs p hp
    have b := hs (2 - p.1, p.2) (hinv p hp)
    have c := N1_sub_N0 p.1 p.2
    have d := N1_sub_N0 (2 - p.1) p.2
    simp only at b d
    omega
  · intro hl p hp
    have := hl p hp
    have c := N1_sub_N0 p.1 p.2
    omega

end RALi

#print axioms RALi.unitary_iff_on_line
#print axioms RALi.off_line_forces_growth
#print axioms RALi.stability_iff_line

/-! ## PART V · The monism rule, hardened. "What happens once happens again." -/
namespace RALi

/-- 16. One repeating one: the rule, with its step, is induction. -/
theorem one_repeats_one (P : Nat → Prop) (h0 : P 0) (step : ∀ n, P n → P (n + 1)) :
    ∀ n, P n := by
  intro n; induction n with
  | zero => exact h0
  | succ k ih => exact step k ih

/-- 17. The step is the whole content: the universal claim is exactly the base plus the step. -/
theorem the_step_is_the_claim (P : Nat → Prop) :
    (∀ n, P n) ↔ (P 0 ∧ ∀ n, P n → P (n + 1)) :=
  ⟨fun h => ⟨h 0, fun n _ => h (n + 1)⟩, fun ⟨h0, s⟩ => one_repeats_one P h0 s⟩

/-- 18. The monism posit: one principle means the property does not vary with the index.
Under it, one instance forces all. -/
theorem monism_posit_forces (P : Nat → Prop) (uniform : ∀ n m, P n ↔ P m) (h0 : P 0) :
    ∀ n, P n := fun n => (uniform 0 n).mp h0

/-- 19. Finite confirmation never forces. For every height N there is a property true on
every index below N and false beyond: Skewes, Mertens, Pólya are this shape. -/
theorem finite_never_forces (N : Nat) :
    ∃ P : Nat → Prop, (∀ n, n < N → P n) ∧ ¬ ∀ n, P n :=
  ⟨fun n => n < N, fun _ h => h, fun h => Nat.lt_irrefl N (h N)⟩

/-- 20. Monism is not a law of the fold. A fold-invariant zero set can hold one zero on the
line and a mirror pair off it: "on the line once" does not recur by symmetry alone.
This is the Davenport-Heilbronn shape on the Bridge plane. -/
def mixedZ (p : Int × Int) : Prop := p = (1, 0) ∨ p = (0, 5) ∨ p = (2, 5)

theorem mixed_is_fold_invariant : ∀ p, mixedZ p → mixedZ (2 - p.1, p.2) := by
  intro p hp
  rcases hp with h | h | h <;> subst h
  · exact Or.inl rfl
  · exact Or.inr (Or.inr rfl)
  · exact Or.inr (Or.inl rfl)

theorem mixed_recurrence_fails :
    mixedZ (1, 0) ∧ mixedZ (0, 5) ∧ ¬ (∀ p, mixedZ p → p.1 = 1) :=
  ⟨Or.inl rfl, Or.inr (Or.inl rfl), fun h => by
    have := h (0, 5) (Or.inr (Or.inl rfl)); cases this⟩

end RALi

#print axioms RALi.one_repeats_one
#print axioms RALi.the_step_is_the_claim
#print axioms RALi.monism_posit_forces
#print axioms RALi.finite_never_forces
#print axioms RALi.mixed_is_fold_invariant
#print axioms RALi.mixed_recurrence_fails

/-! ## PART VI · Actualism. Only measured zeros are actual. -/
namespace RALi

/-- A zero set on a carrier, a line predicate, and the time at which each zero is measured
(none if never). The actual zeros at time T are those measured by T. -/
structure Actualized (α : Type) where
  Z        : α → Prop
  onLine   : α → Prop
  measured : α → Option Nat

def RHfull {α : Type} (A : Actualized α) : Prop := ∀ z, A.Z z → A.onLine z
def RHactual {α : Type} (A : Actualized α) : Prop :=
  ∀ z, A.Z z → A.measured z ≠ none → A.onLine z

/-- 21. The full claim yields the actual one. -/
theorem full_gives_actual {α : Type} (A : Actualized α) : RHfull A → RHactual A :=
  fun h z hz _ => h z hz

/-- 22. The actual claim does not yield the full one: one never-measured zero off the line. -/
def unreached : Actualized Bool := ⟨fun _ => True, fun b => b = true, fun b => if b then some 0 else none⟩

theorem actual_not_full : RHactual unreached ∧ ¬ RHfull unreached := by
  refine ⟨fun z _ hm => ?_, fun h => by cases h false trivial⟩
  cases z
  · exact absurd rfl hm
  · rfl

/-- 23. Given sufficient time, every zero is measured, and then the actual claim over all
time is exactly the full claim: actualism re-routes to the same step and does not bypass it. -/
theorem sufficient_time {α : Type} (A : Actualized α) (reach : ∀ z, A.Z z → A.measured z ≠ none) :
    RHactual A ↔ RHfull A :=
  ⟨fun h z hz => h z hz (reach z hz), full_gives_actual A⟩

end RALi

#print axioms RALi.full_gives_actual
#print axioms RALi.actual_not_full
#print axioms RALi.sufficient_time

/-! ## PART VII · The constructed witness, reconstructed from Residual Monism.
The paper's witness is built from RA and read through RAF and RAM. Here the witness is
built from the Codex connector directly: one substrate, one involution serving both routes
(σ = σ′), and one principle that does not vary with the index. The index is time. -/
namespace RALi

structure Q4 where
  r : Int
  i : Int
  j : Int
  k : Int
  deriving DecidableEq, Repr

/-- The geometric route's involution and the formal route's involution, written apart. -/
def sigmaGeo (q : Q4) : Q4 := ⟨q.r, -q.i, -q.j, -q.k⟩
def sigmaForm (q : Q4) : Q4 := ⟨q.r, -q.i, -q.j, -q.k⟩

/-- THE MONISM WITNESS. One involution, one principle, one seed. -/
structure MonismWitness (P : Nat → Prop) : Prop where
  one_involution : ∀ q, sigmaGeo q = sigmaForm q
  uniform        : ∀ n m, P n ↔ P m
  seed           : P 0

/-- 24. The seat field is constructed, not posited: σ = σ′ holds by rfl. -/
theorem one_involution_constructed : ∀ q, sigmaGeo q = sigmaForm q := fun _ => rfl

/-- 25. The timeless reading and the timed reading coincide under one principle:
the claim over all time is the claim at one instant. Deleting time loses nothing. -/
theorem timeless_equals_timed (P : Nat → Prop) (u : ∀ n m, P n ↔ P m) :
    (∀ n, P n) ↔ P 0 :=
  ⟨fun h => h 0, fun h n => (u 0 n).mp h⟩

/-- 26. The witness closes the record, past and future. -/
theorem monism_closes (P : Nat → Prop) (w : MonismWitness P) : ∀ n, P n :=
  (timeless_equals_timed P w.uniform).mpr w.seed

/-- 27. The witness is exactly the claim: a monism witness for P exists iff P holds at
every index. Its value field carries the whole of the claim, as theorem 17 required. -/
theorem monism_witness_is_the_claim (P : Nat → Prop) :
    MonismWitness P ↔ ∀ n, P n :=
  ⟨monism_closes P, fun h => ⟨one_involution_constructed,
    fun n m => ⟨fun _ => h m, fun _ => h n⟩, h 0⟩⟩

/-- 28. Constructed at the model, as the paper constructs RA at one point. -/
theorem constructed_monism : MonismWitness (fun _ => True) :=
  ⟨one_involution_constructed, fun _ _ => Iff.rfl, trivial⟩

/-- 29. Unlike the RA witness, the monism witness is not silent on counter-models:
it cannot be constructed where the property breaks, so it decides by containing. -/
theorem monism_absent_on_breaks : ¬ MonismWitness (fun n => n = 0) :=
  fun w => absurd ((w.uniform 0 1).mp rfl) (by decide)

/-- 30. Run through the RA-Li bridge. Replace the bridge by the monism witness on Li's
sign stream: the witness, with Li's criterion, gives RH. -/
theorem monism_yields_RH (L : LiData) (hLi : LiCriterion L)
    (w : MonismWitness (fun n => L.nonneg (n + 1))) : L.RH :=
  hLi.mpr (fun n hn => by
    obtain ⟨k, rfl⟩ : ∃ k, n = k + 1 := ⟨n - 1, by omega⟩
    exact monism_closes _ w k)

/-- 31. And the price, stated: on ζ the witness exists iff every Li sign is nonnegative,
which by Li is RH. Reconstruction moves the owed bit into `uniform`; it does not remove it. -/
theorem monism_on_li_is_RH (L : LiData) (hLi : LiCriterion L) :
    MonismWitness (fun n => L.nonneg (n + 1)) ↔ L.RH := by
  rw [monism_witness_is_the_claim]
  refine ⟨fun h => monism_yields_RH L hLi ((monism_witness_is_the_claim _).mpr h), fun h n => ?_⟩
  exact (hLi.mp h) (n + 1) (by omega)

end RALi

#print axioms RALi.one_involution_constructed
#print axioms RALi.timeless_equals_timed
#print axioms RALi.monism_closes
#print axioms RALi.monism_witness_is_the_claim
#print axioms RALi.constructed_monism
#print axioms RALi.monism_absent_on_breaks
#print axioms RALi.monism_yields_RH
#print axioms RALi.monism_on_li_is_RH

/-! ## PART VIII · Re-anchoring the monism witness to mathematical standard.
Calibration case: Perelman. The standard form of "one principle, the same result again"
is not a free uniformity; it is one dynamics, one invariant, and a PROVED transport of the
invariant along the dynamics (induction on the orbit; Lyapunov monotonicity; Perelman's
W-entropy under Ricci flow). -/
namespace RALi

/-- 32. Monism as a schema over all properties is inconsistent: uniformity cannot be
posited for every P. It must be anchored to a principle, not spread over properties. -/
theorem global_monism_inconsistent : ¬ ∀ P : Nat → Prop, ∀ n m, P n ↔ P m :=
  fun h => absurd ((h (fun n => n = 0) 0 1).mp rfl) (by decide)

def iter {S : Type} (f : S → S) : Nat → S → S
  | 0, s => s
  | n + 1, s => f (iter f n s)

/-- THE ANCHORED MONISM WITNESS. One substrate S, one principle f (the dynamics),
one invariant I, the transport of I along f, and a seed. -/
structure AnchoredMonism (S : Type) where
  f         : S → S
  I         : S → Prop
  transport : ∀ s, I s → I (f s)
  s0        : S
  seed      : I s0

/-- 33. The anchored witness closes its whole orbit, past and future. -/
theorem anchored_closes {S : Type} (A : AnchoredMonism S) : ∀ n, A.I (iter A.f n A.s0) := by
  intro n; induction n with
  | zero => exact A.seed
  | succ k ih => exact A.transport _ ih

/-- 34. The free monism witness is DERIVED from the anchored one: uniformity is no longer
posited, it is manufactured by the transport. -/
theorem anchored_derives_monism {S : Type} (A : AnchoredMonism S) :
    MonismWitness (fun n => A.I (iter A.f n A.s0)) :=
  ⟨one_involution_constructed,
   fun n m => ⟨fun _ => anchored_closes A m, fun _ => anchored_closes A n⟩,
   A.seed⟩

/-- 35. THE PERELMAN SHAPE. A quantity monotone along one flow, here a discrete flow on its
time index, is an anchored monism witness for the property "never below its start." Perelman's
W-entropy along Ricci flow has this shape; it is a structural analogue and is not formalized. -/
def lyapunovWitness (W : Nat → Int) (mono : ∀ n, W n ≤ W (n + 1)) : AnchoredMonism Nat :=
  ⟨Nat.succ, fun n => W 0 ≤ W n, fun n h => Int.le_trans h (mono n), 0, Int.le_refl _⟩

theorem lyapunov_is_monism (W : Nat → Int) (mono : ∀ n, W n ≤ W (n + 1)) :
    MonismWitness (fun n => W 0 ≤ W (iter Nat.succ n 0)) :=
  anchored_derives_monism (lyapunovWitness W mono)

/-- 36. The calibration's grade law: the closure is as strong as its transport. -/
structure GradedAnchor (S : Type) where
  A      : AnchoredMonism S
  tgrade : Grade

def closureGrade {S : Type} (G : GradedAnchor S) : Grade := Grade.weakest G.tgrade .theorem

theorem closure_grade_is_transport_grade {S : Type} (G : GradedAnchor S) :
    closureGrade G = G.tgrade := by
  unfold closureGrade Grade.weakest; cases G.tgrade <;> rfl

/-- 37. The RH instance. On Li's sign stream with the time step as the principle, an
anchored witness exists iff RH. The transport is `nonneg (n+1) → nonneg (n+2)`: the
ζ-analogue of Perelman's monotonicity formula, not yet proved by anyone. -/
theorem rh_anchor_is_the_claim (L : LiData) (hLi : LiCriterion L) :
    (∃ A : AnchoredMonism Nat, A.f = Nat.succ ∧ A.s0 = 0 ∧
        ∀ n, A.I n ↔ L.nonneg (n + 1)) ↔ L.RH := by
  constructor
  · rintro ⟨A, hf, hs, hI⟩
    apply (monism_on_li_is_RH L hLi).mp
    refine (monism_witness_is_the_claim _).mpr (fun n => ?_)
    have key : ∀ n, iter A.f n A.s0 = n := by
      intro n; induction n with
      | zero => exact hs
      | succ k ih => show A.f (iter A.f k A.s0) = k + 1; rw [ih, hf]
    have := anchored_closes A n
    rw [key n] at this
    exact (hI n).mp this
  · intro h
    have all := (monism_witness_is_the_claim _).mp ((monism_on_li_is_RH L hLi).mpr h)
    exact ⟨⟨Nat.succ, fun n => L.nonneg (n + 1), fun n _ => all (n + 1), 0, all 0⟩,
      rfl, rfl, fun _ => Iff.rfl⟩

end RALi

#print axioms RALi.global_monism_inconsistent
#print axioms RALi.anchored_closes
#print axioms RALi.anchored_derives_monism
#print axioms RALi.lyapunov_is_monism
#print axioms RALi.closure_grade_is_transport_grade
#print axioms RALi.rh_anchor_is_the_claim

/-! ## PART IX · ζ's time has a proved monotonicity formula, and it runs the wrong way.
The de Bruijn-Newman heat flow H_t(z) = ∫ e^{t u²} Φ(u) cos(z u) du, Φ built from ξ.
de Bruijn (1950): if every zero of H_0 lies in |Im z| ≤ Δ, every zero of H_t lies in
|Im z| ≤ √max(Δ² − 2t, 0). RH is "all zeros of H_0 real". Λ is the least t with all zeros
of H_t real; Newman (1976) defined it, Rodgers-Tao (2020) proved Λ ≥ 0, Polymath 15 (2019)
proved Λ ≤ 0.22. So RH ⇔ Λ = 0. Modelled here on the strip bound, widths in Nat, half-steps
of time; a toy of the bound, not of the flow. -/
namespace RALi

/-- Squared strip width after t time steps: max(d2 − 2t, 0). -/
def flow (d2 t : Nat) : Nat := d2 - 2 * t
def realAt (d2 t : Nat) : Prop := flow d2 t = 0

/-- 38. THE MONOTONICITY FORMULA. The width never grows along ζ's time. -/
theorem flow_monotone (d2 t : Nat) : flow d2 (t + 1) ≤ flow d2 t := by
  unfold flow; omega

/-- 39. Its transport, proved: once every zero is real, every zero stays real. This is
de Bruijn's theorem in the toy, the ζ-analogue of Perelman's monotonicity, at theorem grade. -/
theorem reality_transported (d2 t : Nat) (h : realAt d2 t) : realAt d2 (t + 1) := by
  unfold realAt flow at *; omega

/-- Λ in the toy: the first time the strip closes. -/
def Lam (d2 : Nat) : Nat := (d2 + 1) / 2

theorem real_at_Lam (d2 : Nat) : realAt d2 (Lam d2) := by unfold realAt flow Lam; omega

/-- 40. In the toy, the strip is closed at time zero iff Λ = 0. For ζ, RH ↔ Λ = 0 is the cited
result of Newman with Rodgers and Tao and enters the cone as `hLam`. -/
theorem rh_iff_lambda_zero (d2 : Nat) : realAt d2 0 ↔ Lam d2 = 0 := by
  unfold realAt flow Lam
  exact ⟨fun h => by omega, fun h => by omega⟩

/-- 41. The anchored monism witness exists for ζ's time, transport proved, seeded at Λ.
It closes the whole future of the flow from Λ on. -/
def deBruijnWitness (d2 : Nat) : AnchoredMonism Nat :=
  ⟨Nat.succ, realAt d2, fun t h => reality_transported d2 t h, Lam d2, real_at_Lam d2⟩

theorem iter_succ (n s : Nat) : iter Nat.succ n s = s + n := by
  induction n with
  | zero => rfl
  | succ k ih => show Nat.succ (iter Nat.succ k s) = s + (k + 1); rw [ih]; omega

theorem future_closed (d2 n : Nat) : realAt d2 (Lam d2 + n) := by
  have := anchored_closes (deBruijnWitness d2) n
  rwa [show (deBruijnWitness d2).f = Nat.succ from rfl, iter_succ] at this

/-- 42. THE RECORD FORGETS. After one step the record of the width-zero state and the
width-one state coincide: the forward flow is even in the RH bit, so no readout of the
flowed record decides RH. This is the fTOE wall, T1, executed on ζ's own time. -/
theorem flowed_record_forgets (T : Nat) (hT : 1 ≤ T) :
    ¬ ∃ g : Nat → Bool, ∀ d2, g (flow d2 T) = decide (d2 = 0) := by
  rintro ⟨g, hg⟩
  have a := hg 0; have b := hg 1
  have e : flow 1 T = flow 0 T := by unfold flow; omega
  rw [e, a] at b
  exact absurd b (by decide)

/-- 43. The upstream direction is not a transport. Going backward from a real record,
both answers are admissible: the preimage of "real at T" holds the RH state and a non-RH
state. The forward arrow proves; the backward arrow must be supplied. -/
theorem upstream_is_not_forced (T : Nat) (hT : 1 ≤ T) :
    realAt 0 T ∧ realAt 1 T ∧ realAt 0 0 ∧ ¬ realAt 1 0 := by
  unfold realAt flow
  exact ⟨by omega, by omega, rfl, fun h => by omega⟩

end RALi

#print axioms RALi.flow_monotone
#print axioms RALi.reality_transported
#print axioms RALi.rh_iff_lambda_zero
#print axioms RALi.future_closed
#print axioms RALi.flowed_record_forgets
#print axioms RALi.upstream_is_not_forced

/-! ## PART X · Halted Uniduction with the category-gap eliminator. The regress, closed.
Every "missing piece" of Parts I-IX is a register's reading of one seat. Exhibit each as a
leg of one cone with apex RH; then the hunt has one gap, not a sequence of them. -/
namespace RALi

structure Hunt where
  S     : Substrate
  L     : LiData
  u0    : S.U
  hRA   : RA S
  hLi   : LiCriterion L
  lamZero : Prop                -- the upstream reading: Λ = 0
  hLam  : L.RH ↔ lamZero        -- Newman's definition with Rodgers-Tao, cited

/-- The legs. Each register's reading of the owed seat, proved equal to the apex. -/
theorem leg_bridge (H : Hunt) : Nonempty (Bridge H.S H.L) ↔ H.L.RH :=
  ⟨fun ⟨B⟩ => bridge_yields_RH H.S H.L H.hRA H.hLi B,
   fun h => ⟨⟨fun _ => H.u0, fun n hn _ => (H.hLi.mp h) n hn⟩⟩⟩

theorem leg_unity (H : Hunt) : Nonempty (Unity H.S H.L) ↔ H.L.RH :=
  ⟨fun ⟨u⟩ => retired_seal_is_sound H.S H.L H.hRA H.hLi u,
   fun h => let ⟨B⟩ := (leg_bridge H).mpr h; ⟨⟨B, .premise⟩⟩⟩

theorem leg_monism (H : Hunt) : MonismWitness (fun n => H.L.nonneg (n + 1)) ↔ H.L.RH :=
  monism_on_li_is_RH H.L H.hLi

theorem leg_transport (H : Hunt) :
    (∃ A : AnchoredMonism Nat, A.f = Nat.succ ∧ A.s0 = 0 ∧ ∀ n, A.I n ↔ H.L.nonneg (n + 1))
      ↔ H.L.RH :=
  rh_anchor_is_the_claim H.L H.hLi

theorem leg_upstream (H : Hunt) : H.lamZero ↔ H.L.RH := H.hLam.symm

/-- The five readings, as a diagram of propositions. -/
inductive Reg5 | bridge | unity | monism | transport | upstream deriving DecidableEq, Repr

def D5 (H : Hunt) : Reg5 → Prop
  | .bridge    => Nonempty (Bridge H.S H.L)
  | .unity     => Nonempty (Unity H.S H.L)
  | .monism    => MonismWitness (fun n => H.L.nonneg (n + 1))
  | .transport => ∃ A : AnchoredMonism Nat, A.f = Nat.succ ∧ A.s0 = 0 ∧ ∀ n, A.I n ↔ H.L.nonneg (n + 1)
  | .upstream  => H.lamZero

/-- 44. THE CONE. RH is the apex of a cone over all five readings, every leg an
equivalence: the category gaps between the hunt's registers are eliminated. -/
theorem hunt_cone (H : Hunt) : ∀ r, D5 H r ↔ H.L.RH := by
  intro r; cases r
  · exact leg_bridge H
  · exact leg_unity H
  · exact leg_monism H
  · exact leg_transport H
  · exact leg_upstream H

/-- 45. ONE GAP. Any two readings are the same proposition. The quantity monotone against
the flow (upstream) IS the bridge's read, the unity posit, the monism field, the transport. -/
theorem one_gap (H : Hunt) (r s : Reg5) : D5 H r ↔ D5 H s :=
  (hunt_cone H r).trans (hunt_cone H s).symm

/-- 46. THE HALT. Every proposition proved equivalent to the hypothesis lands on the same apex
as the five readings; which future propositions are equivalent is not decided here. -/
theorem regress_halts (H : Hunt) (P : Prop) (hP : P ↔ H.L.RH) (r : Reg5) : P ↔ D5 H r :=
  hP.trans (hunt_cone H r).symm

/-- 47. Given a true proposition Q, proving Q → RH is the same as proving RH: conditioning on a
true premise adds nothing (Theorem E of the prior paper, here on the hunt's apex). -/
theorem nothing_weaker (H : Hunt) (Q : Prop) (hq : Q) : (Q → H.L.RH) ↔ H.L.RH :=
  ⟨fun f => f hq, fun h _ => h⟩

end RALi

#print axioms RALi.hunt_cone
#print axioms RALi.one_gap
#print axioms RALi.regress_halts
#print axioms RALi.nothing_weaker

/-! ## PART X, completed · a sufficient route closes every reading at once. -/
namespace RALi

/-- 48. Theorem 46 covers every reformulation equivalent to the apex. A route strictly
stronger than the apex (a specific operator, a hypothesis over a family) is not equivalent,
and it does not open a new gap either: any sufficient route supplies all five readings. -/
theorem sufficient_closes_all (H : Hunt) (P : Prop) (hP : P → H.L.RH) (p : P) :
    ∀ r, D5 H r :=
  fun r => (hunt_cone H r).mpr (hP p)

end RALi

#print axioms RALi.sufficient_closes_all

/-! ## PART XI · Timeless Residual Monism, stated as Postulate M, and its equivalence with the line property. -/
namespace TimeLocus

def onLine (p : Int × Int) : Prop := p.1 = 1

/-- A timed world: the locus at each time, and the zeros present at each time. -/
structure World where
  locus : Nat → (Int × Int → Prop)
  zeros : Nat → (Int × Int → Prop)

/-- TIME PSP premise: prior and posterior locus are the SAME locus, the line, at every time. -/
def SameLocus (W : World) : Prop := ∀ t p, W.locus t p ↔ onLine p

/-- The claim to be tested: every zero at every time is bound to the locus. -/
def Bound (W : World) : Prop := ∀ t p, W.zeros t p → W.locus t p

/-- Fold-invariance at every time: the functional equation acts at each iteration. -/
def FoldInv (W : World) : Prop := ∀ t p, W.zeros t p → W.zeros t (2 - p.1, p.2)

/-- 51. Given the same locus at all times, being bound IS the line property at all times. -/
theorem bound_iff_line (W : World) (h : SameLocus W) :
    Bound W ↔ ∀ t p, W.zeros t p → onLine p :=
  ⟨fun b t p z => (h t p).mp (b t p z), fun l t p z => (h t p).mpr (l t p z)⟩

/-- 52, the test world. A world where the locus is the same line at every time, the fold acts at every
    time, the on-line zero recurs at every time, and a mirror pair sits off the line at every time. -/
def testWorld : World :=
  ⟨fun _ p => onLine p, fun _ p => p = (1, 0) ∨ p = (0, 5) ∨ p = (2, 5)⟩

theorem test_same_locus : SameLocus testWorld := fun _ _ => Iff.rfl

theorem test_fold_inv : FoldInv testWorld := by
  intro _ p hp
  rcases hp with h | h | h <;> subst h
  · exact Or.inl rfl
  · exact Or.inr (Or.inr rfl)
  · exact Or.inr (Or.inl rfl)

theorem test_not_bound : ¬ Bound testWorld := fun b => by
  have := b 0 (0, 5) (Or.inr (Or.inl rfl)); cases this

/-- 52. Therefore SameLocus and FoldInv, at every time, do not imply Bound. -/
theorem time_does_not_bind :
    ¬ ∀ W : World, SameLocus W → FoldInv W → Bound W :=
  fun h => test_not_bound (h testWorld test_same_locus test_fold_inv)

end TimeLocus

namespace TimeLocus

/-- Residual Monism read as the Codex states it: one involution serves both routes. -/
def sigmaGeo (p : Int × Int) : Int × Int := (2 - p.1, p.2)
def sigmaForm (p : Int × Int) : Int × Int := (2 - p.1, p.2)
def OneInvolution : Prop := ∀ p, sigmaGeo p = sigmaForm p

/-- Residual Monism read as timeless: whether the zeros sit on the locus does not vary in time. -/
def P (W : World) (t : Nat) : Prop := ∀ p, W.zeros t p → onLine p
def Timeless (W : World) : Prop := ∀ t s, P W t ↔ P W s

/-- 53. Both readings hold in the counter-world: one involution by rfl, and timelessness because
    the property "all zeros on the line" is constantly false there. Timeless and unbound. -/
theorem monism_holds_in_counter_world :
    OneInvolution ∧ Timeless testWorld ∧ ¬ Bound testWorld :=
  ⟨fun _ => rfl, fun _ _ => Iff.rfl, test_not_bound⟩

/-- 54. What timeless monism does do: it makes one instant decide all time. With the seed, binding
    follows; the seed is "every zero present at the instant is on the line". -/
theorem timeless_with_seed_binds (W : World) (h : SameLocus W) (u : Timeless W) (s0 : P W 0) :
    Bound W :=
  (bound_iff_line W h).mpr (fun t p z => ((u 0 t).mp s0) p z)

end TimeLocus

namespace TimeLocus

/-- THE CONSTRUCTED WITNESS from RESIDUAL-MONISM + TIME PSP, as asked: one involution, the
    timeless interface (the Barzakh instant, t = 0, upstream of time), and the downstream times
    agreeing with it. No field is a premise; each must be built as a term. -/
structure MonismTimeWitness (W : World) : Prop where
  one_involution : OneInvolution
  same_locus     : SameLocus W
  timeless       : Timeless W
  interface      : P W 0          -- every zero present at the timeless interface is on the line

/-- 55. When it can be built, it proves the bound everywhere downstream. -/
theorem witness_proves_bound (W : World) (w : MonismTimeWitness W) : Bound W :=
  timeless_with_seed_binds W w.same_locus w.timeless w.interface

/-- 55, completed. It can be built exactly when the bound already holds: its existence IS the line property. -/
theorem witness_iff_bound (W : World) (h : SameLocus W) :
    Nonempty (MonismTimeWitness W) ↔ Bound W := by
  refine ⟨fun ⟨w⟩ => witness_proves_bound W w, fun b => ?_⟩
  have l := (bound_iff_line W h).mp b
  exact ⟨⟨fun _ => rfl, h, fun t s => ⟨fun _ p z => l s p z, fun _ p z => l t p z⟩, fun p z => l 0 p z⟩⟩

/-- 56. Built at a model whose zeros are on the line, as the prior paper builds RA at one point. -/
def goodWorld : World := ⟨fun _ p => onLine p, fun _ p => p = (1, 0)⟩
theorem constructed_at_model : Nonempty (MonismTimeWitness goodWorld) :=
  (witness_iff_bound goodWorld (fun _ _ => Iff.rfl)).mpr (fun _ p z => by subst z; rfl)

/-- 57. Not buildable at the counter-world: the interface field fails there. -/
theorem not_constructible_off_line : ¬ Nonempty (MonismTimeWitness testWorld) :=
  fun w => test_not_bound ((witness_iff_bound testWorld test_same_locus).mp w)

end TimeLocus

namespace TimeLocus

/-- Postulate M on an enumerated zero set. Stage k is when a zero is located; L t says every
    zero located by stage t lies on the line; M says the truth of L t does not depend on t. -/
def Lstage {α : Type} (Z : α → Prop) (onL : α → Prop) (stage : α → Nat) (t : Nat) : Prop :=
  ∀ z, Z z → stage z ≤ t → onL z
def PostulateM {α : Type} (Z : α → Prop) (onL : α → Prop) (stage : α → Nat) : Prop :=
  ∀ t s, Lstage Z onL stage t ↔ Lstage Z onL stage s

/-- 49. POSTULATE M IS EQUIVALENT TO THE LINE PROPERTY, given the computed seed L 0 and an
    exhaustive enumeration (every zero is located at some finite stage, built into `stage`). -/
theorem postulateM_iff_line {α : Type} (Z : α → Prop) (onL : α → Prop) (stage : α → Nat)
    (seed : Lstage Z onL stage 0) :
    PostulateM Z onL stage ↔ ∀ z, Z z → onL z := by
  constructor
  · intro m z hz
    exact ((m 0 (stage z)).mp seed) z hz (Nat.le_refl _)
  · intro h t s
    exact ⟨fun _ z hz _ => h z hz, fun _ z hz _ => h z hz⟩

/-- 50. And Postulate M is not free: it holds in a world whose zeros are all on the line, and
    it cannot hold with the seed in a world with a located off-line zero. -/
theorem postulateM_decides {α : Type} (Z : α → Prop) (onL : α → Prop) (stage : α → Nat)
    (seed : Lstage Z onL stage 0) (z : α) (hz : Z z) (off : ¬ onL z) :
    ¬ PostulateM Z onL stage :=
  fun m => off ((postulateM_iff_line Z onL stage seed).mp m z hz)

end TimeLocus

#print axioms TimeLocus.bound_iff_line
#print axioms TimeLocus.time_does_not_bind
#print axioms TimeLocus.monism_holds_in_counter_world
#print axioms TimeLocus.timeless_with_seed_binds
#print axioms TimeLocus.witness_iff_bound
#print axioms TimeLocus.constructed_at_model
#print axioms TimeLocus.not_constructible_off_line
#print axioms TimeLocus.postulateM_iff_line
#print axioms TimeLocus.postulateM_decides

/-! ## PART XII · The demand correctly addressed, and [.] at the collapse foundation. -/
namespace DotRH

inductive Token where
  | sealed | broken | opn | dot
  deriving DecidableEq, Repr

def Token.inEconomy : Token → Bool
  | .dot => false
  | _    => true

/-- I · THE COLLAPSE FOUNDATION and its stop. -/
structure Collapse (V : Prop) where
  Reg     : Type
  reading : Reg → Prop
  leg     : ∀ r, reading r ↔ V

-- Theorem 58.
theorem self_referential_limit {V : Prop} (C : Collapse V) (r s : C.Reg) :
    (C.reading r ↔ V) ∧ (C.reading r ↔ C.reading s) :=
  ⟨C.leg r, (C.leg r).trans (C.leg s).symm⟩

def emitAtFoundation {V : Prop} (_ : Collapse V) : Token := .dot
-- Theorem 59.
theorem value_marked_dot {V : Prop} (C : Collapse V) : emitAtFoundation C = .dot := rfl
theorem dot_is_not_a_verdict :
    Token.dot ≠ .sealed ∧ Token.dot ≠ .broken ∧ Token.dot ≠ .opn := by decide
theorem dot_outside_economy : Token.inEconomy .dot = false := rfl

def trivialCollapse (V : Prop) : Collapse V := ⟨Unit, fun _ => V, fun _ => Iff.rfl⟩

/-- Inside the collapse register, a demand for a verdict is a ghost: the register returns
    the same mark for the value and its negation. -/
-- Theorem 60.
theorem demand_is_ghost_in_register {V : Prop} (C : Collapse V) (C' : Collapse (¬ V)) :
    emitAtFoundation C = emitAtFoundation C' := rfl

/-- II · THE SELF-GROUNDING ROOT. A root R is self-grounding when acts occur and every act of
    adjudication, assent or denial, is itself an instance of R. Then a denial of R re-enacts R,
    no external proof adds to it, and a demand for one is a ghost. This is the seat of the
    analogy: a root that grounds itself cannot be proved from outside itself. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

-- Theorem 61.
theorem denial_reenacts_root {R : Prop} (G : SelfGrounding R) (denial : G.Act) : R :=
  G.instances denial

-- Theorem 61, completed.
theorem external_proof_adds_nothing {R : Prop} (G : SelfGrounding R) (Q : Prop) :
    (Q → R) ↔ R :=
  ⟨fun _ => G.instances G.anAct, fun r _ => r⟩

/-- The Root Axiom at the constructed domain is self-grounding: every act is a deed, and a
    deed actuates. -/
def RA : Prop := (0 : Int) < 1
def raSelfGrounding : SelfGrounding RA := ⟨Unit, (), fun _ => show (0 : Int) < 1 by decide⟩

/-- III · A HYPOTHESIS ABOUT AN OBJECT is not self-grounding. Its value is fixed by the object,
    acts do not instance it, and a finite witness can refute it. -/
structure Frame where
  S : Type
  τ : S → S
  Z : S → Prop

def LineProperty (X : Frame) : Prop := ∀ s, X.Z s → X.τ s = s

/-- A located zero off the line refutes the line property, constructively. -/
theorem refuted_by_witness (X : Frame) (s : X.S) (hz : X.Z s) (off : X.τ s ≠ s) :
    ¬ LineProperty X :=
  fun h => off (h s hz)

def twoPoint : Frame := ⟨Bool, fun b => !b, fun _ => True⟩

/-- On a frame whose line property fails, no occurring act can instance it: the line
    property of a frame is not self-grounding. -/
-- Theorem 62.
theorem line_not_self_grounding : ¬ Nonempty (SelfGrounding (LineProperty twoPoint)) :=
  fun ⟨G⟩ => refuted_by_witness twoPoint true trivial (fun h => Bool.noConfusion h) (G.instances G.anAct)

/-- IV · THE HARDENED FOUNDATION, in toto. The collapse marks the value [.] and the demand is
    a ghost inside that register; the self-grounding root cannot be proved from outside and
    re-enacts under denial; a hypothesis about an object is witness-refutable and is not
    self-grounding, so the self-grounding exemption does not transfer to it. -/
theorem foundation_hardened :
    (∀ (V : Prop) (C : Collapse V), emitAtFoundation C = .dot) ∧
    Token.inEconomy .dot = false ∧
    (∀ (V : Prop) (C : Collapse V) (C' : Collapse (¬ V)), emitAtFoundation C = emitAtFoundation C') ∧
    (∀ Q : Prop, (Q → RA) ↔ RA) ∧
    (∀ a : Unit, RA ∧ raSelfGrounding.instances a = raSelfGrounding.instances a) ∧
    ¬ Nonempty (SelfGrounding (LineProperty twoPoint)) :=
  ⟨fun _ _ => rfl, rfl, fun _ _ _ => rfl, external_proof_adds_nothing raSelfGrounding,
   fun a => ⟨raSelfGrounding.instances a, rfl⟩, line_not_self_grounding⟩

/-! V · THE DEMAND, CORRECTLY ADDRESSED.
    "A proof of the Riemann Hypothesis cannot be demanded of the foundation. Every reading the
    foundation supplies is equivalent to the hypothesis, so any derivation from those readings
    alone would presuppose what it derives. The demand is well-posed when addressed to the
    object, the function zeta, whose structure fixes where its zeros lie." -/

/-- A foundation resource is any property of frames the foundation supplies. -/
def Resource := Frame → Prop

/-- (a) Misaddressed: any resource that also holds on a frame where the line property fails
    cannot, by itself, yield the line property on every frame it covers. -/
-- Theorem 63.
theorem misaddressed_to_foundation (R : Resource) (hR : R twoPoint) :
    ¬ ∀ X, R X → LineProperty X :=
  fun h => refuted_by_witness twoPoint true trivial (fun e => Bool.noConfusion e) (h twoPoint hR)

/-- (b) Presupposition: a derivation of the value from a reading equivalent to it uses the
    value's own content; the reading and the value stand or fall together. -/
-- Theorem 64.
theorem derivation_presupposes {V P : Prop} (leg : P ↔ V) : (P → V) ∧ (V → P) ∧ (¬ V → ¬ P) :=
  ⟨leg.mp, leg.mpr, fun nv p => nv (leg.mp p)⟩

/-- (c) Well-addressed: the object decides. A frame settles its own line property, in one
    direction by a located off-line witness, in the other by its own structure. -/
def onLineFrame : Frame := ⟨Unit, fun u => u, fun _ => True⟩
-- Theorem 65.
theorem object_decides :
    ¬ LineProperty twoPoint ∧ LineProperty onLineFrame :=
  ⟨refuted_by_witness twoPoint true trivial (fun e => Bool.noConfusion e), fun _ _ => rfl⟩

/-- THE DEMAND, IN TOTO. Made to the foundation, it is misaddressed and any answer from
    there presupposes the value; made to the object, it is well-posed and the object answers. -/
-- Theorem 66.
theorem demand_correctly_addressed :
    (∀ R : Resource, R twoPoint → ¬ ∀ X, R X → LineProperty X) ∧
    (∀ {V P : Prop}, (P ↔ V) → (¬ V → ¬ P)) ∧
    (¬ LineProperty twoPoint ∧ LineProperty onLineFrame) :=
  ⟨misaddressed_to_foundation, fun leg => (derivation_presupposes leg).2.2, object_decides⟩

end DotRH

namespace DotRH
/-- Theorem 67. Attached to the paper's cone: the readings of Parts X and XI collapse onto
    the hypothesis, and the foundation marks the value [.]. -/
def rhCollapse (H : RALi.Hunt) : Collapse H.L.RH := ⟨RALi.Reg5, RALi.D5 H, RALi.hunt_cone H⟩
theorem rh_marked_dot (H : RALi.Hunt) : emitAtFoundation (rhCollapse H) = .dot := rfl
end DotRH

#print axioms DotRH.self_referential_limit
#print axioms DotRH.value_marked_dot
#print axioms DotRH.dot_is_not_a_verdict
#print axioms DotRH.demand_is_ghost_in_register
#print axioms DotRH.denial_reenacts_root
#print axioms DotRH.external_proof_adds_nothing
#print axioms DotRH.refuted_by_witness
#print axioms DotRH.line_not_self_grounding
#print axioms DotRH.foundation_hardened
#print axioms DotRH.misaddressed_to_foundation
#print axioms DotRH.derivation_presupposes
#print axioms DotRH.object_decides
#print axioms DotRH.demand_correctly_addressed
#print axioms DotRH.rh_marked_dot

/-! ## PART XIII · The six-register cone: Postulate M joined to the apex. -/
namespace SixCone

/-- The hunt with one more reading. The zeros are enumerated by stage, the seed holds, and
    the hypothesis is, by its definition, the line property of the enumerated zeros; that
    identification enters as the hypothesis `hDef`, carried by citation as Li's criterion and
    Newman's equivalence are. -/
structure Hunt6 extends RALi.Hunt where
  α     : Type
  Z     : α → Prop
  onL   : α → Prop
  stage : α → Nat
  seed  : TimeLocus.Lstage Z onL stage 0
  hDef  : L.RH ↔ ∀ z, Z z → onL z

inductive Reg6 where
  | five (r : RALi.Reg5)
  | postulateM

def D6 (H : Hunt6) : Reg6 → Prop
  | .five r     => RALi.D5 H.toHunt r
  | .postulateM => TimeLocus.PostulateM H.Z H.onL H.stage

-- Theorem 68.
/-- The cone over six readings: the five of Part X and Postulate M, every leg an equivalence
    with the hypothesis. -/
theorem hunt_cone6 (H : Hunt6) : ∀ r, D6 H r ↔ H.L.RH := by
  intro r
  cases r with
  | five r => exact RALi.hunt_cone H.toHunt r
  | postulateM =>
      exact (TimeLocus.postulateM_iff_line H.Z H.onL H.stage H.seed).trans H.hDef.symm

-- Theorem 69.
/-- The collapse foundation over six readings, and its mark on the value. -/
def rhCollapse6 (H : Hunt6) : DotRH.Collapse H.L.RH := ⟨Reg6, D6 H, hunt_cone6 H⟩
theorem rh_marked_dot6 (H : Hunt6) : DotRH.emitAtFoundation (rhCollapse6 H) = .dot := rfl

end SixCone

#print axioms SixCone.hunt_cone6
#print axioms SixCone.rh_marked_dot6

namespace DotRH
-- Theorem 63, general form.
/-- Any resource that also holds on some frame whose line property fails cannot, by itself,
    yield the line property on every frame it covers. -/
theorem misaddressed_general (R : Resource) (Y : Frame) (hY : ¬ LineProperty Y) (hR : R Y) :
    ¬ ∀ X, R X → LineProperty X :=
  fun h => hY (h Y hR)
end DotRH

#print axioms DotRH.misaddressed_general

/-! ## PART XIV · The logical form of the hypothesis: the only existence lives in the denial. -/
namespace LogicalForm

-- Theorem 70.
/-- A universal sentence carries no existential import: over an empty zero set the line
    property holds vacuously. The hypothesis posits no object. -/
theorem universal_posits_nothing {α : Type} (onL : α → Prop) :
    ∀ z : α, (fun _ => False) z → onL z :=
  fun _ h => h.elim

-- Theorem 71.
/-- The denial posits an object: a located zero off the line refutes the hypothesis. -/
theorem denial_posits_a_witness {α : Type} (Z onL : α → Prop) :
    (∃ z, Z z ∧ ¬ onL z) → ¬ ∀ z, Z z → onL z :=
  fun ⟨z, hz, off⟩ h => off (h z hz)

-- Theorem 72.
/-- With a decidable line predicate, the hypothesis fails only by a witness: it holds iff no
    off-line zero exists. The denial carries the whole existential load. -/
theorem fails_only_by_witness {α : Type} (Z onL : α → Prop) [∀ z, Decidable (onL z)] :
    (∀ z, Z z → onL z) ↔ ¬ ∃ z, Z z ∧ ¬ onL z := by
  constructor
  · intro h ⟨z, hz, off⟩; exact off (h z hz)
  · intro h z hz
    exact Decidable.byContradiction (fun off => h ⟨z, hz, off⟩)

-- Theorem 73.
/-- A witness is a finite check: for a decidable predicate on the naturals, one index at which
    the check fails refutes the universal, and the check at that index is a computation. -/
theorem witness_is_a_finite_check (bad : Nat → Bool) (n : Nat) (h : bad n = true) :
    ¬ ∀ m, bad m = false :=
  fun hall => by rw [hall n] at h; cases h

end LogicalForm

#print axioms LogicalForm.universal_posits_nothing
#print axioms LogicalForm.denial_posits_a_witness
#print axioms LogicalForm.fails_only_by_witness
#print axioms LogicalForm.witness_is_a_finite_check
