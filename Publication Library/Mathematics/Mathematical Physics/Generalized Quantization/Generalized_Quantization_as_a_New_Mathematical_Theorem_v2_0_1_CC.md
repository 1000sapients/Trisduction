# Generalized Quantization as a New Mathematical Theorem

## Existence, Form and Witness Make Every Existent an Atom Counted by Its Registration, on Every Seat and Under Every Symmetry, with Every Algebraic Quantization a Seat

**Mohammad F. Islam PhD** · 26 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, one theorem about counting, widens it to every symmetry, and places on it two folds of physics and the algebra of every quantization that has an adjoint. A seat is a set with a fold, an involution, and a registration the fold keeps. A configuration on a seat has three axes: its existents, its form, which is closure under the fold, and its witness, which is that no two existents share a registration. A configuration is called quantized by a registration when the registration is one-to-one on it. Nothing else is meant by that phrase: no commutation relation, no constant, and no assumption that the values of a registration are isolated. The theorem is that form and witness put every existent on the line: each is one point, its own partner, and the existents are counted one to one by their registrations. In a folded configuration every existent holds its registration whole or by halves, and one existent off the line ends the count. Where the registration tells apart the points of the line, a folded configuration is quantized exactly when it lies on the line. On a seat whose fold fixes no point, a quantized existent stands without its partner. Where registering twice is registering once, recording completes in one step; and where the registration fixes exactly the points of the line, a configuration is its own record exactly when it lies on the line. This edition adds five results. The fold may be any family of maps, with no structure asked of it; the orbit map is then a registration through which every other registration factors, so one object stands for every registration, written or not yet written. A finite configuration closed under a fold has zero total of every reading the fold reverses, where its values have no element of order two. A label of a linear symmetry of period $n$, on a vector space over a field, is an $n$-th root of one, and there are at most $n$ of them: there the isolation of the values is derived from the period. In every ring with an adjoint, which is what this paper means by the algebra of an algebraic quantization, the observables are the line and the adjoint reverses the commutator of two observables; where that commutator is not zero and the ring has no element of additive order two, it is off the line and it and its adjoint are two on one registration. Over a field of characteristic zero no two finite matrices form a canonical pair. For an operator symmetric under a form, the registration it gives a state of nonzero norm is fixed by conjugation, and two such states with different registrations are orthogonal. Three folds of physics are read. On the particle map, with the reading of gravity as its registration, gravity counts a configuration of matter with its antimatter only if every member is neutral, it reads a charged particle and its antiparticle as one, and a finite configuration of matter with its antimatter is neutral as a whole. On the time mirror, with the level as its registration, a configuration closed under the mirror is quantized by its levels exactly when every member is stationary, and a decaying mode and its mirror are two on one level. On the parity of a gravitational wave, with its energy as the registration, the two helicities are two on one energy. A Fortran twin checks the statements by exhaustion on 270 seats, 162 particles and 18 modes and on the small cases of the new results, in 24 checks. The paper states two predictions and the two observations that would refute it. It derives no constant, and it does not claim that gravity, or any field, is or is not quantized in the canonical sense.

## 1. The Theorem and What It Rests On

### 1.1 The statement

Let $X$ be a set, $\sigma$ an involution of $X$, and $r$ a map from $X$ to a set $Y$ with $r(\sigma a) = r(a)$ for every $a$. The triple is a seat, $\sigma$ its fold and $r$ its registration. A point is on the line when $\sigma$ fixes it. A configuration is a set $S$ of points, and its members are its existents. A reading counts a configuration when it gives no two of its members the same value, which is the same as the configuration being quantized by it.

**Theorem (`the_existents_are_atoms`).** Let $S$ be closed under $\sigma$, and let no two members of $S$ share a registration. Then every member of $S$ is fixed by $\sigma$; two members are one exactly when their registrations are one; and $r$ is one-to-one on $S$.

The third clause is the witness restated, by the definition of Section 1.4. The content of the theorem is the first clause, and the second, which follows from it.

**Theorem (`the_count_is_the_count_of_registrations`, `finitely_many_existents_have_that_many_registrations`).** If no two members of $S$ share a registration, $S$ has as many registrations as members, and every finite part of $S$ with $n$ members has $n$ registrations.

**Theorem (`whole_or_by_halves`, `one_existent_off_the_line_ends_the_count`).** Let $S$ be closed under $\sigma$. Every member of $S$ is fixed by $\sigma$, or its image under $\sigma$ is a second member with the same registration. If one member is not fixed, $r$ is not one-to-one on $S$.

**Theorem (`quantized_iff_on_the_line`).** Let $r$ tell apart the fixed points of $\sigma$. Then a configuration closed under $\sigma$ has $r$ one-to-one on it exactly when every member is fixed.

**Theorem (`on_a_vacant_seat_a_witnessed_existent_stands_alone`).** Let $\sigma$ fix no point, and let no two members of $S$ share a registration. Then no member of $S$ has its image under $\sigma$ in $S$.

**Theorem (`recording_is_one_step`, `self_recorded_iff_on_the_line`).** Let $Y = X$ and $r(r(a)) = r(a)$. The image of the image of $S$ under $r$ is the image of $S$, and so is every further image. If $r$ fixes exactly the points $\sigma$ fixes, $S$ is its own image exactly when every member is fixed.

**Theorem (`gravity_counts_the_neutral`, `a_charged_particle_is_two_on_one_reading`).** On the seat of the particle map of Section 1.2: in a configuration closed under the particle map in which the reading of gravity differs between any two members, every member is neutral. A particle that is not neutral and its antiparticle are two, and gravity reads them alike.

**Theorem (`the_levels_are_the_stationary`, `a_decaying_mode_is_two_on_one_level`).** On the seat of the time mirror of Section 1.2: a configuration closed under the time mirror has the level one-to-one on it exactly when every member is stationary. A member that decays and its mirror are two on one level.

**Theorem (`every_registration_factors_through_the_orbit_map`, `form_and_witness_put_every_existent_on_the_fixed_set`).** Let $\Phi$ be any family of maps of $X$. Every reading that every map of the family keeps is a function of the orbit map. If a configuration is closed under every map of the family and such a reading counts it, every member is fixed by every map.

**Theorem (`an_odd_reading_sums_to_zero`).** In a finite configuration closed under an involution, a reading the involution reverses, with values in a commutative group with no element of order two, has total zero.

**Theorem (`a_label_of_a_periodic_symmetry_is_a_root_of_one`, `a_symmetry_of_period_n_has_at_most_n_labels`).** If a linear map $T$ of a vector space over a field has $T^n$ the identity and $Tv = \lambda v$ for a nonzero $v$, then $\lambda^n = 1$; and for $n > 0$ a finite set of such $\lambda$ has at most $n$ members.

**Theorem (`the_observables_are_the_atoms`, `a_commutator_and_its_adjoint_are_two_on_one_registration`).** In any ring with an adjoint, a configuration that holds the adjoint of each member and is counted by a reading the adjoint keeps holds only self-adjoint members. Where the ring has no element of additive order two and two self-adjoint elements do not commute, their commutator and its adjoint are two with one real part.

**Theorem (`the_registrations_of_an_observable_are_on_the_line`).** For an operator symmetric under a form, with $Tv = \lambda v$ and the pairing of $v$ with itself not zero, $\lambda$ is fixed by the conjugation.

**Theorem (`generalized_quantization`, `every_algebraic_quantization_is_a_seat`).** The statements of Sections 3 to 7, on every seat and on the particle seat and the time seat of Section 1.2, in one term with nothing before the colon; and the statements of Section 10 that hold in every ring with an adjoint, in one term with nothing before the colon but the ring.

The three files are Lean 4 [14] with Mathlib [13]: Appendix A for Sections 3 to 7, Appendix B for Sections 7.1, 7.3, 8, 9 and 10.3, and Appendix C for Sections 10.1 and 10.2. `the_existents_are_atoms`, `quantized_iff_on_the_line` and `on_a_vacant_seat_a_witnessed_existent_stands_alone` rest on no axiom; every other theorem rests on Lean's three standard axioms or on fewer, and Appendix F prints the line for each. The count of a set is Mathlib's `Set.ncard`, which is the number of members of a finite set and zero for an infinite one.

### 1.2 The premises, printed

The seat is this structure of the Lean file. It is the whole of what the general theorems assume.

```lean
structure Seat (X Y : Type) where
  fold : X → X
  involutive : ∀ a, fold (fold a) = a
  reg : X → Y
  keeps : ∀ a, reg (fold a) = reg a
```

The physical premises are the two seats below and the model of a particle they stand on, and there are no others.

```lean
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

```lean
structure Wave where
  plus : Int
  cross : Int

