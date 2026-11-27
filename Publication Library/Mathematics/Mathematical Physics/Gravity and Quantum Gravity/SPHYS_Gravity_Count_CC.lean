/-! # SPHYS_Gravity_Count_CC.lean · WHAT GRAVITY COUNTS, AND WHAT NO READING OF ITS KIND CAN (26 November 2026, _CC)

  RATIONALE. Edition 4.0.0 proves, on the premise that gravity reads the record, that the weight is even under the
    particle map: antimatter weighs as matter. In this file that evenness is the definition of the weight. This
    file proves what that evenness costs and what it buys, for gravity's reading and for every reading of the same
    kind, whatever it is and whenever it is proposed. The statements quantify over all readings, so a reading not
    yet written down is already inside them.
  DESIGN. Part I is general: any set, any map `φ` of it, any reading `r` that `φ` keeps. A reading COUNTS a
    configuration when it gives no two members the same value (`Counts`). That is the one sense in which this file
    speaks of counting, and the paper calls a configuration quantized by a reading in exactly this sense.
    Part II is the particle: four additive charges and an energy, the particle map `bar`, the weight `grav`.
    Part III binds every statement in one term.
  STANDING. Proved here: a reading the fold keeps counts a closed configuration only if every member is fixed by
    the fold; nothing computed from such a reading counts more than it does; a reading that counts a pair the fold
    exchanges is not kept by the fold. For particles: every reading the particle map keeps, gravity's among them,
    counts a closed configuration only if every member is neutral; nothing computed from the weight tells a charged
    particle from its antiparticle; a reading that does tell them apart reads a charge. The converse on gravity
    is not claimed: the weight does not tell all the neutral apart, and that is proved here too.
  WHAT IS NOT CLAIMED. No commutation relation, no constant and no operator enters. Nothing here says that the
    gravitational field is or is not quantized in the canonical sense, and nothing here bears on any particular
    proposal for doing so beyond the statements above.
  RISK. The particle is a model: integer charges and an energy with an integer frequency and an integer rate. A
    charge that is not additive, or a particle map that does not reverse every charge, is outside it.
  NON-NEGOTIABLE. Core Lean, no import, no axiom declared, no `sorry`. No premise is placed before the colon of
    the binding term. Every cone is pinned at the end of the file, so a change of any cone fails the build. -/
namespace SPHYS.GravityCount

/-! ## PART I · ANY FOLD, ANY READING IT KEEPS -/
section General
variable {X Y : Type}

/-- A reading counts a configuration when it gives no two members the same value. -/
def Counts (r : X → Y) (S : X → Prop) : Prop := ∀ a b, S a → S b → r a = r b → a = b

/-- A KEPT READING COUNTS ONLY THE LINE. If a configuration is closed under the fold and a reading the fold keeps
    counts it, every member is fixed by the fold. -/
theorem a_kept_reading_counts_only_the_line (φ : X → X) (r : X → Y) (kept : ∀ a, r (φ a) = r a)
    (S : X → Prop) (form : ∀ a, S a → S (φ a)) (count : Counts r S) : ∀ a, S a → φ a = a :=
  fun a ha => count (φ a) a (form a ha) ha (kept a)

/-- ONE PAIR ENDS THE COUNT. In a configuration that holds a member and its image under the fold, the two being
    two, no reading the fold keeps counts the configuration. The configuration need not be closed: the pair alone
    is the hypothesis (audit of 26 November 2026, so the statement is the one the text makes). -/
theorem no_kept_reading_tells_a_pair_apart (φ : X → X) (r : X → Y) (kept : ∀ a, r (φ a) = r a)
    (S : X → Prop) (a : X) (ha : S a) (hfa : S (φ a)) (off : φ a ≠ a) : ¬ Counts r S :=
  fun count => off (count (φ a) a hfa ha (kept a))

/-- NOTHING COMPUTED FROM A READING COUNTS MORE THAN IT. If a function of a reading counts a configuration, the
    reading already counts it. -/
theorem nothing_computed_from_a_reading_counts_more {Z : Type} (r : X → Y) (f : Y → Z) (S : X → Prop)
    (count : Counts (fun a => f (r a)) S) : Counts r S :=
  fun a b ha hb h => count a b ha hb (congrArg f h)

