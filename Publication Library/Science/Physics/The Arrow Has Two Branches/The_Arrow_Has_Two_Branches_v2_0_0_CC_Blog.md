# The Arrow Has Two Branches

## Magnetism and Gravity as the Priced and the Reversible Registration of One Arrow

**Mohammad F. Islam PhD** · 25 November 2026

*Blog edition of the master, edition 2.0.0 of 25 November 2026. It renders the whole text. The printed files of the appendices stand in the master and in the Journal edition, and are listed at the end.*

## Abstract

This paper proves, in Lean 4 with Mathlib, that one arrow has two branches: a branch that keeps a record and is a map of two states onto one, and a branch that keeps none and is a bijection. The first is a magnet. One magnetic domain with one axis has the energy of Stoner and Wohlfarth, a function of an angle and a field, and no cost is entered by hand. With the field along the axis the two states along it are both wells exactly when the field lies strictly between minus one and one anisotropy fields, so the field does not fix the state: the domain holds a bit. A field of one or more ends one well, sends both states to the other, and releases twice the field in units of twice the anisotropy energy; no map undoes that step, every change of the record releases at least two units, and a cycle releases at least four. For a field at any angle the well ends exactly on the curve (−cos³*θ*,sin³*θ*), the astroid. Across the axis the two wells have one energy and meet with nothing released, so the heat of the loop is the price of a path and not a floor; the floor is that of Landauer, cited. The second branch is motion under a potential in any real inner product space: the energy is constant, the path run backwards with the velocity turned is again a motion, the force does no work round a closed path, and under a central force the area rate is constant. The branches are then told apart as maps: every step of a flow is a bijection, and the reset of the record is a step of no flow. The magnetic force on a moving charge does no work, so the price of the first branch is in its record and not in its force. The premises are fields of one printed structure, and the structure is inhabited. A Fortran twin drives a loop with the field five degrees from the axis and finds remanence 0.99619, switching field 0.76650 against the formula’s 0.76643, and a loop area 3.03574 equal to the energy released at the two jumps; at the usual condition for a lasting bit one switch costs 175 times the bound of Landauer. An orbit of Kepler keeps its energy to parts in a thousand million and, with the velocity turned, returns to its first state. Part II states the reading from which the paper takes its place in the series, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

Let *θ* be the angle of the moment of one magnetic domain from its axis and *h* the field along the axis, in units of the anisotropy field. In units of twice the anisotropy energy, the energy of the domain is

*e*(*h*,*θ*) = (1/2) sin²*θ* − *h*cos *θ*.

Its slope in the angle is sin *θ*cos *θ* + *h*sin *θ* and its stiffness is cos²*θ* − sin²*θ* + *h*cos *θ*. A well is an angle of zero slope and positive stiffness.

**Theorem (`both_wells_exactly_inside`).** The aligned state *θ* = 0 and the reversed state *θ* = *π* are both wells exactly when  − 1 &lt; *h* &lt; 1.

**Theorem (`the_drop_at_switching`).** *e*(*h*,*π*) − *e*(*h*,0) = 2*h*.

**Theorem (`no_map_undoes_the_reset`).** For *h* ≥ 1 the step of the record sends both states to the aligned one, and no map of the two states undoes it.

**Theorem (`energy_is_constant`).** For a motion under a potential, in any real inner product space, the energy (1/2)∥*v*∥² + *V*(*x*) is the same at every time.

**Theorem (`the_reversed_path_is_a_motion`).** If *x*(*t*) with velocity *v*(*t*) is a motion under a potential, so is *x*(−*t*) with velocity  − *v*(−*t*).

**Theorem (`the_reset_is_no_step_of_a_flow`).** Every step of a flow is a bijection, and for *h* ≥ 1 the step of the record is a step of no flow on the two states.

**Theorem (`two_branches`).** On the premises below: the energy of the body is constant and its path reversed is a motion; the heat of the domain never decreases; every change of its record releases at least two units; and a field of one or more leaves the record aligned.

