
/-! # PART VIII · the physico-formal carrier -/
/-!
  PART VIII · THE PHYSICO-FORMAL CARRIER.

  Part VII took the carrier as a type variable and six arrows as hypotheses. Part VIII replaces the variable by a
  type given by its constructors, `PhysicalCarrier`: a self-conjugate state at a height (the neutral sector), or a
  member of a conjugate pair at a height with the sign that tells it from its partner (the charged sector). Charge
  conjugation `C` and annihilation `annihilate` are defined on it by cases; the physical carrier is then an instance
  of the seed's own carrier abstraction (Part II, `PrimeFreedom.Carrier`): `C` is a fold, `annihilate` its
  registration, and every law of that namespace holds on the carrier by theorem.

  The map from a zero to its carrier, `map_zero_to_carrier`, is total by the integer's constructors and a bijection
  with the chart; it carries the fold to charge conjugation, the line to the neutral sector, and the registration to
  annihilation. On this map two of Part VII's six arrows are theorems: an off-line zero is carried to the charged
  sector (h_carrier), where annihilation does not fix it and sends it and its partner to one state, so one label is
  lost and kept nowhere on the carrier (h_erase). A third, h_heat, is Landauer's law entered as a definition,
  `landauerHeatPerEvent T = T · ln 2`, with a temperature floor: the arrow is then the monotonicity of a product.

  What remains is physics, and is printed as hypotheses of the capstone: h_realize, that the vacuum instantiates
  the carrier of every read zero; h_pop and h_rate, the population and rate floors of a realized charged carrier;
  h_temp, the temperature floor; h_couple, that the residual observable covers the carrier's contribution; the
  reading h_read; and a certified bound B. No definition below makes any of these true. A theorem that the universe
  realizes a state is not available to any logic: it enters as an axiom, which this file declares none of; as a
  hypothesis, which is what is done here; or as a definition that is the claim restated, which the Final Scribal
  Recommendation forbids (no hidden premise in a structure field). The theorems of VIII-f record, by witness, that
  the realization predicate is the input: one choice of it makes h_realize hold at every configuration, another
  makes it fail at the pair world.
-/
section PartVIII
namespace PhysicoFormal
open RememberedOffered

/-! ## VIII-a · the carrier, by constructors; conjugation and annihilation, by cases -/

/-- THE PHYSICAL CARRIER. A state of the sector in which a zero is realized is one of two kinds:
    `selfConjugate t`, a state at height t that charge conjugation fixes, the neutral sector; or
    `conjugatePair m t sign`, a member of the conjugate pair of magnitude m + 1 at height t, with `sign` the one
    label that tells it from its partner, the charged sector. A type given by its constructors, inhabited at every
    height; which of its states the vacuum instantiates is the premise h_realize of VIII-e, not a field here. -/
inductive PhysicalCarrier where
  | selfConjugate (t : Int)
  | conjugatePair (m : Nat) (t : Int) (sign : Bool)

/-- Charge conjugation: it fixes the neutral sector and flips the sign in the charged sector. -/
def C : PhysicalCarrier → PhysicalCarrier
  | .selfConjugate t => .selfConjugate t
  | .conjugatePair m t s => .conjugatePair m t (!s)

theorem C_involutive (c : PhysicalCarrier) : C (C c) = c := by
  cases c with
  | selfConjugate t => rfl
  | conjugatePair m t s => cases s <;> rfl

/-- The neutral sector: the self-conjugate states. -/
def Neutral : PhysicalCarrier → Prop
  | .selfConjugate _ => True
  | .conjugatePair _ _ _ => False

/-- The neutral sector is exactly the fixed locus of charge conjugation. -/
theorem neutral_iff_C_fixed (c : PhysicalCarrier) : Neutral c ↔ C c = c := by
  cases c with
  | selfConjugate t => exact ⟨fun _ => rfl, fun _ => trivial⟩
  | conjugatePair m t s => exact ⟨fun h => h.elim, fun h => by cases s <;> cases h⟩

/-- Fixedness under charge conjugation is decided on the carrier, by cases. -/
theorem carrier_em (c : PhysicalCarrier) : C c = c ∨ C c ≠ c := by
  cases c with
  | selfConjugate t => exact Or.inl rfl
  | conjugatePair m t s => exact Or.inr (fun h => by cases s <;> cases h)

/-- Annihilation, the physical discard: a member of a pair goes to the neutral state at its height; a neutral state
    stays. The sign is kept in no register of the carrier. -/
def annihilate : PhysicalCarrier → PhysicalCarrier
  | .selfConjugate t => .selfConjugate t
  | .conjugatePair _ t _ => .selfConjugate t

theorem annihilate_lands (c : PhysicalCarrier) : C (annihilate c) = annihilate c := by
  cases c <;> rfl

theorem annihilate_fixes (c : PhysicalCarrier) (h : C c = c) : annihilate c = c := by
  cases c with
  | selfConjugate t => rfl
  | conjugatePair m t s => cases s <;> cases h

