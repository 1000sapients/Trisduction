/-!
# Willard_SelfGrounding.lean · Gödel and Willard under RAM's strata, and the two unconditionals
Core Lean 4.19.0 · no library · no sorry · no axiom declaration.

An ABSTRACT model, not Willard's IS(A) theories formalized: a theory is reduced to sentences,
a negation, a provability predicate, a truth predicate for the intended model, and a
consistency sentence. That is enough to state the match and to find where it breaks.
-/
namespace WillardSG

/-- The Codex's self-grounding structure (Part XII of RA_Li_Bridge.lean): acts occur, and every
    act instances R. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

/-- An abstract theory. `True_` is truth in the intended model; `neg` is read truthfully. -/
structure Theory where
  Sent     : Type
  neg      : Sent → Sent
  Prov     : Sent → Prop
  True_    : Sent → Prop
  Con      : Sent
  neg_true : ∀ s, True_ (neg s) ↔ ¬ True_ s

def Consistent (T : Theory) : Prop := ¬ ∃ s, T.Prov s ∧ T.Prov (T.neg s)
def Sound (T : Theory) : Prop := ∀ s, T.Prov s → T.True_ s

/-- Willard-style self-verification, abstractly: the theory proves its own consistency
    sentence, and that sentence means consistency in the intended model. -/
structure SelfVerifying (T : Theory) : Prop where
  proves_con : T.Prov T.Con
  con_means  : T.True_ T.Con ↔ Consistent T

-- W1.
/-- THE MATCH, ON THE ASSENT BRANCH. A sound self-verifying theory is a case of the Codex's
    self-grounding structure: its derivations of Con are acts, and each instances Con's truth. -/
