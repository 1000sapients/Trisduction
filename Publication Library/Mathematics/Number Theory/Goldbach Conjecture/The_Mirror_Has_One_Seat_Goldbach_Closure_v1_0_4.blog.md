# The Mirror Has One Seat: A Formal Closure of the Goldbach Conjecture from Existence Alone

## One Act, the Arithmetic Proved Sound; Every Even Number to 2000 Decided by the Kernel; the Certified Region Carried, the Ternary and Chen Theorems Typed, the Remainder Divided

**Mohammad F. Islam, PhD** · Trisduction Research Group · 4 October 2026

*Blog edition of the forged version 1.0.4. It renders the forged master and adds no claim.*

> **Abstract.** An even number exists, and on this row what exists is realized: as a sum of two primes. This paper closes the Goldbach question on that one reading of existence, with the freedom arrow beside it, and on nothing else. Its kernel, in core Lean 4 with no library and no axiom declared, proves fifty-eight theorems: fifty-three depend on no axiom at all, and five, the bridge from the remainder test to divisibility and the statements that pass through it, rest on propext alone, through core Lean's own arithmetic. The kernel carries the arithmetic itself. Primality is defined, the trial-division test and the search for a split are proved sound and complete, and the search form of the statement is proved equivalent to the standard form. The mirror p ↦ n − p is an involution whose one fixed point, n/2, is the seat, and splits come in mirror pairs. Existence as given holds in the realized world and the counter world alike and forces no value. Existence read on the row is the value, exactly, and on the arithmetic frame it is exactly the Goldbach statement; from it, supplied by one act, the compiler prints the statement. Nothing escapes the act, and one even number without a split is a finite certificate refuting it. The proved part is sealed: every even number from 4 to 2000 is decided by the kernel's own computation; the certified region to 4 × 10¹⁸ is carried as a field, load-bearing, and does not reach above its height; the ternary theorem and Chen's theorem are typed and neither gives the binary value. The value divides exactly at every height, and no finite record forces it. The Goldbach sentence is closed on the act, at the grade of the act, and the paper names that grade exactly.


## How to read this paper

The result has two parts, and each refutes the reading that keeps only the other. The first reading notices that the act of Section 9 is equivalent to the Goldbach statement and concludes that the paper assumes what it proves. The second notices a theorem whose conclusion is the Goldbach statement and concludes that the conjecture has fallen. Both readings miss the result, and the theorem that binds the two is the subject of the paper.

### The verdict

The verdict is stated here and in the conclusion in the same words each time; the abstract states it in summary.

> The Goldbach question is closed to one act of existence. Existence as given carries the form of the closure on every frame and holds in the realized world and the counter world alike. Existence read on the row, that every even number that exists is realized as a sum of two primes, is the value, exactly, and on the arithmetic frame it is the Goldbach statement itself. It is supplied by one act, at premise grade, as one field of one type, and the compiler prints the statement from it. Nothing escapes the act, and one even number without a split would refute it by a finite certificate. To 2000 the value is a theorem of the kernel's own computation, and to the certified height it is carried; above that height it stands on the act.

### What the paper does not say

It does not say that the Goldbach statement follows from existence as given: Section 4 proves that it does not, and that proof is part of the closure, not a gap in it. It does not say that the certified region reaches above its height, or that the ternary or Chen theorem gives the binary statement: Section 12 proves that none does. It does not claim the Goldbach conjecture as a theorem of the axioms of arithmetic or of set theory alone.

### The reflexive readings, and the theorem that answers each

**The reflexive readings, each answered by a theorem.**