theorem annihilate_forgets (c : PhysicalCarrier) : annihilate (C c) = annihilate c := by
  cases c <;> rfl

/-- Annihilation fixes a state exactly when the state is neutral. -/
theorem annihilate_fixes_iff_neutral (c : PhysicalCarrier) : annihilate c = c ↔ Neutral c := by
  cases c with
  | selfConjugate t => exact ⟨fun _ => trivial, fun _ => rfl⟩
  | conjugatePair m t s => exact ⟨fun h => (by cases h), fun h => h.elim⟩

/-- A conjugate pair is two states with one image under annihilation: the sign is the bit that annihilation erases. -/
theorem pair_is_two_states_one_image (m : Nat) (t : Int) :
    PhysicalCarrier.conjugatePair m t true ≠ PhysicalCarrier.conjugatePair m t false ∧
    annihilate (.conjugatePair m t true) = annihilate (.conjugatePair m t false) :=
  ⟨fun h => (by cases h), rfl⟩

/-- THE PHYSICAL CARRIER IS AN INSTANCE OF THE SEED'S CARRIER ABSTRACTION (Part II): charge conjugation is a fold. -/
def carrierFold : PrimeFreedom.Carrier.Fold PhysicalCarrier := ⟨C, C_involutive⟩

/-- Annihilation is a registration for that fold: it lands on the neutral sector, fixes it, and forgets the sign. -/
def carrierReg : PrimeFreedom.Carrier.Registration carrierFold :=
  ⟨annihilate, annihilate_lands, annihilate_fixes, annihilate_forgets⟩

/-- THE CLOSURE ON THE PHYSICAL CARRIER: the four laws Part II proves on any carrier, instantiated on this one by
    theorem. Least erasure is the value; the value is lossless registration; the lossless member of a record is
    unique; every charged state gives two worlds of one record that differ in the value. -/
theorem the_closure_on_the_physical_carrier :
    type_of% (PrimeFreedom.Carrier.the_closure_on_any_carrier carrierReg carrier_em) :=
  PrimeFreedom.Carrier.the_closure_on_any_carrier carrierReg carrier_em

/-! ## VIII-b · the map from a zero to its carrier, total and bijective, equivariant -/

/-- THE MAP FROM A ZERO TO ITS CARRIER. A point of the chart at offset d and height t goes: on the line, to the
    self-conjugate state at t; at offset n + 1, to the positive member of the pair of magnitude n + 1 at t; at offset
    −(n + 1), to the negative member. Total, by the integer's three constructors. -/
def map_zero_to_carrier : Point → PhysicalCarrier
  | (Int.ofNat 0, t) => .selfConjugate t
  | (Int.ofNat (n + 1), t) => .conjugatePair n t true
  | (Int.negSucc n, t) => .conjugatePair n t false

/-- The inverse: a carrier state read back as a point of the chart. -/
def carrier_to_zero : PhysicalCarrier → Point
  | .selfConjugate t => (Int.ofNat 0, t)
  | .conjugatePair n t true => (Int.ofNat (n + 1), t)
  | .conjugatePair n t false => (Int.negSucc n, t)

theorem map_left_inverse (p : Point) : carrier_to_zero (map_zero_to_carrier p) = p := by
  obtain ⟨d, t⟩ := p
  cases d with
  | ofNat n => cases n <;> rfl
  | negSucc n => rfl

theorem map_right_inverse (c : PhysicalCarrier) : map_zero_to_carrier (carrier_to_zero c) = c := by
  cases c with
  | selfConjugate t => rfl
  | conjugatePair n t s => cases s <;> rfl

/-- The map is injective: two zeros with one carrier are one zero. -/
theorem map_injective (p q : Point) (h : map_zero_to_carrier p = map_zero_to_carrier q) : p = q := by
  rw [← map_left_inverse p, ← map_left_inverse q, h]

/-- The map is surjective: every carrier state is the carrier of a zero. -/
theorem map_surjective (c : PhysicalCarrier) : ∃ p, map_zero_to_carrier p = c :=
  ⟨carrier_to_zero c, map_right_inverse c⟩

/-- EQUIVARIANCE. The fold of the chart is charge conjugation on the carrier: s ↦ 1 − s̄ is C. -/
theorem map_fold (p : Point) : map_zero_to_carrier (fold p) = C (map_zero_to_carrier p) := by
  obtain ⟨d, t⟩ := p
  cases d with
  | ofNat n => cases n <;> rfl
  | negSucc n => rfl

/-- The line of the chart is the neutral sector of the carrier. -/
theorem map_neutral_iff_onLine (p : Point) : Neutral (map_zero_to_carrier p) ↔ onLine p := by
  obtain ⟨d, t⟩ := p
  cases d with
  | ofNat n =>
    cases n with
    | zero => exact ⟨fun _ => rfl, fun _ => trivial⟩
    | succ n => exact ⟨fun h => h.elim, fun h => by cases h⟩
  | negSucc n => exact ⟨fun h => h.elim, fun h => by cases h⟩

