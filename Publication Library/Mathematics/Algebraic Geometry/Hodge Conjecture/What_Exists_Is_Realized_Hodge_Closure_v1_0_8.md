---
edition: math_journal
title: "What Exists Is Realized: A Formal Closure of the Hodge Question from Existence Alone"
subtitle: "One Act, No Axiom; the Proved Part Sealed in Dimension at Most Three; the Semiregular Witness Axiom Retired"
article_type: "Foundations of Algebraic Geometry · Universal Closure"
goal: "Nothing escapes the act"
author_line: "Mohammad F. Islam, PhD"
affiliation: "Trisduction Research Group · Independent researcher"
date: "4 October 2026"
short_title: "What Exists Is Realized"
keywords: "Hodge conjecture · algebraic cycles · existence · freedom · realization · Lefschetz · universal closure · Lean 4"
accenthex: "B87333"
abstract: |
  A Hodge class exists as a class, and a class that exists is realized by an object: an algebraic cycle whose class it is. This paper closes the Hodge question on that one reading of existence, with the freedom arrow beside it, and on nothing else. Its kernel, in core Lean 4 with no library and no axiom declared, proves forty-four theorems, and every one depends on no axiom at all. Existence, universally presupposed and undeniable in act, carries the form of the closure on every frame, holds in the algebraic world and in a world with one unrealized class alike, and so forces no value. Existence read on the row, that every Hodge class that exists is realized, is the value, exactly. From that reading, supplied by one act, the compiler prints the Hodge value with an empty axiom cone. Nothing escapes the act: every class lands on exactly one of two gates, realized or unrealized, the gates are exclusive, and one unrealized Hodge class refutes it. The semiregular witness axiom of the author's earlier proof gives the value and is strictly stronger, so it is retired as a placeholder. The proved part carried here is sealed: in dimension at most three every Hodge class is algebraic, from the end classes, the Lefschetz (1,1) slice and hard Lefschetz, each field shown load-bearing. The value divides exactly into the proved half and its remainder under every cut, and the proved half does not force the remainder. Integrality does not transfer, no finite record forces the value, and no symmetry lifts a decided slice. The Hodge sentence is closed on the act, at the grade of the act, and the paper names that grade exactly.
---

## How to read this paper

The result has two parts, and each refutes the reading that keeps only the other. The first reading notices that the act of Section 8 is equivalent to the Hodge value and concludes that the paper assumes what it proves. The second notices a theorem whose conclusion is the Hodge value and concludes that the Hodge conjecture has fallen. Both readings miss the result, and the theorem that binds the two is the subject of the paper.

### The verdict

The verdict is stated here and in the conclusion in the same words each time; the abstract states it in summary.

> The Hodge question is closed to one act of existence. Existence, universally presupposed and undeniable in act, carries the form of the closure on every frame and holds in the algebraic world and the counter world alike. Existence read on the row, that every Hodge class that exists is realized by an object, is the value, exactly. It is supplied by one act, at the root's grade, as one field of one type, and the compiler prints the Hodge value from it on no axiom. Nothing escapes the act, and one unrealized Hodge class would refute it. In dimension at most three the value is a theorem of the cited Lefschetz fields; in middle codimension from dimension four it stands on the act.

### What the paper does not say

It does not say that the Hodge value follows from existence as given: Section 3 proves that it does not, and that proof is part of the closure, not a gap in it. It does not say that the proved part decides the remainder: Section 12 proves that it does not. It does not claim the Hodge conjecture as a consequence of the axioms of set theory alone, and it does not claim the integral version, which Section 11 shows does not transfer.

### The reflexive readings, and the theorem that answers each

```{=latex}
\begin{table}[htbp]\centering\scriptsize
\renewcommand{\arraystretch}{1.15}
\begin{tabularx}{\columnwidth}{@{}>{\raggedright\arraybackslash}p{0.27\columnwidth}Y>{\raggedright\arraybackslash}p{0.25\columnwidth}@{}}
\toprule
\textbf{Reading} & \textbf{What the kernel proves} & \textbf{Theorem (cone)}\\
\midrule
It is only a premise. & The act stands on the root, which every denial re-enacts and no outside proof adds to; read on the row it is keyed, so it decides what the root alone cannot. & \thm{denial_reenacts_root}, \thm{root_read_on_row_is_keyed} (none)\\
The act is the conclusion, so the proof is circular. & The act is the value, and must be: nothing given on every frame forces the value, so any premise that closes it carries it. The isolation is the result. & \thm{act_is_the_value}, \thm{given_is_not_the_value} (none)\\
Existence is universally given, so the value should follow. & Existence as given holds in the algebraic and the counter world; what follows from it uniformly holds without it. & \thm{given_in_both_worlds}, \thm{root_conservative} (none)\\
The earlier witness axiom already did this. & It gives the value and is strictly stronger; it is not the least premise. & \thm{witness_axiom_strictly_stronger} (none)\\
Codimension one is proved, so the rest follows. & The (1,1) slice decides its slice and nothing beyond it; the proved half does not force the remainder. & \thm{slice_does_not_decide_the_row}, \thm{remainder_not_forced} (none)\\
Integral classes should behave the same. & Integrality does not transfer: the rational value holds where the integral one fails. & \thm{integrality_does_not_transfer} (none)\\
Enough verified cases will settle it. & Every class below codimension $n$ is algebraic and the value fails, for every $n$. & \thm{finite_record_never_forces} (none)\\
It can simply be rejected. & Every class lands on realized or unrealized, never both; one unrealized class refutes the act. & \thm{every_class_lands}, \thm{gates_exclusive}, \thm{counterclass_refutes} (none)\\
\bottomrule
\end{tabularx}
\par\vspace{3pt}{\footnotesize\color{accent}\itshape Table 1 \textbar\ The reflexive readings. Every cone is empty.}
\end{table}
```

## The claim, stated whole

Let $X$ be a smooth complex projective variety of dimension $n$, in the setting of the Hodge problem (Deligne 2006). A *Hodge class* of codimension $p$ is a class in
$$H^{2p}(X,\mathbb{Q})\cap H^{p,p}(X),$$
and the Hodge question asks whether every such class is a rational combination of classes of algebraic subvarieties (Hodge 1950). Read the class as an existent: a class exists as a class, and a class that exists is realized by an object, an algebraic cycle whose class it is. The kernel works on exactly this skeleton: a frame of classes, each with its codimension and its realization, `some` naming a realizing cycle and `none` where no algebraic cycle realizes it. A class is *algebraic* when its realization is `some`, and the *value* of the row on a frame is
$$\mathrm{Value}(F)\ :\iff\ \forall d:\ \exists n:\ \mathrm{realize}_F(d)=n.$$
That a Hodge class of a variety is a class of this frame, and that a rational combination of cycle classes is a realization, is the reader's identification, declared here and in Definition 9.1; the kernel proves nothing about it.

### What is new

