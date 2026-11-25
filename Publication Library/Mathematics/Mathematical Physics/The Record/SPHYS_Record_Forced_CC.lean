/-
  SPHYS_Record_Forced_CC.lean · The record of acts: the step law and the one sign, proved · core Lean 4, no library.

  RATIONALE. Three drafts of the horizon group (chronology protection, the area theorem, the Page turnover) took
  two hypotheses in every theorem: the step law (the record changes by what is registered and by nothing else)
  and the one sign (no gain is negative). This file removes both. It builds the record as a concrete object from
  the registration `reg` of the seat, proves the step law and the one sign for that object in the kernel, and
  then instantiates the theorems of those files on it. The instantiated theorems carry no hypothesis of
  principle: what is left in their statements is the scenario (a span, and an act inside it that erases).

  DESIGN.
    (1) The seat: points are integer pairs, `fold` reflects the first coordinate about 1, `reg` sets it to 1.
        These are the definitions of the Arrow of Time engine, restated so the file stands alone.
    (2) An act is the registration of one state. Its gain is 1 when the registration changes the state and 0
        when it does not. `a_gain_is_a_merged_pair` proves that a gain of 1 is exactly a distinct state merged
        with its fold partner: one bit, the side, is erased. `an_erasing_act_cannot_be_undone` proves that no
        map restores both partners. The sign is therefore not assumed: a gain counts erased bits.
    (3) The record of a history (a list of states acted on, in the order of the acts) is the sum of its gains.
        `record_step` is the step law. `record_never_decreases` is monotonicity along the order of the acts.
    (4) Parts IV and V carry the chronology and area namespaces of the two source files, unchanged, and Part VI
        applies their theorems to the record with both hypotheses discharged.
    (5) Parts VII to IX carry the Page, holography and censorship namespaces, unchanged: forms, each on the
        hypotheses its statements print. Part X proves what the record gives of each: the turnover with both
        Page hypotheses discharged, a reading through the record blind to the side, and a record bounded by
        the number of acts.

  WHAT THIS FILE DOES NOT PROVE (read before editing or citing).
    (a) It does not prove that a physical clock, horizon or traveller is such a record. That identification is a
        bridge, at premise grade: a physical process is a sequence of registrations. The kernel cannot check it.
    (b) It does not derive the direction of time. `record_reverse` proves the count is the same read backwards.
        The record grows along the order in which the acts are done, and that order is an input of the object
        (the list). This agrees with the Arrow of Time engine: the law does not carry the arrow; the order of the acts does.
    (c) It computes no geometry. No metric, no horizon area in square metres, no causal structure.

  RISK. A reader may take "no hypothesis" as "chronology protection is proved for spacetime". It is proved for
  every record of acts. The header of Part VI repeats this. The theorems of Parts VII to IX keep their hypotheses,
  and Part X discharges only what its own statements say.
  NON-NEGOTIABLE. No axiom is declared. No hypothesis named `step`, `gain_nonneg` or `one_sign` may reappear in
  a theorem of Part VI or Part X. The kernel line of every theorem is printed at the end, and none may show choice.
-/
namespace SPHYS.Record

/-! ## Part I. The seat and its registration -/

abbrev Pt := Int × Int
/-- The reflection of the seat. -/
def fold (p : Pt) : Pt := (2 - p.1, p.2)
/-- The line the reflection fixes. -/
def OnLine (p : Pt) : Prop := p.1 = 1
/-- The registration: it keeps the height and forgets the side. -/
def reg (p : Pt) : Pt := (1, p.2)

instance (p : Pt) : Decidable (OnLine p) := inferInstanceAs (Decidable (p.1 = 1))

theorem reg_forgets_side (p : Pt) : reg (fold p) = reg p := rfl

theorem reg_fixes_iff (p : Pt) : reg p = p ↔ OnLine p := by
  obtain ⟨a, b⟩ := p
  show ((1 : Int), b) = (a, b) ↔ a = 1
  constructor
  · intro h; exact (congrArg Prod.fst h).symm
  · intro h; rw [h]

theorem fold_fixes_iff (p : Pt) : fold p = p ↔ OnLine p := by
  obtain ⟨a, b⟩ := p
  show ((2 : Int) - a, b) = (a, b) ↔ a = 1
  constructor
  · intro h
    have h1 : 2 - a = a := congrArg Prod.fst h
    omega
  · intro h
    have h1 : 2 - a = a := by omega
    rw [h1]

/-! ## Part II. The gain of one act is a count of erased bits -/

/-- The gain of registering the state p: 1 if the registration changes it, 0 if it does not. -/
def gain (p : Pt) : Nat := if p.1 = 1 then 0 else 1

theorem gain_le_one (p : Pt) : gain p ≤ 1 := by
  unfold gain; split <;> omega

