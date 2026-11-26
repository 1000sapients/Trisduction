import Mathlib.Data.Set.Card
import Mathlib.Data.Finset.Card
import Mathlib.Data.Finset.Image
import Mathlib.Logic.Function.Iterate
import Mathlib.Tactic.Common

/-! # GENERALIZED QUANTIZATION, FORCED · SPHYS_Quantization_Forced_CC.lean (edition 1.0.0, 26 November 2026)

RATIONALE. A seat is a set with a fold, an involution, and a registration the fold keeps. A configuration on a seat
  has three axes: its existents, its form (closure under the fold) and its witness (no two existents share a
  registration). This file proves what the three axes make of the members of a configuration: each is one point,
  none is two, and they are counted by their registrations. It proves the complement: off the line an existent is
  two on one registration. And it reads both on two folds of physics, the particle map and the time mirror.

DESIGN. Part I the seat and the atoms. Part II the count. Part III the pair off the line, and the dichotomy.
  Part IV the vacant seat. Part V recording, one step. Part VI the particle map with gravity's reading. Part VII
  the time mirror with the level. Part VIII one term.

WHAT QUANTIZED MEANS HERE. A configuration is quantized by a registration when the registration is one-to-one on
  it. Nothing else is meant: no commutation relation, no constant, and no claim that the values of a registration
  are isolated from one another.

RISK. Parts VI and VII use a model of a particle with four additive charges and an energy with a frequency and a
  rate, all integers. A charge the model does not carry (a flavour) is outside it.

NON-NEGOTIABLE. No theorem takes a count, a discreteness or a bit as a premise. No axiom is declared and no proof
  is deferred. Every cone is pinned at the end of the file. -/

set_option autoImplicit false
namespace SPHYS.Quantization

/-! ## Part I · the seat and the atoms -/

/-- A SEAT: a set with a fold, an involution, and a registration the fold keeps. -/
structure Seat (X Y : Type) where
  fold : X → X
  involutive : ∀ a, fold (fold a) = a
  reg : X → Y
  keeps : ∀ a, reg (fold a) = reg a

section General
variable {X Y : Type} (σ : Seat X Y)

/-- FORM: the configuration is closed under the fold. -/
def Folded (S : X → Prop) : Prop := ∀ a, S a → S (σ.fold a)
/-- WITNESS: no two existents share a registration. -/
def Witnessed (S : X → Prop) : Prop := ∀ a b, S a → S b → σ.reg a = σ.reg b → a = b
/-- ON THE LINE: every existent is fixed by the fold. -/
def AllFixed (S : X → Prop) : Prop := ∀ a, S a → σ.fold a = a
/-- QUANTIZED BY THE REGISTRATION: the registration is one-to-one on the configuration. -/
def Quantized (S : X → Prop) : Prop := Set.InjOn σ.reg {a | S a}

/-- Quantized is the witness: the two are one proposition. -/
theorem quantized_iff_witnessed (S : X → Prop) : Quantized σ S ↔ Witnessed σ S :=
  ⟨fun h _ _ ha hb e => h ha hb e, fun w _ ha _ hb e => w _ _ ha hb e⟩

/-- THE TRIAXIAL THEOREM. A folded and witnessed configuration lies on the line. -/
theorem the_triaxial_theorem (S : X → Prop) (form : Folded σ S) (witness : Witnessed σ S) : AllFixed σ S :=
  fun a ha => witness (σ.fold a) a (form a ha) ha (σ.keeps a)

/-- THE EXISTENTS ARE ATOMS. In a folded and witnessed configuration: (I) each existent is one point, its own
    partner; (II) two existents are one exactly when their registrations are one; (III) the configuration is
    quantized by the registration. -/
theorem the_existents_are_atoms (S : X → Prop) (form : Folded σ S) (witness : Witnessed σ S) :
    (∀ a, S a → σ.fold a = a) ∧
    (∀ a b, S a → S b → (a = b ↔ σ.reg a = σ.reg b)) ∧
    Quantized σ S :=
  ⟨the_triaxial_theorem σ S form witness,
   fun a b ha hb => ⟨fun h => h ▸ rfl, witness a b ha hb⟩,
   (quantized_iff_witnessed σ S).mpr witness⟩

/-! ## Part II · the count -/

/-- THE COUNT IS THE COUNT OF REGISTRATIONS. A witnessed configuration has as many registrations as existents. -/
theorem the_count_is_the_count_of_registrations (S : X → Prop) (witness : Witnessed σ S) :
    (σ.reg '' {a | S a}).ncard = {a | S a}.ncard :=
  Set.ncard_image_of_injOn ((quantized_iff_witnessed σ S).mpr witness)