def parity (w : Wave) : Wave := ⟨w.plus, -w.cross⟩
def waveEnergy (w : Wave) : Int := w.plus * w.plus + w.cross * w.cross
```

Sections 8, 9 and 10 have no physical premise: their hypotheses are a family of maps, a linear map of finite period, a ring with an adjoint, and a form. The models above carry four premises. The first is the particle map: to every particle there is one with every additive charge reversed and the same energy [1, 2, 3]. The second is that gravity reads the frequency of the energy and nothing of the charges or of the rate; that it reads nothing of the charges is the equivalence of inertial and gravitational mass [6]. The third is that the energy of a mode has a frequency and a rate, that a mode with rate zero is stationary, and that the mirror of time reverses the rate and keeps the frequency [8, 9]. The fourth is that a plane gravitational wave has two polarisations, that parity reverses the cross polarisation and keeps the other, that the energy of the wave is the sum of their squares, and that a wave with a cross part and its parity mirror are the two helicities of the classical description; the two polarisations are classical. No field or definition above states a count, a discreteness, a commutator, or the conclusion of any theorem. The charges and the energy are integers; a charge the model does not carry, such as a flavour, is outside it.

### 1.3 What is proved, what is cited, what is assumed

| Statement | Standing | Where |
|---|---|---|
| Form and witness put every existent on the line, each its own partner; that the configuration is quantized is the witness restated | Proved, for every seat, on no axiom | Appendix A, Part I |
| A quantized configuration has as many registrations as existents | Proved, for every seat; the count is that of a finite configuration | Appendix A, Part II |
| In a folded configuration every existent is whole or by halves; one existent off the line ends the count | Proved, for every seat | Appendix A, Part III |
| On a seat whose registration tells apart the line, folded and quantized is folded and on the line | Proved, for every such seat, on no axiom | Appendix A, Part III |
| On a vacant seat a quantized existent stands without its partner | Proved, for every seat, on no axiom | Appendix A, Part IV |
| Recording is one step; a configuration is its own record exactly on the line | Proved, for every seat on which registering twice is registering once and, for the second statement, the registration fixes exactly the points of the line | Appendix A, Part V |
| The particle map is an involution and fixes exactly the neutral | Proved, in the model | Appendix A, Part VI |
| In a configuration closed under the particle map, what gravity counts is neutral; a charged particle is two on one reading; gravity does not tell all the neutral apart | Proved, in the model | Appendix A, Part VI |
| The time mirror is an involution and fixes exactly the stationary | Proved, in the model | Appendix A, Part VII |
| A configuration closed under the time mirror is quantized by its levels exactly when it is stationary; a decaying mode is two on one level | Proved, in the model | Appendix A, Part VII |
| All of the above in one term | Proved | Appendix A, Part VIII |
| For any family of maps: the orbit map is a registration, every registration factors through it, and a configuration closed under the family and counted by a kept reading lies on the fixed set | Proved, for every set and family; the second and third on no axiom | Appendix B, Part I |
| Relabelling keeps the occupation numbers; an assignment is fixed by every relabelling exactly when all quanta are in one mode | Proved, for every number of quanta and set of modes | Appendix B, Part II |
| In a finite configuration closed under an involution an odd reading sums to zero, where its values have no element of order two; matter with its antimatter is neutral as a whole | Proved; the second in the model | Appendix B, Part III |
| A label of a linear symmetry of period $n$ is an $n$-th root of one; at most $n$ labels | Proved, for every field and vector space | Appendix B, Part IV |
| For an operator symmetric under a form, a registration on a state of nonzero norm is fixed by conjugation; two such states with different registrations are orthogonal | Proved, for every such form | Appendix B, Part V |
| Parity fixes the waves with no cross part and keeps the energy; the two helicities are two on one energy | Proved, in the model | Appendix B, Part VI |
| In every ring with an adjoint: the observables are the atoms; the adjoint reverses the commutator of two observables; where it is not zero it and its adjoint are two on one registration | Proved, for every such ring; the last where no element has additive order two | Appendix C, Parts I, II, IV |
| No canonical pair in finite matrices | Proved, over a field of characteristic zero | Appendix C, Part III |

| Statement | Standing | Source |
|---|---|---|
| Every particle has an antiparticle of equal mass and opposite charges | Cited, classical | [1, 2, 3] |
| The ratio of charge to mass of the antiproton is that of the proton to 16 parts in $10^{12}$ | Cited, measured | [4] |
| Antihydrogen falls toward the Earth | Cited, measured | [5] |
| Bodies of different composition fall alike to parts in $10^{15}$ | Cited, measured | [6] |
| A state that decays has a line of width $\hbar/\tau$ | Cited, classical | [8, 9] |
| The rule that promotes brackets to commutators | Cited, classical; not used | [10] |
| Identical quanta are counted by their occupation numbers | Cited, classical | [15] |
| A canonical pair cannot be bounded | Cited, classical; its finite case is proved here for matrices over a field of characteristic zero | [16] |
| Observables are self-adjoint operators with real eigenvalues and orthogonal eigenstates | Cited, classical; proved here for every form of the stated kind | [17] |

| Statement | Standing |
|---|---|
| Nature has a particle map that keeps the energy | Assumed; premise one |
| Gravity reads the frequency of the energy alone | Assumed; premise two |
| A mode has a frequency and a rate, and the mirror of time reverses the rate | Assumed; premise three |
| A plane gravitational wave has two polarisations; parity reverses the cross one; its energy is the sum of their squares; a wave with a cross part and its mirror are the two helicities of the classical description | Assumed; premise four |
| The occupation numbers are the finest registration of the relabellings | Not proved here |
| The labels of a symmetry with no finite period | Classical, not formalised here |
| The values of the twin | Numerical, not machine-checked |

### 1.4 What quantized means here

One definition carries the title, and it is printed in Appendix A.

```lean
def Quantized (S : X → Prop) : Prop := Set.InjOn σ.reg {a | S a}
```

A configuration is quantized by a registration when no two of its existents share a registration: it comes in whole units, and the units are counted by the registration. `quantized_iff_witnessed` proves that this is the witness, the third axis, under another name.

Three things the word does not say. It does not say that the values of the registration are isolated from one another; a registration may take every real value and still be one-to-one. It does not say that two quantities fail to commute, and no constant such as $\hbar$ enters the file. It does not say that a field has been quantized in the sense of Dirac's rule [10], which is cited in Section 1.3 and is not used. The word generalized says that the theorem holds on every seat, with no space, no number and no dynamics in its hypotheses, and in this edition for every family of maps and every ring with an adjoint. Section 9 proves one case in which the values of a registration are isolated; there the isolation is a conclusion.

## 2. The Seat and the Three Axes

A seat is a set, a fold and a registration the fold keeps. The fold pairs each point with a partner, and a point is its own partner exactly when the fold fixes it. Those points are the line. The registration is a reading the fold cannot change: it is the same on a point and on its partner.

A configuration on a seat has three axes of three kinds.

- **Existence.** The configuration has existents.
- **Form.** The fold carries the configuration to itself. The configuration is then folded.
- **Witness.** No two existents have one registration. The configuration is then witnessed, and by Section 1.4 quantized.

Existence is about members, form is about a map on the configuration, and witness is about a map out of it. The theorems of this paper say how the three constrain one another, and they use nothing else.

## 3. The Atoms

**Theorem (`the_triaxial_theorem`).** A folded and witnessed configuration lies on the line.

*Proof.* Let $a$ be an existent. By form its partner $\sigma a$ is an existent. The fold keeps the registration, so $a$ and $\sigma a$ have one registration. By witness they are one point. $\blacksquare$

The proof is one line and uses no axiom. `the_existents_are_atoms` adds what the line makes of the members. Each is one point and not a pair. Two of them differ exactly when their registrations differ, so the only gap between one existent and another is a gap of registration. And the registration is one-to-one on the configuration, which is the definition of quantized.

That is the sense of atom in this paper: an existent that is its own partner and has a registration no other existent has. Nothing in the hypotheses is a number. The set may be finite or not, the registration may take values in any set, and the theorem is the same.

## 4. The Count

**Theorem (`the_count_is_the_count_of_registrations`).** A witnessed configuration has as many registrations as existents.

This is the statement that the existents are counted by the registration. For a finite part it reads plainly: $n$ existents have $n$ registrations, for every whole number $n$ (`finitely_many_existents_have_that_many_registrations`). The whole number is not put in. It is the size of a finite set, and the theorem says the registration preserves it. For an infinite configuration the library's count is zero on both sides and the equality says nothing; what carries the count of an infinite configuration is the one-to-one registration itself, which is the witness.

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

In a configuration closed under the time mirror the stationary states are the ones a level counts, one state to one level. A state that decays shares its level with its mirror, the state that grows at the same rate, and the level does not single it out. The growing mode is the decay with time reversed, a solution of the same equations. A configuration closed under the time mirror holds it, and the paper does not say that it is found alone in nature. The classical physics of a decaying state reads the rate as the width of the line: the classical result is a line of width $\hbar/\tau$ for a lifetime $\tau$ [8, 9], and a sharp level only for a state that does not decay [7].

### 7.3 The parity of a wave, with its energy

A plane gravitational wave has two polarisations, plus and cross. Parity reverses the cross polarisation and keeps the other. In the classical description that exchanges the two helicities, and the model reads a wave with a cross part and its mirror as such a pair. Parity is an involution (`parity_involutive`) and fixes a wave exactly when the wave has no cross part (`parity_fixed_iff_no_cross`). The energy of the wave is the sum of the squares of its polarisations, and parity keeps it (`parity_keeps_the_energy`).

**Theorem (`every_parity_kept_reading_counts_only_the_plus_waves`).** A configuration of waves closed under parity and counted by a reading parity keeps holds only waves with no cross part.

**Theorem (`the_two_helicities_are_two_on_one_energy`).** A wave with a cross part and its mirror are two waves, and the energy reads them alike.

The model is two integers, and parity as the fold is the fourth premise. Nothing here is a statement about a quantum of the wave.

### 7.4 One term

`generalized_quantization` binds six clauses with nothing before the colon. (I) On every seat, form and witness make every existent one point, on the line. (II) A witnessed configuration has as many registrations as existents. (III) In a folded configuration every existent holds its registration whole or by halves. (IV) In a folded configuration one existent off the line ends the count. (V) In a configuration closed under the particle map what gravity counts is neutral, and a charged particle is two on one reading. (VI) A configuration closed under the time mirror is quantized by its levels exactly when every member is stationary, and a decaying mode is two on one level.

## 8. Any Symmetry, and the Finest Registration

### 8.1 Any family of maps

Sections 2 to 6 use one fold, an involution. Nothing in the triaxial argument needs that. Let $\Phi$ be any family of maps of $X$. No structure is asked of it: the maps need not be invertible, and the family need not be closed under composition. A reading is *kept* when every map of the family keeps it. A reading *counts* a configuration when it gives no two of its members the same value; the configuration is then quantized by that reading, in the sense of Section 1.4. The *orbit map* sends a point to its orbit, the class obtained by identifying each point with each of its images.

**Theorem (`the_orbit_map_is_a_registration`, `every_registration_factors_through_the_orbit_map`).** Every map of the family keeps the orbit map, and every kept reading, with values in any set, is a function of the orbit map.

**Theorem (`a_registration_counts_only_if_the_orbit_map_counts`).** If a kept reading counts a configuration, the orbit map counts it.

The orbit map is itself a kept reading. So some kept reading counts a configuration exactly when the orbit map does, and the question of what any kept reading can count, one already written or one not yet written, is the question of what one object counts.

**Theorem (`form_and_witness_put_every_existent_on_the_fixed_set`, `one_moved_existent_ends_every_count`).** If a configuration is closed under every map of the family and a kept reading counts it, every member is fixed by every map. A configuration that holds a point and one of its images, the two being two, is counted by no kept reading.

The fold of Sections 2 to 6 is the family of one involution. A group acting on the set, two folds taken together, and a family of gauge maps are other cases, and none needs a further theorem. A registration counts at most one point of each orbit.

### 8.2 Identical quanta

Take $n$ quanta, each assigned a mode. An assignment is a function from the $n$ labels to the modes. The family is the relabellings: every permutation of the labels. The occupation number of a mode is the number of quanta in it.

**Theorem (`relabelling_keeps_the_occupation_numbers`).** The occupation numbers are a kept reading of the relabellings.

**Theorem (`fixed_by_every_relabelling_iff_one_mode`, `the_occupation_numbers_count_only_one_mode`).** An assignment is fixed by every relabelling exactly when all its quanta are in one mode. A configuration of assignments closed under relabelling and counted by the occupation numbers holds only such assignments.

**Theorem (`quanta_in_two_modes_are_many_on_one_occupation`).** Exchanging two quanta that sit in different modes gives a second assignment with the same occupation numbers.

A labelled assignment with quanta in two modes is therefore not what the occupation numbers count: it is many on one registration. That identical quanta are counted by their occupation numbers and not by their labels is the classical counting [15], and it is the case of Section 8.1 for the relabellings. One statement is not proved here: that the occupation numbers are the finest registration of the relabellings, so that two assignments with the same occupation numbers are relabellings of one another.

## 9. Where Isolated Values Come From

The definition of Section 1.4 does not make the values of a registration isolated. This section proves one case in which they are, from a hypothesis that contains no discreteness.

**Theorem (`a_label_of_a_periodic_symmetry_is_a_root_of_one`).** Let $T$ be a linear map of a vector space over a field, with $T^n$ the identity. If $Tv = \lambda v$ for a nonzero $v$, then $\lambda^n = 1$.

**Theorem (`a_symmetry_of_period_n_has_at_most_n_labels`).** In a field, a finite set of elements $\lambda$ with $\lambda^n = 1$, for $n > 0$, has at most $n$ members.

The label $\lambda$ is the registration the symmetry gives the state $v$. The symmetry keeps it, since $Tv$ has the label of $v$. The field may be the complex numbers, a continuum. The only number in the hypotheses is the period. The conclusion is that the labels are isolated and at most $n$. Here the isolation of the values is derived from the period of the symmetry. It is not assumed.

The case with no finite period is not proved here. For a rotation through any angle the labels are the whole numbers of a full turn; that is classical and is not formalised in this paper.

## 10. Every Algebraic Quantization on the Seat

### 10.1 The adjoint is a fold

By an algebraic quantization this paper means a construction that ends in an algebra of quantities with an adjoint: a ring with an involution that reverses products. The operators on a Hilbert space, the matrix algebras and the operator algebras of the classical theory [17] are of this kind. The kernel of Appendix C does not treat one such algebra. It is proved for every ring with an adjoint, so an algebra constructed before this paper or after it is a case of it.

The fold is the adjoint. The line is the self-adjoint elements, which such a theory calls its observables. The real part, $a + a^*$, is kept by the adjoint (`the_adjoint_keeps_the_real_part`), so it is a registration.

**Theorem (`the_observables_are_the_atoms`).** In any ring with an adjoint, let a reading with values in any set be kept by the adjoint. A configuration that holds the adjoint of each of its members and is counted by the reading holds only self-adjoint members.

**Theorem (`quantized_by_the_real_part_iff_observables`).** In a ring with an adjoint and with no element of additive order two, a configuration that holds the adjoint of each of its members is counted by the real part exactly when every member is self-adjoint.

### 10.2 The commutator and the line

**Theorem (`the_adjoint_reverses_the_commutator`, `the_real_part_reads_no_commutator`).** Let $a$ and $b$ be self-adjoint. Then $(ab - ba)^* = -(ab - ba)$, and the real part of $ab - ba$ is zero.

**Theorem (`observables_with_an_observable_commutator_commute`, `a_commutator_and_its_adjoint_are_two_on_one_registration`, `no_kept_reading_counts_the_commutator_with_its_adjoint`).** Let the ring have no element of additive order two, and let $a$ and $b$ be self-adjoint. If $ab - ba$ is self-adjoint, then $ab = ba$. If $ab \neq ba$, the commutator and its adjoint are two, they have one real part, and no reading the adjoint keeps counts a configuration that holds both.

By the classical rule [10], what a canonical quantization adds to an algebra of commuting quantities is a commutator of observables that is not zero. The theorem places a commutator of observables that is not zero, in a ring with no element of additive order two: it is off the line, and with its adjoint it is two on one registration. The size of the commutator is not fixed by anything here, and no constant is derived.

**Theorem (`no_canonical_pair_in_finite_matrices`).** Over a field of characteristic zero, no two square matrices of a nonzero finite size have a commutator that is a nonzero multiple of the identity.

This is the trace argument, compiled. It is the finite case of the classical result that a canonical pair cannot be bounded [16]: a canonical pair needs infinitely many dimensions. `every_algebraic_quantization_is_a_seat` binds the statements of Sections 10.1 and 10.2 that hold in every ring with an adjoint, with nothing before the colon but the ring.

### 10.3 The spectral seat

A form on a vector space over a field with a conjugation is a pairing of states that takes a scalar out of its second place unchanged and out of its first place conjugated; additivity is not needed and is not assumed. An operator is symmetric under the form when it can be moved from one place to the other.

**Theorem (`the_registrations_of_an_observable_are_on_the_line`).** Let $T$ be symmetric under a form. If $Tv = \lambda v$ and the pairing of $v$ with itself is not zero, then $\lambda$ is fixed by the conjugation.

**Theorem (`states_with_different_registrations_are_orthogonal`).** Let $T$ be symmetric under a form, with $Tu = \mu u$ and $Tv = \lambda v$, $\mu$ fixed by the conjugation and $\mu \neq \lambda$. Then the pairing of $u$ with $v$ is zero.

The registration an observable gives a state is its eigenvalue. The first theorem puts it on the line of the conjugation. The second says that the registration tells states apart, and that the form reads the difference as no overlap. Both are classical for operators on a Hilbert space [17]; here they are proved for every form of the stated kind. They join Section 7.2: in the classical description of a decaying state [9], the rate is the part of the energy the conjugation reverses, and a stationary state is a state whose energy is on that line.

### 10.4 What is subsumed and what is not

The statements of this section hold for every ring with an adjoint and every form of the stated kind. A quantization whose quantities form such a ring is therefore a case of them, whenever it was or will be constructed: its observables are the line of the adjoint; its commutators of observables, where they are not zero and the ring has no element of additive order two, are off the line in pairs; and, for its operators symmetric under a form of the stated kind, the eigenvalues on states of nonzero norm are on the line of the conjugation. Nothing more is proved of it. Its particular algebra, its states, its dynamics and the size of its commutators are its own, and no result of any particular quantization is derived or refuted here. A scheme that forms no ring with an adjoint is outside this section until it forms one.

## 11. The Numerical Twin

The twin of Appendix D checks the statements by exhaustion on small cases. It is in integer arithmetic throughout.

| Part | What is enumerated | Checks |
|---|---|---|
| A | The 270 seats on 4 points with a registration into 3 values, 27 of them vacant, and the 16 configurations of each | Form and witness put every existent on the line; a witnessed configuration has as many registrations as existents; each existent of a folded configuration is whole or by halves; one existent off the line ends the count; on a vacant seat a witnessed existent stands alone; on a seat whose registration tells apart its line, which the twin calls faithful, a folded configuration is witnessed exactly when on the line |
| B | The 162 particles with charges in $\{-1, 0, 1\}$ and frequency in $\{0, 1\}$: 2 neutral and 160 charged | The particle map fixes exactly the neutral; gravity counts the pair exactly when it is neutral; a charged particle is two on one reading |
| C | The 18 modes with one charge in $\{-1, 0, 1\}$, frequency in $\{0, 1\}$ and rate in $\{-1, 0, 1\}$: 6 stationary and 12 decaying | The time mirror fixes exactly the stationary; the level tells the stationary apart; a decaying mode is two on one level |
| D | The 64 configurations of a seat of 6 points | Recording is one step; a configuration is its own record exactly on the line |
| E | The 729 pairs of maps of 3 points, no structure asked of them, with every reading into 2 values they keep | Every kept reading factors through the orbit map; a configuration closed under both maps and counted lies on their fixed set |
| F | The 64 configurations of 10 particles closed under the particle map | Matter with its antimatter is neutral as a whole |
| G | The periods 1 to $p-1$ in arithmetic modulo the primes 5, 7, 11, 13 and 17 | A symmetry of period $n$ has at most $n$ labels |
| H | The 49 waves with polarisations from $-3$ to $3$ | Parity is an involution, fixes the waves with no cross part and keeps the energy; the two helicities are two on one energy |
| I | The 8 assignments of 3 quanta to 2 modes and their 6 relabellings | Relabelling keeps the occupation numbers; an assignment is fixed by every relabelling exactly when in one mode |
| J | The 6561 pairs of 2 by 2 matrices with entries $-1$, 0, 1, the transpose as the adjoint | No commutator is a nonzero multiple of the identity; for two symmetric matrices the adjoint reverses the commutator |

Twenty-four checks pass and none fails.

**The measurements.** The first bears on the first premise, the third on the second, and the second on the two together. The ratio of charge to mass of the antiproton equals that of the proton to 16 parts in $10^{12}$ [4]. Antihydrogen released in a vertical trap falls toward the Earth with an acceleration of $0.75 \pm 0.13 \pm 0.16$ in units of $g$ [5], which is within $1.2$ of its combined uncertainties of the value for matter and $8.5$ of them from the opposite sign. Bodies of titanium and of platinum fall alike to parts in $10^{15}$ [6].

Four limits are stated. Part G is in arithmetic modulo a prime, where the theorem is for every field, and Part J takes the transpose as the adjoint. The twin enumerates small cases and the theorems are for every seat. Part C carries one charge where the model carries four. And no number of the twin enters any proof.

## 12. Discussion: The Reading

The derivation above uses a set, an involution and a map the involution keeps. This section states where the premises come from and marks what is theorem and what is premise.

**Why a fold.** Each of the three folds of Section 7 is a symmetry that physics already has: the exchange of a particle with its antiparticle [1, 3], the reversal of time on the rate of a mode, and the parity of a wave. That nature has them is premise. What the paper proves is what any such fold forces on a count.

**Why a registration is what the fold keeps.** A reading that is to be a registration of a symmetry cannot depend on which side was read. The energy is such a reading for the particle map, and the level is one for the time mirror. The charges are not, and the file proves it. The premise is that gravity reads the frequency of the energy and nothing else; that it reads nothing of the charges is the equivalence of the two masses and is measured [6].

**What is new and what is not.** The triaxial theorem is one line, and it is not new to this paper: the files of the Lean Library Reference carry it. What this paper adds, from its first edition, is the statement of what it makes of the members: atoms, counted by the registration, with the complement that in a folded configuration an existent off the line is two on one registration, and the reading of both on the particle map and the time mirror. This edition adds that the argument needs no involution and holds for any family of maps, with the orbit map as the one registration every other factors through; that the isolation of the labels of a linear symmetry of finite period is a conclusion; and that every ring with an adjoint is a seat on which a commutator of two observables that is not zero stands off the line, where the ring has no element of additive order two. That a neutral particle is its own antiparticle [11], that antimatter falls [5], and that a decaying state has a width [8] were known.

**What the paper does not claim.** It does not derive Planck's constant or any level of any atom [7, 12]. It does not quantize a field by Dirac's rule [10], and it does not say whether the field of gravity is or is not quantized in that sense; no experiment has decided that. It does not derive the size of any commutator, and it does not derive or refute any result of a particular quantization (Section 10.4). It does not prove that the occupation numbers are the finest registration of identical quanta (Section 8.2), and it does not treat a linear symmetry with no finite period (Section 9). It claims that on every seat form and witness make atoms counted by the registration, that in a folded configuration the count fails wherever an existent stands off the line, and that gravity, the level and the energy of a wave are three registrations of physics on which this is read.

## 13. Predictions, Falsifiers, and What Stands

The paper derives no constant and predicts no measurement that present physics does not. Its commitments are those of its premises, and they are stated here as commitments.

### 13.1 Two predictions that will stand

1. **Gravity does not tell a particle from its antiparticle.** `a_charged_particle_is_two_on_one_reading` gives it on the premises. The prediction is that antimatter falls as matter does, at every precision, and that no gravitational measurement separates a charged particle from its antiparticle.
2. **A state that decays has no sharp level.** `a_decaying_mode_is_two_on_one_level` and `the_levels_are_the_stationary` give on the premises that a decaying mode has no level of its own. The file carries no constant, so a width is not derived in the file; the classical relation [8, 9] reads the rate as the width of the line. With that relation the prediction is that every unstable state has a line of nonzero natural width, and that a level is sharp only for a state that does not decay.

### 13.2 Two proposals that will fail

1. **Antigravity of antimatter.** A proposal in which antimatter is repelled by matter makes the reading of gravity odd under the particle map. On the premises it is even, and the measurement of Section 11 lies $8.5$ uncertainties from repulsion.
2. **A count of charged matter by gravity alone.** A proposal that reads the number of particles in a body from its weight alone, with matter and antimatter both present, is refused by `matter_with_antimatter_is_not_counted_by_gravity`.

### 13.3 The two falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, or the premises as the law of nature, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment's printed uncertainties.

1. **Antimatter that falls at a rate different from matter.** It refutes premise one or premise two, through `a_charged_particle_is_two_on_one_reading`.
2. **A state of finite lifetime with a natural line narrower than $\hbar/\tau$, with no selection on the time of decay.** It refutes premise three as the classical relation reads it [8, 9], the rate of the energy being the width of the line. The bound $\hbar/\tau$ is that relation's and is not derived in the file. The theorem that carries the consequence is `a_decaying_mode_is_two_on_one_level`.

The fourth premise, on the wave, is the classical account of a gravitational wave and is tested where that account is tested. This paper states no falsifier of its own for it, and no prediction of Section 13.1 rests on it.

Apart from them stands the formal claim, which no observation touches and one compilation settles: every theorem named in this text prints its axioms in Appendix F, and a line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved.

### 13.4 What kind of result this is

It is not a new physics. It is one theorem about counting, proved for every seat, every family of maps and every ring with an adjoint, and three seats of physics on which, on the premises, it is read. The implication from the seat to the atoms and their count is checked by the Lean kernel, and no experiment alters an implication. Experiment remains free to test whether nature has the folds and the registrations of Section 7, and that is all it can test here. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and they are printed in Section 1.2 for that purpose.

## 14. Part II · The Reading

*This part is the reading from which the paper takes its place in the series. It is premise-grade. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 11 depends on it. The theorem names set in code in this part are theorems of Appendix A; what the reading says of them beyond their statements is the reading's.*

### 14.1 Being Is Atomic

The theorems of Part I say that an existent with form and witness is one point, its own partner, with a registration no other existent has. The reading is that this is what it is to be one: a being is atomic, and it is counted by what registers it. On this reading the word quantized names no special property of the small. It names existence with form and witness, on any seat.

The complement is read the same way. In a folded configuration an existent off the line is two on one registration (`off_the_line_an_existent_is_two`). The reading is that what is two has not yet been counted as one: the pair holds its registration by halves, and no registration that the fold keeps can make it a unit.

### 14.2 The Line Is the One Continuum

On a seat whose registration lands in the seat itself, the registration takes its values on the line (Section 6), and nothing in the theorems makes those values isolated. The reading is that the line is the one thing that is continuous, the shared chain on which every registration falls, and that everything counted on it is counted in whole units. The atoms are many and the line is one. This is a reading: the kernel proves that the existents are counted by their registrations (`the_count_is_the_count_of_registrations`) and proves nothing about the continuity of any line.

### 14.3 The Prior, the Posterior and the Step

On the seats of Section 6, recording completes in one step (`recording_is_one_step`), and a configuration is its own record exactly on the line (`self_recorded_iff_on_the_line`). The reading names the configuration before recording the prior and its record the posterior. On the line the prior is the posterior, and the only gap left is between one existent and the next, which is a gap of registration. Off the line the step alters the prior, once and for good, and where the prior held a point with its partner nothing restores it from the record.

The reading goes one step further, and here it is premise alone: that this one whole step is what a moment is, and that a time made of such steps is counted and not continuous. No theorem of this paper derives a discrete time. The step is proved to be whole; that time is made of steps is not proved, and a theorem in which a discrete time comes out of the atom, and is not put in, would be needed to raise it.

### 14.4 Gravity, Time and the Substrate

Section 7 reads the theorem on three folds. The reading extends it: that every registration of physics which a fold keeps counts what stands on that fold's line, and that gravity, time and whatever underlies them are quantized in this one sense and by this one theorem. The three cases of Section 7 are proved in models. Section 10 meets the algebraic case in general, by theorem: for every quantization whose quantities form a ring with an adjoint, the fold is the adjoint, the line is the observables and the real part is a registration. The rest of the extension is premise: that the dynamics and the constants of such a theory are read on its seat as well.

What would count against the extension is stated plainly: an established quantization whose quantities form no ring with an adjoint and for which no fold and no registration the fold keeps can be exhibited. For it the extension would be false, and the theorems of Part I would stand as they are.

### 14.5 A Discreteness the Object Has

The record of the programme separates, from its first deposit (Islam, 2026b), two kinds of boundary: one the observer imposes by a choice of categories, there called an observer-imposed discretization, and one grounded in a structural discontinuity of the domain itself. Section 9 is read on that separation. The labels of a linear symmetry of period $n$ are isolated, and nothing isolates them but the period: no reader supplies the boundary. The reading is that quantization, in the sense of this paper, is a discreteness the object has and not one laid on it.

A later edition of the same record calls the coordinate layer of arithmetized geometry a sedimentation over a recognition that comes first. The reading here is of the same kind: the theorems of Sections 3 and 8.1 have no number in their hypotheses, and the isolated labels of Section 9 come out of a period. This subsection is a reading. Appendix G lists where each of these terms is on the public record, at the grade its own record carries.

## 15. Closure

Counting has a theorem. From a set, an involution and a map the involution keeps, and nothing more, Lean 4 with Mathlib compiles that form and witness make every existent one point, its own partner; that such a configuration, quantized by its registration, has as many registrations as existents; that in a folded configuration every existent holds its registration whole or by halves; that in such a configuration one existent off the line ends the count; that on a seat whose registration tells apart its line, quantized and on the line are one condition; that on a vacant seat a quantized existent stands without its partner; and that, where registering twice is registering once, recording is one step, with a configuration its own record exactly on the line where the registration fixes exactly the points of the line. No axiom is declared. Every proof is complete.

The theorem is wider than one fold. For any family of maps, with no structure asked of it, the orbit map is a registration through which every other registration factors, so what any registration can count is what that one map counts; and a configuration closed under the family and counted by a kept reading lies on its fixed set. A finite configuration closed under a fold has zero total of every reading the fold reverses, where its values have no element of order two. A label of a linear symmetry of period $n$, on a vector space over a field, is an $n$-th root of one, and there are at most $n$: the isolation of those values is a conclusion. In every ring with an adjoint the observables are the line, the commutator of two observables is reversed by the adjoint, and where it is not zero and the ring has no element of additive order two it stands off the line with its adjoint, two on one registration; over a field of characteristic zero no two finite matrices form a canonical pair. For an operator symmetric under a form, a registration on a state of nonzero norm is fixed by conjugation, and two such states with different registrations are orthogonal. Every algebraic quantization, constructed before this paper or after it, is a case of the statements on the ring as soon as its quantities form a ring with an adjoint.

The theorem is read on three folds of physics. On the particle map, with the reading of gravity as the registration, in a configuration of matter with its antimatter gravity counts only the neutral, and it reads a charged particle and its antiparticle as one. On the time mirror, with the level as the registration, a configuration closed under the mirror is counted by its levels exactly when every member is stationary, and a decaying mode is two on one level. On the parity of a gravitational wave, with its energy as the registration, the two helicities are two on one energy. A finite configuration of matter with its antimatter is neutral as a whole. The numerical twin enumerates 270 seats on four points, 162 particles and 18 modes, with the small cases of the wider results, and finds every statement holding in every case, in 24 checks. Two measurements stand beside the first fold: the antiproton has the ratio of charge to mass of the proton to 16 parts in $10^{12}$, and antihydrogen falls toward the Earth.

Every boundary is in plain sight. That nature has a particle map that keeps the energy is one premise. That gravity reads the frequency of the energy alone is a second. That a mode has a frequency and a rate, with the mirror of time reversing the rate, is a third. That a gravitational wave has two polarisations, with parity reversing one, the energy the sum of their squares, and a wave with a cross part and its mirror the two helicities, is a fourth. The wider results have no physical premise. The model carries four charges and integer energies, and a charge it does not carry is outside it. The word quantized is one printed definition: the registration is one-to-one on the configuration. No commutation relation, no constant and no isolation of values is claimed, and whether any field is quantized by Dirac's rule is not decided here. No constant is derived, the size of no commutator is fixed, and no result of any particular quantization is derived or refuted. The isolation of values is proved for a linear symmetry of finite period and for no other. That the occupation numbers are the finest registration of identical quanta is not proved.

Two things are therefore separate, and the paper keeps them separate. Inside the kernel, the implication from the seat to the atoms and their count is a mathematical certainty. No experiment, no consensus and no later revision of physics alters it, and anyone can recheck it with one compilation. Outside the kernel stand two falsifiers. They test whether nature satisfies the premises, and so far nature does. What survives both is not opinion. It is a theorem, and a physics that has met every test of its premises.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean files and the Fortran twin are written by a language model under the author's direct supervision. Every theorem named in the text of Sections 1 to 13 and 15 is in Appendix A, B or C under that name, and its kernel line is printed in Appendix F. Classical results and measurements that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are counts of enumerated cases, and the measured values of Section 11 are quoted from their sources.

**The seat.** The seat is elementary: a set, an involution and a map the involution keeps. In the plane it is a reflection and the line it fixes, studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. P. A. M. Dirac, Proc. R. Soc. A 126 (1930) 360.
2. C. D. Anderson, Phys. Rev. 43 (1933) 491.
3. G. Lüders, Ann. Phys. 2 (1957) 1.
4. M. J. Borchert et al., Nature 601 (2022) 53.
5. E. K. Anderson et al., Nature 621 (2023) 716.
6. P. Touboul et al., Phys. Rev. Lett. 129 (2022) 121102.
7. N. Bohr, Philos. Mag. 26 (1913) 1.
8. V. Weisskopf and E. Wigner, Z. Phys. 63 (1930) 54.
9. G. Gamow, Z. Phys. 51 (1928) 204.
10. P. A. M. Dirac, Proc. R. Soc. A 109 (1925) 642.
11. E. Majorana, Nuovo Cimento 14 (1937) 171.
12. M. Planck, Ann. Phys. 4 (1901) 553.
13. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
14. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
15. S. N. Bose, Z. Phys. 26 (1924) 178.
16. A. Wintner, Phys. Rev. 71 (1947) 738.
17. J. von Neumann, Mathematische Grundlagen der Quantenmechanik (Springer, 1932).
18. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
19. M. F. Islam, Trisduction: The Geometry of Convergent Epistemic Warrant, first and third editions (2026b).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its engine uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main. The first two carry the first theorem of this paper on their own seats.

20. The seat, with the atoms as its Part XIX: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_46_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.
21. The vacant seat, with the atoms as its Part Z: FINAL_BINDING/PNP Binding/PNP_Normal_Form_Paper_v1_16_0_CC.lean. Compiled alone in core Lean 4.19.0, exit 0.
22. Least Erasure: protocols/RH One Bit/Nothing Escapes Three Plus One/Least_Erasure.lean. Compiled alone in core Lean 4.19.0, exit 0.
23. Root Axiom and Existence: Publication Library/Philosophy/Metaphysics/Root Axiom/TOE_Zero.lean. Compiled alone in core Lean 4.19.0, exit 0.

## Appendix A · SPHYS_Quantization_Forced_CC.lean

One fold. Lean 4.19.0 with Mathlib 4.19.0. 29 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent. The kernel lines are Appendix F.

```lean
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
```

## Appendix B · SPHYS_Quantization_II_CC.lean

Any family of maps, identical quanta, the odd reading, the periodic labels, the spectral seat and the wave. 21 theorems, no axiom declared, no `sorry`, exit 0 with no warning, every cone pinned.

```lean
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Algebra.Module.LinearMap.End
import Mathlib.Algebra.Star.Basic
import Mathlib.GroupTheory.Perm.Basic
import Mathlib.Tactic.Ring