theorem gain_pos_iff_off (p : Pt) : 0 < gain p ↔ ¬ OnLine p := by
  unfold gain OnLine
  by_cases h : p.1 = 1
  · rw [if_pos h]; exact ⟨fun h0 => absurd h0 (Nat.lt_irrefl 0), fun hn => absurd h hn⟩
  · rw [if_neg h]; exact ⟨fun _ => h, fun _ => Nat.one_pos⟩

/-- A gain is positive exactly when the registration changed the state. -/
theorem gain_pos_iff_erases (p : Pt) : 0 < gain p ↔ reg p ≠ p := by
  rw [gain_pos_iff_off]; exact not_congr (reg_fixes_iff p).symm

/-- A GAIN IS A MERGED PAIR. The gain is positive exactly when the state has a distinct fold partner, and the
    registration writes the two as one. What is erased is one bit: the side. -/
theorem a_gain_is_a_merged_pair (p : Pt) : 0 < gain p ↔ fold p ≠ p ∧ reg (fold p) = reg p := by
  rw [gain_pos_iff_off]
  constructor
  · intro h; exact ⟨fun e => h ((fold_fixes_iff p).mp e), rfl⟩
  · intro h e; exact h.1 ((fold_fixes_iff p).mpr e)

/-- AN ERASING ACT CANNOT BE UNDONE. Where the gain is positive, no map restores both partners from their
    one registration. This is the sign of the gain, proved and not read. -/
theorem an_erasing_act_cannot_be_undone (p : Pt) (hp : 0 < gain p) :
    ¬ ∃ g : Pt → Pt, g (reg p) = p ∧ g (reg (fold p)) = fold p := by
  intro ⟨g, h1, h2⟩
  rw [reg_forgets_side, h1] at h2
  exact ((a_gain_is_a_merged_pair p).mp hp).1 h2.symm

/-- The theorem of the Arrow of Time engine, here a corollary: registration has no left inverse. -/
theorem registration_has_no_left_inverse : ¬ ∃ g : Pt → Pt, ∀ p, g (reg p) = p := by
  intro ⟨g, hg⟩
  exact an_erasing_act_cannot_be_undone (0, 0) (by decide) ⟨g, hg _, hg _⟩

/-! ## Part III. The record of a history -/

/-- The record of a history: the number of bits its acts erased. -/
def record : List Pt → Nat
  | [] => 0
  | p :: h => gain p + record h

theorem record_append (h t : List Pt) : record (h ++ t) = record h + record t := by
  induction h with
  | nil => simp only [List.nil_append, record]; omega
  | cons p h ih => simp only [List.cons_append, record, ih]; omega

/-- THE STEP LAW, PROVED. One more act changes the record by that act's gain and by nothing else. -/
theorem record_step (h : List Pt) (p : Pt) : record (h ++ [p]) = record h + gain p := by
  rw [record_append]; simp only [record]; omega

/-- THE RECORD NEVER DECREASES along the order of the acts, whatever the acts are. -/
theorem record_never_decreases (h t : List Pt) : record h ≤ record (h ++ t) := by
  rw [record_append]; omega

theorem record_pos_of_erasing (t : List Pt) (p : Pt) (hm : p ∈ t) (hp : 0 < gain p) : 0 < record t := by
  induction t with
  | nil => cases hm
  | cons q t ih =>
    simp only [record]
    rcases List.mem_cons.mp hm with e | e
    · subst e; omega
    · have := ih e; omega

/-- NO RETURN. A continuation that holds one erasing act leaves the record strictly above where it was. -/
theorem no_return (h t : List Pt) (p : Pt) (hm : p ∈ t) (hp : 0 < gain p) : record h < record (h ++ t) := by
  rw [record_append]
  have := record_pos_of_erasing t p hm hp
  omega

/-- A LOOP IS IDLE. If a continuation returns the record to where it was, every act in it left its state
    unchanged: nothing was registered anywhere along it. -/
theorem a_loop_is_idle (h t : List Pt) (hloop : record (h ++ t) = record h) (p : Pt) (hm : p ∈ t) :
    reg p = p := by
  rw [record_append] at hloop
  have hg : ¬ 0 < gain p := fun hp => by
    have := record_pos_of_erasing t p hm hp
    omega
  exact (reg_fixes_iff p).mpr (Decidable.of_not_not (fun hn => hg ((gain_pos_iff_off p).mpr hn)))

/-- THE COUNT IS EVEN UNDER REVERSAL. Read backwards, a history has the same record. The record does not grow
    because of a direction written in the law; it grows along the order in which the acts are done. -/
theorem record_reverse (h : List Pt) : record h.reverse = record h := by
  induction h with
  | nil => rfl
  | cons p h ih => rw [List.reverse_cons, record_append, ih]; simp only [record]; omega

/-- A process: the state acted on at each step. Its history after n steps, its record, and its gains. -/
def pre (s : Nat → Pt) : Nat → List Pt
  | 0 => []
  | n + 1 => pre s n ++ [s n]