/-- WHATEVER IS COMPUTED FROM A KEPT READING IS KEPT. -/
theorem what_is_computed_from_a_kept_reading_is_kept {Z : Type} (φ : X → X) (r : X → Y)
    (kept : ∀ a, r (φ a) = r a) (f : Y → Z) : ∀ a, f (r (φ a)) = f (r a) :=
  fun a => congrArg f (kept a)

/-- TO COUNT A PAIR A READING MUST SEE THE FOLD. If a reading counts a configuration that holds a member and its
    image under the fold, the two being two, the reading gives them different values. -/
theorem a_reading_that_counts_a_pair_is_not_kept (φ : X → X) (r : X → Y) (S : X → Prop)
    (count : Counts r S) (a : X) (ha : S a) (hfa : S (φ a)) (off : φ a ≠ a) : r (φ a) ≠ r a :=
  fun h => off (count (φ a) a hfa ha h)

end General

/-! ## PART II · THE PARTICLE, THE PARTICLE MAP AND THE WEIGHT -/

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
/-- Neutral: every charge is zero. -/
def Neutral (c : Particle) : Prop := c.q3 = 0 ∧ c.colour = 0 ∧ c.b3 = 0 ∧ c.lepton = 0
/-- The weight: gravity reads the frequency of the energy, and no charge and no rate. -/
def grav (c : Particle) : Int := c.energy.freq
/-- The charges, read together. -/
def charges (c : Particle) : Int × Int × Int × Int := (c.q3, c.colour, c.b3, c.lepton)

theorem bar_fixed_iff_neutral (c : Particle) : bar c = c ↔ Neutral c := by
  cases c with
  | mk q k b l E =>
    show (⟨-q, -k, -b, -l, E⟩ : Particle) = ⟨q, k, b, l, E⟩ ↔ (q = 0 ∧ k = 0 ∧ b = 0 ∧ l = 0)
    constructor
    · intro h
      have h1 : -q = q := congrArg Particle.q3 h
      have h2 : -k = k := congrArg Particle.colour h
      have h3 : -b = b := congrArg Particle.b3 h
      have h4 : -l = l := congrArg Particle.lepton h
      exact ⟨by omega, by omega, by omega, by omega⟩
    · intro h
      obtain ⟨h1, h2, h3, h4⟩ := h
      subst h1; subst h2; subst h3; subst h4
      rfl

/-- THE WEIGHT IS KEPT. Gravity reads a particle and its antiparticle alike. -/
theorem the_weight_is_kept (c : Particle) : grav (bar c) = grav c := rfl

/-- EVERY READING THE PARTICLE MAP KEEPS COUNTS ONLY THE NEUTRAL. Whatever the reading and whatever its values:
    if the particle map keeps it and it counts a configuration that holds the antiparticle of each member, every
    member is neutral. -/
theorem every_kept_reading_counts_only_the_neutral {Y : Type} (r : Particle → Y) (kept : ∀ c, r (bar c) = r c)
    (S : Particle → Prop) (form : ∀ c, S c → S (bar c)) (count : Counts r S) : ∀ c, S c → Neutral c :=
  fun c hc => (bar_fixed_iff_neutral c).mp (a_kept_reading_counts_only_the_line bar r kept S form count c hc)

/-- GRAVITY COUNTS ONLY THE NEUTRAL, in a configuration that holds the antiparticle of each member. -/
theorem gravity_counts_only_the_neutral (S : Particle → Prop) (form : ∀ c, S c → S (bar c))
    (count : Counts grav S) : ∀ c, S c → Neutral c :=
  every_kept_reading_counts_only_the_neutral grav the_weight_is_kept S form count

/-- NOTHING COMPUTED FROM THE WEIGHT TELLS A CHARGED PAIR APART. Whatever is computed from gravity's reading, by
    any function into any set of values, it does not count a configuration that holds one charged particle with
    its antiparticle. -/