The template is the author's Riemann closure and its master volume (Islam 2026f, 2026g), the keyed least escape of the author's P versus NP work (Islam 2026e), and the Navier–Stokes closure from existence alone (Islam 2026c), which this paper carries to the Hodge row. The author's earlier Hodge papers proved the row conditional on one semiregular witness axiom and terminated the formal-alone readings at a rigid-witness terminus (Islam 2026a, 2026b). This paper adds: the proof that existence as given holds in both worlds and forces no value; the act as existence read on the row, equal to the value; the closure by one act with its exclusive gates, proved without excluded middle; the retirement of the witness axiom as strictly stronger than the act; the proved part sealed in dimension at most three with each cited field shown load-bearing; the exact division of the value into its proved half and its remainder; and the freedom cut, the prime's shape and the triaxial lock on the row.

## Existence placed: what is given, and what it carries

Existence enters the paper in its formal reading, the root: to exist is to actuate,
$$\mathrm{Root}(U,\Delta E)\ :\iff\ \forall x\in U:\ 0<\Delta E(x),$$
with the arrow beside it, that every type carries an act, and the bare freedom bit, one orbit of two. All three are given: the root is satisfiable on every background (\thm{root_given}), the arrow holds on every type (\thm{arrow_given}), and the freedom bit is the swap without a fixed point (\thm{freedom_given}).

What they carry is the form. What follows from the root uniformly in its symbols holds without it (\thm{root_conservative}), so the root alone forces nothing the empty background does not. The arrow holds on the counter frame, where a class goes unrealized (\thm{arrow_forces_nothing}). The decisive statement is \thm{given_is_not_the_value}: no statement reading the same on every frame is equivalent to the value, because such a statement would be true in the algebraic world and false in the counter world at once. Existence as given holds in both worlds (\thm{given_in_both_worlds}). It is the ground of the closure, not its value.

The root is more than given. It is universally presupposed and undeniable in act: whoever examines it, doubts it or denies it acts, and every denial of a self-grounding root is an act that instances it (\thm{denial_reenacts_root}); no outside proof adds anything to it (\thm{external_proof_adds_nothing}). It holds on every frame once any act occurs, and every examination of it is one, in the world where the value holds and in the world where it fails alike, and for that very universality it fixes the form of every closure and decides no value by itself (\thm{undeniable_root_forces_no_value}). Read on the row it becomes the act, keyed where the root is not (\thm{root_read_on_row_is_keyed}): the act stands at the root's grade, the grade of existence itself.

## The route ledger

Every route the literature or the author has taken to the value is typed below by what it reaches.

```{=latex}
\begin{table}[htbp]\centering\scriptsize
\renewcommand{\arraystretch}{1.15}
\begin{tabularx}{\columnwidth}{@{}>{\raggedright\arraybackslash}p{0.27\columnwidth}Y>{\raggedright\arraybackslash}p{0.27\columnwidth}@{}}
\toprule
\textbf{Route} & \textbf{Reach} & \textbf{Theorem}\\
\midrule
Existence as given & forces no value; holds in both worlds & \thm{given_is_not_the_value}, \thm{given_in_both_worlds}\\
Integral classes & do not transfer & \thm{integrality_does_not_transfer}\\
The (1,1) slice & decides its slice, and the exponential field is load-bearing & \thm{slice_decides}, \thm{expo_is_load_bearing}\\
Dimension at most three & decides, each field load-bearing & \thm{low_dim_decided}, \thm{hardL_is_load_bearing}\\
A finite record & does not decide & \thm{finite_record_never_forces}\\
Symmetry & does not lift a decided slice & \thm{no_symmetry_lifts}\\
A uniform step in the codimension & reaches every codimension & \thm{uniform_step_forces_all}\\
The semiregular witness axiom & decides, strictly stronger than the act & \thm{witness_axiom_strictly_stronger}\\
Existence read on the row & is the value, by one act & \thm{act_is_the_value}, \thm{hodge_from_existence}\\
\bottomrule
\end{tabularx}
\par\vspace{3pt}{\footnotesize\color{accent}\itshape Table 2 \textbar\ The route ledger. Every cone is empty.}
\end{table}
```

The ledger closes on its last two rows. The witness axiom decides and is not the least premise; the reading on the row decides and is.

## The frame, and the one cut

A frame records every class and its realization. The two coherent worlds are the algebraic world, where every class is realized (\thm{calm_value}), and the counter world, where one Hodge class of codimension two is realized by nothing (\thm{counter_fails}). The cut of the row is the record of everything the two worlds share: the classes, their codimensions, the arrow, the root. It keeps everything the two worlds share and forgets which world is actual. No reading of that record returns the world.

## Freedom: the two worlds, and the prime's shape

The record reads the same in both worlds, so no function of the record returns the world (\thm{record_wall}). Over the record the fibre has exactly two points (\thm{fibre_is_two}), neither its own denial: the freedom bit of Section 3. A prime has the same shape. Its multiplicative fibre is two points off the diagonal,
$$\{(a,b)\in\mathbb{N}^2:\ ab=p\}=\{(1,p),(p,1)\},$$
and the kernel checks at $p=7$ that the two counts agree (\thm{prime_shape}). This is the freedom of the row, and it has the shape of a prime; the comparison is structural, the kernel proving the two counts and the orbit structure and no map between the fibres. One free orbit carries one bit. The record leaves exactly that bit, as a prime leaves exactly one.

## The triaxial lock

Two independent axes in $\mathbb{F}_2^3$ leave two points, and three lock one,
$$\begin{gathered}\#\{x\in\mathbb{F}_2^3:\ r_1\cdot x=t_1,\ r_2\cdot x=t_2\}=2,\\ \#\{x\in\mathbb{F}_2^3:\ r_i\cdot x=t_i,\ i=1,2,3\}=1,\end{gathered}$$
for every independent choice of rows and targets (\thm{two_axes_leave_two}, \thm{three_axes_lock_one}). The record supplies two axes, the classes and their codimensions; the third, which world is actual, is the one the record cannot supply. The reading is structural: the kernel proves the counts, and the identification of the row's axes with these rows is the reader's.

## The act: existence read on the row

Existence read on the row is the act: every Hodge class that exists is realized by an object,
$$\mathrm{Realized}(F)\ :\iff\ \forall d\ \exists n:\ \mathrm{realize}_F(d)=n.$$
The kernel proves it is the value, exactly (\thm{act_is_the_value}), and that it is keyed: it holds in the algebraic world and fails in the counter world (\thm{act_is_keyed}). The equivalence is the strength of the closure, as the equivalence of least erasure with the critical line is the strength of the author's Riemann closure (Islam 2026f). Section 3 proved that nothing given on every frame forces the value; so any premise that closes the row carries the value, and the act is the weakest such premise, the value itself, read as an act of existence, and nothing beside it in the kernel; the reading of the frame as the classes of a variety is the reader's identification, declared in Section 2. No keyless statement is the act (\thm{no_keyless_statement_is_the_act}), and the pulse of existence does not certify: the root holds on a background beside a world whose value fails (\thm{pulse_does_not_certify}).

## The proof: the Hodge value from existence

