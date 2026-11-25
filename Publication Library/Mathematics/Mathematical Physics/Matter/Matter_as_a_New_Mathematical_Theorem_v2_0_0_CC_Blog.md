# Matter as a New Mathematical Theorem

## Exclusion Forced by the Full Turn, the Dirac Equation as the Least Law of a Half-Spin, and Two Statistics with No Third in Three Dimensions

**Mohammad F. Islam** · 25 November 2026

*Blog edition of the master, edition 2.0.0 of 25 November 2026. It renders the whole text. The printed files of the appendices stand in the master and in the Journal edition, and are listed at the end.*

*On edition 2.0.0. Part I, Sections 1 to 10, is new: the forcing is rebuilt on a ring of coefficients, matrices over a field and the group of permutations, and is proved in Lean 4 with Mathlib. Part II, Section 11, is the reading of spin and statistics from Nothing Escapes, Least Erasure (Islam, 2026a), carried as text at premise grade. Section 12 closes the paper. The engine of edition 1.0.0 is withdrawn: its statements were proved over small structures of integers that carried the pieces of the law as fields, and they are replaced by the theorems of Appendix A.*

## Abstract

This paper proves, in Lean 4 with Mathlib, that a law of first order whose square is the mass shell is the Dirac law, and that the exchange of two of its particles excludes. The coefficients of the law are elements of a ring, the mass shell is a quadratic form, and nothing else is assumed: no relation among the coefficients, no size and no sign. The main theorem states: if the operator of first order squares to the mass shell at every momentum, its coefficients obey the Clifford relations, and conversely where two can be cancelled. Coefficients that commute cannot do so, so no numbers take the square root. Over a field in which two is not zero, four such coefficients cannot be matrices of size one, two or three, and an explicit set of size four is exhibited with every relation proved, so the law has four components and no fewer. Its coefficient of the energy has trace zero and square one in every case, and in the model it is diagonal with two entries plus one and two minus one, each pair carrying the half turn: two signs of the energy, twice each. The law factorises the law of second order for every mass. The product of two coefficients of space is the rotor of a half turn and squares to minus one, so the forced law is a half-spin: a full turn returns minus one on its components and returns every direction to itself. The product of two directions carries their dot product and their cross product, and with momenta that do not commute the square of the operator carries their commutators, which is the spin term. The premise on exchange names no sign: it says the exchange multiplies the amplitude by whatever number the full turn is. Since that number is minus one, the amplitude vanishes wherever two particles share a state; an amplitude that keeps its sign need not. A number by which the permutations act is one on every permutation or the sign of the permutation: two statistics and no third. A Fortran twin executes the identities on two hundred thousand random points, searches every matrix of size two with entries among five values and finds three that anticommute and never four, counts the sign maps of the permutations of three things and finds two, and sets the law against measurement: the moment of the electron within the fine-structure constant of two, with a law that has no spin term excluded, and the antiproton’s ratio of charge to mass at minus that of the proton. That the exchange carries the sign of the full turn, and that exchanges in three dimensions of space are permutations, are cited and are named where they are used. Every premise of the paper is one field of one printed structure. Part II carries the reading of spin and statistics from which the paper takes its place in the series, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

Let *γ*_(μ) be elements of a ring that is an algebra over a commutative ring of constants, one for each direction *μ*, and let *η*_(μ) be constants. For a momentum *p* the operator of first order and the mass shell are

*γ* ⋅ *p* = ∑_(μ)*p*_(μ) *γ*_(μ),   *p*² = ∑_(μ)*η*_(μ) *p*_(μ)².

The Clifford relations are *γ*_(μ)*γ*_(μ) = *η*_(μ) and *γ*_(μ)*γ*_(ν) + *γ*_(ν)*γ*_(μ) = 0 for *μ* ≠ *ν*.

**Theorem (`square_forces_the_relations`).** If (*γ*⋅*p*)(*γ*⋅*p*) = *p*² at every momentum *p*, the coefficients obey the Clifford relations.

**Theorem (`relations_give_the_square`).** Conversely, in a ring where *x* + *x* = 0 gives *x* = 0, coefficients that obey the relations give (*γ*⋅*p*)(*γ*⋅*p*) = *p*² at every momentum.

**Theorem (`four_components`).** On the premises below, over a field in which two is not zero, the law has at least four components.

**Theorem (`exclusion_forced`).** On the premises below, over such a field, the amplitude of two identical particles of the law vanishes wherever the two share a state.

The law is the one Dirac wrote \[1\]. No mass is fixed by the theorems: `the_law_factorises` holds for every mass. The premises are met: `diracPremises` constructs a term of the structure over any field with a square root of minus one in which two is not zero, and `diracPremisesComplex` does so over the complex numbers, with an amplitude that is not zero.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. What is cited is in the tables of Section 1.3.

``` lean
structure Premises (K : Type) [Field K] where
  n : ℕ
  pos : 0 < n
  γ : Fin 4 → Matrix (Fin n) (Fin n) K
  first_order : ∀ p : Fin 4 → K,
    slash γ p * slash γ p = algebraMap K (Matrix (Fin n) (Fin n) K) (shell eta p)
  State : Type
  amp : State → State → K
  exchange : ∀ c : K, (γ 1 * γ 2) * (γ 1 * γ 2) = c • (1 : Matrix (Fin n) (Fin n) K) →
    ∀ x y, amp x y = c * amp y x
```

It carries two premises. The first is least order, the field `first_order`: the law is an operator of first order with matrix coefficients on *n* components, *n* at least one, whose square is the mass shell with signs (+,−,−,−) at every momentum. The second is the field `exchange`: two identical particles of the law have an amplitude on pairs of states, and exchanging the two multiplies it by the number by which the full turn acts on the components of the law, whatever that number is. The field names no sign. Section 5 proves the number is minus one. No field of `Premises` states a relation among the coefficients, a size, or the conclusion of any theorem. Section 9 states where the premises come from.

### 1.3 What is proved, what is cited, what is assumed