theorem nothing_computed_from_the_weight_counts_a_charged_pair {Z : Type} (f : Int → Z) (S : Particle → Prop)
    (c : Particle) (hc : S c) (hb : S (bar c)) (charged : ¬ Neutral c) :
    ¬ Counts (fun d => f (grav d)) S :=
  no_kept_reading_tells_a_pair_apart bar (fun d => f (grav d))
    (what_is_computed_from_a_kept_reading_is_kept bar grav the_weight_is_kept f) S c hc hb
    (fun e => charged ((bar_fixed_iff_neutral c).mp e))

/-- TO COUNT MATTER WITH ITS ANTIMATTER A READING MUST READ WHAT GRAVITY DOES NOT. A reading that counts a
    configuration holding a charged particle with its antiparticle gives the two different values, so the
    particle map does not keep it. -/
theorem to_count_a_charged_pair_a_reading_must_see_the_particle_map {Y : Type} (r : Particle → Y)
    (S : Particle → Prop) (count : Counts r S) (c : Particle) (hc : S c) (hb : S (bar c))
    (charged : ¬ Neutral c) : r (bar c) ≠ r c :=
  a_reading_that_counts_a_pair_is_not_kept bar r S count c hc hb
    (fun e => charged ((bar_fixed_iff_neutral c).mp e))

/-- A READING OF THE ENERGY ALONE IS KEPT. Whatever is computed from the energy of a particle, by any function into
    any set, the particle map keeps it. -/
theorem a_reading_of_the_energy_alone_is_kept {Y : Type} (g : Energy → Y) (c : Particle) :
    g (bar c).energy = g c.energy := rfl

/-- TO TELL A PARTICLE FROM ITS ANTIPARTICLE A READING MUST READ A CHARGE. A reading that gives a particle and its
    antiparticle different values is not a function of the energy alone. A particle is its charges and its energy,
    so such a reading depends on the charges. -/
theorem a_reading_that_tells_the_pair_apart_reads_a_charge {Y : Type} (r : Particle → Y) (c : Particle)
    (apart : r (bar c) ≠ r c) : ¬ ∃ g : Energy → Y, ∀ d, r d = g d.energy :=
  fun ⟨g, hg⟩ => apart (by rw [hg (bar c), hg c]; rfl)

/-- THE WEIGHT DOES NOT TELL ALL THE NEUTRAL APART. The converse of `gravity_counts_only_the_neutral` fails in the
    model: two neutral particles of one frequency and different rates are two on one weight. Of gravity the paper
    claims one direction only. -/
theorem the_weight_does_not_tell_all_the_neutral_apart :
    ∃ c d : Particle, Neutral c ∧ Neutral d ∧ c ≠ d ∧ grav c = grav d :=
  ⟨⟨0, 0, 0, 0, ⟨0, 0⟩⟩, ⟨0, 0, 0, 0, ⟨0, 1⟩⟩, ⟨rfl, rfl, rfl, rfl⟩, ⟨rfl, rfl, rfl, rfl⟩, by decide, rfl⟩

/-- THE CHARGES ARE SUCH A READING. The charges of a charged particle and of its antiparticle differ. -/
theorem the_charges_tell_a_charged_pair_apart (c : Particle) (charged : ¬ Neutral c) :
    charges (bar c) ≠ charges c := by
  intro h
  apply charged
  have h1 : -c.q3 = c.q3 := congrArg (fun t : Int × Int × Int × Int => t.1) h
  have h2 : -c.colour = c.colour := congrArg (fun t : Int × Int × Int × Int => t.2.1) h
  have h3 : -c.b3 = c.b3 := congrArg (fun t : Int × Int × Int × Int => t.2.2.1) h
  have h4 : -c.lepton = c.lepton := congrArg (fun t : Int × Int × Int × Int => t.2.2.2) h
  exact ⟨by omega, by omega, by omega, by omega⟩

/-- A CHARGED PAIR EXISTS. One charged particle and its antiparticle: two particles, one weight. -/
theorem a_charged_pair_is_two_on_one_weight :
    ∃ c : Particle, bar c ≠ c ∧ grav (bar c) = grav c :=
  ⟨⟨1, 0, 0, 0, ⟨0, 0⟩⟩, by decide, rfl⟩

/-! ## PART III · THE BINDING -/