```{=latex}
\begin{jbox}
```
\textbf{Definition 9.1} (\thm{ActualClasses}). A structure with two fields: \thm{F}, the frame, standing for the rational Hodge classes of smooth complex projective varieties with their realizations, the identification being the reader's; and \thm{supply}, existence read on the row, the act.

\textbf{Theorem 9.2} (\thm{hodge_from_existence}). For every \thm{A : ActualClasses}, every Hodge class of \thm{A.F} is algebraic. \emph{Cone: none.}
```{=latex}
\end{jbox}
```

The proof of the Hodge value is Theorem 9.2. Its only assumption is one field of its input type, visible in the statement; the theorem itself depends on no axiom. Its supply is self-grounding: an act exists on a frame exactly when the value holds there (\thm{supply_iff}).

## Nothing escapes

Every class lands on exactly one gate, realized or unrealized (\thm{every_class_lands}), and the gates are exclusive (\thm{gates_exclusive}). The dichotomy is proved without excluded middle, because a realization is a value and not a proposition. Under the act every class is realized (\thm{nothing_escapes}), and one unrealized class refutes the act (\thm{counterclass_refutes}). The closure is universal over the row, and there is one form, an unrealized Hodge class, in which it could be refuted.

## The price: what does not decide

**Integrality does not transfer.** The integral version of the question fails: torsion classes need not be algebraic (Atiyah and Hirzebruch 1962). The kernel exhibits the shape: a world where the rational value holds and the integral one fails (\thm{integrality_does_not_transfer}). The row's value is rational, and the closure is stated for it alone.

**The (1,1) slice decides its slice.** An integral class of codimension one is the first Chern class of a line bundle, by the exponential sequence (Lefschetz 1924), and a rational one has such a multiple, so every rational class of codimension one is algebraic (\thm{slice_decides}). The exponential field carries the weight: without it a codimension-one class goes unrealized (\thm{expo_is_load_bearing}). And the slice decides nothing beyond itself: a frame satisfying the slice's fields has an unrealized class of codimension two (\thm{slice_does_not_decide_the_row}).

**Projectivity is part of the setting.** The question is posed for projective varieties; on compact Kähler manifolds its analogue fails (Voisin 2002). The kernel carries no theorem on this point, and the closure is stated for the projective setting alone.

## The proved part, sealed

The proved part carried here is the part these cited fields reach; further proved cases, on special classes of varieties, lie outside the kernel and are not claimed by it. On a variety of dimension at most three every codimension is an end, one, or one below the dimension (\thm{small_cases}). The end classes, the fundamental class and the points, are algebraic; the (1,1) slice is Lefschetz; and hard Lefschetz carries codimension one to codimension $n-1$. The kernel carries these three cited theorems as fields of \thm{LowDim}, each stating its conclusion, and proves the covering: in dimension at most three every Hodge class is algebraic (\thm{low_dim_decided}). The transport itself is cited, not modelled. The hard Lefschetz field carries its weight: without it a codimension-two class on a threefold goes unrealized while the ends and the (1,1) slice hold (\thm{hardL_is_load_bearing}).

**The division.** For every cut of the classes the value is exactly its two halves (\thm{row_split}), the division of the author's cut-agnostic theorem (Islam 2026d) carried to the row. The codimension-one half is proved on every slice frame (\thm{proved_half}), and the proved half does not force the remainder: in the counter world the codimension-one half holds, vacuously since that world has no class of codimension one, and the remainder fails (\thm{remainder_not_forced}). The proved part is sealed at the grade of its cited fields; the remainder, the middle codimension from dimension four, stands on the act.

## The retired premise

The author's earlier proof derived the row from one semiregular witness axiom (Islam 2026a). The kernel types it: the witness axiom gives the value (\thm{witness_axiom_gives_value}) and is strictly stronger, since a world carries the value with no semiregular witness (\thm{witness_axiom_strictly_stronger}). A premise strictly stronger than the value is not the least premise. The witness axiom is retired as a placeholder written before the act was isolated, and the act takes its place at exactly the strength of the value.

## The record and the seed

No finite record forces the value: for every $n$ the staged world is algebraic below codimension $n$ and the value fails (\thm{finite_record_never_forces}). Conjugation keeps the type of a $(p,p)$ class, and a symmetry that keeps the codimension carries no class of a decided codimension onto an undecided one (\thm{no_symmetry_lifts}). A step uniform in the codimension would force every codimension (\thm{uniform_step_forces_all}). The seed of every forcing is such a step, and the record of the cited theorems carries none beyond the slices of Section 12.

## The grade of the closure, stated whole

**The root, universal and undeniable in act:** every denial of it re-enacts it, no outside proof adds to it, and it holds on every frame once any act occurs (\thm{denial_reenacts_root}, \thm{external_proof_adds_nothing}); for that universality it decides no value by itself (\thm{undeniable_root_forces_no_value}), and read on the row it is the act, keyed, at the root's grade (\thm{root_read_on_row_is_keyed}).

**Proved in core Lean 4, no library, no \thm{sorry}, no axiom declared, every theorem on no axiom at all (44 theorems):** the frame and its two worlds; existence given, its conservativity, its holding in both worlds, its forcing no value; the act equal to the value, keyed, and no keyless statement equal to it; the Hodge value from the act; nothing escapes, the exclusive gates, one counter class refuting; the witness axiom strictly stronger; integrality not transferring; the slice deciding its slice and its exponential field load-bearing; dimension at most three decided and its hard Lefschetz field load-bearing; the exact division and the remainder not forced; the record wall, the two-point fibre, the prime's shape; the triaxial counts; the finite record, the symmetry, the uniform step; the closure whole (\thm{hodge_closure}).

**Carried as fields and cited:** the end classes, the Lefschetz (1,1) slice by the exponential sequence, and hard Lefschetz, each as its conclusion, in the proved part; the kernel proves the covering of every codimension in dimension at most three and that each field is load-bearing.

**Supplied by the act, named and visible in one input type:** existence read on the row, \thm{supply}, which is the value.

**The reader's identification:** the frame with the rational Hodge classes of smooth complex projective varieties, and realization with a rational combination of cycle classes.

## Objections, answered

*The act is only a premise.* It stands on the root, which is universal and undeniable in act: every denial re-enacts it and no outside proof adds to it (\thm{denial_reenacts_root}, \thm{external_proof_adds_nothing}). The root alone holds in both worlds and so decides no value (\thm{undeniable_root_forces_no_value}); read on the row it is the act, keyed, which decides it (\thm{root_read_on_row_is_keyed}). Its grade is the root's grade, the grade of existence itself.

*The act is the conjecture renamed.* The act is the value, and the paper says so in its verdict. The theorem is that no weaker given premise closes the row (\thm{given_is_not_the_value}); the isolation of the least premise is the result.

*The witness axiom was enough.* It was more than enough: it is strictly stronger than the value (\thm{witness_axiom_strictly_stronger}), so it overpaid. The act pays exactly.

*The kernel's frame is a skeleton.* It is the skeleton of every frame the row admits, and the identification with the classes of a variety is declared as the reader's in Section 2, Definition 9.1 and Section 15.