The energy is that of Stoner and Wohlfarth \[1\]. That a logically irreversible step has a least heat is the principle of Landauer \[2\], and that a reversible one has none is the result of Bennett \[3\]; both are cited. What compiles here, in Lean 4 \[13\] with Mathlib \[12\], is the wells, the curve, the heat of the loop along the axis, the conservation and the reversal, and the difference of the two branches as maps. The premises are met: `fallPremises` constructs a term of the structure, and `the_member_pays` shows that its record changes and its heat rises.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. What is cited is in the tables of Section 1.3.

``` lean
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

- **The slope and the stiffness are the first and second rates of the energy in the angle** · Standing: Proved; Where: Appendix A, Part I
- **The two states along the axis are both wells exactly for  − 1 &lt; *h* &lt; 1; the aligned state is a minimum over the stated angles above  − 1 and the maximum over all angles at or below it** · Standing: Proved; Where: Part I
- **The reversed state stands above the aligned one by 2*h** · Standing: Proved; Where: Part I
- **For a field at any angle, the state at *θ* is stationary without stiffness exactly at the field (−cos³*θ*,sin³*θ*)** · Standing: Proved, with the converse; Where: Part II
- **Across the axis the two wells have one energy, are the minimum, and meet at the field one** · Standing: Proved; Where: Part II

The table continues with the record, the motion, the maps and the premises.

- **A field inside keeps the state; a field of one or more sends both states to one; no map undoes it** · Standing: Proved; Where: Part III
- **Along the axis the heat never decreases, a change of the record releases at least two units and a cycle at least four** · Standing: Proved; Where: Part III
- **Under a potential the energy is constant, the reversed path is a motion with the same energy, and a closed path does no work** · Standing: Proved, in every real inner product space; Where: Part IV
- **Under a central force in a plane the area rate is constant; the slope of  − *k*/*r* is *k*/*r*²** · Standing: Proved; Where: Part IV
- **Every step of a flow is a bijection; the reset is a step of no flow; the magnetic force does no work** · Standing: Proved; Where: Part V
- **On the premises, the five statements of `two_branches`; the premises are met by a member whose record changes** · Standing: Proved; Where: Part VI

What is not machine-checked is in the third table.

- **A magnet small enough is one domain with one axis, and its energy is the one above** · Standing: Classical model, entered: \[1\]; Where: Section 2
- **The domain keeps its well while the well stands** · Standing: Premise; it is zero temperature, and thermal switching is outside it \[6, 7\]; Where: Sections 4, 7
- **Erasing one bit at temperature *T* releases at least *k**T*ln 2 of heat; a reversible step need release none** · Standing: Classical, entered: \[2, 3\]; measured \[4, 5\]; Where: Sections 4, 6
- **Gravity is a force with a potential** · Standing: Premise; the law itself is the subject of a companion paper \[15\]; Where: Section 5
- **The magnetic field has no source** · Standing: Classical, entered; a source was considered \[8\] and has been searched for \[9\]; Where: Section 6
- **The values of the twin** · Standing: Numerical, not machine-checked; Where: Section 8

The paper claims as machine-checked the rows marked proved and no others. A row marked entered is a classical model, a classical bound or a measured value; the theorems that use a formula are analysis on it. Part II, the reading, is outside these tables: it is premise-grade and is labelled so where it begins.

## 2. The Domain and Its Wells

A magnet small enough holds one domain: its moment has a fixed size and one angle. If the material has one easy axis, the energy rises as the square of the sine of the angle from it, and a field lowers the energy of a moment that points along the field. Divided by twice the anisotropy energy, that is the function *e* of Section 1.1, due to Stoner and Wohlfarth \[1\]. The model is entered. Everything after it is analysis.

`energy_hasDerivAt` and `slope_hasDerivAt` show that `slope` and `stiffness` are the first and second rates of `energy`, so the three are one function and its derivatives, not three definitions. `the_axis_is_stationary` gives zero slope at *θ* = 0 and *θ* = *π* for every field, and `stiffness_on_the_axis` gives the stiffness there: 1 + *h* and 1 − *h*.

The wells are not only read from the stiffness. The energy above the aligned state factors,

*e*(*h*,*θ*) − *e*(*h*,0) = (1−cos*θ*)((1+cos*θ*/2)+*h*),

which is `energy_above_aligned`. For *h* &gt;  − 1 the second factor is positive near *θ* = 0, and `aligned_is_a_minimum` gives *e*(*h*,0) ≤ *e*(*h*,*θ*) for every angle with cos *θ* ≥  − 1 − 2*h*; for *h* ≥ 0 that is every angle. For *h* ≤  − 1 the second factor is never positive, and `aligned_is_a_maximum` gives *e*(*h*,*θ*) ≤ *e*(*h*,0) for every angle: the well is gone and the state is the top of the hill. `reversed_is_a_minimum` and `reversed_is_a_maximum` say the same of *θ* = *π* with the sign of the field turned.

`both_wells_exactly_inside` joins them: both states are wells exactly for  − 1 &lt; *h* &lt; 1. `the_field_does_not_fix_the_state` draws the consequence. Inside that interval one field carries two wells whose moments along the axis are 1 and  − 1. Which one the domain is in is not a function of the field. It is a function of the past, and that is a record of one bit.

`the_drop_at_switching` gives the energy of the reversed state above the aligned one, 2*h*. At *h* = 1, where the reversed well ends, it is two.

## 3. The Switching Curve

Let the field have a part *h*ₓ along the axis and a part *h*_y across it. The energy is `energy2`, (1/2)sin²*θ* − *h*ₓcos *θ* − *h*_ysin *θ*, with `energy2_hasDerivAt` and `slope2_hasDerivAt` for its rates. A well ends where the slope and the stiffness vanish together.

**Theorem (`the_switching_curve`).** At the field (*h*ₓ,*h*_y) = (−cos³*θ*,sin³*θ*) the state at *θ* has zero slope and zero stiffness.

**Theorem (`only_the_switching_curve`).** If the state at *θ* has zero slope and zero stiffness at a field, the field is that one.

`the_switching_curve_is_an_astroid` records that the squares of the two parts are the cubes of cos²*θ* and sin²*θ*, which sum to one: *h*ₓ^(2/3) + *h*_y^(2/3) = 1. This is the astroid of Stoner and Wohlfarth \[1\], here with its converse and compiled.

The curve has four corners, and the two on the axis across differ from the two on the axis. With the field across the axis, `across_the_axis` writes the energy as (1/2)(sin*θ*−*h*_y)² − (1/2)*h*_y². `across_the_axis_minimum` shows that an angle whose sine is the field is a minimum over every angle, and `across_the_axis_the_two_wells_have_one_energy` shows that the angle and its mirror have one energy. As the field rises to one the two angles close on each other, and `at_the_cusp_the_wells_meet` shows that at one they carry one moment, with no part along the axis. The two wells have merged, and no energy has been released.

This matters for what follows. Two states can be made one along a path on which nothing falls. The heat of Section 4 is therefore the heat of one path, the field along the axis, and not a floor under every path.

## 4. The Record and Its Heat

With the field along the axis, the record is a map. `step` sends a state to the aligned one if *h* ≥ 1, to the reversed one if *h* ≤  − 1, and to itself otherwise: a well the field has ended is left, a well that stands is kept. That rule is the premise `wells`; the theorems of Section 2 are what make it the rule of the wells.

`a_weak_field_keeps` and `a_strong_field_erases` give the two regimes. In the second, both states have one image.

**Theorem (`no_map_undoes_the_reset`).** For *h* ≥ 1 there is no map *g* of the two states with *g*(step_h(*s*)) = *s* for both.

The bit that told the two states apart is not in the state after the step. The energy released at a step is `released`: the value of `energy` at the state left minus its value at the state reached, at the field of the step. `released_nonneg` shows it is never negative, and `a_switch_costs_at_least_two` that it is at least two whenever the state changes, because a change needs a field of size one or more and the drop is twice the field.

`run` is the record after a history of fields and `heat` the energy released along it. `heat_monotone` shows that the heat never decreases, and `a_cycle_costs_at_least_four` that two changes in succession release at least four units. Four is the area of the loop of the domain along its axis.

Three things are not claimed. The two units are not a floor under every way of resetting the domain; Section 3 shows a path with none. The floor is that of Landauer: at temperature *T*, erasing one bit releases at least *k**T*ln 2 \[2\]. It is cited and measured, for a colloidal particle \[4\] and for magnetic bits of this kind \[5\], and it is not a theorem of this paper. And the rule of the wells is zero temperature: at a temperature above zero a domain can leave a well that still stands, at a rate set by the height of the barrier \[6, 7\].

## 5. Motion Under a Potential

The second branch asks for less structure. Let *E* be any real inner product space. A `Motion` under a potential *V* with gradient *g* is a position *x*(*t*) with velocity *v*(*t*) such that the rate of *v* is  − *g*(*x*), the gradient being asked for only along the path. The energy is `mech`, (1/2)∥*v*∥² + *V*(*x*).

**Theorem (`mech_hasDerivAt`).** The rate of the energy of a motion is zero at every time.

The rate of the first term is ⟨*v*,  − *g*(*x*)⟩ and of the second ⟨*g*(*x*), *v*⟩. `energy_is_constant` follows by the mean value theorem: the energy is the same at any two times.

**Theorem (`the_reversed_path_is_a_motion`).** The path *t* ↦ *x*(−*t*) with velocity *t* ↦  − *v*(−*t*) is a motion under the same potential.

`the_reversed_path_has_the_same_energy` adds that its energy at *t* is that of the first at  − *t*. A film of the motion run backwards shows a motion.

**Theorem (`a_closed_path_does_no_work`).** If a path under a potential has one point at both ends, and ⟨*g*(*x*), *v*⟩ is integrable along it, its integral along the path is zero.

It is the fundamental theorem of calculus on *V*(*x*(*t*)). A force with a potential keeps nothing from a round trip. `the_area_rate_is_constant` is the second law of Kepler in a plane under any force along the line to the centre, and `newton_potential` gives the slope of  − *k*/*r* as *k*/*r*², the inverse square of Newton \[10\], whose derivation is the subject of a companion paper \[15\]. Here the potential is a premise and its form is free.

## 6. Two Kinds of Map

The branches differ as maps, and the difference does not depend on the path of the field.

A `Flow` on a set of states is a step for every time, with the step of no time doing nothing and steps composing.

**Theorem (`a_step_of_a_flow_is_a_bijection`).** Every step of a flow is one to one and onto: it is undone by the step of the opposite time.

**Theorem (`the_reset_is_no_step_of_a_flow`).** For *h* ≥ 1, the step of the record is the step of no flow on the two states.

The motion of Section 5 is of the first kind: it can be run backwards. The reset of Section 4 is of the second: two states have one image. That is the distinction of Landauer and Bennett \[2, 3\], a logically reversible step against a logically irreversible one, and it is what the heat attaches to: by the cited bound, the second kind releases at least *k**T*ln 2 for each bit, by whatever path, and the first need release none.

One further theorem places the price. `the_magnetic_force_does_no_work` shows that the force of a magnetic field on a moving charge, being across the velocity, has no power: *v* ⋅ (*v*×*B*) = 0. The magnetic field of the classical theory has no source. Dirac showed what a source would imply \[8\], and none has been found \[9\]. The price of the first branch is therefore not in the force. It is in the record: in the fact that the domain has two wells, and that making them one is not a bijection.

## 7. What Is Not Fixed

The paper fixes no magnitude. The anisotropy energy, the volume and the temperature of a magnet are measured, and the twin takes them as inputs. The form of the potential of gravity is not derived here. The heat of the loop along the axis is exact at zero temperature and is an upper regime, not a bound: a real bit switches earlier with thermal help and can be reset near the bound of Landauer by a field across the axis \[5\]. The loop for a field at an angle is computed in the twin and is not a theorem. Radiation is outside both branches as stated: a body that radiates is not a motion under a potential alone.

## 8. The Numerical Twin

The twin of Appendix B runs the same objects in numbers and adds what the kernel does not have: a loop at an angle, joules, and an orbit.

**The wells and the curve.** Of 3001 fields from  − 1.5 to 1.5 in thousandths, 1999 carry both wells, and they are those between  − 1 and 1. The drop at the field one is 2.00000 units. On the curve of Section 3, at 359 angles, the slope, the stiffness and the departure from the astroid are zero to rounding.

**A loop five degrees from the axis.** The field is swept from 1.5 to  − 1.5 and back in steps of one ten-thousandth, and the state follows its well.

- **Jumps in one loop** · Found: 2; Compared with: 2
- **Remanence** · Found: 0.99619; Compared with: cosine of five degrees, 0.99619
- **Switching field** · Found: 0.76650; Compared with: formula of Stoner and Wohlfarth, 0.76643 \[1\]
- **Area of the loop** · Found: 3.03574; Compared with: energy released at the two jumps, 3.03592

**The price in joules.** At an anisotropy energy of 40 times *k**T* at 300 K, the usual condition for a bit that lasts \[6, 7\], one switch, half the loop, releases 5.030 times 10⁻¹⁹ J. The bound of Landauer at that temperature is 2.871 times 10⁻²¹ J. The ratio is 175.

**An orbit.** A body under the potential of Newton starts at the far point of an ellipse of eccentricity one half and is stepped through one period by the scheme of Verlet \[11\] in 200000 steps. Its energy changes by less than three parts in a thousand million, its area rate by parts in 10¹⁴, and the work of the force round the orbit is zero to parts in 10¹³. With the velocity turned and the same number of steps it returns to its first state to parts in 10¹⁴.

**The maps, and the axis across.** Of the four maps of two states, none undoes the reset and one undoes a step in a weak field. The power of the magnetic force is zero to rounding over 1000 velocities and fields. Across the axis, at 101 fields, the two wells have one energy, no angle lies below them, and at the field one they meet with no moment along the axis.

Fifteen checks pass and none fails. Three limits are stated. A loop on a grid finds the switching field to the step of the grid, and the area and the energy released agree to that step. The orbit is one orbit, and the scheme of Verlet is itself reversible, so the return shows the reversal of the scheme together with that of the motion. And the price in joules is the heat of the path along the axis; it is not the least heat of a reset.

## 9. Discussion: The Reading

The derivation above uses only analysis. This section states the reading from which the premises come, and marks what in it is theorem and what is premise.

**Why two branches.** In the reading of Part II a registration keeps part of what it reads and forgets part \[14\]. A registration that forgets is a map of many onto one; a registration that forgets nothing is a bijection. Section 6 proves that these are different kinds of map, and Sections 4 and 5 give one physical system of each kind. That magnetism is a system of the first kind and gravity of the second is the content of the two premises, and they are physics.

**Where the price is.** The heat is not a property of the magnetic force, which does no work, nor of every path of the field, since one path releases nothing at zero temperature. It attaches to the map. The paper proves the map is two onto one and cites the bound on its heat.

**What the paper does not claim.** It does not derive the bound of Landauer, the model of the domain, or the law of gravity. It does not claim that gravity keeps no record of any kind; it claims that a motion under a potential is reversible and does no work round a closed path. It does not claim a field theory of either force. It claims that each statement of Section 1.3 marked proved compiles. No theorem of Sections 2 to 8 depends on Part II.

## 10. Predictions, Falsifiers, and What Stands

The paper derives no constant. Its commitments are those of the two premises and of the two entered laws, and they are stated here as commitments: three that the paper says will stand at any future precision, two proposals it says will fail, and the three observations that would refute it.

### 10.1 Three predictions that will stand

1.  **A magnetic bit is not reset for less than the bound.** `no_map_undoes_the_reset` gives the map; the bound gives the heat \[2\]. Resets of magnetic bits have been measured at the bound \[5\]. The prediction is that none is found below it.
2.  **A body under gravity alone returns with its energy.** `energy_is_constant` and `a_closed_path_does_no_work` give it. The prediction is that no closed orbit under gravity alone, without radiation or friction, gains or loses energy in a round trip.
3.  **No magnetic source is found.** The searches have found none \[9\]. The prediction is that the magnetic force keeps doing no work on a charge, as `the_magnetic_force_does_no_work` states of the field without sources.

### 10.2 Two proposals that will fail

1.  **A memory that forgets for nothing.** Every proposal to reset a bit, magnetic or other, with less heat than the bound at the temperature of its surroundings either keeps the bit somewhere else or is not a reset. `the_reset_is_no_step_of_a_flow` is the reason: a reset is a step of no reversible dynamics.
2.  **A static record kept by a potential alone.** Every proposal in which bodies under a potential alone end a closed cycle in a state that remembers the direction of the cycle fails `the_reversed_path_is_a_motion` and `a_closed_path_does_no_work`.

### 10.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise or an entered law, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment’s printed uncertainties.

1.  **A reset of a bit below *k**T*ln 2.** It refutes the entered bound, and with it the reading of the two-onto-one map of `no_map_undoes_the_reset` as the carrier of heat.
2.  **A loop under gravity alone.** A cycle of bodies under gravity, without radiation or friction, that returns to its configuration with a changed energy refutes the field `moves`, through `energy_is_constant`.
3.  **An isolated magnetic charge.** It refutes the entered law that the magnetic field has no source, and it ends the scope of `the_magnetic_force_does_no_work`: on such a charge the field does work.

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

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author’s. The Lean file and the Fortran twin are written by a language model under the author’s direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Classical results that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are computed, from inputs that Appendix B prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1.  E. C. Stoner and E. P. Wohlfarth, Phil. Trans. R. Soc. A 240 (1948) 599.
2.  R. Landauer, IBM J. Res. Dev. 5 (1961) 183.
3.  C. H. Bennett, Int. J. Theor. Phys. 21 (1982) 905.
4.  A. Bérut et al., Nature 483 (2012) 187.
5.  J. Hong, B. Lambson, S. Dhuey and J. Bokor, Sci. Adv. 2 (2016) e1501492.
6.  L. Néel, Ann. Géophys. 5 (1949) 99.
7.  W. F. Brown, Phys. Rev. 130 (1963) 1677.
8.  P. A. M. Dirac, Proc. R. Soc. A 133 (1931) 60.
9.  B. Acharya et al. (MoEDAL), Nature 602 (2022) 63.
10. I. Newton, Philosophiae Naturalis Principia Mathematica (1687).
11. L. Verlet, Phys. Rev. 159 (1967) 98.
12. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
13. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
14. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
15. M. F. Islam, Immanent Gravity as a Machine-Checked Mathematical Theorem, edition 4.0.0 (2026b).
16. H. Bondi, Rev. Mod. Phys. 29 (1957) 423.

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its engine uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main, read at commit 38f6678.

1.  Root Axiom and Existence: Publication Library/Philosophy/Metaphysics/Root Axiom/TOE\_Zero.lean. Compiled alone in core Lean 4.19.0, exit 0.
2.  RH master: Publication Library/Mathematics/Millennium Series/RH\_Both\_Sides\_Formal\_Master\_v3\_0\_44\_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.
3.  Existence, as carried in the RH master: line 6635.
4.  Heat Bridge: RH master, Parts VII-c and VII-d.
5.  Prime Freedom: RH master, Parts XIII and XIV.
6.  Freedom Arrow: RH master, Part XV.
7.  Least Erasure: protocols/RH One Bit/Nothing Escapes Three Plus One/Least\_Erasure.lean. Compiled alone in core Lean 4.19.0, exit 0.
8.  Second Law: Publication Library/Mathematics/Mathematical Physics/Second\_Law\_Theorem\_v1\_0\_0\_CC.pdf, with its Lean file printed inside.
9.  P versus NP master: FINAL\_BINDING/PNP Binding/PNP\_Normal\_Form\_Paper\_v1\_14\_0\_CC.lean
10. ZFC seal: lean/ZFC\_Block\_Hardened\_FINAL\_v2\_0\_0\_Hermetically\_Sealed.lean
11. No Second Sovereign: Publication Library/Mathematics/Millennium Series/No\_Second\_Sovereign\_v1\_0\_0\_CC.lean
12. Future Proof Empirical Witness Seal: Publication Library/Mathematics/Millennium Series/Future\_Proof\_Empirical\_Witness\_Seal\_v1\_0\_0\_CC.lean

## Appendices

**Appendix A · SPHYS_Two_Branches_CC.lean.** Lean 4.19.0 with Mathlib 4.19.0. 42 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D. *[a printed file, 522 lines, in the master and in the Journal edition]*

**Appendix B · Two_Branches_Twin_CC.f90.** Fifteen checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C. *[a printed file, 222 lines, in the master and in the Journal edition]*

**Appendix C · Run of Appendix B.** ```text
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
 BATTERY-JSON: {"checks":15,"failures":0} *[a printed file, 31 lines, in the master and in the Journal edition]*

**Appendix D · Kernel lines of Appendix A.** Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own. *[a printed file, 42 lines, in the master and in the Journal edition]*