/-- WHAT GRAVITY COUNTS. Nothing stands before the colon. -/
theorem what_gravity_counts :
    (∀ c, grav (bar c) = grav c)
    ∧ (∀ (Y : Type) (r : Particle → Y), (∀ c, r (bar c) = r c) →
        ∀ S : Particle → Prop, (∀ c, S c → S (bar c)) → Counts r S → ∀ c, S c → Neutral c)
    ∧ (∀ (Z : Type) (f : Int → Z) (S : Particle → Prop) (c : Particle), S c → S (bar c) → ¬ Neutral c →
        ¬ Counts (fun d => f (grav d)) S)
    ∧ (∀ (Y : Type) (r : Particle → Y) (S : Particle → Prop), Counts r S →
        ∀ c, S c → S (bar c) → ¬ Neutral c → r (bar c) ≠ r c)
    ∧ (∀ c, ¬ Neutral c → charges (bar c) ≠ charges c)
    ∧ (∃ c : Particle, bar c ≠ c ∧ grav (bar c) = grav c) :=
  ⟨the_weight_is_kept,
   fun _ r kept S form count => every_kept_reading_counts_only_the_neutral r kept S form count,
   fun _ f S c hc hb ch => nothing_computed_from_the_weight_counts_a_charged_pair f S c hc hb ch,
   fun _ r S count c hc hb ch =>
     to_count_a_charged_pair_a_reading_must_see_the_particle_map r S count c hc hb ch,
   the_charges_tell_a_charged_pair_apart,
   a_charged_pair_is_two_on_one_weight⟩

end SPHYS.GravityCount

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.GravityCount.a_kept_reading_counts_only_the_line' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.a_kept_reading_counts_only_the_line
/-- info: 'SPHYS.GravityCount.no_kept_reading_tells_a_pair_apart' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.no_kept_reading_tells_a_pair_apart
/-- info: 'SPHYS.GravityCount.nothing_computed_from_a_reading_counts_more' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.nothing_computed_from_a_reading_counts_more
/-- info: 'SPHYS.GravityCount.what_is_computed_from_a_kept_reading_is_kept' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.what_is_computed_from_a_kept_reading_is_kept
/-- info: 'SPHYS.GravityCount.a_reading_that_counts_a_pair_is_not_kept' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.a_reading_that_counts_a_pair_is_not_kept
/-- info: 'SPHYS.GravityCount.bar_fixed_iff_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.GravityCount.bar_fixed_iff_neutral
/-- info: 'SPHYS.GravityCount.the_weight_is_kept' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.the_weight_is_kept
/-- info: 'SPHYS.GravityCount.every_kept_reading_counts_only_the_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.GravityCount.every_kept_reading_counts_only_the_neutral
/-- info: 'SPHYS.GravityCount.gravity_counts_only_the_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.GravityCount.gravity_counts_only_the_neutral
/--
info: 'SPHYS.GravityCount.nothing_computed_from_the_weight_counts_a_charged_pair' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.GravityCount.nothing_computed_from_the_weight_counts_a_charged_pair
/--
info: 'SPHYS.GravityCount.to_count_a_charged_pair_a_reading_must_see_the_particle_map' depends on axioms: [propext,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.GravityCount.to_count_a_charged_pair_a_reading_must_see_the_particle_map
/-- info: 'SPHYS.GravityCount.a_reading_of_the_energy_alone_is_kept' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.a_reading_of_the_energy_alone_is_kept
/-- info: 'SPHYS.GravityCount.a_reading_that_tells_the_pair_apart_reads_a_charge' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.a_reading_that_tells_the_pair_apart_reads_a_charge
/-- info: 'SPHYS.GravityCount.the_weight_does_not_tell_all_the_neutral_apart' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.the_weight_does_not_tell_all_the_neutral_apart
/-- info: 'SPHYS.GravityCount.the_charges_tell_a_charged_pair_apart' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.GravityCount.the_charges_tell_a_charged_pair_apart
/-- info: 'SPHYS.GravityCount.a_charged_pair_is_two_on_one_weight' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.a_charged_pair_is_two_on_one_weight
/-- info: 'SPHYS.GravityCount.what_gravity_counts' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.GravityCount.what_gravity_counts