/-- The registration of the chart is annihilation on the carrier. -/
theorem map_reg (p : Point) : map_zero_to_carrier (reg p) = annihilate (map_zero_to_carrier p) := by
  obtain ⟨d, t⟩ := p
  cases d with
  | ofNat n => cases n <;> rfl
  | negSucc n => rfl

/-- Least erasure on the chart is least erasure on the carrier, configuration by configuration, through the map. -/
theorem le_transports (S : Config) :
    LeastErasure S ↔ ∀ p, S p → annihilate (map_zero_to_carrier p) = map_zero_to_carrier p := by
  constructor
  · intro h p hp
    rw [← map_reg, h p hp]
  · intro h p hp
    exact (reg_erases_nothing_iff p).mpr ((map_neutral_iff_onLine p).mp
      ((annihilate_fixes_iff_neutral _).mp (h p hp)))

/-! ## VIII-c · the mathematical violation forces the physical discard -/

/-- MATHEMATICAL VIOLATION FORCES PHYSICAL DISCARD. A zero off the line is carried to the charged sector; there
    charge conjugation moves it, annihilation does not fix it, and annihilation sends it and its conjugate partner
    to one state. One label, the sign, is lost and kept in no register of the carrier. Theorem; no premise. This
    is h_carrier and h_erase of Part VII, discharged on the concrete carrier. -/
theorem mathematical_violation_forces_physical_discard (p : Point) (h : ¬ onLine p) :
    ¬ Neutral (map_zero_to_carrier p) ∧
    C (map_zero_to_carrier p) ≠ map_zero_to_carrier p ∧
    annihilate (map_zero_to_carrier p) ≠ map_zero_to_carrier p ∧
    annihilate (C (map_zero_to_carrier p)) = annihilate (map_zero_to_carrier p) :=
  have hn : ¬ Neutral (map_zero_to_carrier p) := fun hN => h ((map_neutral_iff_onLine p).mp hN)
  ⟨hn,
   fun hC => hn ((neutral_iff_C_fixed _).mpr hC),
   fun hA => hn ((annihilate_fixes_iff_neutral _).mp hA),
   annihilate_forgets _⟩

/-- ON THE LINE NOTHING IS DISCARDED: the carrier is neutral and annihilation fixes it. -/
theorem on_line_discards_nothing (p : Point) (h : onLine p) :
    Neutral (map_zero_to_carrier p) ∧ annihilate (map_zero_to_carrier p) = map_zero_to_carrier p :=
  have hN := (map_neutral_iff_onLine p).mpr h
  ⟨hN, (annihilate_fixes_iff_neutral _).mpr hN⟩

/-! ## VIII-d · the energetic bookkeeping: labels, entropy, heat -/

/-- LANDAUER'S LAW, ENTERED AS A DEFINITION: the heat of erasing one label at temperature T is T · ln 2 in the
    kernel's units (ln 2 scaled by 10⁶). It is a physical law, not derived here; the kernel's
    `heat_from_joint_conservation` carries only its shape, and no theorem below pretends otherwise. What the
    theorems derive is the count of labels and that the heat is positive exactly when the count is. -/
def landauerHeatPerEvent (T : Nat) : Nat := T * LeastErasureDoF.ln2_scaled

/-- The heat of erasing b labels at temperature T. -/
def landauerHeat (bits T : Nat) : Nat := bits * landauerHeatPerEvent T

/-- The heat is the seed's price (Part III, `price`) at the temperature T · ln 2. -/
theorem landauerHeat_is_price (bits T : Nat) : landauerHeat bits T = price (landauerHeatPerEvent T) bits := rfl

/-- The per-event heat is monotone in the temperature: a temperature floor is a heat floor. This is h_heat of
    Part VII, derived from the law and the floor. -/
theorem heat_floor_from_temperature {T T0 : Nat} (h : T ≥ T0) :
    landauerHeatPerEvent T ≥ landauerHeatPerEvent T0 :=
  Nat.mul_le_mul_right _ h

/-- The per-event heat at the CMB temperature of the kernel is positive. -/
theorem heat_at_cmb_positive : landauerHeatPerEvent LeastErasureDoF.cmb_mK > 0 :=
  Nat.mul_pos (by decide) (by decide)

/-- A FINITE CONFIGURATION AS A SYSTEM OF THE KERNEL: one record per height on the line and one per pair; one free
    label, the sign, per pair; the total the product. -/
def systemOf (F : FinCfg) : LeastErasureDoF.System :=
  ⟨F.line.length + F.pairs.length, F.pairs.length,
   (F.line.length + F.pairs.length) * 2 ^ F.pairs.length, rfl⟩

/-- The same records with every sign gone: the system after annihilation. -/
def systemAfter (F : FinCfg) : LeastErasureDoF.System :=
  ⟨F.line.length + F.pairs.length, 0, (F.line.length + F.pairs.length) * 2 ^ 0, rfl⟩