/-! # SPHYS_Quantization_II_CC.lean · GENERALIZED QUANTIZATION, SECOND KERNEL (26 November 2026, _CC)

RATIONALE. The first kernel proves the theorem for one fold, an involution. This kernel widens it from first
  principles, each part answering a limit the first edition names of itself.
DESIGN.
  Part I   ANY SYMMETRY, AND THE FINEST REGISTRATION. The fold is replaced by any family of maps of the set, with no
           structure asked of it: an involution, a group, a gauge family are all cases. The orbit map is proved to
           be a registration through which every other registration factors.
  Part II  IDENTICAL QUANTA. The maps are the relabellings of n quanta; the occupation numbers are kept; the fixed
           configurations are those with every quantum in one mode.
  Part III AN ODD READING SUMS TO ZERO. A finite configuration closed under a fold has zero total of every reading
           the fold reverses, where the values have no element of order two. For particles: matter with its
           antimatter is neutral as a whole.
  Part IV  WHERE ISOLATED VALUES COME FROM. A label of a linear symmetry of period n is an n-th root of one, and
           there are at most n of them. The isolation of the values is derived from the period. It is not assumed.
  Part V   THE SPECTRAL SEAT. For an operator symmetric under a form, every registration (eigenvalue) on a state of
           nonzero norm is fixed by conjugation, and two such states with different registrations are orthogonal.
  Part VI  GRAVITY'S WAVE. Two polarisations, parity as the fold, the energy as the registration.