- **The square of the operator is the mass shell at every momentum if and only if the coefficients obey the Clifford relations** · Standing: Proved; the converse where *x* + *x* = 0 gives *x* = 0; Where: Appendix A, Part I
- **The law of second order is the product of two laws of first order, for every mass** · Standing: Proved; Where: Part I
- **Coefficients that commute cannot obey the relations** · Standing: Proved, in a commutative domain where two is not zero; Where: Part II
- **Four coefficients cannot have size one, two or three** · Standing: Proved, over a field where two is not zero; Where: Part III
- **Four coefficients of size four exist; the coefficient of the energy is diagonal, twice plus one and twice minus one** · Standing: Proved, over a commutative ring with a square root of minus one; Where: Part IV

The table continues with the spin, the exchange and the premises.

- **The product of two directions is their dot product plus their cross product; the spin term** · Standing: Proved; Where: Part V
- **The rotor of a half turn squares to minus one and returns every direction; the same for two coefficients of the law** · Standing: Proved; Where: Part V
- **An amplitude with the minus sign vanishes where two share a state; one with the plus sign need not** · Standing: Proved; Where: Part VI
- **A number by which the permutations act is one or the sign: two statistics and no third** · Standing: Proved, for values in a commutative domain; Where: Part VI
- **On the premises: the Dirac relations, four components at the least, the two signs of the energy in balance, a half-spin, exclusion; the premises are met** · Standing: Proved; Where: Part VII

What is not machine-checked is in the third table.

- **The exchange of two identical particles carries the number of the full turn** · Standing: Premise; in relativistic field theory the spin-statistics theorem, cited: \[4, 5\]; Where: Sections 6, 9
- **A matrix of square one and trace zero has the values plus one and minus one equally often** · Standing: Elementary, not formalised; Where: Section 4
- **In three dimensions of space and above the exchanges of *n* particles are the permutations; in two dimensions they are not** · Standing: Cited: \[6, 7\]; Where: Section 7
- **The spin is one half of the product of two generators, so that the spin term reads as a moment of two** · Standing: Classical reading, cited: \[1, 2\]; Where: Section 5
- **The formulas of the twin: the first correction to the moment, *α*/2*π** · Standing: Entered from the literature \[9\]; numerical, not machine-checked; Where: Section 8
- **The law of a half-spin is of first order** · Standing: Premise; Where: Section 9

The paper claims as machine-checked the rows marked proved and no others. A row marked cited is a result with a published proof that this work has not machine-checked. A row marked entered is a classical formula used by the numerical twin alone; no theorem rests on it. Part II, the reading, is outside these tables: it is premise-grade and is labelled so where it begins.

## 2. A Law of First Order as Algebra

A law of first order needs coefficients that multiply momenta, and a mass shell needs a quadratic form. A ring with scalars and a finite set of directions is exactly this, and it is what the file of Appendix A formalises, in the kernel of Lean 4 \[18\] on the library Mathlib \[17\]. Working at this level has a cost and a gain. The cost is that no spacetime, no spinor bundle and no Hilbert space is constructed. The gain is that every theorem holds in every ring, the matrices over the complex numbers included, and for every set of directions and every choice of signs, so nothing proved in Sections 3 and 4 is special to four dimensions until a size is counted.

The definitions `slash`, `shell` and `Clifford` are the operator, the mass shell and the relations of Section 1.1. The coefficients are arbitrary in each. Nothing ties them until Section 3.

## 3. The Square Forces the Relations

Nothing in this section is assumed. Each statement is a theorem of Appendix A.

**The square forces the relations (`square_forces_the_relations`).** Take the momentum that is one along *μ* and zero elsewhere: the square is *γ*_(μ)*γ*_(μ) and the shell is *η*_(μ). Take the momentum that is one along *μ* and along *ν*: the square is (*γ*_(μ)+*γ*_(ν))² and the shell is *η*_(μ) + *η*_(ν), and what remains is *γ*_(μ)*γ*_(ν) + *γ*_(ν)*γ*_(μ) = 0. Nothing is divided, so the theorem holds in every ring.

**The relations give the square (`relations_give_the_square`).** Twice the square is the sum over pairs of *p*_(μ)*p*_(ν)(*γ*_(μ)*γ*_(ν)+*γ*_(ν)*γ*_(μ)), which the relations reduce to twice the shell. The two is removed where *x* + *x* = 0 gives *x* = 0.

**The law factorises (`the_law_factorises`).** For every element *D* and every mass *m*, (*D*−*m*)(*D*+*m*) = *D* *D* − *m*². With *D* = *γ* ⋅ *p* the right side is *p*² − *m*². On the mass shell the law of second order is the product of two laws of first order, and it is so for every mass: the theorem fixes the form of the law and no scale.

## 4. No Numbers Take the Square Root, and Four Components Do

**No numbers (`no_numbers_take_the_square_root`).** In a commutative domain where two is not zero, two elements whose squares are not zero cannot anticommute: their product would vanish. With two directions or more, the coefficients of the law cannot be numbers.

**Not size one, two or three (`four_is_the_least`).** Let the coefficients be square matrices over a field in which two is not zero, with squares that are scalars and not zero. A matrix that anticommutes with such a matrix has trace zero (`trace_zero_of_anticommute`). In odd size two of them cannot anticommute, because the determinant of the product would be minus itself (`no_two_in_odd_size`). In size two four of them cannot: with the unit matrix they would be five matrices, each with a square of trace not zero and each pair with a product of trace zero, hence five independent matrices in a space of dimension four (`no_four_in_size_two`). So four coefficients need size four at the least. That the least size is four is classical \[3\]; here it compiles.

**Size four (`model_clifford`).** Over any commutative ring with an element *i* whose square is minus one, the file writes four matrices of size four and proves all four squares and all six anticommutators, with signs (+,−,−,−).