/-- The entropy the kernel assigns to the configuration is one ln 2 per pair, and after annihilation it is zero:
    the entropy drop of the discard is the erased count times ln 2. -/
theorem entropy_of_discard (F : FinCfg) :
    LeastErasureDoF.sysEntropy (systemOf F) = erased F * LeastErasureDoF.ln2_scaled ∧
    LeastErasureDoF.sysEntropy (systemAfter F) = 0 :=
  ⟨rfl, Nat.zero_mul _⟩

/-- One annihilation is one erasure of the kernel: a system with one more label and twice the total, taken to
    this system. Records kept, one label lost, total halved. -/
def oneAnnihilation (s : LeastErasureDoF.System) (hs : s.distinct > 0) : LeastErasureDoF.EraseProcess :=
  { before := ⟨s.distinct, s.free + 1, 2 * s.total, by
      rw [s.inv, Nat.pow_succ, Nat.mul_comm 2 (s.distinct * 2 ^ s.free), Nat.mul_two, Nat.mul_two,
        Nat.left_distrib]⟩
    after := s
    h_distinct := rfl
    h_free := rfl
    h_total := rfl
    h_gt := by
      show s.total < 2 * s.total
      have hpos : 0 < s.total := by
        rw [s.inv]; exact Nat.mul_pos hs (Nat.two_pow_pos _)
      rw [Nat.two_mul]
      exact Nat.lt_add_of_pos_left hpos }

/-- The kernel's entropy law holds of each annihilation by instance. -/
theorem annihilation_drops_one_ln2 (s : LeastErasureDoF.System) (hs : s.distinct > 0) :
    LeastErasureDoF.sysEntropy (oneAnnihilation s hs).after + LeastErasureDoF.ln2_scaled =
      LeastErasureDoF.sysEntropy (oneAnnihilation s hs).before :=
  LeastErasureDoF.sysEntropy_decrease _

/-- DISCARD FORCES HEAT GENERATION. The annihilation of a finite configuration erases one label per off-line pair,
    the seed's `erased`; at any positive temperature its Landauer heat is zero exactly at the value, and positive
    whenever a point stands off the line. The count is theorem; the law is `landauerHeatPerEvent`. -/
theorem discard_forces_heat_generation (F : FinCfg) (T : Nat) (hT : 0 < T) :
    (landauerHeat (erased F) T = 0 ↔ Value F.pts) ∧
    (¬ Value F.pts → landauerHeat (erased F) T > 0) :=
  have hq : 0 < landauerHeatPerEvent T := Nat.mul_pos hT (by decide)
  have hiff : landauerHeat (erased F) T = 0 ↔ Value F.pts := price_zero_iff_value F _ hq
  ⟨hiff, fun hv => Nat.pos_of_ne_zero (fun h0 => hv (hiff.mp h0))⟩

/-! ## VIII-e · the certified bound, the physical premises, and the physico-formal capstone -/

/-- A CERTIFIED OBSERVATIONAL BOUND: the residual observable R, the sensitivity ε, the certificate R ≤ ε, and the
    name of the dataset that issued it. A measurement is a premise by its nature; this is the type it is entered as. -/
structure CertifiedObservationalBound where
  R : Nat
  ε : Nat
  certificate : R ≤ ε
  dataset : String

/-- The detection gap: the uniform floor a realized charged carrier puts under the residual observable,
    δ = n₀ · r₀ · (T₀ · ln 2). -/
def detectionGap (n0 r0 T0 : Nat) : Nat := n0 * r0 * landauerHeatPerEvent T0

/-- The gap is positive exactly when its three floors are. -/
theorem detectionGap_pos {n0 r0 T0 : Nat} (hn : n0 > 0) (hr : r0 > 0) (hT : T0 > 0) : detectionGap n0 r0 T0 > 0 :=
  Nat.mul_pos (Nat.mul_pos hn hr) (Nat.mul_pos hT (by decide))

/-- THE SIGNAL FLOOR OF A REALIZED CHARGED CARRIER, from the three floors and the coupling: population × rate × heat
    per event is at least n₀ · r₀ · (T₀ · ln 2), and the residual covers it. -/
theorem signal_floor {R n0 r0 T0 T : Nat} (population rate : PhysicalCarrier → Nat) (c : PhysicalCarrier)
    (h_pop : population c ≥ n0) (h_rate : rate c ≥ r0) (h_temp : T ≥ T0)
    (h_couple : R ≥ LeastErasureDoF.residual (population c) (rate c) (landauerHeatPerEvent T)) :
    R ≥ detectionGap n0 r0 T0 :=
  Nat.le_trans (Nat.mul_le_mul (Nat.mul_le_mul h_pop h_rate) (heat_floor_from_temperature h_temp)) h_couple

/-- EVERY VIOLATION EXCEEDS THE DETECTION GAP. Two physical premises, named: the vacuum instantiates the carrier of
    every read zero (h_realize); a realized charged carrier puts the floor δ under R (h_signal). Then a read zero
    off the line forces R ≥ δ. That the zero's carrier is charged is theorem (VIII-c), not premise. -/
