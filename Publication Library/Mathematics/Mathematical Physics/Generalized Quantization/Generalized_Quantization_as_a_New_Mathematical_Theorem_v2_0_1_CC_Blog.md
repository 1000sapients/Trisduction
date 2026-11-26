# Generalized Quantization as a New Mathematical Theorem

## Existence, Form and Witness Make Every Existent an Atom Counted by Its Registration, on Every Seat and Under Every Symmetry, with Every Algebraic Quantization a Seat

**Mohammad F. Islam PhD** · 26 November 2026

*Blog edition of the master, edition 2.0.1 of 25 November 2026. It renders the whole text. The printed files of the appendices stand in the master and in the Journal edition, and are listed at the end.*

## Abstract

This paper proves, in Lean 4 with Mathlib, one theorem about counting, widens it to every symmetry, and places on it two folds of physics and the algebra of every quantization that has an adjoint. A seat is a set with a fold, an involution, and a registration the fold keeps. A configuration on a seat has three axes: its existents, its form, which is closure under the fold, and its witness, which is that no two existents share a registration. A configuration is called quantized by a registration when the registration is one-to-one on it. Nothing else is meant by that phrase: no commutation relation, no constant, and no assumption that the values of a registration are isolated. The theorem is that form and witness put every existent on the line: each is one point, its own partner, and the existents are counted one to one by their registrations. In a folded configuration every existent holds its registration whole or by halves, and one existent off the line ends the count. Where the registration tells apart the points of the line, a folded configuration is quantized exactly when it lies on the line. On a seat whose fold fixes no point, a quantized existent stands without its partner. Where registering twice is registering once, recording completes in one step; and where the registration fixes exactly the points of the line, a configuration is its own record exactly when it lies on the line. This edition adds five results. The fold may be any family of maps, with no structure asked of it; the orbit map is then a registration through which every other registration factors, so one object stands for every registration, written or not yet written. A finite configuration closed under a fold has zero total of every reading the fold reverses, where its values have no element of order two. A label of a linear symmetry of period *n*, on a vector space over a field, is an *n*-th root of one, and there are at most *n* of them: there the isolation of the values is derived from the period. In every ring with an adjoint, which is what this paper means by the algebra of an algebraic quantization, the observables are the line and the adjoint reverses the commutator of two observables; where that commutator is not zero and the ring has no element of additive order two, it is off the line and it and its adjoint are two on one registration. Over a field of characteristic zero no two finite matrices form a canonical pair. For an operator symmetric under a form, the registration it gives a state of nonzero norm is fixed by conjugation, and two such states with different registrations are orthogonal. Three folds of physics are read. On the particle map, with the reading of gravity as its registration, gravity counts a configuration of matter with its antimatter only if every member is neutral, it reads a charged particle and its antiparticle as one, and a finite configuration of matter with its antimatter is neutral as a whole. On the time mirror, with the level as its registration, a configuration closed under the mirror is quantized by its levels exactly when every member is stationary, and a decaying mode and its mirror are two on one level. On the parity of a gravitational wave, with its energy as the registration, the two helicities are two on one energy. A Fortran twin checks the statements by exhaustion on 270 seats, 162 particles and 18 modes and on the small cases of the new results, in 24 checks. The paper states two predictions and the two observations that would refute it. It derives no constant, and it does not claim that gravity, or any field, is or is not quantized in the canonical sense.

## 1. The Theorem and What It Rests On

### 1.1 The statement

Let *X* be a set, *σ* an involution of *X*, and *r* a map from *X* to a set *Y* with *r*(*σ**a*) = *r*(*a*) for every *a*. The triple is a seat, *σ* its fold and *r* its registration. A point is on the line when *σ* fixes it. A configuration is a set *S* of points, and its members are its existents. A reading counts a configuration when it gives no two of its members the same value, which is the same as the configuration being quantized by it.

**Theorem (`the_existents_are_atoms`).** Let *S* be closed under *σ*, and let no two members of *S* share a registration. Then every member of *S* is fixed by *σ*; two members are one exactly when their registrations are one; and *r* is one-to-one on *S*.

The third clause is the witness restated, by the definition of Section 1.4. The content of the theorem is the first clause, and the second, which follows from it.

**Theorem (`the_count_is_the_count_of_registrations`, `finitely_many_existents_have_that_many_registrations`).** If no two members of *S* share a registration, *S* has as many registrations as members, and every finite part of *S* with *n* members has *n* registrations.

**Theorem (`whole_or_by_halves`, `one_existent_off_the_line_ends_the_count`).** Let *S* be closed under *σ*. Every member of *S* is fixed by *σ*, or its image under *σ* is a second member with the same registration. If one member is not fixed, *r* is not one-to-one on *S*.

**Theorem (`quantized_iff_on_the_line`).** Let *r* tell apart the fixed points of *σ*. Then a configuration closed under *σ* has *r* one-to-one on it exactly when every member is fixed.

**Theorem (`on_a_vacant_seat_a_witnessed_existent_stands_alone`).** Let *σ* fix no point, and let no two members of *S* share a registration. Then no member of *S* has its image under *σ* in *S*.

**Theorem (`recording_is_one_step`, `self_recorded_iff_on_the_line`).** Let *Y* = *X* and *r*(*r*(*a*)) = *r*(*a*). The image of the image of *S* under *r* is the image of *S*, and so is every further image. If *r* fixes exactly the points *σ* fixes, *S* is its own image exactly when every member is fixed.

**Theorem (`gravity_counts_the_neutral`, `a_charged_particle_is_two_on_one_reading`).** On the seat of the particle map of Section 1.2: in a configuration closed under the particle map in which the reading of gravity differs between any two members, every member is neutral. A particle that is not neutral and its antiparticle are two, and gravity reads them alike.

**Theorem (`the_levels_are_the_stationary`, `a_decaying_mode_is_two_on_one_level`).** On the seat of the time mirror of Section 1.2: a configuration closed under the time mirror has the level one-to-one on it exactly when every member is stationary. A member that decays and its mirror are two on one level.

**Theorem (`every_registration_factors_through_the_orbit_map`, `form_and_witness_put_every_existent_on_the_fixed_set`).** Let *Φ* be any family of maps of *X*. Every reading that every map of the family keeps is a function of the orbit map. If a configuration is closed under every map of the family and such a reading counts it, every member is fixed by every map.

**Theorem (`an_odd_reading_sums_to_zero`).** In a finite configuration closed under an involution, a reading the involution reverses, with values in a commutative group with no element of order two, has total zero.

**Theorem (`a_label_of_a_periodic_symmetry_is_a_root_of_one`, `a_symmetry_of_period_n_has_at_most_n_labels`).** If a linear map *T* of a vector space over a field has *T*ⁿ the identity and *T**v* = *λ**v* for a nonzero *v*, then *λ*ⁿ = 1; and for *n* &gt; 0 a finite set of such *λ* has at most *n* members.

**Theorem (`the_observables_are_the_atoms`, `a_commutator_and_its_adjoint_are_two_on_one_registration`).** In any ring with an adjoint, a configuration that holds the adjoint of each member and is counted by a reading the adjoint keeps holds only self-adjoint members. Where the ring has no element of additive order two and two self-adjoint elements do not commute, their commutator and its adjoint are two with one real part.