**Two signs of the energy, in balance (`the_two_signs_of_the_energy_balance`, `model_energy`, `model_spin_commutes_with_energy`).** On the premises the coefficient of the energy has square one and trace zero, whatever the size, so plus one and minus one occur equally among its values; that step from the trace to the count is elementary and is not formalised. In the model it is diagonal with entries 1, 1,  − 1,  − 1, and the rotor of Section 5 commutes with it, so each sign of the energy carries the half turn on its own two components. At rest the law reads the energy as plus the mass on two components and minus the mass on two. The second pair is the antiparticle, found in 1933 \[12\].

**A limit of scope.** A massless half-spin can be written on two components with a pair of different operators \[21\]. That pair is not one operator whose own square is the mass shell, and the theorem of this section is about such an operator.

## 5. The Forced Law Is a Half-Spin

**The full turn (`full_turn`).** Let three elements of a ring square to one and anticommute in pairs, and let *r* = *e*₁*e*₂. Then *r* reverses *e*₁ and *e*₂ and keeps *e*₃, acting by *x* ↦ *r* *x* *r*⁻¹ with *r*⁻¹ =  − *r*: it is the rotor of a half turn in the plane of the first two. Its square, the full turn, is minus one. And the full turn, acting the same way, returns every element to itself.

**The rotor of the law (`rotor_of_the_law`, `the_forced_law_is_a_half_spin`).** Two coefficients of space of the forced law square to minus one and anticommute. Their product is again the rotor of a half turn in their plane, and its square is minus one. So on the premises a full turn multiplies the components of the law by minus one and leaves every direction as it was. The law forced in Section 3 is the law of a half-spin: this is derived, not entered. The sign is measured: a neutron turned once in a magnetic field returns with its phase reversed, and twice restores it \[13, 14\].

**The product of two directions (`product_of_two_directions`).** For two directions *a* and *b*,

(*a*⋅*e*)(*b*⋅*e*) = *a* ⋅ *b* + (*a*×*b*)₁ *e*₂*e*₃ + (*a*×*b*)₂ *e*₃*e*₁ + (*a*×*b*)₃ *e*₁*e*₂.

**The spin term (`the_spin_term`).** Let three momenta commute with the generators and not with one another. Then

(*e*⋅*p*)² = *p* ⋅ *p* + *e*₁*e*₂ \[*p*₁,*p*₂\] + *e*₂*e*₃ \[*p*₂,*p*₃\] + *e*₃*e*₁ \[*p*₃,*p*₁\].

In a magnetic field the commutators of the momenta are the field, so the square of the operator carries the field times the products of pairs of generators. With the spin read as one half of those products, which is the classical reading \[1, 2\], the term is a magnetic moment of two in units of the orbital one. The identity is proved; the reading of its coefficient is cited.

## 6. Exclusion

**Exclusion (`exclusion`).** Let an amplitude on pairs of states change sign when its two arguments are exchanged, with values in a group where *v* + *v* = 0 gives *v* = 0. Then it vanishes wherever the two arguments are equal.

**A whole spin excludes nothing (`a_whole_spin_excludes_nothing`).** An amplitude that keeps its sign under exchange need not vanish there.

**On the premises (`exclusion_forced`).** The field `exchange` names no sign. It says that if the full turn acts on the components of the law as a number, the exchange multiplies the amplitude of two identical particles by that number. Section 5 proves the number is minus one. So the amplitude vanishes wherever the two share a state: exclusion is forced by the full turn. Two identical half-spins are never in one state. That the exchange carries the sign of the full turn is the premise; in relativistic field theory it is the spin-statistics theorem \[4, 5\], which is cited and not formalised.

## 7. Two Statistics and No Third

**A sign (`a_sign_is_plus_or_minus_one`).** In a commutative domain a number whose square is one is plus one or minus one.

**Two statistics and no third (`two_statistics_and_no_third`).** Let the permutations of finitely many things act on amplitudes by a number: a map to a commutative domain that sends products to products and the identity to one. Then the map is one on every permutation, or it is the sign of the permutation. The proof is that every exchange of two is conjugate to every other, so all take one value, whose square is one.

**Where the exchanges are permutations.** In three dimensions of space and above, a double exchange of two particles can be undone, and the exchanges of *n* particles form the group of permutations. In two dimensions they form a larger group, and other phases appear \[6, 7\]; they are observed in the plane \[15, 16\]. This is topology, cited and not formalised. What the theorem adds is that, once the exchanges are permutations and act by a number, there are two statistics and no third.

## 8. The Numerical Twin

The twin of Appendix B does three things the kernel does not. It executes the identities independently, it searches small cases exhaustively for what the theorems forbid, and it sets readings of the law against published measurements.

**The algebra.** At two hundred thousand random integer points the twin checks the square of a direction, the product of two directions, the square of the operator against the mass shell, and the factorisation on the mass shell. No pair of whole numbers from minus six to six takes the square root.

**The searches.** Among the 625 matrices of size two with entries 0, 1,  − 1, *i*,  − *i*, the twin finds 104 whose square is a scalar that is not zero, three that anticommute in pairs, and never four. Among the 64 maps from the six permutations of three things to signs, it finds two that respect products.

**The measurements.** The inputs are measured and are printed in Appendix B.

- **Half the moment of the electron** · Law: 1, and 1 + 0.00116141 with the first correction \[9\]; Rival: 0.5 (no spin term); Measured: 1.00115965218059(13) \[8\]
- **Antiproton to proton, charge over mass** · Law: − 1; Measured: − 1.000000000003(16) \[10\]
- **Probability of a violation of exclusion** · Law: 0; Measured: below 3.4 × 10⁻²⁹ \[11\]

Thirteen checks pass and none fails. Three limits are stated. The law gives the moment as two; the measured value differs from it at the scale of the fine-structure constant \[20\], and the first correction, which closes the difference to the square of that scale, is a classical formula of the field’s own quantum \[9\] and is entered, not derived here. The bound on a violation of exclusion is printed as a reading and is not counted as a check, since a bound compared with zero cannot fail. The twin tests the law against one rival and against measurement. It is not a new prediction, and the agreement of the Dirac law with these measurements was known.

## 9. Discussion: The Reading

The derivation above uses only algebra. This section states the reading from which the premises come, and marks what in it is theorem and what is premise.

