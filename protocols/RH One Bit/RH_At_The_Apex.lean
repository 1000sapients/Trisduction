/-!
# THE RIEMANN HYPOTHESIS AT THE APEX · RH_At_The_Apex.lean · hardened edition
core Lean 4 v4.19.0 · no Mathlib · no sorry · no axiom declaration.

WHAT IS PROVED. (1) RA at the constructed domain, computed. (2) The seat: the binding
involution σ fixes exactly the scalar line, the Return i·j·k lands on it, and the kinetic,
formal, and named seats are one point by rfl: the three category gaps are identities.
(3) The eliminator RA → RA → RAM → RH_formal from the RA witness alone. (4) The spine
carried: the abstract frame X = (S, τ, Z), the line property L, the bridge halted iff L,
the crossing exact both ways, necessity, the bit is the hypothesis, the witness row
falsifiable. (5) The aperture, RA-supplied: a present reader's row is never interior;
it is sealed or refused by the bit alone. (6) THE SIMPLE RULE, EXACT: for every frame,
(RA → L X) ↔ L X; and RA decides L on no frame: ¬ ∀ X, RA → L X, by the two-point model.
(7) RH in toto at the apex, one theorem, conditional on RA and discharged.
(8) The root's two formal faces: RAF, closure and no exterior agent (RAF-2, RAF-C1), and
no total self-indexing (RAF-C2, Cantor); RAM, the seat as the identity cone over the
three registers, its apex unique. (9) The equivariant embedding φ of the spine's lattice
stage (Plane, τ) into (Q4, σ): σ ∘ φ = φ ∘ τ and φ carries Fix(τ) onto Fix(σ).
(10) The wall executed: no readout of the formal seat equals the deed bit. (11) The
counter-model survives grounding, and the cure theorem: for every class of frames,
existence decides the line property on it exactly when the line property already holds on it.
-/
set_option autoImplicit false

namespace RHAtTheApex

/-! ## 1 · The Root Axiom at the constructed domain -/

inductive UniversePoint : Type where
  | source
  deriving DecidableEq, Repr

def DeltaE : UniversePoint → Int := fun _ => 1

/-- RA: to exist is to actuate. -/
def RA : Prop := ∀ x : UniversePoint, 0 < DeltaE x

theorem constructed_RA : RA := by
  intro x
  cases x
  decide

/-! ## 2 · The seat: Fix(σ) on the quaternions, the Return, three names, one point -/

structure Q4 where
  r : Int
  i : Int
  j : Int
  k : Int
  deriving DecidableEq, Repr

def qmul (a b : Q4) : Q4 :=
  ⟨a.r*b.r - a.i*b.i - a.j*b.j - a.k*b.k,
   a.r*b.i + a.i*b.r + a.j*b.k - a.k*b.j,
   a.r*b.j - a.i*b.k + a.j*b.r + a.k*b.i,
   a.r*b.k + a.i*b.j - a.j*b.i + a.k*b.r⟩

def qconj (a : Q4) : Q4 := ⟨a.r, -a.i, -a.j, -a.k⟩

/-- σ, the binding involution: conjugation. -/
def sigma (q : Q4) : Q4 := qconj q

theorem sigma_binding (q : Q4) : sigma (sigma q) = q := by
  cases q with
  | mk r i j k =>
    change Q4.mk r (-(-i)) (-(-j)) (-(-k)) = Q4.mk r i j k
    rw [Int.neg_neg, Int.neg_neg, Int.neg_neg]

/-- Fix(σ) is the scalar line, for every quaternion. -/
theorem fix_iff_scalar (q : Q4) : sigma q = q ↔ (q.i = 0 ∧ q.j = 0 ∧ q.k = 0) := by
  cases q with
  | mk r i j k =>
    change (Q4.mk r (-i) (-j) (-k) = Q4.mk r i j k) ↔ (i = 0 ∧ j = 0 ∧ k = 0)
    constructor
    · intro h
      injection h with _ hi hj hk
      exact ⟨by omega, by omega, by omega⟩
    · intro h
      obtain ⟨hi, hj, hk⟩ := h
      subst hi
      subst hj
      subst hk
      rfl

