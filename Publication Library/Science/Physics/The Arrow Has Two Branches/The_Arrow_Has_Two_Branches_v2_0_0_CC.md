# The Arrow Has Two Branches

## Magnetism and Gravity as the Priced and the Reversible Registration of One Arrow

**Mohammad F. Islam PhD** · 25 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, that one arrow has two branches: a branch that keeps a record and is a map of two states onto one, and a branch that keeps none and is a bijection. The first is a magnet. One magnetic domain with one axis has the energy of Stoner and Wohlfarth, a function of an angle and a field, and no cost is entered by hand. With the field along the axis the two states along it are both wells exactly when the field lies strictly between minus one and one anisotropy fields, so the field does not fix the state: the domain holds a bit. A field of one or more ends one well, sends both states to the other, and releases twice the field in units of twice the anisotropy energy; no map undoes that step, every change of the record releases at least two units, and a cycle releases at least four. For a field at any angle the well ends exactly on the curve $(-\cos^3\theta, \sin^3\theta)$, the astroid. Across the axis the two wells have one energy and meet with nothing released, so the heat of the loop is the price of a path and not a floor; the floor is that of Landauer, cited. The second branch is motion under a potential in any real inner product space: the energy is constant, the path run backwards with the velocity turned is again a motion, the force does no work round a closed path, and under a central force the area rate is constant. The branches are then told apart as maps: every step of a flow is a bijection, and the reset of the record is a step of no flow. The magnetic force on a moving charge does no work, so the price of the first branch is in its record and not in its force. The premises are fields of one printed structure, and the structure is inhabited. A Fortran twin drives a loop with the field five degrees from the axis and finds remanence 0.99619, switching field 0.76650 against the formula's 0.76643, and a loop area 3.03574 equal to the energy released at the two jumps; at the usual condition for a lasting bit one switch costs 175 times the bound of Landauer. An orbit of Kepler keeps its energy to parts in a thousand million and, with the velocity turned, returns to its first state. Part II states the reading from which the paper takes its place in the series, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

Let $\theta$ be the angle of the moment of one magnetic domain from its axis and $h$ the field along the axis, in units of the anisotropy field. In units of twice the anisotropy energy, the energy of the domain is

$$e(h, \theta) = \tfrac{1}{2}\sin^2\theta - h\cos\theta .$$

Its slope in the angle is $\sin\theta\cos\theta + h\sin\theta$ and its stiffness is $\cos^2\theta - \sin^2\theta + h\cos\theta$. A well is an angle of zero slope and positive stiffness.

**Theorem (`both_wells_exactly_inside`).** The aligned state $\theta = 0$ and the reversed state $\theta = \pi$ are both wells exactly when $-1 < h < 1$.

**Theorem (`the_drop_at_switching`).** $e(h, \pi) - e(h, 0) = 2h$.

**Theorem (`no_map_undoes_the_reset`).** For $h \ge 1$ the step of the record sends both states to the aligned one, and no map of the two states undoes it.

**Theorem (`energy_is_constant`).** For a motion under a potential, in any real inner product space, the energy $\tfrac12\lVert v\rVert^2 + V(x)$ is the same at every time.

**Theorem (`the_reversed_path_is_a_motion`).** If $x(t)$ with velocity $v(t)$ is a motion under a potential, so is $x(-t)$ with velocity $-v(-t)$.

**Theorem (`the_reset_is_no_step_of_a_flow`).** Every step of a flow is a bijection, and for $h \ge 1$ the step of the record is a step of no flow on the two states.

**Theorem (`two_branches`).** On the premises below: the energy of the body is constant and its path reversed is a motion; the heat of the domain never decreases; every change of its record releases at least two units; and a field of one or more leaves the record aligned.

The energy is that of Stoner and Wohlfarth [1]. That a logically irreversible step has a least heat is the principle of Landauer [2], and that a reversible one has none is the result of Bennett [3]; both are cited. What compiles here, in Lean 4 [13] with Mathlib [12], is the wells, the curve, the heat of the loop along the axis, the conservation and the reversal, and the difference of the two branches as maps. The premises are met: `fallPremises` constructs a term of the structure, and `the_member_pays` shows that its record changes and its heat rises.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. What is cited is in the tables of Section 1.3.

```lean
structure Premises (E : Type) [NormedAddCommGroup E] [InnerProductSpace ℝ E] where
  /-- the history of the field on the domain, and the state it starts in -/
  field : ℕ → ℝ
  start : Bool
  /-- the record of the domain: it keeps its well while the well stands and leaves it when the field ends it -/
  record : ℕ → Bool
  wells : ∀ n, record n = run field start n
  /-- gravity has a potential, and the body moves by it -/
  V : E → ℝ
  g : E → E
  x : ℝ → E
  v : ℝ → E
  moves : Motion V g x v
```

It carries two premises. The first is the field `wells`: the record of the domain is the run of the step, so the domain keeps its well while the well stands and leaves it only when the field ends it. That is a magnet at zero temperature with the field along its axis. The second is the field `moves`: the body has a position and a velocity, the rate of the velocity is minus the gradient of a potential, and the gradient exists along the path. That is gravity as a force with a potential. Neither premise is a theorem of this paper.

### 1.3 What is proved, what is cited, what is assumed

| Statement | Standing | Where |
|---|---|---|
| The slope and the stiffness are the first and second rates of the energy in the angle | Proved | Appendix A, Part I |
| The two states along the axis are both wells exactly for $-1 < h < 1$; the aligned state is a minimum over the stated angles above $-1$ and the maximum over all angles at or below it | Proved | Part I |
| The reversed state stands above the aligned one by $2h$ | Proved | Part I |
| For a field at any angle, the state at $\theta$ is stationary without stiffness exactly at the field $(-\cos^3\theta, \sin^3\theta)$ | Proved, with the converse | Part II |
| Across the axis the two wells have one energy, are the minimum, and meet at the field one | Proved | Part II |

The table continues with the record, the motion, the maps and the premises.

| Statement | Standing | Where |
|---|---|---|
| A field inside keeps the state; a field of one or more sends both states to one; no map undoes it | Proved | Part III |
| Along the axis the heat never decreases, a change of the record releases at least two units and a cycle at least four | Proved | Part III |
| Under a potential the energy is constant, the reversed path is a motion with the same energy, and a closed path does no work | Proved, in every real inner product space | Part IV |
| Under a central force in a plane the area rate is constant; the slope of $-k/r$ is $k/r^2$ | Proved | Part IV |
| Every step of a flow is a bijection; the reset is a step of no flow; the magnetic force does no work | Proved | Part V |
| On the premises, the five statements of `two_branches`; the premises are met by a member whose record changes | Proved | Part VI |

What is not machine-checked is in the third table.

| Statement | Standing | Where |
|---|---|---|
| A magnet small enough is one domain with one axis, and its energy is the one above | Classical model, entered: [1] | Section 2 |
| The domain keeps its well while the well stands | Premise; it is zero temperature, and thermal switching is outside it [6, 7] | Sections 4, 7 |
| Erasing one bit at temperature $T$ releases at least $kT\ln 2$ of heat; a reversible step need release none | Classical, entered: [2, 3]; measured [4, 5] | Sections 4, 6 |
| Gravity is a force with a potential | Premise; the law itself is the subject of a companion paper [15] | Section 5 |
| The magnetic field has no source | Classical, entered; a source was considered [8] and has been searched for [9] | Section 6 |
| The values of the twin | Numerical, not machine-checked | Section 8 |

The paper claims as machine-checked the rows marked proved and no others. A row marked entered is a classical model, a classical bound or a measured value; the theorems that use a formula are analysis on it. Part II, the reading, is outside these tables: it is premise-grade and is labelled so where it begins.

## 2. The Domain and Its Wells

A magnet small enough holds one domain: its moment has a fixed size and one angle. If the material has one easy axis, the energy rises as the square of the sine of the angle from it, and a field lowers the energy of a moment that points along the field. Divided by twice the anisotropy energy, that is the function $e$ of Section 1.1, due to Stoner and Wohlfarth [1]. The model is entered. Everything after it is analysis.

`energy_hasDerivAt` and `slope_hasDerivAt` show that `slope` and `stiffness` are the first and second rates of `energy`, so the three are one function and its derivatives, not three definitions. `the_axis_is_stationary` gives zero slope at $\theta = 0$ and $\theta = \pi$ for every field, and `stiffness_on_the_axis` gives the stiffness there: $1 + h$ and $1 - h$.

The wells are not only read from the stiffness. The energy above the aligned state factors,

$$e(h, \theta) - e(h, 0) = (1 - \cos\theta)\left(\tfrac{1 + \cos\theta}{2} + h\right),$$

which is `energy_above_aligned`. For $h > -1$ the second factor is positive near $\theta = 0$, and `aligned_is_a_minimum` gives $e(h, 0) \le e(h, \theta)$ for every angle with $\cos\theta \ge -1 - 2h$; for $h \ge 0$ that is every angle. For $h \le -1$ the second factor is never positive, and `aligned_is_a_maximum` gives $e(h, \theta) \le e(h, 0)$ for every angle: the well is gone and the state is the top of the hill. `reversed_is_a_minimum` and `reversed_is_a_maximum` say the same of $\theta = \pi$ with the sign of the field turned.

`both_wells_exactly_inside` joins them: both states are wells exactly for $-1 < h < 1$. `the_field_does_not_fix_the_state` draws the consequence. Inside that interval one field carries two wells whose moments along the axis are $1$ and $-1$. Which one the domain is in is not a function of the field. It is a function of the past, and that is a record of one bit.

`the_drop_at_switching` gives the energy of the reversed state above the aligned one, $2h$. At $h = 1$, where the reversed well ends, it is two.

## 3. The Switching Curve

Let the field have a part $h_x$ along the axis and a part $h_y$ across it. The energy is `energy2`, $\tfrac12\sin^2\theta - h_x\cos\theta - h_y\sin\theta$, with `energy2_hasDerivAt` and `slope2_hasDerivAt` for its rates. A well ends where the slope and the stiffness vanish together.

**Theorem (`the_switching_curve`).** At the field $(h_x, h_y) = (-\cos^3\theta, \sin^3\theta)$ the state at $\theta$ has zero slope and zero stiffness.