def recN (s : Nat → Pt) (n : Nat) : Int := ((record (pre s n) : Nat) : Int)
def gainN (s : Nat → Pt) (n : Nat) : Int := ((gain (s n) : Nat) : Int)

/-- The step law of the source files, as a theorem of the record. -/
theorem step_law (s : Nat → Pt) (n : Nat) : recN s (n + 1) = recN s n + gainN s n := by
  show ((record (pre s n ++ [s n]) : Nat) : Int) = ((record (pre s n) : Nat) : Int) + ((gain (s n) : Nat) : Int)
  rw [record_step]; omega

/-- The one sign of the source files, as a theorem of the record. -/
theorem one_sign (s : Nat → Pt) (n : Nat) : 0 ≤ gainN s n := by
  show (0 : Int) ≤ ((gain (s n) : Nat) : Int)
  omega

end SPHYS.Record

/-! ## Part IV. The chronology file, carried unchanged (its theorems take `step` and `gain_nonneg` as hypotheses) -/

namespace SPHYS.Chronology

/-- The total registered over a span of k steps starting at m. -/
def totalGain (gain : Nat → Int) (m : Nat) : Nat → Int
  | 0 => 0
  | k + 1 => totalGain gain m k + gain (m + k)

/-- THE RECORD IS ITS GAINS. After k steps the record is the starting record plus the total registered
    over the span. Proved by induction on the span. -/
theorem record_is_start_plus_gains (rec gain : Nat → Int)
    (step : ∀ n : Nat, rec (n + 1) = rec n + gain n) (m k : Nat) :
    rec (m + k) = rec m + totalGain gain m k := by
  induction k with
  | zero => simp [totalGain]
  | succ k ih =>
    have hs := step (m + k)
    have e : m + (k + 1) = m + k + 1 := by omega
    have ek : totalGain gain m (k + 1) = totalGain gain m k + gain (m + k) := by
      simp only [totalGain]
    rw [e, hs, ih, ek]
    omega

/-- THE TOTAL IS NONNEGATIVE. Registration has no inverse: every gain is nonnegative, so every span's
    total is nonnegative, and the record never returns below any earlier state. -/
theorem total_gain_nonnegative (gain : Nat → Int) (gain_nonneg : ∀ n : Nat, 0 ≤ gain n)
    (m k : Nat) : 0 ≤ totalGain gain m k := by
  induction k with
  | zero => simp [totalGain]
  | succ k ih =>
    unfold totalGain
    have h := gain_nonneg (m + k)
    omega

/-- EVERY STEP'S GAIN IS IN THE TOTAL. For j inside the span, the gain at step m + j is at most the
    span's total: the total is a sum of nonnegative terms, one of which is that gain. -/
theorem gain_le_total (gain : Nat → Int) (gain_nonneg : ∀ n : Nat, 0 ≤ gain n)
    (m k j : Nat) (hj : j < k) : gain (m + j) ≤ totalGain gain m k := by
  induction k with
  | zero => omega
  | succ k ih =>
    unfold totalGain
    have hnn := total_gain_nonnegative gain gain_nonneg m k
    have hg := gain_nonneg (m + k)
    by_cases hjk : j = k
    · subst hjk
      omega
    · have hlt : j < k := by omega
      have h := ih hlt
      omega

/-- A LOOP REGISTERS NOTHING. If a span returns the record to its starting state, every gain inside the
    span is zero: nothing was registered anywhere along it. A closed chain of registrations is silent. -/
theorem a_loop_registers_nothing (rec gain : Nat → Int)
    (step : ∀ n : Nat, rec (n + 1) = rec n + gain n) (gain_nonneg : ∀ n : Nat, 0 ≤ gain n)
    (m k j : Nat) (hj : j < k) (hloop : rec (m + k) = rec m) : gain (m + j) = 0 := by
  have hrec := record_is_start_plus_gains rec gain step m k
  have htot : totalGain gain m k = 0 := by omega
  have hle := gain_le_total gain gain_nonneg m k j hj
  have hnn := gain_nonneg (m + j)
  omega

/-- CHRONOLOGY PROTECTION, THE FORM. If any step inside a span registers positively — as the passage of
    any physical traveler does — the record at the span's end is strictly above its start. No span that
    carries a registration returns to its starting state: there is no closed registration chain, and so
    no closed timelike curve for anything that registers. -/
theorem chronology_protection (rec gain : Nat → Int)
    (step : ∀ n : Nat, rec (n + 1) = rec n + gain n) (gain_nonneg : ∀ n : Nat, 0 ≤ gain n)
    (m k j : Nat) (hj : j < k) (hpos : 0 < gain (m + j)) : rec m < rec (m + k) := by
  have hrec := record_is_start_plus_gains rec gain step m k
  have hle := gain_le_total gain gain_nonneg m k j hj
  have hnn := total_gain_nonnegative gain gain_nonneg m k
  omega

end SPHYS.Chronology