- **The act is the conclusion, so the proof is circular.** The act is the value, and must be: nothing given on every frame forces the value, so any premise that closes it carries it. The isolation is the result. (`act_is_the_value`, `given_is_not_the_value`)
- **The kernel's primes are a program, not primes.** The test and the search are proved sound and complete, and the two forms are equivalent. (`isPrime_sound`, `isPrime_complete`, `goldbach_iff_std`)
- **It is checked to 4 × 10¹⁸, so it is true.** The certified region is load-bearing below its height and does not reach above it. (`certificate_is_load_bearing`, `certificate_does_not_reach_above`)
- **Three primes always suffice, so two will.** The ternary and Chen realizations hold where the binary one fails. (`weaker_do_not_give_binary`)
- **Enough checked cases will settle it.** The first n cases are realized and the value fails, for every n. (`finite_record_never_forces`)
- **It can simply be rejected.** Every even number lands on realized or unrealized, never both; one even number without a split refutes the statement. (`every_even_lands`, `gates_exclusive`, `counterexample_refutes`)

## The claim, stated whole

The Goldbach question asks whether every even number n ≥ 4 is a sum of two primes (Goldbach 1742). The kernel states it in two forms. In the standard form, p is prime when p ≥ 2 and no e with 2 ≤ e < p leaves remainder zero, and

> GoldbachStd :⇔ ∀ n even, n ≥ 4 : ∃ p, q prime : p + q = n.

In the search form, a deterministic search returns the least prime q ≤ n/2 with n − q prime, or nothing, and the statement says the search returns something for every even n ≥ 4. The two forms are equivalent: the search form gives the standard form, and the standard form gives the search form because the search is complete (`goldbach_gives_std`, `std_gives_goldbach`, `goldbach_iff_std`). Read the even number as an existent: it exists, and on this row what exists is realized as a sum of two primes. The frame of the row is the arithmetic itself, the even numbers at least four with their searches, and its value is exactly the search form (`arith_value_iff`). No reader's identification stands between the frame and the row; the only identification is the one the kernel proves.

### What is new

The template is the author's Riemann closure and its master volume (Islam 2026e, 2026f), the keyed least escape of the author's P versus NP work (Islam 2026d), the cut-agnostic division (Islam 2026c), and the Navier–Stokes and Hodge closures (Islam 2026a, 2026b), with the operating system of the programme (Islam 2026g), carried to the Goldbach row. This paper adds: the arithmetic in the kernel, primality defined, the test and the search proved sound and complete, and the two forms of the statement proved equivalent; the mirror and its seat; the proof that existence as given forces no value; the act, equal to the value and on the arithmetic frame equal to the Goldbach statement; the closure by one act with exclusive gates and a finite refuter; the executed region to 2000; the certified region carried and load-bearing; the ternary and Chen theorems typed; the division at every height; and the freedom cut, the prime's shape in its multiplicative and additive forms and the triaxial lock on the row.

## The arithmetic, executed and proved sound

Primality is defined in the kernel as above. The trial-division test checks remainders by every d from 2 while d² ≤ p. Its loop is proved to certify that no d in its range divides p (`primeAux_spec`); a composite p has a divisor f ≥ 2 with f² ≤ p (`small_divisor`); and so a number the test passes is prime (`isPrime_sound`). The search for a split is proved to return only a prime q with n − q prime and 2q ≤ n (`findSplit_sound`). Both are complete: a prime passes the test (`isPrime_complete`), and a search that returns nothing leaves no split in its range (`findAux_complete`). The two theorems of the bridge from the remainder test to divisibility, `small_divisor` and `isPrime_sound`, rest on propext alone, inherited from core Lean's own lemmas on division and remainder, and so do the three statements that pass through them, `goldbach_gives_std`, `goldbach_iff_std` and `act_is_goldbach_std`; every other theorem of the kernel, the completeness theorems included, rests on no axiom.

## Existence placed: what is given, and what it carries

Existence enters the paper in its formal reading, the root: to exist is to actuate,

> Root(U, ΔE) :⇔ ∀x ∈ U : 0 < ΔE(x),