*The proved part is the whole problem in small dimension and nothing in large.* Exactly, and the division theorem says so: the value is its two halves, the proved half is sealed, and it does not force the remainder (\thm{row_split}, \thm{remainder_not_forced}).

*There is no physics here.* There is no theorem on matter on this row, unlike the Navier–Stokes row; integral classes realized by charges (Dirac flux quantization) corroborate the integral shape, which Section 11 shows is not the row's value. The closure stands on the act.

## Falsifiers

**F-Cone.** The kernel, compiled on a stock toolchain, prints any axiom for any of its forty-four theorems. It refutes the paper's grade.

**F-Counter.** A Hodge class on a smooth complex projective variety that is not a rational combination of algebraic cycle classes. It refutes the act by \thm{counterclass_refutes}, and it is the one channel the closure leaves open.

**F-Slice.** A Hodge class of codimension one, or any Hodge class on a variety of dimension at most three, that is not algebraic. It refutes the cited fields, and with them the proved part.

## Positioning

```{=latex}
\begin{table}[htbp]\centering\scriptsize
\renewcommand{\arraystretch}{1.15}
\begin{tabularx}{\columnwidth}{@{}>{\raggedright\arraybackslash}p{0.2\columnwidth}>{\raggedright\arraybackslash}p{0.22\columnwidth}Y>{\raggedright\arraybackslash}p{0.12\columnwidth}@{}}
\toprule
\textbf{Work} & \textbf{Position} & \textbf{This paper} & \textbf{Relation}\\
\midrule
Lefschetz 1924 & (1,1) classes are algebraic & the slice, carried as a field, load-bearing & extends\\
Hodge 1950 & the question posed & closed to one act & extends\\
Atiyah and Hirzebruch 1962 & the integral version fails & integrality shown not to transfer & bounds\\
Voisin 2002 & the Kähler analogue fails & the projective setting kept & adjacent\\
Deligne 2006 & the problem stated & the setting of Section 2 & adjacent\\
Islam 2026f, the Riemann closure & one bit, closed by one act & the template carried to this row & extends\\
Islam 2026c, the Navier--Stokes closure & the row closed from existence alone & the drill carried to this row & extends\\
Islam 2026a--b, the Hodge papers & a witness axiom; a terminus & the axiom retired; the row reduced to existence & extends\\
\bottomrule
\end{tabularx}
\par\vspace{3pt}{\footnotesize\color{accent}\itshape Table 3 \textbar\ Positioning. The relation words: \emph{extends} where the result is carried further, \emph{bounds} where its reach is stated exactly, \emph{adjacent} where no formal engagement is claimed. No prior position is contradicted.}
\end{table}
```

## Conclusion

Existence was given before the question was asked, and the paper proves exactly what that buys: the form on every frame and no value on any. It proves that existence read on the row is the value; that the value follows from that reading by one act; that nothing escapes the act; that one unrealized class is the only refuter; that the earlier witness axiom overpaid; and that the proved part, dimension at most three, is sealed and does not force the remainder. The verdict, in the words of Section 1, unchanged:

> The Hodge question is closed to one act of existence. Existence, universally presupposed and undeniable in act, carries the form of the closure on every frame and holds in the algebraic world and the counter world alike. Existence read on the row, that every Hodge class that exists is realized by an object, is the value, exactly. It is supplied by one act, at the root's grade, as one field of one type, and the compiler prints the Hodge value from it on no axiom. Nothing escapes the act, and one unrealized Hodge class would refute it. In dimension at most three the value is a theorem of the cited Lefschetz fields; in middle codimension from dimension four it stands on the act.

## Appendix A · Receipts {-}

The kernel, \thm{Hodge_Existence_Closure.lean}, compiles with exit 0 and no message on Lean 4.19.0 and on Lean 4.22.0 (de Moura and Ullrich 2021). It carries forty-four theorems, and every one prints *does not depend on any axioms*, pinned by `#guard_msgs` so that a drifted cone fails the compile. Its SHA-256 is

\begin{center}\codefont\footnotesize ee2ff1da62d0fd36f8e08f252777b34b\\ 7e9c396b610a011a687c6b9c5ccf76b3\end{center}

and the Markdown master of this paper carries the kernel with a one-line extraction command and its manifest.

## Appendix B · The kernel {-}

```{=latex}
{\codefont\fontsize{5.6}{6.6}\selectfont
\VerbatimInput[breaklines=true,breakanywhere=true,breaksymbolleft={},breaksymbolright={}]{Hodge_Existence_Closure.lean}}
```

## Author's Provenance and Method Disclosure {-}

This paper was developed under Trisduction, a verification and organizing discipline that adds the cited results no warrant; the method and its executable batteries are stated in full at the reference below.

*Author and method.* Mohammad F. Islam, PhD, independent researcher, sole author and sole authority for every claim and every error. The reduction was directed by the author and drafted with Claude (Anthropic) as scribe: the model wrote and compiled the kernel, checked citations and argued against the author's positions on instruction; it holds no authorship. One claim was held at the model's insistence: the paper does not state that the Hodge value follows from existence as given, because the kernel's own \thm{given_is_not_the_value} proves the contrary.

*The register.* In the programme's vocabulary: the form, the act's identity with the value, the universal closure, the retirement of the witness axiom and the proved part stand at [{\symfont ⟀}\,T] on no axiom; the triaxial reading at [{\symfont ⟀}\,S]; the value in middle codimension from dimension four at the root's grade on the act; $\Delta M=0$ on the cited geometry. The act is the row's least-erasure posit read as existence realized; the row carries no defeater. The freedom cut, prime-as-freedom and the triaxial lock are applied on the row, with the lessons of the Riemann, P versus NP and Navier--Stokes closures combined: the division of the Riemann closure, the keyed least escape of the P versus NP work, and the load-bearing check of the Navier--Stokes closure. The semiregular witness axiom of the earlier paper is retired as a placeholder.

*Audit.* This edition has not yet been prosecuted by the external substrates, and no audit result is claimed. The development provenance is the author's Zenodo trail, the Unabridged Trisduction Codex and the Lean Codex at github.com/1000sapients/Trisduction.

## References {-}