/-! ## Part V. The area file, carried unchanged (its theorems take `step` and `one_sign` as hypotheses) -/

namespace SPHYS.AreaTheorem

/-- NO STEP SHRINKS THE HORIZON. Given the step law and the one sign, at every step the area does not
    decrease: registration has no inverse and the flux has one sign. -/
theorem no_step_shrinks (area flux : Nat → Int)
    (step : ∀ n : Nat, area (n + 1) = area n + flux n) (one_sign : ∀ n : Nat, 0 ≤ flux n)
    (n : Nat) : area n ≤ area (n + 1) := by
  rw [step n]
  have h := one_sign n
  omega

/-- A STEP IS FLAT EXACTLY WHEN NOTHING CROSSES. Area is unchanged at a step if and only if the flux at
    that step is zero. -/
theorem flat_step_iff_no_flux (area flux : Nat → Int)
    (step : ∀ n : Nat, area (n + 1) = area n + flux n) (n : Nat) :
    area (n + 1) = area n ↔ flux n = 0 := by
  rw [step n]
  exact ⟨fun h => by omega, fun h => by omega⟩

/-- THE AREA THEOREM. Over any span of steps the horizon's area does not decrease: for every start m and
    every span k, area m ≤ area (m + k). Hawking's theorem as the seat forces it — the forced law, the one
    sign, and a record with no inverse. -/
theorem area_never_decreases (area flux : Nat → Int)
    (step : ∀ n : Nat, area (n + 1) = area n + flux n) (one_sign : ∀ n : Nat, 0 ≤ flux n)
    (m k : Nat) : area m ≤ area (m + k) := by
  induction k with
  | zero => simp
  | succ k ih =>
    have hs := step (m + k)
    have hf := one_sign (m + k)
    have e : m + (k + 1) = m + k + 1 := by omega
    rw [e]
    omega

/-- GROWTH IS STRICT WHEN ANYTHING CROSSES. If the flux at some step is positive, the area after that
    step exceeds the area before it. -/
theorem crossing_grows_the_area (area flux : Nat → Int)
    (step : ∀ n : Nat, area (n + 1) = area n + flux n) (n : Nat) (h : 0 < flux n) :
    area n < area (n + 1) := by
  rw [step n]
  omega

/-- THE MERGER FORM. Two horizons of areas a and b join; the joined horizon's area is the sum plus the
    flux of the joining step, which has the one sign. The final area is at least the sum of the two —
    the form the merger observations read. -/
theorem merger_area_at_least_the_sum (a b f : Int) (hf : 0 ≤ f) : a + b ≤ a + b + f := by
  omega

/-- AREA IS THE HORIZON'S ENTROPY SHAPE. Any reading of the horizon that is a positive multiple of the
    area is likewise non-decreasing over every span: the second law's shape survives the (measured)
    constant that turns area into entropy. -/
theorem every_positive_multiple_is_monotone (area flux : Nat → Int)
    (step : ∀ n : Nat, area (n + 1) = area n + flux n) (one_sign : ∀ n : Nat, 0 ≤ flux n)
    (c : Int) (hc : 0 < c) (m k : Nat) :
    c * area m ≤ c * area (m + k) := by
  have h := area_never_decreases area flux step one_sign m k
  have h2 : c * area (m + k) - c * area m = c * (area (m + k) - area m) := by
    rw [Int.mul_sub]
  have h3 : 0 ≤ c * (area (m + k) - area m) :=
    Int.mul_nonneg (Int.le_of_lt hc) (by omega)
  omega

end SPHYS.AreaTheorem

/-! ## Part VI. The hypotheses discharged
    Every theorem below is about the record of acts of Part III. None takes the step law or the sign as a
    hypothesis. None is a statement about a metric: see (a) to (c) of the header. -/
namespace SPHYS.Record

/-- CHRONOLOGY PROTECTION FOR EVERY RECORD OF ACTS. For any process whatever, if one act inside a span changes
    its state, the record at the end of the span is strictly above the record at its start. No hypothesis of
    principle: the step law and the sign are `step_law` and `one_sign`. -/
theorem chronology_protection_of_the_record (s : Nat → Pt) (m k j : Nat) (hj : j < k)
    (hact : reg (s (m + j)) ≠ s (m + j)) : recN s m < recN s (m + k) :=
  SPHYS.Chronology.chronology_protection (recN s) (gainN s) (step_law s) (one_sign s) m k j hj (by
    show (0 : Int) < ((gain (s (m + j)) : Nat) : Int)
    have := (gain_pos_iff_erases (s (m + j))).mpr hact
    omega)

/-- A CLOSED CHAIN IS IDLE. If a span returns the record to its start, every act inside it left its state
    unchanged. -/