**Why first order.** In the reading of Part II the record keeps the least that suffices. A law of second order determines a state by its value and its rate; a law of first order by its value alone. The premise is that the law of matter is the least: of first order, with the mass shell as its square. That is the field `first_order`. What the paper proves is what the premise forces: the Clifford relations, coefficients that are not numbers, four components and no fewer, both signs of the energy, and a half-spin.

**Why the exchange is the turn.** In the reading the exchange of two identical particles is the mirror of the seat, and it carries the sign the particle carries under a full turn. That is the field `exchange`. The premise is physics and is not a theorem of this paper. What the paper proves is that the sign is minus one for the forced law, and what follows: the amplitude is empty wherever two share a state.

**What the paper does not claim.** It does not derive any mass. It does not derive the spin-statistics theorem, nor the topology of exchanges. It does not claim that the Dirac law or exclusion was unknown or untested. It claims that the form of the law is forced by least order, that its size and its spin are forced with it, that exclusion follows from one named premise, and that each statement of Section 1.3 marked proved compiles. The fuller account of the reading, spin and statistics on the seat, is Part II, Section 11, carried from \[19\]. No theorem of Sections 2 to 8 depends on it.

## 10. Predictions, Falsifiers, and What Stands

The paper recovers the Dirac law and the exclusion principle. It predicts no measurement that they do not and derives no constant. Its commitments are those of the forced law, and they are stated here as commitments: three that the paper says will stand at any future precision, two proposals it says will fail, and the three observations that would refute it.

### 10.1 Three predictions that will stand

1.  **Exclusion is exact.** `exclusion_forced` gives zero. The present bound on the probability of a violation is 3.4 × 10⁻²⁹ \[11\]. The prediction is that no experiment finds two identical half-spins in one state.
2.  **The antiparticle mirrors the particle.** The law carries both signs of the energy in balance, with one mass (`the_two_signs_of_the_energy_balance`, `the_law_factorises`). The measured ratio of the charge over mass of the antiproton to that of the proton is  − 1.000000000003(16) \[10\]. The prediction is that it stays at minus one.
3.  **A full turn of a half-spin is minus one.** `the_forced_law_is_a_half_spin` gives it. Neutron interferometry finds the phase reversed after one turn and restored after two \[13, 14\]. The prediction is that no half-spin returns to itself after one turn.

### 10.2 Two proposals that will fail

1.  **A third statistics in three dimensions of space.** `two_statistics_and_no_third` leaves none, once exchanges are permutations acting by a number. The paper predicts that every particle found in three dimensions is of one of the two, and that statistics between them appear only where the exchanges are not permutations, as in the plane \[15, 16\].
2.  **A law of first order for a massive half-spin on fewer than four components.** `four_is_the_least` forbids it. The paper predicts that every such proposal either gives up the mass shell as the square of one operator or carries four components under another name.

### 10.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, or the forced law as the law of nature, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment’s printed uncertainties.

1.  **Two identical half-spins in one state.** It refutes the field `exchange` through `exclusion_forced`.
2.  **A particle of the law whose antiparticle differs from it in mass.** It refutes the field `first_order`, since the two signs of the energy come from one operator with one mass.
3.  **A half-spin that returns to itself after one full turn.** It refutes the field `first_order` through `the_forced_law_is_a_half_spin`.

Apart from them stands the formal claim, which no observation touches and one compilation settles: every theorem named in this text prints its axioms in Appendix D, and a line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved.

### 10.4 What kind of result this is

It is not a new physics. It is a change in how a physical derivation can be checked. The forcing of the Dirac law is here a single file whose every step the kernel has verified, whose every assumption is one field of one structure, and whose readings are set against measurement. A reader who doubts a step can name the line.

The implication from `Premises` to the Dirac relations, to four components, to the half-spin and to exclusion is checked by the Lean kernel. No experiment and no later revision of physics alters an implication. Experiment remains free to test whether nature satisfies the premises, and that is all it can test here. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and the structure `Premises` is printed for that purpose. What stands is the tables of Section 1.3.

## 11. Part II · The Reading

*This part is the reading from which the paper takes its place in the series. It is carried from Nothing Escapes, Least Erasure (Islam, 2026a), where it stands as the chapter Spin and Statistics, and it is premise-grade. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 8 depends on it. The theorem names set in code in this part, and the twin it quotes, are those of that volume and are printed there, not here. Where this part calls a statement a theorem, the statement follows from the placement of the reading, which is its premise. The falsifiers listed in Section S.11 are falsifiers of the reading; they stand beside the three of Section 10.3 and are not among them.*

### 11.1 Spin and Statistics

*Bosons on the Line and Fermions at Its Side, Pauli Exclusion as an Odd Reading Blind on the Fixed Set, the Full Turn’s Minus One as the Exchange Sign, and Statistics as One Bit in Three Dimensions.* Edition 1.0.0.

**Abstract of the chapter.** Every particle in three dimensions is a boson or a fermion, and the choice is fixed by its spin: half-integer spin turns a state to its negative under a full rotation and makes it antisymmetric under exchange; integer spin does neither. This chapter reads the pair on the seat, the reflection *s* ↦ 1 − *s̄* and the line it fixes. The exchange of two identical particles is an involution, and a carrier that sends a pair amplitude’s antisymmetric part to the side and its symmetric part to the height makes the exchange the fold: the symmetric amplitudes, the bosons, are the line; the antisymmetric ones, the fermions, stand at height zero off it; registration keeps the symmetric part and forgets the rest. We prove in core Lean 4, sixty-nine laws with no axiom declared and no use of choice, that an antisymmetric amplitude vanishes wherever the exchange fixes the configuration, so Pauli exclusion is an odd reading blind on the fixed set and a fermion’s occupation is one bit; that a full turn is minus one on spinors and the identity on vectors, the double cover being two to one; that an exchange sign whose square is the identity, as a double exchange is in three dimensions, is plus or minus one, while a quarter phase needs the plane; that bosons bunch and fermions part at a balanced splitter; and that the one-body record does not read the statistics, which only the pair reading returns. With the spin-statistics theorem carried as an import, the full turn’s sign is the exchange sign. A Fortran twin runs seventeen checks with zero failures: from two states per orbital and one fermion per state it finds the noble gases at 2, 10, 18, 36, 54, 86 and 118, Chandrasekhar’s mass at 1.43 solar masses, and London’s condensation temperature for helium-4 at 3.13 K.

