# Matter as a New Mathematical Theorem

## Exclusion Forced by the Full Turn, the Dirac Equation as the Least Law of a Half-Spin, and Two Statistics with No Third in Three Dimensions

**Mohammad F. Islam** · 25 November 2026

*On edition 2.0.0. Part I, Sections 1 to 10, is new: the forcing is rebuilt on a ring of coefficients, matrices over a field and the group of permutations, and is proved in Lean 4 with Mathlib. Part II, Section 11, is the reading of spin and statistics from Nothing Escapes, Least Erasure (Islam, 2026a), carried as text at premise grade. Section 12 closes the paper. The engine of edition 1.0.0 is withdrawn: its statements were proved over small structures of integers that carried the pieces of the law as fields, and they are replaced by the theorems of Appendix A.*

## Abstract

This paper proves, in Lean 4 with Mathlib, that a law of first order whose square is the mass shell is the Dirac law, and that the exchange of two of its particles excludes. The coefficients of the law are elements of a ring, the mass shell is a quadratic form, and nothing else is assumed: no relation among the coefficients, no size and no sign. The main theorem states: if the operator of first order squares to the mass shell at every momentum, its coefficients obey the Clifford relations, and conversely where two can be cancelled. Coefficients that commute cannot do so, so no numbers take the square root. Over a field in which two is not zero, four such coefficients cannot be matrices of size one, two or three, and an explicit set of size four is exhibited with every relation proved, so the law has four components and no fewer. Its coefficient of the energy has trace zero and square one in every case, and in the model it is diagonal with two entries plus one and two minus one, each pair carrying the half turn: two signs of the energy, twice each. The law factorises the law of second order for every mass. The product of two coefficients of space is the rotor of a half turn and squares to minus one, so the forced law is a half-spin: a full turn returns minus one on its components and returns every direction to itself. The product of two directions carries their dot product and their cross product, and with momenta that do not commute the square of the operator carries their commutators, which is the spin term. The premise on exchange names no sign: it says the exchange multiplies the amplitude by whatever number the full turn is. Since that number is minus one, the amplitude vanishes wherever two particles share a state; an amplitude that keeps its sign need not. A number by which the permutations act is one on every permutation or the sign of the permutation: two statistics and no third. A Fortran twin executes the identities on two hundred thousand random points, searches every matrix of size two with entries among five values and finds three that anticommute and never four, counts the sign maps of the permutations of three things and finds two, and sets the law against measurement: the moment of the electron within the fine-structure constant of two, with a law that has no spin term excluded, and the antiproton's ratio of charge to mass at minus that of the proton. That the exchange carries the sign of the full turn, and that exchanges in three dimensions of space are permutations, are cited and are named where they are used. Every premise of the paper is one field of one printed structure. Part II carries the reading of spin and statistics from which the paper takes its place in the series, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

Let $\gamma_\mu$ be elements of a ring that is an algebra over a commutative ring of constants, one for each direction $\mu$, and let $\eta_\mu$ be constants. For a momentum $p$ the operator of first order and the mass shell are

$$\gamma\cdot p = \sum_\mu p_\mu\,\gamma_\mu, \qquad p^2 = \sum_\mu \eta_\mu\,p_\mu^2.$$

The Clifford relations are $\gamma_\mu\gamma_\mu = \eta_\mu$ and $\gamma_\mu\gamma_\nu + \gamma_\nu\gamma_\mu = 0$ for $\mu \neq \nu$.

**Theorem (`square_forces_the_relations`).** If $(\gamma\cdot p)(\gamma\cdot p) = p^2$ at every momentum $p$, the coefficients obey the Clifford relations.

**Theorem (`relations_give_the_square`).** Conversely, in a ring where $x + x = 0$ gives $x = 0$, coefficients that obey the relations give $(\gamma\cdot p)(\gamma\cdot p) = p^2$ at every momentum.

**Theorem (`four_components`).** On the premises below, over a field in which two is not zero, the law has at least four components.

**Theorem (`exclusion_forced`).** On the premises below, over such a field, the amplitude of two identical particles of the law vanishes wherever the two share a state.

The law is the one Dirac wrote [1]. No mass is fixed by the theorems: `the_law_factorises` holds for every mass. The premises are met: `diracPremises` constructs a term of the structure over any field with a square root of minus one in which two is not zero, and `diracPremisesComplex` does so over the complex numbers, with an amplitude that is not zero.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. What is cited is in the tables of Section 1.3.