theorem a_closed_chain_is_idle (s : Nat → Pt) (m k j : Nat) (hj : j < k)
    (hloop : recN s (m + k) = recN s m) : reg (s (m + j)) = s (m + j) := by
  have h0 : ((gain (s (m + j)) : Nat) : Int) = 0 :=
    SPHYS.Chronology.a_loop_registers_nothing (recN s) (gainN s) (step_law s) (one_sign s) m k j hj hloop
  have hg : ¬ 0 < gain (s (m + j)) := fun hp => by omega
  exact (reg_fixes_iff _).mpr (Decidable.of_not_not (fun hn => hg ((gain_pos_iff_off _).mpr hn)))

/-- A surface whose count is a starting value plus the record of what was registered on it. -/
def area (a0 : Int) (s : Nat → Pt) (n : Nat) : Int := a0 + recN s n

theorem area_step (a0 : Int) (s : Nat → Pt) (n : Nat) : area a0 s (n + 1) = area a0 s n + gainN s n := by
  show a0 + recN s (n + 1) = a0 + recN s n + gainN s n
  rw [step_law]; omega

/-- THE AREA THEOREM FOR EVERY REGISTRATION SURFACE. Over any span the count does not decrease. -/
theorem area_theorem_of_the_record (a0 : Int) (s : Nat → Pt) (m k : Nat) : area a0 s m ≤ area a0 s (m + k) :=
  SPHYS.AreaTheorem.area_never_decreases (area a0 s) (gainN s) (area_step a0 s) (one_sign s) m k

/-- Any positive multiple of the count is monotone too: the shape of the second law, the constant measured. -/
theorem entropy_shape_of_the_record (a0 c : Int) (hc : 0 < c) (s : Nat → Pt) (m k : Nat) :
    c * area a0 s m ≤ c * area a0 s (m + k) :=
  SPHYS.AreaTheorem.every_positive_multiple_is_monotone (area a0 s) (gainN s) (area_step a0 s) (one_sign s) c hc m k

/-- THE TWO HYPOTHESES OF THE PAGE FILE, PROVED. Let the radiation's record be the record of acts and the hole's
    be the rest of a total T. Then the record is complete at every step and the hole's share never grows. That
    evaporation ends, with the hole's share at zero, remains the definition of the process. -/
theorem page_hypotheses_of_the_record (T : Int) (s : Nat → Pt) :
    (∀ n : Nat, (T - recN s n) + recN s n = T) ∧ (∀ n : Nat, T - recN s (n + 1) ≤ T - recN s n) := by
  refine ⟨fun n => by omega, fun n => ?_⟩
  have h1 := step_law s n
  have h2 := one_sign s n
  omega

/-- THE CAPSTONE. For every process: the step law holds, no gain is negative, a gain is a merged pair that no
    map separates again, a span with one erasing act never returns, and the count is the same read backwards. -/
theorem the_record_of_acts :
    (∀ (s : Nat → Pt) (n : Nat), recN s (n + 1) = recN s n + gainN s n) ∧
    (∀ (s : Nat → Pt) (n : Nat), 0 ≤ gainN s n) ∧
    (∀ p : Pt, 0 < gain p ↔ fold p ≠ p ∧ reg (fold p) = reg p) ∧
    (∀ p : Pt, 0 < gain p → ¬ ∃ g : Pt → Pt, g (reg p) = p ∧ g (reg (fold p)) = fold p) ∧
    (∀ (s : Nat → Pt) (m k j : Nat), j < k → reg (s (m + j)) ≠ s (m + j) → recN s m < recN s (m + k)) ∧
    (∀ h : List Pt, record h.reverse = record h) :=
  ⟨step_law, one_sign, a_gain_is_a_merged_pair, an_erasing_act_cannot_be_undone,
   chronology_protection_of_the_record, record_reverse⟩

end SPHYS.Record

/-! ## Part VII. The Page file, carried unchanged (forms on the hypotheses `complete` and the two endpoints) -/

namespace SPHYS.PageCurve

/-- THE RADIATION'S RECORD NEVER SHRINKS. If the record is complete at every step and the hole's record
    never grows, then over any span of steps the radiation's record does not decrease: what has been
    registered in the radiation is never unregistered. -/
theorem radiation_record_never_shrinks (H R : Nat → Int) (T : Int)
    (complete : ∀ n : Nat, H n + R n = T)
    (hole_declines : ∀ n : Nat, H (n + 1) ≤ H n)
    (m k : Nat) : R m ≤ R (m + k) := by
  induction k with
  | zero => simp
  | succ k ih =>
    have hs := hole_declines (m + k)
    have c1 := complete (m + k)
    have c2 := complete (m + k + 1)
    have e : m + (k + 1) = m + k + 1 := by omega
    rw [e]
    omega

/-- AT EVERY STEP ONE SIDE HOLDS THE MAJORITY. Completeness alone forces the dichotomy: at each step,
    either the radiation holds at least half the record or the hole holds more than half. There is no step
    at which the record is nowhere — the majority is always somewhere, and it can only change hands. -/