#### S.1 The Reader’s Frame

This chapter reads the two properties every particle carries in three dimensions, its spin and its statistics, and the theorem that joins them. A full turn of a spinor lands on minus one, the quaternion identity *i**j**k* =  − 1.

It claims three things. First, the exchange of two identical particles is the fold under a carrier forced by the symmetry, so bosons are the line and fermions stand at its side. Second, Pauli exclusion is the seat’s odd reading: an antisymmetric amplitude is blind exactly on the configurations the exchange fixes. Third, statistics is one bit, and in three dimensions it is the same bit as the full turn’s sign.

It refuses the derivation of the spin-statistics theorem, which is carried as an import from relativistic quantum field theory \[QFT\]. Sections 1 to 10 of this paper set that theorem as a named premise and force exclusion on it.

**Negative warrants.** Two, stated so that no reader supplies them. No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade. No quantum field theory is written: the spin-statistics theorem, the Madelung ordering of atomic subshells, and the constants enter as imports or measurements.

**Five terms.** An *exchange* swaps two identical particles. A pair amplitude is *symmetric* when the exchange leaves it unchanged and *antisymmetric* when the exchange negates it. A *reading* is *odd* under a map that flips its sign and *even* under one that keeps it. *Registration* keeps a point’s height and forgets its side. A *keyed bit* is a yes-or-no property no function of a given record decides.

#### S.2 The Spine

The seat is a mirror and a record: the reflection *s* ↦ 1 − *s̄*, its fixed line, and the registration that keeps a point’s height and forgets its side. This chapter reads the seat on the exchange in Section S.3, the odd reading in Pauli exclusion in Section S.4, the Return in Section S.5, its identification with the exchange sign in Section S.6, the one bit in Section S.7, the record that reads the bit in Section S.8, and the bit at macroscopic scale in Section S.9.

**Why this carrier, and not another.** The carrier is not chosen. Spaces with an involution and the maps that respect them form a category (`equivariant_id`, `equivariant_comp`), and the fixed set is a functor on it (`fix_functorial`); an equivariant map into the seat, whose fixed set is the line (`fold_global_seat`), lands every physical fixed point on the line (`equivariant_carrier_lands`). Here the physical involution is the exchange of two identical particles on a pair amplitude (*x*,*y*), *x* on the ordered slots (*a*,*b*) and *y* on (*b*,*a*). The carrier (*x*,*y*) ↦ (1+(*x*−*y*), *x*+*y*) sends the antisymmetric part to the side and the symmetric part to the height, and it is equivariant (`exchange_carrier_equivariant`). Its landing on the symmetric amplitudes is forced by the functor (`exchange_carrier_lands`).

**The correspondence matrix.**

- **exchange of identical particles** · Element of the seat: the fold; Lean theorem: `exchange_carrier_equivariant`, `swap_involutive`; Fortran check: 3721 of 3721
- **bosons** · Element of the seat: the line; Lean theorem: `symmetric_on_the_line`, `exchange_carrier_lands`; Fortran check: 3721 of 3721
- **fermions** · Element of the seat: height zero, off the line; Lean theorem: `antisymmetric_at_height_zero`; Fortran check: 61 of 61
- **a pair and its exchange** · Element of the seat: two worlds over one record; Lean theorem: `exchange_two_worlds`; Fortran check: 3660 of 3660
- **Pauli exclusion** · Element of the seat: the odd reading blind on the fixed set; Lean theorem: `pauli_exclusion`, `slater_vanishes_on_diagonal`; Fortran check: 1000 and 1000
- **bosons sharing a state** · Element of the seat: the even reading free on it; Lean theorem: `bosons_may_share`; Fortran check: structural
- **a fermion’s occupation** · Element of the seat: one bit; Lean theorem: `fermion_occupation_is_a_bit`; Fortran check: 101 of 101
- **the periodic table** · Element of the seat: the bit filling orbitals; Lean theorem: `fermion_occupation_is_a_bit` with Madelung \[import\]; Fortran check: 2, 10, 18, 36, 54, 86, 118
- **the full turn** · Element of the seat: the Return: minus one on spinors; Lean theorem: `the_return`, `full_turn_negates_spinors`, `full_turn_fixes_vectors`, `two_turns_are_identity`; Fortran check: 1000 axes to 2.2e-16
- **the double cover** · Element of the seat: two to one, a kernel of one bit; Lean theorem: `double_cover_two_to_one`; Fortran check: 1000 rotations
- **spin and statistics** · Element of the seat: the turn sign is the exchange sign; Lean theorem: `turnSign_val`, `half_integer_spin_is_odd` with \[QFT\]; Fortran check: twelve particles and atoms
- **statistics in three dimensions** · Element of the seat: one bit; Lean theorem: `statistics_one_bit`; Fortran check: 2 of 3600 phases
- **anyons in the plane** · Element of the seat: the quarter phase excluded in three dimensions; Lean theorem: `anyon_needs_the_plane`; Fortran check: π/3
- **Hong–Ou–Mandel** · Element of the seat: bosons bunch, fermions part; Lean theorem: `bosons_bunch_fermions_part`; Fortran check: coincidence 0 and 1
- **helium-4 and helium-3** · Element of the seat: one one-body record, the pair reads the bit; Lean theorem: `statistics_unread_by_one_body`; Fortran check: g2 = 2 and 0
- **white dwarfs, superfluid helium** · Element of the seat: the bit at macroscopic scale; Lean theorem: the occupation bit, with \[import\]; Fortran check: 1.43 solar masses; 3.13 K

#### S.3 The Exchange Is the Fold