```lean
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

It carries two premises. The first is least order, the field `first_order`: the law is an operator of first order with matrix coefficients on $n$ components, $n$ at least one, whose square is the mass shell with signs $(+, -, -, -)$ at every momentum. The second is the field `exchange`: two identical particles of the law have an amplitude on pairs of states, and exchanging the two multiplies it by the number by which the full turn acts on the components of the law, whatever that number is. The field names no sign. Section 5 proves the number is minus one. No field of `Premises` states a relation among the coefficients, a size, or the conclusion of any theorem. Section 9 states where the premises come from.

### 1.3 What is proved, what is cited, what is assumed

| Statement | Standing | Where |
|---|---|---|
| The square of the operator is the mass shell at every momentum if and only if the coefficients obey the Clifford relations | Proved; the converse where $x + x = 0$ gives $x = 0$ | Appendix A, Part I |
| The law of second order is the product of two laws of first order, for every mass | Proved | Part I |
| Coefficients that commute cannot obey the relations | Proved, in a commutative domain where two is not zero | Part II |
| Four coefficients cannot have size one, two or three | Proved, over a field where two is not zero | Part III |
| Four coefficients of size four exist; the coefficient of the energy is diagonal, twice plus one and twice minus one | Proved, over a commutative ring with a square root of minus one | Part IV |

The table continues with the spin, the exchange and the premises.

| Statement | Standing | Where |
|---|---|---|
| The product of two directions is their dot product plus their cross product; the spin term | Proved | Part V |
| The rotor of a half turn squares to minus one and returns every direction; the same for two coefficients of the law | Proved | Part V |
| An amplitude with the minus sign vanishes where two share a state; one with the plus sign need not | Proved | Part VI |
| A number by which the permutations act is one or the sign: two statistics and no third | Proved, for values in a commutative domain | Part VI |
| On the premises: the Dirac relations, four components at the least, the two signs of the energy in balance, a half-spin, exclusion; the premises are met | Proved | Part VII |

What is not machine-checked is in the third table.

| Statement | Standing | Where |
|---|---|---|
| The exchange of two identical particles carries the number of the full turn | Premise; in relativistic field theory the spin-statistics theorem, cited: [4, 5] | Sections 6, 9 |
| A matrix of square one and trace zero has the values plus one and minus one equally often | Elementary, not formalised | Section 4 |
| In three dimensions of space and above the exchanges of $n$ particles are the permutations; in two dimensions they are not | Cited: [6, 7] | Section 7 |
| The spin is one half of the product of two generators, so that the spin term reads as a moment of two | Classical reading, cited: [1, 2] | Section 5 |
| The formulas of the twin: the first correction to the moment, $\alpha/2\pi$ | Entered from the literature [9]; numerical, not machine-checked | Section 8 |
| The law of a half-spin is of first order | Premise | Section 9 |

The paper claims as machine-checked the rows marked proved and no others. A row marked cited is a result with a published proof that this work has not machine-checked. A row marked entered is a classical formula used by the numerical twin alone; no theorem rests on it. Part II, the reading, is outside these tables: it is premise-grade and is labelled so where it begins.

## 2. A Law of First Order as Algebra

A law of first order needs coefficients that multiply momenta, and a mass shell needs a quadratic form. A ring with scalars and a finite set of directions is exactly this, and it is what the file of Appendix A formalises, in the kernel of Lean 4 [18] on the library Mathlib [17]. Working at this level has a cost and a gain. The cost is that no spacetime, no spinor bundle and no Hilbert space is constructed. The gain is that every theorem holds in every ring, the matrices over the complex numbers included, and for every set of directions and every choice of signs, so nothing proved in Sections 3 and 4 is special to four dimensions until a size is counted.

The definitions `slash`, `shell` and `Clifford` are the operator, the mass shell and the relations of Section 1.1. The coefficients are arbitrary in each. Nothing ties them until Section 3.

## 3. The Square Forces the Relations

Nothing in this section is assumed. Each statement is a theorem of Appendix A.

**The square forces the relations (`square_forces_the_relations`).** Take the momentum that is one along $\mu$ and zero elsewhere: the square is $\gamma_\mu\gamma_\mu$ and the shell is $\eta_\mu$. Take the momentum that is one along $\mu$ and along $\nu$: the square is $(\gamma_\mu + \gamma_\nu)^2$ and the shell is $\eta_\mu + \eta_\nu$, and what remains is $\gamma_\mu\gamma_\nu + \gamma_\nu\gamma_\mu = 0$. Nothing is divided, so the theorem holds in every ring.

**The relations give the square (`relations_give_the_square`).** Twice the square is the sum over pairs of $p_\mu p_\nu(\gamma_\mu\gamma_\nu + \gamma_\nu\gamma_\mu)$, which the relations reduce to twice the shell. The two is removed where $x + x = 0$ gives $x = 0$.

**The law factorises (`the_law_factorises`).** For every element $D$ and every mass $m$, $(D - m)(D + m) = D\,D - m^2$. With $D = \gamma\cdot p$ the right side is $p^2 - m^2$. On the mass shell the law of second order is the product of two laws of first order, and it is so for every mass: the theorem fixes the form of the law and no scale.

## 4. No Numbers Take the Square Root, and Four Components Do

**No numbers (`no_numbers_take_the_square_root`).** In a commutative domain where two is not zero, two elements whose squares are not zero cannot anticommute: their product would vanish. With two directions or more, the coefficients of the law cannot be numbers.

**Not size one, two or three (`four_is_the_least`).** Let the coefficients be square matrices over a field in which two is not zero, with squares that are scalars and not zero. A matrix that anticommutes with such a matrix has trace zero (`trace_zero_of_anticommute`). In odd size two of them cannot anticommute, because the determinant of the product would be minus itself (`no_two_in_odd_size`). In size two four of them cannot: with the unit matrix they would be five matrices, each with a square of trace not zero and each pair with a product of trace zero, hence five independent matrices in a space of dimension four (`no_four_in_size_two`). So four coefficients need size four at the least. That the least size is four is classical [3]; here it compiles.

**Size four (`model_clifford`).** Over any commutative ring with an element $i$ whose square is minus one, the file writes four matrices of size four and proves all four squares and all six anticommutators, with signs $(+, -, -, -)$.

**Two signs of the energy, in balance (`the_two_signs_of_the_energy_balance`, `model_energy`, `model_spin_commutes_with_energy`).** On the premises the coefficient of the energy has square one and trace zero, whatever the size, so plus one and minus one occur equally among its values; that step from the trace to the count is elementary and is not formalised. In the model it is diagonal with entries $1, 1, -1, -1$, and the rotor of Section 5 commutes with it, so each sign of the energy carries the half turn on its own two components. At rest the law reads the energy as plus the mass on two components and minus the mass on two. The second pair is the antiparticle, found in 1933 [12].

**A limit of scope.** A massless half-spin can be written on two components with a pair of different operators [21]. That pair is not one operator whose own square is the mass shell, and the theorem of this section is about such an operator.

## 5. The Forced Law Is a Half-Spin

**The full turn (`full_turn`).** Let three elements of a ring square to one and anticommute in pairs, and let $r = e_1 e_2$. Then $r$ reverses $e_1$ and $e_2$ and keeps $e_3$, acting by $x \mapsto r\,x\,r^{-1}$ with $r^{-1} = -r$: it is the rotor of a half turn in the plane of the first two. Its square, the full turn, is minus one. And the full turn, acting the same way, returns every element to itself.

**The rotor of the law (`rotor_of_the_law`, `the_forced_law_is_a_half_spin`).** Two coefficients of space of the forced law square to minus one and anticommute. Their product is again the rotor of a half turn in their plane, and its square is minus one. So on the premises a full turn multiplies the components of the law by minus one and leaves every direction as it was. The law forced in Section 3 is the law of a half-spin: this is derived, not entered. The sign is measured: a neutron turned once in a magnetic field returns with its phase reversed, and twice restores it [13, 14].

**The product of two directions (`product_of_two_directions`).** For two directions $a$ and $b$,

$$(a\cdot e)(b\cdot e) = a\cdot b + (a\times b)_1\,e_2e_3 + (a\times b)_2\,e_3e_1 + (a\times b)_3\,e_1e_2.$$

**The spin term (`the_spin_term`).** Let three momenta commute with the generators and not with one another. Then

$$(e\cdot p)^2 = p\cdot p + e_1e_2\,[p_1, p_2] + e_2e_3\,[p_2, p_3] + e_3e_1\,[p_3, p_1].$$

In a magnetic field the commutators of the momenta are the field, so the square of the operator carries the field times the products of pairs of generators. With the spin read as one half of those products, which is the classical reading [1, 2], the term is a magnetic moment of two in units of the orbital one. The identity is proved; the reading of its coefficient is cited.

## 6. Exclusion

**Exclusion (`exclusion`).** Let an amplitude on pairs of states change sign when its two arguments are exchanged, with values in a group where $v + v = 0$ gives $v = 0$. Then it vanishes wherever the two arguments are equal.

**A whole spin excludes nothing (`a_whole_spin_excludes_nothing`).** An amplitude that keeps its sign under exchange need not vanish there.

**On the premises (`exclusion_forced`).** The field `exchange` names no sign. It says that if the full turn acts on the components of the law as a number, the exchange multiplies the amplitude of two identical particles by that number. Section 5 proves the number is minus one. So the amplitude vanishes wherever the two share a state: exclusion is forced by the full turn. Two identical half-spins are never in one state. That the exchange carries the sign of the full turn is the premise; in relativistic field theory it is the spin-statistics theorem [4, 5], which is cited and not formalised.

## 7. Two Statistics and No Third

**A sign (`a_sign_is_plus_or_minus_one`).** In a commutative domain a number whose square is one is plus one or minus one.

**Two statistics and no third (`two_statistics_and_no_third`).** Let the permutations of finitely many things act on amplitudes by a number: a map to a commutative domain that sends products to products and the identity to one. Then the map is one on every permutation, or it is the sign of the permutation. The proof is that every exchange of two is conjugate to every other, so all take one value, whose square is one.

**Where the exchanges are permutations.** In three dimensions of space and above, a double exchange of two particles can be undone, and the exchanges of $n$ particles form the group of permutations. In two dimensions they form a larger group, and other phases appear [6, 7]; they are observed in the plane [15, 16]. This is topology, cited and not formalised. What the theorem adds is that, once the exchanges are permutations and act by a number, there are two statistics and no third.

## 8. The Numerical Twin

The twin of Appendix B does three things the kernel does not. It executes the identities independently, it searches small cases exhaustively for what the theorems forbid, and it sets readings of the law against published measurements.

**The algebra.** At two hundred thousand random integer points the twin checks the square of a direction, the product of two directions, the square of the operator against the mass shell, and the factorisation on the mass shell. No pair of whole numbers from minus six to six takes the square root.

**The searches.** Among the 625 matrices of size two with entries $0, 1, -1, i, -i$, the twin finds 104 whose square is a scalar that is not zero, three that anticommute in pairs, and never four. Among the 64 maps from the six permutations of three things to signs, it finds two that respect products.

**The measurements.** The inputs are measured and are printed in Appendix B.

| Test | Law | Rival | Measured |
|---|---|---|---|
| Half the moment of the electron | 1, and 1 + 0.00116141 with the first correction [9] | 0.5 (no spin term) | 1.00115965218059(13) [8] |
| Antiproton to proton, charge over mass | $-1$ | | $-1.000000000003(16)$ [10] |
| Probability of a violation of exclusion | 0 | | below $3.4\times10^{-29}$ [11] |

Thirteen checks pass and none fails. Three limits are stated. The law gives the moment as two; the measured value differs from it at the scale of the fine-structure constant [20], and the first correction, which closes the difference to the square of that scale, is a classical formula of the field's own quantum [9] and is entered, not derived here. The bound on a violation of exclusion is printed as a reading and is not counted as a check, since a bound compared with zero cannot fail. The twin tests the law against one rival and against measurement. It is not a new prediction, and the agreement of the Dirac law with these measurements was known.

## 9. Discussion: The Reading

The derivation above uses only algebra. This section states the reading from which the premises come, and marks what in it is theorem and what is premise.

**Why first order.** In the reading of Part II the record keeps the least that suffices. A law of second order determines a state by its value and its rate; a law of first order by its value alone. The premise is that the law of matter is the least: of first order, with the mass shell as its square. That is the field `first_order`. What the paper proves is what the premise forces: the Clifford relations, coefficients that are not numbers, four components and no fewer, both signs of the energy, and a half-spin.

**Why the exchange is the turn.** In the reading the exchange of two identical particles is the mirror of the seat, and it carries the sign the particle carries under a full turn. That is the field `exchange`. The premise is physics and is not a theorem of this paper. What the paper proves is that the sign is minus one for the forced law, and what follows: the amplitude is empty wherever two share a state.

**What the paper does not claim.** It does not derive any mass. It does not derive the spin-statistics theorem, nor the topology of exchanges. It does not claim that the Dirac law or exclusion was unknown or untested. It claims that the form of the law is forced by least order, that its size and its spin are forced with it, that exclusion follows from one named premise, and that each statement of Section 1.3 marked proved compiles. The fuller account of the reading, spin and statistics on the seat, is Part II, Section 11, carried from [19]. No theorem of Sections 2 to 8 depends on it.

## 10. Predictions, Falsifiers, and What Stands

The paper recovers the Dirac law and the exclusion principle. It predicts no measurement that they do not and derives no constant. Its commitments are those of the forced law, and they are stated here as commitments: three that the paper says will stand at any future precision, two proposals it says will fail, and the three observations that would refute it.

### 10.1 Three predictions that will stand

1. **Exclusion is exact.** `exclusion_forced` gives zero. The present bound on the probability of a violation is $3.4\times10^{-29}$ [11]. The prediction is that no experiment finds two identical half-spins in one state.
2. **The antiparticle mirrors the particle.** The law carries both signs of the energy in balance, with one mass (`the_two_signs_of_the_energy_balance`, `the_law_factorises`). The measured ratio of the charge over mass of the antiproton to that of the proton is $-1.000000000003(16)$ [10]. The prediction is that it stays at minus one.
3. **A full turn of a half-spin is minus one.** `the_forced_law_is_a_half_spin` gives it. Neutron interferometry finds the phase reversed after one turn and restored after two [13, 14]. The prediction is that no half-spin returns to itself after one turn.

### 10.2 Two proposals that will fail

1. **A third statistics in three dimensions of space.** `two_statistics_and_no_third` leaves none, once exchanges are permutations acting by a number. The paper predicts that every particle found in three dimensions is of one of the two, and that statistics between them appear only where the exchanges are not permutations, as in the plane [15, 16].
2. **A law of first order for a massive half-spin on fewer than four components.** `four_is_the_least` forbids it. The paper predicts that every such proposal either gives up the mass shell as the square of one operator or carries four components under another name.

### 10.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, or the forced law as the law of nature, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment's printed uncertainties.

1. **Two identical half-spins in one state.** It refutes the field `exchange` through `exclusion_forced`.
2. **A particle of the law whose antiparticle differs from it in mass.** It refutes the field `first_order`, since the two signs of the energy come from one operator with one mass.
3. **A half-spin that returns to itself after one full turn.** It refutes the field `first_order` through `the_forced_law_is_a_half_spin`.

Apart from them stands the formal claim, which no observation touches and one compilation settles: every theorem named in this text prints its axioms in Appendix D, and a line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved.

### 10.4 What kind of result this is

It is not a new physics. It is a change in how a physical derivation can be checked. The forcing of the Dirac law is here a single file whose every step the kernel has verified, whose every assumption is one field of one structure, and whose readings are set against measurement. A reader who doubts a step can name the line.

The implication from `Premises` to the Dirac relations, to four components, to the half-spin and to exclusion is checked by the Lean kernel. No experiment and no later revision of physics alters an implication. Experiment remains free to test whether nature satisfies the premises, and that is all it can test here. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and the structure `Premises` is printed for that purpose. What stands is the tables of Section 1.3.

## 11. Part II · The Reading

*This part is the reading from which the paper takes its place in the series. It is carried from Nothing Escapes, Least Erasure (Islam, 2026a), where it stands as the chapter Spin and Statistics, and it is premise-grade. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 8 depends on it. The theorem names set in code in this part, and the twin it quotes, are those of that volume and are printed there, not here. Where this part calls a statement a theorem, the statement follows from the placement of the reading, which is its premise. The falsifiers listed in Section S.11 are falsifiers of the reading; they stand beside the three of Section 10.3 and are not among them.*

### 11.1 Spin and Statistics

*Bosons on the Line and Fermions at Its Side, Pauli Exclusion as an Odd Reading Blind on the Fixed Set, the Full Turn's Minus One as the Exchange Sign, and Statistics as One Bit in Three Dimensions.* Edition 1.0.0.

**Abstract of the chapter.** Every particle in three dimensions is a boson or a fermion, and the choice is fixed by its spin: half-integer spin turns a state to its negative under a full rotation and makes it antisymmetric under exchange; integer spin does neither. This chapter reads the pair on the seat, the reflection $s\mapsto1-\bar s$ and the line it fixes. The exchange of two identical particles is an involution, and a carrier that sends a pair amplitude's antisymmetric part to the side and its symmetric part to the height makes the exchange the fold: the symmetric amplitudes, the bosons, are the line; the antisymmetric ones, the fermions, stand at height zero off it; registration keeps the symmetric part and forgets the rest. We prove in core Lean 4, sixty-nine laws with no axiom declared and no use of choice, that an antisymmetric amplitude vanishes wherever the exchange fixes the configuration, so Pauli exclusion is an odd reading blind on the fixed set and a fermion's occupation is one bit; that a full turn is minus one on spinors and the identity on vectors, the double cover being two to one; that an exchange sign whose square is the identity, as a double exchange is in three dimensions, is plus or minus one, while a quarter phase needs the plane; that bosons bunch and fermions part at a balanced splitter; and that the one-body record does not read the statistics, which only the pair reading returns. With the spin-statistics theorem carried as an import, the full turn's sign is the exchange sign. A Fortran twin runs seventeen checks with zero failures: from two states per orbital and one fermion per state it finds the noble gases at 2, 10, 18, 36, 54, 86 and 118, Chandrasekhar's mass at 1.43 solar masses, and London's condensation temperature for helium-4 at 3.13 K.

#### S.1 The Reader's Frame

This chapter reads the two properties every particle carries in three dimensions, its spin and its statistics, and the theorem that joins them. A full turn of a spinor lands on minus one, the quaternion identity $ijk=-1$.

It claims three things. First, the exchange of two identical particles is the fold under a carrier forced by the symmetry, so bosons are the line and fermions stand at its side. Second, Pauli exclusion is the seat's odd reading: an antisymmetric amplitude is blind exactly on the configurations the exchange fixes. Third, statistics is one bit, and in three dimensions it is the same bit as the full turn's sign.

It refuses the derivation of the spin-statistics theorem, which is carried as an import from relativistic quantum field theory [QFT]. Sections 1 to 10 of this paper set that theorem as a named premise and force exclusion on it.

**Negative warrants.** Two, stated so that no reader supplies them. No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade. No quantum field theory is written: the spin-statistics theorem, the Madelung ordering of atomic subshells, and the constants enter as imports or measurements.

**Five terms.** An *exchange* swaps two identical particles. A pair amplitude is *symmetric* when the exchange leaves it unchanged and *antisymmetric* when the exchange negates it. A *reading* is *odd* under a map that flips its sign and *even* under one that keeps it. *Registration* keeps a point's height and forgets its side. A *keyed bit* is a yes-or-no property no function of a given record decides.


#### S.2 The Spine

The seat is a mirror and a record: the reflection $s\mapsto1-\bar s$, its fixed line, and the registration that keeps a point's height and forgets its side. This chapter reads the seat on the exchange in Section S.3, the odd reading in Pauli exclusion in Section S.4, the Return in Section S.5, its identification with the exchange sign in Section S.6, the one bit in Section S.7, the record that reads the bit in Section S.8, and the bit at macroscopic scale in Section S.9.

**Why this carrier, and not another.** The carrier is not chosen. Spaces with an involution and the maps that respect them form a category (`equivariant_id`, `equivariant_comp`), and the fixed set is a functor on it (`fix_functorial`); an equivariant map into the seat, whose fixed set is the line (`fold_global_seat`), lands every physical fixed point on the line (`equivariant_carrier_lands`). Here the physical involution is the exchange of two identical particles on a pair amplitude $(x,y)$, $x$ on the ordered slots $(a,b)$ and $y$ on $(b,a)$. The carrier $(x,y)\mapsto(1+(x-y),\,x+y)$ sends the antisymmetric part to the side and the symmetric part to the height, and it is equivariant (`exchange_carrier_equivariant`). Its landing on the symmetric amplitudes is forced by the functor (`exchange_carrier_lands`).

**The correspondence matrix.**

\begingroup\small

| Physical phenomenon | Element of the seat | Lean theorem | Fortran check |
|----------|----------|----------|----------|
| exchange of identical particles | the fold | `exchange_carrier_equivariant`, `swap_involutive` | 3721 of 3721 |
| bosons | the line | `symmetric_on_the_line`, `exchange_carrier_lands` | 3721 of 3721 |
| fermions | height zero, off the line | `antisymmetric_at_height_zero` | 61 of 61 |
| a pair and its exchange | two worlds over one record | `exchange_two_worlds` | 3660 of 3660 |
| Pauli exclusion | the odd reading blind on the fixed set | `pauli_exclusion`, `slater_vanishes_on_diagonal` | 1000 and 1000 |
| bosons sharing a state | the even reading free on it | `bosons_may_share` | structural |
| a fermion's occupation | one bit | `fermion_occupation_is_a_bit` | 101 of 101 |
| the periodic table | the bit filling orbitals | `fermion_occupation_is_a_bit` with Madelung [import] | 2, 10, 18, 36, 54, 86, 118 |
| the full turn | the Return: minus one on spinors | `the_return`, `full_turn_negates_spinors`, `full_turn_fixes_vectors`, `two_turns_are_identity` | 1000 axes to 2.2e-16 |
| the double cover | two to one, a kernel of one bit | `double_cover_two_to_one` | 1000 rotations |
| spin and statistics | the turn sign is the exchange sign | `turnSign_val`, `half_integer_spin_is_odd` with [QFT] | twelve particles and atoms |
| statistics in three dimensions | one bit | `statistics_one_bit` | 2 of 3600 phases |
| anyons in the plane | the quarter phase excluded in three dimensions | `anyon_needs_the_plane` | π/3 |
| Hong–Ou–Mandel | bosons bunch, fermions part | `bosons_bunch_fermions_part` | coincidence 0 and 1 |
| helium-4 and helium-3 | one one-body record, the pair reads the bit | `statistics_unread_by_one_body` | g2 = 2 and 0 |
| white dwarfs, superfluid helium | the bit at macroscopic scale | the occupation bit, with [import] | 1.43 solar masses; 3.13 K |

\endgroup


#### S.3 The Exchange Is the Fold

Two identical particles in two single-particle states $a$ and $b$ have a pair amplitude $(x,y)$: $x$ for the first in $a$ and the second in $b$, $y$ for the reverse. Exchange swaps them and is an involution (`swap_involutive`). The exchange carrier sends the antisymmetric part $x-y$ to the side and the symmetric part $x+y$ to the height, and the exchange becomes the fold (`exchange_carrier_equivariant`).

Three readings follow from the carrier.

- **Bosons are the line.** An amplitude lands on the line exactly when it is symmetric (`symmetric_on_the_line`).
- **Fermions stand at height zero.** An antisymmetric amplitude has no symmetric part and stands off the line unless it vanishes (`antisymmetric_at_height_zero`).
- **Registration is symmetrization.** It keeps the symmetric part as the record and forgets the antisymmetric part, so a pair and its exchange are two states with one record (`exchange_two_worlds`).

The twin executes the carrier on 3721 integer amplitudes.


#### S.4 Pauli Exclusion: The Odd Reading Is Blind on the Fixed Set

The exchange fixes a configuration when both particles are in one state. An antisymmetric amplitude obeys $\psi(a,b)=-\psi(b,a)$, so on the diagonal $\psi(a,a)=-\psi(a,a)$, and it vanishes (`pauli_exclusion`); the Slater form $f(a)g(b)-f(b)g(a)$ does so explicitly (`slater_vanishes_on_diagonal`). A symmetric amplitude is free on the diagonal: a product $f(a)f(b)$ is nonzero there wherever $f$ is (`bosons_may_share`). Pauli's exclusion principle (Pauli, 1925) is the seat's odd reading: an odd reading returns zero on the fixed set. This is the same theorem Least Erasure proves for charge readings on the fixed set of charge conjugation, read here on the fixed set of the exchange.

The consequence is a bit. A fermion mode's creation operator squares to zero, so the occupation number $n$ satisfies $n^2=n$, and an occupation equal to its own square is $0$ or $1$ (`fermion_occupation_is_a_bit`). Every fermion mode carries one bit.

The periodic table is that bit filling orbitals. With two states per orbital and the subshells taken in the Madelung order [import], the twin finds the shell closures at 2, 10, 18, 36, 54, 86 and 118: helium, neon, argon, krypton, xenon, radon and oganesson.


#### S.5 The Full Turn Returns Minus One

A rotation by angle $\theta$ about a unit axis $u$ acts on spinors by the unit quaternion $\cos\frac\theta2+u\sin\frac\theta2$ and on vectors by conjugation with it. At $\theta=2\pi$ the quaternion is $-1$, the Return, $ijk=-1$ (`the_return`). It negates every spinor (`full_turn_negates_spinors`) and fixes every vector (`full_turn_fixes_vectors`), and two full turns are the identity (`two_turns_are_identity`). The quaternions $q$ and $-q$ rotate every vector alike (`double_cover_two_to_one`), so the double cover of the rotations is two to one and its kernel, $\{1,-1\}$, is one bit.

The twin turns spinors and vectors about 1000 random axes and finds the full turn equal to $-1$ on spinors and to the identity on vectors to $2.2\times10^{-16}$. The minus one is measured: neutrons rotated through $2\pi$ by a magnetic field in one arm of an interferometer shift the interference by exactly the sign, returning only after $4\pi$ (Rauch et al.; Werner et al., 1975).


#### S.6 The Turn Sign Is the Exchange Sign

A particle of spin $n/2$ turns to $(-1)^n$ under a full rotation (`turnSign_val`): half-integer spin to minus one, integer spin to plus one (`half_integer_spin_is_odd`). The spin-statistics theorem makes this sign the exchange sign: in a relativistic quantum theory with positive energy and local commutativity, half-integer-spin fields anticommute and integer-spin fields commute (Fierz, 1939; Pauli, 1940). It is an import [QFT], carried as one, and the engine proves what the identification then gives: a particle is a fermion exactly when its turn sign is odd.

A topological reading sharpens the identification. An exchange of two particles, followed by the return of the pair, is a full turn of one around the other, which is why the two signs coincide in models built on the rotation group's double cover (Finkelstein and Rubinstein, 1968).

The rule reaches composites. A bound state is a fermion exactly when it holds an odd number of fermions. The twin checks twelve particles and atoms, from the electron and the photon to the deuteron and both helium isotopes: half-integer spin exactly when the count of constituent fermions is odd.


#### S.7 Statistics Is One Bit in Three Dimensions

In three dimensions a double exchange returns a pair to itself along a loop that can be shrunk, so the exchange sign $\varepsilon$ satisfies $\varepsilon^2=1$, and then $\varepsilon$ is $+1$ or $-1$ (`statistics_one_bit`). This is the rotation group's two-element fundamental group, the same bit as the kernel of the double cover. The twin scans 3600 exchange phases and finds exactly two whose square is the identity.

In the plane the loop cannot be shrunk, and the exchange phase is free (Leinaas and Myrheim, 1977; Wilczek, 1982). A quarter phase $i$ squares to $-1$ and is excluded in three dimensions (`anyon_needs_the_plane`). Anyons with the phase $\pi/3$ have been observed in the fractional quantum Hall state at filling one third (Bartolomei et al.; Nakamura et al., 2020). Statistics is one bit because space has three axes.


#### S.8 The Record Reads the Bit: Bunching and Antibunching

Two identical particles entering a balanced beam splitter from opposite ports leave through different ports with amplitude $t\cdot t+\varepsilon\,r\cdot r$, which is $1-\varepsilon$ in doubled units with $t=1$ and $r=i$ (`coincidence`). Bosons never leave separately and fermions always do (`bosons_bunch_fermions_part`).

- **Photons:** the coincidences vanish (Hong, Ou and Mandel, 1987).
- **Electrons in quantum Hall edge channels:** they antibunch (Bocquillon et al., 2013).
- **Helium atoms:** they show the bosonic dip (Lopes et al., 2015).
- **Free neutrons:** they antibunch (Iannuzzi et al., 2006).

The one-body record does not read the statistics. A boson pair and a fermion pair built from the same two orbitals have one density at every site and differ at coincidence, where the pair reading reads the bit (`statistics_unread_by_one_body`). A thermal Bose mode has pair correlation 2 at zero separation and a thermal Fermi mode 0, because its occupation is one bit (the twin of the volume).

Helium-4 atoms bunch and helium-3 atoms antibunch in one apparatus, cold clouds released and counted atom by atom (Jeltes et al., 2007). The two isotopes are two worlds whose one-body densities agree and whose pair records part.


#### S.9 Degeneracy and Condensation: The Bit at Macroscopic Scale

**The fermion bit.** It holds matter up. Electrons that cannot share a state fill momentum space to a Fermi surface, and their degeneracy pressure supports a white dwarf up to a mass fixed by constants. For a carbon–oxygen star, with two nucleons per electron, the twin computes $1.43$ solar masses (Chandrasekhar, 1931). Neutron degeneracy supports the neutron star beyond it.

**The boson bit.** It lets matter share a state. An ideal Bose gas at the density of liquid helium-4 condenses at 3.13 K, which the twin computes (London, 1938), against the lambda point of 2.17 K at which helium-4 becomes superfluid. Dilute alkali gases were condensed in 1995 (Anderson et al.; Davis et al.).

**Both at once.** Electron pairs bound into bosons carry superconductivity, and their charge $2e$ is why the flux quantum is $h/2e$, as the paper on light computes (Islam, 2026c). One bit per mode, read by the exchange, decides whether matter stacks or condenses.


#### S.10 What Spin and Statistics Carry, and What They Do Not

**What they carry.** They carry the seat on the exchange: the symmetric line and the antisymmetric side, registration as symmetrization, and a pair and its exchange as two worlds with one record. They carry Pauli exclusion as the odd reading's blindness on the fixed set, and a fermion's occupation as one bit. They carry the Return as the minus one of a full turn, and the double cover's kernel as the same bit as the statistics sign. They carry the reason that bit is one bit: three axes.

**What they do not carry.** They do not carry a derivation of the spin-statistics theorem, which is imported with its hypotheses. They do not carry the Madelung ordering, which is an empirical rule with exceptions, or the magnitudes of the condensation and degeneracy scales, which are computed from constants and not derived. The engine's delivery is on its own image (`value_on_image`).


#### S.11 Falsifiers

Three falsifiers, each a forbidden observation naming the theorem it would break.

- **F-Exclusion:** two identical fermions in one state, or an atomic or nuclear transition into an already filled shell. This breaks `pauli_exclusion` and `fermion_occupation_is_a_bit` read physically.
- **F-Connection:** a half-integer-spin particle obeying Bose statistics, or an integer-spin particle obeying Fermi statistics. This breaks the identification of the turn sign of `half_integer_spin_is_odd` with the exchange sign that the spin-statistics theorem carries.
- **F-Anyon:** a particle free in three dimensions with an exchange phase other than $\pm1$. This breaks `statistics_one_bit` read physically.

One class of experiment sharpens readings without moving the paper's standing: underground searches for Pauli-forbidden atomic transitions.

## 12. Closure

The forcing of the law of matter is no longer informal prose. From a ring of coefficients and a quadratic form, and nothing more, Lean 4 with Mathlib compiles the equivalence of the mass shell as a square with the Clifford relations, the factorisation of the law of second order, the impossibility of coefficients that commute, the impossibility of sizes one, two and three, an explicit set of size four with both signs of the energy, the rotor of the law and its full turn, the product of two directions with the spin term, exclusion, and the two statistics of the permutations. No axiom is declared. No proof is left open. No headline theorem closes by its own hypothesis or over a structure that carries its conclusion.

The Dirac law is recovered as the law of first order whose square is the mass shell, with every mass left free. Its four components, its antiparticle and its half-spin are recovered with it, none of them entered. Exclusion is recovered from the full turn: the premise names no sign, and the law supplies minus one. The numerical twin executes the identities at two hundred thousand random points, finds by exhaustive search what the theorems say it must, and sets the law against measurement: the moment of the electron within the fine-structure constant of two, with a law that has no spin term excluded, and the antiproton at minus the proton.

Every boundary is in plain sight. That the exchange of two identical particles carries the number of the full turn is one field of one printed structure; in relativistic field theory it is the spin-statistics theorem, cited. That exchanges in three dimensions of space are permutations is topology, cited. That the spin is one half of the product of two generators, so that the spin term is a moment of two, is the classical reading, cited. That the law is of first order is the other field of the same structure.

That structure is not an arbitrary postulate. The two statements the reading rests on, Existence and Least Erasure, are theorems in their own domain: each has its own compiled Lean file, with no axiom declared, listed in the Lean Library Reference. There they are proved. The Heat Bridge, which joins erasure to heat, is a theorem there as well; the bridge spoken of below is a different one, from that domain to physics. Here they are used, and the difference is stated. Between that domain and the algebra of a law of first order lies a physical bridge: that the record keeps the least that suffices, and that the exchange of two identical particles is its mirror. This paper does not claim the bridge as a theorem. It writes the bridge down as `Premises`, so that the engine imports nothing outside Mathlib and can be checked alone, and so that a reader can see exactly which sentence carries the physics.

Two things are therefore separate, and the paper keeps them separate. Inside the kernel, the implication from `Premises` to the Dirac law and to exclusion is a mathematical certainty. No experiment, no consensus and no later revision of physics alters it, and anyone can recheck it with one compilation. Outside the kernel stand three falsifiers. They test whether nature satisfies the premises, and so far nature does. What survives both is not opinion. It is a theorem, and a physics that has met every test of its premises.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file and the Fortran twin are written by a language model under the author's direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Classical results that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are computed from measured inputs, which Appendix B prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. P. A. M. Dirac, Proc. R. Soc. A 117 (1928) 610.
2. W. Pauli, Z. Phys. 43 (1927) 601.
3. R. Brauer and H. Weyl, Am. J. Math. 57 (1935) 425.
4. W. Pauli, Phys. Rev. 58 (1940) 716.
5. M. Fierz, Helv. Phys. Acta 12 (1939) 3.
6. J. M. Leinaas and J. Myrheim, Nuovo Cimento B 37 (1977) 1.
7. F. Wilczek, Phys. Rev. Lett. 49 (1982) 957.
8. X. Fan, T. G. Myers, B. A. D. Sukra and G. Gabrielse, Phys. Rev. Lett. 130 (2023) 071801.
9. J. Schwinger, Phys. Rev. 73 (1948) 416.
10. M. J. Borchert et al. (BASE), Nature 601 (2022) 53.
11. H. Shi et al. (VIP-2), Eur. Phys. J. C 78 (2018) 319.
12. C. D. Anderson, Phys. Rev. 43 (1933) 491.
13. H. Rauch, A. Zeilinger, G. Badurek, A. Wilfing, W. Bauspiess and U. Bonse, Phys. Lett. A 54 (1975) 425.
14. S. A. Werner, R. Colella, A. W. Overhauser and C. F. Eagen, Phys. Rev. Lett. 35 (1975) 1053.
15. H. Bartolomei et al., Science 368 (2020) 173.
16. J. Nakamura, S. Liang, G. C. Gardner and M. J. Manfra, Nat. Phys. 16 (2020) 931.
17. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
18. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
19. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
20. P. J. Mohr, D. B. Newell, B. N. Taylor and E. Tiesinga, Rev. Mod. Phys. 97 (2025) 025002.
21. H. Weyl, Z. Phys. 56 (1929) 330.
22. S. N. Bose, Z. Phys. 26 (1924) 178.
23. W. Pauli, Z. Phys. 31 (1925) 765.
24. E. Fermi, Z. Phys. 36 (1926) 902.
25. P. A. M. Dirac, Proc. R. Soc. A 112 (1926) 661.
26. S. Chandrasekhar, Astrophys. J. 74 (1931) 81.
27. F. London, Nature 141 (1938) 643.
28. D. Finkelstein and J. Rubinstein, J. Math. Phys. 9 (1968) 1762.
29. C. K. Hong, Z. Y. Ou and L. Mandel, Phys. Rev. Lett. 59 (1987) 2044.
30. M. H. Anderson, J. R. Ensher, M. R. Matthews, C. E. Wieman and E. A. Cornell, Science 269 (1995) 198.
31. K. B. Davis et al., Phys. Rev. Lett. 75 (1995) 3969.
32. M. Iannuzzi, A. Orecchini, F. Sacchetti, P. Facchi and S. Pascazio, Phys. Rev. Lett. 96 (2006) 080402.
33. T. Jeltes et al., Nature 445 (2007) 402.
34. E. Bocquillon et al., Science 339 (2013) 1054.
35. R. Lopes et al., Nature 520 (2015) 66.
36. W. R. Hamilton, Phil. Mag. 25 (1844) 489.
37. A. Einstein, Ann. Phys. 17 (1905) 891.
38. A. Einstein, Sitzungsber. Preuss. Akad. Wiss. (1924) 261.
39. E. Schrödinger, Ann. Phys. 79 (1926) 361.
40. P. A. M. Dirac, Proc. R. Soc. A 133 (1931) 60.
41. O. W. Greenberg, Phys. Rev. Lett. 13 (1964) 598.
42. S. Doplicher and J. E. Roberts, Commun. Math. Phys. 131 (1990) 51.
43. J. Nakamura, S. Liang, G. C. Gardner and M. J. Manfra, Nature Phys. 16 (2020) 931.
44. M. F. Islam, Light as a New Mathematical Theorem, edition 1.0.0 (2026c).
45. M. F. Islam, The Nuclear Forces as a New Mathematical Theorem, edition 1.0.0 (2026d).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its engine uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main, read at commit 38f6678.

46. Root Axiom and Existence: Publication Library/Philosophy/Metaphysics/Root Axiom/TOE_Zero.lean. Compiled alone in core Lean 4.19.0, exit 0.
47. RH master: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_44_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.
48. Existence, as carried in the RH master: line 6635.
49. Heat Bridge: RH master, Parts VII-c and VII-d.
50. Prime Freedom: RH master, Parts XIII and XIV.
51. Freedom Arrow: RH master, Part XV.
52. Least Erasure: protocols/RH One Bit/Nothing Escapes Three Plus One/Least_Erasure.lean. Compiled alone in core Lean 4.19.0, exit 0.
53. Second Law: Publication Library/Mathematics/Mathematical Physics/Second_Law_Theorem_v1_0_0_CC.pdf, with its Lean file printed inside.
54. P versus NP master: FINAL_BINDING/PNP Binding/PNP_Normal_Form_Paper_v1_14_0_CC.lean
55. ZFC seal: lean/ZFC_Block_Hardened_FINAL_v2_0_0_Hermetically_Sealed.lean
56. No Second Sovereign: Publication Library/Mathematics/Millennium Series/No_Second_Sovereign_v1_0_0_CC.lean
57. Future Proof Empirical Witness Seal: Publication Library/Mathematics/Millennium Series/Future_Proof_Empirical_Witness_Seal_v1_0_0_CC.lean

## Appendix A · SPHYS_Dirac_Forced_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 31 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D.

```lean
/-
SPHYS_Dirac_Forced_CC.lean · the Dirac law and exclusion, on real algebra
RATIONALE. The engine of edition 1.0.0 proved its statements over small structures of integers that carried the
  pieces of the law as fields. This file replaces it. The coefficients of the law are elements of a ring, the mass
  shell is a quadratic form, a spinor is a column on which matrices act, and an exchange is a permutation.
  Nothing else is assumed.