**Theorem (`only_the_switching_curve`).** If the state at $\theta$ has zero slope and zero stiffness at a field, the field is that one.

`the_switching_curve_is_an_astroid` records that the squares of the two parts are the cubes of $\cos^2\theta$ and $\sin^2\theta$, which sum to one: $h_x^{2/3} + h_y^{2/3} = 1$. This is the astroid of Stoner and Wohlfarth [1], here with its converse and compiled.

The curve has four corners, and the two on the axis across differ from the two on the axis. With the field across the axis, `across_the_axis` writes the energy as $\tfrac12(\sin\theta - h_y)^2 - \tfrac12 h_y^2$. `across_the_axis_minimum` shows that an angle whose sine is the field is a minimum over every angle, and `across_the_axis_the_two_wells_have_one_energy` shows that the angle and its mirror have one energy. As the field rises to one the two angles close on each other, and `at_the_cusp_the_wells_meet` shows that at one they carry one moment, with no part along the axis. The two wells have merged, and no energy has been released.

This matters for what follows. Two states can be made one along a path on which nothing falls. The heat of Section 4 is therefore the heat of one path, the field along the axis, and not a floor under every path.

## 4. The Record and Its Heat

With the field along the axis, the record is a map. `step` sends a state to the aligned one if $h \ge 1$, to the reversed one if $h \le -1$, and to itself otherwise: a well the field has ended is left, a well that stands is kept. That rule is the premise `wells`; the theorems of Section 2 are what make it the rule of the wells.

`a_weak_field_keeps` and `a_strong_field_erases` give the two regimes. In the second, both states have one image.

**Theorem (`no_map_undoes_the_reset`).** For $h \ge 1$ there is no map $g$ of the two states with $g(\mathrm{step}_h(s)) = s$ for both.

The bit that told the two states apart is not in the state after the step. The energy released at a step is `released`: the value of `energy` at the state left minus its value at the state reached, at the field of the step. `released_nonneg` shows it is never negative, and `a_switch_costs_at_least_two` that it is at least two whenever the state changes, because a change needs a field of size one or more and the drop is twice the field.

`run` is the record after a history of fields and `heat` the energy released along it. `heat_monotone` shows that the heat never decreases, and `a_cycle_costs_at_least_four` that two changes in succession release at least four units. Four is the area of the loop of the domain along its axis.

Three things are not claimed. The two units are not a floor under every way of resetting the domain; Section 3 shows a path with none. The floor is that of Landauer: at temperature $T$, erasing one bit releases at least $kT\ln 2$ [2]. It is cited and measured, for a colloidal particle [4] and for magnetic bits of this kind [5], and it is not a theorem of this paper. And the rule of the wells is zero temperature: at a temperature above zero a domain can leave a well that still stands, at a rate set by the height of the barrier [6, 7].

## 5. Motion Under a Potential

The second branch asks for less structure. Let $E$ be any real inner product space. A `Motion` under a potential $V$ with gradient $g$ is a position $x(t)$ with velocity $v(t)$ such that the rate of $v$ is $-g(x)$, the gradient being asked for only along the path. The energy is `mech`, $\tfrac12\lVert v\rVert^2 + V(x)$.

**Theorem (`mech_hasDerivAt`).** The rate of the energy of a motion is zero at every time.

The rate of the first term is $\langle v, -g(x)\rangle$ and of the second $\langle g(x), v\rangle$. `energy_is_constant` follows by the mean value theorem: the energy is the same at any two times.

**Theorem (`the_reversed_path_is_a_motion`).** The path $t \mapsto x(-t)$ with velocity $t \mapsto -v(-t)$ is a motion under the same potential.

`the_reversed_path_has_the_same_energy` adds that its energy at $t$ is that of the first at $-t$. A film of the motion run backwards shows a motion.

**Theorem (`a_closed_path_does_no_work`).** If a path under a potential has one point at both ends, and $\langle g(x), v\rangle$ is integrable along it, its integral along the path is zero.

It is the fundamental theorem of calculus on $V(x(t))$. A force with a potential keeps nothing from a round trip. `the_area_rate_is_constant` is the second law of Kepler in a plane under any force along the line to the centre, and `newton_potential` gives the slope of $-k/r$ as $k/r^2$, the inverse square of Newton [10], whose derivation is the subject of a companion paper [15]. Here the potential is a premise and its form is free.

## 6. Two Kinds of Map

The branches differ as maps, and the difference does not depend on the path of the field.

A `Flow` on a set of states is a step for every time, with the step of no time doing nothing and steps composing.

**Theorem (`a_step_of_a_flow_is_a_bijection`).** Every step of a flow is one to one and onto: it is undone by the step of the opposite time.

**Theorem (`the_reset_is_no_step_of_a_flow`).** For $h \ge 1$, the step of the record is the step of no flow on the two states.

The motion of Section 5 is of the first kind: it can be run backwards. The reset of Section 4 is of the second: two states have one image. That is the distinction of Landauer and Bennett [2, 3], a logically reversible step against a logically irreversible one, and it is what the heat attaches to: by the cited bound, the second kind releases at least $kT\ln 2$ for each bit, by whatever path, and the first need release none.

One further theorem places the price. `the_magnetic_force_does_no_work` shows that the force of a magnetic field on a moving charge, being across the velocity, has no power: $v\cdot(v\times B) = 0$. The magnetic field of the classical theory has no source. Dirac showed what a source would imply [8], and none has been found [9]. The price of the first branch is therefore not in the force. It is in the record: in the fact that the domain has two wells, and that making them one is not a bijection.

## 7. What Is Not Fixed

The paper fixes no magnitude. The anisotropy energy, the volume and the temperature of a magnet are measured, and the twin takes them as inputs. The form of the potential of gravity is not derived here. The heat of the loop along the axis is exact at zero temperature and is an upper regime, not a bound: a real bit switches earlier with thermal help and can be reset near the bound of Landauer by a field across the axis [5]. The loop for a field at an angle is computed in the twin and is not a theorem. Radiation is outside both branches as stated: a body that radiates is not a motion under a potential alone.

## 8. The Numerical Twin

The twin of Appendix B runs the same objects in numbers and adds what the kernel does not have: a loop at an angle, joules, and an orbit.

**The wells and the curve.** Of 3001 fields from $-1.5$ to 1.5 in thousandths, 1999 carry both wells, and they are those between $-1$ and 1. The drop at the field one is 2.00000 units. On the curve of Section 3, at 359 angles, the slope, the stiffness and the departure from the astroid are zero to rounding.

**A loop five degrees from the axis.** The field is swept from 1.5 to $-1.5$ and back in steps of one ten-thousandth, and the state follows its well.

| Quantity | Found | Compared with |
|---|---|---|
| Jumps in one loop | 2 | 2 |
| Remanence | 0.99619 | cosine of five degrees, 0.99619 |
| Switching field | 0.76650 | formula of Stoner and Wohlfarth, 0.76643 [1] |
| Area of the loop | 3.03574 | energy released at the two jumps, 3.03592 |

**The price in joules.** At an anisotropy energy of 40 times $kT$ at 300 K, the usual condition for a bit that lasts [6, 7], one switch, half the loop, releases 5.030 times $10^{-19}$ J. The bound of Landauer at that temperature is 2.871 times $10^{-21}$ J. The ratio is 175.

**An orbit.** A body under the potential of Newton starts at the far point of an ellipse of eccentricity one half and is stepped through one period by the scheme of Verlet [11] in 200000 steps. Its energy changes by less than three parts in a thousand million, its area rate by parts in $10^{14}$, and the work of the force round the orbit is zero to parts in $10^{13}$. With the velocity turned and the same number of steps it returns to its first state to parts in $10^{14}$.

**The maps, and the axis across.** Of the four maps of two states, none undoes the reset and one undoes a step in a weak field. The power of the magnetic force is zero to rounding over 1000 velocities and fields. Across the axis, at 101 fields, the two wells have one energy, no angle lies below them, and at the field one they meet with no moment along the axis.

Fifteen checks pass and none fails. Three limits are stated. A loop on a grid finds the switching field to the step of the grid, and the area and the energy released agree to that step. The orbit is one orbit, and the scheme of Verlet is itself reversible, so the return shows the reversal of the scheme together with that of the motion. And the price in joules is the heat of the path along the axis; it is not the least heat of a reset.

## 9. Discussion: The Reading

The derivation above uses only analysis. This section states the reading from which the premises come, and marks what in it is theorem and what is premise.

**Why two branches.** In the reading of Part II a registration keeps part of what it reads and forgets part [14]. A registration that forgets is a map of many onto one; a registration that forgets nothing is a bijection. Section 6 proves that these are different kinds of map, and Sections 4 and 5 give one physical system of each kind. That magnetism is a system of the first kind and gravity of the second is the content of the two premises, and they are physics.

**Where the price is.** The heat is not a property of the magnetic force, which does no work, nor of every path of the field, since one path releases nothing at zero temperature. It attaches to the map. The paper proves the map is two onto one and cites the bound on its heat.

**What the paper does not claim.** It does not derive the bound of Landauer, the model of the domain, or the law of gravity. It does not claim that gravity keeps no record of any kind; it claims that a motion under a potential is reversible and does no work round a closed path. It does not claim a field theory of either force. It claims that each statement of Section 1.3 marked proved compiles. No theorem of Sections 2 to 8 depends on Part II.

## 10. Predictions, Falsifiers, and What Stands

The paper derives no constant. Its commitments are those of the two premises and of the two entered laws, and they are stated here as commitments: three that the paper says will stand at any future precision, two proposals it says will fail, and the three observations that would refute it.

### 10.1 Three predictions that will stand

1. **A magnetic bit is not reset for less than the bound.** `no_map_undoes_the_reset` gives the map; the bound gives the heat [2]. Resets of magnetic bits have been measured at the bound [5]. The prediction is that none is found below it.
2. **A body under gravity alone returns with its energy.** `energy_is_constant` and `a_closed_path_does_no_work` give it. The prediction is that no closed orbit under gravity alone, without radiation or friction, gains or loses energy in a round trip.
3. **No magnetic source is found.** The searches have found none [9]. The prediction is that the magnetic force keeps doing no work on a charge, as `the_magnetic_force_does_no_work` states of the field without sources.

