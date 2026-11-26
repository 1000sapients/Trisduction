/-! # THE IDENTITY OF THE SEPARATION, on the vacant seat

RATIONALE. The normal form above states the separation as a transfer from the record, with the transfer as a
  printed premise in `sep_from_the_cargo_loop`. This part takes no such premise. It proves what the separation is, in
  exact faces, each in both directions; it proves that the seat of computation is vacant, so that the three axes
  cannot meet on it; and it proves that the domain alone carries both a separated machine and one that is not.
DESIGN. `Seat`, `Folded`, `Witnessed`, `AllFixed`, `the_triaxial_theorem` (as in the Riemann row); `a_vacant_seat_
  holds_nothing`; the seat of verdicts and its three irreducible configurations; `Co`, the complement problem,
  `co_co`; `rec_rec`; `Deciders`, the configuration of all who decide the problem or its complement, witnessed by
  proof; the faces `face_*`; `the_faces_of_the_separation`; `the_domain_holds_both`; and the binding term
  `nothing_escapes_and_nothing_remains`.
STANDING. Before each colon stand only the things the statement speaks of: a seat with its form, its witness, its
  vacancy and a point of it, or a machine, one instance of it, an algorithm and its bounds. No transfer, no posit
  and no delivered bit is taken as a premise anywhere in this part. `Sep M` occurs only as one side of an
  equivalence, or of machines that are built here and separated or not by construction.
NON-NEGOTIABLE. Core Lean, no import, no axiom declared, no sorry. `Sep` of the SAT machine is never stated alone.
-/
namespace PNP.IDENTITY
open PNP.NORMALFORM

/-! ## 1 · the seat and its theorem, on every set -/

/-- A SEAT: a fold that is an involution, and a registration the fold keeps. -/
structure Seat (X Y : Type) where
  fold : X → X
  involutive : ∀ x, fold (fold x) = x
  reg : X → Y
  keeps : ∀ x, reg (fold x) = reg x

/-- FORM: the configuration is carried to itself by the fold. -/
def Folded {X Y : Type} (σ : Seat X Y) (S : X → Prop) : Prop := ∀ x, S x → S (σ.fold x)
/-- REGISTRATION: no two existents share a registration. -/
def Witnessed {X Y : Type} (σ : Seat X Y) (S : X → Prop) : Prop :=
  ∀ a b, S a → S b → σ.reg a = σ.reg b → a = b
/-- On the line: every existent is fixed by the fold. -/
def AllFixed {X Y : Type} (σ : Seat X Y) (S : X → Prop) : Prop := ∀ x, S x → σ.fold x = x

/-- THE TRIAXIAL THEOREM, on every seat: a folded and witnessed configuration lies on the line. -/
theorem the_triaxial_theorem {X Y : Type} (σ : Seat X Y) (S : X → Prop)
    (form : Folded σ S) (witness : Witnessed σ S) : AllFixed σ S :=
  fun a ha => witness (σ.fold a) a (form a ha) ha (σ.keeps a)

/-- A VACANT SEAT HOLDS NOTHING. Where the fold fixes no point, a folded and witnessed configuration has no
    existent: the three axes cannot meet. -/
theorem a_vacant_seat_holds_nothing {X Y : Type} (σ : Seat X Y) (vacant : ∀ x, σ.fold x ≠ x)
    (S : X → Prop) (form : Folded σ S) (witness : Witnessed σ S) : ∀ x, ¬ S x :=
  fun x hx => vacant x (the_triaxial_theorem σ S form witness x hx)

/-! ## 2 · the seat of verdicts: vacant, and its three axes pairwise compatible -/

/-- THE SEAT OF VERDICTS: a verdict, the fold that turns it into its opposite, and the registration that forgets
    which side it is on. -/
def verdictSeat : Seat Bool Unit :=
  ⟨fun b => !b, fun b => by cases b <;> rfl, fun _ => (), fun _ => rfl⟩

/-- THE SEAT OF VERDICTS IS VACANT: no verdict is its own opposite. -/
theorem the_seat_of_verdicts_is_vacant : ∀ b : Bool, verdictSeat.fold b ≠ b := fun b => bnot_ne b