DESIGN. Parts, in order.
    Part I    `slash`, `shell`, `Clifford`. Proved: a law of first order squares to the mass shell on every
              momentum if and only if its coefficients obey the Clifford relations
              (`square_forces_the_relations`, `relations_give_the_square`); `the_law_factorises`.
    Part II   `no_numbers_take_the_square_root`: coefficients that commute cannot obey the relations.
    Part III  Matrices over a field. Proved: `trace_zero_of_anticommute`; `no_two_in_odd_size`;
              `no_four_in_size_two`; `four_is_the_least`.
    Part IV   An explicit set of four matrices of size four over any commutative ring with a square root of minus
              one. Every relation is proved (`model_clifford`). `model_energy`: the coefficient of the energy is
              diagonal, twice plus one and twice minus one. `model_spin_commutes_with_energy`.
    Part V    Three directions that anticommute. Proved: `product_of_two_directions`, `the_spin_term`,
              `full_turn`: the rotor of a half turn squares to minus one and turns every direction back;
              `rotor_of_the_law`: the same for two coefficients of the law.
    Part VI   `exclusion`, `a_whole_spin_excludes_nothing`, `a_sign_is_plus_or_minus_one`,
              `two_statistics_and_no_third`: a one-dimensional action of the permutations is trivial or the sign.
    Part VII  `Premises`; `dirac_forced`; `four_components`; `the_two_signs_of_the_energy_balance`;
              `the_forced_law_is_a_half_spin`; `exclusion_forced`; `diracPremises`: the structure
              is inhabited.