STANDING. Parts I to V are proved for every set, family, ring, field, module and form of the stated kind. Parts
  III (particles) and VI are proved in printed models.
WHAT IS NOT CLAIMED. No constant is derived. Part IV derives that the labels of a linear symmetry of finite period
  are isolated and at most n; it does not derive which symmetry nature has. Part V does not construct any operator.
RISK. Part II proves that the occupation numbers are kept and where relabelling fixes a configuration; it does not
  prove that the occupation numbers are the finest registration of the relabellings.
NON-NEGOTIABLE. No axiom declared, no `sorry`, every cone pinned at the end of the file. -/

set_option autoImplicit false

namespace SPHYS.QuantizationII

/-- A reading counts a configuration when it gives no two members the same value. -/
def Counts {X Y : Type} (r : X → Y) (S : X → Prop) : Prop := ∀ a b, S a → S b → r a = r b → a = b

/-! ## PART I · ANY SYMMETRY, AND THE FINEST REGISTRATION -/
section Moves
variable {X ι : Type} (Φ : ι → X → X)

/-- The orbits: the set with every point identified with each of its images. -/
def Orb : Type := Quot (fun a b : X => ∃ i, b = Φ i a)

/-- The orbit map. -/
def orb (a : X) : Orb Φ := Quot.mk _ a

/-- THE ORBIT MAP IS A REGISTRATION: every map of the family keeps it. -/
theorem the_orbit_map_is_a_registration (i : ι) (a : X) : orb Φ (Φ i a) = orb Φ a :=
  (Quot.sound ⟨i, rfl⟩).symm

/-- EVERY REGISTRATION FACTORS THROUGH THE ORBIT MAP. Whatever the reading and whatever its values. -/
theorem every_registration_factors_through_the_orbit_map {Y : Type} (r : X → Y)
    (kept : ∀ i a, r (Φ i a) = r a) : ∃ f : Orb Φ → Y, ∀ a, r a = f (orb Φ a) :=
  ⟨Quot.lift r (fun a b ⟨i, h⟩ => by rw [h, kept]), fun _ => rfl⟩

/-- A REGISTRATION COUNTS ONLY IF THE ORBIT MAP COUNTS. One object stands for every reading, present or future. -/
theorem a_registration_counts_only_if_the_orbit_map_counts {Y : Type} (r : X → Y)
    (kept : ∀ i a, r (Φ i a) = r a) (S : X → Prop) (count : Counts r S) : Counts (orb Φ) S := by
  obtain ⟨f, hf⟩ := every_registration_factors_through_the_orbit_map Φ r kept
  intro a b ha hb h
  exact count a b ha hb (by rw [hf a, hf b, h])

/-- FORM AND WITNESS PUT EVERY EXISTENT ON THE FIXED SET OF THE WHOLE FAMILY. -/
theorem form_and_witness_put_every_existent_on_the_fixed_set {Y : Type} (r : X → Y)
    (kept : ∀ i a, r (Φ i a) = r a) (S : X → Prop) (form : ∀ i a, S a → S (Φ i a)) (count : Counts r S) :
    ∀ a, S a → ∀ i, Φ i a = a :=
  fun a ha i => count _ _ (form i a ha) ha (kept i a)

/-- ONE MOVED EXISTENT ENDS EVERY COUNT. A configuration that holds a point and one of its images, the two being
    two, is counted by no registration. A registration counts at most one point of each orbit. -/
theorem one_moved_existent_ends_every_count {Y : Type} (r : X → Y) (kept : ∀ i a, r (Φ i a) = r a)
    (S : X → Prop) (a : X) (ha : S a) (i : ι) (hm : S (Φ i a)) (off : Φ i a ≠ a) : ¬ Counts r S :=
  fun count => off (count _ _ hm ha (kept i a))

end Moves

/-! ## PART II · IDENTICAL QUANTA -/
section Quanta
variable {n : ℕ} {M : Type}

/-- Relabelling n quanta: the same assignment of modes, read through a permutation of the labels. -/
def relabel (π : Equiv.Perm (Fin n)) (x : Fin n → M) : Fin n → M := fun i => x (π i)

/-- The occupation number of a mode: how many quanta are in it. -/
def occupation [DecidableEq M] (x : Fin n → M) (m : M) : ℕ := (Finset.univ.filter (fun i => x i = m)).card

/-- RELABELLING KEEPS THE OCCUPATION NUMBERS. -/
theorem relabelling_keeps_the_occupation_numbers [DecidableEq M] (π : Equiv.Perm (Fin n)) (x : Fin n → M) :
    occupation (relabel π x) = occupation x := by
  funext m
  unfold occupation relabel
  exact Finset.card_bij (fun i _ => π i) (fun i hi => by simpa using hi)
    (fun _ _ _ _ h => π.injective h)
    (fun j hj => ⟨π.symm j, by simpa using hj, by simp⟩)

/-- FIXED BY EVERY RELABELLING EXACTLY WHEN ALL QUANTA ARE IN ONE MODE. -/
theorem fixed_by_every_relabelling_iff_one_mode (x : Fin n → M) :
    (∀ π, relabel π x = x) ↔ ∀ i j, x i = x j := by
  constructor
  · intro h i j
    have e := congrFun (h (Equiv.swap i j)) i
    unfold relabel at e
    rw [Equiv.swap_apply_left] at e
    exact e.symm
  · intro h π
    funext i
    exact h _ _

/-- THE OCCUPATION NUMBERS COUNT ONLY ONE MODE. A configuration of assignments closed under relabelling and counted
    by the occupation numbers holds only assignments with every quantum in one mode. -/
theorem the_occupation_numbers_count_only_one_mode [DecidableEq M] (S : (Fin n → M) → Prop)
    (form : ∀ π x, S x → S (relabel π x)) (count : Counts (occupation (n := n) (M := M)) S) :
    ∀ x, S x → ∀ i j, x i = x j :=
  fun x hx => (fixed_by_every_relabelling_iff_one_mode x).mp
    (form_and_witness_put_every_existent_on_the_fixed_set relabel occupation
      relabelling_keeps_the_occupation_numbers S form count x hx)

/-- QUANTA IN TWO MODES ARE MANY ON ONE OCCUPATION. Exchanging two quanta that sit in different modes gives a
    second assignment with the same occupation numbers. -/
theorem quanta_in_two_modes_are_many_on_one_occupation [DecidableEq M] (x : Fin n → M) (i j : Fin n)
    (h : x i ≠ x j) :
    relabel (Equiv.swap i j) x ≠ x ∧ occupation (relabel (Equiv.swap i j) x) = occupation x :=
  ⟨fun e => h (by
      have t := congrFun e i
      unfold relabel at t
      rw [Equiv.swap_apply_left] at t
      exact t.symm),
   relabelling_keeps_the_occupation_numbers _ _⟩

end Quanta

/-! ## PART III · AN ODD READING SUMS TO ZERO -/

/-- AN ODD READING SUMS TO ZERO. In a finite configuration closed under an involution, every reading the involution
    reverses has total zero, where the values have no element of additive order two. -/