### 10.2 Two proposals that will fail

1. **A memory that forgets for nothing.** Every proposal to reset a bit, magnetic or other, with less heat than the bound at the temperature of its surroundings either keeps the bit somewhere else or is not a reset. `the_reset_is_no_step_of_a_flow` is the reason: a reset is a step of no reversible dynamics.
2. **A static record kept by a potential alone.** Every proposal in which bodies under a potential alone end a closed cycle in a state that remembers the direction of the cycle fails `the_reversed_path_is_a_motion` and `a_closed_path_does_no_work`.

### 10.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise or an entered law, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment's printed uncertainties.

1. **A reset of a bit below $kT\ln 2$.** It refutes the entered bound, and with it the reading of the two-onto-one map of `no_map_undoes_the_reset` as the carrier of heat.
2. **A loop under gravity alone.** A cycle of bodies under gravity, without radiation or friction, that returns to its configuration with a changed energy refutes the field `moves`, through `energy_is_constant`.
3. **An isolated magnetic charge.** It refutes the entered law that the magnetic field has no source, and it ends the scope of `the_magnetic_force_does_no_work`: on such a charge the field does work.

Apart from them stands the formal claim, which no observation touches and one compilation settles: every theorem named in this text prints its axioms in Appendix D, and a line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved.

### 10.4 What kind of result this is

It is not a new physics. It is a change in how a known distinction can be checked. That a magnet holds a bit and pays to forget it, and that a body under a potential holds none and pays nothing, is here a single file whose every step the kernel has verified, whose every assumption is one field of one structure, and whose numbers are computed and printed. A reader who doubts a step can name the line.

The implication from `Premises` to the five statements of `two_branches` is checked by the Lean kernel. No experiment and no later revision of physics alters an implication. Experiment remains free to test whether nature satisfies the premises, and that is all it can test here. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and the structure `Premises` is printed for that purpose. What stands is the tables of Section 1.3.

## 11. Part II · The Reading

*This part is the reading from which the paper takes its place in the series. It is premise-grade. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 8 depends on it. The seat it names, and the statements it rests on, are those of Nothing Escapes, Least Erasure (Islam, 2026a), where they are proved in their own domain.*

### 11.1 One Arrow, Read Twice

The series reads physics on one seat: a reflection of the plane, the line it fixes, and a registration that keeps the height of a point and forgets its side. A point off the line has a partner, its mirror image, and the registration gives the two one value. A point on the line is its own partner. Erasure is what the registration does to a pair off the line, and one statement proved there in its own domain is that the least erasure is none: nothing stands off the line.

Physics has used that one arrow twice. Magnetism is the arrow with a pair. The two wells of a domain are a point and its partner: one field, one energy across the axis, two moments. The record of the domain is which of the two it is in, and a strong field is the registration, sending both to one. Section 4 proves the map and Section 6 that no reversible dynamics performs it. On the reading that is the priced branch: a bit stands off the line, and registering it is paid for.

Gravity is the arrow with no pair. Its sources have one sign. A mass has no partner of the opposite sign for a field to merge it with, so on the reading every source of gravity is on the line, and a registration that finds nothing off the line erases nothing. Section 5 proves what such a branch looks like from outside: energy returned, paths that run backwards, no work round a closed path. The companion paper on gravity forces the law itself (Islam, 2026b). On the reading that is the reversible branch.

The two are one registration and not two forces set side by side. Gravity is the fold onto the line with nothing left over; magnetism is the pair the fold would merge. The magnetic force does no work, and the reading says why the price is elsewhere: the price belongs to the bit, not to the push.

### 11.2 What the Reading Adds, and What It Does Not

The reading adds two identifications to the theorems. The first is that the two wells of a domain are a point and its partner under the fold; the paper writes its consequence as the field `wells`. The second is that gravity has no point off the line because its sources have one sign; the paper writes its consequence as the field `moves`. Neither identification is a theorem of this paper.

The reading has a consequence for an old difference between the two fields. Magnetism has always come in units: the flux through a superconducting ring is counted, and a single magnetic charge would force every electric charge to be counted. On the reading a unit is a registered bit, and a field with nothing off the line has no bit to register. That gravity has resisted the same treatment is then a fact of kind and not of difficulty. This is stated at the grade of a reading. No field theory is written or implied.

One question is left open and is named: whether gravitational radiation is a record on the reversible branch or a leak with a price. The premises of this paper do not reach it.

Two falsifiers belong to the reading and stand beside the three of Section 10.3. A negative gravitational mass, the possibility examined by Bondi (Bondi, 1957), would put a source of gravity off the line and give gravity a bit. A static gravitational field that keeps a remanent state after a closed cycle of its sources would be a loop on the branch the reading says has none.

## 12. Closure

The two branches of the arrow are no longer informal prose. From one function of an angle and a field, and from a position, a velocity and a potential in an inner product space, and nothing more, Lean 4 with Mathlib compiles the two wells and the interval on which both stand, the drop of twice the field, the curve on which a well ends with its converse, the meeting of the wells across the axis, the reset that no map undoes, the heat of a change and of a cycle, the constant energy, the reversed motion, the closed path without work, the constant area rate, the bijection of every step of a flow, and the reset as a step of none. No axiom is declared. No proof is left open. No cost is entered by hand: every energy in the file is a value of one function. No headline theorem closes by its own hypothesis or over a structure that carries its conclusion.

The numerical twin drives a domain round a loop five degrees from its axis and finds the remanence, the switching field of the formula and an area equal to the energy released at the two jumps; it prices one switch at 175 times the bound of Landauer at the usual condition for a lasting bit; and it runs an orbit that keeps its energy and returns when its velocity is turned.

Every boundary is in plain sight. That the domain keeps its well while the well stands is one field of one printed structure, and that gravity has a potential is another. That a small magnet is one domain with the energy used is the classical model, entered. That erasing a bit releases at least the bound is classical, entered and measured; the heat of the loop is the price of one path and is stated as that. That the magnetic field has no source is classical, entered. That the two wells are a pair under the fold and that gravity has none is a reading, premise-grade, and its consequence for the quantum of each field is open. No magnitude is derived, here or anywhere in the paper.

That structure is not an arbitrary postulate. The two statements the reading rests on, Existence and Least Erasure, are theorems in their own domain: each has its own compiled Lean file, with no axiom declared, listed in the Lean Library Reference. There they are proved. The Heat Bridge, which joins erasure to heat, is a theorem there as well; the bridge spoken of below is a different one, from that domain to physics. Here they are used, and the difference is stated. Between that domain and the two branches lies a physical bridge: that a registration with a pair is a magnet and a registration with none is gravity. This paper does not claim the bridge as a theorem. It writes the bridge down as `Premises`, so that the engine imports nothing outside Mathlib and can be checked alone, and so that a reader can see exactly which sentence carries the physics.

Two things are therefore separate, and the paper keeps them separate. Inside the kernel, the implication from `Premises` to the constant energy of the body and the heat of the record is a mathematical certainty. No experiment, no consensus and no later revision of physics alters it, and anyone can recheck it with one compilation. Outside the kernel stand three falsifiers. They test whether nature satisfies the premises, and so far nature does. What survives both is not opinion. It is a theorem, and a physics that has met every test of its premises.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file and the Fortran twin are written by a language model under the author's direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Classical results that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are computed, from inputs that Appendix B prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. E. C. Stoner and E. P. Wohlfarth, Phil. Trans. R. Soc. A 240 (1948) 599.
2. R. Landauer, IBM J. Res. Dev. 5 (1961) 183.
3. C. H. Bennett, Int. J. Theor. Phys. 21 (1982) 905.
4. A. Bérut et al., Nature 483 (2012) 187.
5. J. Hong, B. Lambson, S. Dhuey and J. Bokor, Sci. Adv. 2 (2016) e1501492.
6. L. Néel, Ann. Géophys. 5 (1949) 99.
7. W. F. Brown, Phys. Rev. 130 (1963) 1677.
8. P. A. M. Dirac, Proc. R. Soc. A 133 (1931) 60.
9. B. Acharya et al. (MoEDAL), Nature 602 (2022) 63.
10. I. Newton, Philosophiae Naturalis Principia Mathematica (1687).
11. L. Verlet, Phys. Rev. 159 (1967) 98.
12. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
13. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
14. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
15. M. F. Islam, Immanent Gravity as a Machine-Checked Mathematical Theorem, edition 4.0.0 (2026b).
16. H. Bondi, Rev. Mod. Phys. 29 (1957) 423.

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its engine uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main, read at commit 38f6678.

17. Root Axiom and Existence: Publication Library/Philosophy/Metaphysics/Root Axiom/TOE_Zero.lean. Compiled alone in core Lean 4.19.0, exit 0.
18. RH master: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_44_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.
19. Existence, as carried in the RH master: line 6635.
20. Heat Bridge: RH master, Parts VII-c and VII-d.
21. Prime Freedom: RH master, Parts XIII and XIV.
22. Freedom Arrow: RH master, Part XV.
23. Least Erasure: protocols/RH One Bit/Nothing Escapes Three Plus One/Least_Erasure.lean. Compiled alone in core Lean 4.19.0, exit 0.
24. Second Law: Publication Library/Mathematics/Mathematical Physics/Second_Law_Theorem_v1_0_0_CC.pdf, with its Lean file printed inside.
25. P versus NP master: FINAL_BINDING/PNP Binding/PNP_Normal_Form_Paper_v1_14_0_CC.lean
26. ZFC seal: lean/ZFC_Block_Hardened_FINAL_v2_0_0_Hermetically_Sealed.lean
27. No Second Sovereign: Publication Library/Mathematics/Millennium Series/No_Second_Sovereign_v1_0_0_CC.lean
28. Future Proof Empirical Witness Seal: Publication Library/Mathematics/Millennium Series/Future_Proof_Empirical_Witness_Seal_v1_0_0_CC.lean

## Appendix A · SPHYS_Two_Branches_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 42 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D.