/-- ON THE VACANT SEAT THE THREE AXES NEVER MEET, AND ANY TWO DO. No configuration of verdicts has an existent,
    form and witness together; and each pair of the three is carried by a configuration. -/
theorem the_three_axes_on_the_vacant_seat :
    (¬ ∃ S : Bool → Prop, (∃ b, S b) ∧ Folded verdictSeat S ∧ Witnessed verdictSeat S) ∧
    (∃ S : Bool → Prop, (∃ b, S b) ∧ Folded verdictSeat S ∧ ¬ Witnessed verdictSeat S) ∧
    (∃ S : Bool → Prop, (∃ b, S b) ∧ Witnessed verdictSeat S ∧ ¬ Folded verdictSeat S) ∧
    (∃ S : Bool → Prop, Folded verdictSeat S ∧ Witnessed verdictSeat S ∧ ¬ ∃ b, S b) := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · intro ⟨S, ⟨b, hb⟩, f, w⟩
    exact a_vacant_seat_holds_nothing verdictSeat the_seat_of_verdicts_is_vacant S f w b hb
  · refine ⟨fun _ => True, ⟨true, trivial⟩, fun _ _ => trivial, fun w => ?_⟩
    exact Bool.noConfusion (w true false trivial trivial rfl)
  · refine ⟨fun b => b = true, ⟨true, rfl⟩, ?_, fun f => ?_⟩
    · intro a b ha hb _
      rw [ha, hb]
    · exact Bool.noConfusion (f true rfl)
  · exact ⟨fun _ => False, fun _ h => h, fun _ _ h => h.elim, fun ⟨_, h⟩ => h⟩

/-- ON EVERY VACANT SEAT WITH A POINT, THE THREE AXES NEVER MEET AND ANY TWO DO. The point is needed: the seat on
    the empty set is vacant and carries no existent. The three configurations are the orbit of the point, the point
    alone, and the empty configuration. -/
theorem on_a_vacant_seat_any_two_axes_meet {X Y : Type} (σ : Seat X Y) (vacant : ∀ x, σ.fold x ≠ x) (a : X) :
    (¬ ∃ S : X → Prop, (∃ x, S x) ∧ Folded σ S ∧ Witnessed σ S) ∧
    (∃ S : X → Prop, (∃ x, S x) ∧ Folded σ S ∧ ¬ Witnessed σ S) ∧
    (∃ S : X → Prop, (∃ x, S x) ∧ Witnessed σ S ∧ ¬ Folded σ S) ∧
    (∃ S : X → Prop, Folded σ S ∧ Witnessed σ S ∧ ¬ ∃ x, S x) := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · intro ⟨S, ⟨b, hb⟩, f, w⟩
    exact a_vacant_seat_holds_nothing σ vacant S f w b hb
  · refine ⟨fun x => x = a ∨ x = σ.fold a, ⟨a, Or.inl rfl⟩, ?_, fun w => ?_⟩
    · intro x hx
      cases hx with
      | inl h => exact Or.inr (congrArg σ.fold h)
      | inr h => exact Or.inl (h ▸ σ.involutive a)
    · exact vacant a (w (σ.fold a) a (Or.inr rfl) (Or.inl rfl) (σ.keeps a))
  · refine ⟨fun x => x = a, ⟨a, rfl⟩, ?_, fun f => ?_⟩
    · intro x y hx hy _
      rw [hx, hy]
    · exact vacant a (f a rfl)
  · exact ⟨fun _ => False, fun _ h => h, fun _ _ h => h.elim, fun ⟨_, h⟩ => h⟩

/-! ## 3 · the fold of problems and the record of the record -/

/-- THE COMPLEMENT PROBLEM: the same algorithms, instances, sizes, outputs and times, with the predicate turned. -/
def Co (M : Machine) : Machine := { M with sat := fun x => !(M.sat x) }

/-- The complement of the complement is the problem. -/
theorem co_co (M : Machine) : Co (Co M) = M := by
  cases M with
  | mk Alg Inst size out time sat =>
    show Machine.mk Alg Inst size out time (fun x => !(!(sat x))) = Machine.mk Alg Inst size out time sat
    have e : (fun x => !(!(sat x))) = sat := funext fun x => by cases sat x <;> rfl
    rw [e]