/-- THE COUNT, ON A FINITE LIST. Finitely many existents of a witnessed configuration have that many
    registrations: n existents, n registrations, for every whole number n. -/
theorem finitely_many_existents_have_that_many_registrations [DecidableEq Y] (S : X → Prop)
    (witness : Witnessed σ S) (s : Finset X) (hs : ∀ a ∈ s, S a) : (s.image σ.reg).card = s.card :=
  Finset.card_image_of_injOn (fun a ha b hb e => witness a b (hs a ha) (hs b hb) e)

/-! ## Part III · off the line: the pair, and the dichotomy -/

/-- OFF THE LINE AN EXISTENT IS TWO. In a folded configuration, an existent the fold moves has its partner in the
    configuration, the two are two, and they hold one registration. -/
theorem off_the_line_an_existent_is_two (S : X → Prop) (form : Folded σ S) (a : X) (ha : S a)
    (off : σ.fold a ≠ a) : S (σ.fold a) ∧ σ.fold a ≠ a ∧ σ.reg (σ.fold a) = σ.reg a :=
  ⟨form a ha, off, σ.keeps a⟩

/-- The orbit of a point has one registration. -/
theorem the_orbit_has_one_registration (a : X) : (σ.reg '' ({a, σ.fold a} : Set X)).ncard = 1 := by
  have e : σ.reg '' ({a, σ.fold a} : Set X) = {σ.reg a} := by
    rw [Set.image_pair, σ.keeps a, Set.pair_eq_singleton]
  rw [e, Set.ncard_singleton]

/-- On the line the orbit is one point: the registration is held whole. -/
theorem on_the_line_the_orbit_is_one_point (a : X) (on : σ.fold a = a) : ({a, σ.fold a} : Set X).ncard = 1 := by
  rw [on, Set.pair_eq_singleton, Set.ncard_singleton]

/-- Off the line the orbit is two points: the registration is held by halves. -/
theorem off_the_line_the_orbit_is_two_points (a : X) (off : σ.fold a ≠ a) :
    ({a, σ.fold a} : Set X).ncard = 2 :=
  Set.ncard_pair (Ne.symm off)

/-- WHOLE OR BY HALVES, AND NO THIRD. In a folded configuration every existent is its own partner, or it shares
    its registration with a second existent. -/
theorem whole_or_by_halves (S : X → Prop) (form : Folded σ S) (a : X) (ha : S a) :
    σ.fold a = a ∨ (S (σ.fold a) ∧ σ.fold a ≠ a ∧ σ.reg (σ.fold a) = σ.reg a) := by
  by_cases h : σ.fold a = a
  · exact Or.inl h
  · exact Or.inr (off_the_line_an_existent_is_two σ S form a ha h)

/-- THE WITNESS FAILS EXACTLY OFF THE LINE. On a seat whose registration tells apart the points of the line, a
    folded configuration is quantized exactly when it lies on the line. -/
theorem quantized_iff_on_the_line
    (faithful : ∀ a b, σ.fold a = a → σ.fold b = b → σ.reg a = σ.reg b → a = b)
    (S : X → Prop) (form : Folded σ S) : Quantized σ S ↔ AllFixed σ S :=
  ⟨fun q => the_triaxial_theorem σ S form ((quantized_iff_witnessed σ S).mp q),
   fun fx => (quantized_iff_witnessed σ S).mpr (fun a b ha hb e => faithful a b (fx a ha) (fx b hb) e)⟩

/-- ONE EXISTENT OFF THE LINE ENDS THE COUNT. A folded configuration with an existent the fold moves is not
    quantized by the registration. -/
theorem one_existent_off_the_line_ends_the_count (S : X → Prop) (form : Folded σ S) (a : X) (ha : S a)
    (off : σ.fold a ≠ a) : ¬ Quantized σ S :=
  fun q => off (the_triaxial_theorem σ S form ((quantized_iff_witnessed σ S).mp q) a ha)

/-! ## Part IV · the vacant seat -/

/-- ON A VACANT SEAT A WITNESSED EXISTENT STANDS WITHOUT ITS PARTNER. Where the fold fixes no point, a quantized
    configuration holds no existent together with its image under the fold. Form is not asked. -/
