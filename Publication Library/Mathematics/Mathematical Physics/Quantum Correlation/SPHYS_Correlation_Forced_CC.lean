/-
  SPHYS_Correlation_Forced_CC.lean · no signal from the registration, Bell's bound as the reach of local records,
  the outcome as one keyed bit · core Lean 4, no library.

  RATIONALE. Two parties register outcomes. Each one's record is a registration: it keeps her own outcome and sums
  over the other's. From that alone the far side can do anything to its own outcomes and her record does not move.
  A local account of the pair is one table holding every answer in advance, and one table gives the value two and
  never more. The pair of the quantum reaches a square of eight. The outcome each party sees is a fair bit alone
  and a certain bit with the partner's record as key.

  DESIGN. Integers only. A joint record is four counts. The quantum pair is carried by four by four arrays of
  integers, with the settings scaled so that no root appears: the value S times the root of two is the array T.
  No axiom is declared. The kernel line of every theorem is printed at the end.

  WHAT ENTERS AS A DEFINITION, NOT AS A THEOREM (read before editing):
    (1) a party's record is the sum of the joint record over the other party's outcomes: `mine`;
    (2) a far operation is any change of the joint record that keeps each of my rows' totals, and a near operation
        is any change that keeps each of the far party's columns' totals: bridge B1 of the paper reads a choice
        of setting as such an operation;
    (3) a local account is one table of four answers, each plus or minus one (Bell, 1964; Fine, 1982);
    (4) the pair of the quantum is the singlet, and its settings are the two reflections Z and X on one side and
        their sum and difference on the other (Clauser, Horne, Shimony and Holt, 1969); the mean of a reading on
        a state is the state's product with the reading applied to it (Born, 1926);
    (5) that no state at any settings exceeds a square of eight is Tsirelson's theorem (1980). It is cited. The
        engine proves it at the settings of (4), where the singlet reaches it.
  RISK. A reader may take `nothing_at_these_settings_exceeds_eight` for Tsirelson's theorem. It is that theorem at
  one choice of settings.
  NON-NEGOTIABLE. No theorem here returns which outcome occurs. `the_outcome_alone_is_a_fair_bit` proves the local
  record cannot.
-/
namespace SPHYS.Correlation

/-! ## Part I. The registration forces no signal. -/

/-- A joint record: the counts of the four outcome pairs, mine first. -/
structure J where
  pp : Int
  pm : Int
  mp : Int
  mm : Int

/-- My record: my outcome kept, the other's summed over. -/
def mine (r : J) : Int × Int := (r.pp + r.pm, r.mp + r.mm)
/-- The other's record. -/
def theirs (r : J) : Int × Int := (r.pp + r.mp, r.pm + r.mm)
/-- The correlation: agreements less disagreements. -/
def corr (r : J) : Int := r.pp + r.mm - r.pm - r.mp
/-- My bias. -/
def bias (r : J) : Int := (r.pp + r.pm) - (r.mp + r.mm)
/-- The far side relabels its outcome. -/
def farFlip (r : J) : J := ⟨r.pm, r.pp, r.mm, r.mp⟩

/-- NO SIGNAL IS FORCED BY THE REGISTRATION. Whatever the far side does to its own outcomes, if each of my rows
    keeps its total, my record is the same. -/
theorem the_registration_forces_no_signal (r s : J) (h1 : s.pp + s.pm = r.pp + r.pm) (h2 : s.mp + s.mm = r.mp + r.mm) :
    mine s = mine r := by
  unfold mine; rw [h1, h2]

/-- A far relabelling is such an operation. -/
theorem a_far_relabelling_leaves_my_record (r : J) : mine (farFlip r) = mine r := by
  apply the_registration_forces_no_signal <;> simp only [farFlip] <;> omega

/-- NO FUNCTION OF MY RECORD READS THE FAR CHOICE. -/
theorem no_function_of_my_record_reads_the_far_choice {β : Type} (f : Int × Int → β) (r : J) :
    f (mine (farFlip r)) = f (mine r) := by
  rw [a_far_relabelling_leaves_my_record]