/-- THE RECORD OF THE RECORD IS THE RECORD. -/
theorem rec_rec (M : Machine) : Rec (Rec M) = Rec M := rfl

/-- No one decides a problem and its complement with the same answers. -/
theorem no_one_decides_both (M : Machine) (x₀ : M.Inst) (A : M.Alg) (c k c' k' : Nat) :
    ¬ (Escapes M A c k ∧ Escapes (Co M) A c' k') :=
  fun ⟨h, h'⟩ => bnot_ne (M.sat x₀) ((h' x₀).1.symm.trans (h x₀).1)

/-! ## 4 · the configuration of deciders on the seat of sides -/

/-- A claim: an algorithm, a bound, and the side it is said to decide (`true` the problem, `false` the complement). -/
def Claim (M : Machine) : Type := (M.Alg × Nat × Nat) × Bool

/-- THE SEAT OF SIDES on the claims of a machine: the fold turns the side, the registration forgets it. -/
def sideSeat (M : Machine) : Seat (Claim M) (M.Alg × Nat × Nat) :=
  ⟨fun p => (p.1, !p.2), fun p => by cases p with | mk t b => cases b <;> rfl, fun p => p.1, fun _ => rfl⟩

/-- The seat of sides is vacant. -/
theorem the_seat_of_sides_is_vacant (M : Machine) : ∀ p : Claim M, (sideSeat M).fold p ≠ p :=
  fun p h => bnot_ne p.2 (congrArg Prod.snd h)

/-- THE DECIDERS: the claims that hold. A claim on the side of the problem holds when its algorithm escapes on the
    machine at its bound; on the side of the complement, when it escapes on the complement machine. -/
def Deciders (M : Machine) : Claim M → Prop :=
  fun p => (p.2 = true ∧ Escapes M p.1.1 p.1.2.1 p.1.2.2) ∨ (p.2 = false ∧ Escapes (Co M) p.1.1 p.1.2.1 p.1.2.2)

/-- THE DECIDERS ARE WITNESSED, by proof: no algorithm at one bound holds both sides. -/
theorem the_deciders_are_witnessed (M : Machine) (x₀ : M.Inst) : Witnessed (sideSeat M) (Deciders M) := by
  intro a b ha hb e
  cases a with | mk ta sa => cases b with | mk tb sb =>
  have et : ta = tb := e
  subst et
  cases sa <;> cases sb
  · rfl
  · rcases ha with ⟨h, _⟩ | ⟨_, ha⟩
    · exact Bool.noConfusion h
    · rcases hb with ⟨_, hb⟩ | ⟨h, _⟩
      · exact absurd ⟨hb, ha⟩ (no_one_decides_both M x₀ ta.1 ta.2.1 ta.2.2 ta.2.1 ta.2.2)
      · exact Bool.noConfusion h
  · rcases ha with ⟨_, ha⟩ | ⟨h, _⟩
    · rcases hb with ⟨h, _⟩ | ⟨_, hb⟩
      · exact Bool.noConfusion h
      · exact absurd ⟨ha, hb⟩ (no_one_decides_both M x₀ ta.1 ta.2.1 ta.2.2 ta.2.1 ta.2.2)
    · exact Bool.noConfusion h
  · rfl

/-- ON THE VACANT SEAT, FORM IS THE ABSENCE OF EXISTENCE. The deciders are closed under the turn of sides exactly
    when there is no decider. -/
theorem the_deciders_are_folded_iff_none (M : Machine) (x₀ : M.Inst) :
    Folded (sideSeat M) (Deciders M) ↔ ∀ p, ¬ Deciders M p :=
  ⟨fun f => a_vacant_seat_holds_nothing (sideSeat M) (the_seat_of_sides_is_vacant M) (Deciders M) f
      (the_deciders_are_witnessed M x₀),
   fun h p hp => (h p hp).elim⟩