```lean
/-
SPHYS_Two_Branches_CC.lean · the priced branch and the reversible branch of one arrow, on real analysis
RATIONALE. The engine of edition 1.4.0 entered the cost of each branch by hand (one and zero) and compared the two
  numbers. This file replaces it. The priced branch is the energy of a single magnetic domain, a function of an
  angle and a field, and its wells are found. The reversible branch is motion under a force that has a potential,
  in any real inner product space, and its energy is differentiated. The difference between the branches is then a
  theorem about maps: a step of a flow is a bijection and the switching of the domain is not.
DESIGN. Parts, in order.
    Part I    The energy of the domain, field along the axis. `energy_hasDerivAt`, `slope_hasDerivAt`.
              `aligned_is_a_minimum`, `aligned_is_a_maximum`, `both_wells_exactly_inside`.
              `the_field_does_not_fix_the_state`. `the_drop_at_switching`.
    Part II   The field at an angle. `energy2_hasDerivAt`, `slope2_hasDerivAt`, `the_switching_curve`,
              `only_the_switching_curve`, `the_switching_curve_is_an_astroid`. The field across the axis:
              `across_the_axis_the_two_wells_have_one_energy`, `at_the_cusp_the_wells_meet`.
    Part III  The record of the domain. `step`, `a_strong_field_erases`, `no_map_undoes_the_reset`,
              `a_switch_costs_at_least_two`, `a_cycle_costs_at_least_four`.
    Part IV   Motion under a potential. `energy_is_constant`, `the_reversed_path_is_a_motion`,
              `the_reversed_path_has_the_same_energy`, `a_closed_path_does_no_work`.
              `the_area_rate_is_constant`. `newton_potential`.
    Part V    The two branches as maps. `Flow`, `a_step_of_a_flow_is_a_bijection`,
              `the_reset_is_no_step_of_a_flow`. `the_magnetic_force_does_no_work`.
    Part VI   `Premises`; `two_branches`; `fallPremises`.
WHAT IS NOT PROVED HERE (read before citing).
    (a) That a magnet is one domain with one axis, and that it stays in its well while the well exists. The first is
        the model of Stoner and Wohlfarth; the second is a field of `Premises`.
    (b) That gravity has a potential. It is a field of `Premises`. The inverse-square law is not derived.
    (c) The bound of Landauer and every number in joules. They are cited and computed in the twin.
RISK. Part I takes the field along the axis; Part II gives the curve for any angle but not the loop. Temperature
  is zero throughout: no thermal switching. The heat of Part III is the heat of the field along the axis and is
  not a floor: across the axis the two wells meet with no energy released (Part II). What holds for every path
  of the field is the statement about maps of Part V.
NON-NEGOTIABLE. No axiom is declared, no sorry. No cost is entered by hand: every energy is a value of `energy`.
  No headline theorem closes over a structure that carries its conclusion. The kernel line of every theorem the
  paper names is printed at the end.
-/
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Deriv
import Mathlib.Analysis.InnerProductSpace.Calculus
import Mathlib.Analysis.Calculus.MeanValue
import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus
import Mathlib.LinearAlgebra.CrossProduct
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Convert

namespace SPHYS.Arrow
open Real Matrix

/-! ## Part I. The energy of the domain, field along the axis -/

/-- Energy of one domain in units of twice the anisotropy energy: `θ` is the angle of the moment from the axis,
`h` the field along the axis in units of the anisotropy field. -/
noncomputable def energy (h θ : ℝ) : ℝ := sin θ ^ 2 / 2 - h * cos θ
/-- Its slope in the angle. -/
noncomputable def slope (h θ : ℝ) : ℝ := sin θ * cos θ + h * sin θ
/-- Its stiffness: the slope of the slope. -/
noncomputable def stiffness (h θ : ℝ) : ℝ := cos θ ^ 2 - sin θ ^ 2 + h * cos θ

theorem energy_hasDerivAt (h θ : ℝ) : HasDerivAt (energy h) (slope h θ) θ := by
  have h1 := ((hasDerivAt_sin θ).pow 2).div_const 2
  have h2 := (hasDerivAt_cos θ).const_mul h
  have := h1.sub h2
  convert this using 1
  unfold slope; ring

theorem slope_hasDerivAt (h θ : ℝ) : HasDerivAt (slope h) (stiffness h θ) θ := by
  have h1 := (hasDerivAt_sin θ).mul (hasDerivAt_cos θ)
  have h2 := (hasDerivAt_sin θ).const_mul h
  have := h1.add h2
  convert this using 1
  unfold stiffness; ring

/-- The two states along the axis are stationary at every field. -/
theorem the_axis_is_stationary (h : ℝ) : slope h 0 = 0 ∧ slope h π = 0 := by simp [slope]

theorem stiffness_on_the_axis (h : ℝ) : stiffness h 0 = 1 + h ∧ stiffness h π = 1 - h := by
  refine ⟨by simp [stiffness], ?_⟩
  simp [stiffness]; ring

/-- The energy above the aligned state, factored. -/
theorem energy_above_aligned (h θ : ℝ) :
    energy h θ - energy h 0 = (1 - cos θ) * ((1 + cos θ) / 2 + h) := by
  have := sin_sq_add_cos_sq θ
  simp only [energy, sin_zero, cos_zero]; nlinarith

theorem energy_above_reversed (h θ : ℝ) :
    energy h θ - energy h π = (1 + cos θ) * ((1 - cos θ) / 2 - h) := by
  have := sin_sq_add_cos_sq θ
  simp only [energy, sin_pi, cos_pi]; nlinarith

/-- With the field above minus one, the aligned state is a minimum over every angle near it:
every angle whose cosine exceeds `-1 - 2h`. With the field at zero or above, that is every angle. -/
theorem aligned_is_a_minimum {h θ : ℝ} (hc : -1 - 2 * h ≤ cos θ) : energy h 0 ≤ energy h θ := by
  have h1 := energy_above_aligned h θ
  have h2 : 0 ≤ 1 - cos θ := by linarith [cos_le_one θ]
  have h3 : 0 ≤ (1 + cos θ) / 2 + h := by linarith
  nlinarith [mul_nonneg h2 h3]

/-- With the field below minus one, the aligned state is the maximum over every angle: its well is gone. -/
theorem aligned_is_a_maximum {h : ℝ} (hh : h ≤ -1) (θ : ℝ) : energy h θ ≤ energy h 0 := by
  have h1 := energy_above_aligned h θ
  have h2 : 0 ≤ 1 - cos θ := by linarith [cos_le_one θ]
  have h3 : (1 + cos θ) / 2 + h ≤ 0 := by linarith [cos_le_one θ]
  nlinarith [mul_nonneg h2 (neg_nonneg.mpr h3)]

theorem reversed_is_a_minimum {h θ : ℝ} (hc : cos θ ≤ 1 - 2 * h) : energy h π ≤ energy h θ := by
  have h1 := energy_above_reversed h θ
  have h2 : 0 ≤ 1 + cos θ := by linarith [neg_one_le_cos θ]
  have h3 : 0 ≤ (1 - cos θ) / 2 - h := by linarith
  nlinarith [mul_nonneg h2 h3]

theorem reversed_is_a_maximum {h : ℝ} (hh : 1 ≤ h) (θ : ℝ) : energy h θ ≤ energy h π := by
  have h1 := energy_above_reversed h θ
  have h2 : 0 ≤ 1 + cos θ := by linarith [neg_one_le_cos θ]
  have h3 : (1 - cos θ) / 2 - h ≤ 0 := by linarith [neg_one_le_cos θ]
  nlinarith [mul_nonneg h2 (neg_nonneg.mpr h3)]

/-- A well: a stationary state with positive stiffness. -/
def Well (h θ : ℝ) : Prop := slope h θ = 0 ∧ 0 < stiffness h θ

/-- Both states along the axis are wells exactly when the field lies strictly between minus one and one. -/
theorem both_wells_exactly_inside (h : ℝ) : (Well h 0 ∧ Well h π) ↔ -1 < h ∧ h < 1 := by
  obtain ⟨s0, sp⟩ := the_axis_is_stationary h
  obtain ⟨k0, kp⟩ := stiffness_on_the_axis h
  unfold Well; rw [s0, sp, k0, kp]
  constructor
  · rintro ⟨⟨-, a⟩, -, b⟩; constructor <;> linarith
  · rintro ⟨a, b⟩; exact ⟨⟨rfl, by linarith⟩, rfl, by linarith⟩

/-- Inside, one field carries two wells with opposite moments: the field does not fix the state. -/
theorem the_field_does_not_fix_the_state {h : ℝ} (h1 : -1 < h) (h2 : h < 1) :
    Well h 0 ∧ Well h π ∧ cos 0 ≠ cos π := by
  obtain ⟨a, b⟩ := (both_wells_exactly_inside h).mpr ⟨h1, h2⟩
  exact ⟨a, b, by simp; norm_num⟩

/-- The energy that the reversed state stands above the aligned one is twice the field. At the field one,
where the reversed well ends, it is two. -/
theorem the_drop_at_switching (h : ℝ) : energy h π - energy h 0 = 2 * h := by
  simp [energy]; ring

/-! ## Part II. The field at an angle -/

/-- Energy with a field of components `hx` along the axis and `hy` across it. -/
noncomputable def energy2 (hx hy θ : ℝ) : ℝ := sin θ ^ 2 / 2 - hx * cos θ - hy * sin θ
noncomputable def slope2 (hx hy θ : ℝ) : ℝ := sin θ * cos θ + hx * sin θ - hy * cos θ
noncomputable def stiffness2 (hx hy θ : ℝ) : ℝ := cos θ ^ 2 - sin θ ^ 2 + hx * cos θ + hy * sin θ

theorem energy2_hasDerivAt (hx hy θ : ℝ) : HasDerivAt (energy2 hx hy) (slope2 hx hy θ) θ := by
  have h1 := ((hasDerivAt_sin θ).pow 2).div_const 2
  have h2 := (hasDerivAt_cos θ).const_mul hx
  have h3 := (hasDerivAt_sin θ).const_mul hy
  have := (h1.sub h2).sub h3
  convert this using 1
  unfold slope2; ring

theorem slope2_hasDerivAt (hx hy θ : ℝ) : HasDerivAt (slope2 hx hy) (stiffness2 hx hy θ) θ := by
  have h1 := (hasDerivAt_sin θ).mul (hasDerivAt_cos θ)
  have h2 := (hasDerivAt_sin θ).const_mul hx
  have h3 := (hasDerivAt_cos θ).const_mul hy
  have := (h1.add h2).sub h3
  convert this using 1
  unfold stiffness2; ring

/-- The switching curve. At the field `(-cos³ θ, sin³ θ)` the state at angle `θ` is stationary and has lost its
stiffness: a well ends there. -/
theorem the_switching_curve (θ : ℝ) :
    slope2 (-cos θ ^ 3) (sin θ ^ 3) θ = 0 ∧ stiffness2 (-cos θ ^ 3) (sin θ ^ 3) θ = 0 := by
  have h := sin_sq_add_cos_sq θ
  constructor
  · unfold slope2
    have : sin θ * cos θ + -cos θ ^ 3 * sin θ - sin θ ^ 3 * cos θ
        = sin θ * cos θ * (1 - (sin θ ^ 2 + cos θ ^ 2)) := by ring
    rw [this, h]; ring
  · unfold stiffness2
    have : cos θ ^ 2 - sin θ ^ 2 + -cos θ ^ 3 * cos θ + sin θ ^ 3 * sin θ
        = (cos θ ^ 2 - sin θ ^ 2) * (1 - (sin θ ^ 2 + cos θ ^ 2)) := by ring
    rw [this, h]; ring

/-- Conversely, a field at which the state at `θ` is stationary without stiffness is that field. -/
theorem only_the_switching_curve {hx hy θ : ℝ} (h1 : slope2 hx hy θ = 0) (h2 : stiffness2 hx hy θ = 0) :
    hx = -cos θ ^ 3 ∧ hy = sin θ ^ 3 := by
  have h := sin_sq_add_cos_sq θ
  unfold slope2 at h1; unfold stiffness2 at h2
  constructor
  · -- hx = hx (s² + c²) = s (hx s) + c (hx c)
    have e1 : hx = sin θ * (hx * sin θ - hy * cos θ) + cos θ * (hx * cos θ + hy * sin θ) := by
      have : sin θ * (hx * sin θ - hy * cos θ) + cos θ * (hx * cos θ + hy * sin θ)
          = hx * (sin θ ^ 2 + cos θ ^ 2) := by ring
      rw [this, h, mul_one]
    have a : hx * sin θ - hy * cos θ = -(sin θ * cos θ) := by linarith
    have b : hx * cos θ + hy * sin θ = -(cos θ ^ 2 - sin θ ^ 2) := by linarith
    rw [e1, a, b]; ring
  · have e1 : hy = sin θ * (hx * cos θ + hy * sin θ) - cos θ * (hx * sin θ - hy * cos θ) := by
      have : sin θ * (hx * cos θ + hy * sin θ) - cos θ * (hx * sin θ - hy * cos θ)
          = hy * (sin θ ^ 2 + cos θ ^ 2) := by ring
      rw [this, h, mul_one]
    have a : hx * sin θ - hy * cos θ = -(sin θ * cos θ) := by linarith
    have b : hx * cos θ + hy * sin θ = -(cos θ ^ 2 - sin θ ^ 2) := by linarith
    rw [e1, a, b]; ring

/-- The curve is an astroid: the squares of the components, as cubes of `cos² θ` and `sin² θ`, have
cube roots that sum to one. -/
theorem the_switching_curve_is_an_astroid (θ : ℝ) :
    (-cos θ ^ 3) ^ 2 = (cos θ ^ 2) ^ 3 ∧ (sin θ ^ 3) ^ 2 = (sin θ ^ 2) ^ 3 ∧ cos θ ^ 2 + sin θ ^ 2 = 1 := by
  refine ⟨by ring, by ring, ?_⟩
  linarith [sin_sq_add_cos_sq θ]

/-- With the field across the axis, the energy is a square in the sine of the angle. -/
theorem across_the_axis (hy θ : ℝ) : energy2 0 hy θ = (sin θ - hy) ^ 2 / 2 - hy ^ 2 / 2 := by
  unfold energy2; ring

/-- Across the axis the two wells have one energy: the angle and its mirror in the axis across. -/
theorem across_the_axis_the_two_wells_have_one_energy (hy θ : ℝ) :
    energy2 0 hy (π - θ) = energy2 0 hy θ := by
  simp [energy2, sin_pi_sub]

/-- Across the axis, an angle whose sine is the field is a minimum over every angle. -/
theorem across_the_axis_minimum {hy θ : ℝ} (h : sin θ = hy) (φ : ℝ) : energy2 0 hy θ ≤ energy2 0 hy φ := by
  rw [across_the_axis, across_the_axis, h]
  nlinarith [sq_nonneg (sin φ - hy)]

/-- At the field one across the axis the two wells meet: the moment has no part along the axis, and the angle
and its mirror carry one moment. No energy is released there. -/
theorem at_the_cusp_the_wells_meet {θ : ℝ} (h : sin θ = 1) : cos θ = 0 ∧ cos (π - θ) = cos θ := by
  have h2 := sin_sq_add_cos_sq θ
  have c : cos θ = 0 := by
    have : cos θ ^ 2 = 0 := by rw [h] at h2; linarith
    exact pow_eq_zero_iff (two_ne_zero) |>.mp this
  exact ⟨c, by rw [cos_pi_sub, c, neg_zero]⟩

/-! ## Part III. The record of the domain -/

/-- One step of the record: the state `true` is the aligned well, `false` the reversed one. A well that the
field has ended is left; a well that stands is kept. -/
noncomputable def step (h : ℝ) (s : Bool) : Bool := if 1 ≤ h then true else if h ≤ -1 then false else s

theorem a_weak_field_keeps {h : ℝ} (h1 : -1 < h) (h2 : h < 1) (s : Bool) : step h s = s := by
  unfold step; rw [if_neg (not_le.mpr h2), if_neg (not_le.mpr h1)]

/-- A strong field sends both states to one: the bit is erased. -/
theorem a_strong_field_erases {h : ℝ} (hh : 1 ≤ h) : step h true = step h false := by
  unfold step; rw [if_pos hh, if_pos hh]

/-- No map undoes the reset. -/
theorem no_map_undoes_the_reset {h : ℝ} (hh : 1 ≤ h) : ¬ ∃ g : Bool → Bool, ∀ s, g (step h s) = s := by
  rintro ⟨g, hg⟩
  have a := hg true; have b := hg false
  rw [a_strong_field_erases hh] at a
  exact absurd (a.symm.trans b) (by decide)

/-- The energy released at a step: the energy of the state left minus that of the state reached, at the field
of the step. The energies are values of `energy`. -/
noncomputable def angle (s : Bool) : ℝ := if s then 0 else π
noncomputable def released (h : ℝ) (s : Bool) : ℝ := energy h (angle s) - energy h (angle (step h s))

theorem released_nonneg (h : ℝ) (s : Bool) : 0 ≤ released h s := by
  unfold released step
  by_cases h1 : 1 ≤ h
  · rw [if_pos h1]; cases s
    · have := the_drop_at_switching h; simp only [angle, Bool.false_eq_true, if_false, if_true]; linarith
    · simp [angle]
  · rw [if_neg h1]
    by_cases h2 : h ≤ -1
    · rw [if_pos h2]; cases s
      · simp [angle]
      · have := the_drop_at_switching h; simp only [angle, Bool.false_eq_true, if_false, if_true]; linarith
    · rw [if_neg h2]; simp

/-- A step that changes the state releases at least two units. -/
theorem a_switch_costs_at_least_two {h : ℝ} {s : Bool} (hs : step h s ≠ s) : 2 ≤ released h s := by
  unfold released
  unfold step at hs ⊢
  by_cases h1 : 1 ≤ h
  · rw [if_pos h1] at hs ⊢; cases s
    · have := the_drop_at_switching h; simp only [angle, Bool.false_eq_true, if_false, if_true]; linarith
    · exact absurd rfl hs
  · rw [if_neg h1] at hs ⊢
    by_cases h2 : h ≤ -1
    · rw [if_pos h2] at hs ⊢; cases s
      · exact absurd rfl hs
      · have := the_drop_at_switching h; simp only [angle, Bool.false_eq_true, if_false, if_true]; linarith
    · rw [if_neg h2] at hs; exact absurd rfl hs

/-- The record after a history of fields, and the energy released along it. -/
noncomputable def run (h : ℕ → ℝ) (s0 : Bool) : ℕ → Bool
  | 0 => s0
  | n + 1 => step (h n) (run h s0 n)
noncomputable def heat (h : ℕ → ℝ) (s0 : Bool) : ℕ → ℝ
  | 0 => 0
  | n + 1 => heat h s0 n + released (h n) (run h s0 n)

theorem heat_monotone (h : ℕ → ℝ) (s0 : Bool) (n : ℕ) : heat h s0 n ≤ heat h s0 (n + 1) := by
  show heat h s0 n ≤ heat h s0 n + released (h n) (run h s0 n)
  linarith [released_nonneg (h n) (run h s0 n)]

/-- A cycle: two steps that change the state, one after the other. It releases at least four units. -/
theorem a_cycle_costs_at_least_four (h : ℕ → ℝ) (s0 : Bool) (n : ℕ)
    (c1 : run h s0 (n + 1) ≠ run h s0 n) (c2 : run h s0 (n + 2) ≠ run h s0 (n + 1)) :
    heat h s0 n + 4 ≤ heat h s0 (n + 2) := by
  have a := a_switch_costs_at_least_two (h := h n) (s := run h s0 n) c1
  have b := a_switch_costs_at_least_two (h := h (n + 1)) (s := run h s0 (n + 1)) c2
  show heat h s0 n + 4 ≤ heat h s0 n + released (h n) (run h s0 n) + released (h (n + 1)) (run h s0 (n + 1))
  linarith

/-! ## Part IV. Motion under a potential -/

section Motion
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- A motion under the potential `V` with gradient `g`: position `x`, velocity `v`, and the law that the rate of
the velocity is minus the gradient at the position. The gradient is asked for only along the path. -/
structure Motion (V : E → ℝ) (g : E → E) (x v : ℝ → E) : Prop where
  pos : ∀ t, HasDerivAt x (v t) t
  law : ∀ t, HasDerivAt v (-g (x t)) t
  grad : ∀ t, HasFDerivAt V (innerSL ℝ (g (x t))) (x t)

/-- The energy of a motion: half the square of the speed plus the potential. -/
noncomputable def mech (V : E → ℝ) (x v : ℝ → E) (t : ℝ) : ℝ := ‖v t‖ ^ 2 / 2 + V (x t)

theorem mech_hasDerivAt {V : E → ℝ} {g : E → E} {x v : ℝ → E} (m : Motion V g x v) (t : ℝ) :
    HasDerivAt (mech V x v) 0 t := by
  have h1 : HasDerivAt (fun s => ‖v s‖ ^ 2) (2 * inner (v t) (-g (x t)) : ℝ) t := by
    have := (m.law t).norm_sq
    simpa using this
  have h2 : HasDerivAt (fun s => V (x s)) (inner (g (x t)) (v t) : ℝ) t := by
    have := (m.grad t).comp_hasDerivAt t (m.pos t)
    simpa using this
  have := (h1.div_const 2).add h2
  convert this using 1
  rw [inner_neg_right, real_inner_comm (g (x t)) (v t)]; ring

/-- The energy of a motion is the same at every time. -/
theorem energy_is_constant {V : E → ℝ} {g : E → E} {x v : ℝ → E} (m : Motion V g x v) (s t : ℝ) :
    mech V x v s = mech V x v t :=
  is_const_of_deriv_eq_zero (fun u => (mech_hasDerivAt m u).differentiableAt)
    (fun u => (mech_hasDerivAt m u).deriv) s t

/-- The path run backwards, with the velocity turned, is a motion under the same potential. -/
theorem the_reversed_path_is_a_motion {V : E → ℝ} {g : E → E} {x v : ℝ → E} (m : Motion V g x v) :
    Motion V g (fun t => x (-t)) (fun t => -v (-t)) where
  pos t := by
    have := (m.pos (-t)).scomp t (hasDerivAt_neg t)
    simpa using this
  law t := by
    have := ((m.law (-t)).scomp t (hasDerivAt_neg t)).neg
    simpa using this
  grad t := m.grad (-t)

omit [InnerProductSpace ℝ E] in
theorem the_reversed_path_has_the_same_energy (V : E → ℝ) (x v : ℝ → E) (t : ℝ) :
    mech V (fun t => x (-t)) (fun t => -v (-t)) t = mech V x v (-t) := by
  simp [mech]

/-- Around a closed path the force does no work: the integral of the gradient against the velocity is the
difference of the potential at the ends, and the ends are one point. -/
theorem a_closed_path_does_no_work {V : E → ℝ} {g : E → E} {x v : ℝ → E} {a b : ℝ}
    (pos : ∀ t, HasDerivAt x (v t) t) (grad : ∀ t, HasFDerivAt V (innerSL ℝ (g (x t))) (x t))
    (hi : IntervalIntegrable (fun t => (inner (g (x t)) (v t) : ℝ)) MeasureTheory.volume a b)
    (closed : x a = x b) : ∫ t in a..b, (inner (g (x t)) (v t) : ℝ) = 0 := by
  have h2 : ∀ t ∈ Set.uIcc a b, HasDerivAt (fun s => V (x s)) (inner (g (x t)) (v t) : ℝ) t := by
    intro t _
    have := (grad t).comp_hasDerivAt t (pos t)
    simpa using this
  rw [intervalIntegral.integral_eq_sub_of_hasDerivAt h2 hi, closed, sub_self]

end Motion

/-- In a plane, under a force along the line to the centre, the area swept in unit time is constant. -/
theorem the_area_rate_is_constant {x y u w f : ℝ → ℝ}
    (hx : ∀ t, HasDerivAt x (u t) t) (hy : ∀ t, HasDerivAt y (w t) t)
    (hu : ∀ t, HasDerivAt u (-(f t * x t)) t) (hw : ∀ t, HasDerivAt w (-(f t * y t)) t) (s t : ℝ) :
    x s * w s - y s * u s = x t * w t - y t * u t := by
  have d : ∀ r, HasDerivAt (fun r => x r * w r - y r * u r) 0 r := by
    intro r
    have := ((hx r).mul (hw r)).sub ((hy r).mul (hu r))
    convert this using 1; ring
  exact is_const_of_deriv_eq_zero (fun r => (d r).differentiableAt) (fun r => (d r).deriv) s t

/-- The potential of Newton along a ray: the slope of `-k / r` is `k / r²`. -/
theorem newton_potential (k : ℝ) {r : ℝ} (hr : r ≠ 0) : HasDerivAt (fun r => -k / r) (k / r ^ 2) r := by
  have := (hasDerivAt_inv hr).const_mul (-k)
  convert this using 1
  rw [div_eq_mul_inv]; ring

/-! ## Part V. The two branches as maps -/

/-- A flow on a set of states: a step for every time, the step of no time doing nothing, steps composing. -/
structure Flow (S : Type*) where
  φ : ℝ → S → S
  zero : ∀ s, φ 0 s = s
  add : ∀ a b s, φ (a + b) s = φ a (φ b s)

/-- Every step of a flow is a bijection: it is undone by the step of the opposite time. -/
theorem a_step_of_a_flow_is_a_bijection {S : Type*} (F : Flow S) (t : ℝ) : Function.Bijective (F.φ t) := by
  have l : ∀ s, F.φ (-t) (F.φ t s) = s := fun s => by rw [← F.add, neg_add_cancel, F.zero]
  have r : ∀ s, F.φ t (F.φ (-t) s) = s := fun s => by rw [← F.add, add_neg_cancel, F.zero]
  exact ⟨Function.LeftInverse.injective l, Function.RightInverse.surjective r⟩

/-- The reset of the record is a step of no flow. -/
theorem the_reset_is_no_step_of_a_flow {h : ℝ} (hh : 1 ≤ h) (F : Flow Bool) (t : ℝ) : F.φ t ≠ step h := by
  intro e
  have inj := (a_step_of_a_flow_is_a_bijection F t).1
  rw [e] at inj
  exact absurd (inj (a_strong_field_erases hh)) (by decide)

/-- The magnetic force on a moving charge is across its velocity: it does no work. -/
theorem the_magnetic_force_does_no_work (v B : Fin 3 → ℝ) : v ⬝ᵥ (v ×₃ B) = 0 :=
  dot_self_cross v B

/-! ## Part VI. The premises -/

/-- The physical premises of the paper. -/
structure Premises (E : Type) [NormedAddCommGroup E] [InnerProductSpace ℝ E] where
  /-- the history of the field on the domain, and the state it starts in -/
  field : ℕ → ℝ
  start : Bool
  /-- the record of the domain: it keeps its well while the well stands and leaves it when the field ends it -/
  record : ℕ → Bool
  wells : ∀ n, record n = run field start n
  /-- gravity has a potential, and the body moves by it -/
  V : E → ℝ
  g : E → E
  x : ℝ → E
  v : ℝ → E
  moves : Motion V g x v

variable {E : Type} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- On the premises: the energy of the body is constant and its path reversed is a motion; the heat of the
domain never decreases, every change of the record releases at least two units, and a strong field erases. -/
theorem two_branches (P : Premises E) :
    (∀ s t, mech P.V P.x P.v s = mech P.V P.x P.v t) ∧
    Motion P.V P.g (fun t => P.x (-t)) (fun t => -P.v (-t)) ∧
    (∀ n, heat P.field P.start n ≤ heat P.field P.start (n + 1)) ∧
    (∀ n, P.record (n + 1) ≠ P.record n → heat P.field P.start n + 2 ≤ heat P.field P.start (n + 1)) ∧
    (∀ n, 1 ≤ P.field n → P.record (n + 1) = true) := by
  refine ⟨energy_is_constant P.moves, the_reversed_path_is_a_motion P.moves, heat_monotone _ _, ?_, ?_⟩
  · intro n hn
    rw [P.wells, P.wells] at hn
    have := a_switch_costs_at_least_two (h := P.field n) (s := run P.field P.start n) hn
    show heat P.field P.start n + 2 ≤ heat P.field P.start n + released (P.field n) (run P.field P.start n)
    linarith
  · intro n hn
    rw [P.wells]
    show step (P.field n) (run P.field P.start n) = true
    unfold step; rw [if_pos hn]

/-- The premises are met: a body falling in a uniform field `c`, and a domain driven round a loop. -/
noncomputable def fallPremises (c : E) : Premises E where
  field := fun n => if n % 2 = 0 then 2 else -2
  start := false
  record := run (fun n => if n % 2 = 0 then 2 else -2) false
  wells := fun _ => rfl
  V := fun y => inner c y
  g := fun _ => c
  x := fun t => -(t ^ 2 / 2) • c
  v := fun t => -t • c
  moves :=
    { pos := fun t => by
        have h : HasDerivAt (fun s : ℝ => -(s ^ 2 / 2)) (-t) t := by
          have := ((hasDerivAt_id t).pow 2).div_const 2 |>.neg
          convert this using 1; simp
        simpa using h.smul_const c
      law := fun t => by
        have h : HasDerivAt (fun s : ℝ => -s) (-1) t := (hasDerivAt_id t).neg
        simpa using h.smul_const c
      grad := fun t => (innerSL ℝ c).hasFDerivAt }

/-- The member is not idle: its record changes at the first step and its heat rises by at least two. -/
theorem the_member_pays (c : E) :
    (fallPremises c).record 1 ≠ (fallPremises c).record 0 ∧
    heat (fallPremises c).field (fallPremises c).start 0 + 2 ≤ heat (fallPremises c).field (fallPremises c).start 1 := by
  have h : (fallPremises c).record 1 ≠ (fallPremises c).record 0 := by
    show step (if 0 % 2 = 0 then (2 : ℝ) else -2) false ≠ false
    unfold step; norm_num
  exact ⟨h, (two_branches (fallPremises c)).2.2.2.1 0 h⟩

end SPHYS.Arrow

#print axioms SPHYS.Arrow.energy_hasDerivAt
#print axioms SPHYS.Arrow.slope_hasDerivAt
#print axioms SPHYS.Arrow.the_axis_is_stationary
#print axioms SPHYS.Arrow.stiffness_on_the_axis
#print axioms SPHYS.Arrow.energy_above_aligned
#print axioms SPHYS.Arrow.energy_above_reversed
#print axioms SPHYS.Arrow.aligned_is_a_minimum
#print axioms SPHYS.Arrow.aligned_is_a_maximum
#print axioms SPHYS.Arrow.reversed_is_a_minimum
#print axioms SPHYS.Arrow.reversed_is_a_maximum
#print axioms SPHYS.Arrow.both_wells_exactly_inside
#print axioms SPHYS.Arrow.the_field_does_not_fix_the_state
#print axioms SPHYS.Arrow.the_drop_at_switching
#print axioms SPHYS.Arrow.energy2_hasDerivAt
#print axioms SPHYS.Arrow.slope2_hasDerivAt
#print axioms SPHYS.Arrow.the_switching_curve
#print axioms SPHYS.Arrow.only_the_switching_curve
#print axioms SPHYS.Arrow.the_switching_curve_is_an_astroid
#print axioms SPHYS.Arrow.across_the_axis
#print axioms SPHYS.Arrow.across_the_axis_the_two_wells_have_one_energy
#print axioms SPHYS.Arrow.across_the_axis_minimum
#print axioms SPHYS.Arrow.at_the_cusp_the_wells_meet
#print axioms SPHYS.Arrow.a_weak_field_keeps
#print axioms SPHYS.Arrow.a_strong_field_erases
#print axioms SPHYS.Arrow.no_map_undoes_the_reset
#print axioms SPHYS.Arrow.released_nonneg
#print axioms SPHYS.Arrow.a_switch_costs_at_least_two
#print axioms SPHYS.Arrow.heat_monotone
#print axioms SPHYS.Arrow.a_cycle_costs_at_least_four
#print axioms SPHYS.Arrow.mech_hasDerivAt
#print axioms SPHYS.Arrow.energy_is_constant
#print axioms SPHYS.Arrow.the_reversed_path_is_a_motion
#print axioms SPHYS.Arrow.the_reversed_path_has_the_same_energy
#print axioms SPHYS.Arrow.a_closed_path_does_no_work
#print axioms SPHYS.Arrow.the_area_rate_is_constant
#print axioms SPHYS.Arrow.newton_potential
#print axioms SPHYS.Arrow.a_step_of_a_flow_is_a_bijection
#print axioms SPHYS.Arrow.the_reset_is_no_step_of_a_flow
#print axioms SPHYS.Arrow.the_magnetic_force_does_no_work
#print axioms SPHYS.Arrow.two_branches
#print axioms SPHYS.Arrow.fallPremises
#print axioms SPHYS.Arrow.the_member_pays
```