WHAT IS NOT PROVED HERE (read before citing).
    (a) That the exchange of two identical particles carries the number of the full turn. It is the field `exchange`
        of `Premises`. In relativistic field theory it is the spin-statistics theorem, cited and not formalised.
    (b) That the law of a half-spin is of first order. It is the field `first_order` of `Premises`.
    (c) That in three dimensions of space and above the exchanges of n particles form the group of permutations,
        and in two dimensions a larger group. It is topology, cited. Part VI proves what follows for permutations.
    (d) That the spin of the law is one half of the generators of Part V, so that the spin term reads as a moment
        of two. The identity `the_spin_term` is proved; the reading of its coefficient is the classical one.
RISK. Part III is over a field in which two is not zero. Part IV needs a square root of minus one. No magnitude
  is derived: every mass is admitted.
NON-NEGOTIABLE. No axiom is declared, no sorry. No headline theorem closes over a structure that carries its
  conclusion. The kernel line of every theorem the paper names is printed at the end.
-/
import Mathlib.Data.Matrix.Notation
import Mathlib.Data.Matrix.Mul
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.LinearIndependent.Lemmas
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.LinearAlgebra.FreeModule.Finite.Matrix
import Mathlib.GroupTheory.Perm.Sign
import Mathlib.Data.Complex.Basic
import Mathlib.Algebra.Algebra.Basic
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NoncommRing
import Mathlib.Tactic.Module
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith

namespace SPHYS.Matter

/-! ## Part I. A law of first order and the mass shell -/