**Theorem (`the_registrations_of_an_observable_are_on_the_line`).** For an operator symmetric under a form, with *T**v* = *λ**v* and the pairing of *v* with itself not zero, *λ* is fixed by the conjugation.

**Theorem (`generalized_quantization`, `every_algebraic_quantization_is_a_seat`).** The statements of Sections 3 to 7, on every seat and on the particle seat and the time seat of Section 1.2, in one term with nothing before the colon; and the statements of Section 10 that hold in every ring with an adjoint, in one term with nothing before the colon but the ring.

The three files are Lean 4 \[14\] with Mathlib \[13\]: Appendix A for Sections 3 to 7, Appendix B for Sections 7.1, 7.3, 8, 9 and 10.3, and Appendix C for Sections 10.1 and 10.2. `the_existents_are_atoms`, `quantized_iff_on_the_line` and `on_a_vacant_seat_a_witnessed_existent_stands_alone` rest on no axiom; every other theorem rests on Lean’s three standard axioms or on fewer, and Appendix F prints the line for each. The count of a set is Mathlib’s `Set.ncard`, which is the number of members of a finite set and zero for an infinite one.

### 1.2 The premises, printed

The seat is this structure of the Lean file. It is the whole of what the general theorems assume.

``` lean
structure Seat (X Y : Type) where
  fold : X → X
  involutive : ∀ a, fold (fold a) = a
  reg : X → Y
  keeps : ∀ a, reg (fold a) = reg a
```

The physical premises are the two seats below and the model of a particle they stand on, and there are no others.

``` lean
structure Energy where
  freq : Int
  rate : Int

structure Particle where
  q3 : Int
  colour : Int
  b3 : Int
  lepton : Int
  energy : Energy

def bar (c : Particle) : Particle := ⟨-c.q3, -c.colour, -c.b3, -c.lepton, c.energy⟩
def grav (c : Particle) : Int := c.energy.freq
def particleSeat : Seat Particle Int := ⟨bar, bar_involutive, grav, fun _ => rfl⟩

def tmirror (c : Particle) : Particle :=
  ⟨c.q3, c.colour, c.b3, c.lepton, ⟨c.energy.freq, -c.energy.rate⟩⟩
def level (c : Particle) : Int × Int × Int × Int × Int :=
  (c.q3, c.colour, c.b3, c.lepton, c.energy.freq)
def timeSeat : Seat Particle (Int × Int × Int × Int × Int) :=
  ⟨tmirror, tmirror_involutive, level, fun _ => rfl⟩
```

The third fold of physics is the parity of a wave, on this model of Appendix B.

``` lean
structure Wave where
  plus : Int
  cross : Int

def parity (w : Wave) : Wave := ⟨w.plus, -w.cross⟩
def waveEnergy (w : Wave) : Int := w.plus * w.plus + w.cross * w.cross
```

Sections 8, 9 and 10 have no physical premise: their hypotheses are a family of maps, a linear map of finite period, a ring with an adjoint, and a form. The models above carry four premises. The first is the particle map: to every particle there is one with every additive charge reversed and the same energy \[1, 2, 3\]. The second is that gravity reads the frequency of the energy and nothing of the charges or of the rate; that it reads nothing of the charges is the equivalence of inertial and gravitational mass \[6\]. The third is that the energy of a mode has a frequency and a rate, that a mode with rate zero is stationary, and that the mirror of time reverses the rate and keeps the frequency \[8, 9\]. The fourth is that a plane gravitational wave has two polarisations, that parity reverses the cross polarisation and keeps the other, that the energy of the wave is the sum of their squares, and that a wave with a cross part and its parity mirror are the two helicities of the classical description; the two polarisations are classical. No field or definition above states a count, a discreteness, a commutator, or the conclusion of any theorem. The charges and the energy are integers; a charge the model does not carry, such as a flavour, is outside it.

### 1.3 What is proved, what is cited, what is assumed

- **Form and witness put every existent on the line, each its own partner; that the configuration is quantized is the witness restated** · Standing: Proved, for every seat, on no axiom; Where: Appendix A, Part I
- **A quantized configuration has as many registrations as existents** · Standing: Proved, for every seat; the count is that of a finite configuration; Where: Appendix A, Part II
- **In a folded configuration every existent is whole or by halves; one existent off the line ends the count** · Standing: Proved, for every seat; Where: Appendix A, Part III
- **On a seat whose registration tells apart the line, folded and quantized is folded and on the line** · Standing: Proved, for every such seat, on no axiom; Where: Appendix A, Part III
- **On a vacant seat a quantized existent stands without its partner** · Standing: Proved, for every seat, on no axiom; Where: Appendix A, Part IV
- **Recording is one step; a configuration is its own record exactly on the line** · Standing: Proved, for every seat on which registering twice is registering once and, for the second statement, the registration fixes exactly the points of the line; Where: Appendix A, Part V
- **The particle map is an involution and fixes exactly the neutral** · Standing: Proved, in the model; Where: Appendix A, Part VI
- **In a configuration closed under the particle map, what gravity counts is neutral; a charged particle is two on one reading; gravity does not tell all the neutral apart** · Standing: Proved, in the model; Where: Appendix A, Part VI
- **The time mirror is an involution and fixes exactly the stationary** · Standing: Proved, in the model; Where: Appendix A, Part VII
- **A configuration closed under the time mirror is quantized by its levels exactly when it is stationary; a decaying mode is two on one level** · Standing: Proved, in the model; Where: Appendix A, Part VII
- **All of the above in one term** · Standing: Proved; Where: Appendix A, Part VIII
- **For any family of maps: the orbit map is a registration, every registration factors through it, and a configuration closed under the family and counted by a kept reading lies on the fixed set** · Standing: Proved, for every set and family; the second and third on no axiom; Where: Appendix B, Part I
- **Relabelling keeps the occupation numbers; an assignment is fixed by every relabelling exactly when all quanta are in one mode** · Standing: Proved, for every number of quanta and set of modes; Where: Appendix B, Part II
- **In a finite configuration closed under an involution an odd reading sums to zero, where its values have no element of order two; matter with its antimatter is neutral as a whole** · Standing: Proved; the second in the model; Where: Appendix B, Part III
- **A label of a linear symmetry of period *n* is an *n*-th root of one; at most *n* labels** · Standing: Proved, for every field and vector space; Where: Appendix B, Part IV
- **For an operator symmetric under a form, a registration on a state of nonzero norm is fixed by conjugation; two such states with different registrations are orthogonal** · Standing: Proved, for every such form; Where: Appendix B, Part V
- **Parity fixes the waves with no cross part and keeps the energy; the two helicities are two on one energy** · Standing: Proved, in the model; Where: Appendix B, Part VI
- **In every ring with an adjoint: the observables are the atoms; the adjoint reverses the commutator of two observables; where it is not zero it and its adjoint are two on one registration** · Standing: Proved, for every such ring; the last where no element has additive order two; Where: Appendix C, Parts I, II, IV
- **No canonical pair in finite matrices** · Standing: Proved, over a field of characteristic zero; Where: Appendix C, Part III