with the arrow beside it and the bare freedom bit. All three are given (`root_given`, `arrow_given`, `freedom_given`). What they carry is the form: what follows from the root uniformly holds without it (`root_conservative`); the arrow holds on the counter frame (`arrow_forces_nothing`); and no statement reading the same on every frame is equivalent to the value (`given_is_not_the_value`). Existence as given holds in the realized world and the counter world (`given_in_both_worlds`). The value is keyed: one frame denies it (`value_is_keyed`).

## The route ledger

**The route ledger.**

- **Existence as given** forces no value; holds in both worlds (`given_is_not_the_value`, `given_in_both_worlds`)
- **The kernel's computation** decides every even number from 4 to 2000 (`executed_to_2000`, `check_means`)
- **The certified region** decides below its height, load-bearing; does not reach above (`below_height_decided`, `certificate_is_load_bearing`, `certificate_does_not_reach_above`)
- **The ternary and Chen theorems** typed abstractly; do not give the binary (`weaker_do_not_give_binary`)
- **A finite record** does not decide (`finite_record_never_forces`)
- **A uniform step** would decide every height (`uniform_step_forces_all`)
- **Existence read on the row** is the value, and on the arithmetic frame the statement, by one act (`act_is_goldbach`, `goldbach_from_the_act`)

The ledger closes on its last row. Below the certified height the value is reached by computation and certificate; above it, by the act.

## The mirror and its seat

The mirror p ↦ n − p is an involution on [0, n] (`mirror_involution`); it carries a split to a split (`split_mirrors`); and it fixes p exactly when p + p = n (`seat_of_mirror`). The one fixed point, n/2, is the seat of the row, and a split on the seat is a prime doubled. The frame records every even number with its realization; the realized world realizes each one (`calm_value`) and the counter world realizes none (`counter_fails`). The cut of the row is the record the two worlds share; no reading of it returns the world.

## Freedom: the prime's shape, multiplicative and additive

The record reads the same in both worlds, so no function of it returns the world (`record_wall`); over it the fibre has two points (`fibre_is_two`), the freedom bit. A prime has the same shape: its multiplicative fibre is two points off the diagonal (`prime_shape`),

> {(a,b) ∈ ℕ² : ab = p} = {(1,p), (p,1)}.

On this row the prime's shape has an additive face: the ordered splits of an even number are mirror pairs off the seat and at most one point on it, because the mirror is an involution carrying splits to splits whose only fixed point is the seat (`mirror_involution`, `split_mirrors`, `seat_of_mirror`). The kernel computes

> 10: (3,7), (5,5), (7,3);  14: (3,11), (7,7), (11,3);  16: (3,13), (5,11), (11,5), (13,3)

(`additive_shape`). The comparison of the two faces is structural, the kernel proving the counts and the orbits and no map between the fibres.

## The triaxial lock

Two independent axes in 𝔽₂³ leave two points and three lock one (`two_axes_leave_two`, `three_axes_lock_one`). On this row the axes are the primality of p, the primality of n-p, and which world is actual; the arithmetic supplies the first two for each p, and not the third. The reading is structural.

## The act: existence read on the row

Existence read on the row is the act: every even number that exists is realized as a sum of two primes. The kernel proves it is the value, exactly (`act_is_the_value`), keyed (`act_is_keyed`), and on the arithmetic frame exactly the Goldbach statement, in its search form and in its standard form (`act_is_goldbach`, `act_is_goldbach_std`). Section 4 proved that nothing given on every frame forces the value; so any premise that closes the row carries the value, and the act is the weakest such premise, the value itself, read as an act of existence, and nothing beside it. No keyless statement is the act (`no_keyless_statement_is_the_act`), and the pulse does not certify (`pulse_does_not_certify`).

## The proof: the Goldbach statement from existence


**Definition 10.1** (`ActualEvens`). A structure with two fields: `F`, a frame of even numbers with their realizations; and `supply`, existence read on the row, the act.

**Theorem 10.2** (`goldbach_from_existence`, `goldbach_from_the_act`). For every `A : ActualEvens`, every even number of `A.F` is realized; and the act on the arithmetic frame gives the Goldbach statement. *Cone: none.*