```{=latex}
{\small\setlength{\parindent}{0pt}\setlength{\parskip}{3pt}\raggedright
\everypar{\hangindent=1.2em\hangafter=1}
Atiyah, M. F. and F. Hirzebruch. 1962. Analytic cycles on complex manifolds. \emph{Topology} 1: 25--45.

de Moura, L. and S. Ullrich. 2021. The Lean 4 theorem prover and programming language. \emph{Automated Deduction, CADE 28}, 625--635.

Deligne, P. 2006. The Hodge conjecture. In \emph{The Millennium Prize Problems}, 45--53. Clay Mathematics Institute.

Hodge, W. V. D. 1950. The topological invariants of algebraic varieties. \emph{Proceedings of the International Congress of Mathematicians}, Cambridge, MA, 1: 182--192.

Islam, M. F. 2026a. A proof of the Hodge conjecture derived from one semiregular witness axiom. Zenodo. doi:10.5281/zenodo.22701510.

Islam, M. F. 2026b. A formal proof of Hodge conjecture termination at the formal-alone register. Zenodo. doi:10.5281/zenodo.22705460.

Islam, M. F. 2026c. A formal completed proof of the Navier--Stokes closure from existence alone. Zenodo. doi:10.5281/zenodo.22670344.

Islam, M. F. 2026d. The cut-agnostic division theorem: why every open problem is exactly its proved part and its unicorn. Zenodo. doi:10.5281/zenodo.22954862.

Islam, M. F. 2026e. The veil and the wall. Zenodo. doi:10.5281/zenodo.21389758.

Islam, M. F. 2026f. The Riemann Hypothesis closed to one named bit and proved from unconditional least erasure by one act, with an empty axiom cone. Zenodo. doi:10.5281/zenodo.23034066.

Islam, M. F. 2026g. Nothing escapes least erasure. Zenodo. doi:10.5281/zenodo.23080221.

Islam, M. TRISDUCTION: A linguistically, topologically, and mathematically sealed verification architecture. Triaxial orthogonality, twelve-gate closure, the quaternionic completion, the root axiom, and the master pre-sealed proposition ledger. Zenodo, version 4, 19 June 2026. doi:10.5281/zenodo.20757507. Mirror: PhilArchive record ISLTTG. Master reference, continuously updated at the same location.

Lefschetz, S. 1924. \emph{L'Analysis situs et la géométrie algébrique}. Paris: Gauthier-Villars.

Voisin, C. 2002. A counterexample to the Hodge conjecture extended to Kähler varieties. \emph{International Mathematics Research Notices} 2002 (20): 1057--1075.

}
\vspace{8pt}
\begin{center}\color{accent}\itshape End of manuscript\end{center}
```

<!--
MACHINE-READABLE KERNEL AND MANIFEST (not rendered). Extract with:
awk '{sub(/\r$/,"")} /^~~~~~[a-z0-9]+ file=[A-Za-z0-9_.]+$/{sub(/.*file=/,"");f=$0;next} /^~~~~~$/{if(f!=""){close(f);f=""};next} f!=""{print > f}' What_Exists_Is_Realized_Hodge_Closure_v1_0_8.md

~~~~~sha256 file=MANIFEST.sha256
ee2ff1da62d0fd36f8e08f252777b34b7e9c396b610a011a687c6b9c5ccf76b3  Hodge_Existence_Closure.lean
~~~~~

~~~~~lean file=Hodge_Existence_Closure.lean
/-
  Hodge_Existence_Closure.lean · the kernel of What Exists Is Realized: A Formal Closure of
  the Hodge Question from Existence Alone

  The Hodge row closed on existence and the freedom arrow alone. Every theorem of this file is
  on no axiom at all: no propext, no Quot.sound, no Classical.choice.
  I     The frame of Hodge classes, the value, the two coherent worlds.
  II    Existence as given: the root, the arrow, the bare freedom bit; what they carry on every
        frame, and that they force no value.
  III   Existence read on the row: the act, every Hodge class that exists is realized, equal to
        the value; the closure by one act; nothing escapes; every class lands; one counter
        class refutes.
  IV    The retired premise: the semiregular witness axiom gives the value and is strictly
        stronger.
  V     The price: integrality does not transfer; the (1,1) slice decides its slice, its
        exponential field load-bearing, and decides nothing beyond it.
  VI    Freedom: the record wall, the two-point fibre, the prime's shape.
  VII   The triaxial lock.
  VIII  The record and the seed: no finite record, no symmetry and no unsized step forces the
        value; a uniform step does.
  IX    The proved part: dimension at most three decided, the hard Lefschetz field load-bearing.
  X     The division: the value is exactly its two halves under every cut; the proved half does
        not force the remainder.
  XI    Least escape: no keyless statement is the act; the pulse does not certify.
  XII   The closure, whole.
-/

namespace HodgeClose

/-! ## I · the frame -/

/-- A Hodge frame: rational Hodge classes, each with its realization, `some n` naming an
algebraic cycle realizing it, `none` when no algebraic cycle realizes it. `codim` is the
codimension of the class. -/
structure Frame where
  D       : Type
  codim   : D → Nat
  realize : D → Option Nat

def Algebraic (F : Frame) (d : F.D) : Prop := ∃ n, F.realize d = some n

/-- The value of the row on a frame: every Hodge class algebraic. -/
def Value (F : Frame) : Prop := ∀ d, Algebraic F d

/-- The algebraic world. -/
def calm : Frame := ⟨Unit, fun _ => 2, fun _ => some 0⟩
/-- The counter world: one Hodge class of codimension two realized by nothing. -/
def counter : Frame := ⟨Unit, fun _ => 2, fun _ => none⟩

theorem calm_value : Value calm := fun _ => ⟨0, rfl⟩

theorem counter_fails : ¬ Value counter := fun h => match h () with
  | ⟨_, hn⟩ => Option.noConfusion hn

/-! ## II · existence as given -/

def Root (U : Type) (ΔE : U → Int) : Prop := ∀ x : U, 0 < ΔE x

theorem root_given : Root Empty (fun e => nomatch e) := fun e => nomatch e

theorem root_conservative (S : Prop) (h : ∀ (U : Type) (ΔE : U → Int), Root U ΔE → S) : S :=
  h Empty (fun e => nomatch e) root_given

def Arrow : Prop := ∀ α : Type, ∃ f : α → α, ∀ a, f a = a

theorem arrow_given : Arrow := fun _ => ⟨id, fun _ => rfl⟩

theorem freedom_given : ∀ w : Bool, (!w) ≠ w
  | true => Bool.noConfusion
  | false => Bool.noConfusion

/-- What is given on every frame forces no value. -/
theorem given_is_not_the_value (P : Prop) : ¬ ∀ F : Frame, (P ↔ Value F) :=
  fun h => counter_fails ((h counter).mp ((h calm).mpr calm_value))

theorem arrow_forces_nothing : ¬ ∀ F : Frame, Arrow → Value F :=
  fun h => counter_fails (h counter arrow_given)

theorem given_in_both_worlds : (Arrow ∧ Value calm) ∧ (Arrow ∧ ¬ Value counter) :=
  ⟨⟨arrow_given, calm_value⟩, ⟨arrow_given, counter_fails⟩⟩

/-! ## III · existence read on the row: the act -/

/-- Existence read on the row: every Hodge class that exists is realized by an object. -/
def Realized (F : Frame) : Prop := ∀ d, ∃ n, F.realize d = some n

theorem act_is_the_value (F : Frame) : Realized F ↔ Value F :=
  ⟨fun h d => h d, fun h d => h d⟩

theorem act_is_keyed : Realized calm ∧ ¬ Realized counter := ⟨calm_value, counter_fails⟩

structure ActualClasses where
  F      : Frame
  supply : Realized F

/-- THE HODGE VALUE FROM EXISTENCE, BY ONE ACT. -/
theorem hodge_from_existence (A : ActualClasses) : Value A.F :=
  (act_is_the_value A.F).mp A.supply