theorem every_violation_exceeds_detection_gap
    {Zζ : Config} {R δ : Nat} (realized : PhysicalCarrier → Prop)
    (h_realize : ∀ p, Zζ p → realized (map_zero_to_carrier p))
    (h_signal  : ∀ c, realized c → ¬ Neutral c → R ≥ δ)
    (p : Point) (hp : Zζ p) (hoff : ¬ onLine p) : R ≥ δ :=
  h_signal _ (h_realize p hp) (mathematical_violation_forces_physical_discard p hoff).1

/-- THE BRIDGE OF PART VII, DERIVED. From the two physical premises, a failure of least erasure at the read
    configuration forces R ≥ δ: exactly h_bridge of `classical_rh_from_identification_gap_and_bound`. The step from
    a failed universal to a witness is classical; the cone is printed. -/
theorem bridge_from_realization
    {Zζ : Config} {R δ : Nat} (realized : PhysicalCarrier → Prop)
    (h_realize : ∀ p, Zζ p → realized (map_zero_to_carrier p))
    (h_signal  : ∀ c, realized c → ¬ Neutral c → R ≥ δ) :
    ¬ LeastErasure Zζ → R ≥ δ := by
  intro hnot
  apply Classical.byContradiction
  intro hlt
  apply hnot
  intro p hp
  apply (reg_erases_nothing_iff p).mpr
  apply Classical.byContradiction
  intro hoff
  exact hlt (every_violation_exceeds_detection_gap realized h_realize h_signal p hp hoff)

/-- THE PHYSICO-FORMAL CLOSURE. The capstone, every input printed, the carrier concrete:
    h_read     the reading: the classical hypothesis is the value of the configuration at which the zeros are read;
    h_realize  the vacuum instantiates the carrier of every read zero                               (physics);
    h_pop      a realized charged carrier is a population of at least n₀                            (physics);
    h_rate     a realized charged carrier annihilates at a rate of at least r₀ during the observation (physics);
    h_temp     the temperature during the observation is at least T₀                                (physics);
    h_couple   the residual observable covers the carrier's contribution, population × rate × heat   (physics);
    B          a certified bound R ≤ ε from a named dataset                                           (measurement);
    h_gap      ε < δ = n₀ · r₀ · (T₀ · ln 2)                                                          (arithmetic on the two).
    Discharged on the carrier, no longer hypotheses: that an off-line zero is realized as a charged state, that its
    annihilation erases one label, and that the heat per label is T · ln 2 ≥ T₀ · ln 2.
    Conclusion: the classical hypothesis. Pointwise and constructive; the cone is empty. An empty cone says the
    proof uses no axiom; it discharges none of the eight inputs. -/
theorem classical_rh_from_physico_formal_closure
    {ClassicalRH : Prop} {Zζ : Config} {n0 r0 T0 T : Nat}
    (realized : PhysicalCarrier → Prop) (population rate : PhysicalCarrier → Nat)
    (B : CertifiedObservationalBound)
    (h_read    : ClassicalRH ↔ Value Zζ)
    (h_realize : ∀ p, Zζ p → realized (map_zero_to_carrier p))
    (h_pop     : ∀ c, realized c → ¬ Neutral c → population c ≥ n0)
    (h_rate    : ∀ c, realized c → ¬ Neutral c → rate c ≥ r0)
    (h_temp    : T ≥ T0)
    (h_couple  : ∀ c, realized c → ¬ Neutral c →
                   B.R ≥ LeastErasureDoF.residual (population c) (rate c) (landauerHeatPerEvent T))
    (h_gap     : B.ε < detectionGap n0 r0 T0) :
    ClassicalRH := by
  apply h_read.mpr
  intro p hp
  match decEq p.1 0 with
  | isTrue h => exact h
  | isFalse hoff =>
    have hc : ¬ Neutral (map_zero_to_carrier p) := (mathematical_violation_forces_physical_discard p hoff).1
    have hr := h_realize p hp
    have hfloor : B.R ≥ detectionGap n0 r0 T0 :=
      signal_floor population rate _ (h_pop _ hr hc) (h_rate _ hr hc) h_temp (h_couple _ hr hc)
    exact absurd (Nat.lt_of_le_of_lt (Nat.le_trans hfloor B.certificate) h_gap) (Nat.lt_irrefl _)

/-- NO THIRD POSITION, ON THE CARRIER. Given the reading, the bound and the gap, the denial of the hypothesis and
    the two physical premises cannot all stand: whoever denies the hypothesis has named h_realize or h_signal as
    the premise that fails. -/