## Appendix B · Two_Branches_Twin_CC.f90

Fifteen checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C.

```fortran
! Two_Branches_Twin_CC.f90 · twin of SPHYS_Two_Branches_CC.lean
! RATIONALE. The engine proves the wells of one magnetic domain, its switching curve, the heat of its record, the
!   constancy of energy under a potential and the reversal of a motion. This twin runs the same objects in numbers:
!   A the wells and the switching curve; B a loop with the field five degrees from the axis, its remanence, its
!   switching field against the formula of Stoner and Wohlfarth, its area against the heat released at the two
!   jumps; C the price of one switch in joules against the bound of Landauer; D an orbit of Kepler, its energy,
!   its area rate, its return when the velocity is turned, and the work round the closed orbit; E the maps; F the field
!   across the axis, where the two wells have one energy and meet.
! DESIGN. Double precision, no library. Energies of the domain are in units of twice the anisotropy energy K V,
!   fields in units of the anisotropy field: e = sin(t)**2/2 - h*cos(t - psi). The loop follows the well by
!   Newton steps while the stiffness is positive and by descent when it is not. The orbit is stepped by the
!   scheme of Verlet, in units with G M = 1, from the far point of an ellipse of eccentricity one half.
!   Inputs of C: K V = 40 k T at T = 300 K (the usual condition for a bit that lasts ten years);
!   k = 1.380649e-23 J/K (exact, SI 2019).
! RISK. A loop on a grid finds the switching field to the step of the grid. The orbit is one orbit.
! NON-NEGOTIABLE. Every printed value is computed here. The formula of Stoner and Wohlfarth is the thing compared
!   with, not the thing printed as found.
program two_branches_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  real(dp), parameter :: pi = 3.14159265358979323846_dp, kB = 1.380649e-23_dp
  integer :: nfail, npass, i, k, n, nboth, nbad, njump, nundo, g1, g2
  real(dp) :: h, t, psi, dh, m, mold, hold, area, drops, e0, e1, hsw(2), rem, hs, hx, hy, worst
  real(dp) :: q(2), p(2), a(2), dt, per, en0, en, L0, L, werr, lerr, back, work, v(3), b(3), c(3)
  real(dp) :: perswitch, land, tt
  logical :: ok
  nfail = 0; npass = 0

  ! A. the wells along the axis, and the switching curve
  nboth = 0; nbad = 0
  do i = -1500, 1500
    h = i / 1000.0_dp
    ok = (stiff(h, 0.0_dp, 0.0_dp) > 0) .and. (stiff(h, 0.0_dp, pi) > 0)
    if (ok) nboth = nboth + 1
    if (ok .neqv. (abs(h) < 1)) nbad = nbad + 1
  end do
  write(*,'(a,i0,a,i0)') '  fields from -1.5 to 1.5 in thousandths with both wells: ', nboth, '; disagreeing with |h| < 1: ', nbad
  call check('A1 both states along the axis are wells exactly for fields between -1 and 1', nbad == 0 .and. nboth == 1999)
  write(*,'(a,f8.5)') '  energy of the reversed state above the aligned one at field 1: ', en1(1.0_dp, pi) - en1(1.0_dp, 0.0_dp)
  call check('A2 the drop at the switching field is two units', abs(en1(1.0_dp, pi) - en1(1.0_dp, 0.0_dp) - 2) < 1e-14_dp)
  worst = 0
  do i = 1, 359
    t = i * pi / 180
    hx = -cos(t)**3; hy = sin(t)**3
    worst = max(worst, abs(sin(t)*cos(t) + hx*sin(t) - hy*cos(t)), abs(cos(t)**2 - sin(t)**2 + hx*cos(t) + hy*sin(t)))
    worst = max(worst, abs((hx*hx)**(1.0_dp/3) + (hy*hy)**(1.0_dp/3) - 1))
  end do
  write(*,'(a,es9.2)') '  largest slope, stiffness or departure from the astroid on the curve, 359 angles: ', worst
  call check('A3 on the curve (-cos^3, sin^3) the well ends, and the curve is the astroid', worst < 1e-13_dp)

  ! B. a loop with the field five degrees from the axis
  psi = 5 * pi / 180; dh = 1.0e-4_dp
  t = psi; h = 1.5_dp; call relax(h, psi, t)
  area = 0; drops = 0; njump = 0; rem = 0; hsw = 0
  mold = cos(t - psi); hold = h
  do k = 1, 60000
    if (k <= 30000) then
      h = 1.5_dp - k * dh
    else
      h = -1.5_dp + (k - 30000) * dh
    end if
    e0 = en2(h, psi, t); tt = t
    call relax(h, psi, t)
    e1 = en2(h, psi, t)
    if (abs(t - tt) > 0.5_dp) then
      njump = njump + 1; drops = drops + (e0 - e1)
      if (njump <= 2) hsw(njump) = abs(h)
    end if
    m = cos(t - psi)
    area = area + 0.5_dp * (h + hold) * (m - mold)
    if (k == 15000) rem = m
    mold = m; hold = h
  end do
  hs = (cos(psi)**(2.0_dp/3) + sin(psi)**(2.0_dp/3))**(-1.5_dp)
  write(*,'(a,i0)') '  jumps in one loop: ', njump
  write(*,'(a,f8.5,a,f8.5)') '  remanence: ', rem, '; cosine of five degrees: ', cos(psi)
  write(*,'(a,f8.5,a,f8.5,a,f8.5)') '  switching fields found: ', hsw(1), ' and ', hsw(2), '; formula: ', hs
  write(*,'(a,f8.5,a,f8.5)') '  area of the loop: ', area, '; energy released at the two jumps: ', drops
  call check('B1 the loop has two jumps', njump == 2)
  call check('B2 the remanence is the cosine of the angle of the field', abs(rem - cos(psi)) < 1e-6_dp)
  call check('B3 the switching field is that of Stoner and Wohlfarth', abs(hsw(1) - hs) < 2e-3_dp .and. abs(hsw(2) - hs) < 2e-3_dp)
  call check('B4 the area of the loop is the energy released at the jumps', abs(area - drops) < 5e-3_dp .and. area > 3)

  ! C. the price of one switch
  perswitch = 0.5_dp * area * 2 * 40 * kB * 300; land = kB * 300 * log(2.0_dp)
  write(*,'(a,es10.3,a,es10.3,a,f7.1)') '  one switch at K V = 40 k T, 300 K: ', perswitch, ' J; bound of Landauer: ', land, &
    ' J; ratio: ', perswitch / land
  call check('C1 one switch of the domain costs more than a hundred times the bound of Landauer', perswitch / land > 100)

  ! D. an orbit of Kepler: semi-axis 1, eccentricity 1/2, from the far point
  per = 2 * pi; n = 200000; dt = per / n
  q = [1.5_dp, 0.0_dp]; p = [0.0_dp, sqrt((1 - 0.5_dp) / (1 + 0.5_dp))]
  en0 = 0.5_dp * sum(p*p) - 1 / sqrt(sum(q*q)); L0 = q(1)*p(2) - q(2)*p(1)
  werr = 0; lerr = 0; work = 0
  call acc(q, a)
  do k = 1, n
    work = work + 0.5_dp * dt * sum(-a * p)
    p = p + 0.5_dp * dt * a; q = q + dt * p; call acc(q, a); p = p + 0.5_dp * dt * a
    work = work + 0.5_dp * dt * sum(-a * p)
    en = 0.5_dp * sum(p*p) - 1 / sqrt(sum(q*q)); L = q(1)*p(2) - q(2)*p(1)
    werr = max(werr, abs(en - en0) / abs(en0)); lerr = max(lerr, abs(L - L0))
  end do
  write(*,'(a,es9.2,a,es9.2)') '  one period: largest change of energy, relative: ', werr, '; of the area rate: ', lerr
  write(*,'(a,es9.2,a,es9.2)') '  distance from the start after one period: ', sqrt(sum((q - [1.5_dp, 0.0_dp])**2)), &
    '; work of the force round the orbit: ', work
  call check('D1 the energy of the orbit is constant', werr < 1e-6_dp)
  call check('D2 the area rate of the orbit is constant', lerr < 1e-10_dp)
  call check('D3 the force does no work round the closed orbit', abs(work) < 1e-6_dp)
  p = -p
  do k = 1, n
    p = p + 0.5_dp * dt * a; q = q + dt * p; call acc(q, a); p = p + 0.5_dp * dt * a
  end do
  back = sqrt(sum((q - [1.5_dp, 0.0_dp])**2) + sum((-p - [0.0_dp, sqrt(1.0_dp/3)])**2))
  write(*,'(a,es9.2)') '  velocity turned, one period back: distance from the first state: ', back
  call check('D4 with the velocity turned the orbit returns to its first state', back < 1e-9_dp)

  ! E. the maps
  nundo = 0; k = 0
  do g1 = 0, 1
    do g2 = 0, 1            ! the map g sends the state 0 to g1 and the state 1 to g2
      if (pick(g1, g2, stp(2.0_dp, 0)) == 0 .and. pick(g1, g2, stp(2.0_dp, 1)) == 1) nundo = nundo + 1
      if (pick(g1, g2, stp(0.5_dp, 0)) == 0 .and. pick(g1, g2, stp(0.5_dp, 1)) == 1) k = k + 1
    end do
  end do
  write(*,'(a,i0,a,i0)') '  maps of two states that undo the reset: ', nundo, ' of 4; that undo a weak field: ', k
  call check('E1 no map undoes the reset, and one undoes a step in a weak field', nundo == 0 .and. k == 1)
  worst = 0
  do i = 1, 1000
    call random_number(v); call random_number(b); v = v - 0.5_dp; b = b - 0.5_dp
    c = [v(2)*b(3) - v(3)*b(2), v(3)*b(1) - v(1)*b(3), v(1)*b(2) - v(2)*b(1)]
    worst = max(worst, abs(sum(v * c)))
  end do
  write(*,'(a,es9.2)') '  largest power of the magnetic force over 1000 velocities and fields: ', worst
  call check('E2 the magnetic force does no work', worst < 1e-15_dp)

  ! F. the field across the axis
  worst = 0; hold = 0
  do i = 0, 100
    h = i / 100.0_dp; t = asin(h)
    worst = max(worst, abs(enx(h, t) - enx(h, pi - t)))
    do k = 0, 3599
      hold = max(hold, enx(h, t) - enx(h, k * pi / 1800))
    end do
  end do
  write(*,'(a,es9.2,a,es9.2)') '  across the axis, 101 fields: largest difference of the two wells: ', worst, &
    '; largest depth of any angle below them: ', hold
  write(*,'(a,es9.2)') '  moment along the axis where the wells meet, field one: ', abs(cos(asin(1.0_dp)))
  call check('F1 across the axis the two wells have one energy, are the minimum, and meet at field one', &
    worst < 1e-14_dp .and. hold < 1e-14_dp .and. abs(cos(asin(1.0_dp))) < 1e-15_dp)

  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', npass + nfail, ',"failures":', nfail, '}'
  if (nfail /= 0) stop 1
contains
  real(dp) function en1(h, t)
    real(dp), intent(in) :: h, t
    en1 = sin(t)**2 / 2 - h * cos(t)
  end function
  real(dp) function en2(h, psi, t)
    real(dp), intent(in) :: h, psi, t
    en2 = sin(t)**2 / 2 - h * cos(t - psi)
  end function
  real(dp) function enx(hy, t)          ! field across the axis
    real(dp), intent(in) :: hy, t
    enx = sin(t)**2 / 2 - hy * sin(t)
  end function
  real(dp) function slp(h, psi, t)
    real(dp), intent(in) :: h, psi, t
    slp = sin(t) * cos(t) + h * sin(t - psi)
  end function
  real(dp) function stiff(h, psi, t)
    real(dp), intent(in) :: h, psi, t
    stiff = cos(t)**2 - sin(t)**2 + h * cos(t - psi)
  end function
  subroutine relax(h, psi, t)          ! follow the well: Newton while stiff, descent otherwise
    real(dp), intent(in) :: h, psi
    real(dp), intent(inout) :: t
    integer :: it
    real(dp) :: s, kk
    do it = 1, 200000
      s = slp(h, psi, t); kk = stiff(h, psi, t)
      if (abs(s) < 1e-13_dp .and. kk > 0) exit
      if (kk > 0.05_dp) then
        t = t - s / kk
      else
        t = t - 0.05_dp * s - sign(1e-9_dp, s)
      end if
    end do
  end subroutine
  subroutine acc(q, a)
    real(dp), intent(in) :: q(2)
    real(dp), intent(out) :: a(2)
    a = -q / sqrt(sum(q*q))**3
  end subroutine
  integer function stp(h, s)           ! the step of the record: 1 the aligned well, 0 the reversed one
    real(dp), intent(in) :: h
    integer, intent(in) :: s
    if (h >= 1) then
      stp = 1
    else if (h <= -1) then
      stp = 0
    else
      stp = s
    end if
  end function
  integer function pick(g1, g2, s)     ! the map (g1, g2) at the state s
    integer, intent(in) :: g1, g2, s
    if (s == 0) then
      pick = g1
    else
      pick = g2
    end if
  end function
  subroutine check(name, cond)
    character(*), intent(in) :: name
    logical, intent(in) :: cond
    if (cond) then
      write(*,'(a,a)') '  PASS  ', name; npass = npass + 1
    else
      write(*,'(a,a)') '  FAIL  ', name; nfail = nfail + 1
    end if
  end subroutine
end program two_branches_twin
```