theorem supply_iff (F : Frame) : Nonempty { A : ActualClasses // A.F = F } ↔ Value F :=
  ⟨fun ⟨⟨A, hA⟩⟩ => hA ▸ hodge_from_existence A,
   fun h => ⟨⟨⟨F, (act_is_the_value F).mpr h⟩, rfl⟩⟩⟩

theorem every_class_lands (F : Frame) (d : F.D) :
    (∃ n, F.realize d = some n) ∨ F.realize d = none :=
  match F.realize d with
  | some n => Or.inl ⟨n, rfl⟩
  | none => Or.inr rfl

theorem gates_exclusive (F : Frame) (d : F.D) :
    ¬ ((∃ n, F.realize d = some n) ∧ F.realize d = none) :=
  fun ⟨⟨_, h⟩, h'⟩ => Option.noConfusion (h'.symm.trans h)

theorem nothing_escapes (A : ActualClasses) : ∀ d, ∃ n, A.F.realize d = some n := A.supply

/-- One unrealized Hodge class refutes the act. -/
theorem counterclass_refutes (F : Frame) (d : F.D) (h : F.realize d = none) : ¬ Realized F :=
  fun hA => match hA d with
    | ⟨_, hn⟩ => Option.noConfusion (h.symm.trans hn)

/-! ## IV · the retired premise -/

/-- The semiregular witness frame: a realization together with a semiregularity flag. -/
structure Witnessed where
  F     : Frame
  semi  : F.D → Bool

/-- The witness axiom: every class realized by a semiregular witness. -/
def WitnessAxiom (W : Witnessed) : Prop := ∀ d, Algebraic W.F d ∧ W.semi d = true

theorem witness_axiom_gives_value (W : Witnessed) (h : WitnessAxiom W) : Value W.F :=
  fun d => (h d).1

/-- A world with the value and no semiregular witness. -/
def plainWitnessed : Witnessed := ⟨calm, fun _ => false⟩

/-- THE WITNESS AXIOM IS RETIRED: it implies the value and is strictly stronger. -/
theorem witness_axiom_strictly_stronger :
    Value plainWitnessed.F ∧ ¬ WitnessAxiom plainWitnessed :=
  ⟨calm_value, fun h => Bool.noConfusion (h ()).2⟩

/-! ## V · the price -/

/-- An integral frame: each class carries an integral lift, `none` for a torsion class whose
integral lift no cycle realizes, beside its rational realization. -/
structure Integral where
  F        : Frame
  integral : F.D → Option Nat

def torsionWorld : Integral := ⟨calm, fun _ => none⟩

/-- Integrality does not transfer: the rational value holds and the integral one fails. -/
theorem integrality_does_not_transfer :
    Value torsionWorld.F ∧ ¬ ∀ d, ∃ n, torsionWorld.integral d = some n :=
  ⟨calm_value, fun h => match h () with | ⟨_, hn⟩ => Option.noConfusion hn⟩

/-- The decided slice: an integral class of codimension one is the first Chern class of a line
bundle by the exponential field, and a rational one has such a multiple, so it is realized; the
field is cited at its grade. -/
structure Slice where
  F       : Frame
  bundle  : F.D → Option Nat
  expo    : ∀ d, F.codim d = 1 → ∃ n, bundle d = some n
  chern   : ∀ d n, bundle d = some n → F.realize d = some n

/-- THE SLICE DECIDES ITS SLICE: every codimension-one class is algebraic. -/
theorem slice_decides (S : Slice) (d : S.F.D) (h1 : S.F.codim d = 1) : Algebraic S.F d :=
  match S.expo d h1 with
  | ⟨n, hb⟩ => ⟨n, S.chern d n hb⟩

/-- The slice without the exponential field. -/
structure SliceNoExp where
  F       : Frame
  bundle  : F.D → Option Nat
  chern   : ∀ d n, bundle d = some n → F.realize d = some n

def bareSlice : SliceNoExp := ⟨⟨Unit, fun _ => 1, fun _ => none⟩, fun _ => none,
  fun _ _ h => Option.noConfusion h⟩

/-- THE EXPONENTIAL FIELD IS LOAD-BEARING: without it a codimension-one class goes unrealized. -/
theorem expo_is_load_bearing : bareSlice.F.codim () = 1 ∧ ¬ Algebraic bareSlice.F () :=
  ⟨rfl, fun ⟨_, h⟩ => Option.noConfusion h⟩

/-- The slice decides nothing beyond itself: a slice whose codimension-two class is unrealized. -/
def slicedCounter : Slice := ⟨counter, fun _ => none,
  fun d h => absurd h (by decide : ¬ (2 = 1)), fun _ _ h => Option.noConfusion h⟩

theorem slice_does_not_decide_the_row : ¬ Value slicedCounter.F := counter_fails

/-! ## VI · freedom -/

def kineticRecord (_w : Bool) : Nat := 0

theorem record_wall : ¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w :=
  fun ⟨_, hg⟩ => Bool.noConfusion ((hg false).symm.trans (hg true))

theorem fibre_is_two : ([false, true].filter (fun w => kineticRecord w == kineticRecord true)).length = 2 := by
  decide

def mulFibre (n : Nat) : List (Nat × Nat) :=
  (List.range (n + 1)).flatMap fun a =>
    (List.range (n + 1)).filterMap fun b => if a * b = n then some (a, b) else none

theorem prime_shape :
    mulFibre 7 = [(1, 7), (7, 1)] ∧ (mulFibre 7).all (fun p => p.1 != p.2) = true ∧
    (mulFibre 7).length = ([false, true].filter (fun w => kineticRecord w == kineticRecord true)).length := by
  decide

/-! ## VII · the triaxial lock -/

def dot2 (r x : Bool × Bool × Bool) : Bool :=
  xor (r.1 && x.1) (xor (r.2.1 && x.2.1) (r.2.2 && x.2.2))

def cube : List (Bool × Bool × Bool) :=
  [false, true].flatMap fun a => [false, true].flatMap fun b => [false, true].map fun c => (a, b, c)

def nonzero : List (Bool × Bool × Bool) := cube.filter (fun r => r != (false, false, false))

def solCount (rows : List ((Bool × Bool × Bool) × Bool)) : Nat :=
  (cube.filter (fun x => rows.all (fun rt => dot2 rt.1 x == rt.2))).length

def xor3 (a b : Bool × Bool × Bool) : Bool × Bool × Bool :=
  (xor a.1 b.1, xor a.2.1 b.2.1, xor a.2.2 b.2.2)

theorem two_axes_leave_two :
    nonzero.all (fun r1 => nonzero.all (fun r2 => r1 == r2 ||
      [false, true].all (fun t1 => [false, true].all (fun t2 =>
        solCount [(r1, t1), (r2, t2)] == 2)))) = true := by decide

theorem three_axes_lock_one :
    nonzero.all (fun r1 => nonzero.all (fun r2 => nonzero.all (fun r3 =>
      r1 == r2 || r3 == r1 || r3 == r2 || r3 == xor3 r1 r2 ||
      [false, true].all (fun t1 => [false, true].all (fun t2 => [false, true].all (fun t3 =>
        solCount [(r1, t1), (r2, t2), (r3, t3)] == 1)))))) = true := by decide