/-- The correlation does see it: it reverses. It lives where the two records are joined. -/
theorem the_correlation_reverses_under_a_far_relabelling (r : J) : corr (farFlip r) = -corr r := by
  simp only [corr, farFlip]; omega

/-- The near side relabels its outcome. -/
def nearFlip (r : J) : J := ⟨r.mp, r.mm, r.pp, r.pm⟩

/-- AND THE OTHER WAY. Whatever I do to my own outcomes, if each of the far party's columns keeps its total, the
    far record is the same. -/
theorem the_registration_forces_no_signal_the_other_way (r s : J) (h1 : s.pp + s.mp = r.pp + r.mp)
    (h2 : s.pm + s.mm = r.pm + r.mm) : theirs s = theirs r := by
  unfold theirs; rw [h1, h2]

/-- A near relabelling is such an operation. -/
theorem a_near_relabelling_leaves_the_far_record (r : J) : theirs (nearFlip r) = theirs r := by
  apply the_registration_forces_no_signal_the_other_way <;> simp only [nearFlip] <;> omega

/-! ## Part II. Bell's bound is the whole reach of local records. -/

/-- The value of Clauser, Horne, Shimony and Holt for one table of four answers. -/
def chsh (a0 a1 b0 b1 : Int) : Int := a0 * b0 + a0 * b1 + a1 * b0 - a1 * b1

/-- ONE TABLE GIVES TWO. Every table of four answers, each plus or minus one, has the value plus or minus two. -/
theorem one_table_gives_two (a0 a1 b0 b1 : Int) (h0 : a0 = 1 ∨ a0 = -1) (h1 : a1 = 1 ∨ a1 = -1)
    (h2 : b0 = 1 ∨ b0 = -1) (h3 : b1 = 1 ∨ b1 = -1) : chsh a0 a1 b0 b1 = 2 ∨ chsh a0 a1 b0 b1 = -2 := by
  rcases h0 with h0 | h0 <;> rcases h1 with h1 | h1 <;> rcases h2 with h2 | h2 <;> rcases h3 with h3 | h3 <;>
    subst h0 <;> subst h1 <;> subst h2 <;> subst h3 <;> first | exact Or.inl rfl | exact Or.inr rfl

/-- The square of the value of a table is four. -/
theorem a_table_squares_to_four (a0 a1 b0 b1 : Int) (h0 : a0 = 1 ∨ a0 = -1) (h1 : a1 = 1 ∨ a1 = -1)
    (h2 : b0 = 1 ∨ b0 = -1) (h3 : b1 = 1 ∨ b1 = -1) : chsh a0 a1 b0 b1 * chsh a0 a1 b0 b1 = 4 := by
  rcases one_table_gives_two a0 a1 b0 b1 h0 h1 h2 h3 with h | h <;> rw [h] <;> rfl

/-- A mixture of tables: each entry a weight and the value of its table. -/
def weight : List (Nat × Int) → Int
  | [] => 0
  | p :: l => (p.1 : Int) + weight l
def total : List (Nat × Int) → Int
  | [] => 0
  | p :: l => (p.1 : Int) * p.2 + total l

/-- BELL'S BOUND FOR EVERY MIXTURE. A mixture of tables of any length and any weights stays within two. -/
theorem every_mixture_of_tables_stays_within_two (l : List (Nat × Int)) (h : ∀ p ∈ l, p.2 = 2 ∨ p.2 = -2) :
    -(2 * weight l) ≤ total l ∧ total l ≤ 2 * weight l := by
  induction l with
  | nil => exact ⟨by decide, by decide⟩
  | cons p l ih =>
    have hp := h p (List.mem_cons_self)
    have hl := ih (fun q hq => h q (List.mem_cons_of_mem _ hq))
    have hw : (0 : Int) ≤ (p.1 : Int) := Int.ofNat_nonneg _
    simp only [weight, total]
    rcases hp with hp | hp <;> rw [hp] <;> refine ⟨?_, ?_⟩ <;> omega