Two identical particles in two single-particle states *a* and *b* have a pair amplitude (*x*,*y*): *x* for the first in *a* and the second in *b*, *y* for the reverse. Exchange swaps them and is an involution (`swap_involutive`). The exchange carrier sends the antisymmetric part *x* − *y* to the side and the symmetric part *x* + *y* to the height, and the exchange becomes the fold (`exchange_carrier_equivariant`).

Three readings follow from the carrier.

-   **Bosons are the line.** An amplitude lands on the line exactly when it is symmetric (`symmetric_on_the_line`).
-   **Fermions stand at height zero.** An antisymmetric amplitude has no symmetric part and stands off the line unless it vanishes (`antisymmetric_at_height_zero`).
-   **Registration is symmetrization.** It keeps the symmetric part as the record and forgets the antisymmetric part, so a pair and its exchange are two states with one record (`exchange_two_worlds`).

The twin executes the carrier on 3721 integer amplitudes.

#### S.4 Pauli Exclusion: The Odd Reading Is Blind on the Fixed Set

The exchange fixes a configuration when both particles are in one state. An antisymmetric amplitude obeys *ψ*(*a*,*b*) =  − *ψ*(*b*,*a*), so on the diagonal *ψ*(*a*,*a*) =  − *ψ*(*a*,*a*), and it vanishes (`pauli_exclusion`); the Slater form *f*(*a*)*g*(*b*) − *f*(*b*)*g*(*a*) does so explicitly (`slater_vanishes_on_diagonal`). A symmetric amplitude is free on the diagonal: a product *f*(*a*)*f*(*b*) is nonzero there wherever *f* is (`bosons_may_share`). Pauli’s exclusion principle (Pauli, 1925) is the seat’s odd reading: an odd reading returns zero on the fixed set. This is the same theorem Least Erasure proves for charge readings on the fixed set of charge conjugation, read here on the fixed set of the exchange.

The consequence is a bit. A fermion mode’s creation operator squares to zero, so the occupation number *n* satisfies *n*² = *n*, and an occupation equal to its own square is 0 or 1 (`fermion_occupation_is_a_bit`). Every fermion mode carries one bit.

The periodic table is that bit filling orbitals. With two states per orbital and the subshells taken in the Madelung order \[import\], the twin finds the shell closures at 2, 10, 18, 36, 54, 86 and 118: helium, neon, argon, krypton, xenon, radon and oganesson.

#### S.5 The Full Turn Returns Minus One

A rotation by angle *θ* about a unit axis *u* acts on spinors by the unit quaternion cos (*θ*/2) + *u*sin (*θ*/2) and on vectors by conjugation with it. At *θ* = 2*π* the quaternion is  − 1, the Return, *i**j**k* =  − 1 (`the_return`). It negates every spinor (`full_turn_negates_spinors`) and fixes every vector (`full_turn_fixes_vectors`), and two full turns are the identity (`two_turns_are_identity`). The quaternions *q* and  − *q* rotate every vector alike (`double_cover_two_to_one`), so the double cover of the rotations is two to one and its kernel, {1,  − 1}, is one bit.

The twin turns spinors and vectors about 1000 random axes and finds the full turn equal to  − 1 on spinors and to the identity on vectors to 2.2 × 10⁻¹⁶. The minus one is measured: neutrons rotated through 2*π* by a magnetic field in one arm of an interferometer shift the interference by exactly the sign, returning only after 4*π* (Rauch et al.; Werner et al., 1975).

#### S.6 The Turn Sign Is the Exchange Sign

A particle of spin *n*/2 turns to (−1)ⁿ under a full rotation (`turnSign_val`): half-integer spin to minus one, integer spin to plus one (`half_integer_spin_is_odd`). The spin-statistics theorem makes this sign the exchange sign: in a relativistic quantum theory with positive energy and local commutativity, half-integer-spin fields anticommute and integer-spin fields commute (Fierz, 1939; Pauli, 1940). It is an import \[QFT\], carried as one, and the engine proves what the identification then gives: a particle is a fermion exactly when its turn sign is odd.

A topological reading sharpens the identification. An exchange of two particles, followed by the return of the pair, is a full turn of one around the other, which is why the two signs coincide in models built on the rotation group’s double cover (Finkelstein and Rubinstein, 1968).

The rule reaches composites. A bound state is a fermion exactly when it holds an odd number of fermions. The twin checks twelve particles and atoms, from the electron and the photon to the deuteron and both helium isotopes: half-integer spin exactly when the count of constituent fermions is odd.

#### S.7 Statistics Is One Bit in Three Dimensions

In three dimensions a double exchange returns a pair to itself along a loop that can be shrunk, so the exchange sign *ε* satisfies *ε*² = 1, and then *ε* is  + 1 or  − 1 (`statistics_one_bit`). This is the rotation group’s two-element fundamental group, the same bit as the kernel of the double cover. The twin scans 3600 exchange phases and finds exactly two whose square is the identity.

In the plane the loop cannot be shrunk, and the exchange phase is free (Leinaas and Myrheim, 1977; Wilczek, 1982). A quarter phase *i* squares to  − 1 and is excluded in three dimensions (`anyon_needs_the_plane`). Anyons with the phase *π*/3 have been observed in the fractional quantum Hall state at filling one third (Bartolomei et al.; Nakamura et al., 2020). Statistics is one bit because space has three axes.

#### S.8 The Record Reads the Bit: Bunching and Antibunching

Two identical particles entering a balanced beam splitter from opposite ports leave through different ports with amplitude *t* ⋅ *t* + *ε* *r* ⋅ *r*, which is 1 − *ε* in doubled units with *t* = 1 and *r* = *i* (`coincidence`). Bosons never leave separately and fermions always do (`bosons_bunch_fermions_part`).

-   **Photons:** the coincidences vanish (Hong, Ou and Mandel, 1987).
-   **Electrons in quantum Hall edge channels:** they antibunch (Bocquillon et al., 2013).
-   **Helium atoms:** they show the bosonic dip (Lopes et al., 2015).
-   **Free neutrons:** they antibunch (Iannuzzi et al., 2006).