- **Every particle has an antiparticle of equal mass and opposite charges** · Standing: Cited, classical; Source: \[1, 2, 3\]
- **The ratio of charge to mass of the antiproton is that of the proton to 16 parts in 10¹²** · Standing: Cited, measured; Source: \[4\]
- **Antihydrogen falls toward the Earth** · Standing: Cited, measured; Source: \[5\]
- **Bodies of different composition fall alike to parts in 10¹⁵** · Standing: Cited, measured; Source: \[6\]
- **A state that decays has a line of width ℏ/*τ** · Standing: Cited, classical; Source: \[8, 9\]
- **The rule that promotes brackets to commutators** · Standing: Cited, classical; not used; Source: \[10\]
- **Identical quanta are counted by their occupation numbers** · Standing: Cited, classical; Source: \[15\]
- **A canonical pair cannot be bounded** · Standing: Cited, classical; its finite case is proved here for matrices over a field of characteristic zero; Source: \[16\]
- **Observables are self-adjoint operators with real eigenvalues and orthogonal eigenstates** · Standing: Cited, classical; proved here for every form of the stated kind; Source: \[17\]

- **Nature has a particle map that keeps the energy** · Standing: Assumed; premise one
- **Gravity reads the frequency of the energy alone** · Standing: Assumed; premise two
- **A mode has a frequency and a rate, and the mirror of time reverses the rate** · Standing: Assumed; premise three
- **A plane gravitational wave has two polarisations; parity reverses the cross one; its energy is the sum of their squares; a wave with a cross part and its mirror are the two helicities of the classical description** · Standing: Assumed; premise four
- **The occupation numbers are the finest registration of the relabellings** · Standing: Not proved here
- **The labels of a symmetry with no finite period** · Standing: Classical, not formalised here
- **The values of the twin** · Standing: Numerical, not machine-checked

### 1.4 What quantized means here

One definition carries the title, and it is printed in Appendix A.

``` lean
def Quantized (S : X → Prop) : Prop := Set.InjOn σ.reg {a | S a}
```

A configuration is quantized by a registration when no two of its existents share a registration: it comes in whole units, and the units are counted by the registration. `quantized_iff_witnessed` proves that this is the witness, the third axis, under another name.

Three things the word does not say. It does not say that the values of the registration are isolated from one another; a registration may take every real value and still be one-to-one. It does not say that two quantities fail to commute, and no constant such as ℏ enters the file. It does not say that a field has been quantized in the sense of Dirac’s rule \[10\], which is cited in Section 1.3 and is not used. The word generalized says that the theorem holds on every seat, with no space, no number and no dynamics in its hypotheses, and in this edition for every family of maps and every ring with an adjoint. Section 9 proves one case in which the values of a registration are isolated; there the isolation is a conclusion.

## 2. The Seat and the Three Axes

A seat is a set, a fold and a registration the fold keeps. The fold pairs each point with a partner, and a point is its own partner exactly when the fold fixes it. Those points are the line. The registration is a reading the fold cannot change: it is the same on a point and on its partner.

A configuration on a seat has three axes of three kinds.

-   **Existence.** The configuration has existents.
-   **Form.** The fold carries the configuration to itself. The configuration is then folded.
-   **Witness.** No two existents have one registration. The configuration is then witnessed, and by Section 1.4 quantized.

Existence is about members, form is about a map on the configuration, and witness is about a map out of it. The theorems of this paper say how the three constrain one another, and they use nothing else.

## 3. The Atoms

**Theorem (`the_triaxial_theorem`).** A folded and witnessed configuration lies on the line.

*Proof.* Let *a* be an existent. By form its partner *σ**a* is an existent. The fold keeps the registration, so *a* and *σ**a* have one registration. By witness they are one point. ◼

The proof is one line and uses no axiom. `the_existents_are_atoms` adds what the line makes of the members. Each is one point and not a pair. Two of them differ exactly when their registrations differ, so the only gap between one existent and another is a gap of registration. And the registration is one-to-one on the configuration, which is the definition of quantized.

That is the sense of atom in this paper: an existent that is its own partner and has a registration no other existent has. Nothing in the hypotheses is a number. The set may be finite or not, the registration may take values in any set, and the theorem is the same.

## 4. The Count

**Theorem (`the_count_is_the_count_of_registrations`).** A witnessed configuration has as many registrations as existents.

This is the statement that the existents are counted by the registration. For a finite part it reads plainly: *n* existents have *n* registrations, for every whole number *n* (`finitely_many_existents_have_that_many_registrations`). The whole number is not put in. It is the size of a finite set, and the theorem says the registration preserves it. For an infinite configuration the library’s count is zero on both sides and the equality says nothing; what carries the count of an infinite configuration is the one-to-one registration itself, which is the witness.

Form is not used here. Witness alone gives the count. Form is what puts the counted existents on the line.

## 5. Off the Line: Whole or by Halves

**Theorem (`off_the_line_an_existent_is_two`).** In a folded configuration, an existent the fold moves has its partner in the configuration; the two are two; and they hold one registration.

**Theorem (`whole_or_by_halves`).** In a folded configuration every existent is its own partner, or it shares its registration with a second existent.

There is no third case. The orbit of a point is the point with its partner. On the line the orbit of a point is one point and holds its registration whole (`on_the_line_the_orbit_is_one_point`). Off the line the orbit is two points on one registration (`off_the_line_the_orbit_is_two_points`, `the_orbit_has_one_registration`), and each holds half.

**Theorem (`one_existent_off_the_line_ends_the_count`).** A folded configuration with one existent off the line is not quantized.

**Theorem (`quantized_iff_on_the_line`).** On a seat whose registration tells apart the points of the line, a folded configuration is quantized exactly when it lies on the line.

So on such a seat, for a folded configuration, the count and the line are one condition. On every seat, what a registration counts in a folded configuration the fold fixes, and what the fold moves is counted two to one.

## 6. The Vacant Seat, and Recording

A seat is vacant when its fold fixes no point. Then the line is empty, and form and witness cannot hold together where there is an existent (`on_a_vacant_seat_form_and_count_exclude`).

**Theorem (`on_a_vacant_seat_a_witnessed_existent_stands_alone`).** On a vacant seat, a witnessed configuration holds no existent together with its partner.

On such a seat a configuration with an existent can be quantized, but only by giving up form: each counted existent stands without the other half of its orbit.

Recording is the registration applied to a configuration, on a seat whose registration lands in the seat itself.

**Theorem (`recording_is_one_step`).** Where registering twice is registering once, the record of the record is the record, and every further recording returns it.

**Theorem (`self_recorded_iff_on_the_line`).** Where the registration fixes exactly the points the fold fixes, a configuration is its own record exactly when it lies on the line.

On a seat that meets both conditions a configuration has at most two states under recording, itself and its record, and the second is final. On the line the two are one: recording alters nothing. Off the line recording alters the configuration. Where the configuration holds a point with its partner, no map restores it from the record, since the two have one record and a map sends one point to one point.

## 7. Three Folds of Physics

### 7.1 The particle map, with the reading of gravity

The particle map reverses every additive charge of a particle and keeps its energy. It is an involution (`bar_involutive`), and it fixes a particle exactly when the particle is neutral, every charge zero (`bar_fixed_iff_neutral`). The reading of gravity is the frequency of the energy. The particle map keeps it, so it is a registration of the particle map, and the two form the seat `particleSeat`.

**Theorem (`gravity_counts_the_neutral`).** In a configuration of particles closed under the particle map, in which gravity reads no two members alike, every member is neutral, its own antiparticle, and the members are counted by the reading of gravity.

**Theorem (`a_charged_particle_is_two_on_one_reading`).** A particle that is not neutral and its antiparticle are two existents, and gravity reads them alike.

**Theorem (`matter_with_antimatter_is_not_counted_by_gravity`).** A configuration closed under the particle map that holds one charged particle is not quantized by the reading of gravity.

Gravity counts, and in a configuration that holds the antiparticle of each member what it counts stands on the line of the particle map. The converse is not claimed, and in the model it is false: two neutral particles of one frequency and different rates are two, and gravity reads them alike (`gravity_does_not_tell_all_the_neutral_apart`). The particle seat does not meet the hypothesis of `quantized_iff_on_the_line`; the time seat of Section 7.2 does. A photon is its own antiparticle and is on the line of the particle map. An electron is not: with its positron it is two existents on one gravitational reading. That gravity cannot tell the two apart is the two premises together: the particle map keeps the energy, and gravity reads its frequency and nothing else.

**Theorem (`matter_with_its_antimatter_is_neutral_as_a_whole`).** In a finite configuration that holds the antiparticle of each member, each of the four charges sums to zero.

It is the case, for the particle map, of `an_odd_reading_sums_to_zero`: in a finite configuration closed under an involution, a reading the involution reverses has total zero, where its values have no element of order two, as the integers have none. What the particle map reverses cancels over matter with its antimatter, and what it keeps, the reading of gravity among it, is what remains to be read.

The charges themselves are not a registration of the particle map, since the map changes them (`the_charges_are_not_a_registration`). Only what a fold keeps is a registration of its seat.

### 7.2 The time mirror, with the level

The energy of a mode has a frequency and a rate. A mode whose rate is zero is stationary. The time mirror reverses the rate and keeps everything else. It is an involution (`tmirror_involutive`) and fixes a particle exactly when it is stationary (`tmirror_fixed_iff_stationary`). The level of a particle is its charges and its frequency, without the rate. The time mirror keeps the level, and the two form the seat `timeSeat`.

The level tells the stationary apart: two stationary particles of one level are one particle (`the_level_tells_the_stationary_apart`). So this seat meets the hypothesis of `quantized_iff_on_the_line`.

**Theorem (`the_levels_are_the_stationary`).** A configuration closed under the time mirror is quantized by its levels exactly when every member is stationary.

**Theorem (`a_decaying_mode_is_two_on_one_level`).** A particle whose rate is not zero and its time mirror are two existents on one level.

In a configuration closed under the time mirror the stationary states are the ones a level counts, one state to one level. A state that decays shares its level with its mirror, the state that grows at the same rate, and the level does not single it out. The growing mode is the decay with time reversed, a solution of the same equations. A configuration closed under the time mirror holds it, and the paper does not say that it is found alone in nature. The classical physics of a decaying state reads the rate as the width of the line: the classical result is a line of width ℏ/*τ* for a lifetime *τ* \[8, 9\], and a sharp level only for a state that does not decay \[7\].

### 7.3 The parity of a wave, with its energy

A plane gravitational wave has two polarisations, plus and cross. Parity reverses the cross polarisation and keeps the other. In the classical description that exchanges the two helicities, and the model reads a wave with a cross part and its mirror as such a pair. Parity is an involution (`parity_involutive`) and fixes a wave exactly when the wave has no cross part (`parity_fixed_iff_no_cross`). The energy of the wave is the sum of the squares of its polarisations, and parity keeps it (`parity_keeps_the_energy`).

**Theorem (`every_parity_kept_reading_counts_only_the_plus_waves`).** A configuration of waves closed under parity and counted by a reading parity keeps holds only waves with no cross part.

**Theorem (`the_two_helicities_are_two_on_one_energy`).** A wave with a cross part and its mirror are two waves, and the energy reads them alike.

The model is two integers, and parity as the fold is the fourth premise. Nothing here is a statement about a quantum of the wave.

### 7.4 One term

`generalized_quantization` binds six clauses with nothing before the colon. (I) On every seat, form and witness make every existent one point, on the line. (II) A witnessed configuration has as many registrations as existents. (III) In a folded configuration every existent holds its registration whole or by halves. (IV) In a folded configuration one existent off the line ends the count. (V) In a configuration closed under the particle map what gravity counts is neutral, and a charged particle is two on one reading. (VI) A configuration closed under the time mirror is quantized by its levels exactly when every member is stationary, and a decaying mode is two on one level.

## 8. Any Symmetry, and the Finest Registration

### 8.1 Any family of maps

Sections 2 to 6 use one fold, an involution. Nothing in the triaxial argument needs that. Let *Φ* be any family of maps of *X*. No structure is asked of it: the maps need not be invertible, and the family need not be closed under composition. A reading is *kept* when every map of the family keeps it. A reading *counts* a configuration when it gives no two of its members the same value; the configuration is then quantized by that reading, in the sense of Section 1.4. The *orbit map* sends a point to its orbit, the class obtained by identifying each point with each of its images.

**Theorem (`the_orbit_map_is_a_registration`, `every_registration_factors_through_the_orbit_map`).** Every map of the family keeps the orbit map, and every kept reading, with values in any set, is a function of the orbit map.

**Theorem (`a_registration_counts_only_if_the_orbit_map_counts`).** If a kept reading counts a configuration, the orbit map counts it.

The orbit map is itself a kept reading. So some kept reading counts a configuration exactly when the orbit map does, and the question of what any kept reading can count, one already written or one not yet written, is the question of what one object counts.

**Theorem (`form_and_witness_put_every_existent_on_the_fixed_set`, `one_moved_existent_ends_every_count`).** If a configuration is closed under every map of the family and a kept reading counts it, every member is fixed by every map. A configuration that holds a point and one of its images, the two being two, is counted by no kept reading.

The fold of Sections 2 to 6 is the family of one involution. A group acting on the set, two folds taken together, and a family of gauge maps are other cases, and none needs a further theorem. A registration counts at most one point of each orbit.

### 8.2 Identical quanta

Take *n* quanta, each assigned a mode. An assignment is a function from the *n* labels to the modes. The family is the relabellings: every permutation of the labels. The occupation number of a mode is the number of quanta in it.

**Theorem (`relabelling_keeps_the_occupation_numbers`).** The occupation numbers are a kept reading of the relabellings.

**Theorem (`fixed_by_every_relabelling_iff_one_mode`, `the_occupation_numbers_count_only_one_mode`).** An assignment is fixed by every relabelling exactly when all its quanta are in one mode. A configuration of assignments closed under relabelling and counted by the occupation numbers holds only such assignments.

**Theorem (`quanta_in_two_modes_are_many_on_one_occupation`).** Exchanging two quanta that sit in different modes gives a second assignment with the same occupation numbers.

A labelled assignment with quanta in two modes is therefore not what the occupation numbers count: it is many on one registration. That identical quanta are counted by their occupation numbers and not by their labels is the classical counting \[15\], and it is the case of Section 8.1 for the relabellings. One statement is not proved here: that the occupation numbers are the finest registration of the relabellings, so that two assignments with the same occupation numbers are relabellings of one another.

## 9. Where Isolated Values Come From

The definition of Section 1.4 does not make the values of a registration isolated. This section proves one case in which they are, from a hypothesis that contains no discreteness.

**Theorem (`a_label_of_a_periodic_symmetry_is_a_root_of_one`).** Let *T* be a linear map of a vector space over a field, with *T*ⁿ the identity. If *T**v* = *λ**v* for a nonzero *v*, then *λ*ⁿ = 1.

**Theorem (`a_symmetry_of_period_n_has_at_most_n_labels`).** In a field, a finite set of elements *λ* with *λ*ⁿ = 1, for *n* &gt; 0, has at most *n* members.

The label *λ* is the registration the symmetry gives the state *v*. The symmetry keeps it, since *T**v* has the label of *v*. The field may be the complex numbers, a continuum. The only number in the hypotheses is the period. The conclusion is that the labels are isolated and at most *n*. Here the isolation of the values is derived from the period of the symmetry. It is not assumed.

The case with no finite period is not proved here. For a rotation through any angle the labels are the whole numbers of a full turn; that is classical and is not formalised in this paper.

## 10. Every Algebraic Quantization on the Seat

### 10.1 The adjoint is a fold

By an algebraic quantization this paper means a construction that ends in an algebra of quantities with an adjoint: a ring with an involution that reverses products. The operators on a Hilbert space, the matrix algebras and the operator algebras of the classical theory \[17\] are of this kind. The kernel of Appendix C does not treat one such algebra. It is proved for every ring with an adjoint, so an algebra constructed before this paper or after it is a case of it.

The fold is the adjoint. The line is the self-adjoint elements, which such a theory calls its observables. The real part, *a* + *a*^(\), is kept by the adjoint (`the_adjoint_keeps_the_real_part`), so it is a registration.

**Theorem (`the_observables_are_the_atoms`).** In any ring with an adjoint, let a reading with values in any set be kept by the adjoint. A configuration that holds the adjoint of each of its members and is counted by the reading holds only self-adjoint members.

**Theorem (`quantized_by_the_real_part_iff_observables`).** In a ring with an adjoint and with no element of additive order two, a configuration that holds the adjoint of each of its members is counted by the real part exactly when every member is self-adjoint.

### 10.2 The commutator and the line

**Theorem (`the_adjoint_reverses_the_commutator`, `the_real_part_reads_no_commutator`).** Let *a* and *b* be self-adjoint. Then (*a**b*−*b**a*)^(\) =  − (*a**b*−*b**a*), and the real part of *a**b* − *b**a* is zero.

**Theorem (`observables_with_an_observable_commutator_commute`, `a_commutator_and_its_adjoint_are_two_on_one_registration`, `no_kept_reading_counts_the_commutator_with_its_adjoint`).** Let the ring have no element of additive order two, and let *a* and *b* be self-adjoint. If *a**b* − *b**a* is self-adjoint, then *a**b* = *b**a*. If *a**b* ≠ *b**a*, the commutator and its adjoint are two, they have one real part, and no reading the adjoint keeps counts a configuration that holds both.

By the classical rule \[10\], what a canonical quantization adds to an algebra of commuting quantities is a commutator of observables that is not zero. The theorem places a commutator of observables that is not zero, in a ring with no element of additive order two: it is off the line, and with its adjoint it is two on one registration. The size of the commutator is not fixed by anything here, and no constant is derived.

**Theorem (`no_canonical_pair_in_finite_matrices`).** Over a field of characteristic zero, no two square matrices of a nonzero finite size have a commutator that is a nonzero multiple of the identity.

This is the trace argument, compiled. It is the finite case of the classical result that a canonical pair cannot be bounded \[16\]: a canonical pair needs infinitely many dimensions. `every_algebraic_quantization_is_a_seat` binds the statements of Sections 10.1 and 10.2 that hold in every ring with an adjoint, with nothing before the colon but the ring.

### 10.3 The spectral seat

A form on a vector space over a field with a conjugation is a pairing of states that takes a scalar out of its second place unchanged and out of its first place conjugated; additivity is not needed and is not assumed. An operator is symmetric under the form when it can be moved from one place to the other.

**Theorem (`the_registrations_of_an_observable_are_on_the_line`).** Let *T* be symmetric under a form. If *T**v* = *λ**v* and the pairing of *v* with itself is not zero, then *λ* is fixed by the conjugation.

**Theorem (`states_with_different_registrations_are_orthogonal`).** Let *T* be symmetric under a form, with *T**u* = *μ**u* and *T**v* = *λ**v*, *μ* fixed by the conjugation and *μ* ≠ *λ*. Then the pairing of *u* with *v* is zero.

The registration an observable gives a state is its eigenvalue. The first theorem puts it on the line of the conjugation. The second says that the registration tells states apart, and that the form reads the difference as no overlap. Both are classical for operators on a Hilbert space \[17\]; here they are proved for every form of the stated kind. They join Section 7.2: in the classical description of a decaying state \[9\], the rate is the part of the energy the conjugation reverses, and a stationary state is a state whose energy is on that line.

### 10.4 What is subsumed and what is not

The statements of this section hold for every ring with an adjoint and every form of the stated kind. A quantization whose quantities form such a ring is therefore a case of them, whenever it was or will be constructed: its observables are the line of the adjoint; its commutators of observables, where they are not zero and the ring has no element of additive order two, are off the line in pairs; and, for its operators symmetric under a form of the stated kind, the eigenvalues on states of nonzero norm are on the line of the conjugation. Nothing more is proved of it. Its particular algebra, its states, its dynamics and the size of its commutators are its own, and no result of any particular quantization is derived or refuted here. A scheme that forms no ring with an adjoint is outside this section until it forms one.

## 11. The Numerical Twin

The twin of Appendix D checks the statements by exhaustion on small cases. It is in integer arithmetic throughout.

- **A** · What is enumerated: The 270 seats on 4 points with a registration into 3 values, 27 of them vacant, and the 16 configurations of each; Checks: Form and witness put every existent on the line; a witnessed configuration has as many registrations as existents; each existent of a folded configuration is whole or by halves; one existent off the line ends the count; on a vacant seat a witnessed existent stands alone; on a seat whose registration tells apart its line, which the twin calls faithful, a folded configuration is witnessed exactly when on the line
- **B** · What is enumerated: The 162 particles with charges in { − 1, 0, 1} and frequency in {0, 1}: 2 neutral and 160 charged; Checks: The particle map fixes exactly the neutral; gravity counts the pair exactly when it is neutral; a charged particle is two on one reading
- **C** · What is enumerated: The 18 modes with one charge in { − 1, 0, 1}, frequency in {0, 1} and rate in { − 1, 0, 1}: 6 stationary and 12 decaying; Checks: The time mirror fixes exactly the stationary; the level tells the stationary apart; a decaying mode is two on one level
- **D** · What is enumerated: The 64 configurations of a seat of 6 points; Checks: Recording is one step; a configuration is its own record exactly on the line
- **E** · What is enumerated: The 729 pairs of maps of 3 points, no structure asked of them, with every reading into 2 values they keep; Checks: Every kept reading factors through the orbit map; a configuration closed under both maps and counted lies on their fixed set
- **F** · What is enumerated: The 64 configurations of 10 particles closed under the particle map; Checks: Matter with its antimatter is neutral as a whole
- **G** · What is enumerated: The periods 1 to *p* − 1 in arithmetic modulo the primes 5, 7, 11, 13 and 17; Checks: A symmetry of period *n* has at most *n* labels
- **H** · What is enumerated: The 49 waves with polarisations from  − 3 to 3; Checks: Parity is an involution, fixes the waves with no cross part and keeps the energy; the two helicities are two on one energy
- **I** · What is enumerated: The 8 assignments of 3 quanta to 2 modes and their 6 relabellings; Checks: Relabelling keeps the occupation numbers; an assignment is fixed by every relabelling exactly when in one mode
- **J** · What is enumerated: The 6561 pairs of 2 by 2 matrices with entries  − 1, 0, 1, the transpose as the adjoint; Checks: No commutator is a nonzero multiple of the identity; for two symmetric matrices the adjoint reverses the commutator

Twenty-four checks pass and none fails.

**The measurements.** The first bears on the first premise, the third on the second, and the second on the two together. The ratio of charge to mass of the antiproton equals that of the proton to 16 parts in 10¹² \[4\]. Antihydrogen released in a vertical trap falls toward the Earth with an acceleration of 0.75 ± 0.13 ± 0.16 in units of *g* \[5\], which is within 1.2 of its combined uncertainties of the value for matter and 8.5 of them from the opposite sign. Bodies of titanium and of platinum fall alike to parts in 10¹⁵ \[6\].

Four limits are stated. Part G is in arithmetic modulo a prime, where the theorem is for every field, and Part J takes the transpose as the adjoint. The twin enumerates small cases and the theorems are for every seat. Part C carries one charge where the model carries four. And no number of the twin enters any proof.

## 12. Discussion: The Reading

The derivation above uses a set, an involution and a map the involution keeps. This section states where the premises come from and marks what is theorem and what is premise.

**Why a fold.** Each of the three folds of Section 7 is a symmetry that physics already has: the exchange of a particle with its antiparticle \[1, 3\], the reversal of time on the rate of a mode, and the parity of a wave. That nature has them is premise. What the paper proves is what any such fold forces on a count.

**Why a registration is what the fold keeps.** A reading that is to be a registration of a symmetry cannot depend on which side was read. The energy is such a reading for the particle map, and the level is one for the time mirror. The charges are not, and the file proves it. The premise is that gravity reads the frequency of the energy and nothing else; that it reads nothing of the charges is the equivalence of the two masses and is measured \[6\].

**What is new and what is not.** The triaxial theorem is one line, and it is not new to this paper: the files of the Lean Library Reference carry it. What this paper adds, from its first edition, is the statement of what it makes of the members: atoms, counted by the registration, with the complement that in a folded configuration an existent off the line is two on one registration, and the reading of both on the particle map and the time mirror. This edition adds that the argument needs no involution and holds for any family of maps, with the orbit map as the one registration every other factors through; that the isolation of the labels of a linear symmetry of finite period is a conclusion; and that every ring with an adjoint is a seat on which a commutator of two observables that is not zero stands off the line, where the ring has no element of additive order two. That a neutral particle is its own antiparticle \[11\], that antimatter falls \[5\], and that a decaying state has a width \[8\] were known.

**What the paper does not claim.** It does not derive Planck’s constant or any level of any atom \[7, 12\]. It does not quantize a field by Dirac’s rule \[10\], and it does not say whether the field of gravity is or is not quantized in that sense; no experiment has decided that. It does not derive the size of any commutator, and it does not derive or refute any result of a particular quantization (Section 10.4). It does not prove that the occupation numbers are the finest registration of identical quanta (Section 8.2), and it does not treat a linear symmetry with no finite period (Section 9). It claims that on every seat form and witness make atoms counted by the registration, that in a folded configuration the count fails wherever an existent stands off the line, and that gravity, the level and the energy of a wave are three registrations of physics on which this is read.

## 13. Predictions, Falsifiers, and What Stands

The paper derives no constant and predicts no measurement that present physics does not. Its commitments are those of its premises, and they are stated here as commitments.

### 13.1 Two predictions that will stand

1.  **Gravity does not tell a particle from its antiparticle.** `a_charged_particle_is_two_on_one_reading` gives it on the premises. The prediction is that antimatter falls as matter does, at every precision, and that no gravitational measurement separates a charged particle from its antiparticle.
2.  **A state that decays has no sharp level.** `a_decaying_mode_is_two_on_one_level` and `the_levels_are_the_stationary` give on the premises that a decaying mode has no level of its own. The file carries no constant, so a width is not derived in the file; the classical relation \[8, 9\] reads the rate as the width of the line. With that relation the prediction is that every unstable state has a line of nonzero natural width, and that a level is sharp only for a state that does not decay.

### 13.2 Two proposals that will fail

1.  **Antigravity of antimatter.** A proposal in which antimatter is repelled by matter makes the reading of gravity odd under the particle map. On the premises it is even, and the measurement of Section 11 lies 8.5 uncertainties from repulsion.
2.  **A count of charged matter by gravity alone.** A proposal that reads the number of particles in a body from its weight alone, with matter and antimatter both present, is refused by `matter_with_antimatter_is_not_counted_by_gravity`.

### 13.3 The two falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, or the premises as the law of nature, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment’s printed uncertainties.

1.  **Antimatter that falls at a rate different from matter.** It refutes premise one or premise two, through `a_charged_particle_is_two_on_one_reading`.
2.  **A state of finite lifetime with a natural line narrower than ℏ/*τ*, with no selection on the time of decay.** It refutes premise three as the classical relation reads it \[8, 9\], the rate of the energy being the width of the line. The bound ℏ/*τ* is that relation’s and is not derived in the file. The theorem that carries the consequence is `a_decaying_mode_is_two_on_one_level`.

The fourth premise, on the wave, is the classical account of a gravitational wave and is tested where that account is tested. This paper states no falsifier of its own for it, and no prediction of Section 13.1 rests on it.

Apart from them stands the formal claim, which no observation touches and one compilation settles: every theorem named in this text prints its axioms in Appendix F, and a line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved.

### 13.4 What kind of result this is

It is not a new physics. It is one theorem about counting, proved for every seat, every family of maps and every ring with an adjoint, and three seats of physics on which, on the premises, it is read. The implication from the seat to the atoms and their count is checked by the Lean kernel, and no experiment alters an implication. Experiment remains free to test whether nature has the folds and the registrations of Section 7, and that is all it can test here. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and they are printed in Section 1.2 for that purpose.

## 14. Part II · The Reading

*This part is the reading from which the paper takes its place in the series. It is premise-grade. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 11 depends on it. The theorem names set in code in this part are theorems of Appendix A; what the reading says of them beyond their statements is the reading’s.*

### 14.1 Being Is Atomic

The theorems of Part I say that an existent with form and witness is one point, its own partner, with a registration no other existent has. The reading is that this is what it is to be one: a being is atomic, and it is counted by what registers it. On this reading the word quantized names no special property of the small. It names existence with form and witness, on any seat.

The complement is read the same way. In a folded configuration an existent off the line is two on one registration (`off_the_line_an_existent_is_two`). The reading is that what is two has not yet been counted as one: the pair holds its registration by halves, and no registration that the fold keeps can make it a unit.

### 14.2 The Line Is the One Continuum

On a seat whose registration lands in the seat itself, the registration takes its values on the line (Section 6), and nothing in the theorems makes those values isolated. The reading is that the line is the one thing that is continuous, the shared chain on which every registration falls, and that everything counted on it is counted in whole units. The atoms are many and the line is one. This is a reading: the kernel proves that the existents are counted by their registrations (`the_count_is_the_count_of_registrations`) and proves nothing about the continuity of any line.

### 14.3 The Prior, the Posterior and the Step

On the seats of Section 6, recording completes in one step (`recording_is_one_step`), and a configuration is its own record exactly on the line (`self_recorded_iff_on_the_line`). The reading names the configuration before recording the prior and its record the posterior. On the line the prior is the posterior, and the only gap left is between one existent and the next, which is a gap of registration. Off the line the step alters the prior, once and for good, and where the prior held a point with its partner nothing restores it from the record.

The reading goes one step further, and here it is premise alone: that this one whole step is what a moment is, and that a time made of such steps is counted and not continuous. No theorem of this paper derives a discrete time. The step is proved to be whole; that time is made of steps is not proved, and a theorem in which a discrete time comes out of the atom, and is not put in, would be needed to raise it.

### 14.4 Gravity, Time and the Substrate

Section 7 reads the theorem on three folds. The reading extends it: that every registration of physics which a fold keeps counts what stands on that fold’s line, and that gravity, time and whatever underlies them are quantized in this one sense and by this one theorem. The three cases of Section 7 are proved in models. Section 10 meets the algebraic case in general, by theorem: for every quantization whose quantities form a ring with an adjoint, the fold is the adjoint, the line is the observables and the real part is a registration. The rest of the extension is premise: that the dynamics and the constants of such a theory are read on its seat as well.

What would count against the extension is stated plainly: an established quantization whose quantities form no ring with an adjoint and for which no fold and no registration the fold keeps can be exhibited. For it the extension would be false, and the theorems of Part I would stand as they are.

### 14.5 A Discreteness the Object Has

The record of the programme separates, from its first deposit (Islam, 2026b), two kinds of boundary: one the observer imposes by a choice of categories, there called an observer-imposed discretization, and one grounded in a structural discontinuity of the domain itself. Section 9 is read on that separation. The labels of a linear symmetry of period *n* are isolated, and nothing isolates them but the period: no reader supplies the boundary. The reading is that quantization, in the sense of this paper, is a discreteness the object has and not one laid on it.

A later edition of the same record calls the coordinate layer of arithmetized geometry a sedimentation over a recognition that comes first. The reading here is of the same kind: the theorems of Sections 3 and 8.1 have no number in their hypotheses, and the isolated labels of Section 9 come out of a period. This subsection is a reading. Appendix G lists where each of these terms is on the public record, at the grade its own record carries.

## 15. Closure

Counting has a theorem. From a set, an involution and a map the involution keeps, and nothing more, Lean 4 with Mathlib compiles that form and witness make every existent one point, its own partner; that such a configuration, quantized by its registration, has as many registrations as existents; that in a folded configuration every existent holds its registration whole or by halves; that in such a configuration one existent off the line ends the count; that on a seat whose registration tells apart its line, quantized and on the line are one condition; that on a vacant seat a quantized existent stands without its partner; and that, where registering twice is registering once, recording is one step, with a configuration its own record exactly on the line where the registration fixes exactly the points of the line. No axiom is declared. Every proof is complete.

The theorem is wider than one fold. For any family of maps, with no structure asked of it, the orbit map is a registration through which every other registration factors, so what any registration can count is what that one map counts; and a configuration closed under the family and counted by a kept reading lies on its fixed set. A finite configuration closed under a fold has zero total of every reading the fold reverses, where its values have no element of order two. A label of a linear symmetry of period *n*, on a vector space over a field, is an *n*-th root of one, and there are at most *n*: the isolation of those values is a conclusion. In every ring with an adjoint the observables are the line, the commutator of two observables is reversed by the adjoint, and where it is not zero and the ring has no element of additive order two it stands off the line with its adjoint, two on one registration; over a field of characteristic zero no two finite matrices form a canonical pair. For an operator symmetric under a form, a registration on a state of nonzero norm is fixed by conjugation, and two such states with different registrations are orthogonal. Every algebraic quantization, constructed before this paper or after it, is a case of the statements on the ring as soon as its quantities form a ring with an adjoint.

The theorem is read on three folds of physics. On the particle map, with the reading of gravity as the registration, in a configuration of matter with its antimatter gravity counts only the neutral, and it reads a charged particle and its antiparticle as one. On the time mirror, with the level as the registration, a configuration closed under the mirror is counted by its levels exactly when every member is stationary, and a decaying mode is two on one level. On the parity of a gravitational wave, with its energy as the registration, the two helicities are two on one energy. A finite configuration of matter with its antimatter is neutral as a whole. The numerical twin enumerates 270 seats on four points, 162 particles and 18 modes, with the small cases of the wider results, and finds every statement holding in every case, in 24 checks. Two measurements stand beside the first fold: the antiproton has the ratio of charge to mass of the proton to 16 parts in 10¹², and antihydrogen falls toward the Earth.

Every boundary is in plain sight. That nature has a particle map that keeps the energy is one premise. That gravity reads the frequency of the energy alone is a second. That a mode has a frequency and a rate, with the mirror of time reversing the rate, is a third. That a gravitational wave has two polarisations, with parity reversing one, the energy the sum of their squares, and a wave with a cross part and its mirror the two helicities, is a fourth. The wider results have no physical premise. The model carries four charges and integer energies, and a charge it does not carry is outside it. The word quantized is one printed definition: the registration is one-to-one on the configuration. No commutation relation, no constant and no isolation of values is claimed, and whether any field is quantized by Dirac’s rule is not decided here. No constant is derived, the size of no commutator is fixed, and no result of any particular quantization is derived or refuted. The isolation of values is proved for a linear symmetry of finite period and for no other. That the occupation numbers are the finest registration of identical quanta is not proved.

Two things are therefore separate, and the paper keeps them separate. Inside the kernel, the implication from the seat to the atoms and their count is a mathematical certainty. No experiment, no consensus and no later revision of physics alters it, and anyone can recheck it with one compilation. Outside the kernel stand two falsifiers. They test whether nature satisfies the premises, and so far nature does. What survives both is not opinion. It is a theorem, and a physics that has met every test of its premises.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author’s. The Lean files and the Fortran twin are written by a language model under the author’s direct supervision. Every theorem named in the text of Sections 1 to 13 and 15 is in Appendix A, B or C under that name, and its kernel line is printed in Appendix F. Classical results and measurements that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are counts of enumerated cases, and the measured values of Section 11 are quoted from their sources.

**The seat.** The seat is elementary: a set, an involution and a map the involution keeps. In the plane it is a reflection and the line it fixes, studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1.  P. A. M. Dirac, Proc. R. Soc. A 126 (1930) 360.
2.  C. D. Anderson, Phys. Rev. 43 (1933) 491.
3.  G. Lüders, Ann. Phys. 2 (1957) 1.
4.  M. J. Borchert et al., Nature 601 (2022) 53.
5.  E. K. Anderson et al., Nature 621 (2023) 716.
6.  P. Touboul et al., Phys. Rev. Lett. 129 (2022) 121102.
7.  N. Bohr, Philos. Mag. 26 (1913) 1.
8.  V. Weisskopf and E. Wigner, Z. Phys. 63 (1930) 54.
9.  G. Gamow, Z. Phys. 51 (1928) 204.
10. P. A. M. Dirac, Proc. R. Soc. A 109 (1925) 642.
11. E. Majorana, Nuovo Cimento 14 (1937) 171.
12. M. Planck, Ann. Phys. 4 (1901) 553.
13. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
14. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
15. S. N. Bose, Z. Phys. 26 (1924) 178.
16. A. Wintner, Phys. Rev. 71 (1947) 738.
17. J. von Neumann, Mathematische Grundlagen der Quantenmechanik (Springer, 1932).
18. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
19. M. F. Islam, Trisduction: The Geometry of Convergent Epistemic Warrant, first and third editions (2026b).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its engine uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main. The first two carry the first theorem of this paper on their own seats.

1.  The seat, with the atoms as its Part XIX: Publication Library/Mathematics/Millennium Series/RH\_Both\_Sides\_Formal\_Master\_v3\_0\_46\_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.
2.  The vacant seat, with the atoms as its Part Z: FINAL\_BINDING/PNP Binding/PNP\_Normal\_Form\_Paper\_v1\_16\_0\_CC.lean. Compiled alone in core Lean 4.19.0, exit 0.
3.  Least Erasure: protocols/RH One Bit/Nothing Escapes Three Plus One/Least\_Erasure.lean. Compiled alone in core Lean 4.19.0, exit 0.
4.  Root Axiom and Existence: Publication Library/Philosophy/Metaphysics/Root Axiom/TOE\_Zero.lean. Compiled alone in core Lean 4.19.0, exit 0.

## Appendices

**Appendix A · SPHYS_Quantization_Forced_CC.lean.** One fold. Lean 4.19.0 with Mathlib 4.19.0. 29 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent. The kernel lines are Appendix F. *[a printed file, 414 lines, in the master and in the Journal edition]*

**Appendix B · SPHYS_Quantization_II_CC.lean.** Any family of maps, identical quanta, the odd reading, the periodic labels, the spectral seat and the wave. 21 theorems, no axiom declared, no `sorry`, exit 0 with no warning, every cone pinned. *[a printed file, 376 lines, in the master and in the Journal edition]*

**Appendix C · SPHYS_Quantization_Star_CC.lean.** Every ring with an adjoint. 11 theorems, no axiom declared, no `sorry`, exit 0 with no warning, every cone pinned. *[a printed file, 181 lines, in the master and in the Journal edition]*

**Appendix D · Quantization_Forced_Twin_CC.f90.** Twenty-four checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix E. *[a printed file, 322 lines, in the master and in the Journal edition]*

**Appendix E · Run of Appendix D.** ```text
Part A: 270 seats on 4 points, 27 of them vacant, 16 configurations each
 A1 form and witness put every existent on the line     PASS  (1422 cases)
 A2 witnessed: as many registrations as existents       PASS  (2430 cases)
 A3 folded: each existent whole or by halves            PASS  (5400 cases)
 A4 one existent off the line ends the count            PASS  (729 cases)
 A5 vacant seat: a witnessed existent stands alone      PASS  (252 cases)
 A6 faithful seat: witnessed exactly when on the line   PASS  (972 cases)
Part B: 162 particles, 2 neutral, 160 charged
 B1 the particle map fixes exactly the neutral          PASS  (162 cases)
 B2 gravity counts the pair exactly when it is neutral  PASS  (162 cases)
 B3 a charged particle is two on one reading            PASS  (160 cases)
Part C: 18 modes, 6 stationary, 12 decaying
 C1 the time mirror fixes exactly the stationary        PASS  (18 cases)
 C2 the level tells the stationary apart                PASS  (6 cases)
 C3 a decaying mode is two on one level                 PASS  (12 cases)
Part D: 64 configurations of 6 points
 D1 recording is one step                               PASS  (64 cases)
 D2 the prior is the posterior exactly on the line      PASS  (64 cases)
Part E: 729 pairs of maps of 3 points, every reading into 2 values they keep
 E1 every kept reading factors through the orbit map    PASS  (13218 cases)
 E2 closed and counted: every member on the fixed set   PASS  (2232 cases)
Part F: 64 configurations of 10 particles closed under the particle map
 F1 matter with its antimatter is neutral as a whole    PASS  (64 cases)
Part G: periods 1 to p-1 for the primes 5, 7, 11, 13, 17
 G1 a symmetry of period n has at most n labels         PASS  (48 cases)
Part H: 49 waves
 H1 parity: an involution, fixes no-cross, keeps energy  PASS  (49 cases)
 H2 the two helicities are two on one energy            PASS  (42 cases)
Part I: 8 assignments of 3 quanta to 2 modes, 6 relabellings
 I1 relabelling keeps the occupation numbers            PASS  (48 cases)
 I2 fixed by every relabelling exactly in one mode      PASS  (8 cases)
Part J: 6561 pairs of 2 by 2 integer matrices
 J1 no commutator is a nonzero multiple of identity     PASS  (6561 cases)
 J2 observables: the adjoint reverses the commutator    PASS  (729 cases)
BATTERY {"checks":24,"failures":0} *[a printed file, 35 lines, in the master and in the Journal edition]*

**Appendix F · Kernel lines of Appendices A, B and C.** Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own. *[a printed file, 80 lines, in the master and in the Journal edition]*

**Appendix G · Provenance Trail.** The frame, the terms and the seat of this paper are on the public record before it. The frame is the first anchor: three orthogonal axes converging on one point, with the witness outside them. The table lists each step at the grade its own record carries, with the address where that record can be read. The theorem of this paper, that form and witness put every existent on the line and that a registration counts a folded configuration only there, is in the last two rows and in no earlier one. The earlier rows carry the frame, terms, readings and special cases, and none of them is claimed as that theorem; the row marked frame states no mathematics of this paper. The third column gives, for each row, the term of that record which is the precursor, and why the row is on the trail. The term of the row of 31 March is printed there as observer-imposed discretization. *[a printed file, 0 lines, in the master and in the Journal edition]*