theorem on_a_vacant_seat_a_witnessed_existent_stands_alone (vacant : ∀ a, σ.fold a ≠ a) (S : X → Prop)
    (witness : Witnessed σ S) : ∀ a, S a → ¬ S (σ.fold a) :=
  fun a ha hfa => vacant a (witness (σ.fold a) a hfa ha (σ.keeps a))

/-- On a vacant seat form and the count exclude each other wherever there is an existent. -/
theorem on_a_vacant_seat_form_and_count_exclude (vacant : ∀ a, σ.fold a ≠ a) (S : X → Prop)
    (form : Folded σ S) (witness : Witnessed σ S) : ∀ a, ¬ S a :=
  fun a ha => vacant a (the_triaxial_theorem σ S form witness a ha)

end General

/-! ## Part V · recording, one step -/

section Recording
variable {X : Type} (σ : Seat X X)

/-- RECORDING IS ONE STEP. Where registering twice is registering once, the record of the record is the record,
    and every further recording returns it. -/
theorem recording_is_one_step (idem : ∀ a, σ.reg (σ.reg a) = σ.reg a) (S : Set X) :
    σ.reg '' (σ.reg '' S) = σ.reg '' S ∧ ∀ n : Nat, (Set.image σ.reg)^[n + 1] S = σ.reg '' S := by
  have h1 : σ.reg '' (σ.reg '' S) = σ.reg '' S := by
    ext q
    constructor
    · rintro ⟨p, ⟨r, hr, rfl⟩, rfl⟩
      exact ⟨r, hr, (idem r).symm⟩
    · rintro ⟨r, hr, rfl⟩
      exact ⟨σ.reg r, ⟨r, hr, rfl⟩, idem r⟩
  refine ⟨h1, fun n => ?_⟩
  induction n with
  | zero => rfl
  | succ n ih => rw [Function.iterate_succ_apply', ih, h1]

/-- THE PRIOR IS THE POSTERIOR EXACTLY ON THE LINE. Where the registration returns a point exactly when the fold
    does, a configuration is its own record exactly when it lies on the line. -/
theorem self_recorded_iff_on_the_line (idem : ∀ a, σ.reg (σ.reg a) = σ.reg a)
    (lands : ∀ a, σ.reg a = a ↔ σ.fold a = a) (S : Set X) :
    σ.reg '' S = S ↔ ∀ a ∈ S, σ.fold a = a := by
  constructor
  · intro h a ha
    have ha' : a ∈ σ.reg '' S := by rw [h]; exact ha
    obtain ⟨p, _, rfl⟩ := ha'
    exact (lands _).mp (idem p)
  · intro fx
    ext q
    constructor
    · rintro ⟨p, hp, rfl⟩
      rw [(lands p).mpr (fx p hp)]; exact hp
    · intro hq
      exact ⟨q, hq, (lands q).mpr (fx q hq)⟩

end Recording

/-! ## Part VI · the particle map, with gravity's reading as the registration -/

/-- An energy: a frequency and a rate of decay. -/
structure Energy where
  freq : Int
  rate : Int
  deriving DecidableEq

/-- A particle: electric charge times three, colour, baryon number times three, lepton number, and an energy. -/
structure Particle where
  q3 : Int
  colour : Int
  b3 : Int
  lepton : Int
  energy : Energy
  deriving DecidableEq

/-- The particle map: every additive charge reversed, the energy kept. -/
def bar (c : Particle) : Particle := ⟨-c.q3, -c.colour, -c.b3, -c.lepton, c.energy⟩
/-- Neutral: every additive charge zero. -/
def Neutral (c : Particle) : Prop := c.q3 = 0 ∧ c.colour = 0 ∧ c.b3 = 0 ∧ c.lepton = 0
/-- Gravity's reading: the frequency of the energy, and nothing of the charges. -/
def grav (c : Particle) : Int := c.energy.freq

theorem bar_involutive (c : Particle) : bar (bar c) = c := by
  obtain ⟨q, k, b, l, E⟩ := c
  simp [bar]

theorem bar_fixed_iff_neutral (c : Particle) : bar c = c ↔ Neutral c := by
  obtain ⟨q, k, b, l, E⟩ := c
  simp only [bar, Neutral, Particle.mk.injEq, and_true]
  constructor
  · rintro ⟨h1, h2, h3, h4⟩; exact ⟨by omega, by omega, by omega, by omega⟩
  · rintro ⟨h1, h2, h3, h4⟩; exact ⟨by omega, by omega, by omega, by omega⟩

/-- THE SEAT OF THE PARTICLE MAP: the fold is the particle map, the registration is gravity's reading. Gravity's
    reading is a registration because the particle map keeps the energy. -/
def particleSeat : Seat Particle Int := ⟨bar, bar_involutive, grav, fun _ => rfl⟩

/-- GRAVITY COUNTS THE NEUTRAL. In a configuration of particles closed under the particle map, in which gravity
    reads no two members alike, every member is neutral, its own antiparticle, and the members are counted by
    gravity's reading. -/
theorem gravity_counts_the_neutral (S : Particle → Prop) (form : Folded particleSeat S)
    (witness : Witnessed particleSeat S) :
    (∀ c, S c → Neutral c) ∧ (∀ c d, S c → S d → (c = d ↔ grav c = grav d)) ∧ Quantized particleSeat S :=
  ⟨fun c hc => (bar_fixed_iff_neutral c).mp (the_triaxial_theorem particleSeat S form witness c hc),
   (the_existents_are_atoms particleSeat S form witness).2.1,
   (the_existents_are_atoms particleSeat S form witness).2.2⟩

/-- A CHARGED PARTICLE IS TWO ON ONE READING. A particle that is not neutral and its antiparticle are two
    existents, and gravity reads them alike. -/
theorem a_charged_particle_is_two_on_one_reading (c : Particle) (h : ¬ Neutral c) :
    bar c ≠ c ∧ grav (bar c) = grav c :=
  ⟨fun e => h ((bar_fixed_iff_neutral c).mp e), rfl⟩

/-- MATTER WITH ITS ANTIMATTER IS NOT COUNTED BY GRAVITY. A configuration closed under the particle map that holds
    one charged particle is not quantized by gravity's reading. -/
theorem matter_with_antimatter_is_not_counted_by_gravity (S : Particle → Prop) (form : Folded particleSeat S)
    (c : Particle) (hc : S c) (h : ¬ Neutral c) : ¬ Quantized particleSeat S :=
  one_existent_off_the_line_ends_the_count particleSeat S form c hc
    (fun e => h ((bar_fixed_iff_neutral c).mp e))

/-- GRAVITY DOES NOT TELL ALL THE NEUTRAL APART (audit of 26 November 2026). The converse of
    `gravity_counts_the_neutral` fails in the model: two neutral particles of one frequency and different rates
    are two, and gravity reads them alike. So the particle seat does not meet the hypothesis of
    `quantized_iff_on_the_line`, and of gravity the paper claims one direction only.
    NON-NEGOTIABLE: this theorem stays, so the text cannot say "exactly when" of gravity. -/
theorem gravity_does_not_tell_all_the_neutral_apart :
    ∃ c d : Particle, Neutral c ∧ Neutral d ∧ c ≠ d ∧ grav c = grav d :=
  ⟨⟨0, 0, 0, 0, ⟨0, 0⟩⟩, ⟨0, 0, 0, 0, ⟨0, 1⟩⟩, ⟨rfl, rfl, rfl, rfl⟩, ⟨rfl, rfl, rfl, rfl⟩, by decide, rfl⟩

/-- The full label of a particle is not a registration of the particle map: there is a particle whose label the
    map changes. Only what the fold keeps can count. -/
theorem the_charges_are_not_a_registration : ∃ c : Particle, (bar c).q3 ≠ c.q3 :=
  ⟨⟨1, 0, 0, 0, ⟨0, 0⟩⟩, by decide⟩

/-! ## Part VII · the time mirror, with the frequency as the registration -/

/-- The time mirror of a particle: the rate of its energy reversed, everything else kept. -/
def tmirror (c : Particle) : Particle := ⟨c.q3, c.colour, c.b3, c.lepton, ⟨c.energy.freq, -c.energy.rate⟩⟩
/-- Stationary: the rate is zero. -/
def Stationary (c : Particle) : Prop := c.energy.rate = 0
/-- The level of a particle: its charges and its frequency, without the rate. -/
def level (c : Particle) : Int × Int × Int × Int × Int := (c.q3, c.colour, c.b3, c.lepton, c.energy.freq)

theorem tmirror_involutive (c : Particle) : tmirror (tmirror c) = c := by
  obtain ⟨q, k, b, l, ⟨f, r⟩⟩ := c
  simp [tmirror]

theorem tmirror_fixed_iff_stationary (c : Particle) : tmirror c = c ↔ Stationary c := by
  obtain ⟨q, k, b, l, ⟨f, r⟩⟩ := c
  simp only [tmirror, Stationary, Particle.mk.injEq, Energy.mk.injEq, true_and]
  constructor
  · intro h; omega
  · intro h; omega

/-- THE SEAT OF THE TIME MIRROR: the fold reverses the rate, the registration is the level. -/
def timeSeat : Seat Particle (Int × Int × Int × Int × Int) := ⟨tmirror, tmirror_involutive, level, fun _ => rfl⟩

/-- The level tells the stationary apart: two stationary particles of one level are one particle. -/
theorem the_level_tells_the_stationary_apart (c d : Particle) (hc : timeSeat.fold c = c)
    (hd : timeSeat.fold d = d) (e : timeSeat.reg c = timeSeat.reg d) : c = d := by
  have sc : Stationary c := (tmirror_fixed_iff_stationary c).mp hc
  have sd : Stationary d := (tmirror_fixed_iff_stationary d).mp hd
  obtain ⟨q, k, b, l, ⟨f, r⟩⟩ := c
  obtain ⟨q', k', b', l', ⟨f', r'⟩⟩ := d
  simp only [Stationary] at sc sd
  simp only [timeSeat, level, Prod.mk.injEq] at e
  obtain ⟨e1, e2, e3, e4, e5⟩ := e
  subst e1 e2 e3 e4 e5 sc sd
  rfl

/-- THE LEVELS ARE THE STATIONARY. A configuration closed under the time mirror is quantized by its levels
    exactly when every member is stationary. -/
theorem the_levels_are_the_stationary (S : Particle → Prop) (form : Folded timeSeat S) :
    Quantized timeSeat S ↔ ∀ c, S c → Stationary c :=
  (quantized_iff_on_the_line timeSeat the_level_tells_the_stationary_apart S form).trans
    ⟨fun fx c hc => (tmirror_fixed_iff_stationary c).mp (fx c hc),
     fun st c hc => (tmirror_fixed_iff_stationary c).mpr (st c hc)⟩

/-- A DECAYING MODE IS TWO ON ONE LEVEL. A particle whose rate is not zero and its time mirror are two existents
    on one level. -/
theorem a_decaying_mode_is_two_on_one_level (c : Particle) (h : ¬ Stationary c) :
    tmirror c ≠ c ∧ level (tmirror c) = level c :=
  ⟨fun e => h ((tmirror_fixed_iff_stationary c).mp e), rfl⟩

/-! ## Part VIII · one term -/

/-- GENERALIZED QUANTIZATION. One term, nothing before the colon. On every seat and for every configuration:
    (I) form and witness make every existent one point, on the line; (II) a quantized configuration has as many
    registrations as existents; (III) in a folded configuration every existent holds its registration whole or by
    halves; (IV) in a folded configuration one existent off the line ends the count. On the two folds of physics:
    (V) in a folded configuration what gravity counts is neutral, and gravity reads a charged pair as one;
    (VI) a configuration folded under the time mirror is quantized by its levels exactly when every member is
    stationary, and a decaying mode is two on one level. -/
theorem generalized_quantization :
    (∀ (X Y : Type) (σ : Seat X Y) (S : X → Prop), Folded σ S → Witnessed σ S →
      (∀ a, S a → σ.fold a = a) ∧ Quantized σ S) ∧
    (∀ (X Y : Type) (σ : Seat X Y) (S : X → Prop), Witnessed σ S →
      (σ.reg '' {a | S a}).ncard = {a | S a}.ncard) ∧
    (∀ (X Y : Type) (σ : Seat X Y) (S : X → Prop), Folded σ S → ∀ a, S a →
      σ.fold a = a ∨ (S (σ.fold a) ∧ σ.fold a ≠ a ∧ σ.reg (σ.fold a) = σ.reg a)) ∧
    (∀ (X Y : Type) (σ : Seat X Y) (S : X → Prop), Folded σ S → ∀ a, S a → σ.fold a ≠ a → ¬ Quantized σ S) ∧
    ((∀ S : Particle → Prop, Folded particleSeat S → Witnessed particleSeat S → ∀ c, S c → Neutral c) ∧
      (∀ c : Particle, ¬ Neutral c → bar c ≠ c ∧ grav (bar c) = grav c)) ∧
    ((∀ S : Particle → Prop, Folded timeSeat S → (Quantized timeSeat S ↔ ∀ c, S c → Stationary c)) ∧
      (∀ c : Particle, ¬ Stationary c → tmirror c ≠ c ∧ level (tmirror c) = level c)) :=
  ⟨fun _ _ σ S f w => ⟨the_triaxial_theorem σ S f w, (the_existents_are_atoms σ S f w).2.2⟩,
   fun _ _ σ S w => the_count_is_the_count_of_registrations σ S w,
   fun _ _ σ S f a ha => whole_or_by_halves σ S f a ha,
   fun _ _ σ S f a ha off => one_existent_off_the_line_ends_the_count σ S f a ha off,
   ⟨fun S f w => (gravity_counts_the_neutral S f w).1, a_charged_particle_is_two_on_one_reading⟩,
   ⟨the_levels_are_the_stationary, a_decaying_mode_is_two_on_one_level⟩⟩

end SPHYS.Quantization

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Quantization.quantized_iff_witnessed' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Quantization.quantized_iff_witnessed
/-- info: 'SPHYS.Quantization.the_triaxial_theorem' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Quantization.the_triaxial_theorem
/-- info: 'SPHYS.Quantization.the_existents_are_atoms' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Quantization.the_existents_are_atoms
/--
info: 'SPHYS.Quantization.the_count_is_the_count_of_registrations' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Quantization.the_count_is_the_count_of_registrations
/--
info: 'SPHYS.Quantization.finitely_many_existents_have_that_many_registrations' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Quantization.finitely_many_existents_have_that_many_registrations
/-- info: 'SPHYS.Quantization.off_the_line_an_existent_is_two' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Quantization.off_the_line_an_existent_is_two
/--
info: 'SPHYS.Quantization.the_orbit_has_one_registration' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Quantization.the_orbit_has_one_registration
/--
info: 'SPHYS.Quantization.on_the_line_the_orbit_is_one_point' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Quantization.on_the_line_the_orbit_is_one_point
/--
info: 'SPHYS.Quantization.off_the_line_the_orbit_is_two_points' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Quantization.off_the_line_the_orbit_is_two_points
/-- info: 'SPHYS.Quantization.whole_or_by_halves' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quantization.whole_or_by_halves
/-- info: 'SPHYS.Quantization.quantized_iff_on_the_line' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Quantization.quantized_iff_on_the_line
/-- info: 'SPHYS.Quantization.one_existent_off_the_line_ends_the_count' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Quantization.one_existent_off_the_line_ends_the_count
/-- info: 'SPHYS.Quantization.on_a_vacant_seat_a_witnessed_existent_stands_alone' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Quantization.on_a_vacant_seat_a_witnessed_existent_stands_alone
/-- info: 'SPHYS.Quantization.on_a_vacant_seat_form_and_count_exclude' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Quantization.on_a_vacant_seat_form_and_count_exclude
/-- info: 'SPHYS.Quantization.recording_is_one_step' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quantization.recording_is_one_step
/-- info: 'SPHYS.Quantization.self_recorded_iff_on_the_line' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quantization.self_recorded_iff_on_the_line
/-- info: 'SPHYS.Quantization.bar_involutive' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Quantization.bar_involutive
/-- info: 'SPHYS.Quantization.bar_fixed_iff_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quantization.bar_fixed_iff_neutral
/-- info: 'SPHYS.Quantization.gravity_counts_the_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quantization.gravity_counts_the_neutral
/-- info: 'SPHYS.Quantization.a_charged_particle_is_two_on_one_reading' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quantization.a_charged_particle_is_two_on_one_reading
/--
info: 'SPHYS.Quantization.matter_with_antimatter_is_not_counted_by_gravity' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Quantization.matter_with_antimatter_is_not_counted_by_gravity
/-- info: 'SPHYS.Quantization.gravity_does_not_tell_all_the_neutral_apart' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Quantization.gravity_does_not_tell_all_the_neutral_apart
/-- info: 'SPHYS.Quantization.the_charges_are_not_a_registration' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Quantization.the_charges_are_not_a_registration
/-- info: 'SPHYS.Quantization.tmirror_involutive' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Quantization.tmirror_involutive
/-- info: 'SPHYS.Quantization.tmirror_fixed_iff_stationary' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quantization.tmirror_fixed_iff_stationary
/-- info: 'SPHYS.Quantization.the_level_tells_the_stationary_apart' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quantization.the_level_tells_the_stationary_apart
/-- info: 'SPHYS.Quantization.the_levels_are_the_stationary' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quantization.the_levels_are_the_stationary
/-- info: 'SPHYS.Quantization.a_decaying_mode_is_two_on_one_level' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quantization.a_decaying_mode_is_two_on_one_level
/-- info: 'SPHYS.Quantization.generalized_quantization' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quantization.generalized_quantization