The one-body record does not read the statistics. A boson pair and a fermion pair built from the same two orbitals have one density at every site and differ at coincidence, where the pair reading reads the bit (`statistics_unread_by_one_body`). A thermal Bose mode has pair correlation 2 at zero separation and a thermal Fermi mode 0, because its occupation is one bit (the twin of the volume).

Helium-4 atoms bunch and helium-3 atoms antibunch in one apparatus, cold clouds released and counted atom by atom (Jeltes et al., 2007). The two isotopes are two worlds whose one-body densities agree and whose pair records part.

#### S.9 Degeneracy and Condensation: The Bit at Macroscopic Scale

**The fermion bit.** It holds matter up. Electrons that cannot share a state fill momentum space to a Fermi surface, and their degeneracy pressure supports a white dwarf up to a mass fixed by constants. For a carbon–oxygen star, with two nucleons per electron, the twin computes 1.43 solar masses (Chandrasekhar, 1931). Neutron degeneracy supports the neutron star beyond it.

**The boson bit.** It lets matter share a state. An ideal Bose gas at the density of liquid helium-4 condenses at 3.13 K, which the twin computes (London, 1938), against the lambda point of 2.17 K at which helium-4 becomes superfluid. Dilute alkali gases were condensed in 1995 (Anderson et al.; Davis et al.).

**Both at once.** Electron pairs bound into bosons carry superconductivity, and their charge 2*e* is why the flux quantum is *h*/2*e*, as the paper on light computes (Islam, 2026c). One bit per mode, read by the exchange, decides whether matter stacks or condenses.

#### S.10 What Spin and Statistics Carry, and What They Do Not

**What they carry.** They carry the seat on the exchange: the symmetric line and the antisymmetric side, registration as symmetrization, and a pair and its exchange as two worlds with one record. They carry Pauli exclusion as the odd reading’s blindness on the fixed set, and a fermion’s occupation as one bit. They carry the Return as the minus one of a full turn, and the double cover’s kernel as the same bit as the statistics sign. They carry the reason that bit is one bit: three axes.

**What they do not carry.** They do not carry a derivation of the spin-statistics theorem, which is imported with its hypotheses. They do not carry the Madelung ordering, which is an empirical rule with exceptions, or the magnitudes of the condensation and degeneracy scales, which are computed from constants and not derived. The engine’s delivery is on its own image (`value_on_image`).

#### S.11 Falsifiers

Three falsifiers, each a forbidden observation naming the theorem it would break.

-   **F-Exclusion:** two identical fermions in one state, or an atomic or nuclear transition into an already filled shell. This breaks `pauli_exclusion` and `fermion_occupation_is_a_bit` read physically.
-   **F-Connection:** a half-integer-spin particle obeying Bose statistics, or an integer-spin particle obeying Fermi statistics. This breaks the identification of the turn sign of `half_integer_spin_is_odd` with the exchange sign that the spin-statistics theorem carries.
-   **F-Anyon:** a particle free in three dimensions with an exchange phase other than  ± 1. This breaks `statistics_one_bit` read physically.

One class of experiment sharpens readings without moving the paper’s standing: underground searches for Pauli-forbidden atomic transitions.

## 12. Closure

The forcing of the law of matter is no longer informal prose. From a ring of coefficients and a quadratic form, and nothing more, Lean 4 with Mathlib compiles the equivalence of the mass shell as a square with the Clifford relations, the factorisation of the law of second order, the impossibility of coefficients that commute, the impossibility of sizes one, two and three, an explicit set of size four with both signs of the energy, the rotor of the law and its full turn, the product of two directions with the spin term, exclusion, and the two statistics of the permutations. No axiom is declared. No proof is left open. No headline theorem closes by its own hypothesis or over a structure that carries its conclusion.

The Dirac law is recovered as the law of first order whose square is the mass shell, with every mass left free. Its four components, its antiparticle and its half-spin are recovered with it, none of them entered. Exclusion is recovered from the full turn: the premise names no sign, and the law supplies minus one. The numerical twin executes the identities at two hundred thousand random points, finds by exhaustive search what the theorems say it must, and sets the law against measurement: the moment of the electron within the fine-structure constant of two, with a law that has no spin term excluded, and the antiproton at minus the proton.

Every boundary is in plain sight. That the exchange of two identical particles carries the number of the full turn is one field of one printed structure; in relativistic field theory it is the spin-statistics theorem, cited. That exchanges in three dimensions of space are permutations is topology, cited. That the spin is one half of the product of two generators, so that the spin term is a moment of two, is the classical reading, cited. That the law is of first order is the other field of the same structure.

That structure is not an arbitrary postulate. The two statements the reading rests on, Existence and Least Erasure, are theorems in their own domain: each has its own compiled Lean file, with no axiom declared, listed in the Lean Library Reference. There they are proved. The Heat Bridge, which joins erasure to heat, is a theorem there as well; the bridge spoken of below is a different one, from that domain to physics. Here they are used, and the difference is stated. Between that domain and the algebra of a law of first order lies a physical bridge: that the record keeps the least that suffices, and that the exchange of two identical particles is its mirror. This paper does not claim the bridge as a theorem. It writes the bridge down as `Premises`, so that the engine imports nothing outside Mathlib and can be checked alone, and so that a reader can see exactly which sentence carries the physics.