/-- No decider on either side is the separation of the problem and of its complement. -/
theorem no_decider_iff (M : Machine) : (∀ p, ¬ Deciders M p) ↔ Sep M ∧ Sep (Co M) := by
  constructor
  · intro h
    exact ⟨fun ⟨A, c, k, he⟩ => h ((A, c, k), true) (Or.inl ⟨rfl, he⟩),
           fun ⟨A, c, k, he⟩ => h ((A, c, k), false) (Or.inr ⟨rfl, he⟩)⟩
  · intro ⟨h1, h2⟩ p hp
    rcases hp with ⟨_, he⟩ | ⟨_, he⟩
    · exact h1 ⟨p.1.1, p.1.2.1, p.1.2.2, he⟩
    · exact h2 ⟨p.1.1, p.1.2.1, p.1.2.2, he⟩

/-! ## 5 · the faces of the separation -/

/-- FACE: nothing escapes. The separation is that every algorithm at every bound is stopped somewhere. -/
theorem face_nothing_escapes (M : Machine) : Sep M ↔ NothingEscapes M :=
  ⟨closure_of_sep M, sep_of_closure M⟩

/-- FACE: errs or overruns. The separation is that every algorithm at every bound, on some instance, answers
    wrongly or runs past the bound. -/
theorem face_errs_or_overruns (M : Machine) :
    Sep M ↔ ∀ A c k, ∃ x, M.out A x ≠ M.sat x ∨ bound c k (M.size x) < M.time A x := by
  constructor
  · intro h A c k
    obtain ⟨x, hx⟩ := closure_of_sep M h A c k
    refine ⟨x, ?_⟩
    cases Classical.em (M.out A x = M.sat x) with
    | inl e => exact Or.inr (Nat.lt_of_not_le fun hle => hx ⟨e, hle⟩)
    | inr e => exact Or.inl e
  · intro h ⟨A, c, k, he⟩
    obtain ⟨x, hx⟩ := h A c k
    cases hx with
    | inl e => exact e (he x).1
    | inr e => exact Nat.not_le_of_lt e (he x).2

/-- FACE: the machine has the profile of its record. The separation is that an algorithm escapes on the machine at
    a bound exactly when it escapes on the record. -/
theorem face_profile_of_the_record (M : Machine) (x₀ : M.Inst) :
    Sep M ↔ ∀ A c k, (Escapes M A c k ↔ Escapes (Rec M) A c k) := by
  have r := record_is_self_recursive M x₀
  constructor
  · intro h A c k
    exact ⟨fun he => (h ⟨A, c, k, he⟩).elim, fun he => ((r A c k).mp he).elim⟩
  · intro h ⟨A, c, k, he⟩
    exact (r A c k).mp ((h A c k).mp he)

/-- FACE: the turn of sides. The separation is that whoever decides the problem at a bound decides its complement
    at that bound with the same answers. -/
theorem face_turn_of_sides (M : Machine) (x₀ : M.Inst) :
    Sep M ↔ ∀ A c k, Escapes M A c k → Escapes (Co M) A c k := by
  constructor
  · intro h A c k he
    exact (h ⟨A, c, k, he⟩).elim
  · intro h ⟨A, c, k, he⟩
    exact no_one_decides_both M x₀ A c k c k ⟨he, h A c k he⟩

/-- FACE: self-recursion, carried from the normal form. -/
theorem face_self_recursive (M : Machine) : Sep M ↔ SelfRecursive M := (self_recursion_at_machine M).symm

/-- THE FACES OF THE SEPARATION. Nothing before the colon but the machine and one instance. One statement, five
    faces, each in both directions. -/
theorem the_faces_of_the_separation (M : Machine) (x₀ : M.Inst) :
    (Sep M ↔ NothingEscapes M) ∧
    (Sep M ↔ ∀ A c k, ∃ x, M.out A x ≠ M.sat x ∨ bound c k (M.size x) < M.time A x) ∧
    (Sep M ↔ ∀ A c k, (Escapes M A c k ↔ Escapes (Rec M) A c k)) ∧
    (Sep M ↔ ∀ A c k, Escapes M A c k → Escapes (Co M) A c k) ∧
    (Sep M ↔ SelfRecursive M) :=
  ⟨face_nothing_escapes M, face_errs_or_overruns M, face_profile_of_the_record M x₀, face_turn_of_sides M x₀,
   face_self_recursive M⟩