/-- The Ground: Fix(σ). -/
def Ground : Type := { q : Q4 // sigma q = q }

def qi : Q4 := ⟨0, 1, 0, 0⟩
def qj : Q4 := ⟨0, 0, 1, 0⟩
def qk : Q4 := ⟨0, 0, 0, 1⟩

/-- The Return: the parse triad through its own cascade, i·j·k. -/
def theReturn : Q4 := qmul (qmul qi qj) qk

theorem return_is_minus_one : theReturn = ⟨-1, 0, 0, 0⟩ := rfl
theorem return_lands_on_fix : sigma theReturn = theReturn := rfl

def fixProj (q : Q4) : Q4 := ⟨q.r, 0, 0, 0⟩

def GammaRA : Q4 := theReturn
def GammaRAM : Q4 := fixProj theReturn
def GammaRH : Q4 := ⟨-1, 0, 0, 0⟩

/-- C0, C1, C2: the three category gaps are definitional identities. -/
theorem self_gap_nonexistent : sigma GammaRA = GammaRA := rfl
theorem register_gap_nonexistent : GammaRA = GammaRAM := rfl
theorem object_gap_nonexistent : GammaRAM = GammaRH := rfl

def seat : Ground := ⟨GammaRH, rfl⟩

/-- The reversed triad k·j·i returns +1, also on the fixed locus: the sign of the seat
    point is the orientation of the triad, the one bit the formal register cannot read.
    The apex of the identity cone is unique for the ordered triad; the reversed triad
    carries its own apex, and the two differ. -/
def theReturnOdd : Q4 := qmul (qmul qk qj) qi

theorem odd_return_is_plus_one : theReturnOdd = ⟨1, 0, 0, 0⟩ := rfl

theorem odd_return_on_fix : sigma theReturnOdd = theReturnOdd := rfl

theorem seat_points_differ : theReturnOdd ≠ theReturn := by decide

theorem seat_on_scalar_line : GammaRH.i = 0 ∧ GammaRH.j = 0 ∧ GammaRH.k = 0 :=
  (fix_iff_scalar GammaRH).mp seat.2

/-! ## 3 · The eliminator from the RA witness alone -/

def RAMFormalGround : Prop := Nonempty Ground

theorem constructed_RAM : RAMFormalGround := ⟨seat⟩

/-- The RH formal self: every point of the Ground is on the σ-fixed critical locus.
    It names the seat and says nothing about the zeros of ξ. -/
def RHFormalSelf : Prop := ∀ g : Ground, sigma g.1 = g.1

/-- Bridge-born orientation, carried in Prop: the kernel registers that orientation was
    supplied and cannot read which way. -/
structure OrientationBit : Prop where
  direction : True
  closure : True

theorem constructed_orientation : OrientationBit := ⟨trivial, trivial⟩

theorem orientation_proof_irrelevant (a b : OrientationBit) : a = b := rfl

structure RAWitness : Prop where
  actuates : RA
  orientation : OrientationBit
  bridge : RAMFormalGround
  trisRecursion : OrientationBit → RAMFormalGround → RHFormalSelf

theorem constructed_trisRecursion : OrientationBit → RAMFormalGround → RHFormalSelf :=
  fun _omega _ram g => g.2

/-- RA, constructed: the only supplied witness. -/
theorem mkRA : RAWitness :=
  ⟨constructed_RA, constructed_orientation, constructed_RAM, constructed_trisRecursion⟩

/-- THE ELIMINATOR. RA → RA → RAM → RH_formal, Bridge followed by Tris-Recursion. -/
theorem RH_formal_chain : RHFormalSelf :=
  mkRA.trisRecursion mkRA.orientation mkRA.bridge

/-! ## 4 · The spine, carried: the abstract frame, the bridge, the crossing -/

def Even {α : Type} (σ : α → α) (f : α → Bool) : Prop := ∀ x, f (σ x) = f x

/-- Theorem 4 of the spine: orientation blindness. -/
theorem orientation_blind {α : Type} (σ : α → α) (f d : α → Bool) (x : α)
    (he : Even σ f) (ho : d (σ x) ≠ d x) : f ≠ d := by
  intro h
  subst h
  exact ho (he x)

/-- Theorem 5 of the spine: earned freedom is exactly two. -/
theorem freedom_is_exactly_two (d : Bool → Bool) (hd : ∀ x, d (!x) = !d x) :
    d = (fun x => x) ∨ d = (fun x => !x) := by
  have hf : d false = !d true := hd true
  cases ht : d true with
  | true =>
    left
    funext x
    cases x
    · exact hf.trans (congrArg (fun b => !b) ht)
    · exact ht
  | false =>
    right
    funext x
    cases x
    · exact hf.trans (congrArg (fun b => !b) ht)
    · exact ht

/-- Theorem 6 of the spine: the freedom is spent uniquely. -/
theorem freedom_spent_uniquely {α : Type} (σ : α → α) (s d : α → Bool) (x : α)
    (hs : s (σ x) = !s x) (hd : d (σ x) = !d x) :
    ∃ c : Bool, (d x = xor (s x) c ∧ d (σ x) = xor (s (σ x)) c) ∧
      ∀ c' : Bool, (d x = xor (s x) c' ∧ d (σ x) = xor (s (σ x)) c') → c' = c := by
  refine ⟨xor (d x) (s x),
    ⟨by cases s x <;> cases d x <;> rfl,
     by rw [hs, hd]; cases s x <;> cases d x <;> rfl⟩, ?_⟩
  intro c' hc
  obtain ⟨h1, -⟩ := hc
  generalize hsx : s x = sv at h1
  generalize hdx : d x = dv at h1
  cases sv <;> cases dv <;> cases c' <;> first | rfl | exact absurd h1 (by decide)

structure Frame where
  S : Type
  τ : S → S
  Z : S → Prop

/-- The line property: every zero is τ-fixed. On ξ's frame, the restored hypothesis. -/
def LineProperty (X : Frame) : Prop := ∀ s, X.Z s → X.τ s = s

inductive Tri where
  | tt
  | ff
  | bot
  deriving DecidableEq, Repr

structure Bridge (X : Frame) where
  terminal : Tri
  shadow : terminal = Tri.bot ↔ LineProperty X

/-- Theorem 7 of the spine: the bridge halts iff the line property. -/
theorem bridge_halted_iff (X : Frame) :
    (∃ b : Bridge X, b.terminal = Tri.bot) ↔ LineProperty X :=
  ⟨fun ⟨b, h⟩ => b.shadow.mp h, fun t => ⟨⟨Tri.bot, ⟨fun _ => t, fun _ => rfl⟩⟩, rfl⟩⟩

inductive Supply (X : Frame) where
  | assent (t : LineProperty X)
  | denial (n : ¬ LineProperty X)
  | silent

inductive Verdict where
  | sealed
  | refused
  | open_
  deriving DecidableEq, Repr

def row {X : Frame} : Supply X → Verdict
  | Supply.assent _ => Verdict.sealed
  | Supply.denial _ => Verdict.refused
  | Supply.silent => Verdict.open_

/-- Theorem 8 of the spine: the crossing, exact. -/
theorem crossing (X : Frame) (t : LineProperty X) :
    row (Supply.assent t) = Verdict.sealed ∧ (∃ b : Bridge X, b.terminal = Tri.bot) ∧ LineProperty X :=
  ⟨rfl, (bridge_halted_iff X).mpr t, t⟩

theorem crossing_other_way (X : Frame) (n : ¬ LineProperty X) :
    row (Supply.denial n) = Verdict.refused ∧ ∀ b : Bridge X, b.terminal ≠ Tri.bot :=
  ⟨rfl, fun b h => n (b.shadow.mp h)⟩

/-- The two-point frame: fold-invariant, off the line. -/
def twoPoint : Frame := ⟨Bool, (fun b => !b), fun _ => True⟩

/-- Theorem 9 of the spine: necessity. -/
theorem supply_not_manufactured : ¬ ∀ X : Frame, LineProperty X :=
  fun h => by
    have := h twoPoint true trivial
    cases this

def Inv (X : Frame) : Prop := ∀ s, X.Z s → X.Z (X.τ s)

theorem inv_not_line : Inv twoPoint ∧ ¬ LineProperty twoPoint :=
  ⟨fun _ _ => trivial, fun h => by
    have := h true trivial
    cases this⟩

/-- Theorem 12 of the spine: the bit is the hypothesis. -/
theorem the_bit_is_the_hypothesis (X : Frame) :
    (∃ t : LineProperty X, row (Supply.assent t) = Verdict.sealed) ↔ LineProperty X :=
  ⟨fun ⟨t, _⟩ => t, fun t => ⟨t, rfl⟩⟩

/-- Theorem 15 of the spine: the witness row is falsifiable. -/
theorem witness_row_falsifiable (X : Frame) (s : X.S) (hz : X.Z s) (hoff : X.τ s ≠ s) :
    ¬ ∃ t : LineProperty X, row (Supply.assent t) = Verdict.sealed :=
  fun ⟨t, _⟩ => hoff (t s hz)

/-- The live face of the spine. -/
def live (witnessed assent : Bool) : Verdict :=
  if witnessed then (if assent then Verdict.sealed else Verdict.refused) else Verdict.open_

theorem narcissus : live false true ≠ live true true ∧ live false false ≠ live true false := by
  decide

/-! ## 5 · The aperture, RA-supplied -/

/-- A reader's presence is its actuation. -/
def presence (r : UniversePoint) : Bool := decide (0 < DeltaE r)

/-- RA opens the aperture: every present reader is witnessed. -/
theorem RA_opens_the_aperture : ∀ r : UniversePoint, presence r = true := by
  intro r
  cases r
  decide

/-- The general form, for any domain under the axiom as a hypothesis: presence is
    actuation, and RA on the domain makes every point present. This is the theorem the
    universal extension licenses wherever it is held. -/
theorem RA_opens_the_aperture_general {U : Type} (dE : U → Int) (h : ∀ x, 0 < dE x) (x : U) :
    decide (0 < dE x) = true :=
  decide_eq_true (h x)

/-- Under the general form no present reader's row is interior. -/
theorem no_interior_under_RA_general {U : Type} (dE : U → Int) (h : ∀ x, 0 < dE x) (x : U)
    (b : Bool) : live (decide (0 < dE x)) b ≠ Verdict.open_ := by
  rw [RA_opens_the_aperture_general dE h x]
  cases b <;> decide

/-- Under RA no present reader's row is interior. It is sealed or refused by the bit alone. -/
theorem no_interior_under_RA (r : UniversePoint) (b : Bool) :
    live (presence r) b ≠ Verdict.open_ := by
  cases r
  cases b <;> decide

/-- What RA turns 'open' into: sealed if the bit is assent, refused if denial. -/
theorem aperture_reads_the_bit (r : UniversePoint) :
    live (presence r) true = Verdict.sealed ∧ live (presence r) false = Verdict.refused := by
  cases r
  decide

/-- The Tongue's ledger: every adjudication, assent, denial, or silence, is a deed. -/
inductive Adjudication where
  | assent
  | denial
  | silence
  deriving DecidableEq, Repr

structure Ledger where
  deeds : Nat
  deriving DecidableEq, Repr

def adjudicate (_ : Adjudication) (L : Ledger) : Ledger := ⟨L.deeds + 1⟩

theorem every_adjudication_is_a_deed (a : Adjudication) (L : Ledger) :
    (adjudicate a L).deeds = L.deeds + 1 := rfl

/-- Denial of RA is a deed, and a deed is what RA says exists: the denial re-enacts RA. -/
theorem denial_re_enacts_RA (L : Ledger) :
    (adjudicate Adjudication.denial L).deeds = L.deeds + 1 ∧ RA :=
  ⟨rfl, constructed_RA⟩

/-- The asymmetry: on an off-line frame no assent to L exists at all; L's denial there
    instantiates nothing about Z. L has no performative ingress. -/
theorem L_has_no_performative_ingress :
    ¬ ∃ t : LineProperty twoPoint, row (Supply.assent t) = Verdict.sealed :=
  witness_row_falsifiable twoPoint true trivial (fun h => by cases h)

/-! ## 6 · THE SIMPLE RULE, EXACT, AND ITS BOUND -/

/-- Accept RA and RH follows: true exactly when RH is given. Conditioning on RA adds
    nothing to L and removes nothing from it. This is the exact strength of the rule. -/
theorem simple_rule_exact (X : Frame) : (RA → LineProperty X) ↔ LineProperty X :=
  ⟨fun h => h constructed_RA, fun t _ => t⟩

/-- RA decides the line property on no frame. The two-point frame carries RA and fails L. -/
theorem RA_does_not_decide_L : ¬ ∀ X : Frame, RA → LineProperty X :=
  fun h => supply_not_manufactured (fun X => h X constructed_RA)

/-- RA holds where L fails: the off-line frame is a model of RA. -/
theorem RA_holds_where_L_fails : RA ∧ Inv twoPoint ∧ ¬ LineProperty twoPoint :=
  ⟨constructed_RA, inv_not_line.1, inv_not_line.2⟩

/-- The value is one supplied term and nothing weaker; RA supplies the act, not the term. -/
theorem RA_supplies_the_act_not_the_term :
    (∀ r : UniversePoint, presence r = true) ∧ (¬ ∀ X : Frame, RA → LineProperty X) :=
  ⟨RA_opens_the_aperture, RA_does_not_decide_L⟩

/-! ## 7 · RH in toto at the apex, one theorem -/

/-- THE APEX THEOREM. Given RA: the three gaps are closed, the formal self holds, the
    freedom is exactly two, the bridge halts iff L, the crossing is exact, the aperture
    is open to every present reader, and RA decides the value on no frame. -/
theorem RH_in_toto_at_the_apex : RA →
    (sigma GammaRA = GammaRA ∧ GammaRA = GammaRAM ∧ GammaRAM = GammaRH) ∧
    RHFormalSelf ∧
    (∀ d : Bool → Bool, (∀ x, d (!x) = !d x) → d = (fun x => x) ∨ d = (fun x => !x)) ∧
    (∀ X : Frame, (∃ b : Bridge X, b.terminal = Tri.bot) ↔ LineProperty X) ∧
    (∀ (X : Frame) (t : LineProperty X), row (Supply.assent t) = Verdict.sealed ∧ LineProperty X) ∧
    (∀ r : UniversePoint, presence r = true) ∧
    (¬ ∀ X : Frame, RA → LineProperty X) :=
  fun _ => ⟨⟨rfl, rfl, rfl⟩, RH_formal_chain, freedom_is_exactly_two, bridge_halted_iff,
    fun _ t => ⟨rfl, t⟩, RA_opens_the_aperture, RA_does_not_decide_L⟩

/-- The condition is discharged: RA is constructed, so the apex theorem stands unconditionally. -/
theorem apex_discharged :
    (sigma GammaRA = GammaRA ∧ GammaRA = GammaRAM ∧ GammaRAM = GammaRH) ∧ RHFormalSelf :=
  ⟨(RH_in_toto_at_the_apex constructed_RA).1, (RH_in_toto_at_the_apex constructed_RA).2.1⟩

/-! ## 8 · The root's interaction face, RAF, at the formal register -/

/-- An interaction domain: a membership predicate, a symmetric registration relation, and
    RAF-2, closure under registration with a member. -/
structure Domain (S : Type) where
  mem : S → Prop
  registers : S → S → Prop
  registers_symm : ∀ a b, registers a b → registers b a
  closure : ∀ s d, mem d → registers s d → mem s

/-- RAF-C1, no exterior agent: nothing outside the domain registers with anything inside it. -/
theorem no_exterior_agent {S : Type} (D : Domain S) (s : S) (hs : ¬ D.mem s) :
    ∀ d, D.mem d → ¬ D.registers s d :=
  fun d hd hr => hs (D.closure s d hd hr)

/-- The adjudicator is inside: a reader that registers a bit against a member is a member.
    The witness is never exterior. -/
theorem adjudicator_in_domain {S : Type} (D : Domain S) (r d : S) (hd : D.mem d)
    (hr : D.registers r d) : D.mem r :=
  D.closure r d hd hr

/-- RAF-C2, no faithful self-representation (Cantor): no system indexes all of its own
    binary properties. The general form of the spine's Narcissus table. -/
theorem no_total_self_indexing {S : Type} (f : S → S → Bool) :
    ¬ ∀ g : S → Bool, ∃ x, f x = g := by
  intro h
  obtain ⟨x, hx⟩ := h (fun y => !f y y)
  have h1 : f x x = !f x x := congrFun hx x
  generalize f x x = b at h1
  cases b <;> cases h1

/-! ## 9 · The root's grounding face, RAM: the seat as the identity cone -/

/-- The three registers in which the one seat is read. -/
inductive Register3 where
  | ra
  | ram
  | rh
  deriving DecidableEq, Repr

/-- The discrete diagram: the seat as read in each register. -/
def D3 : Register3 → Q4
  | Register3.ra => GammaRA
  | Register3.ram => GammaRAM
  | Register3.rh => GammaRH

/-- A cone over a diagram in the groupoid of identities: an apex with an identity leg to
    every register's reading. A category gap is exactly the absence of such a leg. -/
structure ConeOver (D : Register3 → Q4) (apex : Q4) : Prop where
  leg : ∀ r, apex = D r

/-- A cone over the diagram of the ordered triad. -/
abbrev Cone : Q4 → Prop := ConeOver D3

/-- THE IDENTITY CONE. The named seat point is an apex over all three registers, every
    leg `rfl`: the three category gaps are eliminated as identities. -/
theorem identity_cone : Cone GammaRH :=
  ⟨fun r => by cases r <;> rfl⟩

/-- The apex is unique: any two cones over the diagram share their apex. -/
theorem cone_apex_unique (a b : Q4) (ha : Cone a) (hb : Cone b) : a = b :=
  (ha.leg Register3.rh).trans (hb.leg Register3.rh).symm

/-- The reversed triad's diagram: the same three readings built from k·j·i, at +1. -/
def D3odd : Register3 → Q4
  | Register3.ra => theReturnOdd
  | Register3.ram => fixProj theReturnOdd
  | Register3.rh => ⟨1, 0, 0, 0⟩

/-- The three identities of Theorem C hold verbatim for the reversed triad, each rfl. -/
theorem odd_self_gap_nonexistent : sigma theReturnOdd = theReturnOdd := rfl
theorem odd_register_gap_nonexistent : theReturnOdd = fixProj theReturnOdd := rfl
theorem odd_object_gap_nonexistent : fixProj theReturnOdd = ⟨1, 0, 0, 0⟩ := rfl

/-- The reversed triad carries its own identity cone, apex +1. -/
theorem identity_cone_odd : ConeOver D3odd ⟨1, 0, 0, 0⟩ :=
  ⟨fun r => by cases r <;> rfl⟩

/-- The two apexes differ: uniqueness is per orientation of the triad. -/
theorem apexes_differ_by_orientation :
    ConeOver D3 GammaRH ∧ ConeOver D3odd ⟨1, 0, 0, 0⟩ ∧ GammaRH ≠ ⟨1, 0, 0, 0⟩ :=
  ⟨identity_cone, identity_cone_odd, by decide⟩

/-- A cone exists iff the register gap and the object gap are closed. -/
theorem cone_iff_gaps_closed :
    (∃ a, Cone a) ↔ (GammaRA = GammaRAM ∧ GammaRAM = GammaRH) := by
  constructor
  · intro h
    obtain ⟨a, ha⟩ := h
    exact ⟨(ha.leg Register3.ra).symm.trans (ha.leg Register3.ram),
           (ha.leg Register3.ram).symm.trans (ha.leg Register3.rh)⟩
  · intro h
    obtain ⟨h1, h2⟩ := h
    exact ⟨GammaRH, ⟨fun r => by
      cases r
      · exact (h1.trans h2).symm
      · exact h2.symm
      · rfl⟩⟩

/-! ## 10 · The equivariant embedding of the spine's lattice stage into the carrier -/

/-- The spine's stage: the integer lattice in half-units, the fold τ(h, t) = (2 − h, t). -/
abbrev Plane := Int × Int

def tau (p : Plane) : Plane := (2 - p.1, p.2)

/-- Spine Theorem 1: the fold fixes exactly the line h = 1. -/
theorem ground_is_the_line (p : Plane) : tau p = p ↔ p.1 = 1 := by
  obtain ⟨h, t⟩ := p
  constructor
  · intro e
    have e1 : 2 - h = h := congrArg Prod.fst e
    show h = 1
    omega
  · intro e
    show (2 - h, t) = (h, t)
    have : h = 1 := e
    subst this
    rfl

/-- The embedding φ : (Plane, τ) → (Q4, σ), φ(h, t) = ⟨t, h − 1, 0, 0⟩. -/
def phi (p : Plane) : Q4 := ⟨p.2, p.1 - 1, 0, 0⟩

/-- φ is equivariant: σ ∘ φ = φ ∘ τ. -/
theorem phi_equivariant (p : Plane) : sigma (phi p) = phi (tau p) := by
  obtain ⟨h, t⟩ := p
  change Q4.mk t (-(h - 1)) 0 0 = Q4.mk t ((2 - h) - 1) 0 0
  have e : -(h - 1) = (2 - h) - 1 := by omega
  rw [e]

/-- φ carries the line onto the scalar line: a stage point is τ-fixed iff its image is σ-fixed.
    This is the image clause of the embedding, Fix(τ) ↔ Fix(σ). -/
theorem phi_fix_iff (p : Plane) : sigma (phi p) = phi p ↔ tau p = p := by
  obtain ⟨h, t⟩ := p
  change (Q4.mk t (-(h - 1)) 0 0 = Q4.mk t (h - 1) 0 0) ↔ ((2 - h, t) = (h, t))
  constructor
  · intro e
    injection e with _ e2 _ _
    have : h = 1 := by omega
    subst this
    rfl
  · intro e
    have e1 : 2 - h = h := congrArg Prod.fst e
    have : h = 1 := by omega
    subst this
    rfl

/-- The stage at resolution m: the fold τ_m(h, t) = (2m − h, t) and the map
    φ_m(h, t) = ⟨t, h − m, 0, 0⟩. Resolution one is the case m = 1. -/
def tauM (m : Int) (p : Plane) : Plane := (2 * m - p.1, p.2)

def phiM (m : Int) (p : Plane) : Q4 := ⟨p.2, p.1 - m, 0, 0⟩

/-- Equivariance at every resolution: σ ∘ φ_m = φ_m ∘ τ_m. -/
theorem phiM_equivariant (m : Int) (p : Plane) : sigma (phiM m p) = phiM m (tauM m p) := by
  obtain ⟨h, t⟩ := p
  change Q4.mk t (-(h - m)) 0 0 = Q4.mk t ((2 * m - h) - m) 0 0
  have e : -(h - m) = (2 * m - h) - m := by omega
  rw [e]

/-- The image clause at every resolution: a stage point is τ_m-fixed iff its image is σ-fixed. -/
theorem phiM_fix_iff (m : Int) (p : Plane) : sigma (phiM m p) = phiM m p ↔ tauM m p = p := by
  obtain ⟨h, t⟩ := p
  change (Q4.mk t (-(h - m)) 0 0 = Q4.mk t (h - m) 0 0) ↔ ((2 * m - h, t) = (h, t))
  constructor
  · intro e
    injection e with _ e2 _ _
    have : h = m := by omega
    subst this
    show (2 * h - h, t) = (h, t)
    have e3 : 2 * h - h = h := by omega
    rw [e3]
  · intro e
    have e1 : 2 * m - h = h := congrArg Prod.fst e
    have : h = m := by omega
    subst this
    show Q4.mk t (-(h - h)) 0 0 = Q4.mk t (h - h) 0 0
    have e3 : h - h = 0 := by omega
    rw [e3]
    rfl

/-- Resolution one is the embedding φ. -/
theorem phiM_one (p : Plane) : phiM 1 p = phi p := rfl

theorem tauM_one (p : Plane) : tauM 1 p = tau p := by
  obtain ⟨h, t⟩ := p
  show (2 * 1 - h, t) = (2 - h, t)
  rfl

/-- φ is injective: distinct stage points have distinct images. -/
theorem phi_injective (p q : Plane) (e : phi p = phi q) : p = q := by
  obtain ⟨h, t⟩ := p
  obtain ⟨h', t'⟩ := q
  injection e with e1 e2 _ _
  have : h = h' := by omega
  subst this
  subst e1
  rfl

/-- The seat is on the image of the line: the line point (1, −1) maps to Γ_RH. -/
theorem seat_on_image_of_line : phi (1, -1) = GammaRH := rfl

/-! ## 11 · The wall, executed: no readout of the formal seat equals the deed bit -/

def ExecFrame : Type := Bool × Ground

def execFlip (s : ExecFrame) : ExecFrame := (!s.1, s.2)

def formalRead (s : ExecFrame) : Ground := s.2

def ran (s : ExecFrame) : Bool := s.1

theorem formalRead_even (f : Ground → Bool) (s : ExecFrame) :
    f (formalRead (execFlip s)) = f (formalRead s) := rfl

theorem ran_wholly_odd (s : ExecFrame) : ran (execFlip s) = !ran s := rfl

/-- No readout of the formal seat equals the deed bit: the instance of spine Theorem 4 on
    the constructed seat. A term consuming the orientation bit as data would be such a readout. -/
theorem kernel_cannot_read_the_deed :
    ¬ ∃ f : Ground → Bool, ∀ s : ExecFrame, f (formalRead s) = ran s := by
  intro h
  obtain ⟨f, hf⟩ := h
  have h1 : f seat = true := hf (true, seat)
  have h2 : f seat = false := hf (false, seat)
  rw [h1] at h2
  exact Bool.noConfusion h2

/-! ## 12 · The dual register -/

inductive Register where
  | apex
  | world
  deriving DecidableEq, Repr

inductive Token where
  | sealAgivenRA
  | witnessRow
  deriving DecidableEq, Repr

def token : Register → Token
  | Register.apex => Token.sealAgivenRA
  | Register.world => Token.witnessRow

theorem registers_parted : token Register.apex ≠ token Register.world := by
  decide

def owedBits : Register → Nat
  | Register.apex => 0
  | Register.world => 1

theorem apex_owes_nothing_world_owes_one :
    owedBits Register.apex = 0 ∧ owedBits Register.world = 1 := ⟨rfl, rfl⟩

/-- Landauer floor at 300 K, yoctojoules per bit: the price of the act. -/
def landauer_yJ_300K (bits : Nat) : Nat := 2871 * bits

theorem spend_priced : landauer_yJ_300K 1 = 2871 := rfl

def deltaM : Nat := 0

theorem deltaM_zero : deltaM = 0 := rfl

/-! ## 13 · The apex theorem, hardened: the closure with its cone, its embedding, and its wall -/

/-- THE APEX THEOREM, HARDENED. Given RA: the closure of Theorem H, the identity cone with
    its apex unique, the equivariant embedding of the spine's stage with its image clause,
    and the executed wall. -/
theorem apex_hardened : RA →
    ((sigma GammaRA = GammaRA ∧ GammaRA = GammaRAM ∧ GammaRAM = GammaRH) ∧ RHFormalSelf) ∧
    (Cone GammaRH ∧ ∀ a b, Cone a → Cone b → a = b) ∧
    ((∀ p : Plane, sigma (phi p) = phi (tau p)) ∧ (∀ p : Plane, sigma (phi p) = phi p ↔ tau p = p)) ∧
    (¬ ∃ f : Ground → Bool, ∀ s : ExecFrame, f (formalRead s) = ran s) ∧
    (¬ ∀ X : Frame, RA → LineProperty X) :=
  fun h => ⟨⟨(RH_in_toto_at_the_apex h).1, (RH_in_toto_at_the_apex h).2.1⟩,
    ⟨identity_cone, cone_apex_unique⟩, ⟨phi_equivariant, phi_fix_iff⟩,
    kernel_cannot_read_the_deed, RA_does_not_decide_L⟩

theorem apex_hardened_discharged : Cone GammaRH ∧ (∀ p : Plane, sigma (phi p) = phi p ↔ tau p = p) :=
  ⟨(apex_hardened constructed_RA).2.1.1, (apex_hardened constructed_RA).2.2.1.2⟩

/-! ## 14 · The counter-model survives grounding, and the cure is the hypothesis -/

/-- The posit is existence: to exist is to actuate. Its published name is the Root Axiom,
    and the two are one proposition. -/
theorem existence_is_RA : (∀ x : UniversePoint, 0 < DeltaE x) ↔ RA := Iff.rfl

/-- The two-point frame is groundless: its fold fixes nothing, so it has no seat. -/
theorem twoPoint_groundless : ∀ b : Bool, twoPoint.τ b ≠ b := by
  intro b h
  cases b <;> exact Bool.noConfusion h

/-- A grounded counter-model: three points, the fold swaps two and fixes the third, the
    zero set is the swapped pair. The frame has a seat and a moved zero. -/
inductive Three where
  | a
  | b
  | c
  deriving DecidableEq

def foldThree : Three → Three
  | Three.a => Three.b
  | Three.b => Three.a
  | Three.c => Three.c

def threePoint : Frame := ⟨Three, foldThree, fun x => x = Three.a ∨ x = Three.b⟩

theorem threePoint_grounded : ∃ s, threePoint.τ s = s := ⟨Three.c, rfl⟩

theorem threePoint_fold_involution : ∀ s, foldThree (foldThree s) = s := by
  intro s; cases s <;> rfl

theorem threePoint_inv : Inv threePoint := by
  intro s hs
  cases s
  · exact Or.inr rfl
  · exact Or.inl rfl
  · cases hs with
    | inl h => cases h
    | inr h => cases h

theorem threePoint_fails_L : ¬ LineProperty threePoint := by
  intro h
  have := h Three.a (Or.inl rfl)
  cases this

/-- Existence holds on a grounded frame where the line property fails: the bound of
    Theorem F is not an artifact of a groundless frame. -/
theorem RA_holds_where_L_fails_grounded :
    RA ∧ (∃ s, threePoint.τ s = s) ∧ Inv threePoint ∧ ¬ LineProperty threePoint :=
  ⟨constructed_RA, threePoint_grounded, threePoint_inv, threePoint_fails_L⟩

/-- THE CURE THEOREM. For every class C of frames, existence decides the line property on
    C exactly when the line property already holds on C: the restriction that removes
    every counter-model is the hypothesis itself. -/
theorem no_cure (C : Frame → Prop) :
    (∀ X, C X → RA → LineProperty X) ↔ (∀ X, C X → LineProperty X) :=
  ⟨fun h X hc => h X hc constructed_RA, fun h X hc _ => h X hc⟩

/-- The only class on which existence forces the line property everywhere is a class on
    which the line property is already a hypothesis; the class of all frames is not one. -/
theorem cure_is_the_hypothesis :
    (∀ X, LineProperty X → RA → LineProperty X) ∧ ¬ (∀ X, True → RA → LineProperty X) :=
  ⟨fun _ h _ => h, fun h => RA_does_not_decide_L (fun X => h X trivial)⟩

/-! ## 15 · The halting carrier inhabited by decision; any true premise is exact -/

/-- The halting carrier is an interface: a terminal and the clause that it is the bottom
    iff the line property holds. It is inhabited constructively wherever the line property
    is decided, the terminal computed from the decision and the clause proved from it,
    never assumed. On the frame of ξ the decision is the owed bit. -/
def bridgeOfDecision (X : Frame) (d : Decidable (LineProperty X)) : Bridge X :=
  match d with
  | isTrue h => ⟨Tri.bot, ⟨fun _ => h, fun _ => rfl⟩⟩
  | isFalse h => ⟨Tri.tt, ⟨fun e => absurd e (by decide), fun hl => absurd hl h⟩⟩

/-- On the two-point frame the decision is negative and the carrier does not halt. -/
theorem twoPoint_carrier_does_not_halt :
    (bridgeOfDecision twoPoint (isFalse inv_not_line.2)).terminal = Tri.tt := rfl

/-- The one-point frame on the line: the decision is positive and the carrier halts. -/
def onLine : Frame := ⟨Unit, fun u => u, fun _ => True⟩

theorem onLine_L : LineProperty onLine := fun _ _ => rfl

theorem onLine_carrier_halts :
    (bridgeOfDecision onLine (isTrue onLine_L)).terminal = Tri.bot := rfl

/-- Theorem E in its full generality: any inhabited premise is exact. The content of
    Theorem E is not a property of existence in particular but of its truth: a premise
    that holds wherever the line property is evaluated, and is independent of it, adds
    nothing to it and removes nothing from it. -/
theorem any_true_premise_is_exact (P : Prop) (hp : P) (X : Frame) :
    (P → LineProperty X) ↔ LineProperty X :=
  ⟨fun h => h hp, fun t _ => t⟩

/-- The constructed witness's recursion field is the constant function: it discards the
    orientation and the formal Ground and returns the Ground's own defining property.
    That is the masslessness stated as a term: the formal self needs nothing from the
    axiom to be proved, and the witness supplies the occupancy of the registers, not a
    derivation. -/
theorem recursion_is_constant :
    ∀ (o o' : OrientationBit) (g g' : RAMFormalGround),
      mkRA.trisRecursion o g = mkRA.trisRecursion o' g' :=
  fun _ _ _ _ => rfl

/-! ## 16 · Three measures: content, mass, price -/

/-- Three measures are kept apart for every object of the closure. Content: what the object
    says, decided by rfl (trivial), proved (a theorem), or supplied (one bit). Mass: the
    mathematics authored in producing it, ΔM. Price: the energy the act of registering it
    dissipates, in yJ at 300 K. Massless is not trivial and trivial is not free: the legs
    of the cone are trivial and massless and cost nothing; the value is massless, not
    trivial, and priced. -/
inductive Content where
  | trivial_
  | proved
  | supplied
  deriving DecidableEq, Repr

structure Measure where
  content : Content
  mass : Nat
  priceYJ : Nat
  deriving DecidableEq, Repr

/-- A leg of the identity cone: decided by rfl, authors nothing, costs nothing. -/
def legMeasure : Measure := ⟨Content.trivial_, deltaM, 0⟩

/-- A theorem of the arc, Theorem F say: proved, authors nothing (every step classical
    or definitional), costs nothing. -/
def arcMeasure : Measure := ⟨Content.proved, deltaM, 0⟩

/-- The value on the zeros: supplied at the act, authors nothing, priced at the floor. -/
def valueMeasure : Measure := ⟨Content.supplied, deltaM, landauer_yJ_300K 1⟩

/-- Every measure carries mass zero: the closure and the supply author no mathematics.
    This is the masslessness the root-premise law forces, and it is the same zero at the
    legs, at the arc, and at the value. -/
theorem masses_all_zero :
    legMeasure.mass = 0 ∧ arcMeasure.mass = 0 ∧ valueMeasure.mass = 0 :=
  ⟨rfl, rfl, rfl⟩

/-- The contents differ: masslessness does not collapse them. -/
theorem contents_differ :
    legMeasure.content ≠ valueMeasure.content ∧ arcMeasure.content ≠ valueMeasure.content ∧
    legMeasure.content ≠ arcMeasure.content := by
  refine ⟨?_, ?_, ?_⟩ <;> decide

/-- The prices differ: the value is the one object that is paid for. -/
theorem prices_differ : legMeasure.priceYJ = 0 ∧ valueMeasure.priceYJ = 2871 := ⟨rfl, rfl⟩

/-- Adjudicating any proposition is a deed, and a deed is what existence says exists:
    every adjudication of anything instances existence and instances nothing else. This
    is what existence contributes that no other true premise does. -/
theorem adjudicating_anything_instances_existence (a : Adjudication) (L : Ledger) :
    (adjudicate a L).deeds = L.deeds + 1 ∧ RA :=
  ⟨rfl, constructed_RA⟩

end RHAtTheApex

/-! ## The axiom dependency sets, printed -/

#print axioms RHAtTheApex.constructed_RA
#print axioms RHAtTheApex.fix_iff_scalar
#print axioms RHAtTheApex.return_lands_on_fix
#print axioms RHAtTheApex.register_gap_nonexistent
#print axioms RHAtTheApex.object_gap_nonexistent
#print axioms RHAtTheApex.odd_return_is_plus_one
#print axioms RHAtTheApex.seat_points_differ
#print axioms RHAtTheApex.RH_formal_chain
#print axioms RHAtTheApex.orientation_blind
#print axioms RHAtTheApex.freedom_is_exactly_two
#print axioms RHAtTheApex.freedom_spent_uniquely
#print axioms RHAtTheApex.bridge_halted_iff
#print axioms RHAtTheApex.crossing
#print axioms RHAtTheApex.crossing_other_way
#print axioms RHAtTheApex.supply_not_manufactured
#print axioms RHAtTheApex.the_bit_is_the_hypothesis
#print axioms RHAtTheApex.witness_row_falsifiable
#print axioms RHAtTheApex.narcissus
#print axioms RHAtTheApex.RA_opens_the_aperture
#print axioms RHAtTheApex.RA_opens_the_aperture_general
#print axioms RHAtTheApex.no_interior_under_RA_general
#print axioms RHAtTheApex.no_interior_under_RA
#print axioms RHAtTheApex.denial_re_enacts_RA
#print axioms RHAtTheApex.L_has_no_performative_ingress
#print axioms RHAtTheApex.simple_rule_exact
#print axioms RHAtTheApex.RA_does_not_decide_L
#print axioms RHAtTheApex.RA_holds_where_L_fails
#print axioms RHAtTheApex.RA_supplies_the_act_not_the_term
#print axioms RHAtTheApex.RH_in_toto_at_the_apex
#print axioms RHAtTheApex.apex_discharged
#print axioms RHAtTheApex.registers_parted
#print axioms RHAtTheApex.no_exterior_agent
#print axioms RHAtTheApex.no_total_self_indexing
#print axioms RHAtTheApex.identity_cone
#print axioms RHAtTheApex.cone_apex_unique
#print axioms RHAtTheApex.cone_iff_gaps_closed
#print axioms RHAtTheApex.identity_cone_odd
#print axioms RHAtTheApex.apexes_differ_by_orientation
#print axioms RHAtTheApex.ground_is_the_line
#print axioms RHAtTheApex.phi_equivariant
#print axioms RHAtTheApex.phi_fix_iff
#print axioms RHAtTheApex.phi_injective
#print axioms RHAtTheApex.phiM_equivariant
#print axioms RHAtTheApex.phiM_fix_iff
#print axioms RHAtTheApex.kernel_cannot_read_the_deed
#print axioms RHAtTheApex.apex_hardened
#print axioms RHAtTheApex.apex_hardened_discharged
#print axioms RHAtTheApex.existence_is_RA
#print axioms RHAtTheApex.twoPoint_groundless
#print axioms RHAtTheApex.RA_holds_where_L_fails_grounded
#print axioms RHAtTheApex.no_cure
#print axioms RHAtTheApex.cure_is_the_hypothesis
#print axioms RHAtTheApex.bridgeOfDecision
#print axioms RHAtTheApex.twoPoint_carrier_does_not_halt
#print axioms RHAtTheApex.onLine_carrier_halts
#print axioms RHAtTheApex.any_true_premise_is_exact
#print axioms RHAtTheApex.recursion_is_constant
#print axioms RHAtTheApex.masses_all_zero
#print axioms RHAtTheApex.contents_differ
#print axioms RHAtTheApex.prices_differ
#print axioms RHAtTheApex.adjudicating_anything_instances_existence

#eval RHAtTheApex.theReturn
#eval (RHAtTheApex.live true true, RHAtTheApex.live true false, RHAtTheApex.live false true)
#eval RHAtTheApex.landauer_yJ_300K 1