theorem majority_is_always_somewhere (H R : Nat → Int) (T : Int)
    (complete : ∀ n : Nat, H n + R n = T) (n : Nat) :
    T ≤ 2 * R n ∨ T < 2 * H n := by
  have c := complete n
  omega

/-- THE FIRST STEP'S ACCOUNTING. If the hole holds the whole record at the first step, the radiation's
    record there is zero: completeness leaves nothing unaccounted at either end. -/
theorem first_step_accounting (H R : Nat → Int) (T : Int)
    (complete : ∀ n : Nat, H n + R n = T) (hH0 : H 0 = T) : R 0 = 0 := by
  have c := complete 0
  omega

/-- NO LOSS, NO REMNANT. At the final step the radiation's record is the whole record: R N = T with
    H N = 0. Everything that was registered is in the radiation's record; nothing is destroyed, and
    nothing is left behind in a remnant. -/
theorem no_loss_no_remnant (H R : Nat → Int) (T : Int) (N : Nat)
    (complete : ∀ n : Nat, H n + R n = T) (hHN : H N = 0) : R N = T := by
  have c := complete N
  omega

/-- THE MAJORITY AT THE LAST STEP. With a nonempty record and complete evaporation, at the final step
    the radiation holds strictly more than half: T < 2 * R N. -/
theorem radiation_holds_the_majority_at_last (H R : Nat → Int) (T : Int) (N : Nat)
    (complete : ∀ n : Nat, H n + R n = T) (hHN : H N = 0) (hT : 0 < T) : T < 2 * R N := by
  have c := complete N
  omega

/-- THE MAJORITY AT THE FIRST STEP. With a nonempty record wholly in the hole at the first step, the
    hole holds strictly more than half: T < 2 * H 0. Together with the last step, the majority's change
    of hands is the turnover. -/
theorem hole_holds_the_majority_at_first (H R : Nat → Int) (T : Int)
    (complete : ∀ n : Nat, H n + R n = T) (hH0 : H 0 = T) (hT : 0 < T) : T < 2 * H 0 := by
  have c := complete 0
  omega

end SPHYS.PageCurve

/-! ## Part VIII. The holography file, carried unchanged (forms on the hypothesis that the record is a function of the boundary) -/

namespace SPHYS.Holography

/-- The names a boundary of k one-bit sites can write: the binary strings of length k. -/
def strings : Nat → List (List Bool)
  | 0 => [[]]
  | k + 1 => (strings k).map (fun s => false :: s) ++ (strings k).map (fun s => true :: s)

/-- THE BOUNDARY WRITES 2^k NAMES. The count of boundary strings doubles with each site: capacity is a
    property of the boundary's size, exponential in it, with no reference to any volume. -/
theorem boundary_writes_two_pow (k : Nat) : (strings k).length = 2 ^ k := by
  induction k with
  | zero => decide
  | succ k ih =>
    unfold strings
    rw [List.length_append, List.length_map, List.length_map, ih, Nat.pow_succ]
    omega

/-- NO BULK SURPLUS. Two regions with the same boundary reading have the same record, whatever the
    boundary-reading map Φ is: the interior holds nothing the boundary does not already say. -/
theorem no_bulk_surplus (Φ : List Int → List Int) (R₁ R₂ B : List Int)
    (h₁ : R₁ = Φ B) (h₂ : R₂ = Φ B) : R₁ = R₂ := by
  rw [h₁, h₂]

/-- EVERY INTERIOR QUANTITY IS A BOUNDARY QUANTITY. If the record factors through the boundary, then any
    quantity computed from the record is computed from the boundary: Q(R) = (Q ∘ Φ)(B). There is no
    observable of the interior that is not an observable of the boundary reading. -/
theorem every_interior_quantity_is_a_boundary_quantity (Φ : List Int → List Int)
    (Q : List Int → Int) (R B : List Int) (h : R = Φ B) : Q R = Q (Φ B) := by
  rw [h]

/-- THE COUNT FORM. A region's records, listed without repetition among the boundary's names, number at
    most 2^k for a boundary of k sites: the boundary's capacity bounds the region's content. The hypothesis
    is the fold in counting form — the records appear among the names (a sublist). -/
theorem records_bounded_by_the_boundary (L : List (List Bool)) (k : Nat)
    (h : List.Sublist L (strings k)) : L.length ≤ 2 ^ k := by
  rw [← boundary_writes_two_pow k]
  exact List.Sublist.length_le h

end SPHYS.Holography

/-! ## Part IX. The censorship file, carried unchanged (forms on the hypothesis `factors`) -/

namespace SPHYS.Censorship

/-- THE OUTSIDE READS THE SURFACE. Under the fold, an exterior reading of an interior source does not
    depend on where outside it is taken: at every exterior site it is the surface data, the same number. -/