/-- THE IDENTITY ON THE VACANT SEAT. The separation of a problem and of its complement is exactly the form of the
    deciders: their closure under the turn of sides; and exactly the absence of any decider. -/
theorem the_identity_on_the_vacant_seat (M : Machine) (x₀ : M.Inst) :
    (Sep M ∧ Sep (Co M) ↔ Folded (sideSeat M) (Deciders M)) ∧
    (Sep M ∧ Sep (Co M) ↔ ∀ p, ¬ Deciders M p) :=
  ⟨(no_decider_iff M).symm.trans (the_deciders_are_folded_iff_none M x₀).symm, (no_decider_iff M).symm⟩

/-! ## 6 · the reach of the domain -/

/-- THE DOMAIN HOLDS BOTH. A machine that is separated and a machine that is not, each with an instance, each with
    its record separated and its deciders witnessed. -/
theorem the_domain_holds_both :
    (Sep closedWorld ∧ Sep (Rec closedWorld) ∧ Witnessed (sideSeat closedWorld) (Deciders closedWorld)) ∧
    (¬ Sep (stageWorld 0) ∧ Sep (Rec (stageWorld 0)) ∧
      Witnessed (sideSeat (stageWorld 0)) (Deciders (stageWorld 0))) :=
  ⟨⟨sep_of_closure _ closed_world_closes, record_is_separated closedWorld (),
    the_deciders_are_witnessed closedWorld ()⟩,
   ⟨fun h => h ⟨(0 : Nat), 0, 0, stage_escapes 0⟩, record_is_separated (stageWorld 0) (),
    the_deciders_are_witnessed (stageWorld 0) ()⟩⟩

/-! ## 7 · the binding term -/

/-- NOTHING ESCAPES AND NOTHING REMAINS, on computation. One term, nothing before the colon but the machine and
    one instance, and each clause a whole theorem of this part. Nothing escapes: (I) the record is separated; (II)
    the record of the record is the record; (III) the deciders are witnessed; (IV) on the seat of sides a folded and
    witnessed configuration has no existent. Nothing remains: (V) the separation in its five faces; (VI) the
    identity on the vacant seat, both halves; (VII) the reach of the domain, whole. -/
theorem nothing_escapes_and_nothing_remains (M : Machine) (x₀ : M.Inst) :
    Sep (Rec M) ∧
    Rec (Rec M) = Rec M ∧
    Witnessed (sideSeat M) (Deciders M) ∧
    (∀ S : Claim M → Prop, Folded (sideSeat M) S → Witnessed (sideSeat M) S → ∀ p, ¬ S p) ∧
    ((Sep M ↔ NothingEscapes M) ∧
     (Sep M ↔ ∀ A c k, ∃ x, M.out A x ≠ M.sat x ∨ bound c k (M.size x) < M.time A x) ∧
     (Sep M ↔ ∀ A c k, (Escapes M A c k ↔ Escapes (Rec M) A c k)) ∧
     (Sep M ↔ ∀ A c k, Escapes M A c k → Escapes (Co M) A c k) ∧
     (Sep M ↔ SelfRecursive M)) ∧
    ((Sep M ∧ Sep (Co M) ↔ Folded (sideSeat M) (Deciders M)) ∧
     (Sep M ∧ Sep (Co M) ↔ ∀ p, ¬ Deciders M p)) ∧
    ((Sep closedWorld ∧ Sep (Rec closedWorld) ∧ Witnessed (sideSeat closedWorld) (Deciders closedWorld)) ∧
     (¬ Sep (stageWorld 0) ∧ Sep (Rec (stageWorld 0)) ∧
       Witnessed (sideSeat (stageWorld 0)) (Deciders (stageWorld 0)))) :=
  ⟨record_is_separated M x₀, rec_rec M, the_deciders_are_witnessed M x₀,
   fun S f w => a_vacant_seat_holds_nothing (sideSeat M) (the_seat_of_sides_is_vacant M) S f w,
   the_faces_of_the_separation M x₀, the_identity_on_the_vacant_seat M x₀, the_domain_holds_both⟩