/-- THE REACH IS WHOLE. Of W tables, k at plus two and the rest at minus two give 4k - 2W: every step from -2W to
    2W is reached, and by the bound nothing beyond. -/
theorem the_reach_is_whole (W k : Nat) (h : k ≤ W) :
    total [(k, 2), (W - k, -2)] = 4 * (k : Int) - 2 * (W : Int) ∧ weight [(k, 2), (W - k, -2)] = (W : Int) := by
  simp only [total, weight]; refine ⟨?_, ?_⟩ <;> omega

/-! ## Part III. The outcome is one keyed bit. -/

/-- The joint record of the pair at equal settings, N runs each way: never the same outcome twice. -/
def opposite (N : Int) : J := ⟨0, N, N, 0⟩
/-- A joint record with the same two local records and the other relation. -/
def alike (N : Int) : J := ⟨N, 0, 0, N⟩

/-- THE OUTCOME ALONE IS A FAIR BIT. My record of the pair has no bias. -/
theorem the_outcome_alone_is_a_fair_bit (N : Int) : bias (opposite N) = 0 := by
  simp only [bias, opposite]; omega

/-- WITH THE KEY THE OUTCOME IS CERTAIN. Given the other's outcome, mine is the opposite, in every run. -/
theorem with_the_key_the_outcome_is_certain (N : Int) : (opposite N).pp = 0 ∧ (opposite N).mm = 0 := ⟨rfl, rfl⟩

/-- THE KEY IS IN NEITHER RECORD. Two joint records with the same local records on both sides and opposite
    correlations. -/
theorem the_key_is_in_neither_record (N : Int) :
    mine (opposite N) = mine (alike N) ∧ theirs (opposite N) = theirs (alike N) ∧ corr (opposite N) = -corr (alike N) := by
  refine ⟨?_, ?_, ?_⟩
  · simp only [mine, opposite, alike, Int.add_zero, Int.zero_add]
  · simp only [theirs, opposite, alike, Int.add_zero, Int.zero_add]
  · simp only [corr, opposite, alike]; omega

/-! ## Part IV. The pair of the quantum reaches a square of eight. -/

abbrev Mat := List (List Int)
abbrev Vec := List Int

def dot (u v : Vec) : Int := (List.zipWith (· * ·) u v).foldl (· + ·) 0
def mulVec (m : Mat) (v : Vec) : Vec := m.map (fun row => dot row v)
def col (m : Mat) (j : Nat) : Vec := m.map (fun row => row.getD j 0)
def mmul (a b : Mat) : Mat := a.map (fun row => (List.range 4).map (fun j => dot row (col b j)))
def madd (a b : Mat) : Mat := List.zipWith (List.zipWith (· + ·)) a b
def msmul (k : Int) (a : Mat) : Mat := a.map (fun row => row.map (k * ·))
def vsmul (k : Int) (v : Vec) : Vec := v.map (k * ·)