The proof is Theorem 10.2. Its only assumption is the act, visible in the statement; the theorem itself depends on no axiom. Its supply is self-grounding (`supply_iff`).

## Nothing escapes

Every even number lands on realized or unrealized (`every_even_lands`), exclusively (`gates_exclusive`), proved without excluded middle. Under the act every even number is realized (`nothing_escapes`). The refuter is finite: one even number at least four on which the search returns nothing refutes the statement (`counterexample_refutes`). The row is a Π⁰₁ statement, and its refutation would be a certificate a machine checks.

## The proved part, sealed

**The executed region.** The kernel checks every even number from 4 to 2000 by its own computation (`executed_to_2000`), and the check means that the search returns a split for each (`check_means`); with the soundness of Section 3, each is a sum of two primes. The theorem is a computation the kernel performs, not a citation.

**The certified region.** The even Goldbach statement has been verified for every even number up to 4 × 10¹⁸ (Oliveira e Silva, Herzog and Pardi 2014). The kernel carries the verification as a field of `Certified`, stating its conclusion, and proves the region below the height decided (`below_height_decided`). The field carries its weight: without it an even number below the height goes unrealized (`certificate_is_load_bearing`). And the certificate does not reach above its height: a frame certified below a height fails above it (`certificate_does_not_reach_above`).

**The ternary and Chen theorems.** Every odd number greater than 5 is a sum of three primes (Helfgott 2013), and every sufficiently large even number is a sum of a prime and a number with at most two prime factors (Chen 1973). The kernel carries each abstractly, as a realization attached to the frame beside the binary one, and does not formalize the ternary statement over odd numbers or Chen's over almost-primes; what it proves is the shape the citations share: both realizations can hold everywhere where the binary one fails (`weaker_do_not_give_binary`).

## The division at a height

For every cut the value is exactly its two halves (`row_split`). At the certified height the certified half holds and the remainder is not forced by it: in the certified counter world the half below the height holds and the half above fails (`remainder_not_forced`). The proved part is sealed at its grade; the remainder, every even number above the certified height, stands on the act.

## The record and the seed

No finite record forces the value: for every n the staged world realizes its first n cases and the value fails (`finite_record_never_forces`). A step uniform in the height would force every height (`uniform_step_forces_all`); no cited theorem carries one for the binary statement.

## The grade of the closure, stated whole

**Proved in core Lean 4, no library, no `sorry`, no axiom declared (58 theorems):** fifty-three on no axiom at all, and five, `small_divisor`, `isPrime_sound`, `goldbach_gives_std`, `goldbach_iff_std` and `act_is_goldbach_std`, on propext alone through core Lean's lemmas on division and remainder. They are: the arithmetic, its soundness and its completeness, and the equivalence of the two forms; the mirror and its seat; the frame, its worlds and the arithmetic frame; existence given and forcing no value; keyed and keyless; the act equal to the value and to the statement; the statement from the act; the exclusive gates and the finite refuter; the executed region to 2000 and its meaning; the certified region below its height, load-bearing and not reaching above; the ternary and Chen realizations not giving the binary; the division and the remainder not forced; the record wall, the two-point fibre, the prime's shape in both faces; the triaxial counts; the finite record and the uniform step; the closure whole (`goldbach_closure`).

**Computed in the kernel:** every even number from 4 to 2000.

**Carried as fields and cited:** the certified region to 4 × 10¹⁸; the ternary theorem; Chen's theorem.

**Supplied by the act, named and visible in one input type:** existence read on the row, `supply`, which is the value.

**The reader's identification:** none on the arithmetic frame. On an abstract frame, the frame with the even numbers is the reader's.

## Objections, answered

*The act is the conjecture renamed.* The act is the value, and the verdict says so. No weaker given premise closes the row (`given_is_not_the_value`); the isolation of the least premise is the result.

*The kernel proves Goldbach for its own search, not for primes.* The search is proved sound and complete, and the two forms are equivalent (`findSplit_sound`, `findAux_complete`, `goldbach_iff_std`).