end PNP.IDENTITY

/-! # THE IDENTITY ON THE TURING MODEL

RATIONALE. The faces above are stated for every machine. This part states them for the SAT machine of the Turing
  model, where the separation is the sentence SAT ∉ P over every Turing machine, and it adds the one fact of the
  model that the vacant seat needs: P is closed under complement, proved here by exchanging the accept and reject
  states. With it, SAT ∉ P is exactly the form of the deciders on the seat of sides.
DESIGN. `TMLang`, `sep_tmlang_iff` (the bridge for every language); `swap`, `step_swap`, `run_swap`,
  `haltsAt_swap`, `verdict_swap`; `rejector`; `inP_co`, `p_is_closed_under_complement`; `sep_co_tmsat_iff`;
  `the_faces_of_sat_not_in_p`; `nothing_escapes_and_nothing_remains_on_the_turing_model`.
STANDING. The six faces and the binding term have nothing before the colon; the lemmas have there a language, or a
  machine with its run, and the hypotheses their sentences name. `¬ SATinP` occurs only as one side of an equivalence.
NON-NEGOTIABLE. Core Lean, no import, no axiom declared, no sorry. `¬ SATinP` and `P_ne_NP` are never stated alone.
-/
namespace PNP.IDENTITY
open PNP.NORMALFORM PNP.TM

/-- The machine of a language on the Turing model: deciders, strings, lengths, verdicts and step counts. -/
def TMLang (L : Lang) : Machine := ⟨Decider, List Sym, List.length, out, time, L⟩

/-- THE BRIDGE FOR EVERY LANGUAGE: the separation of the machine of a language is that the language is outside P. -/
theorem sep_tmlang_iff (L : Lang) : Sep (TMLang L) ↔ ¬ InP L := by
  constructor
  · intro hsep ⟨M, c, k, h⟩
    let D : Decider := ⟨M, fun w => bound c k w.length,
      fun w => match h w with | ⟨t, hle, ht, _⟩ => haltsAt_of_le ht hle⟩
    apply hsep
    refine ⟨D, c, k, fun w => ?_⟩
    obtain ⟨t, hle, ht, hv⟩ := h w
    exact ⟨(out_eq D w t ht).trans hv, Nat.le_trans (time_least D w t ht) hle⟩
  · intro hnot ⟨D, c, k, he⟩
    apply hnot
    refine ⟨D.M, c, k, fun w => ?_⟩
    obtain ⟨hout, htime⟩ := he w
    exact ⟨time D w, htime, time_halts D w, hout⟩

/-- The complement of the SAT machine is the machine of the complement language. -/
theorem co_tmsat : Co TMSAT = TMLang (fun w => !(satLang w)) := rfl

/-- THE EXCHANGE: the same machine with its accept and reject states exchanged. -/
def swap (M : TM) : TM := ⟨M.q, M.s, M.δ, M.start, M.reject, M.accept⟩

/-- A configuration of the machine, read as a configuration of the exchanged machine: the same state, head and tape. -/
def toSwap {M : TM} (c : Config M) : Config (swap M) := ⟨c.st, c.pos, c.tape⟩

theorem halted_swap (M : TM) (c : Config M) : halted (swap M) (toSwap c) ↔ halted M c := Or.comm

theorem step_swap (M : TM) (c : Config M) : step (swap M) (toSwap c) = toSwap (step M c) := by
  unfold step
  cases Classical.em (halted M c) with
  | inl h => rw [if_pos h, if_pos ((halted_swap M c).mpr h)]
  | inr h => rw [if_neg h, if_neg (fun h' => h ((halted_swap M c).mp h'))]; rfl

theorem run_swap (M : TM) (w : List Sym) : ∀ t, run (swap M) w t = toSwap (run M w t)
  | 0 => rfl
  | t + 1 => (congrArg (step (swap M)) (run_swap M w t)).trans (step_swap M (run M w t))