Two things are therefore separate, and the paper keeps them separate. Inside the kernel, the implication from `Premises` to the Dirac law and to exclusion is a mathematical certainty. No experiment, no consensus and no later revision of physics alters it, and anyone can recheck it with one compilation. Outside the kernel stand three falsifiers. They test whether nature satisfies the premises, and so far nature does. What survives both is not opinion. It is a theorem, and a physics that has met every test of its premises.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author’s. The Lean file and the Fortran twin are written by a language model under the author’s direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Classical results that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are computed from measured inputs, which Appendix B prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1.  P. A. M. Dirac, Proc. R. Soc. A 117 (1928) 610.
2.  W. Pauli, Z. Phys. 43 (1927) 601.
3.  R. Brauer and H. Weyl, Am. J. Math. 57 (1935) 425.
4.  W. Pauli, Phys. Rev. 58 (1940) 716.
5.  M. Fierz, Helv. Phys. Acta 12 (1939) 3.
6.  J. M. Leinaas and J. Myrheim, Nuovo Cimento B 37 (1977) 1.
7.  F. Wilczek, Phys. Rev. Lett. 49 (1982) 957.
8.  X. Fan, T. G. Myers, B. A. D. Sukra and G. Gabrielse, Phys. Rev. Lett. 130 (2023) 071801.
9.  J. Schwinger, Phys. Rev. 73 (1948) 416.
10. M. J. Borchert et al. (BASE), Nature 601 (2022) 53.
11. H. Shi et al. (VIP-2), Eur. Phys. J. C 78 (2018) 319.
12. C. D. Anderson, Phys. Rev. 43 (1933) 491.
13. H. Rauch, A. Zeilinger, G. Badurek, A. Wilfing, W. Bauspiess and U. Bonse, Phys. Lett. A 54 (1975) 425.
14. S. A. Werner, R. Colella, A. W. Overhauser and C. F. Eagen, Phys. Rev. Lett. 35 (1975) 1053.
15. H. Bartolomei et al., Science 368 (2020) 173.
16. J. Nakamura, S. Liang, G. C. Gardner and M. J. Manfra, Nat. Phys. 16 (2020) 931.
17. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
18. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
19. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
20. P. J. Mohr, D. B. Newell, B. N. Taylor and E. Tiesinga, Rev. Mod. Phys. 97 (2025) 025002.
21. H. Weyl, Z. Phys. 56 (1929) 330.
22. S. N. Bose, Z. Phys. 26 (1924) 178.
23. W. Pauli, Z. Phys. 31 (1925) 765.
24. E. Fermi, Z. Phys. 36 (1926) 902.
25. P. A. M. Dirac, Proc. R. Soc. A 112 (1926) 661.
26. S. Chandrasekhar, Astrophys. J. 74 (1931) 81.
27. F. London, Nature 141 (1938) 643.
28. D. Finkelstein and J. Rubinstein, J. Math. Phys. 9 (1968) 1762.
29. C. K. Hong, Z. Y. Ou and L. Mandel, Phys. Rev. Lett. 59 (1987) 2044.
30. M. H. Anderson, J. R. Ensher, M. R. Matthews, C. E. Wieman and E. A. Cornell, Science 269 (1995) 198.
31. K. B. Davis et al., Phys. Rev. Lett. 75 (1995) 3969.
32. M. Iannuzzi, A. Orecchini, F. Sacchetti, P. Facchi and S. Pascazio, Phys. Rev. Lett. 96 (2006) 080402.
33. T. Jeltes et al., Nature 445 (2007) 402.
34. E. Bocquillon et al., Science 339 (2013) 1054.
35. R. Lopes et al., Nature 520 (2015) 66.
36. W. R. Hamilton, Phil. Mag. 25 (1844) 489.
37. A. Einstein, Ann. Phys. 17 (1905) 891.
38. A. Einstein, Sitzungsber. Preuss. Akad. Wiss. (1924) 261.
39. E. Schrödinger, Ann. Phys. 79 (1926) 361.
40. P. A. M. Dirac, Proc. R. Soc. A 133 (1931) 60.
41. O. W. Greenberg, Phys. Rev. Lett. 13 (1964) 598.
42. S. Doplicher and J. E. Roberts, Commun. Math. Phys. 131 (1990) 51.
43. J. Nakamura, S. Liang, G. C. Gardner and M. J. Manfra, Nature Phys. 16 (2020) 931.
44. M. F. Islam, Light as a New Mathematical Theorem, edition 1.0.0 (2026c).
45. M. F. Islam, The Nuclear Forces as a New Mathematical Theorem, edition 1.0.0 (2026d).

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

**Appendix A · SPHYS_Dirac_Forced_CC.lean.** Lean 4.19.0 with Mathlib 4.19.0. 31 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D. *[a printed file, 649 lines, in the master and in the Journal edition]*

**Appendix B · Dirac_Forced_Twin_CC.f90.** Thirteen checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C. *[a printed file, 216 lines, in the master and in the Journal edition]*

**Appendix C · Run of Appendix B.** ```text
 A. The algebra, on 200000 random integer points
  PASS  the square of a direction is minus its squared length
  PASS  the product of two directions carries the dot and the cross
  PASS  the operator of first order squares to the mass shell
  PASS  on the mass shell, operator less mass times operator plus mass is zero
  PASS  no pair of numbers takes the square root, a and b in -6..6
   size two, entries 0, 1, -1, i, -i: matrices whose square is a scalar, not zero: 104; largest set that anticommutes in pairs: 3
  PASS  in size two three coefficients anticommute and four never do
 B. Exclusion and the two statistics
  PASS  an amplitude with the minus sign vanishes wherever two share a state
  PASS  a sign whose square is one is plus one or minus one, -50..50
   maps from the permutations of three things to signs that respect products: 2
  PASS  the permutations of three things carry two statistics and no third
 C. Against published measurements
   half the moment of the electron: least law 1, measured 1.00115965218059, first correction alpha/2pi = 0.00116141
  PASS  the least law holds within alpha: measured 1.00115965218059(13)
   rival, no spin term: half the moment 0.5, away from the measured value by  0.50116
  PASS  a law with no spin term is excluded: it misses by more than alpha
  PASS  the first correction closes the rest within (alpha/pi)^2
   antiproton to proton charge over mass: -1 at   0.19 uncertainties
  PASS  the antiparticle mirrors the particle: -1.000000000003(16) against -1
   reading, not a check: exclusion forced 0; measured probability of a violation below 3.4e-29
 BATTERY-JSON: {"checks":13,"failures":0} *[a printed file, 23 lines, in the master and in the Journal edition]*

**Appendix D · Kernel lines of Appendix A.** Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own. *[a printed file, 29 lines, in the master and in the Journal edition]*