theorem no_third_position_on_the_carrier
    {ClassicalRH : Prop} {Zζ : Config} {δ : Nat} (realized : PhysicalCarrier → Prop)
    (B : CertifiedObservationalBound)
    (h_read : ClassicalRH ↔ Value Zζ) (h_gap : B.ε < δ) :
    ¬ (¬ ClassicalRH ∧ (∀ p, Zζ p → realized (map_zero_to_carrier p)) ∧
       (∀ c, realized c → ¬ Neutral c → B.R ≥ δ)) := by
  intro ⟨hno, h_realize, h_signal⟩
  apply hno
  apply h_read.mpr
  intro p hp
  match decEq p.1 0 with
  | isTrue h => exact h
  | isFalse hoff =>
    have hRδ := every_violation_exceeds_detection_gap realized h_realize h_signal p hp hoff
    exact absurd (Nat.lt_of_le_of_lt (Nat.le_trans hRδ B.certificate) h_gap) (Nat.lt_irrefl _)

/-! ## VIII-f · what is premise, shown by witness -/

/-- THE REALIZATION IS THE PREMISE. The predicate that says which carriers the vacuum instantiates is an input:
    under the predicate that realizes every state, h_realize holds at every configuration; under the predicate that
    realizes none, h_realize fails at the pair world of the off point. No theorem of this file chooses between them. -/
theorem realization_is_the_premise :
    (∃ realized : PhysicalCarrier → Prop, ∀ S : Config, ∀ p, S p → realized (map_zero_to_carrier p)) ∧
    (∃ realized : PhysicalCarrier → Prop, ¬ ∀ p, pairWorld offPoint p → realized (map_zero_to_carrier p)) :=
  ⟨⟨fun _ => True, fun _ _ _ => trivial⟩,
   ⟨fun _ => False, fun h => h offPoint (Or.inl rfl)⟩⟩

/-- THE CARRIER ALONE DECIDES NOTHING. The pair world of the off point is closed, lacks least erasure, and its
    carriers are charged; with no realization premise and no bound no theorem above reaches the value there. -/
theorem the_carrier_alone_decides_nothing :
    Closed (pairWorld offPoint) ∧ ¬ LeastErasure (pairWorld offPoint) ∧
    ¬ Neutral (map_zero_to_carrier offPoint) :=
  ⟨pair_world_closed offPoint,
   fun hle => off_point_is_off ((reg_erases_nothing_iff offPoint).mp (hle offPoint (Or.inl rfl))),
   (mathematical_violation_forces_physical_discard offPoint off_point_is_off).1⟩

/-- THE LAW IS NOT DERIVED. Landauer's heat is a definition of this file: at temperature zero it is zero for every
    count. The theorem records that nothing in the kernel forces the heat, only counts it. -/
theorem landauer_is_entered_not_derived (bits : Nat) : landauerHeat bits 0 = 0 := by
  unfold landauerHeat landauerHeatPerEvent
  rw [Nat.zero_mul, Nat.mul_zero]

/-! ## VIII-h · the root on the physical side: the floor is there, and the realization is not -/

/-- THE PHYSICAL FLOOR: that some state is realized. -/
def PhysicalFloor (realized : PhysicalCarrier → Prop) : Prop := ∃ c, realized c

/-- THE PHYSICAL FLOOR IS SELF-GROUNDING, in the seed's own sense (Part I, `SelfGrounding`): an act of measurement
    is a realized state, so every act, the act of denial included, instantiates the floor. Constructed, not posited:
    the acts, one act, and the state each act realizes are the three fields, and the floor follows from them. -/
def physicalFloorGrounding (realized : PhysicalCarrier → Prop) (Act : Type) (anAct : Act)
    (stateOf : Act → PhysicalCarrier) (h : ∀ a, realized (stateOf a)) :
    SelfGrounding (PhysicalFloor realized) :=
  ⟨Act, anAct, fun a => ⟨stateOf a, h a⟩⟩

/-- THE PHYSICAL FLOOR DECIDES NO REALIZATION. Under the predicate that realizes exactly the apparatus state, the
    floor holds, the floor is self-grounding, and the realization of the off-line zero fails at the pair world. The
    floor is there and the carrier of the off-line zero is not: the mirror, on the physical side, of the seed's
    `the_floor_alone_decides_no_value`. The passage from "some state is realized" to "the carrier of every read zero
    is realized" is not an inference from the floor; it is the second layer, the act at the configuration. -/
theorem the_physical_floor_decides_no_realization :
    ∃ realized : PhysicalCarrier → Prop,
      PhysicalFloor realized ∧
      SelfVerifying (PhysicalFloor realized) ∧
      ¬ ∀ p, pairWorld offPoint p → realized (map_zero_to_carrier p) :=
  ⟨fun c => c = PhysicalCarrier.selfConjugate 0,
   ⟨_, rfl⟩,
   fun _ => ⟨_, rfl⟩,
   fun h => by have e := h offPoint (Or.inl rfl); cases e⟩

/-- THE REALIZATION IS NOT THE FLOOR: identified on every configuration, they would agree at the pair world, where
    the floor holds and the realization fails. The mirror of the seed's `floor_is_not_least_erasure`. -/