theorem haltsAt_swap (M : TM) (w : List Sym) (t : Nat) : HaltsAt (swap M) w t ↔ HaltsAt M w t := by
  show halted (swap M) (run (swap M) w t) ↔ halted M (run M w t)
  rw [run_swap M w t]
  exact halted_swap M _

/-- On a halted run of a machine whose accept and reject states differ, the exchange turns the verdict. -/
theorem verdict_swap (M : TM) (w : List Sym) (t : Nat) (hne : M.accept ≠ M.reject) (h : HaltsAt M w t) :
    verdictAt (swap M) w t = !(verdictAt M w t) := by
  have e2 : verdictAt (swap M) w t = decide ((toSwap (run M w t)).st = (swap M).accept) :=
    congrArg (fun c : Config (swap M) => decide (c.st = (swap M).accept)) (run_swap M w t)
  rw [e2]
  show decide ((run M w t).st = M.reject) = !(decide ((run M w t).st = M.accept))
  cases h with
  | inl a =>
    rw [decide_eq_true a, decide_eq_false (fun r => hne (a.symm.trans r))]; rfl
  | inr r =>
    rw [decide_eq_true r, decide_eq_false (fun a => hne (a.symm.trans r))]; rfl

/-- A machine that halts at once in its reject state. -/
def rejector : TM :=
  ⟨2, 0, fun _ _ => (⟨0, by decide⟩, ⟨0, by decide⟩, Dir.L), ⟨1, by decide⟩, ⟨0, by decide⟩, ⟨1, by decide⟩⟩

/-- If a language is in P, so is its complement. -/
theorem inP_co (L : Lang) (h : InP L) : InP (fun w => !(L w)) := by
  obtain ⟨M, c, k, hM⟩ := h
  cases Classical.em (M.accept = M.reject) with
  | inl heq =>
    have allTrue : ∀ w, L w = true := by
      intro w
      obtain ⟨t, _, ht, hv⟩ := hM w
      rw [← hv]
      show decide ((run M w t).st = M.accept) = true
      cases ht with
      | inl a => exact decide_eq_true a
      | inr r => exact decide_eq_true (r.trans heq.symm)
    refine ⟨rejector, 0, 0, fun w => ⟨0, Nat.zero_le _, Or.inr rfl, ?_⟩⟩
    show verdictAt rejector w 0 = !(L w)
    rw [allTrue w]
    rfl
  | inr hne =>
    refine ⟨swap M, c, k, fun w => ?_⟩
    obtain ⟨t, hle, ht, hv⟩ := hM w
    exact ⟨t, hle, (haltsAt_swap M w t).mpr ht, by rw [verdict_swap M w t hne ht, hv]⟩

/-- P IS CLOSED UNDER COMPLEMENT, on this model: a language is in P exactly when its complement is. -/
theorem p_is_closed_under_complement (L : Lang) : InP L ↔ InP (fun w => !(L w)) := by
  constructor
  · exact inP_co L
  · intro h
    have h2 := inP_co _ h
    have e : (fun w => !(!(L w))) = L := funext fun w => by cases L w <;> rfl
    rw [e] at h2; exact h2

/-- The separation of the complement of the SAT machine is SAT ∉ P. -/
theorem sep_co_tmsat_iff : Sep (Co TMSAT) ↔ ¬ SATinP :=
  (sep_tmlang_iff (fun w => !(satLang w))).trans
    ⟨fun h hs => h ((p_is_closed_under_complement satLang).mp hs),
     fun h hs => h ((p_is_closed_under_complement satLang).mpr hs)⟩

/-- THE FACES OF SAT ∉ P, over every Turing machine. Nothing before the colon. One sentence, six faces, each in
    both directions: nothing escapes; every total machine at every bound errs or overruns on some string; the SAT
    machine has the profile of its record; whoever decides SAT at a bound decides its complement with the same answers;
    the deciders are closed under the turn of sides; there is no decider on either side. -/