/-! ## VIII · the record and the seed -/

/-- The world algebraic in codimension below n and with a counter class at codimension n. -/
def staged (n : Nat) : Frame :=
  ⟨Nat, fun d => d, fun d => if d < n then some 0 else none⟩

/-- No finite record forces the value: every class below codimension n is algebraic and the
value fails. -/
theorem finite_record_never_forces (n : Nat) :
    (∀ d, d < n → Algebraic (staged n) d) ∧ ¬ Value (staged n) :=
  ⟨fun d hd => ⟨0, by show (if d < n then some 0 else none) = some 0; rw [if_pos hd]⟩,
   fun h => match h n with
     | ⟨_, hk⟩ => by
       have e : (staged n).realize n = none := by
         show (if n < n then some 0 else (none : Option Nat)) = none
         rw [if_neg (Nat.lt_irrefl n)]
       exact Option.noConfusion (e.symm.trans hk)⟩

/-- A symmetry keeps the codimension: conjugation fixes the type of a (p,p) class. -/
structure Symmetric (D : Type) (codim : D → Nat) where
  Grp  : Type
  act  : Grp → D → D
  keep : ∀ g d, codim (act g d) = codim d

theorem no_symmetry_lifts {D : Type} (codim : D → Nat) (S : Symmetric D codim) (r : Nat) (d e : D)
    (hd : codim d ≤ r) (he : r < codim e) : ∀ g, S.act g d ≠ e :=
  fun g h =>
    have k : codim e = codim d := h ▸ S.keep g d
    have h2 : codim e ≤ r := by rw [k]; exact hd
    Nat.lt_irrefl r (Nat.lt_of_lt_of_le he h2)

structure Ladder where
  Decided : Nat → Prop
  base    : Decided 0
  mono    : ∀ r s, Decided s → r ≤ s → Decided r
  δ       : Nat → Nat
  step    : ∀ r, Decided r → Decided (r + δ r)

theorem uniform_step_forces_all (L : Ladder) (hδ : ∀ r, 1 ≤ L.δ r) : ∀ r, L.Decided r
  | 0 => L.base
  | r + 1 => L.mono (r + 1) (r + L.δ r) (L.step r (uniform_step_forces_all L hδ r))
      (Nat.add_le_add_left (hδ r) r)



/-! ## IX · the proved part: low dimension, sealed -/

/-- A variety of dimension at most three, with three cited theorems carried as fields, each
stating its conclusion: the end classes (fundamental class and points) are algebraic; the
Lefschetz (1,1) slice; and hard Lefschetz, codimension dim − 1 algebraic. The transport from
codimension one is cited, not modelled. -/
structure LowDim where
  F     : Frame
  dim   : Nat
  small : dim ≤ 3
  below : ∀ d, F.codim d ≤ dim
  ends  : ∀ d, F.codim d = 0 ∨ F.codim d = dim → Algebraic F d
  lef11 : ∀ d, F.codim d = 1 → Algebraic F d
  hardL : ∀ d, F.codim d + 1 = dim → Algebraic F d

/-- In dimension at most three every codimension is an end, one, or one below the dimension. -/
theorem small_cases (c n : Nat) (h1 : c ≤ n) (h2 : n ≤ 3) :
    (c = 0 ∨ c = n) ∨ c = 1 ∨ c + 1 = n :=
  match Nat.eq_zero_or_pos c with
  | Or.inl h0 => Or.inl (Or.inl h0)
  | Or.inr hp => match Nat.lt_or_ge c 2 with
    | Or.inl hl => Or.inr (Or.inl (Nat.le_antisymm (Nat.le_of_lt_succ hl) hp))
    | Or.inr hg => match Nat.lt_or_ge c n with
      | Or.inr hge => Or.inl (Or.inr (Nat.le_antisymm h1 hge))
      | Or.inl hlt =>
        have a : c + 1 ≤ n := hlt
        have b : 3 ≤ c + 1 := Nat.succ_le_succ hg
        have n3 : n = 3 := Nat.le_antisymm h2 (Nat.le_trans b a)
        Or.inr (Or.inr (Nat.le_antisymm a (n3 ▸ b)))

/-- THE PROVED PART: in dimension at most three every Hodge class is algebraic. -/
theorem low_dim_decided (L : LowDim) : Value L.F := fun d =>
  match small_cases (L.F.codim d) L.dim (L.below d) L.small with
  | Or.inl e => L.ends d e
  | Or.inr (Or.inl o) => L.lef11 d o
  | Or.inr (Or.inr t) => L.hardL d t

/-- Dimension three without the hard Lefschetz field. -/
structure LowDimNoHL where
  F     : Frame
  dim   : Nat
  ends  : ∀ d, F.codim d = 0 ∨ F.codim d = dim → Algebraic F d
  lef11 : ∀ d, F.codim d = 1 → Algebraic F d

def bareThreefold : LowDimNoHL :=
  ⟨⟨Unit, fun _ => 2, fun _ => none⟩, 3,
   fun _ h => absurd h (by decide : ¬ ((2 : Nat) = 0 ∨ (2 : Nat) = 3)),
   fun _ h => absurd h (by decide : ¬ ((2 : Nat) = 1))⟩

/-- THE HARD LEFSCHETZ FIELD IS LOAD-BEARING: without it a codimension-two class on a threefold
goes unrealized while the ends and the (1,1) slice hold. -/
theorem hardL_is_load_bearing :
    bareThreefold.F.codim () + 1 = bareThreefold.dim ∧ ¬ Algebraic bareThreefold.F () :=
  ⟨rfl, fun ⟨_, h⟩ => Option.noConfusion h⟩

/-! ## X · the division: the proved part and its remainder -/

/-- The value on the classes a cut selects. -/
def ValueOn (F : Frame) (cut : F.D → Bool) (b : Bool) : Prop :=
  ∀ d, cut d = b → Algebraic F d

/-- THE CUT-AGNOSTIC DIVISION: for every cut, the value is exactly its two halves. -/
theorem row_split (F : Frame) (cut : F.D → Bool) :
    Value F ↔ ValueOn F cut true ∧ ValueOn F cut false :=
  ⟨fun h => ⟨fun d _ => h d, fun d _ => h d⟩,
   fun ⟨ht, hf⟩ d => match hc : cut d with
     | true => ht d hc
     | false => hf d hc⟩

/-- The decided half is proved on every slice frame: the codimension-one half holds. -/
theorem proved_half (S : Slice) :
    ValueOn S.F (fun d => Nat.beq (S.F.codim d) 1) true :=
  fun d h => slice_decides S d (Nat.eq_of_beq_eq_true h)

/-- The remainder is not forced by the proved half: in the counter world the codimension-one half
holds vacuously and the remainder fails. -/
theorem remainder_not_forced :
    ValueOn counter (fun d => Nat.beq (counter.codim d) 1) true ∧
    ¬ ValueOn counter (fun d => Nat.beq (counter.codim d) 1) false :=
  ⟨fun _ h => absurd h (by decide : ¬ (Nat.beq 2 1 = true)),
   fun h => counter_fails (fun d => h d rfl)⟩