theorem realization_is_not_the_floor :
    ¬ ∀ realized : PhysicalCarrier → Prop, ∀ S : Config,
        (PhysicalFloor realized ↔ ∀ p, S p → realized (map_zero_to_carrier p)) := by
  intro h
  obtain ⟨realized, hfloor, _, hfail⟩ := the_physical_floor_decides_no_realization
  exact hfail ((h realized (pairWorld offPoint)).mp hfloor)

/-- THE PHYSICAL ROUTE READS THE ROOT TWICE. The physical premises, the certified bound and the gap deliver, at the
    read configuration, exactly what the seed says the act supplies: the root read twice, `RootReadTwice Zζ`, which
    is the value there by `the_root_read_twice_is_the_value`. The physics is the second layer, not the first. -/
theorem the_physical_route_reads_the_root_twice
    {Zζ : Config} {n0 r0 T0 T : Nat}
    (realized : PhysicalCarrier → Prop) (population rate : PhysicalCarrier → Nat)
    (B : CertifiedObservationalBound)
    (h_realize : ∀ p, Zζ p → realized (map_zero_to_carrier p))
    (h_pop     : ∀ c, realized c → ¬ Neutral c → population c ≥ n0)
    (h_rate    : ∀ c, realized c → ¬ Neutral c → rate c ≥ r0)
    (h_temp    : T ≥ T0)
    (h_couple  : ∀ c, realized c → ¬ Neutral c →
                   B.R ≥ LeastErasureDoF.residual (population c) (rate c) (landauerHeatPerEvent T))
    (h_gap     : B.ε < detectionGap n0 r0 T0) :
    RootReadTwice Zζ :=
  (the_root_read_twice_is_the_value Zζ).mpr
    (classical_rh_from_physico_formal_closure (ClassicalRH := Value Zζ) realized population rate B Iff.rfl
      h_realize h_pop h_rate h_temp h_couple h_gap)

/-- THE ONE EXIT, SHAPED. Under the reading, a certified bound, the gap, and the signal floor of a realized charged
    carrier, a denial of the hypothesis asserts a read zero off the line whose carrier is realized in no measured
    register: a second register, a second world. The denier owns that assertion; nothing else is open. The step from
    the failed universal to its witness is classical; the cone is printed. -/
theorem the_one_exit_is_a_second_register
    {ClassicalRH : Prop} {Zζ : Config} {δ : Nat} (realized : PhysicalCarrier → Prop)
    (B : CertifiedObservationalBound) (h_read : ClassicalRH ↔ Value Zζ) (h_gap : B.ε < δ)
    (h_signal : ∀ c, realized c → ¬ Neutral c → B.R ≥ δ) :
    ¬ ClassicalRH → ∃ p, Zζ p ∧ ¬ onLine p ∧ ¬ realized (map_zero_to_carrier p) := by
  intro hno
  apply Classical.byContradiction
  intro hnone
  apply hno
  apply h_read.mpr
  intro p hp
  match decEq p.1 0 with
  | isTrue h => exact h
  | isFalse hoff =>
    exact (hnone ⟨p, hp, hoff, fun hr =>
      absurd (Nat.lt_of_le_of_lt (Nat.le_trans
        (h_signal _ hr (mathematical_violation_forces_physical_discard p hoff).1) B.certificate) h_gap)
        (Nat.lt_irrefl _)⟩).elim

/-! ## VIII-g · the physico-formal closure, bound -/

/-- THE PHYSICO-FORMAL CLOSURE, BOUND. The hardened closure of Part VII; the closure on the physical carrier; the
    map's two inverses and its equivariance; the line as the neutral sector; the registration as annihilation; the
    violation forcing the discard; the discard forcing the heat; every violation exceeding the gap; the bridge
    derived; the capstone; no third position on the carrier; the two witnesses of what is premise; and the four
    laws of the root on the physical side: the floor decides no realization, the realization is not the floor, the
    physical route reads the root twice, and the one exit is a second register. -/
theorem the_physico_formal_closure :
    (type_of% @Hardening.the_hardened_closure) ∧
    (type_of% @the_closure_on_the_physical_carrier) ∧
    (type_of% @map_left_inverse) ∧
    (type_of% @map_right_inverse) ∧
    (type_of% @map_fold) ∧
    (type_of% @map_neutral_iff_onLine) ∧
    (type_of% @map_reg) ∧
    (type_of% @le_transports) ∧
    (type_of% @mathematical_violation_forces_physical_discard) ∧
    (type_of% @discard_forces_heat_generation) ∧
    (type_of% @every_violation_exceeds_detection_gap) ∧
    (type_of% @bridge_from_realization) ∧
    (type_of% @classical_rh_from_physico_formal_closure) ∧
    (type_of% @no_third_position_on_the_carrier) ∧
    (type_of% @realization_is_the_premise) ∧
    (type_of% @landauer_is_entered_not_derived) ∧
    (type_of% @the_physical_floor_decides_no_realization) ∧
    (type_of% @realization_is_not_the_floor) ∧
    (type_of% @the_physical_route_reads_the_root_twice) ∧
    (type_of% @the_one_exit_is_a_second_register) :=
  ⟨@Hardening.the_hardened_closure, @the_closure_on_the_physical_carrier,
   @map_left_inverse, @map_right_inverse, @map_fold, @map_neutral_iff_onLine, @map_reg, @le_transports,
   @mathematical_violation_forces_physical_discard, @discard_forces_heat_generation,
   @every_violation_exceeds_detection_gap, @bridge_from_realization,
   @classical_rh_from_physico_formal_closure, @no_third_position_on_the_carrier,
   @realization_is_the_premise, @landauer_is_entered_not_derived,
   @the_physical_floor_decides_no_realization, @realization_is_not_the_floor,
   @the_physical_route_reads_the_root_twice, @the_one_exit_is_a_second_register⟩