section Clifford
variable {k : Type*} [CommRing k] {R : Type*} [Ring R] [Algebra k R] {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- The operator of first order with coefficients γ, at the momentum p. -/
def slash (γ : ι → R) (p : ι → k) : R := ∑ μ, p μ • γ μ
/-- The mass shell: the quadratic form with signs η, at the momentum p. -/
def shell (η p : ι → k) : k := ∑ μ, η μ * (p μ * p μ)
/-- The Clifford relations: each coefficient squares to its sign and two different ones anticommute. -/
def Clifford (γ : ι → R) (η : ι → k) : Prop :=
  (∀ μ, γ μ * γ μ = algebraMap k R (η μ)) ∧ ∀ μ ν, μ ≠ ν → γ μ * γ ν + γ ν * γ μ = 0

theorem slash_unit (γ : ι → R) (μ : ι) : slash γ (fun κ => if κ = μ then (1 : k) else 0) = γ μ := by
  unfold slash
  simp [ite_smul, Finset.sum_ite_eq']

theorem shell_unit (η : ι → k) (μ : ι) : shell η (fun κ => if κ = μ then (1 : k) else 0) = η μ := by
  unfold shell
  simp [Finset.sum_ite_eq']

theorem slash_pair (γ : ι → R) (μ ν : ι) :
    slash γ (fun κ => (if κ = μ then (1 : k) else 0) + (if κ = ν then 1 else 0)) = γ μ + γ ν := by
  unfold slash
  simp [add_smul, ite_smul, Finset.sum_add_distrib, Finset.sum_ite_eq']

theorem shell_pair (η : ι → k) (μ ν : ι) (h : μ ≠ ν) :
    shell η (fun κ => (if κ = μ then (1 : k) else 0) + (if κ = ν then 1 else 0)) = η μ + η ν := by
  unfold shell
  have e : ∀ κ, η κ * (((if κ = μ then (1 : k) else 0) + (if κ = ν then 1 else 0))
        * ((if κ = μ then (1 : k) else 0) + (if κ = ν then 1 else 0)))
      = (if κ = μ then η κ else 0) + (if κ = ν then η κ else 0) := by
    intro κ
    by_cases h1 : κ = μ <;> by_cases h2 : κ = ν
    · exact absurd (h1.symm.trans h2) h
    · subst h1; simp [h2]
    · subst h2; simp [h1]
    · simp [h1, h2]
  simp only [e, Finset.sum_add_distrib, Finset.sum_ite_eq', Finset.mem_univ, if_true]

/-- THE SQUARE FORCES THE RELATIONS. If the operator of first order squares to the mass shell at every momentum,
its coefficients obey the Clifford relations. Nothing is divided. -/
theorem square_forces_the_relations (γ : ι → R) (η : ι → k)
    (h : ∀ p : ι → k, slash γ p * slash γ p = algebraMap k R (shell η p)) : Clifford γ η := by
  have sq : ∀ μ, γ μ * γ μ = algebraMap k R (η μ) := by
    intro μ
    have e := h (fun κ => if κ = μ then (1 : k) else 0)
    rwa [slash_unit, shell_unit] at e
  refine ⟨sq, ?_⟩
  intro μ ν hne
  have e := h (fun κ => (if κ = μ then (1 : k) else 0) + (if κ = ν then 1 else 0))
  rw [slash_pair, shell_pair η μ ν hne, map_add, ← sq μ, ← sq ν] at e
  have x : (γ μ + γ ν) * (γ μ + γ ν) = γ μ * γ μ + γ ν * γ ν + (γ μ * γ ν + γ ν * γ μ) := by noncomm_ring
  rw [x] at e
  exact add_eq_left.mp e

/-- THE RELATIONS GIVE THE SQUARE, in a ring where x + x = 0 gives x = 0. -/
theorem relations_give_the_square (h2 : ∀ x : R, x + x = 0 → x = 0) (γ : ι → R) (η : ι → k)
    (hc : Clifford γ η) (p : ι → k) : slash γ p * slash γ p = algebraMap k R (shell η p) := by
  have e : slash γ p * slash γ p = ∑ μ, ∑ ν, (p μ * p ν) • (γ μ * γ ν) := by
    unfold slash
    rw [Finset.sum_mul]
    apply Finset.sum_congr rfl; intro μ _
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl; intro ν _
    rw [smul_mul_smul_comm]
  have d : ∀ μ ν, (p μ * p ν) • (γ μ * γ ν) + (p ν * p μ) • (γ ν * γ μ)
      = if μ = ν then (p μ * p μ) • (algebraMap k R (η μ) + algebraMap k R (η μ)) else 0 := by
    intro μ ν
    split_ifs with hh
    · subst hh; rw [hc.1 μ, smul_add]
    · rw [mul_comm (p ν) (p μ), ← smul_add, hc.2 μ ν hh, smul_zero]
  have t : algebraMap k R (shell η p) = ∑ μ, (p μ * p μ) • algebraMap k R (η μ) := by
    unfold shell
    rw [map_sum]
    apply Finset.sum_congr rfl; intro μ _
    rw [map_mul, Algebra.smul_def]
    exact Algebra.commutes (η μ) _
  have e' : slash γ p * slash γ p = ∑ μ, ∑ ν, (p ν * p μ) • (γ ν * γ μ) := by rw [e, Finset.sum_comm]
  have s : slash γ p * slash γ p + slash γ p * slash γ p
      = algebraMap k R (shell η p) + algebraMap k R (shell η p) := by
    have c := congrArg₂ (· + ·) e e'
    simp only at c
    rw [c, t, ← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl; intro μ _
    rw [← Finset.sum_add_distrib]
    simp only [d, Finset.sum_ite_eq, Finset.mem_univ, if_true, smul_add]
  have z := h2 (slash γ p * slash γ p - algebraMap k R (shell η p)) (by
    have : slash γ p * slash γ p - algebraMap k R (shell η p)
        + (slash γ p * slash γ p - algebraMap k R (shell η p))
        = (slash γ p * slash γ p + slash γ p * slash γ p)
          - (algebraMap k R (shell η p) + algebraMap k R (shell η p)) := by abel
    rw [this, s, sub_self])
  exact sub_eq_zero.mp z

/-- THE LAW FACTORISES. The operator of first order less the mass, times the operator plus the mass, is the square
less the square of the mass. On the mass shell the law of second order is the product of two laws of first order,
for every mass. -/
theorem the_law_factorises (D : R) (m : k) :
    (D - algebraMap k R m) * (D + algebraMap k R m) = D * D - algebraMap k R (m * m) := by
  have c : algebraMap k R m * D = D * algebraMap k R m := Algebra.commutes m D
  rw [map_mul]
  have x : (D - algebraMap k R m) * (D + algebraMap k R m)
      = D * D + (D * algebraMap k R m - algebraMap k R m * D) - algebraMap k R m * algebraMap k R m := by
    noncomm_ring
  rw [x, c, sub_self, add_zero]

end Clifford

/-! ## Part II. No numbers take the square root -/

/-- NO NUMBERS TAKE THE SQUARE ROOT. In a commutative domain where two is not zero, two elements whose squares are
not zero cannot anticommute. With two directions or more, the coefficients of the law cannot commute. -/
theorem no_numbers_take_the_square_root {F : Type*} [CommRing F] [IsDomain F] (a b : F) (h2 : (2 : F) ≠ 0)
    (ha : a * a ≠ 0) (hb : b * b ≠ 0) : a * b + b * a ≠ 0 := by
  intro h
  have e : 2 * (a * b) = 0 := by linear_combination h
  rcases mul_eq_zero.mp ((mul_eq_zero.mp e).resolve_left h2) with h0 | h0
  · exact ha (by rw [h0, zero_mul])
  · exact hb (by rw [h0, zero_mul])

/-! ## Part III. The least size of the coefficients -/

section Size
variable {K : Type*} [Field K] {n : ℕ}
open Matrix

/-- A matrix that anticommutes with one whose square is a scalar that is not zero has trace zero. -/
theorem trace_zero_of_anticommute (h2 : (2 : K) ≠ 0) (A B : Matrix (Fin n) (Fin n) K) (β : K) (hβ : β ≠ 0)
    (hB : B * B = β • (1 : Matrix (Fin n) (Fin n) K)) (h : A * B + B * A = 0) : A.trace = 0 := by
  have e1 : (A * B * B).trace = β * A.trace := by
    rw [mul_assoc, hB, mul_smul_comm, mul_one, trace_smul, smul_eq_mul]
  have e2 : (A * B * B).trace = -(β * A.trace) := by
    have hBA : B * A = -(A * B) := eq_neg_of_add_eq_zero_right h
    rw [trace_mul_comm (A * B) B, ← mul_assoc, hBA, neg_mul, trace_neg, e1]
  have e3 : 2 * (β * A.trace) = 0 := by linear_combination e2 - e1
  exact (mul_eq_zero.mp ((mul_eq_zero.mp e3).resolve_left h2)).resolve_left hβ

/-- The product of two matrices that anticommute has trace zero. -/
theorem trace_mul_zero_of_anticommute (h2 : (2 : K) ≠ 0) (A B : Matrix (Fin n) (Fin n) K)
    (h : A * B + B * A = 0) : (A * B).trace = 0 := by
  have e : (A * B).trace + (B * A).trace = 0 := by rw [← trace_add, h, trace_zero]
  rw [trace_mul_comm B A] at e
  have e3 : 2 * (A * B).trace = 0 := by linear_combination e
  exact (mul_eq_zero.mp e3).resolve_left h2

/-- NO TWO IN ODD SIZE. Two matrices of odd size whose squares are scalars that are not zero cannot anticommute. -/
theorem no_two_in_odd_size (h2 : (2 : K) ≠ 0) (hn : Odd n) (A B : Matrix (Fin n) (Fin n) K) (α β : K)
    (hα : α ≠ 0) (hβ : β ≠ 0) (hA : A * A = α • (1 : Matrix (Fin n) (Fin n) K))
    (hB : B * B = β • (1 : Matrix (Fin n) (Fin n) K)) : A * B + B * A ≠ 0 := by
  intro h
  have hAB : A * B = -(B * A) := eq_neg_of_add_eq_zero_left h
  have d := congrArg det hAB
  rw [det_neg, det_mul, det_mul, Fintype.card_fin, hn.neg_one_pow] at d
  have e : 2 * (A.det * B.det) = 0 := by linear_combination d
  have dA : A.det * A.det = α ^ n := by
    rw [← det_mul, hA, det_smul, det_one, mul_one, Fintype.card_fin]
  have dB : B.det * B.det = β ^ n := by
    rw [← det_mul, hB, det_smul, det_one, mul_one, Fintype.card_fin]
  rcases mul_eq_zero.mp ((mul_eq_zero.mp e).resolve_left h2) with h0 | h0
  · rw [h0, zero_mul] at dA; exact pow_ne_zero n hα dA.symm
  · rw [h0, zero_mul] at dB; exact pow_ne_zero n hβ dB.symm

/-- NO FOUR IN SIZE TWO. Four matrices of size two whose squares are scalars that are not zero cannot anticommute
in pairs: with the unit matrix they would be five matrices orthogonal for the trace form, in a space of
dimension four. -/
theorem no_four_in_size_two (h2 : (2 : K) ≠ 0) (γ : Fin 4 → Matrix (Fin 2) (Fin 2) K) (η : Fin 4 → K)
    (hη : ∀ μ, η μ ≠ 0) (hsq : ∀ μ, γ μ * γ μ = η μ • (1 : Matrix (Fin 2) (Fin 2) K))
    (hac : ∀ μ ν, μ ≠ ν → γ μ * γ ν + γ ν * γ μ = 0) : False := by
  let v : Option (Fin 4) → Matrix (Fin 2) (Fin 2) K := fun o => o.elim 1 γ
  have tr0 : ∀ μ, (γ μ).trace = 0 := by
    intro μ
    obtain ⟨ν, hν⟩ : ∃ ν : Fin 4, μ ≠ ν := by
      by_cases h0 : μ = 0
      · exact ⟨1, by rw [h0]; decide⟩
      · exact ⟨0, h0⟩
    exact trace_zero_of_anticommute h2 (γ μ) (γ ν) (η ν) (hη ν) (hsq ν) (hac μ ν hν)
  have ortho : ∀ i j, i ≠ j → (v i * v j).trace = 0 := by
    intro i j hij
    cases i with
    | none =>
      cases j with
      | none => exact absurd rfl hij
      | some ν => simpa [v] using tr0 ν
    | some μ =>
      cases j with
      | none => simpa [v] using tr0 μ
      | some ν =>
        have hne : μ ≠ ν := fun hh => hij (by rw [hh])
        simpa [v] using trace_mul_zero_of_anticommute h2 (γ μ) (γ ν) (hac μ ν hne)
  have nonis : ∀ i, (v i * v i).trace ≠ 0 := by
    intro i hi
    cases i with
    | none =>
      simp [v, trace_one] at hi
      exact h2 (by exact_mod_cast hi)
    | some μ =>
      simp only [v, Option.elim] at hi
      rw [hsq μ, trace_smul, trace_one, Fintype.card_fin, smul_eq_mul] at hi
      rcases mul_eq_zero.mp hi with h0 | h0
      · exact hη μ h0
      · exact h2 (by exact_mod_cast h0)
  have li : LinearIndependent K v := by
    rw [Fintype.linearIndependent_iff]
    intro g hg j
    have e := congrArg (fun X => (v j * X).trace) hg
    simp only [Finset.mul_sum, mul_smul_comm, trace_sum, trace_smul, smul_eq_mul, mul_zero, trace_zero] at e
    rw [Finset.sum_eq_single j (fun i _ hi => by rw [ortho j i (Ne.symm hi), mul_zero])
      (fun hj => absurd (Finset.mem_univ j) hj)] at e
    exact (mul_eq_zero.mp e).resolve_right (nonis j)
  have c := li.fintype_card_le_finrank
  rw [Module.finrank_matrix, Module.finrank_self] at c
  simp at c

/-- FOUR IS THE LEAST. Four matrices of size one, two or three whose squares are scalars that are not zero cannot
anticommute in pairs. -/
theorem four_is_the_least (h2 : (2 : K) ≠ 0) (hpos : 0 < n) (hn : n < 4) (γ : Fin 4 → Matrix (Fin n) (Fin n) K)
    (η : Fin 4 → K) (hη : ∀ μ, η μ ≠ 0) (hsq : ∀ μ, γ μ * γ μ = η μ • (1 : Matrix (Fin n) (Fin n) K))
    (hac : ∀ μ ν, μ ≠ ν → γ μ * γ ν + γ ν * γ μ = 0) : False := by
  have hcase : n = 1 ∨ n = 2 ∨ n = 3 := by omega
  rcases hcase with rfl | rfl | rfl
  · exact no_two_in_odd_size h2 (by decide) (γ 0) (γ 1) (η 0) (η 1) (hη 0) (hη 1) (hsq 0) (hsq 1)
      (hac 0 1 (by decide))
  · exact no_four_in_size_two h2 γ η hη hsq hac
  · exact no_two_in_odd_size h2 (by decide) (γ 0) (γ 1) (η 0) (η 1) (hη 0) (hη 1) (hsq 0) (hsq 1)
      (hac 0 1 (by decide))

end Size
/-! ## Part IV. Four coefficients of size four
    Over any commutative ring with an element whose square is minus one. The signs are plus for the energy and
    minus for the three directions of space. -/

section Model
variable {C : Type} [CommRing C]
open Matrix

/-- The signs of the mass shell: energy squared less the three squares of the momentum. -/
def eta : Fin 4 → C := ![1, -1, -1, -1]

def g0 : Matrix (Fin 4) (Fin 4) C := !![1,0,0,0; 0,1,0,0; 0,0,-1,0; 0,0,0,-1]
def g1 : Matrix (Fin 4) (Fin 4) C := !![0,0,0,1; 0,0,1,0; 0,-1,0,0; -1,0,0,0]
def g2 (i : C) : Matrix (Fin 4) (Fin 4) C := !![0,0,0,-i; 0,0,i,0; 0,i,0,0; -i,0,0,0]
def g3 : Matrix (Fin 4) (Fin 4) C := !![0,0,1,0; 0,0,0,-1; -1,0,0,0; 0,1,0,0]
/-- The four coefficients of the model. -/
def gam (i : C) : Fin 4 → Matrix (Fin 4) (Fin 4) C := ![g0, g1, g2 i, g3]

set_option maxHeartbeats 2000000 in
theorem model_squares (i : C) (hi : i * i = -1) :
    (g0 : Matrix (Fin 4) (Fin 4) C) * g0 = 1 ∧ (g1 : Matrix (Fin 4) (Fin 4) C) * g1 = -1
      ∧ g2 i * g2 i = -1 ∧ (g3 : Matrix (Fin 4) (Fin 4) C) * g3 = -1 := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> ext a b <;> fin_cases a <;> fin_cases b <;>
    simp [g0, g1, g2, g3, Matrix.mul_apply, Fin.sum_univ_four, hi]

set_option maxHeartbeats 4000000 in
theorem model_anticommute (i : C) :
    (g0 : Matrix (Fin 4) (Fin 4) C) * g1 + g1 * g0 = 0 ∧ g0 * g2 i + g2 i * g0 = 0
      ∧ (g0 : Matrix (Fin 4) (Fin 4) C) * g3 + g3 * g0 = 0 ∧ g1 * g2 i + g2 i * g1 = 0
      ∧ (g1 : Matrix (Fin 4) (Fin 4) C) * g3 + g3 * g1 = 0 ∧ g2 i * g3 + g3 * g2 i = 0 := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩ <;> ext a b <;> fin_cases a <;> fin_cases b <;>
    simp [g0, g1, g2, g3, Matrix.mul_apply, Fin.sum_univ_four]

/-- THE MODEL OBEYS EVERY RELATION. -/
theorem model_clifford (i : C) (hi : i * i = -1) : Clifford (k := C) (gam i) eta := by
  obtain ⟨s0, s1, s2, s3⟩ := model_squares i hi
  obtain ⟨a01, a02, a03, a12, a13, a23⟩ := model_anticommute i
  have am : ∀ r : C, algebraMap C (Matrix (Fin 4) (Fin 4) C) r = r • (1 : Matrix (Fin 4) (Fin 4) C) :=
    fun r => Algebra.algebraMap_eq_smul_one r
  constructor
  · intro μ
    fin_cases μ
    · show (g0 : Matrix (Fin 4) (Fin 4) C) * g0 = algebraMap C _ (1 : C); rw [am, one_smul]; exact s0
    · show (g1 : Matrix (Fin 4) (Fin 4) C) * g1 = algebraMap C _ (-1 : C); rw [am, neg_one_smul]; exact s1
    · show g2 i * g2 i = algebraMap C _ (-1 : C); rw [am, neg_one_smul]; exact s2
    · show (g3 : Matrix (Fin 4) (Fin 4) C) * g3 = algebraMap C _ (-1 : C); rw [am, neg_one_smul]; exact s3
  · intro μ ν h
    fin_cases μ <;> fin_cases ν
    · exact absurd rfl h
    · show (g0 : Matrix (Fin 4) (Fin 4) C) * g1 + g1 * g0 = 0; exact a01
    · show (g0 : Matrix (Fin 4) (Fin 4) C) * g2 i + g2 i * g0 = 0; exact a02
    · show (g0 : Matrix (Fin 4) (Fin 4) C) * g3 + g3 * g0 = 0; exact a03
    · show (g1 : Matrix (Fin 4) (Fin 4) C) * g0 + g0 * g1 = 0; rw [add_comm]; exact a01
    · exact absurd rfl h
    · show (g1 : Matrix (Fin 4) (Fin 4) C) * g2 i + g2 i * g1 = 0; exact a12
    · show (g1 : Matrix (Fin 4) (Fin 4) C) * g3 + g3 * g1 = 0; exact a13
    · show g2 i * (g0 : Matrix (Fin 4) (Fin 4) C) + g0 * g2 i = 0; rw [add_comm]; exact a02
    · show g2 i * (g1 : Matrix (Fin 4) (Fin 4) C) + g1 * g2 i = 0; rw [add_comm]; exact a12
    · exact absurd rfl h
    · show g2 i * (g3 : Matrix (Fin 4) (Fin 4) C) + g3 * g2 i = 0; exact a23
    · show (g3 : Matrix (Fin 4) (Fin 4) C) * g0 + g0 * g3 = 0; rw [add_comm]; exact a03
    · show (g3 : Matrix (Fin 4) (Fin 4) C) * g1 + g1 * g3 = 0; rw [add_comm]; exact a13
    · show (g3 : Matrix (Fin 4) (Fin 4) C) * g2 i + g2 i * g3 = 0; rw [add_comm]; exact a23
    · exact absurd rfl h

/-- TWO SIGNS OF THE ENERGY, TWICE EACH. The coefficient of the energy is diagonal, with plus one on two
components and minus one on two. -/
theorem model_energy : (g0 : Matrix (Fin 4) (Fin 4) C) = Matrix.diagonal ![1, 1, -1, -1] := by
  ext a b; fin_cases a <;> fin_cases b <;> simp [g0, Matrix.diagonal]

/-- THE HALF TURN ACTS WITHIN EACH SIGN OF THE ENERGY: in the model the rotor of the first two directions of space
commutes with the coefficient of the energy. -/
theorem model_spin_commutes_with_energy (i : C) :
    (g0 : Matrix (Fin 4) (Fin 4) C) * (g1 * g2 i) = (g1 * g2 i) * g0 := by
  ext a b; fin_cases a <;> fin_cases b <;> simp [g0, g1, g2, Matrix.mul_apply, Fin.sum_univ_four]

end Model

/-! ## Part V. Three directions that anticommute -/

section Spin
variable {k : Type*} [CommRing k] {R : Type*} [Ring R] [Algebra k R]
variable (e1 e2 e3 : R) (h11 : e1 * e1 = 1) (h22 : e2 * e2 = 1) (h33 : e3 * e3 = 1)
variable (h21 : e2 * e1 = -(e1 * e2)) (h32 : e3 * e2 = -(e2 * e3)) (h13 : e1 * e3 = -(e3 * e1))
include h11 h22 h33 h21 h32 h13

/-- THE PRODUCT OF TWO DIRECTIONS. It is their dot product, plus their cross product carried by the products of
pairs of the three generators. -/
theorem product_of_two_directions (a1 a2 a3 b1 b2 b3 : k) :
    (a1 • e1 + a2 • e2 + a3 • e3) * (b1 • e1 + b2 • e2 + b3 • e3)
      = (a1 * b1 + a2 * b2 + a3 * b3) • (1 : R) + (a2 * b3 - a3 * b2) • (e2 * e3)
        + (a3 * b1 - a1 * b3) • (e3 * e1) + (a1 * b2 - a2 * b1) • (e1 * e2) := by
  simp only [add_mul, mul_add, smul_mul_smul_comm, h11, h22, h33, h21, h32, h13]
  module

omit [Algebra k R] in
/-- THE SPIN TERM. Let three momenta commute with the generators and not with one another. The square of the
operator is the sum of the squares of the momenta plus the commutators of the momenta, each carried by a product
of two generators. -/
theorem the_spin_term (p1 p2 p3 : R)
    (c : ∀ e ∈ [e1, e2, e3], ∀ p ∈ [p1, p2, p3], p * e = e * p) :
    (e1 * p1 + e2 * p2 + e3 * p3) * (e1 * p1 + e2 * p2 + e3 * p3)
      = p1 * p1 + p2 * p2 + p3 * p3 + e1 * e2 * (p1 * p2 - p2 * p1) + e2 * e3 * (p2 * p3 - p3 * p2)
        + e3 * e1 * (p3 * p1 - p1 * p3) := by
  have sw : ∀ x p y q : R, p * y = y * p → x * p * (y * q) = x * y * (p * q) := by
    intro x p y q hh
    rw [mul_assoc, ← mul_assoc p, hh, mul_assoc, ← mul_assoc]
  have cc : ∀ e p, e ∈ [e1, e2, e3] → p ∈ [p1, p2, p3] → p * e = e * p := fun e p he hp => c e he p hp
  simp only [add_mul, mul_add]
  rw [sw e1 p1 e1 p1 (cc _ _ (by simp) (by simp)), sw e1 p1 e2 p2 (cc _ _ (by simp) (by simp)),
    sw e1 p1 e3 p3 (cc _ _ (by simp) (by simp)), sw e2 p2 e1 p1 (cc _ _ (by simp) (by simp)),
    sw e2 p2 e2 p2 (cc _ _ (by simp) (by simp)), sw e2 p2 e3 p3 (cc _ _ (by simp) (by simp)),
    sw e3 p3 e1 p1 (cc _ _ (by simp) (by simp)), sw e3 p3 e2 p2 (cc _ _ (by simp) (by simp)),
    sw e3 p3 e3 p3 (cc _ _ (by simp) (by simp)), h11, h22, h33, h21, h32, h13]
  noncomm_ring

omit [Algebra k R] h33 in
/-- THE FULL TURN. Let r = e1 e2. It is the rotor of a half turn in the plane of e1 and e2: it reverses those two
directions and keeps the third. Its square, the full turn, is minus one. And the full turn returns every element
to itself. -/
theorem full_turn :
    (e1 * e2) * (e1 * e2) = -1
      ∧ (e1 * e2) * e1 * -(e1 * e2) = -e1 ∧ (e1 * e2) * e2 * -(e1 * e2) = -e2
      ∧ (e1 * e2) * e3 * -(e1 * e2) = e3
      ∧ ∀ x : R, ((e1 * e2) * (e1 * e2)) * x * ((e1 * e2) * (e1 * e2)) = x := by
  have rr : (e1 * e2) * (e1 * e2) = -1 := by
    calc (e1 * e2) * (e1 * e2) = e1 * (e2 * e1) * e2 := by noncomm_ring
      _ = -((e1 * e1) * (e2 * e2)) := by rw [h21]; noncomm_ring
      _ = -1 := by rw [h11, h22, mul_one]
  have t1 : (e1 * e2) * e1 = -e2 := by
    calc (e1 * e2) * e1 = e1 * (e2 * e1) := by noncomm_ring
      _ = -((e1 * e1) * e2) := by rw [h21]; noncomm_ring
      _ = -e2 := by rw [h11, one_mul]
  have t2 : (e1 * e2) * e2 = e1 := by rw [mul_assoc, h22, mul_one]
  have h31 : e3 * e1 = -(e1 * e3) := by rw [h13, neg_neg]
  have t3 : (e1 * e2) * e3 = e3 * (e1 * e2) := by
    calc (e1 * e2) * e3 = e1 * (e2 * e3) := by noncomm_ring
      _ = -(e1 * (e3 * e2)) := by rw [h32]; noncomm_ring
      _ = -((e1 * e3) * e2) := by noncomm_ring
      _ = (e3 * e1) * e2 := by rw [h13]; noncomm_ring
      _ = e3 * (e1 * e2) := by noncomm_ring
  refine ⟨rr, ?_, ?_, ?_, ?_⟩
  · rw [t1]
    calc -e2 * -(e1 * e2) = (e2 * e1) * e2 := by noncomm_ring
      _ = -(e1 * (e2 * e2)) := by rw [h21]; noncomm_ring
      _ = -e1 := by rw [h22, mul_one]
  · rw [t2]
    calc e1 * -(e1 * e2) = -((e1 * e1) * e2) := by noncomm_ring
      _ = -e2 := by rw [h11, one_mul]
  · rw [t3]
    calc e3 * (e1 * e2) * -(e1 * e2) = -(e3 * ((e1 * e2) * (e1 * e2))) := by noncomm_ring
      _ = e3 := by rw [rr]; noncomm_ring
  · intro x; rw [rr]; noncomm_ring

end Spin

/-- THE ROTOR OF THE LAW. Let a and b anticommute and each square to minus one, as two coefficients of space of the
law do. Their product squares to minus one, and it reverses a and b: it is the rotor of a half turn in their
plane, and its square, the full turn, is minus one. -/
theorem rotor_of_the_law {R : Type*} [Ring R] (a b : R) (ha : a * a = -1) (hb : b * b = -1)
    (hba : b * a = -(a * b)) :
    (a * b) * (a * b) = -1 ∧ (a * b) * a * -(a * b) = -a ∧ (a * b) * b * -(a * b) = -b := by
  have rr : (a * b) * (a * b) = -1 := by
    calc (a * b) * (a * b) = a * (b * a) * b := by noncomm_ring
      _ = -((a * a) * (b * b)) := by rw [hba]; noncomm_ring
      _ = -1 := by rw [ha, hb]; noncomm_ring
  have t1 : (a * b) * a = b := by
    calc (a * b) * a = a * (b * a) := by noncomm_ring
      _ = -((a * a) * b) := by rw [hba]; noncomm_ring
      _ = b := by rw [ha]; noncomm_ring
  have t2 : (a * b) * b = -a := by rw [mul_assoc, hb]; noncomm_ring
  refine ⟨rr, ?_, ?_⟩
  · rw [t1]
    calc b * -(a * b) = -((b * a) * b) := by noncomm_ring
      _ = a * (b * b) := by rw [hba]; noncomm_ring
      _ = -a := by rw [hb]; noncomm_ring
  · rw [t2]
    calc -a * -(a * b) = (a * a) * b := by noncomm_ring
      _ = -b := by rw [ha]; noncomm_ring

/-! ## Part VI. Exchange and statistics -/

/-- EXCLUSION. An amplitude that changes sign when its two arguments are exchanged vanishes where they are equal. -/
theorem exclusion {S V : Type*} [AddCommGroup V] (h2 : ∀ v : V, v + v = 0 → v = 0) (ψ : S → S → V)
    (h : ∀ x y, ψ x y = -ψ y x) (x : S) : ψ x x = 0 :=
  h2 _ (by have e := h x x; nth_rewrite 1 [e]; exact neg_add_cancel _)

/-- A WHOLE SPIN EXCLUDES NOTHING. An amplitude that keeps its sign under exchange need not vanish where its
arguments are equal. -/
theorem a_whole_spin_excludes_nothing : ∃ ψ : Unit → Unit → ℤ, (∀ x y, ψ x y = ψ y x) ∧ ψ () () ≠ 0 :=
  ⟨fun _ _ => 1, fun _ _ => rfl, one_ne_zero⟩

/-- A SIGN WHOSE SQUARE IS ONE IS PLUS OR MINUS ONE. -/
theorem a_sign_is_plus_or_minus_one {F : Type*} [CommRing F] [IsDomain F] (c : F) (h : c * c = 1) :
    c = 1 ∨ c = -1 := by
  have e : (c - 1) * (c + 1) = 0 := by linear_combination h
  rcases mul_eq_zero.mp e with h0 | h0
  · exact Or.inl (sub_eq_zero.mp h0)
  · exact Or.inr (eq_neg_of_add_eq_zero_left h0)

open Equiv in
/-- TWO STATISTICS AND NO THIRD. Let the permutations of finitely many things act on amplitudes by a number: a
map f from permutations to a commutative domain that sends products to products and the identity to one. Then
either f is one on every permutation, or f is the sign of the permutation. -/
theorem two_statistics_and_no_third {α : Type*} [Fintype α] [DecidableEq α] {F : Type*} [CommRing F] [IsDomain F]
    (f : Perm α →* F) : (∀ σ, f σ = 1) ∨ (∀ σ, f σ = ((Perm.sign σ : ℤˣ) : ℤ)) := by
  by_cases hex : ∃ a b : α, a ≠ b
  · obtain ⟨a, b, hab⟩ := hex
    have hc : f (swap a b) * f (swap a b) = 1 := by rw [← map_mul, swap_mul_self, map_one]
    have all : ∀ x y : α, x ≠ y → f (swap x y) = f (swap a b) := by
      intro x y hxy
      obtain ⟨u, hu⟩ := isConj_iff.mp (Perm.isConj_swap hxy hab)
      have e : f u * f (swap x y) * f u⁻¹ = f (swap a b) := by rw [← map_mul, ← map_mul, hu]
      have ui : f u * f u⁻¹ = 1 := by rw [← map_mul, mul_inv_cancel, map_one]
      calc f (swap x y) = f (swap x y) * (f u * f u⁻¹) := by rw [ui, mul_one]
        _ = f u * f (swap x y) * f u⁻¹ := by ring
        _ = f (swap a b) := e
    rcases a_sign_is_plus_or_minus_one _ hc with h1 | h1
    · left
      intro σ
      induction σ using Perm.swap_induction_on with
      | one => exact map_one f
      | swap_mul τ x y hxy ih => rw [map_mul, all x y hxy, h1, ih, mul_one]
    · right
      intro σ
      induction σ using Perm.swap_induction_on with
      | one => simp
      | swap_mul τ x y hxy ih =>
        rw [map_mul, all x y hxy, h1, ih, Perm.sign_mul, Perm.sign_swap hxy]
        simp
  · left
    intro σ
    have hs : σ = 1 := by
      ext x
      by_contra hne
      exact hex ⟨σ x, x, hne⟩
    rw [hs, map_one]

/-! ## Part VII. The premises, in one structure, and the theorems -/

/-- THE PREMISES OF THE PAPER. They are physics and are not proved.
    P1, least order. The law of a half-spin is of first order: an operator with matrix coefficients on n
        components, n at least one, whose square is the mass shell at every momentum. This is `first_order`.
    P2, the exchange is the turn. Two identical particles of the law have an amplitude on pairs of states, and
        exchanging the two multiplies it by the number by which the full turn acts on the components of the law,
        whatever that number is. This is `exchange`. The number is not entered: `the_forced_law_is_a_half_spin`
        proves it is minus one. -/
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

variable {K : Type} [Field K]

/-- THE DIRAC LAW IS FORCED. On the premises the coefficients obey the Clifford relations. -/
theorem dirac_forced (P : Premises K) : Clifford P.γ (eta : Fin 4 → K) :=
  square_forces_the_relations P.γ eta P.first_order

/-- FOUR COMPONENTS AT THE LEAST. On the premises, where two is not zero, the law has at least four components. -/
theorem four_components (P : Premises K) (h2 : (2 : K) ≠ 0) : 4 ≤ P.n := by
  by_contra hlt
  have hc := dirac_forced P
  have am : ∀ r : K, algebraMap K (Matrix (Fin P.n) (Fin P.n) K) r = r • (1 : Matrix (Fin P.n) (Fin P.n) K) :=
    fun r => Algebra.algebraMap_eq_smul_one r
  refine four_is_the_least h2 P.pos (by omega) P.γ eta ?_ (fun μ => by rw [hc.1 μ, am]) hc.2
  intro μ
  fin_cases μ <;> simp [eta]

/-- THE FORCED LAW IS A HALF-SPIN. On the premises the product of the first two coefficients of space is the rotor
of a half turn, and the full turn is minus one on the components of the law. -/
theorem the_forced_law_is_a_half_spin (P : Premises K) :
    (P.γ 1 * P.γ 2) * (P.γ 1 * P.γ 2) = -1 ∧ (P.γ 1 * P.γ 2) * P.γ 1 * -(P.γ 1 * P.γ 2) = -P.γ 1
      ∧ (P.γ 1 * P.γ 2) * P.γ 2 * -(P.γ 1 * P.γ 2) = -P.γ 2 := by
  have hc := dirac_forced P
  have h1 : P.γ 1 * P.γ 1 = -1 := by rw [hc.1 1]; simp [eta]
  have h2 : P.γ 2 * P.γ 2 = -1 := by rw [hc.1 2]; simp [eta]
  exact rotor_of_the_law (P.γ 1) (P.γ 2) h1 h2 (eq_neg_of_add_eq_zero_left (hc.2 2 1 (by decide)))

/-- THE TWO SIGNS OF THE ENERGY BALANCE. On the premises, where two is not zero, the coefficient of the energy has
trace zero. Its square is one, so plus one and minus one occur equally among its values. -/
theorem the_two_signs_of_the_energy_balance (P : Premises K) (h2 : (2 : K) ≠ 0) :
    (P.γ 0).trace = 0 ∧ P.γ 0 * P.γ 0 = 1 := by
  have hc := dirac_forced P
  have h1 : P.γ 1 * P.γ 1 = (-1 : K) • (1 : Matrix (Fin P.n) (Fin P.n) K) := by
    rw [hc.1 1, Algebra.algebraMap_eq_smul_one]; simp [eta]
  refine ⟨trace_zero_of_anticommute h2 (P.γ 0) (P.γ 1) (-1) (by norm_num) h1 (hc.2 0 1 (by decide)), ?_⟩
  rw [hc.1 0]; simp [eta]

/-- EXCLUSION IS FORCED BY THE FULL TURN. On the premises, where two is not zero, the amplitude of two identical
particles of the law vanishes wherever the two share a state: the exchange carries the number of the full turn,
and that number is minus one. -/
theorem exclusion_forced (P : Premises K) (h2 : (2 : K) ≠ 0) (x : P.State) : P.amp x x = 0 := by
  have ht : (P.γ 1 * P.γ 2) * (P.γ 1 * P.γ 2) = (-1 : K) • (1 : Matrix (Fin P.n) (Fin P.n) K) := by
    rw [(the_forced_law_is_a_half_spin P).1, neg_one_smul]
  have hx := P.exchange (-1) ht
  exact exclusion (fun v hv => by
    have e : 2 * v = 0 := by linear_combination hv
    exact (mul_eq_zero.mp e).resolve_left h2) P.amp (fun a b => by rw [hx a b, neg_one_mul]) x

/-- THE PREMISES ARE MET: over any field with a square root of minus one in which two is not zero, by the model of Part IV and an amplitude
on two states that is not zero. -/
def diracPremises (i : K) (hi : i * i = -1) (h2 : (2 : K) ≠ 0) : Premises K where
  n := 4
  pos := by norm_num
  γ := gam i
  first_order := fun p =>
    relations_give_the_square (fun x hx => by
      have e : (2 : K) • x = 0 := by rw [two_smul]; exact hx
      exact (smul_eq_zero.mp e).resolve_left h2) (gam i) eta (model_clifford i hi) p
  State := Bool
  amp := fun x y => if x = y then 0 else if x then 1 else -1
  exchange := fun c hc x y => by
    have hcl := model_clifford i hi
    have h1 : gam i 1 * gam i 1 = -1 := by rw [hcl.1 1]; simp [eta]
    have h2' : gam i 2 * gam i 2 = -1 := by rw [hcl.1 2]; simp [eta]
    have rr := (rotor_of_the_law (gam i 1) (gam i 2) h1 h2'
      (eq_neg_of_add_eq_zero_left (hcl.2 2 1 (by decide)))).1
    rw [rr] at hc
    have e := congrFun (congrFun hc 0) 0
    simp at e
    have hc1 : c = -1 := by linear_combination -e
    subst hc1
    cases x <;> cases y <;> simp

/-- The complex numbers carry a square root of minus one, so the premises are inhabited. -/
noncomputable def diracPremisesComplex : Premises ℂ := diracPremises Complex.I Complex.I_mul_I two_ne_zero

end SPHYS.Matter
#print axioms SPHYS.Matter.square_forces_the_relations
#print axioms SPHYS.Matter.relations_give_the_square
#print axioms SPHYS.Matter.the_law_factorises
#print axioms SPHYS.Matter.no_numbers_take_the_square_root
#print axioms SPHYS.Matter.trace_zero_of_anticommute
#print axioms SPHYS.Matter.trace_mul_zero_of_anticommute
#print axioms SPHYS.Matter.no_two_in_odd_size
#print axioms SPHYS.Matter.no_four_in_size_two
#print axioms SPHYS.Matter.four_is_the_least
#print axioms SPHYS.Matter.model_squares
#print axioms SPHYS.Matter.model_anticommute
#print axioms SPHYS.Matter.model_clifford
#print axioms SPHYS.Matter.model_energy
#print axioms SPHYS.Matter.product_of_two_directions
#print axioms SPHYS.Matter.the_spin_term
#print axioms SPHYS.Matter.full_turn
#print axioms SPHYS.Matter.exclusion
#print axioms SPHYS.Matter.a_whole_spin_excludes_nothing
#print axioms SPHYS.Matter.a_sign_is_plus_or_minus_one
#print axioms SPHYS.Matter.two_statistics_and_no_third
#print axioms SPHYS.Matter.dirac_forced
#print axioms SPHYS.Matter.four_components
#print axioms SPHYS.Matter.exclusion_forced
#print axioms SPHYS.Matter.diracPremises
#print axioms SPHYS.Matter.diracPremisesComplex
#print axioms SPHYS.Matter.rotor_of_the_law
#print axioms SPHYS.Matter.the_forced_law_is_a_half_spin
#print axioms SPHYS.Matter.model_spin_commutes_with_energy
#print axioms SPHYS.Matter.the_two_signs_of_the_energy_balance
```

## Appendix B · Dirac_Forced_Twin_CC.f90

Thirteen checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C.

```fortran
! Dirac_Forced_Twin_CC.f90 · twin of SPHYS_Dirac_Forced_CC.lean
! RATIONALE. The engine proves its identities in every ring. This twin executes them on random integer data, as an
!   independent run; searches small matrices and small groups exhaustively for what the engine proves cannot exist;
!   and sets three readings of the law against published measurements, with a rival beside the first.
! DESIGN. 64-bit integers for the algebra; complex integers for the search; double precision for the measured cells;
!   one generator, fixed seed. The turns of section A are the quaternions, which are the products of pairs of the
!   three generators of Part V of the engine.
! CONVENTION. A reading agrees within the stated scale; a rival is excluded when it lies further than that scale.
! NON-NEGOTIABLE. No mass and no coupling is computed. The fine-structure constant is a measured input.
! RISK. The least law gives the moment of the electron as two. The first correction, alpha over two pi, belongs to
!   the field's own quantum; it is a classical formula, entered, and is printed as such, not as a result of the law.
!   The search of section A covers matrices of size two with entries 0, 1, -1, i, -i only; the engine's theorem
!   covers every field.
program dirac_twin
  implicit none
  integer, parameter :: i8 = selected_int_kind(18), dp = kind(1.0d0)
  integer(i8) :: seed = 20260622_i8
  integer :: checks = 0, failures = 0
  real(dp), parameter :: pi = 3.14159265358979323846d0
  call algebra()
  call exclusion()
  call measured()
  write(*,'(A,I0,A,I0,A)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', failures, '}'
contains
  subroutine check(label, ok)
    character(*), intent(in) :: label
    logical, intent(in) :: ok
    checks = checks + 1
    if (ok) then
      write(*,'(A,A)') '  PASS  ', label
    else
      failures = failures + 1
      write(*,'(A,A)') '  FAIL  ', label
    end if
  end subroutine
  function rnd() result(k)                         ! integers in -9..9
    integer(i8) :: k
    seed = mod(seed * 6364136223846793005_i8 + 1442695040888963407_i8, 9223372036854775807_i8)
    k = mod(abs(seed / 65536_i8), 19_i8) - 9_i8
  end function
  function qm(p, q) result(r)                      ! product of two turns a + b i + c j + d k
    integer(i8), intent(in) :: p(4), q(4)
    integer(i8) :: r(4)
    r(1) = p(1)*q(1) - p(2)*q(2) - p(3)*q(3) - p(4)*q(4)
    r(2) = p(1)*q(2) + p(2)*q(1) + p(3)*q(4) - p(4)*q(3)
    r(3) = p(1)*q(3) - p(2)*q(4) + p(3)*q(1) + p(4)*q(2)
    r(4) = p(1)*q(4) + p(2)*q(3) - p(3)*q(2) + p(4)*q(1)
  end function
  function mm(a, b) result(c)                      ! product of two by two arrays of turns, stored (entry, part)
    integer(i8), intent(in) :: a(4,4), b(4,4)
    integer(i8) :: c(4,4)
    c(1,:) = qm(a(1,:), b(1,:)) + qm(a(2,:), b(3,:))
    c(2,:) = qm(a(1,:), b(2,:)) + qm(a(2,:), b(4,:))
    c(3,:) = qm(a(3,:), b(1,:)) + qm(a(4,:), b(3,:))
    c(4,:) = qm(a(3,:), b(2,:)) + qm(a(4,:), b(4,:))
  end function
  function dop(E, x, y, z, m) result(d)            ! the operator of first order, shifted by a mass
    integer(i8), intent(in) :: E, x, y, z, m
    integer(i8) :: d(4,4)
    d = 0
    d(1,1) = E + m; d(4,1) = -E + m
    d(2,2:4) = [x, y, z]; d(3,2:4) = [x, y, z]
  end function
  subroutine algebra()
    integer :: i, bad1, bad2, bad3, bad4, bad5, na, nb
    integer(i8) :: x, y, z, u, v, w, E, m, a, b, c, d, r(4), s(4,4), want(4,4)
    logical :: ok
    bad1 = 0; bad2 = 0; bad3 = 0; bad4 = 0
    do i = 1, 200000
      x = rnd(); y = rnd(); z = rnd(); u = rnd(); v = rnd(); w = rnd(); E = rnd()
      r = qm([0_i8, x, y, z], [0_i8, x, y, z])
      if (any(r /= [-(x*x + y*y + z*z), 0_i8, 0_i8, 0_i8])) bad1 = bad1 + 1
      r = qm([0_i8, x, y, z], [0_i8, u, v, w])
      if (any(r /= [-(x*u + y*v + z*w), y*w - z*v, z*u - x*w, x*v - y*u])) bad2 = bad2 + 1
      s = mm(dop(E, x, y, z, 0_i8), dop(E, x, y, z, 0_i8))
      want = 0; want(1,1) = E*E - (x*x + y*y + z*z); want(4,1) = want(1,1)
      if (any(s /= want)) bad3 = bad3 + 1
      ! a point on the mass shell: (a2+b2+c2+d2)^2 = (a2+b2-c2-d2)^2 + (2(ad+bc))^2 + (2(bd-ac))^2
      a = rnd(); b = rnd(); c = rnd(); d = rnd()
      E = a*a + b*b + c*c + d*d; m = a*a + b*b - c*c - d*d; x = 2*(a*d + b*c); y = 2*(b*d - a*c)
      s = mm(dop(E, x, y, 0_i8, -m), dop(E, x, y, 0_i8, m))
      if (any(s /= 0)) bad4 = bad4 + 1
    end do
    write(*,'(A)') ' A. The algebra, on 200000 random integer points'
    call check('the square of a direction is minus its squared length', bad1 == 0)
    call check('the product of two directions carries the dot and the cross', bad2 == 0)
    call check('the operator of first order squares to the mass shell', bad3 == 0)
    call check('on the mass shell, operator less mass times operator plus mass is zero', bad4 == 0)
    bad5 = 0
    do na = -6, 6
      do nb = -6, 6
        ok = (na*1 + nb*0)**2 == 1 .and. (na*0 + nb*1)**2 == 1 .and. (na + nb)**2 == 2
        if (ok) bad5 = bad5 + 1
      end do
    end do
    call check('no pair of numbers takes the square root, a and b in -6..6', bad5 == 0)
    call search2(na, nb)
    write(*,'(A,I0,A,I0)') '   size two, entries 0, 1, -1, i, -i: matrices whose square is a scalar, not zero: ', na, &
         '; largest set that anticommutes in pairs: ', nb
    call check('in size two three coefficients anticommute and four never do', nb == 3)
  end subroutine
  subroutine search2(nsq, best)                      ! exhaustive search in size two
    integer, intent(out) :: nsq, best
    complex(dp), parameter :: v(5) = [(0d0,0d0), (1d0,0d0), (-1d0,0d0), (0d0,1d0), (0d0,-1d0)]
    complex(dp), allocatable :: m(:,:,:)
    complex(dp) :: a(2,2), z(2,2)
    integer :: i1, i2, i3, i4, p, q, r, t
    logical, allocatable :: ac(:,:)
    allocate(ac(625,625), m(2,2,625))
    nsq = 0
    do i1 = 1, 5; do i2 = 1, 5; do i3 = 1, 5; do i4 = 1, 5
      a = reshape([v(i1), v(i2), v(i3), v(i4)], [2,2]); z = matmul(a, a)
      if (isz(z(1,2)) .and. isz(z(2,1)) .and. isz(z(1,1) - z(2,2)) .and. .not. isz(z(1,1))) then
        nsq = nsq + 1; m(:,:,nsq) = a
      end if
    end do; end do; end do; end do
    do p = 1, nsq
      do q = 1, nsq
        ac(p,q) = all(isz(matmul(m(:,:,p), m(:,:,q)) + matmul(m(:,:,q), m(:,:,p))))
      end do
    end do
    best = 1
    do p = 1, nsq
      do q = p + 1, nsq
        if (.not. ac(p,q)) cycle
        best = max(best, 2)
        do r = q + 1, nsq
          if (.not. (ac(p,r) .and. ac(q,r))) cycle
          best = max(best, 3)
          do t = r + 1, nsq
            if (ac(p,t) .and. ac(q,t) .and. ac(r,t)) best = max(best, 4)
          end do
        end do
      end do
    end do
  end subroutine
  elemental logical function isz(c)                  ! entries are whole numbers, so the test is exact
    complex(dp), intent(in) :: c
    isz = nint(real(c)) == 0 .and. nint(aimag(c)) == 0
  end function
  integer function count_sign_maps()                 ! homomorphisms from the permutations of three things to +-1
    integer :: perm(3,6), f(6), mask, a, b, c, k, comp(3)
    logical :: ok
    perm = reshape([1,2,3, 1,3,2, 2,1,3, 2,3,1, 3,1,2, 3,2,1], [3,6])
    count_sign_maps = 0
    do mask = 0, 63
      do a = 1, 6
        f(a) = merge(-1, 1, btest(mask, a - 1))
      end do
      ok = .true.
      do a = 1, 6
        do b = 1, 6
          do k = 1, 3
            comp(k) = perm(perm(k, b), a)
          end do
          do c = 1, 6
            if (all(perm(:, c) == comp)) then
              if (f(c) /= f(a)*f(b)) ok = .false.
            end if
          end do
        end do
      end do
      if (ok) count_sign_maps = count_sign_maps + 1
    end do
  end function
  subroutine exclusion()
    integer :: i, j, bad1, bad2, bad3, sg
    integer(i8) :: f(12), g(12), psi(12,12)
    bad1 = 0; bad2 = 0; bad3 = 0
    do i = 1, 12
      f(i) = rnd(); g(i) = rnd() + 10
    end do
    do i = 1, 12                                     ! the amplitude with the minus sign, built once and then read
      do j = 1, 12
        psi(i,j) = f(i)*g(j) - f(j)*g(i)
      end do
    end do
    do i = 1, 12
      if (psi(i,i) /= 0) bad1 = bad1 + 1             ! empty wherever the two share a state
      do j = 1, 12
        if (psi(j,i) /= -psi(i,j)) bad1 = bad1 + 1
      end do
    end do
    do sg = -50, 50
      if ((sg*sg == 1) .neqv. (sg == 1 .or. sg == -1)) bad2 = bad2 + 1
    end do
    bad3 = count_sign_maps()                         ! maps from the six permutations of three things to +-1
    write(*,'(A)') ' B. Exclusion and the two statistics'
    call check('an amplitude with the minus sign vanishes wherever two share a state', bad1 == 0)
    call check('a sign whose square is one is plus one or minus one, -50..50', bad2 == 0)
    write(*,'(A,I0)') '   maps from the permutations of three things to signs that respect products: ', bad3
    call check('the permutations of three things carry two statistics and no third', bad3 == 2)
  end subroutine
  subroutine measured()
    real(dp) :: alpha, ghalf, sch, qm_ratio, qm_sig
    write(*,'(A)') ' C. Against published measurements'
    alpha = 7.2973525693d-3                         ! measured input
    ghalf = 1.00115965218059d0                      ! Fan et al., 2023, uncertainty 13 in the last two digits
    sch = alpha/(2*pi)
    write(*,'(A,F16.14,A,F10.8)') '   half the moment of the electron: least law 1, measured ', ghalf, &
         ', first correction alpha/2pi = ', sch
    ! thresholds are the scales of the expansion, not fitted numbers: alpha for the least law, (alpha/pi)^2 for the rest
    call check('the least law holds within alpha: measured 1.00115965218059(13)', abs(ghalf - 1.0d0) < alpha)
    ! rival: a law with no spin term gives half the moment as one half
    write(*,'(A,F8.5,A)') '   rival, no spin term: half the moment 0.5, away from the measured value by ', abs(ghalf - 0.5d0), ''
    call check('a law with no spin term is excluded: it misses by more than alpha', abs(ghalf - 0.5d0) > alpha)
    call check('the first correction closes the rest within (alpha/pi)^2', abs(ghalf - 1.0d0 - sch) < (alpha/pi)**2)
    qm_ratio = -1.000000000003d0; qm_sig = 16.0d-12  ! Borchert et al., 2022
    write(*,'(A,F6.2,A)') '   antiproton to proton charge over mass: -1 at ', abs(qm_ratio + 1.0d0)/qm_sig, &
         ' uncertainties'
    call check('the antiparticle mirrors the particle: -1.000000000003(16) against -1', &
               abs(qm_ratio + 1.0d0)/qm_sig < 1.0d0)
    ! a bound compared with the forced value zero cannot fail: it is printed as a reading and is not counted
    write(*,'(A)') '   reading, not a check: exclusion forced 0; measured probability of a violation below 3.4e-29'
  end subroutine
end program
```

## Appendix C · Run of Appendix B

```text
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
 BATTERY-JSON: {"checks":13,"failures":0}
```

## Appendix D · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.Matter.square_forces_the_relations' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.relations_give_the_square' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.the_law_factorises' depends on axioms: [propext]
'SPHYS.Matter.no_numbers_take_the_square_root' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.trace_zero_of_anticommute' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.trace_mul_zero_of_anticommute' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.no_two_in_odd_size' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.no_four_in_size_two' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.four_is_the_least' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.model_squares' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.model_anticommute' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.model_clifford' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.model_energy' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.product_of_two_directions' depends on axioms: [propext, Quot.sound]
'SPHYS.Matter.the_spin_term' depends on axioms: [propext]
'SPHYS.Matter.full_turn' depends on axioms: [propext]
'SPHYS.Matter.exclusion' depends on axioms: [propext]
'SPHYS.Matter.a_whole_spin_excludes_nothing' depends on axioms: [propext]
'SPHYS.Matter.a_sign_is_plus_or_minus_one' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.two_statistics_and_no_third' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.dirac_forced' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.four_components' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.exclusion_forced' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.diracPremises' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.diracPremisesComplex' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.rotor_of_the_law' depends on axioms: [propext]
'SPHYS.Matter.the_forced_law_is_a_half_spin' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.model_spin_commutes_with_energy' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Matter.the_two_signs_of_the_energy_balance' depends on axioms: [propext, Classical.choice, Quot.sound]
```