theorem an_odd_reading_sums_to_zero {X A : Type} [AddCommGroup A] (two : ∀ x : A, x + x = 0 → x = 0)
    (σ : X → X) (inv : ∀ a, σ (σ a) = a) (f : X → A) (odd : ∀ a, f (σ a) = -f a) (s : Finset X)
    (form : ∀ a ∈ s, σ a ∈ s) : ∑ a ∈ s, f a = 0 :=
  Finset.sum_involution (fun a _ => σ a)
    (fun a _ => show f a + f (σ a) = 0 by rw [odd, add_neg_cancel])
    (fun a _ hne (hfix : σ a = a) => hne (two _ (by
      have e := odd a
      rw [hfix] at e
      calc f a + f a = f a + -f a := by rw [← e]
        _ = 0 := add_neg_cancel _)))
    (fun a ha => form a ha) (fun a _ => inv a)

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

theorem bar_involutive (c : Particle) : bar (bar c) = c := by
  cases c; simp [bar]

/-- MATTER WITH ITS ANTIMATTER IS NEUTRAL AS A WHOLE. A finite configuration that holds the antiparticle of each
    member has every charge summing to zero. -/
theorem matter_with_its_antimatter_is_neutral_as_a_whole (s : Finset Particle) (form : ∀ c ∈ s, bar c ∈ s) :
    ∑ c ∈ s, c.q3 = 0 ∧ ∑ c ∈ s, c.colour = 0 ∧ ∑ c ∈ s, c.b3 = 0 ∧ ∑ c ∈ s, c.lepton = 0 :=
  have two : ∀ x : Int, x + x = 0 → x = 0 := fun x h => by omega
  ⟨an_odd_reading_sums_to_zero two bar bar_involutive _ (fun _ => rfl) s form,
   an_odd_reading_sums_to_zero two bar bar_involutive _ (fun _ => rfl) s form,
   an_odd_reading_sums_to_zero two bar bar_involutive _ (fun _ => rfl) s form,
   an_odd_reading_sums_to_zero two bar bar_involutive _ (fun _ => rfl) s form⟩

/-! ## PART IV · WHERE ISOLATED VALUES COME FROM -/
section Period
variable {K V : Type} [Field K] [AddCommGroup V] [Module K V]

/-- A LABEL OF A PERIODIC SYMMETRY IS A ROOT OF ONE. If a linear symmetry returns to the identity after n steps,
    every label it gives a nonzero state satisfies `label ^ n = 1`. -/
theorem a_label_of_a_periodic_symmetry_is_a_root_of_one (T : V →ₗ[K] V) (n : ℕ) (period : T ^ n = 1) (v : V)
    (hv : v ≠ 0) (lam : K) (h : T v = lam • v) : lam ^ n = 1 := by
  have key : ∀ k : ℕ, (T ^ k) v = lam ^ k • v := by
    intro k
    induction k with
    | zero => simp
    | succ k ih =>
      rw [pow_succ, Module.End.mul_apply, h, map_smul, ih, smul_smul]
      congr 1
      ring
  have e := key n
  rw [period, Module.End.one_apply] at e
  have z : (lam ^ n - 1) • v = 0 := by rw [sub_smul, one_smul, ← e, sub_self]
  rcases smul_eq_zero.mp z with h0 | h0
  · exact sub_eq_zero.mp h0
  · exact absurd h0 hv

/-- A SYMMETRY OF PERIOD n HAS AT MOST n LABELS. The values of its registration are isolated and counted by the
    period. Nothing discrete was assumed. -/
theorem a_symmetry_of_period_n_has_at_most_n_labels (n : ℕ) (hn : 0 < n) (L : Finset K)
    (hL : ∀ x ∈ L, x ^ n = 1) : L.card ≤ n := by
  classical
  have sub : L ⊆ Polynomial.nthRootsFinset n (1 : K) :=
    fun x hx => (Polynomial.mem_nthRootsFinset hn 1).mpr (hL x hx)
  refine (Finset.card_le_card sub).trans ?_
  rw [Polynomial.nthRootsFinset_def]
  exact (Multiset.toFinset_card_le _).trans (Polynomial.card_nthRoots n 1)

end Period

/-! ## PART V · THE SPECTRAL SEAT -/
section Spectral
variable {K V : Type} [Field K] [StarRing K] [AddCommGroup V] [Module K V]

/-- A form on states: a scalar comes out of the second place unchanged and out of the first conjugated. Additivity
    is not asked. -/
structure Form (K V : Type) [Field K] [StarRing K] [AddCommGroup V] [Module K V] where
  ip : V → V → K
  right : ∀ (u v : V) (c : K), ip u (c • v) = c * ip u v
  left : ∀ (u v : V) (c : K), ip (c • u) v = star c * ip u v

/-- THE REGISTRATIONS OF AN OBSERVABLE ARE ON THE LINE. For an operator symmetric under the form, the registration
    it gives a state of nonzero norm is fixed by conjugation. -/
theorem the_registrations_of_an_observable_are_on_the_line (B : Form K V) (T : V → V)
    (sym : ∀ u v, B.ip (T u) v = B.ip u (T v)) (v : V) (lam : K) (h : T v = lam • v)
    (norm : B.ip v v ≠ 0) : star lam = lam := by
  have e := sym v v
  rw [h, B.left, B.right] at e
  exact mul_right_cancel₀ norm e

/-- STATES WITH DIFFERENT REGISTRATIONS ARE ORTHOGONAL. The registration tells the states apart, and the form
    reads the difference as zero overlap. -/
theorem states_with_different_registrations_are_orthogonal (B : Form K V) (T : V → V)
    (sym : ∀ u v, B.ip (T u) v = B.ip u (T v)) (u v : V) (mu lam : K) (hu : T u = mu • u)
    (hv : T v = lam • v) (real : star mu = mu) (ne : mu ≠ lam) : B.ip u v = 0 := by
  have e := sym u v
  rw [hu, hv, B.left, B.right, real] at e
  have z : (mu - lam) * B.ip u v = 0 := by rw [sub_mul, e, sub_self]
  rcases mul_eq_zero.mp z with h0 | h0
  · exact absurd (sub_eq_zero.mp h0) ne
  · exact h0

end Spectral

/-! ## PART VI · GRAVITY'S WAVE -/

/-- A plane gravitational wave: its two polarisations. -/
structure Wave where
  plus : Int
  cross : Int
deriving DecidableEq

/-- Parity: the cross polarisation reversed. It exchanges the two helicities. -/
def parity (w : Wave) : Wave := ⟨w.plus, -w.cross⟩

/-- The energy of the wave: the sum of the squares of its two polarisations. -/
def waveEnergy (w : Wave) : Int := w.plus * w.plus + w.cross * w.cross

theorem parity_involutive (w : Wave) : parity (parity w) = w := by
  cases w; simp [parity]

theorem parity_fixed_iff_no_cross (w : Wave) : parity w = w ↔ w.cross = 0 := by
  cases w with
  | mk p c =>
    show (⟨p, -c⟩ : Wave) = ⟨p, c⟩ ↔ c = 0
    constructor
    · intro h
      have hc : -c = c := congrArg Wave.cross h
      omega
    · intro h; subst h; rfl

/-- PARITY KEEPS THE ENERGY OF THE WAVE. -/
theorem parity_keeps_the_energy (w : Wave) : waveEnergy (parity w) = waveEnergy w := by
  cases w; simp [waveEnergy, parity]

/-- EVERY READING PARITY KEEPS COUNTS ONLY THE WAVES WITH NO CROSS PART. -/
theorem every_parity_kept_reading_counts_only_the_plus_waves {Y : Type} (r : Wave → Y)
    (kept : ∀ w, r (parity w) = r w) (S : Wave → Prop) (form : ∀ w, S w → S (parity w))
    (count : Counts r S) : ∀ w, S w → w.cross = 0 :=
  fun w hw => (parity_fixed_iff_no_cross w).mp (count _ _ (form w hw) hw (kept w))

/-- THE TWO HELICITIES ARE TWO ON ONE ENERGY. A wave with a cross part and its mirror are two waves, and the
    energy reads them alike. -/
theorem the_two_helicities_are_two_on_one_energy (w : Wave) (h : w.cross ≠ 0) :
    parity w ≠ w ∧ waveEnergy (parity w) = waveEnergy w :=
  ⟨fun e => h ((parity_fixed_iff_no_cross w).mp e), parity_keeps_the_energy w⟩

end SPHYS.QuantizationII

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.QuantizationII.the_orbit_map_is_a_registration' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms SPHYS.QuantizationII.the_orbit_map_is_a_registration
/-- info: 'SPHYS.QuantizationII.every_registration_factors_through_the_orbit_map' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.QuantizationII.every_registration_factors_through_the_orbit_map
/-- info: 'SPHYS.QuantizationII.a_registration_counts_only_if_the_orbit_map_counts' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.QuantizationII.a_registration_counts_only_if_the_orbit_map_counts
/-- info: 'SPHYS.QuantizationII.form_and_witness_put_every_existent_on_the_fixed_set' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.QuantizationII.form_and_witness_put_every_existent_on_the_fixed_set
/-- info: 'SPHYS.QuantizationII.one_moved_existent_ends_every_count' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.QuantizationII.one_moved_existent_ends_every_count
/--
info: 'SPHYS.QuantizationII.relabelling_keeps_the_occupation_numbers' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.relabelling_keeps_the_occupation_numbers
/-- info: 'SPHYS.QuantizationII.fixed_by_every_relabelling_iff_one_mode' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.QuantizationII.fixed_by_every_relabelling_iff_one_mode
/--
info: 'SPHYS.QuantizationII.the_occupation_numbers_count_only_one_mode' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.the_occupation_numbers_count_only_one_mode
/--
info: 'SPHYS.QuantizationII.quanta_in_two_modes_are_many_on_one_occupation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.quanta_in_two_modes_are_many_on_one_occupation
/--
info: 'SPHYS.QuantizationII.an_odd_reading_sums_to_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.an_odd_reading_sums_to_zero
/-- info: 'SPHYS.QuantizationII.bar_involutive' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.QuantizationII.bar_involutive
/--
info: 'SPHYS.QuantizationII.matter_with_its_antimatter_is_neutral_as_a_whole' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.matter_with_its_antimatter_is_neutral_as_a_whole
/--
info: 'SPHYS.QuantizationII.a_label_of_a_periodic_symmetry_is_a_root_of_one' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.a_label_of_a_periodic_symmetry_is_a_root_of_one
/--
info: 'SPHYS.QuantizationII.a_symmetry_of_period_n_has_at_most_n_labels' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.a_symmetry_of_period_n_has_at_most_n_labels
/--
info: 'SPHYS.QuantizationII.the_registrations_of_an_observable_are_on_the_line' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.the_registrations_of_an_observable_are_on_the_line
/--
info: 'SPHYS.QuantizationII.states_with_different_registrations_are_orthogonal' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.states_with_different_registrations_are_orthogonal
/-- info: 'SPHYS.QuantizationII.parity_involutive' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.QuantizationII.parity_involutive
/-- info: 'SPHYS.QuantizationII.parity_fixed_iff_no_cross' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.QuantizationII.parity_fixed_iff_no_cross
/-- info: 'SPHYS.QuantizationII.parity_keeps_the_energy' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.QuantizationII.parity_keeps_the_energy
/--
info: 'SPHYS.QuantizationII.every_parity_kept_reading_counts_only_the_plus_waves' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationII.every_parity_kept_reading_counts_only_the_plus_waves
/-- info: 'SPHYS.QuantizationII.the_two_helicities_are_two_on_one_energy' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.QuantizationII.the_two_helicities_are_two_on_one_energy
```

## Appendix C · SPHYS_Quantization_Star_CC.lean

Every ring with an adjoint. 11 theorems, no axiom declared, no `sorry`, exit 0 with no warning, every cone pinned.

```lean
import Mathlib.Algebra.Star.Basic
import Mathlib.Tactic.Abel
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Algebra.CharZero.Defs

/-! # SPHYS_Quantization_Star_CC.lean · EVERY ALGEBRAIC QUANTIZATION IS A SEAT (26 November 2026, _CC)

RATIONALE. By an algebraic quantization is meant a construction that ends in an algebra of quantities with an
  adjoint: a ring `A` with an involution `star` that reverses products. Operators on a Hilbert space, matrix
  algebras, C*-algebras, von Neumann algebras and their crossed products, and Weyl algebras are all of this kind.
  This file does not treat one such construction. It quantifies over all of them, so a construction published before
  this file or after it is already inside the statements, on the one condition that its quantities form a star ring.
DESIGN. The fold is the adjoint. The line is the self-adjoint elements, which every such scheme calls its
  observables. A reading the adjoint keeps is a registration; the real part `re a = a + star a` is one. Part I: the
  observables are the atoms. Part II: the commutator of two observables, where it is not zero, is off the line; it
  and its adjoint are two on one registration, and no reading the adjoint keeps tells them apart. Part III: over a
  field of characteristic zero no canonical pair lives in finite matrices. Part IV: one term.
STANDING. Proved for every star ring; the two-way statements need that the ring has no element of order two under
  addition, written as the hypothesis `two`. Part III is for matrices over a field of characteristic zero.
WHAT IS NOT CLAIMED. No constant is derived: the size of a commutator is not fixed by anything here. No result of
  any particular quantization is proved or refuted: its algebra, its states and its dynamics are its own. What is
  proved is the place its structure takes on the seat.
RISK. A scheme whose quantities do not form a ring with an adjoint (a path integral taken as primitive, a purely
  geometric quantization before any algebra is formed) is outside these statements until it produces one.