theorem the_outside_reads_the_surface (read : Int → Int → Int) (surf : Int → Int) (h : Int)
    (factors : ∀ s x : Int, s < h → h < x → read s x = surf s)
    (s x x' : Int) (hs : s < h) (hx : h < x) (hx' : h < x') : read s x = read s x' := by
  rw [factors s x hs hx, factors s x' hs hx']

/-- NO NAKED SINGULARITY. There is no interior source and no exterior site at which the reading differs
    from the surface data: no interior is ever read directly. Nakedness is excluded by the fold alone. -/
theorem no_naked_singularity (read : Int → Int → Int) (surf : Int → Int) (h : Int)
    (factors : ∀ s x : Int, s < h → h < x → read s x = surf s) :
    ¬ ∃ s x : Int, s < h ∧ h < x ∧ read s x ≠ surf s := by
  intro hcon
  obtain ⟨s, x, hs, hx, hne⟩ := hcon
  exact hne (factors s x hs hx)

/-- THE INTERIOR IS CENSORED, NOT JUST COVERED. Two interiors with the same surface data give the same
    reading at every exterior site: the outside cannot distinguish them at all. What reaches the outside
    is the surface's data — the mass, charge and spin of the no-hair reading — and nothing else. -/
theorem same_surface_same_outside (read : Int → Int → Int) (surf : Int → Int) (h : Int)
    (factors : ∀ s x : Int, s < h → h < x → read s x = surf s)
    (s₁ s₂ x : Int) (hs₁ : s₁ < h) (hs₂ : s₂ < h) (hx : h < x) (hsurf : surf s₁ = surf s₂) :
    read s₁ x = read s₂ x := by
  rw [factors s₁ x hs₁ hx, factors s₂ x hs₂ hx, hsurf]

end SPHYS.Censorship

/-! ## Part X. What the record gives of the turnover, of censorship and of the boundary
    Every theorem below is about the record of acts and the registration of Part I. -/
namespace SPHYS.Record

theorem recN_zero (s : Nat → Pt) : recN s 0 = 0 := rfl

/-- THE TURNOVER OF THE RECORD. Let the radiation's share be the record of acts and the hole's share the rest of
    a total T. Completeness and the decline of the hole are theorems (`page_hypotheses_of_the_record`). If the
    process ends with the record at T, the hole holds the majority at the first step, the radiation holds it at
    the last, and nothing is left in the hole. That the process ends is the scenario, and stays a hypothesis. -/
theorem page_turnover_of_the_record (T : Int) (s : Nat → Pt) (N : Nat) (hT : 0 < T) (hend : recN s N = T) :
    T < 2 * (T - recN s 0) ∧ T < 2 * recN s N ∧ T - recN s N = 0 := by
  have complete : ∀ n : Nat, (fun n => T - recN s n) n + recN s n = T := fun n => by
    show T - recN s n + recN s n = T
    omega
  have h0 : (fun n => T - recN s n) 0 = T := by
    show T - recN s 0 = T
    rw [recN_zero]; omega
  have hN : (fun n => T - recN s n) N = 0 := by
    show T - recN s N = 0
    omega
  exact ⟨SPHYS.PageCurve.hole_holds_the_majority_at_first _ (recN s) T complete h0 hT,
         SPHYS.PageCurve.radiation_holds_the_majority_at_last _ (recN s) T N complete hN hT, hN⟩

/-- THE MAJORITY DOES NOT RETURN. Once the record holds at least half of a total, it holds at least half at
    every later step: the majority changes hands at most once. -/
theorem the_majority_does_not_return (T : Int) (s : Nat → Pt) (m k : Nat) (h : T ≤ 2 * recN s m) :
    T ≤ 2 * recN s (m + k) := by
  have hm := area_theorem_of_the_record 0 s m k
  unfold area at hm
  omega

/-- A reading through the record cannot tell a state from its fold partner. -/
theorem the_outside_cannot_read_the_side (f : Pt → Int) (p : Pt) : f (reg (fold p)) = f (reg p) := rfl

/-- NO READING OF THE RECORD RETURNS THE SIDE. No function of the registration gives back the first coordinate
    of the state registered. -/
theorem no_reading_of_the_record_returns_the_side : ¬ ∃ f : Pt → Int, ∀ p : Pt, f (reg p) = p.1 := by
  intro ⟨f, hf⟩
  have h1 : f (reg (0, 0)) = 0 := hf (0, 0)
  have h2 : f (reg (2, 0)) = 2 := hf (2, 0)
  have e : reg ((2 : Int), (0 : Int)) = reg ((0 : Int), (0 : Int)) := rfl
  rw [e, h1] at h2
  omega

/-- EVERY READING THROUGH THE RECORD IS CENSORED. A reading of an interior source that passes through the
    registration satisfies the hypothesis `factors` of Part IX by its form, and the theorem of that Part applies:
    no exterior site reads anything but the surface's data. -/
theorem every_reading_through_the_record_is_censored (f : Pt → Int) (h : Int) :
    ¬ ∃ s x : Int, s < h ∧ h < x ∧
      (fun (s : Int) (_ : Int) => f (reg (s, 0))) s x ≠ (fun (s : Int) => f (reg (s, 0))) s :=
  SPHYS.Censorship.no_naked_singularity _ _ h (fun _ _ _ _ => rfl)

/-- The record of a record is itself: a registration registered again is unchanged. -/
theorem registration_is_idempotent (p : Pt) : reg (reg p) = reg p := rfl

/-- THE RECORD IS BOUNDED BY THE ACTS. A history of k acts erased at most k bits. -/
theorem record_le_length (h : List Pt) : record h ≤ h.length := by
  induction h with
  | nil => exact Nat.le_refl 0
  | cons p h ih =>
    simp only [record, List.length_cons]
    have := gain_le_one p
    omega

/-- Two histories with the same registrations give the same value to every quantity read from the record. -/
theorem same_registrations_same_reading (Q : List Pt → Int) (h₁ h₂ : List Pt)
    (e : h₁.map reg = h₂.map reg) : Q (h₁.map reg) = Q (h₂.map reg) := by
  rw [e]

end SPHYS.Record

#print axioms SPHYS.Record.reg_forgets_side
#print axioms SPHYS.Record.reg_fixes_iff
#print axioms SPHYS.Record.fold_fixes_iff
#print axioms SPHYS.Record.gain_le_one
#print axioms SPHYS.Record.gain_pos_iff_off
#print axioms SPHYS.Record.gain_pos_iff_erases
#print axioms SPHYS.Record.a_gain_is_a_merged_pair
#print axioms SPHYS.Record.an_erasing_act_cannot_be_undone
#print axioms SPHYS.Record.registration_has_no_left_inverse
#print axioms SPHYS.Record.record_append
#print axioms SPHYS.Record.record_step
#print axioms SPHYS.Record.record_never_decreases
#print axioms SPHYS.Record.record_pos_of_erasing
#print axioms SPHYS.Record.no_return
#print axioms SPHYS.Record.a_loop_is_idle
#print axioms SPHYS.Record.record_reverse
#print axioms SPHYS.Record.step_law
#print axioms SPHYS.Record.one_sign
#print axioms SPHYS.Chronology.record_is_start_plus_gains
#print axioms SPHYS.Chronology.total_gain_nonnegative
#print axioms SPHYS.Chronology.gain_le_total
#print axioms SPHYS.Chronology.a_loop_registers_nothing
#print axioms SPHYS.Chronology.chronology_protection
#print axioms SPHYS.AreaTheorem.no_step_shrinks
#print axioms SPHYS.AreaTheorem.flat_step_iff_no_flux
#print axioms SPHYS.AreaTheorem.area_never_decreases
#print axioms SPHYS.AreaTheorem.crossing_grows_the_area
#print axioms SPHYS.AreaTheorem.merger_area_at_least_the_sum
#print axioms SPHYS.AreaTheorem.every_positive_multiple_is_monotone
#print axioms SPHYS.Record.chronology_protection_of_the_record
#print axioms SPHYS.Record.a_closed_chain_is_idle
#print axioms SPHYS.Record.area_step
#print axioms SPHYS.Record.area_theorem_of_the_record
#print axioms SPHYS.Record.entropy_shape_of_the_record
#print axioms SPHYS.Record.page_hypotheses_of_the_record
#print axioms SPHYS.Record.the_record_of_acts
#print axioms SPHYS.PageCurve.radiation_record_never_shrinks
#print axioms SPHYS.PageCurve.majority_is_always_somewhere
#print axioms SPHYS.PageCurve.first_step_accounting
#print axioms SPHYS.PageCurve.no_loss_no_remnant
#print axioms SPHYS.PageCurve.radiation_holds_the_majority_at_last
#print axioms SPHYS.PageCurve.hole_holds_the_majority_at_first
#print axioms SPHYS.Holography.boundary_writes_two_pow
#print axioms SPHYS.Holography.no_bulk_surplus
#print axioms SPHYS.Holography.every_interior_quantity_is_a_boundary_quantity
#print axioms SPHYS.Holography.records_bounded_by_the_boundary
#print axioms SPHYS.Censorship.the_outside_reads_the_surface
#print axioms SPHYS.Censorship.no_naked_singularity
#print axioms SPHYS.Censorship.same_surface_same_outside
#print axioms SPHYS.Record.recN_zero
#print axioms SPHYS.Record.page_turnover_of_the_record
#print axioms SPHYS.Record.the_majority_does_not_return
#print axioms SPHYS.Record.the_outside_cannot_read_the_side
#print axioms SPHYS.Record.no_reading_of_the_record_returns_the_side
#print axioms SPHYS.Record.every_reading_through_the_record_is_censored
#print axioms SPHYS.Record.registration_is_idempotent
#print axioms SPHYS.Record.record_le_length
#print axioms SPHYS.Record.same_registrations_same_reading