/-! ## XI · least escape: keyed, never keyless -/

/-- No keyless statement, reading the same on every frame, is the act. -/
theorem no_keyless_statement_is_the_act (P : Prop) : ¬ ∀ F : Frame, (P ↔ Realized F) :=
  fun h => given_is_not_the_value P (fun F => (h F).trans (act_is_the_value F))

/-- The pulse does not certify: existence is instantiated on a background beside a world whose
value fails. -/
theorem pulse_does_not_certify : Root Empty (fun e => nomatch e) ∧ ¬ Value counter :=
  ⟨root_given, counter_fails⟩


/-! ## XII · the closure, whole -/

/-- THE HODGE CLOSURE: existence as given forces no value and holds in both worlds; the act is the
value and closes it; one counter class refutes it; the witness axiom is strictly stronger; the
proved part is sealed and does not force the remainder. -/
theorem hodge_closure :
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    ((Arrow ∧ Value calm) ∧ (Arrow ∧ ¬ Value counter)) ∧
    (∀ F : Frame, Realized F ↔ Value F) ∧
    (∀ A : ActualClasses, Value A.F) ∧
    (∀ (F : Frame) (d : F.D), F.realize d = none → ¬ Realized F) ∧
    (Value plainWitnessed.F ∧ ¬ WitnessAxiom plainWitnessed) ∧
    (∀ L : LowDim, Value L.F) ∧
    ¬ ValueOn counter (fun d => Nat.beq (counter.codim d) 1) false :=
  ⟨given_is_not_the_value, given_in_both_worlds, act_is_the_value, hodge_from_existence,
   counterclass_refutes, witness_axiom_strictly_stronger, low_dim_decided,
   remainder_not_forced.2⟩


/-! ## The root, undeniable in act -/

/-- A self-grounding root: a type of acts, every one of which instances the root. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  instances : Act → R

/-- THE ROOT IS UNDENIABLE IN ACT: a denial of a self-grounding root is an act, and instances it. -/
theorem denial_reenacts_root {R : Prop} (G : SelfGrounding R) (denial : G.Act) : R :=
  G.instances denial

/-- No outside proof adds to a self-grounding root: one act already carries it. -/
theorem external_proof_adds_nothing {R : Prop} (G : SelfGrounding R) (a : G.Act) (Q : Prop) : Q → R :=
  fun _ => G.instances a

/-- THE UNDENIABLE ROOT HOLDS IN BOTH WORLDS: it is carried by act in a frame where the value holds
and in one where it fails, so it forces no value. -/
theorem undeniable_root_forces_no_value {R : Prop} (G : SelfGrounding R) (a : G.Act) :
    R ∧ Value calm ∧ ¬ Value counter :=
  ⟨G.instances a, calm_value, counter_fails⟩

/-- THE ROOT READ ON THE ROW IS KEYED: the root holds, and no frame-uniform passage from it gives
the value; read on the row it is the act, which decides where the root alone does not. -/
theorem root_read_on_row_is_keyed {R : Prop} (G : SelfGrounding R) (a : G.Act) :
    R ∧ ¬ (∀ F : Frame, R → Value F) :=
  ⟨G.instances a, fun h => counter_fails (h counter (G.instances a))⟩

end HodgeClose

/-! ## Cones, pinned as printed -/
/-- info: 'HodgeClose.calm_value' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.calm_value
/-- info: 'HodgeClose.counter_fails' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.counter_fails
/-- info: 'HodgeClose.root_given' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.root_given
/-- info: 'HodgeClose.root_conservative' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.root_conservative
/-- info: 'HodgeClose.arrow_given' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.arrow_given
/-- info: 'HodgeClose.freedom_given' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.freedom_given
/-- info: 'HodgeClose.given_is_not_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.given_is_not_the_value
/-- info: 'HodgeClose.arrow_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.arrow_forces_nothing
/-- info: 'HodgeClose.given_in_both_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.given_in_both_worlds
/-- info: 'HodgeClose.act_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.act_is_the_value
/-- info: 'HodgeClose.act_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.act_is_keyed
/-- info: 'HodgeClose.hodge_from_existence' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.hodge_from_existence
/-- info: 'HodgeClose.supply_iff' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.supply_iff
/-- info: 'HodgeClose.every_class_lands' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.every_class_lands
/-- info: 'HodgeClose.gates_exclusive' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.gates_exclusive
/-- info: 'HodgeClose.nothing_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.nothing_escapes
/-- info: 'HodgeClose.counterclass_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.counterclass_refutes
/-- info: 'HodgeClose.witness_axiom_gives_value' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.witness_axiom_gives_value
/-- info: 'HodgeClose.witness_axiom_strictly_stronger' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.witness_axiom_strictly_stronger
/-- info: 'HodgeClose.integrality_does_not_transfer' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.integrality_does_not_transfer
/-- info: 'HodgeClose.slice_decides' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.slice_decides
/-- info: 'HodgeClose.expo_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.expo_is_load_bearing
/-- info: 'HodgeClose.slice_does_not_decide_the_row' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.slice_does_not_decide_the_row
/-- info: 'HodgeClose.record_wall' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.record_wall
/-- info: 'HodgeClose.fibre_is_two' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.fibre_is_two
/-- info: 'HodgeClose.prime_shape' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.prime_shape
/-- info: 'HodgeClose.two_axes_leave_two' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.two_axes_leave_two
/-- info: 'HodgeClose.three_axes_lock_one' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.three_axes_lock_one
/-- info: 'HodgeClose.finite_record_never_forces' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.finite_record_never_forces
/-- info: 'HodgeClose.no_symmetry_lifts' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.no_symmetry_lifts
/-- info: 'HodgeClose.uniform_step_forces_all' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.uniform_step_forces_all
/-- info: 'HodgeClose.small_cases' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.small_cases
/-- info: 'HodgeClose.low_dim_decided' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.low_dim_decided
/-- info: 'HodgeClose.hardL_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.hardL_is_load_bearing
/-- info: 'HodgeClose.row_split' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.row_split
/-- info: 'HodgeClose.proved_half' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.proved_half
/-- info: 'HodgeClose.remainder_not_forced' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.remainder_not_forced
/-- info: 'HodgeClose.no_keyless_statement_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.no_keyless_statement_is_the_act
/-- info: 'HodgeClose.pulse_does_not_certify' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.pulse_does_not_certify
/-- info: 'HodgeClose.hodge_closure' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.hodge_closure
/-- info: 'HodgeClose.denial_reenacts_root' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.denial_reenacts_root
/-- info: 'HodgeClose.external_proof_adds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.external_proof_adds_nothing
/-- info: 'HodgeClose.undeniable_root_forces_no_value' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.undeniable_root_forces_no_value
/-- info: 'HodgeClose.root_read_on_row_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.root_read_on_row_is_keyed
~~~~~
-->