NON-NEGOTIABLE. No axiom declared, no `sorry`. Nothing before the colon of the binding term but the ring itself.
  Every cone is pinned at the end of the file. -/

set_option autoImplicit false

namespace SPHYS.QuantizationStar

/-! ## PART I · THE OBSERVABLES ARE THE ATOMS -/
section Atoms
variable {A : Type} [Ring A] [StarRing A]

/-- A reading counts a configuration when it gives no two members the same value. -/
def Counts {X Y : Type} (r : X → Y) (S : X → Prop) : Prop := ∀ a b, S a → S b → r a = r b → a = b

/-- The real part, doubled: a quantity added to its adjoint. -/
def re (a : A) : A := a + star a

/-- THE ADJOINT KEEPS THE REAL PART. So the real part is a registration of the adjoint. -/
theorem the_adjoint_keeps_the_real_part (a : A) : re (star a) = re a := by
  unfold re; rw [star_star, add_comm]

/-- THE OBSERVABLES ARE THE ATOMS. In any star ring, for any reading the adjoint keeps, with values in any set:
    a configuration that holds the adjoint of each member and is counted by the reading holds only self-adjoint
    members. -/
theorem the_observables_are_the_atoms {Y : Type} (r : A → Y) (kept : ∀ a, r (star a) = r a)
    (S : A → Prop) (form : ∀ a, S a → S (star a)) (count : Counts r S) : ∀ a, S a → star a = a :=
  fun a ha => count (star a) a (form a ha) ha (kept a)

/-- THE REAL PART TELLS THE OBSERVABLES APART, where the ring has no element of additive order two. -/
theorem the_real_part_tells_the_observables_apart (two : ∀ x : A, x + x = 0 → x = 0) (a b : A)
    (ha : star a = a) (hb : star b = b) (h : re a = re b) : a = b := by
  unfold re at h; rw [ha, hb] at h
  have e : (a - b) + (a - b) = (a + a) - (b + b) := by abel
  rw [h, sub_self] at e
  exact sub_eq_zero.mp (two _ e)

/-- QUANTIZED BY THE REAL PART EXACTLY ON THE OBSERVABLES, where the ring has no element of additive order two. A
    configuration that holds the adjoint of each member
    is counted by the real part exactly when every member is self-adjoint. -/
theorem quantized_by_the_real_part_iff_observables (two : ∀ x : A, x + x = 0 → x = 0) (S : A → Prop)
    (form : ∀ a, S a → S (star a)) : Counts re S ↔ ∀ a, S a → star a = a :=
  ⟨fun count => the_observables_are_the_atoms re the_adjoint_keeps_the_real_part S form count,
   fun fx a b ha hb h => the_real_part_tells_the_observables_apart two a b (fx a ha) (fx b hb) h⟩

end Atoms

/-! ## PART II · THE COMMUTATOR AND THE LINE -/
section Commutator
variable {A : Type} [Ring A] [StarRing A]

/-- THE COMMUTATOR OF TWO OBSERVABLES IS REVERSED BY THE ADJOINT. -/
theorem the_adjoint_reverses_the_commutator (a b : A) (ha : star a = a) (hb : star b = b) :
    star (a * b - b * a) = -(a * b - b * a) := by
  rw [star_sub, star_mul, star_mul, ha, hb, neg_sub]

/-- THE REAL PART READS NO COMMUTATOR. The registration of the commutator of two observables is zero. -/
theorem the_real_part_reads_no_commutator (a b : A) (ha : star a = a) (hb : star b = b) :
    re (a * b - b * a) = 0 := by
  unfold re; rw [the_adjoint_reverses_the_commutator a b ha hb, add_neg_cancel]

/-- TWO OBSERVABLES WHOSE COMMUTATOR IS AN OBSERVABLE COMMUTE, where the ring has no element of additive order two. -/
theorem observables_with_an_observable_commutator_commute (two : ∀ x : A, x + x = 0 → x = 0) (a b : A)
    (ha : star a = a) (hb : star b = b) (hc : star (a * b - b * a) = a * b - b * a) : a * b = b * a := by
  have h := the_adjoint_reverses_the_commutator a b ha hb
  rw [hc] at h
  have e : (a * b - b * a) + (a * b - b * a) = 0 := by
    nth_rewrite 1 [h]; exact neg_add_cancel _
  exact sub_eq_zero.mp (two _ e)

/-- A CANONICAL PAIR IS A PAIR OFF THE LINE, where the ring has no element of additive order two. Where two
    observables do not commute, their commutator and its adjoint
    are two, and they have one registration. -/
theorem a_commutator_and_its_adjoint_are_two_on_one_registration (two : ∀ x : A, x + x = 0 → x = 0) (a b : A)
    (ha : star a = a) (hb : star b = b) (h : a * b ≠ b * a) :
    star (a * b - b * a) ≠ a * b - b * a ∧ re (star (a * b - b * a)) = re (a * b - b * a) :=
  ⟨fun hc => h (observables_with_an_observable_commutator_commute two a b ha hb hc),
   the_adjoint_keeps_the_real_part _⟩

/-- NO READING THE ADJOINT KEEPS COUNTS A CANONICAL PAIR'S COMMUTATOR WITH ITS ADJOINT, where the ring has no element
    of additive order two. Whatever the reading and
    whatever its values. -/
theorem no_kept_reading_counts_the_commutator_with_its_adjoint {Y : Type} (two : ∀ x : A, x + x = 0 → x = 0)
    (r : A → Y) (kept : ∀ a, r (star a) = r a) (a b : A) (ha : star a = a) (hb : star b = b)
    (h : a * b ≠ b * a) (S : A → Prop) (hc : S (a * b - b * a)) (hs : S (star (a * b - b * a))) :
    ¬ Counts r S :=
  fun count => (a_commutator_and_its_adjoint_are_two_on_one_registration two a b ha hb h).1
    (count _ _ hs hc (kept _))

end Commutator

/-! ## PART III · NO CANONICAL PAIR IN FINITE MATRICES -/

/-- NO CANONICAL PAIR IN FINITE MATRICES. Over a field of characteristic zero no two square matrices of a nonzero
    finite size have a commutator that is a nonzero multiple of the identity. A canonical pair needs infinitely
    many dimensions; this is the classical trace argument, compiled. -/
theorem no_canonical_pair_in_finite_matrices {n R : Type} [Fintype n] [DecidableEq n] [Nonempty n] [Field R]
    [CharZero R] (P Q : Matrix n n R) (c : R) (hc : c ≠ 0) : P * Q - Q * P ≠ c • (1 : Matrix n n R) := by
  intro h
  have t := congrArg Matrix.trace h
  rw [Matrix.trace_sub, Matrix.trace_mul_comm P Q, sub_self, Matrix.trace_smul, Matrix.trace_one,
    smul_eq_mul] at t
  rcases mul_eq_zero.mp t.symm with h0 | h0
  · exact hc h0
  · exact (Nat.cast_ne_zero.mpr Fintype.card_ne_zero) h0

/-! ## PART IV · ONE TERM -/

/-- EVERY ALGEBRAIC QUANTIZATION IS A SEAT. Nothing stands before the colon but the star ring itself. -/
theorem every_algebraic_quantization_is_a_seat :
    ∀ (A : Type) [Ring A] [StarRing A],
      (∀ a : A, star (star a) = a)
      ∧ (∀ a : A, re (star a) = re a)
      ∧ (∀ (Y : Type) (r : A → Y), (∀ a, r (star a) = r a) → ∀ S : A → Prop, (∀ a, S a → S (star a)) →
          Counts r S → ∀ a, S a → star a = a)
      ∧ (∀ a b : A, star a = a → star b = b → star (a * b - b * a) = -(a * b - b * a))
      ∧ (∀ a b : A, star a = a → star b = b → re (a * b - b * a) = 0)
      ∧ ((∀ x : A, x + x = 0 → x = 0) → ∀ a b : A, star a = a → star b = b → a * b ≠ b * a →
          star (a * b - b * a) ≠ a * b - b * a ∧ re (star (a * b - b * a)) = re (a * b - b * a)) :=
  fun _ _ _ => ⟨star_star, the_adjoint_keeps_the_real_part,
    fun _ r kept S form count => the_observables_are_the_atoms r kept S form count,
    the_adjoint_reverses_the_commutator, the_real_part_reads_no_commutator,
    fun two a b ha hb h => a_commutator_and_its_adjoint_are_two_on_one_registration two a b ha hb h⟩