## Appendix C · Run of Appendix B

```text
  fields from -1.5 to 1.5 in thousandths with both wells: 1999; disagreeing with |h| < 1: 0
  PASS  A1 both states along the axis are wells exactly for fields between -1 and 1
  energy of the reversed state above the aligned one at field 1:  2.00000
  PASS  A2 the drop at the switching field is two units
  largest slope, stiffness or departure from the astroid on the curve, 359 angles:  2.22E-16
  PASS  A3 on the curve (-cos^3, sin^3) the well ends, and the curve is the astroid
  jumps in one loop: 2
  remanence:  0.99619; cosine of five degrees:  0.99619
  switching fields found:  0.76650 and  0.76650; formula:  0.76643
  area of the loop:  3.03574; energy released at the two jumps:  3.03592
  PASS  B1 the loop has two jumps
  PASS  B2 the remanence is the cosine of the angle of the field
  PASS  B3 the switching field is that of Stoner and Wohlfarth
  PASS  B4 the area of the loop is the energy released at the jumps
  one switch at K V = 40 k T, 300 K:  5.030E-19 J; bound of Landauer:  2.871E-21 J; ratio:   175.2
  PASS  C1 one switch of the domain costs more than a hundred times the bound of Landauer
  one period: largest change of energy, relative:  2.63E-09; of the area rate:  4.77E-14
  distance from the start after one period:  5.63E-09; work of the force round the orbit:  1.78E-13
  PASS  D1 the energy of the orbit is constant
  PASS  D2 the area rate of the orbit is constant
  PASS  D3 the force does no work round the closed orbit
  velocity turned, one period back: distance from the first state:  1.30E-14
  PASS  D4 with the velocity turned the orbit returns to its first state
  maps of two states that undo the reset: 0 of 4; that undo a weak field: 1
  PASS  E1 no map undoes the reset, and one undoes a step in a weak field
  largest power of the magnetic force over 1000 velocities and fields:  3.30E-17
  PASS  E2 the magnetic force does no work
  across the axis, 101 fields: largest difference of the two wells:  5.55E-17; largest depth of any angle below them:  0.00E+00
  moment along the axis where the wells meet, field one:  6.12E-17
  PASS  F1 across the axis the two wells have one energy, are the minimum, and meet at field one
 BATTERY-JSON: {"checks":15,"failures":0}
```