theorem the_faces_of_sat_not_in_p :
    (¬ SATinP ↔ NothingEscapes TMSAT) ∧
    (¬ SATinP ↔ ∀ (D : Decider) (c k : Nat), ∃ w : List Sym,
        out D w ≠ satLang w ∨ bound c k w.length < time D w) ∧
    (¬ SATinP ↔ ∀ (D : Decider) (c k : Nat), (Escapes TMSAT D c k ↔ Escapes (Rec TMSAT) D c k)) ∧
    (¬ SATinP ↔ ∀ (D : Decider) (c k : Nat), Escapes TMSAT D c k → Escapes (Co TMSAT) D c k) ∧
    (¬ SATinP ↔ Folded (sideSeat TMSAT) (Deciders TMSAT)) ∧
    (¬ SATinP ↔ ∀ p, ¬ Deciders TMSAT p) := by
  have both : ¬ SATinP ↔ Sep TMSAT ∧ Sep (Co TMSAT) :=
    ⟨fun h => ⟨sep_tmsat_iff.mpr h, sep_co_tmsat_iff.mpr h⟩, fun h => sep_tmsat_iff.mp h.1⟩
  exact ⟨sep_tmsat_iff.symm.trans (face_nothing_escapes TMSAT),
    sep_tmsat_iff.symm.trans (face_errs_or_overruns TMSAT),
    sep_tmsat_iff.symm.trans (face_profile_of_the_record TMSAT []),
    sep_tmsat_iff.symm.trans (face_turn_of_sides TMSAT []),
    both.trans (the_identity_on_the_vacant_seat TMSAT []).1,
    both.trans (the_identity_on_the_vacant_seat TMSAT []).2⟩

/-- NOTHING ESCAPES AND NOTHING REMAINS, on the Turing model. One term, nothing before the colon, and each clause
    a whole theorem of this part. Nothing escapes: (I) the record of the SAT machine is separated; (II) the record of
    the record is the record; (III) the deciders are witnessed; (IV) on the seat of sides a folded and witnessed
    configuration has no existent; (V) P is closed under complement. Nothing remains: (VI) the six faces; (VII) the
    reach of the domain, whole. -/
theorem nothing_escapes_and_nothing_remains_on_the_turing_model :
    Sep (Rec TMSAT) ∧
    Rec (Rec TMSAT) = Rec TMSAT ∧
    Witnessed (sideSeat TMSAT) (Deciders TMSAT) ∧
    (∀ S : Claim TMSAT → Prop, Folded (sideSeat TMSAT) S → Witnessed (sideSeat TMSAT) S → ∀ p, ¬ S p) ∧
    (∀ L : Lang, InP L ↔ InP (fun w => !(L w))) ∧
    ((¬ SATinP ↔ NothingEscapes TMSAT) ∧
     (¬ SATinP ↔ ∀ (D : Decider) (c k : Nat), ∃ w : List Sym,
          out D w ≠ satLang w ∨ bound c k w.length < time D w) ∧
     (¬ SATinP ↔ ∀ (D : Decider) (c k : Nat), (Escapes TMSAT D c k ↔ Escapes (Rec TMSAT) D c k)) ∧
     (¬ SATinP ↔ ∀ (D : Decider) (c k : Nat), Escapes TMSAT D c k → Escapes (Co TMSAT) D c k) ∧
     (¬ SATinP ↔ Folded (sideSeat TMSAT) (Deciders TMSAT)) ∧
     (¬ SATinP ↔ ∀ p, ¬ Deciders TMSAT p)) ∧
    ((Sep closedWorld ∧ Sep (Rec closedWorld) ∧ Witnessed (sideSeat closedWorld) (Deciders closedWorld)) ∧
     (¬ Sep (stageWorld 0) ∧ Sep (Rec (stageWorld 0)) ∧
       Witnessed (sideSeat (stageWorld 0)) (Deciders (stageWorld 0)))) :=
  ⟨record_is_separated TMSAT [], rec_rec TMSAT, the_deciders_are_witnessed TMSAT [],
   fun S f w => a_vacant_seat_holds_nothing (sideSeat TMSAT) (the_seat_of_sides_is_vacant TMSAT) S f w,
   p_is_closed_under_complement, the_faces_of_sat_not_in_p, the_domain_holds_both⟩

end PNP.IDENTITY