end SPHYS.QuantizationStar

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.QuantizationStar.the_adjoint_keeps_the_real_part' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.QuantizationStar.the_adjoint_keeps_the_real_part
/-- info: 'SPHYS.QuantizationStar.the_observables_are_the_atoms' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.QuantizationStar.the_observables_are_the_atoms
/-- info: 'SPHYS.QuantizationStar.the_real_part_tells_the_observables_apart' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.QuantizationStar.the_real_part_tells_the_observables_apart
/-- info: 'SPHYS.QuantizationStar.quantized_by_the_real_part_iff_observables' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.QuantizationStar.quantized_by_the_real_part_iff_observables
/-- info: 'SPHYS.QuantizationStar.the_adjoint_reverses_the_commutator' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.QuantizationStar.the_adjoint_reverses_the_commutator
/-- info: 'SPHYS.QuantizationStar.the_real_part_reads_no_commutator' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.QuantizationStar.the_real_part_reads_no_commutator
/--
info: 'SPHYS.QuantizationStar.observables_with_an_observable_commutator_commute' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationStar.observables_with_an_observable_commutator_commute
/--
info: 'SPHYS.QuantizationStar.a_commutator_and_its_adjoint_are_two_on_one_registration' depends on axioms: [propext,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationStar.a_commutator_and_its_adjoint_are_two_on_one_registration
/--
info: 'SPHYS.QuantizationStar.no_kept_reading_counts_the_commutator_with_its_adjoint' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationStar.no_kept_reading_counts_the_commutator_with_its_adjoint
/--
info: 'SPHYS.QuantizationStar.no_canonical_pair_in_finite_matrices' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationStar.no_canonical_pair_in_finite_matrices
/-- info: 'SPHYS.QuantizationStar.every_algebraic_quantization_is_a_seat' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.QuantizationStar.every_algebraic_quantization_is_a_seat
```

## Appendix D · Quantization_Forced_Twin_CC.f90

Twenty-four checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix E.

```fortran
! Quantization_Forced_Twin_CC.f90 · numerical twin of the three kernels of edition 2.0.0
!   (SPHYS_Quantization_Forced_CC.lean, SPHYS_Quantization_II_CC.lean, SPHYS_Quantization_Star_CC.lean)
! RATIONALE. The Lean file proves its statements for every seat. This program checks them by exhaustion on small
!   seats and on a bounded range of the particle model, so that a reader can see each statement hold case by case.
! DESIGN. Part A: every seat on 4 points (10 involutions) with every registration into 3 values that the fold
!   keeps, and all 16 configurations. Part B: the particle map on charges in {-1,0,1} and frequency in {0,1}.
!   Part C: the time mirror on rates in {-1,0,1}. Part D: recording on the seat of 6 points, all 64 configurations.
!   Edition 2.0.0 adds: Part E any two maps of 3 points (no structure asked of them) with every reading they keep.
!   Part F total charge of every configuration closed under the particle map. Part G the labels of a symmetry of
!   period n in arithmetic modulo a prime. Part H the wave, parity and the energy. Part I identical quanta and the
!   occupation numbers. Part J the commutator of 2 by 2 integer matrices, with the transpose as the adjoint.
! RISK. A check that passes here proves nothing beyond the cases enumerated. No number printed by this program
!   enters any proof.
! NON-NEGOTIABLE. Integer arithmetic only. Every check prints its count of cases and its count of failures.
program quantization_twin
  implicit none
  integer :: nfail_total, nchk
  nfail_total = 0; nchk = 0
  call part_a(); call part_b(); call part_c(); call part_d()
  call part_e(); call part_f(); call part_g(); call part_h(); call part_i(); call part_j()
  write(*,'(A,I0,A,I0,A)') 'BATTERY {"checks":', nchk, ',"failures":', nfail_total, '}'
contains

  subroutine report(name, ncase, nfail)
    character(len=*), intent(in) :: name
    integer, intent(in) :: ncase, nfail
    nchk = nchk + 1; nfail_total = nfail_total + nfail
    if (nfail == 0) then
      write(*,'(A,A,I0,A)') name, '  PASS  (', ncase, ' cases)'
    else
      write(*,'(A,A,I0,A,I0,A)') name, '  FAIL  (', nfail, ' of ', ncase, ')'
    end if
  end subroutine

  ! ---- Part A: every seat on 4 points -------------------------------------------------------------------------
  subroutine part_a()
    integer :: f(4), r(4), i1, i2, i3, i4, r1, r2, r3, r4, s, a, b, nseat, nvac
    integer :: c1, c2, c3, c4, c5, c6, f1, f2, f3, f4, f5, f6, nex, nreg
    logical :: inv, kept, folded, wit, allfix, vacant, faithful, ins(4), seen(3), ok
    c1=0;c2=0;c3=0;c4=0;c5=0;c6=0; f1=0;f2=0;f3=0;f4=0;f5=0;f6=0; nseat=0; nvac=0
    do i1=1,4; do i2=1,4; do i3=1,4; do i4=1,4
      f = (/i1,i2,i3,i4/)
      inv = .true.
      do a=1,4; if (f(f(a)) /= a) inv = .false.; end do
      if (.not. inv) cycle
      vacant = .true.
      do a=1,4; if (f(a) == a) vacant = .false.; end do
      do r1=1,3; do r2=1,3; do r3=1,3; do r4=1,3
        r = (/r1,r2,r3,r4/)
        kept = .true.
        do a=1,4; if (r(f(a)) /= r(a)) kept = .false.; end do
        if (.not. kept) cycle
        nseat = nseat + 1; if (vacant) nvac = nvac + 1
        ! faithful (audit of 26 Nov 2026): the registration tells apart the points the fold fixes
        faithful = .true.
        do a=1,4; do b=1,4
          if (a /= b .and. f(a)==a .and. f(b)==b .and. r(a)==r(b)) faithful = .false.
        end do; end do
        do s=0,15
          do a=1,4; ins(a) = btest(s, a-1); end do
          folded = .true.; allfix = .true.; wit = .true.
          do a=1,4
            if (ins(a) .and. .not. ins(f(a))) folded = .false.
            if (ins(a) .and. f(a) /= a) allfix = .false.
            do b=1,4
              if (ins(a) .and. ins(b) .and. a /= b .and. r(a)==r(b)) wit = .false.
            end do
          end do
          nex = 0; seen = .false.
          do a=1,4; if (ins(a)) then; nex = nex + 1; seen(r(a)) = .true.; end if; end do
          nreg = count(seen)
          ! A1 form and witness put every existent on the line
          if (folded .and. wit) then; c1=c1+1; if (.not. allfix) f1=f1+1; end if
          ! A2 a witnessed configuration has as many registrations as existents
          if (wit) then; c2=c2+1; if (nreg /= nex) f2=f2+1; end if
          ! A3 in a folded configuration each existent is whole or by halves
          if (folded) then
            do a=1,4
              if (ins(a)) then
                c3=c3+1
                ok = (f(a)==a) .or. (ins(f(a)) .and. f(a)/=a .and. r(f(a))==r(a))
                if (.not. ok) f3=f3+1
              end if
            end do
          end if
          ! A4 one existent off the line ends the count
          if (folded .and. .not. allfix) then; c4=c4+1; if (wit) f4=f4+1; end if
          ! A5 on a vacant seat a witnessed existent stands without its partner
          if (vacant .and. wit) then
            do a=1,4
              if (ins(a)) then; c5=c5+1; if (ins(f(a))) f5=f5+1; end if
            end do
          end if
          ! A6 on a faithful seat, as defined above, a folded configuration is witnessed exactly when it is on the line
          if (faithful .and. folded) then; c6=c6+1; if (wit .neqv. allfix) f6=f6+1; end if
        end do
      end do; end do; end do; end do
    end do; end do; end do; end do
    write(*,'(A,I0,A,I0,A)') 'Part A: ', nseat, ' seats on 4 points, ', nvac, ' of them vacant, 16 configurations each'
    call report(' A1 form and witness put every existent on the line   ', c1, f1)
    call report(' A2 witnessed: as many registrations as existents     ', c2, f2)
    call report(' A3 folded: each existent whole or by halves          ', c3, f3)
    call report(' A4 one existent off the line ends the count          ', c4, f4)
    call report(' A5 vacant seat: a witnessed existent stands alone    ', c5, f5)
    call report(' A6 faithful seat: witnessed exactly when on the line ', c6, f6)
  end subroutine

  ! ---- Part B: the particle map, gravity's reading as the registration ----------------------------------------
  subroutine part_b()
    integer :: q, k, b, l, fr, n, f1, f2, f3, nneut, ncharged, npts
    logical :: neutral, fixed
    n=0; f1=0; f2=0; f3=0; nneut=0; ncharged=0
    do q=-1,1; do k=-1,1; do b=-1,1; do l=-1,1; do fr=0,1
      n = n + 1
      neutral = (q==0 .and. k==0 .and. b==0 .and. l==0)
      fixed = (-q==q .and. -k==k .and. -b==b .and. -l==l)      ! bar c = c
      if (fixed .neqv. neutral) f1 = f1 + 1                     ! B1 fixed exactly when neutral
      ! B2 the orbit {c, bar c}: witnessed by the frequency exactly when c is neutral; reading kept (fr = fr)
      if (neutral) then; nneut = nneut + 1; else; ncharged = ncharged + 1; end if
      npts = merge(1, 2, fixed)                                 ! the orbit {c, bar c}; it has one reading, fr
      if ((npts == 1) .neqv. neutral) f2 = f2 + 1
      if (.not. neutral .and. fixed) f3 = f3 + 1                ! B3 a charged particle is two on one reading
    end do; end do; end do; end do; end do
    write(*,'(A,I0,A,I0,A,I0,A)') 'Part B: ', n, ' particles, ', nneut, ' neutral, ', ncharged, ' charged'
    call report(' B1 the particle map fixes exactly the neutral        ', n, f1)
    call report(' B2 gravity counts the pair exactly when it is neutral', n, f2)
    call report(' B3 a charged particle is two on one reading          ', ncharged, f3)
  end subroutine

  ! ---- Part C: the time mirror, the level as the registration -------------------------------------------------
  subroutine part_c()
    integer :: q, fr, rt, q2, fr2, rt2, n, f1, f2, c2, f3, nst, ndec
    n=0; f1=0; f2=0; c2=0; f3=0; nst=0; ndec=0
    do q=-1,1; do fr=0,1; do rt=-1,1
      n = n + 1
      if ((-rt == rt) .neqv. (rt == 0)) f1 = f1 + 1             ! C1 fixed exactly when stationary
      if (rt == 0) then; nst = nst + 1; else; ndec = ndec + 1; end if
      if (rt /= 0 .and. -rt == rt) f3 = f3 + 1                  ! C3 a decaying mode is two on one level
      do q2=-1,1; do fr2=0,1; do rt2=-1,1
        if (rt==0 .and. rt2==0 .and. q==q2 .and. fr==fr2) then  ! C2 the level tells the stationary apart
          c2 = c2 + 1
          if (.not. (q==q2 .and. fr==fr2 .and. rt==rt2)) f2 = f2 + 1
        end if
      end do; end do; end do
    end do; end do; end do
    write(*,'(A,I0,A,I0,A,I0,A)') 'Part C: ', n, ' modes, ', nst, ' stationary, ', ndec, ' decaying'
    call report(' C1 the time mirror fixes exactly the stationary      ', n, f1)
    call report(' C2 the level tells the stationary apart              ', c2, f2)
    call report(' C3 a decaying mode is two on one level               ', ndec, f3)
  end subroutine

  ! ---- Part D: recording, on the seat of 6 points (h in 0..2, t in 0..1), line h = 1 --------------------------
  subroutine part_d()
    integer :: s, a, h, t, rec1, rec2, f1, f2, n
    logical :: online
    n=0; f1=0; f2=0
    do s=0,63
      n = n + 1
      rec1 = record(s); rec2 = record(rec1)
      if (rec2 /= rec1) f1 = f1 + 1                             ! D1 the record of the record is the record
      online = .true.
      do a=0,5
        h = a/2; t = mod(a,2)
        if (btest(s,a) .and. h /= 1) online = .false.
      end do
      if ((rec1 == s) .neqv. online) f2 = f2 + 1                ! D2 its own record exactly when on the line
    end do
    write(*,'(A,I0,A)') 'Part D: ', n, ' configurations of 6 points'
    call report(' D1 recording is one step                             ', n, f1)
    call report(' D2 the prior is the posterior exactly on the line    ', n, f2)
  end subroutine

  ! ---- Part E: any family of maps. Two arbitrary maps f, g of 3 points; every reading into 2 values they keep --
  subroutine part_e()
    integer :: f(3), g(3), r(3), cl(3), i, j, a, b, s, it, nfam, c1, f1, c2, f2
    logical :: kept, closed, cnt, allfix, ins(3)
    nfam=0; c1=0; f1=0; c2=0; f2=0
    do i=0,26; do j=0,26
      f = (/ mod(i,3)+1, mod(i/3,3)+1, i/9+1 /); g = (/ mod(j,3)+1, mod(j/3,3)+1, j/9+1 /)
      nfam = nfam + 1
      cl = (/1,2,3/)                                            ! orbit classes: identify a with f(a) and with g(a)
      do it=1,6; do a=1,3
        b = min(cl(a), cl(f(a)), cl(g(a))); cl(a) = b; cl(f(a)) = b; cl(g(a)) = b
      end do; end do
      do s=0,7
        r = (/ ibits(s,0,1), ibits(s,1,1), ibits(s,2,1) /)
        kept = .true.
        do a=1,3; if (r(f(a)) /= r(a) .or. r(g(a)) /= r(a)) kept = .false.; end do
        if (.not. kept) cycle
        ! E1 a kept reading is constant on each orbit class: it factors through the orbit map
        do a=1,3; do b=1,3
          if (cl(a) == cl(b)) then; c1 = c1 + 1; if (r(a) /= r(b)) f1 = f1 + 1; end if
        end do; end do
        do it=0,7                                               ! configurations
          do a=1,3; ins(a) = btest(it, a-1); end do
          closed = .true.; cnt = .true.; allfix = .true.
          do a=1,3
            if (ins(a) .and. .not. (ins(f(a)) .and. ins(g(a)))) closed = .false.
            if (ins(a) .and. (f(a) /= a .or. g(a) /= a)) allfix = .false.
            do b=1,3; if (ins(a) .and. ins(b) .and. a /= b .and. r(a) == r(b)) cnt = .false.; end do
          end do
          ! E2 closed and counted puts every member on the fixed set of both maps
          if (closed .and. cnt) then; c2 = c2 + 1; if (.not. allfix) f2 = f2 + 1; end if
        end do
      end do
    end do; end do
    write(*,'(A,I0,A)') 'Part E: ', nfam, ' pairs of maps of 3 points, every reading into 2 values they keep'
    call report(' E1 every kept reading factors through the orbit map  ', c1, f1)
    call report(' E2 closed and counted: every member on the fixed set ', c2, f2)
  end subroutine

  ! ---- Part F: total charge. 10 particles (charge -2..2, frequency 0..1); all subsets closed under the map ----
  subroutine part_f()
    integer :: s, a, q, tot, n, f1
    logical :: closed
    n=0; f1=0
    do s=0,1023
      closed = .true.; tot = 0
      do a=0,9                                                  ! particle a: charge q = a/2 - 2, frequency mod(a,2)
        q = a/2 - 2
        if (btest(s,a)) then
          tot = tot + q
          if (.not. btest(s, 2*(2-q) + mod(a,2))) closed = .false.   ! its antiparticle: charge -q, same frequency
        end if
      end do
      if (closed) then; n = n + 1; if (tot /= 0) f1 = f1 + 1; end if
    end do
    write(*,'(A,I0,A)') 'Part F: ', n, ' configurations of 10 particles closed under the particle map'
    call report(' F1 matter with its antimatter is neutral as a whole  ', n, f1)
  end subroutine

  ! ---- Part G: the labels of a symmetry of period n, in arithmetic modulo a prime -----------------------------
  subroutine part_g()
    integer, parameter :: pr(5) = (/5, 7, 11, 13, 17/)
    integer :: ip, p, n, x, k, pw, nlab, c1, f1
    c1=0; f1=0
    do ip=1,5
      p = pr(ip)
      do n=1,p-1
        nlab = 0
        do x=1,p-1
          pw = 1
          do k=1,n; pw = mod(pw*x, p); end do
          if (pw == 1) nlab = nlab + 1                          ! x is a label: x**n = 1
        end do
        c1 = c1 + 1; if (nlab > n) f1 = f1 + 1                  ! G1 at most n labels
      end do
    end do
    write(*,'(A)') 'Part G: periods 1 to p-1 for the primes 5, 7, 11, 13, 17'
    call report(' G1 a symmetry of period n has at most n labels       ', c1, f1)
  end subroutine

  ! ---- Part H: the wave. Polarisations in -3..3; parity reverses the cross part; the energy is the registration
  subroutine part_h()
    integer :: p, c, n, f1, c2, f2
    n=0; f1=0; c2=0; f2=0
    do p=-3,3; do c=-3,3
      n = n + 1
      if (-(-c) /= c) f1 = f1 + 1                                ! involution
      if ((-c == c) .neqv. (c == 0)) f1 = f1 + 1                 ! fixed exactly with no cross part
      if (p*p + (-c)*(-c) /= p*p + c*c) f1 = f1 + 1              ! the energy is kept
      if (c /= 0) then; c2 = c2 + 1; if (-c == c) f2 = f2 + 1; end if   ! two waves, one energy
    end do; end do
    write(*,'(A,I0,A)') 'Part H: ', n, ' waves'
    call report(' H1 parity: an involution, fixes no-cross, keeps energy', n, f1)
    call report(' H2 the two helicities are two on one energy          ', c2, f2)
  end subroutine

  ! ---- Part I: identical quanta. 3 quanta in 2 modes, the 6 relabellings, the occupation numbers --------------
  subroutine part_i()
    integer, parameter :: pm(3,6) = reshape((/1,2,3, 1,3,2, 2,1,3, 2,3,1, 3,1,2, 3,2,1/), (/3,6/))
    integer :: s, k, a, x(3), y(3), c1, f1, c2, f2
    logical :: allfix, onemode
    c1=0; f1=0; c2=0; f2=0
    do s=0,7
      x = (/ ibits(s,0,1), ibits(s,1,1), ibits(s,2,1) /)
      allfix = .true.
      do k=1,6
        do a=1,3; y(a) = x(pm(a,k)); end do
        c1 = c1 + 1; if (sum(y) /= sum(x)) f1 = f1 + 1          ! I1 relabelling keeps the occupation numbers
        if (any(y /= x)) allfix = .false.
      end do
      onemode = (x(1) == x(2) .and. x(2) == x(3))
      c2 = c2 + 1; if (allfix .neqv. onemode) f2 = f2 + 1       ! I2 fixed by all exactly when in one mode
    end do
    write(*,'(A)') 'Part I: 8 assignments of 3 quanta to 2 modes, 6 relabellings'
    call report(' I1 relabelling keeps the occupation numbers          ', c1, f1)
    call report(' I2 fixed by every relabelling exactly in one mode    ', c2, f2)
  end subroutine

  ! ---- Part J: the commutator. 2 by 2 integer matrices with entries in -1..1; the adjoint is the transpose ----
  subroutine part_j()
    integer :: i, j, a(2,2), b(2,2), c(2,2), c1, f1, c2, f2
    c1=0; f1=0; c2=0; f2=0
    do i=0,80; do j=0,80
      a = reshape((/ mod(i,3)-1, mod(i/3,3)-1, mod(i/9,3)-1, i/27-1 /), (/2,2/))
      b = reshape((/ mod(j,3)-1, mod(j/3,3)-1, mod(j/9,3)-1, j/27-1 /), (/2,2/))
      c = matmul(a,b) - matmul(b,a)
      c1 = c1 + 1                                               ! J1 no commutator is a nonzero multiple of the identity
      if (c(1,2) == 0 .and. c(2,1) == 0 .and. c(1,1) == c(2,2) .and. c(1,1) /= 0) f1 = f1 + 1
      if (all(a == transpose(a)) .and. all(b == transpose(b))) then
        c2 = c2 + 1                                             ! J2 of two observables: reversed by the adjoint, real part zero
        if (any(transpose(c) /= -c) .or. any(c + transpose(c) /= 0)) f2 = f2 + 1
      end if
    end do; end do
    write(*,'(A)') 'Part J: 6561 pairs of 2 by 2 integer matrices'
    call report(' J1 no commutator is a nonzero multiple of identity   ', c1, f1)
    call report(' J2 observables: the adjoint reverses the commutator  ', c2, f2)
  end subroutine

  integer function record(s)
    integer, intent(in) :: s
    integer :: a, t
    record = 0
    do a=0,5
      if (btest(s,a)) then
        t = mod(a,2)
        record = ibset(record, 2 + t)                           ! the point (h = 1, t)
      end if
    end do
  end function
end program
```

## Appendix E · Run of Appendix D

```text
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
BATTERY {"checks":24,"failures":0}
```

## Appendix F · Kernel lines of Appendices A, B and C

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

Appendix A.

```text
'SPHYS.Quantization.quantized_iff_witnessed' does not depend on any axioms
'SPHYS.Quantization.the_triaxial_theorem' does not depend on any axioms
'SPHYS.Quantization.the_existents_are_atoms' does not depend on any axioms
'SPHYS.Quantization.the_count_is_the_count_of_registrations' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Quantization.finitely_many_existents_have_that_many_registrations' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Quantization.off_the_line_an_existent_is_two' does not depend on any axioms
'SPHYS.Quantization.the_orbit_has_one_registration' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Quantization.on_the_line_the_orbit_is_one_point' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Quantization.off_the_line_the_orbit_is_two_points' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Quantization.whole_or_by_halves' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Quantization.quantized_iff_on_the_line' does not depend on any axioms
'SPHYS.Quantization.one_existent_off_the_line_ends_the_count' does not depend on any axioms
'SPHYS.Quantization.on_a_vacant_seat_a_witnessed_existent_stands_alone' does not depend on any axioms
'SPHYS.Quantization.on_a_vacant_seat_form_and_count_exclude' does not depend on any axioms
'SPHYS.Quantization.recording_is_one_step' depends on axioms: [propext, Quot.sound]
'SPHYS.Quantization.self_recorded_iff_on_the_line' depends on axioms: [propext, Quot.sound]
'SPHYS.Quantization.bar_involutive' depends on axioms: [propext]
'SPHYS.Quantization.bar_fixed_iff_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.Quantization.gravity_counts_the_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.Quantization.a_charged_particle_is_two_on_one_reading' depends on axioms: [propext, Quot.sound]
'SPHYS.Quantization.matter_with_antimatter_is_not_counted_by_gravity' depends on axioms: [propext, Quot.sound]
'SPHYS.Quantization.gravity_does_not_tell_all_the_neutral_apart' does not depend on any axioms
'SPHYS.Quantization.the_charges_are_not_a_registration' does not depend on any axioms
'SPHYS.Quantization.tmirror_involutive' depends on axioms: [propext]
'SPHYS.Quantization.tmirror_fixed_iff_stationary' depends on axioms: [propext, Quot.sound]
'SPHYS.Quantization.the_level_tells_the_stationary_apart' depends on axioms: [propext, Quot.sound]
'SPHYS.Quantization.the_levels_are_the_stationary' depends on axioms: [propext, Quot.sound]
'SPHYS.Quantization.a_decaying_mode_is_two_on_one_level' depends on axioms: [propext, Quot.sound]
'SPHYS.Quantization.generalized_quantization' depends on axioms: [propext, Classical.choice, Quot.sound]
```

Appendix B.

```text
'SPHYS.QuantizationII.the_orbit_map_is_a_registration' depends on axioms: [Quot.sound]
'SPHYS.QuantizationII.every_registration_factors_through_the_orbit_map' does not depend on any axioms
'SPHYS.QuantizationII.a_registration_counts_only_if_the_orbit_map_counts' does not depend on any axioms
'SPHYS.QuantizationII.form_and_witness_put_every_existent_on_the_fixed_set' does not depend on any axioms
'SPHYS.QuantizationII.one_moved_existent_ends_every_count' does not depend on any axioms
'SPHYS.QuantizationII.relabelling_keeps_the_occupation_numbers' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.QuantizationII.fixed_by_every_relabelling_iff_one_mode' depends on axioms: [propext, Quot.sound]
'SPHYS.QuantizationII.the_occupation_numbers_count_only_one_mode' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.QuantizationII.quanta_in_two_modes_are_many_on_one_occupation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.QuantizationII.an_odd_reading_sums_to_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.QuantizationII.bar_involutive' depends on axioms: [propext]
'SPHYS.QuantizationII.matter_with_its_antimatter_is_neutral_as_a_whole' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.QuantizationII.a_label_of_a_periodic_symmetry_is_a_root_of_one' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.QuantizationII.a_symmetry_of_period_n_has_at_most_n_labels' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.QuantizationII.the_registrations_of_an_observable_are_on_the_line' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.QuantizationII.states_with_different_registrations_are_orthogonal' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.QuantizationII.parity_involutive' depends on axioms: [propext]
'SPHYS.QuantizationII.parity_fixed_iff_no_cross' depends on axioms: [propext, Quot.sound]
'SPHYS.QuantizationII.parity_keeps_the_energy' depends on axioms: [propext]
'SPHYS.QuantizationII.every_parity_kept_reading_counts_only_the_plus_waves' depends on axioms: [propext, Quot.sound]
'SPHYS.QuantizationII.the_two_helicities_are_two_on_one_energy' depends on axioms: [propext, Quot.sound]
```

Appendix C.

```text
'SPHYS.QuantizationStar.the_adjoint_keeps_the_real_part' does not depend on any axioms
'SPHYS.QuantizationStar.the_observables_are_the_atoms' does not depend on any axioms
'SPHYS.QuantizationStar.the_real_part_tells_the_observables_apart' depends on axioms: [propext]
'SPHYS.QuantizationStar.quantized_by_the_real_part_iff_observables' depends on axioms: [propext]
'SPHYS.QuantizationStar.the_adjoint_reverses_the_commutator' depends on axioms: [propext, Quot.sound]
'SPHYS.QuantizationStar.the_real_part_reads_no_commutator' depends on axioms: [propext, Quot.sound]
'SPHYS.QuantizationStar.observables_with_an_observable_commutator_commute' depends on axioms: [propext, Quot.sound]
'SPHYS.QuantizationStar.a_commutator_and_its_adjoint_are_two_on_one_registration' depends on axioms: [propext,
 Quot.sound]
'SPHYS.QuantizationStar.no_kept_reading_counts_the_commutator_with_its_adjoint' depends on axioms: [propext, Quot.sound]
'SPHYS.QuantizationStar.no_canonical_pair_in_finite_matrices' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.QuantizationStar.every_algebraic_quantization_is_a_seat' depends on axioms: [propext, Quot.sound]
```

## Appendix G · Provenance Trail

The frame, the terms and the seat of this paper are on the public record before it. The frame is the first anchor: three orthogonal axes converging on one point, with the witness outside them. The table lists each step at the grade its own record carries, with the address where that record can be read. The theorem of this paper, that form and witness put every existent on the line and that a registration counts a folded configuration only there, is in the last two rows and in no earlier one. The earlier rows carry the frame, terms, readings and special cases, and none of them is claimed as that theorem; the row marked frame states no mathematics of this paper. The third column gives, for each row, the term of that record which is the precursor, and why the row is on the trail. The term of the row of 31 March is printed there as observer-imposed discretization.

**Table G.1 · The grade ladder of the quantization line, 2026**

| Date | Grade | Precursor term, and why it is on the trail | Record | Address |
|---|---|---|---|---|
| 24 Mar | Frame, first anchor | **three orthogonal Ductions converging on one point.** The triaxial frame: three independent axes that fix one point, with the witness outside them | *Trisduction, A Geometric Epistemology of Absolute Convergence: three orthogonal axes converging on one proposition, with a witness that is none of the three* | <https://trisduction.blogspot.com/2026/03/trisduction-geometric-epistemology-of.html> |
| 31 Mar | Term, seed | **observer-imposed discretization; witness; registration.** The three terms of this paper first set down: a discreteness laid on by a reader, set against one the domain has; the witness and its registration as a mode of warrant | *Trisduction: The Geometry of Convergent Epistemic Warrant, first edition: observer-imposed discretization set against the boundary a domain has of itself; the witness and its registration as a mode of warrant; matter as causal witness* | <https://doi.org/10.5281/zenodo.19345046> |
| 7 Jun | Term | **triaxial verification.** Three axes named as one verification, the shape of existence, form and witness | *Orthogonal Fertile Logos: triaxial verification and the twelve-gate geometric lock* | <https://doi.org/10.5281/zenodo.20575677> |
| 1 Sep | Reading | **Cartesian sedimentation; canonical quantization as a procedure.** The count before the coordinate, and canonical quantization typed as a procedure with entry conditions, which Section 10 places on the seat | *The Geometry of Convergent Epistemic Warrant, third edition: the coordinate layer as a sedimentation since Descartes; π as an analytic import; canonical quantization as a procedure with entry conditions* | <https://doi.org/10.5281/zenodo.22217812> |
| 15 Sep | Reading | **objects and observations under registration.** Registration as the one relation between an object and its reading | *The Formal-Alone Theory of Everything: a constitutive theory of objects and observations under registration* | <https://doi.org/10.5281/zenodo.22767103> |
| 27 Sep | Special case | **charge conjugation as the reflection; the positron as the partner.** The particle map as a fold and the antiparticle as the partner: the first fold of Section 7 | *The Electron Is the Seat: charge conjugation as the reflection, the positron as the partner* | <https://doi.org/10.5281/zenodo.22986553> |
| 2 Oct | Lean, deposited | **one fold, one registration; no axiom declared.** The seat in Lean: a fold and a registration it keeps, the structure every theorem here assumes | *The Bridge From First Principle: one fold, one registration, with no axiom declared* | <https://doi.org/10.5281/zenodo.23105348> |
| 23 Nov | Lean, deposited | **the seat: a reflection and the line it fixes.** The seat and its line as deposited, cited in the Disclosure of this paper | *Nothing Escapes Least Erasure, edition 2.0.1: the seat as a reflection of the plane and the line it fixes* | <https://doi.org/10.5281/zenodo.24465820> |
| 25 Nov | Theorem, three axes | **triaxial; the vacant seat.** Form and witness put every existent on the line; and the seat whose fold fixes no point (Sections 3 and 6) | *The two identity papers: the triaxial theorem on the seat, and the vacant seat* | <https://doi.org/10.5281/zenodo.24531074> · <https://doi.org/10.5281/zenodo.24547646> |
| 26 Nov | Theorem, one fold | **the existents are atoms.** This paper, first edition: the atoms counted by their registrations, on one fold | *This paper, edition 1.0.0: the existents are atoms counted by their registrations; the particle map and the time mirror* | <https://github.com/1000sapients/Trisduction/commit/fe2f89b> |

Dates are Zenodo publication dates where a DOI is given, the git commit date for the last row, in UTC, and the date printed on its page for the row of 24 March. Each row is listed at the grade its own record carries. A row marked term or reading states no theorem of this paper; a row marked special case reads one fold of physics on the seat in prose. The terms of the rows of 24 March, 31 March and 1 September were read in the records themselves. The terms of the rows of 7 June, 15 September, 27 September, 2 October, 23 November and 25 November are taken from the titles of their records. Edition 2.0.0 added the family of maps, the orbit map, the periodic labels, the ring with an adjoint, the spectral seat and the wave. Edition 2.0.1, this file, adds to this appendix the row of 24 March and the third column, and changes nothing else; it has no address until it is deposited.