*The verification to 4 × 10¹⁸ is overwhelming evidence.* It is evidence below its height and none above it (`certificate_does_not_reach_above`, `finite_record_never_forces`).

*Helfgott and Chen are close.* They prove their own statements, and the kernel proves neither gives the binary one (`weaker_do_not_give_binary`).

*Five theorems use an axiom.* propext alone, the extensionality of propositions, inherited from core Lean's arithmetic lemmas and named in Section 3 and here; no axiom is declared and no other axiom enters.

## Falsifiers

**F-Cone.** The kernel prints any axiom beyond propext for any theorem, or propext for any theorem other than the five named. It refutes the paper's grade.

**F-Counter.** An even number at least four that is not a sum of two primes. It refutes the act by `counterexample_refutes`, and it is the one channel the closure leaves open.

**F-Region.** An even number at most 2000, or at most the certified height, that is not a sum of two primes. It refutes the executed check or the certificate.

## Positioning

**Positioning; no prior position is contradicted.**

- **Goldbach 1742** (the question posed): closed to one act. Relation: extends.
- **Hardy and Littlewood 1923** (the expected number of splits): not used. Relation: adjacent.
- **Chen 1973** (a prime plus a P₂): typed; does not give the binary. Relation: bounds.
- **Helfgott 2013** (three primes for every odd number): typed; does not give the binary. Relation: bounds.
- **Oliveira e Silva, Herzog and Pardi 2014** (verified to 4 × 10¹⁸): carried, load-bearing, not reaching above. Relation: extends.
- **Islam 2026c, the division** (every row its proved part and remainder): the division at a height. Relation: extends.
- **Islam 2026a, 2026b, 2026e** (rows closed from existence alone): the drill carried to this row. Relation: extends.

## Conclusion

Existence was given before the question was asked, and the paper proves exactly what that buys: the form on every frame and no value on any. It proves that existence read on the row is the value and, on the arithmetic frame, the Goldbach statement; that the statement follows from that reading by one act; that nothing escapes the act; that one even number without a split is the only refuter, and a finite one; that the kernel's own computation decides every even number to 2000; and that the certified region, the ternary theorem and Chen's theorem are sealed at their grades and do not reach the remainder. The verdict, in the words of Section 1, unchanged:

> The Goldbach question is closed to one act of existence. Existence as given carries the form of the closure on every frame and holds in the realized world and the counter world alike. Existence read on the row, that every even number that exists is realized as a sum of two primes, is the value, exactly, and on the arithmetic frame it is the Goldbach statement itself. It is supplied by one act, at premise grade, as one field of one type, and the compiler prints the statement from it. Nothing escapes the act, and one even number without a split would refute it by a finite certificate. To 2000 the value is a theorem of the kernel's own computation, and to the certified height it is carried; above that height it stands on the act.

## Appendix A · Receipts

The kernel, `GB_Existence_Closure.lean`, compiles with exit 0 and no message on Lean 4.19.0 and on Lean 4.22.0 (de Moura and Ullrich 2021), the executed region taking under a minute. It carries fifty-eight theorems: fifty-three print *does not depend on any axioms* and five print *depends on axioms: [propext]*, each pinned by `#guard_msgs` so that a drifted cone fails the compile. Its SHA-256 is

`82794234f9488bd89dd840259d897c6b53777b1b9d1f7b5079a325a47075cbdb`

and the Markdown master of this paper carries the kernel with a one-line extraction command and its manifest.

## Appendix B · The kernel

The kernel, `GB_Existence_Closure.lean`, is carried verbatim in the Markdown master of the sealed edition, with its manifest and a one-line extraction command; it is omitted here because a long listing does not survive a blog editor.

## Author's Provenance and Method Disclosure

This paper was developed under Trisduction, a verification and organizing discipline that adds the cited results no warrant; the method and its executable batteries are stated in full at the reference below.