## Appendix D · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.Arrow.energy_hasDerivAt' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.slope_hasDerivAt' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.the_axis_is_stationary' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.stiffness_on_the_axis' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.energy_above_aligned' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.energy_above_reversed' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.aligned_is_a_minimum' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.aligned_is_a_maximum' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.reversed_is_a_minimum' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.reversed_is_a_maximum' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.both_wells_exactly_inside' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.the_field_does_not_fix_the_state' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.the_drop_at_switching' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.energy2_hasDerivAt' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.slope2_hasDerivAt' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.the_switching_curve' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.only_the_switching_curve' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.the_switching_curve_is_an_astroid' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.across_the_axis' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.across_the_axis_the_two_wells_have_one_energy' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.across_the_axis_minimum' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.at_the_cusp_the_wells_meet' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.a_weak_field_keeps' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.a_strong_field_erases' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.no_map_undoes_the_reset' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.released_nonneg' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.a_switch_costs_at_least_two' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.heat_monotone' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.a_cycle_costs_at_least_four' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.mech_hasDerivAt' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.energy_is_constant' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.the_reversed_path_is_a_motion' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.the_reversed_path_has_the_same_energy' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.a_closed_path_does_no_work' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.the_area_rate_is_constant' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.newton_potential' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.a_step_of_a_flow_is_a_bijection' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.the_reset_is_no_step_of_a_flow' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.the_magnetic_force_does_no_work' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.two_branches' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.fallPremises' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Arrow.the_member_pays' depends on axioms: [propext, Classical.choice, Quot.sound]
```