end PhysicoFormal
end PartVIII

/-! ## Part VIII · the cones, pinned -/

/-- info: 'PhysicoFormal.the_closure_on_the_physical_carrier' does not depend on any axioms -/
#guard_msgs in #print axioms PhysicoFormal.the_closure_on_the_physical_carrier
/-- info: 'PhysicoFormal.map_left_inverse' does not depend on any axioms -/
#guard_msgs in #print axioms PhysicoFormal.map_left_inverse
/-- info: 'PhysicoFormal.map_right_inverse' does not depend on any axioms -/
#guard_msgs in #print axioms PhysicoFormal.map_right_inverse
/-- info: 'PhysicoFormal.map_fold' does not depend on any axioms -/
#guard_msgs in #print axioms PhysicoFormal.map_fold
/-- info: 'PhysicoFormal.map_neutral_iff_onLine' does not depend on any axioms -/
#guard_msgs in #print axioms PhysicoFormal.map_neutral_iff_onLine
/-- info: 'PhysicoFormal.map_reg' does not depend on any axioms -/
#guard_msgs in #print axioms PhysicoFormal.map_reg
/-- info: 'PhysicoFormal.le_transports' does not depend on any axioms -/
#guard_msgs in #print axioms PhysicoFormal.le_transports
/-- info: 'PhysicoFormal.mathematical_violation_forces_physical_discard' does not depend on any axioms -/
#guard_msgs in #print axioms PhysicoFormal.mathematical_violation_forces_physical_discard
/-- info: 'PhysicoFormal.oneAnnihilation' does not depend on any axioms -/
#guard_msgs in #print axioms PhysicoFormal.oneAnnihilation
/-- info: 'PhysicoFormal.discard_forces_heat_generation' does not depend on any axioms -/
#guard_msgs in #print axioms PhysicoFormal.discard_forces_heat_generation
/-- info: 'PhysicoFormal.every_violation_exceeds_detection_gap' does not depend on any axioms -/
#guard_msgs in #print axioms PhysicoFormal.every_violation_exceeds_detection_gap
/-- info: 'PhysicoFormal.bridge_from_realization' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PhysicoFormal.bridge_from_realization
/-- info: 'PhysicoFormal.classical_rh_from_physico_formal_closure' does not depend on any axioms -/
#guard_msgs in #print axioms PhysicoFormal.classical_rh_from_physico_formal_closure
/-- info: 'PhysicoFormal.no_third_position_on_the_carrier' does not depend on any axioms -/
#guard_msgs in #print axioms PhysicoFormal.no_third_position_on_the_carrier
/-- info: 'PhysicoFormal.realization_is_the_premise' does not depend on any axioms -/
#guard_msgs in #print axioms PhysicoFormal.realization_is_the_premise
/-- info: 'PhysicoFormal.the_physical_floor_decides_no_realization' does not depend on any axioms -/
#guard_msgs in #print axioms PhysicoFormal.the_physical_floor_decides_no_realization
/-- info: 'PhysicoFormal.realization_is_not_the_floor' does not depend on any axioms -/
#guard_msgs in #print axioms PhysicoFormal.realization_is_not_the_floor
/-- info: 'PhysicoFormal.the_physical_route_reads_the_root_twice' does not depend on any axioms -/
#guard_msgs in #print axioms PhysicoFormal.the_physical_route_reads_the_root_twice
/-- info: 'PhysicoFormal.the_one_exit_is_a_second_register' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PhysicoFormal.the_one_exit_is_a_second_register
/-- info: 'PhysicoFormal.the_physico_formal_closure' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PhysicoFormal.the_physico_formal_closure

#print axioms PhysicoFormal.mathematical_violation_forces_physical_discard
#print axioms PhysicoFormal.discard_forces_heat_generation
#print axioms PhysicoFormal.classical_rh_from_physico_formal_closure
#print axioms PhysicoFormal.no_third_position_on_the_carrier
#print axioms PhysicoFormal.the_physical_floor_decides_no_realization
#print axioms PhysicoFormal.the_physical_route_reads_the_root_twice
#print axioms PhysicoFormal.the_physico_formal_closure