*Author and method.* Mohammad F. Islam, PhD, independent researcher, sole author and sole authority for every claim and every error. The reduction was directed by the author and drafted with Claude (Anthropic) as scribe: the model wrote and compiled the kernel, checked citations and argued against the author's positions on instruction; it holds no authorship. One claim was held at the model's insistence: the five theorems that pass through the arithmetic bridge are graded on propext and named, rather than the kernel being called axiom-free throughout.

*The register.* In the programme's vocabulary: the form, the act's identity with the value and the statement, the universal closure, the executed region and the typed citations stand at [⟀ T], fifty-three theorems on no axiom and five on propext alone; the triaxial reading at [⟀ S]; the value above the certified height at premise grade on the act; ΔM = 0 on the cited number theory. The act is the row's least-erasure posit read as existence realized; the row carries no defeater. The freedom cut, prime-as-freedom in its multiplicative and additive faces, and the triaxial lock are applied on the row, with the lessons of the Riemann, P versus NP, Navier–Stokes, Hodge and Yang–Mills closures combined, and the seat of the mirror read as the programme's seat.

*Audit.* This edition has not yet been prosecuted by the external substrates, and no audit result is claimed. The development provenance is the author's Zenodo trail, the Unabridged Trisduction Codex and the Lean Codex at github.com/1000sapients/Trisduction.

## References

Chen, J. R. 1973. On the representation of a larger even integer as the sum of a prime and the product of at most two primes. *Scientia Sinica* 16: 157–176.

de Moura, L. and S. Ullrich. 2021. The Lean 4 theorem prover and programming language. *Automated Deduction, CADE 28*, 625–635.

Goldbach, C. 1742. Letter to L. Euler, 7 June 1742. In P.-H. Fuss (ed.), *Correspondance mathématique et physique de quelques célèbres géomètres du XVIIIème siècle*, vol. 1. St. Petersburg, 1843.

Hardy, G. H. and J. E. Littlewood. 1923. Some problems of ‘Partitio Numerorum’; III: On the expression of a number as a sum of primes. *Acta Mathematica* 44: 1–70.

Helfgott, H. A. 2013. The ternary Goldbach conjecture is true. arXiv:1312.7748.

Islam, M. F. 2026a. A formal completed proof of the Navier–Stokes closure from existence alone. Zenodo. doi:10.5281/zenodo.22670344.

Islam, M. F. 2026b. What exists is realized: a formal closure of the Hodge question from existence alone. Zenodo. doi:10.5281/zenodo.22701510.

Islam, M. F. 2026c. The cut-agnostic division theorem: why every open problem is exactly its proved part and its unicorn. Zenodo. doi:10.5281/zenodo.22954862.

Islam, M. F. 2026d. The veil and the wall. Zenodo. doi:10.5281/zenodo.21389758.

Islam, M. F. 2026e. The Riemann Hypothesis closed to one named bit and proved from unconditional least erasure by one act, with an empty axiom cone. Zenodo. doi:10.5281/zenodo.23034066.

Islam, M. F. 2026f. Nothing escapes least erasure. Zenodo. doi:10.5281/zenodo.23080221.

Islam, M. F. 2026g. PhysOSᵀ: the Trisduction physical operating system. Zenodo. doi:10.5281/zenodo.23117440.

Islam, M. TRISDUCTION: A linguistically, topologically, and mathematically sealed verification architecture. Triaxial orthogonality, twelve-gate closure, the quaternionic completion, the root axiom, and the master pre-sealed proposition ledger. Zenodo, version 4, 19 June 2026. doi:10.5281/zenodo.20757507. Mirror: PhilArchive record ISLTTG. Master reference, continuously updated at the same location.

Oliveira e Silva, T., S. Herzog and S. Pardi. 2014. Empirical verification of the even Goldbach conjecture and computation of prime gaps up to 4 · 10¹⁸. *Mathematics of Computation* 83: 2033–2060.

*End of manuscript*