def I4 : Mat := [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]
def O4 : Mat := [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
/-- Both sides read Z; both sides read X; my Z alone; my X alone; the other's Z alone; the other's X alone. -/
def ZZ : Mat := [[1,0,0,0],[0,-1,0,0],[0,0,-1,0],[0,0,0,1]]
def XX : Mat := [[0,0,0,1],[0,0,1,0],[0,1,0,0],[1,0,0,0]]
def ZI : Mat := [[1,0,0,0],[0,1,0,0],[0,0,-1,0],[0,0,0,-1]]
def XI : Mat := [[0,0,1,0],[0,0,0,1],[1,0,0,0],[0,1,0,0]]
def IZ : Mat := [[1,0,0,0],[0,-1,0,0],[0,0,1,0],[0,0,0,-1]]
def IX : Mat := [[0,1,0,0],[1,0,0,0],[0,0,0,1],[0,0,1,0]]
/-- The value S times the root of two, at the settings Z, X against their sum and difference: 2·(ZZ + XX). -/
def T : Mat := msmul 2 (madd ZZ XX)
/-- The singlet. -/
def singlet : Vec := [0, 1, -1, 0]

/-- The settings are honest: each reading squares to one, and mine commute with the other's. -/
theorem the_readings_square_to_one : mmul ZI ZI = I4 ∧ mmul XI XI = I4 ∧ mmul IZ IZ = I4 ∧ mmul IX IX = I4 := by
  decide
theorem my_readings_commute_with_the_others : mmul ZI IX = mmul IX ZI ∧ mmul XI IZ = mmul IZ XI := by decide
/-- My two readings do not commute with each other. This is what a table cannot hold. -/
theorem my_two_readings_do_not_commute : mmul ZI XI ≠ mmul XI ZI := by decide

/-- THE SINGLET IS PERFECTLY OPPOSITE in both readings. -/
theorem the_singlet_is_perfectly_opposite :
    mulVec ZZ singlet = vsmul (-1) singlet ∧ mulVec XX singlet = vsmul (-1) singlet := by decide

/-- THE SINGLET REACHES A SQUARE OF EIGHT. T on the singlet is minus four, so S times the root of two is minus
    four, and S squared is eight. -/
theorem the_singlet_reaches_eight : mulVec T singlet = vsmul (-4) singlet ∧ (-4 : Int) * (-4) = 2 * 8 := by decide

/-- EIGHT EXCEEDS FOUR AND FALLS SHORT OF SIXTEEN: the local reach, the quantum pair, and the wall of no signal. -/
theorem local_quantum_and_wall : (4 : Int) < 8 ∧ (8 : Int) < 16 := by decide

/-- NOTHING AT THESE SETTINGS EXCEEDS EIGHT. T squared times (T squared less sixteen) is zero, so every value of T
    is 0, 4 or -4. -/
theorem nothing_at_these_settings_exceeds_eight :
    mmul (mmul T T) (madd (mmul T T) (msmul (-16) I4)) = O4 := by decide

/-- THE LOCAL RECORDS OF THE SINGLET ARE UNBIASED, in every one of the four readings. -/
theorem the_local_records_of_the_singlet_are_unbiased :
    dot singlet (mulVec ZI singlet) = 0 ∧ dot singlet (mulVec XI singlet) = 0 ∧
    dot singlet (mulVec IZ singlet) = 0 ∧ dot singlet (mulVec IX singlet) = 0 := by decide

end SPHYS.Correlation

#print axioms SPHYS.Correlation.the_registration_forces_no_signal
#print axioms SPHYS.Correlation.a_far_relabelling_leaves_my_record
#print axioms SPHYS.Correlation.no_function_of_my_record_reads_the_far_choice
#print axioms SPHYS.Correlation.the_correlation_reverses_under_a_far_relabelling
#print axioms SPHYS.Correlation.the_registration_forces_no_signal_the_other_way
#print axioms SPHYS.Correlation.a_near_relabelling_leaves_the_far_record
#print axioms SPHYS.Correlation.one_table_gives_two
#print axioms SPHYS.Correlation.a_table_squares_to_four
#print axioms SPHYS.Correlation.every_mixture_of_tables_stays_within_two
#print axioms SPHYS.Correlation.the_reach_is_whole
#print axioms SPHYS.Correlation.the_outcome_alone_is_a_fair_bit
#print axioms SPHYS.Correlation.with_the_key_the_outcome_is_certain
#print axioms SPHYS.Correlation.the_key_is_in_neither_record
#print axioms SPHYS.Correlation.the_readings_square_to_one
#print axioms SPHYS.Correlation.my_readings_commute_with_the_others
#print axioms SPHYS.Correlation.my_two_readings_do_not_commute
#print axioms SPHYS.Correlation.the_singlet_is_perfectly_opposite
#print axioms SPHYS.Correlation.the_singlet_reaches_eight
#print axioms SPHYS.Correlation.local_quantum_and_wall
#print axioms SPHYS.Correlation.nothing_at_these_settings_exceeds_eight
#print axioms SPHYS.Correlation.the_local_records_of_the_singlet_are_unbiased