def assent_grounds (T : Theory) (hS : Sound T) (v : SelfVerifying T) :
    SelfGrounding (T.True_ T.Con) :=
  ⟨{ _u : Unit // T.Prov T.Con }, ⟨(), v.proves_con⟩, fun a => hS T.Con a.2⟩

-- W2.
/-- Soundness is load-bearing. An unsound theory can be self-verifying, proving its
    consistency sentence while being inconsistent, and then nothing grounds Con. -/
def liar : Theory :=
  ⟨Bool, fun b => !b, fun _ => True, fun b => b = true, false,
   fun b => by cases b <;> simp⟩

theorem liar_self_verifying : SelfVerifying liar := by
  refine ⟨trivial, ?_⟩
  constructor
  · intro h; cases h
  · intro h; exact absurd ⟨true, trivial, trivial⟩ h

theorem liar_not_grounded : ¬ Nonempty (SelfGrounding (liar.True_ liar.Con)) :=
  fun ⟨g⟩ => Bool.noConfusion (g.instances g.anAct)

-- W3.
/-- THE BREAK, ON THE DENIAL BRANCH. In a sound self-verifying theory no act of denial exists:
    a derivation of ¬Con is impossible. The Codex's root is grounded by denial as well; here
    denial is not grounded, it is excluded. -/
theorem denial_excluded (T : Theory) (hS : Sound T) (v : SelfVerifying T) :
    ¬ T.Prov (T.neg T.Con) :=
  fun d => ((T.neg_true T.Con).mp (hS _ d)) (hS _ v.proves_con)

-- W4.
/-- The Codex's root, by contrast, is grounded by an act of denial that exists. -/
def RA : Prop := (0 : Int) < 1
def raSelfGrounding : SelfGrounding RA := ⟨Unit, (), fun _ => show (0 : Int) < 1 by decide⟩
inductive Adjudication | assent | denial
def raGroundedByDenial : SelfGrounding RA :=
  ⟨Adjudication, Adjudication.denial, fun _ => show (0 : Int) < 1 by decide⟩

-- W5.
/-- THE VERDICT, IN ONE THEOREM. Willard-style self-verification is a case of the Codex's
    self-grounding on the assent branch, conditional on soundness; without soundness it is not
    grounded at all; and on the denial branch it differs in kind, excluding the denial where
    the Codex's root is grounded by it. -/
theorem partial_subsumption :
    (∀ T : Theory, Sound T → SelfVerifying T → Nonempty (SelfGrounding (T.True_ T.Con))) ∧
    (SelfVerifying liar ∧ ¬ Nonempty (SelfGrounding (liar.True_ liar.Con))) ∧
    (∀ T : Theory, Sound T → SelfVerifying T → ¬ T.Prov (T.neg T.Con)) ∧
    Nonempty (SelfGrounding RA) :=
  ⟨fun T hS v => ⟨assent_grounds T hS v⟩, ⟨liar_self_verifying, liar_not_grounded⟩,
   denial_excluded, ⟨raGroundedByDenial⟩⟩


/-! ## PART II · With the Mother Codex's strata (Master Codex Ch. 5.2 to 5.3, 6.2, 7.5).
RAM: formal being is grounding, L1m; provability is the ladder, L2m; computation a rung, L3m.
The Codex states the bridge L2m → L1m as "theorem-grade conditional on soundness, the soundness
premise carried openly" (5.3). The limitative theorems are facts about the ladder's reach (5.2, 6.x). -/

def L1 (T : Theory) (s : T.Sent) : Prop := T.True_ s     -- grounded, the imprint on the Ground
def L2 (T : Theory) (s : T.Sent) : Prop := T.Prov s      -- provable, the ladder

/-- The Codex's soundness premise, carried openly as a named premise (Master Codex 5.3). -/
structure SoundnessPremise (T : Theory) : Prop where
  sound : Sound T

/-- A Gödel-type theory, abstractly: consistent, and its ladder does not reach its own
    consistency sentence. (Gödel's theorem is the reason such theories exist; it is not proved
    here, it is the field.) -/
structure GoedelType (T : Theory) : Prop where
  consistent : Consistent T
  unreached  : ¬ T.Prov T.Con

-- W6.
/-- RAM places Willard. Under the soundness premise, a self-verifying theory's consistency
    sentence is on the ladder and on the Ground: in L2m ∩ L1m. -/
theorem ram_places_willard (T : Theory) (p : SoundnessPremise T) (v : SelfVerifying T) :
    L2 T T.Con ∧ L1 T T.Con :=
  ⟨v.proves_con, p.sound _ v.proves_con⟩

-- W7.
/-- RAM places Gödel. A consistent theory whose ladder does not reach Con has Con grounded and
    unproved: in L1m minus L2m, the Codex's incompleteness region (6.x, 7.5). -/
theorem ram_places_goedel (T : Theory) (g : GoedelType T)
    (means : T.True_ T.Con ↔ Consistent T) :
    L1 T T.Con ∧ ¬ L2 T T.Con :=
  ⟨means.mpr g.consistent, g.unreached⟩

-- W8.
/-- The two are one kind of fact: where the ladder reaches, not what the Ground holds. In both,
    Con is grounded; they differ only in L2m. -/
theorem willard_and_goedel_differ_only_on_the_ladder
    (T U : Theory) (p : SoundnessPremise T) (v : SelfVerifying T)
    (g : GoedelType U) (means : U.True_ U.Con ↔ Consistent U) :
    (L1 T T.Con ∧ L1 U U.Con) ∧ (L2 T T.Con ∧ ¬ L2 U U.Con) :=
  ⟨⟨(ram_places_willard T p v).2, (ram_places_goedel U g means).1⟩,
   ⟨v.proves_con, g.unreached⟩⟩

-- W9.
/-- The denial branch, read in the Codex's two registers. In any theory, an act of denial is a
    deed, and the deed instances the root, whatever the theory's ladder does with Con. The
    denial is absorbed by RA, not by Con: root and object are parted (prior paper, Theorem G). -/
def denial_grounds_root (_T : Theory) : SelfGrounding RA := raGroundedByDenial

-- W10.
/-- THE FULL PICTURE, IN ONE THEOREM. Under RAM's strata with the soundness premise carried
    openly: Willard's self-verification is a case of the Codex's self-grounding (assent branch)
    and sits in L2m ∩ L1m; Gödel-type theories sit in L1m minus L2m; both are reach facts of the
    ladder; the denial branch is absorbed by the root in every theory; and without the premise,
    self-verification grounds nothing (the liar). -/
theorem full_structural_subsumption :
    (∀ T : Theory, SoundnessPremise T → SelfVerifying T →
        Nonempty (SelfGrounding (T.True_ T.Con)) ∧ L2 T T.Con ∧ L1 T T.Con) ∧
    (∀ T : Theory, GoedelType T → (T.True_ T.Con ↔ Consistent T) → L1 T T.Con ∧ ¬ L2 T T.Con) ∧
    (∀ _T : Theory, Nonempty (SelfGrounding RA)) ∧
    (SelfVerifying liar ∧ ¬ Nonempty (SelfGrounding (liar.True_ liar.Con))) :=
  ⟨fun T p v => ⟨⟨assent_grounds T p.sound v⟩, ram_places_willard T p v⟩,
   fun T g m => ram_places_goedel T g m,
   fun T => ⟨denial_grounds_root T⟩,
   ⟨liar_self_verifying, liar_not_grounded⟩⟩


/-! ## PART III · The two unconditionals.
Every result above carries a premise: soundness, self-verification, or Gödel type. Two kinds of
statement carry none. A formal truth is unconditional BELOW, inside the system: it assumes
nothing beyond the logic's rules. RA is unconditional AT THE ROOT, underneath every system: its
grounding rests on no premise, because every act whatever instances it, including the act of
checking a proof and the act of denying RA. -/

-- W11.
/-- Unconditional below: a formal truth with no hypothesis, relying on the logic alone. -/
theorem below_unconditional : ∀ b : Bool, (!(!b)) = b := by
  intro b; cases b <;> rfl

-- W12.
/-- Unconditional at the root: for ANY type of act and ANY act of it, RA is grounded. No
    hypothesis, no premise, no theory: the act alone. Shown at the constructed domain; the
    universal extension is the posit the Empty Throne leaves unfilled. -/
def root_unconditional (Act : Type) (a : Act) : SelfGrounding RA :=
  ⟨Act, a, fun _ => show (0 : Int) < 1 by decide⟩

-- W13.
/-- Checking a proof is an act. Whatever the theory, the act of verifying any of its sentences
    grounds RA; the root underwrites the ladder, and not the reverse. -/
def checking_grounds_root (T : Theory) (s : T.Sent) (_d : T.Prov s) : SelfGrounding RA :=
  root_unconditional (PLift (T.Prov s)) ⟨_d⟩

-- W14.
/-- THE TWO UNCONDITIONALS, IN ONE THEOREM. A formal truth holds with no premise below; RA is
    grounded with no premise at the root, by any act, including the act of checking the other. -/
theorem two_unconditionals :
    (∀ b : Bool, (!(!b)) = b) ∧
    (∀ (Act : Type) (_a : Act), Nonempty (SelfGrounding RA)) ∧
    (∀ (T : Theory) (s : T.Sent), T.Prov s → Nonempty (SelfGrounding RA)) :=
  ⟨below_unconditional, fun Act a => ⟨root_unconditional Act a⟩,
   fun T s d => ⟨checking_grounds_root T s d⟩⟩

end WillardSG

#print axioms WillardSG.assent_grounds
#print axioms WillardSG.liar_self_verifying
#print axioms WillardSG.liar_not_grounded
#print axioms WillardSG.denial_excluded
#print axioms WillardSG.partial_subsumption
#print axioms WillardSG.ram_places_willard
#print axioms WillardSG.ram_places_goedel
#print axioms WillardSG.willard_and_goedel_differ_only_on_the_ladder
#print axioms WillardSG.full_structural_subsumption
#print axioms WillardSG.below_unconditional
#print axioms WillardSG.root_unconditional
#print axioms WillardSG.checking_grounds_root
#print axioms WillardSG.two_unconditionals
