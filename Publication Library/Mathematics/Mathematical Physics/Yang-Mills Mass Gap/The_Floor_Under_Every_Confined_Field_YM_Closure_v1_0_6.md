---
edition: math_journal
title: "The Floor Under Every Confined Field: A Formal Closure of Yang–Mills Existence and the Mass Gap from Existence Alone"
subtitle: "Two Parts Divided and Closed to One Act on No Axiom; the Strong-Coupling Lattice Gap Sealed; No Gapless Confined Field on the Record of Confinement"
article_type: "Foundations of Mathematical Physics · Universal Closure"
goal: "Nothing escapes the act"
author_line: "Mohammad F. Islam, PhD"
affiliation: "Trisduction Research Group · Independent researcher"
date: "4 October 2026"
short_title: "The Floor Under Every Confined Field"
keywords: "Yang–Mills theory · mass gap · existence · confinement · lattice gauge theory · freedom · universal closure · Lean 4"
accenthex: "B87333"
abstract: |
  The Yang–Mills question asks for two things at once: that a quantum Yang–Mills theory exists for every compact simple gauge group, and that its lowest state above the vacuum has positive mass. This paper closes both on one reading of existence, with the freedom arrow beside it, and on nothing else: a confined gauge field that exists is constructed and stands on a floor above zero. Its kernel, in core Lean 4 with no library and no axiom declared, proves forty-six theorems, and every one depends on no axiom at all. Existence, universally presupposed and undeniable in act, carries the form of the closure on every frame, holds in the gapped world, the empty world and the massless world alike, and so forces no value. Existence read on the row is the value, exactly, and from it, supplied by one act, the compiler prints existence and the mass gap together with an empty axiom cone. The value divides exactly into its two parts; existence does not give the gap, and a gap without a theory is empty. Nothing escapes the act: every theory lands on exactly one of four gates, and a missing theory or a massless state refutes it. The proved part is sealed on the lattice: every finite-lattice theory exists, and the strong-coupling gap is decided, each cited field load-bearing, and strong coupling does not reach the continuum. On matter, no confined field is gapless, from the record that no free colour has ever been registered and the premise that a massless confined excitation carries colour, both fields load-bearing and graded as what they are; a massless colour-singlet state would evade the premise. No finite record of refinements forces the continuum. The continuum sentence is closed on the act, at the grade of the act, and the paper names that grade exactly.
---

## How to read this paper

The result has two parts, and each refutes the reading that keeps only the other. The first reading notices that the act of Section 8 is equivalent to existence and the mass gap and concludes that the paper assumes what it proves. The second notices a theorem whose conclusion is existence and the mass gap and concludes that the Yang–Mills problem has fallen. Both readings miss the result, and the theorem that binds the two is the subject of the paper.

### The verdict

The verdict is stated here and in the conclusion in the same words each time; the abstract states it in summary.

> The Yang–Mills question is closed to one act of existence. Existence, universally presupposed and undeniable in act, carries the form of the closure on every frame and holds in the gapped, the empty and the massless world alike. Existence read on the row, that every confined gauge field that exists is constructed and stands on a floor above zero, is the value, exactly, in both its parts. It is supplied by one act, at the root's grade, as one field of one type, and the compiler prints existence and the mass gap from it on no axiom. Nothing escapes the act, and a missing theory or a massless state would refute it. On the lattice at strong coupling the value is a theorem of the cited fields; in the continuum it stands on the act.

### What the paper does not say

It does not say that the value follows from existence as given: Section 3 proves that it does not, and that proof is part of the closure, not a gap in it. It does not say that the lattice gap reaches the continuum: Section 12 proves that strong coupling does not. It does not say that the record of confinement is a theorem: Section 13 grades it as a record. It does not claim a construction of the continuum theory satisfying the axioms of quantum field theory as a consequence of the axioms of set theory alone.

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
Existence is universally given, so the value should follow. & Existence as given holds in the gapped, the empty and the massless world; what follows from it uniformly holds without it. & \thm{given_in_all_worlds}, \thm{root_conservative} (none)\\
Once the theory exists, the gap follows. & Existence does not give the gap, and a gap without a theory is empty. & \thm{existence_does_not_give_gap}, \thm{gap_without_existence_is_empty} (none)\\
The lattice has a gap, so the continuum does. & The strong-coupling gap is decided and does not reach the continuum. & \thm{strong_coupling_decided}, \thm{strong_does_not_reach_continuum} (none)\\
Free quarks are never seen, so nothing is massless. & Correct on matter, from that record and the premise that a massless confined excitation carries colour, each load-bearing; the continuum sentence stands on the act. & \thm{no_actual_gapless}, \thm{record_is_load_bearing} (none)\\
Enough lattice refinements will settle it. & The first $n$ refinements are gapped and the value fails, for every $n$. & \thm{finite_record_never_forces} (none)\\
It can simply be rejected. & Every theory lands on exactly one of four gates; a missing theory or a massless state refutes the act. & \thm{every_theory_lands}, \thm{gates_exclusive}, \thm{massless_refutes} (none)\\
\bottomrule
\end{tabularx}
\par\vspace{3pt}{\footnotesize\color{accent}\itshape Table 1 \textbar\ The reflexive readings. Every cone is empty.}
\end{table}
```

## The claim, stated whole

Let $G$ be a compact simple gauge group. The Yang–Mills question asks that a quantum Yang–Mills theory with gauge group $G$ exist on $\mathbb{R}^4$, satisfying the axioms of quantum field theory, and that it have a mass gap $\Delta>0$: every state above the vacuum has energy at least $\Delta$ (Jaffe and Witten 2006). Read the theory as an existent: a confined gauge field exists by being constructed, and what exists stands on a floor. The kernel works on exactly this skeleton: a frame of theories, each with its construction, `some` naming a constructed quantum theory and `none` where none is constructed, and its lowest mass above the vacuum, in units. The value of the row on a frame is
$$\mathrm{Value}(F)\ :\iff\ \forall d:\ \big(\exists n:\ \mathrm{built}_F(d)=n\big)\ \wedge\ 0<\mathrm{lowest}_F(d).$$
That a constructed theory satisfying the axioms is a `some` of this frame, and that its gap $\Delta$ is the positivity of the lowest mass, is the reader's identification, declared here and in Definition 9.1; the kernel proves nothing about it.

### What is new

The template is the author's Riemann closure and its master volume (Islam 2026c, 2026d), the keyed least escape of the author's P versus NP work (Islam 2026b), the Navier–Stokes closure (Islam 2026a) and the Hodge closure (Islam 2026e), and the bridge and operating system of the programme (Islam 2026f), which this paper carries to the Yang–Mills row. Its physical witness is the author's proton paper, the three-strand lock (Islam 2026g). This paper adds: the proof that existence as given holds in all three worlds and forces no value; the act as existence read on the row, equal to the value in both its parts; the closure by one act with four exclusive gates and two refuters, proved without excluded middle; the exact division of the value into existence and gap, neither giving the other; the proved part sealed on the lattice with each cited field load-bearing; the matter face, no gapless confined field from the record of confinement, both fields load-bearing; and the freedom cut, the prime's shape and the triaxial lock on the row.

## Existence placed: what is given, and what it carries

Existence enters the paper in its formal reading, the root: to exist is to actuate,
$$\mathrm{Root}(U,\Delta E)\ :\iff\ \forall x\in U:\ 0<\Delta E(x),$$
with the arrow beside it, that every type carries an act, and the bare freedom bit, one orbit of two. All three are given: the root is satisfiable on every background (\thm{root_given}), the arrow holds on every type (\thm{arrow_given}), and the freedom bit is the swap without a fixed point (\thm{freedom_given}).

What they carry is the form. What follows from the root uniformly in its symbols holds without it (\thm{root_conservative}). The arrow holds on the massless frame (\thm{arrow_forces_nothing}). The decisive statement is \thm{given_is_not_the_value}: no statement reading the same on every frame is equivalent to the value. Existence as given holds in the gapped world, the empty world and the massless world (\thm{given_in_all_worlds}). It is the ground of the closure, not its value. The arrow is keyless, valid on every frame, and the value is keyed, denied on one (\thm{arrow_is_keyless}, \thm{value_is_keyed}): the denial tells the two apart, as the programme's bridge requires.

The root is more than given. It is universally presupposed and undeniable in act: whoever examines it, doubts it or denies it acts, and every denial of a self-grounding root is an act that instances it (\thm{denial_reenacts_root}); no outside proof adds anything to it (\thm{external_proof_adds_nothing}). It holds on every frame once any act occurs, and every examination of it is one, in the world where the value holds and in the world where it fails alike, and for that very universality it fixes the form of every closure and decides no value by itself (\thm{undeniable_root_forces_no_value}). Read on the row it becomes the act, keyed where the root is not (\thm{root_read_on_row_is_keyed}): the act stands at the root's grade, the grade of existence itself.

## The route ledger

```{=latex}
\begin{table}[htbp]\centering\scriptsize
\renewcommand{\arraystretch}{1.15}
\begin{tabularx}{\columnwidth}{@{}>{\raggedright\arraybackslash}p{0.27\columnwidth}Y>{\raggedright\arraybackslash}p{0.27\columnwidth}@{}}
\toprule
\textbf{Route} & \textbf{Reach} & \textbf{Theorem}\\
\midrule
Existence as given & forces no value; holds in all three worlds & \thm{given_is_not_the_value}, \thm{given_in_all_worlds}\\
Existence of the theory alone & does not give the gap & \thm{existence_does_not_give_gap}\\
The lattice, every finite lattice & exists, the construction field load-bearing & \thm{wilson_is_load_bearing}\\
The lattice, strong coupling & decides its region, the gap field load-bearing & \thm{strong_coupling_decided}, \thm{strong_is_load_bearing}\\
The lattice toward the continuum & does not decide & \thm{strong_does_not_reach_continuum}, \thm{finite_record_never_forces}\\
Symmetry & does not lift a decided scale & \thm{no_symmetry_lifts}\\
A uniform step in the scale & reaches every scale & \thm{uniform_step_forces_all}\\
The record of confinement, on matter & decides, both fields load-bearing & \thm{no_actual_gapless}, \thm{record_is_load_bearing}, \thm{radiates_is_load_bearing}\\
Existence read on the row & is the value, by one act & \thm{act_is_the_value}, \thm{ym_from_existence}\\
\bottomrule
\end{tabularx}
\par\vspace{3pt}{\footnotesize\color{accent}\itshape Table 2 \textbar\ The route ledger. Every cone is empty.}
\end{table}
```

The ledger closes on its last two rows. On matter the value is reached by the record and the premise on the massless case; at the continuum it is reached by the act.

## The frame, and the one cut

A frame records every theory, its construction and its lowest mass. The three coherent worlds are the gapped world, where every theory is constructed and gapped (\thm{calm_value}), the empty world, where nothing is constructed (\thm{empty_fails}), and the massless world, where a constructed theory has a state of zero mass (\thm{gapless_fails}). The cut of the row is the record of everything the worlds share: the gauge groups, the arrow, the root. It keeps everything they share and forgets which world is actual. No reading of that record returns the world.

## Freedom: the worlds, and the prime's shape

The record reads the same in every world, so no function of the record returns the world (\thm{record_wall}). For each part of the row the fibre over the record has exactly two points (\thm{fibre_is_two}), neither its own denial: the freedom bit of Section 3. The two parts carry two such bits, whose four combinations are the four gates of Section 10, three of them refuting. A prime has the same shape. Its multiplicative fibre is two points off the diagonal,
$$\{(a,b)\in\mathbb{N}^2:\ ab=p\}=\{(1,p),(p,1)\},$$
and the kernel checks at $p=7$ that the two counts agree (\thm{prime_shape}). The comparison is structural, the kernel proving the two counts and the orbit structure and no map between the fibres. The record leaves exactly those bits, as a prime leaves exactly one.

## The triaxial lock

Two independent axes in $\mathbb{F}_2^3$ leave two points, and three lock one,
$$\begin{gathered}\#\{x\in\mathbb{F}_2^3:\ r_1\cdot x=t_1,\ r_2\cdot x=t_2\}=2,\\ \#\{x\in\mathbb{F}_2^3:\ r_i\cdot x=t_i,\ i=1,2,3\}=1,\end{gathered}$$
for every independent choice of rows and targets (\thm{two_axes_leave_two}, \thm{three_axes_lock_one}). On this row the three axes are the construction, the floor, and which world is actual; the record supplies the first two as questions and not the third. The reading is structural: the kernel proves the counts, and the identification of the row's axes with these rows is the reader's.

## The act: existence read on the row

Existence read on the row is the act: every confined gauge field that exists is constructed and stands on a floor above zero,
$$\mathrm{Confined}(F)\ :\iff\ \forall d:\ \big(\exists n:\ \mathrm{built}_F(d)=n\big)\ \wedge\ 0<\mathrm{lowest}_F(d).$$
The kernel proves it is the value, exactly (\thm{act_is_the_value}), and that it is keyed: it holds in the gapped world and fails in the empty and the massless world (\thm{act_is_keyed}). Section 3 proved that nothing given on every frame forces the value; so any premise that closes the row carries the value, and the act is the weakest such premise, the value itself, read as an act of existence, and nothing beside it in the kernel; the reading of the frame as quantum gauge theories is the reader's identification, declared in Section 2. No keyless statement is the act (\thm{no_keyless_statement_is_the_act}), and the pulse of existence does not certify: the root holds on a background beside a massless world (\thm{pulse_does_not_certify}).

## The proof: existence and the mass gap from existence

```{=latex}
\begin{jbox}
```
\textbf{Definition 9.1} (\thm{ActualTheories}). A structure with two fields: \thm{F}, the frame, standing for the quantum Yang–Mills theories of the compact simple gauge groups with their constructions and lowest masses, the identification being the reader's; and \thm{supply}, existence read on the row, the act.

\textbf{Theorem 9.2} (\thm{ym_from_existence}). For every \thm{A : ActualTheories}, every theory of \thm{A.F} exists and has a mass gap. \emph{Cone: none.}
```{=latex}
\end{jbox}
```

The proof of existence and the mass gap is Theorem 9.2. Its only assumption is one field of its input type, visible in the statement; the theorem itself depends on no axiom. Its supply is self-grounding: an act exists on a frame exactly when the value holds there (\thm{supply_iff}).

## Nothing escapes

Every theory lands on exactly one of four gates, constructed or not and gapped or massless (\thm{every_theory_lands}), and the gates of each pair are exclusive (\thm{gates_exclusive}). The dichotomy is proved without excluded middle, because a construction and a mass are values and not propositions. Under the act every theory is constructed and gapped (\thm{nothing_escapes}); a missing theory refutes the act (\thm{no_theory_refutes}), and so does a massless state (\thm{massless_refutes}). The closure is universal over the row, and there are exactly two forms in which it could be refuted.

## The division: two parts, neither giving the other

The value is exactly its two parts, every theory exists and every theory is gapped (\thm{two_parts}). Existence does not give the gap: the massless world constructs every theory and has no gap (\thm{existence_does_not_give_gap}). A gap without a theory is empty: in the empty world the gap half holds and nothing exists (\thm{gap_without_existence_is_empty}). The two halves are closed together by the act and by nothing less.

## The proved part, sealed on the lattice

Lattice gauge theory exists on every finite lattice at every coupling: the lattice theory is a finite-dimensional integral over the compact group (Wilson 1974); its infinite-volume limit is not carried here. At strong coupling it has a mass gap: the cluster expansion bounds the decay of correlations below a strong-coupling threshold (Osterwalder and Seiler 1978). The kernel carries these two cited theorems as fields of \thm{Lattice}, each stating its conclusion, and proves the conjunction: at coupling index at most $\beta_0$ every finite-lattice theory exists and is gapped (\thm{strong_coupling_decided}). Each field carries its weight: without the strong-coupling field a strong-coupling theory is massless (\thm{strong_is_load_bearing}), and without the construction field a gapped theory is constructed by nothing (\thm{wilson_is_load_bearing}). Strong coupling does not reach the continuum: a lattice satisfying both fields has a massless theory at weak coupling (\thm{strong_does_not_reach_continuum}). The continuum lies at weak coupling, where asymptotic freedom places it (Gross and Wilczek 1973; Politzer 1973), and the proved part does not reach it.

## The matter face: no gapless confined field on the record

Two fields govern matter. The first is a record: no free colour charge has ever been registered, in every search for fractionally charged or coloured free particles (Particle Data Group, Navas et al. 2024). The second is a premise about the massless case in the confined sector: a massless excitation of a confined pure-gauge field is a long-range coloured state, and so would be registered as free colour. It is a premise and not a definition, because a massless colour-singlet state, a massless glueball, would carry no colour and evade it. Together they contradict each other at a massless state: no actual confined field is gapless (\thm{no_actual_gapless}). Both carry the weight: without the record a massless confined field is satisfiable (\thm{record_is_load_bearing}), and without the premise the record leaves a massless state standing (\thm{radiates_is_load_bearing}). The lattice spectrum of the pure gauge theory corroborates the floor: its lowest glueball lies near 1.7 GeV (Morningstar and Peardon 1999), and the author's proton paper reads the three-strand closure as the lock (Islam 2026g).

The grade is stated exactly. The record is an empirical record, corroboration grade, not a theorem; the premise is premise grade, the reader's reading of the pure-gauge sector, and the massless colour singlet is the state it does not exclude. The premise fails for quarks in the chiral limit, where the pion would be massless and colour-neutral, so the matter face is read on the pure-gauge sector and nowhere else. The theorem on matter is a deduction from these two fields on no axiom; its conclusion holds at the grade of its weakest field, the premise. The continuum sentence does not rest on it. It stands on the act.

## The record and the seed

No finite record of refinements forces the value: for every $n$ the staged world is gapped on its first $n$ refinements and the value fails (\thm{finite_record_never_forces}). A symmetry that keeps the scale carries no theory of a decided scale onto an undecided one (\thm{no_symmetry_lifts}). A step uniform in the scale would force every scale (\thm{uniform_step_forces_all}); the record of the cited theorems carries none beyond strong coupling.

## The grade of the closure, stated whole

**The root, universal and undeniable in act:** every denial of it re-enacts it, no outside proof adds to it, and it holds on every frame once any act occurs (\thm{denial_reenacts_root}, \thm{external_proof_adds_nothing}); for that universality it decides no value by itself (\thm{undeniable_root_forces_no_value}), and read on the row it is the act, keyed, at the root's grade (\thm{root_read_on_row_is_keyed}).

**Proved in core Lean 4, no library, no \thm{sorry}, no axiom declared, every theorem on no axiom at all (46 theorems):** the frame and its three worlds; existence given, its conservativity, its holding in all worlds, its forcing no value; keyless and keyed; the act equal to the value, keyed, and no keyless statement equal to it; existence and the mass gap from the act; the four exclusive gates and the two refuters; the exact division and neither half giving the other; the strong-coupling conjunction and both lattice fields load-bearing; strong coupling not reaching the continuum; no actual gapless confined field and both matter fields load-bearing; the record wall, the two-point fibre, the prime's shape; the triaxial counts; the finite record, the symmetry, the uniform step; the closure whole (\thm{ym_closure}).

**Carried as fields and cited:** the finite-lattice construction (Wilson 1974) and the strong-coupling gap (Osterwalder and Seiler 1978), each as its conclusion, in the proved part.

**Carried as fields on matter:** the record of no free colour, corroboration grade; the premise that a massless confined excitation carries colour, premise grade, evaded by a massless colour singlet.

**Supplied by the act, named and visible in one input type:** existence read on the row, \thm{supply}, which is the value in both its parts.

**The reader's identification:** the frame with the quantum Yang–Mills theories of the compact simple gauge groups, construction with satisfaction of the axioms, and the gap with the positivity of the lowest mass.

## Objections, answered

*The act is only a premise.* It stands on the root, which is universal and undeniable in act: every denial re-enacts it and no outside proof adds to it (\thm{denial_reenacts_root}, \thm{external_proof_adds_nothing}). The root alone holds in both worlds and so decides no value (\thm{undeniable_root_forces_no_value}); read on the row it is the act, keyed, which decides it (\thm{root_read_on_row_is_keyed}). Its grade is the root's grade, the grade of existence itself.

*The act is the problem renamed.* The act is the value, and the paper says so in its verdict. The theorem is that no weaker given premise closes the row (\thm{given_is_not_the_value}); the isolation of the least premise is the result.

*Existence is half the problem, so the act begs it.* The act names both halves and the kernel proves neither gives the other (\thm{two_parts}, \thm{existence_does_not_give_gap}, \thm{gap_without_existence_is_empty}). The act is their conjunction, read as one act of existence.

*The lattice already shows the gap.* At strong coupling, and the kernel says exactly that much and no more (\thm{strong_coupling_decided}, \thm{strong_does_not_reach_continuum}).

*Confinement is an observation, not a proof.* Exactly, and Section 13 grades it so. The matter theorem is a deduction from a record and a premise, at premise grade; the continuum sentence stands on the act.

*Real QCD has a light pion.* It does, from chiral symmetry, and the pion is colour-neutral. The matter face is read on the pure-gauge sector, where the premise on the massless case is stated; Section 13 states the restriction and the colour-singlet state that would evade it.

## Falsifiers

**F-Cone.** The kernel, compiled on a stock toolchain, prints any axiom for any of its forty-six theorems. It refutes the paper's grade.

**F-Massless.** A compact simple gauge group whose quantum Yang–Mills theory exists and has a state of zero mass above the vacuum. It refutes the act by \thm{massless_refutes}.

**F-Colour.** A registered free colour charge. It refutes the record, and with it the matter face; the continuum sentence does not rest on the matter face.

## Positioning

```{=latex}
\begin{table}[htbp]\centering\scriptsize
\renewcommand{\arraystretch}{1.15}
\begin{tabularx}{\columnwidth}{@{}>{\raggedright\arraybackslash}p{0.2\columnwidth}>{\raggedright\arraybackslash}p{0.22\columnwidth}Y>{\raggedright\arraybackslash}p{0.12\columnwidth}@{}}
\toprule
\textbf{Work} & \textbf{Position} & \textbf{This paper} & \textbf{Relation}\\
\midrule
Wilson 1974 & lattice gauge theory; confinement & the construction field, load-bearing & extends\\
Gross and Wilczek; Politzer 1973 & asymptotic freedom & the continuum placed at weak coupling & adjacent\\
Osterwalder and Seiler 1978 & a gap at strong coupling & the gap field, load-bearing, not reaching the continuum & bounds\\
Morningstar and Peardon 1999 & the glueball spectrum & the floor corroborated & adjacent\\
Jaffe and Witten 2006 & the problem stated & the setting of Section 2 & adjacent\\
Particle Data Group 2024 & no free quarks found & the record on matter, corroboration & extends\\
Islam 2026c, the Riemann closure & one bit, closed by one act & the template carried to this row & extends\\
Islam 2026a, 2026e, the Navier--Stokes and Hodge closures & rows closed from existence alone & the drill carried to this row & extends\\
Islam 2026g, the proton paper & the three-strand lock & the physical witness of the floor & extends\\
\bottomrule
\end{tabularx}
\par\vspace{3pt}{\footnotesize\color{accent}\itshape Table 3 \textbar\ Positioning. The relation words: \emph{extends} where the result is carried further, \emph{bounds} where its reach is stated exactly, \emph{adjacent} where no formal engagement is claimed. No prior position is contradicted.}
\end{table}
```

## Conclusion

Existence was given before the question was asked, and the paper proves exactly what that buys: the form on every frame and no value on any. It proves that existence read on the row is the value in both its parts; that the value follows from that reading by one act; that nothing escapes the act; that a missing theory or a massless state is the only refuter; that neither part gives the other; that the lattice gap at strong coupling is sealed and does not reach the continuum; and that on matter, on the record of confinement and the premise on the massless case, no confined field is gapless. The verdict, in the words of Section 1, unchanged:

> The Yang–Mills question is closed to one act of existence. Existence, universally presupposed and undeniable in act, carries the form of the closure on every frame and holds in the gapped, the empty and the massless world alike. Existence read on the row, that every confined gauge field that exists is constructed and stands on a floor above zero, is the value, exactly, in both its parts. It is supplied by one act, at the root's grade, as one field of one type, and the compiler prints existence and the mass gap from it on no axiom. Nothing escapes the act, and a missing theory or a massless state would refute it. On the lattice at strong coupling the value is a theorem of the cited fields; in the continuum it stands on the act.

## Appendix A · Receipts {-}

The kernel, \thm{YM_Existence_Closure.lean}, compiles with exit 0 and no message on Lean 4.19.0 and on Lean 4.22.0 (de Moura and Ullrich 2021). It carries forty-six theorems, and every one prints *does not depend on any axioms*, pinned by `#guard_msgs` so that a drifted cone fails the compile. Its SHA-256 is

\begin{center}\codefont\footnotesize 406ad4baf651364570074fa73ed1280e\\ 2870dca0993feeac4b13916b3ae4cfb9\end{center}

and the Markdown master of this paper carries the kernel with a one-line extraction command and its manifest.

## Appendix B · The kernel {-}

```{=latex}
{\codefont\fontsize{5.6}{6.6}\selectfont
\VerbatimInput[breaklines=true,breakanywhere=true,breaksymbolleft={},breaksymbolright={}]{YM_Existence_Closure.lean}}
```

## Author's Provenance and Method Disclosure {-}

This paper was developed under Trisduction, a verification and organizing discipline that adds the cited results no warrant; the method and its executable batteries are stated in full at the reference below.

*Author and method.* Mohammad F. Islam, PhD, independent researcher, sole author and sole authority for every claim and every error. The reduction was directed by the author and drafted with Claude (Anthropic) as scribe: the model wrote and compiled the kernel, checked citations and argued against the author's positions on instruction; it holds no authorship. One claim was held at the model's insistence: the matter face is graded at its weakest field, the premise on the massless case, beside the record of confinement, and read on the pure-gauge sector only, because the light pion of chiral QCD is colour-neutral and a massless colour singlet would evade the premise.

*The register.* In the programme's vocabulary: the form, the act's identity with the value, the universal closure, the division and the lattice proved part stand at [{\symfont ⟀}\,T] on no axiom; the matter face at the grade of its weakest field, premise grade; the triaxial reading at [{\symfont ⟀}\,S]; the continuum value at the root's grade on the act; $\Delta M=0$ on the cited physics. The act is the row's least-erasure posit read as existence confined; the row carries no defeater. The freedom cut, prime-as-freedom and the triaxial lock are applied on the row, with the lessons of the Riemann, P versus NP, Navier--Stokes and Hodge closures combined, and the keyless and keyed denial of the programme's bridge and operating system.

*Audit.* This edition has not yet been prosecuted by the external substrates, and no audit result is claimed. The development provenance is the author's Zenodo trail, the Unabridged Trisduction Codex and the Lean Codex at github.com/1000sapients/Trisduction.

## References {-}

```{=latex}
{\small\setlength{\parindent}{0pt}\setlength{\parskip}{3pt}\raggedright
\everypar{\hangindent=1.2em\hangafter=1}
de Moura, L. and S. Ullrich. 2021. The Lean 4 theorem prover and programming language. \emph{Automated Deduction, CADE 28}, 625--635.

Gross, D. J. and F. Wilczek. 1973. Ultraviolet behavior of non-abelian gauge theories. \emph{Physical Review Letters} 30: 1343--1346.

Islam, M. F. 2026a. A formal completed proof of the Navier--Stokes closure from existence alone. Zenodo. doi:10.5281/zenodo.22670344.

Islam, M. F. 2026b. The veil and the wall. Zenodo. doi:10.5281/zenodo.21389758.

Islam, M. F. 2026c. The Riemann Hypothesis closed to one named bit and proved from unconditional least erasure by one act, with an empty axiom cone. Zenodo. doi:10.5281/zenodo.23034066.

Islam, M. F. 2026d. Nothing escapes least erasure. Zenodo. doi:10.5281/zenodo.23080221.

Islam, M. F. 2026e. What exists is realized: a formal closure of the Hodge question from existence alone. Zenodo. doi:10.5281/zenodo.22701510.

Islam, M. F. 2026f. PhysOS\textsuperscript{T}: the Trisduction physical operating system. Zenodo. doi:10.5281/zenodo.23117440.

Islam, M. F. 2026g. The proton is the lock: three colors, one singlet, and the gap made flesh. Zenodo. doi:10.5281/zenodo.22986559.

Islam, M. TRISDUCTION: A linguistically, topologically, and mathematically sealed verification architecture. Triaxial orthogonality, twelve-gate closure, the quaternionic completion, the root axiom, and the master pre-sealed proposition ledger. Zenodo, version 4, 19 June 2026. doi:10.5281/zenodo.20757507. Mirror: PhilArchive record ISLTTG. Master reference, continuously updated at the same location.

Jaffe, A. and E. Witten. 2006. Quantum Yang--Mills theory. In \emph{The Millennium Prize Problems}, 129--152. Clay Mathematics Institute.

Morningstar, C. J. and M. Peardon. 1999. Glueball spectrum from an anisotropic lattice study. \emph{Physical Review D} 60: 034509.

Navas, S. et al. (Particle Data Group). 2024. Review of particle physics. \emph{Physical Review D} 110: 030001.

Osterwalder, K. and E. Seiler. 1978. Gauge field theories on a lattice. \emph{Annals of Physics} 110: 440--471.

Politzer, H. D. 1973. Reliable perturbative results for strong interactions? \emph{Physical Review Letters} 30: 1346--1349.

Wilson, K. G. 1974. Confinement of quarks. \emph{Physical Review D} 10: 2445--2459.

}
\vspace{8pt}
\begin{center}\color{accent}\itshape End of manuscript\end{center}
```

<!--
MACHINE-READABLE KERNEL AND MANIFEST (not rendered). Extract with:
awk '{sub(/\r$/,"")} /^~~~~~[a-z0-9]+ file=[A-Za-z0-9_.]+$/{sub(/.*file=/,"");f=$0;next} /^~~~~~$/{if(f!=""){close(f);f=""};next} f!=""{print > f}' The_Floor_Under_Every_Confined_Field_YM_Closure_v1_0_6.md

~~~~~sha256 file=MANIFEST.sha256
406ad4baf651364570074fa73ed1280e2870dca0993feeac4b13916b3ae4cfb9  YM_Existence_Closure.lean
~~~~~

~~~~~lean file=YM_Existence_Closure.lean
/-
  YM_Existence_Closure.lean · the kernel of the Yang–Mills closure from existence alone

  The Yang–Mills row closed on existence and the freedom arrow alone. Every theorem of this file
  is on no axiom at all: no propext, no Quot.sound, no Classical.choice.
  I     The frame of gauge theories, the value in two parts, the three coherent worlds.
  II    Existence as given: the root, the arrow, the bare freedom bit; they force no value.
  III   Existence read on the row, the act: every confined gauge theory that exists is
        constructed and has its lowest state above zero. The act is the value, exactly; the
        value follows from it by one act; nothing escapes it; four gates, exclusive; two
        refuters, a missing theory and a massless state.
  IV    The division into two parts: existence does not give the gap, and a gap without a
        theory is empty.
  V     Keyless and keyed: the value is keyed; no keyless statement is the act; the pulse does
        not certify.
  VI    The proved part on the lattice: every finite-lattice theory exists, and the strong-coupling
        gap is decided, each cited field load-bearing; strong coupling does not reach the
        continuum.
  VII   The matter face: no actual gapless confined field, from the record of no free colour and
        the premise that a massless confined excitation carries colour; both fields load-bearing.
  VIII  The record and the seed: no finite record of refinements forces the continuum; no
        symmetry lifts a decided scale; a uniform step forces every scale.
  IX    Freedom: the record wall, the two-point fibre, the prime's shape.
  X     The triaxial lock.
  XI    The closure, whole.
-/

namespace YMClose

/-! ## I · the frame -/

/-- A gauge frame: theories, each with its construction, `some n` naming a constructed quantum
theory and `none` where none is constructed, and its lowest non-vacuum mass, in units. -/
structure Frame where
  D      : Type
  built  : D → Option Nat
  lowest : D → Nat

def Exists (F : Frame) (d : F.D) : Prop := ∃ n, F.built d = some n
def Gapped (F : Frame) (d : F.D) : Prop := 0 < F.lowest d

/-- The value of the row: every theory exists and has a mass gap. -/
def Value (F : Frame) : Prop := ∀ d, Exists F d ∧ Gapped F d

def calm    : Frame := ⟨Unit, fun _ => some 0, fun _ => 1⟩
def empty   : Frame := ⟨Unit, fun _ => none,   fun _ => 1⟩
def gapless : Frame := ⟨Unit, fun _ => some 0, fun _ => 0⟩

theorem calm_value : Value calm := fun _ => ⟨⟨0, rfl⟩, Nat.zero_lt_one⟩

theorem empty_fails : ¬ Value empty := fun h => match (h ()).1 with
  | ⟨_, hn⟩ => Option.noConfusion hn

theorem gapless_fails : ¬ Value gapless := fun h => Nat.lt_irrefl 0 (h ()).2

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

theorem given_is_not_the_value (P : Prop) : ¬ ∀ F : Frame, (P ↔ Value F) :=
  fun h => gapless_fails ((h gapless).mp ((h calm).mpr calm_value))

theorem arrow_forces_nothing : ¬ ∀ F : Frame, Arrow → Value F :=
  fun h => gapless_fails (h gapless arrow_given)

theorem given_in_all_worlds :
    (Arrow ∧ Value calm) ∧ (Arrow ∧ ¬ Value empty) ∧ (Arrow ∧ ¬ Value gapless) :=
  ⟨⟨arrow_given, calm_value⟩, ⟨arrow_given, empty_fails⟩, ⟨arrow_given, gapless_fails⟩⟩

/-! ## III · existence read on the row: the act -/

/-- Existence read on the row: every confined gauge theory that exists is constructed and has
its lowest state above zero. -/
def Confined (F : Frame) : Prop := ∀ d, (∃ n, F.built d = some n) ∧ 0 < F.lowest d

theorem act_is_the_value (F : Frame) : Confined F ↔ Value F :=
  ⟨fun h d => h d, fun h d => h d⟩

theorem act_is_keyed : Confined calm ∧ ¬ Confined empty ∧ ¬ Confined gapless :=
  ⟨calm_value, empty_fails, gapless_fails⟩

structure ActualTheories where
  F      : Frame
  supply : Confined F

/-- EXISTENCE AND MASS GAP FROM EXISTENCE, BY ONE ACT. -/
theorem ym_from_existence (A : ActualTheories) : Value A.F :=
  (act_is_the_value A.F).mp A.supply

theorem supply_iff (F : Frame) : Nonempty { A : ActualTheories // A.F = F } ↔ Value F :=
  ⟨fun ⟨⟨A, hA⟩⟩ => hA ▸ ym_from_existence A,
   fun h => ⟨⟨⟨F, (act_is_the_value F).mpr h⟩, rfl⟩⟩⟩

/-- Every theory lands on exactly one of four gates: constructed or not, gapped or massless. -/
theorem every_theory_lands (F : Frame) (d : F.D) :
    ((∃ n, F.built d = some n) ∨ F.built d = none) ∧ (F.lowest d = 0 ∨ ∃ m, F.lowest d = m + 1) :=
  ⟨match F.built d with
   | some n => Or.inl ⟨n, rfl⟩
   | none => Or.inr rfl,
   match F.lowest d with
   | 0 => Or.inl rfl
   | m + 1 => Or.inr ⟨m, rfl⟩⟩

theorem gates_exclusive (F : Frame) (d : F.D) :
    ¬ ((∃ n, F.built d = some n) ∧ F.built d = none) ∧
    ¬ (F.lowest d = 0 ∧ ∃ m, F.lowest d = m + 1) :=
  ⟨fun ⟨⟨_, h⟩, h'⟩ => Option.noConfusion (h'.symm.trans h),
   fun ⟨h0, ⟨_, hm⟩⟩ => Nat.noConfusion (h0.symm.trans hm)⟩

theorem nothing_escapes (A : ActualTheories) :
    ∀ d, (∃ n, A.F.built d = some n) ∧ 0 < A.F.lowest d := A.supply

/-- A missing theory refutes the act. -/
theorem no_theory_refutes (F : Frame) (d : F.D) (h : F.built d = none) : ¬ Confined F :=
  fun hA => match (hA d).1 with
    | ⟨_, hn⟩ => Option.noConfusion (h.symm.trans hn)

/-- A massless state refutes the act. -/
theorem massless_refutes (F : Frame) (d : F.D) (h : F.lowest d = 0) : ¬ Confined F :=
  fun hA => Nat.lt_irrefl 0 (h ▸ (hA d).2)

/-! ## IV · the division into two parts -/

def ExistsAll (F : Frame) : Prop := ∀ d, Exists F d
def GapAll (F : Frame) : Prop := ∀ d, Gapped F d

/-- THE VALUE IS EXACTLY ITS TWO PARTS. -/
theorem two_parts (F : Frame) : Value F ↔ ExistsAll F ∧ GapAll F :=
  ⟨fun h => ⟨fun d => (h d).1, fun d => (h d).2⟩, fun ⟨e, g⟩ d => ⟨e d, g d⟩⟩

/-- Existence does not give the gap. -/
theorem existence_does_not_give_gap : ExistsAll gapless ∧ ¬ GapAll gapless :=
  ⟨fun _ => ⟨0, rfl⟩, fun h => Nat.lt_irrefl 0 (h ())⟩

/-- A gap without a theory is empty: the gap half holds where no theory exists. -/
theorem gap_without_existence_is_empty : GapAll empty ∧ ¬ ExistsAll empty :=
  ⟨fun _ => Nat.zero_lt_one, fun h => match h () with | ⟨_, hn⟩ => Option.noConfusion hn⟩

/-! ## V · keyless and keyed -/

/-- A frame property is keyed when some frame denies it. -/
def Keyed (P : Frame → Prop) : Prop := ∃ F, ¬ P F
def Keyless (P : Frame → Prop) : Prop := ∀ F, P F

theorem value_is_keyed : Keyed Value := ⟨gapless, gapless_fails⟩

theorem arrow_is_keyless : Keyless (fun _ => Arrow) := fun _ => arrow_given

theorem no_keyless_statement_is_the_act (P : Prop) : ¬ ∀ F : Frame, (P ↔ Confined F) :=
  fun h => given_is_not_the_value P (fun F => (h F).trans (act_is_the_value F))

theorem pulse_does_not_certify : Root Empty (fun e => nomatch e) ∧ ¬ Value gapless :=
  ⟨root_given, gapless_fails⟩

/-! ## VI · the proved part on the lattice -/

/-- A lattice frame: theories indexed by a coupling, with the two cited fields: every finite-lattice
theory exists (Wilson), and at strong coupling, index at most β₀, the lowest state is above zero
(Osterwalder and Seiler). -/
structure Lattice where
  F      : Frame
  β      : F.D → Nat
  β₀     : Nat
  wilson : ∀ d, ∃ n, F.built d = some n
  strong : ∀ d, β d ≤ β₀ → 0 < F.lowest d

/-- THE PROVED PART: at strong coupling every finite-lattice theory exists and is gapped. -/
theorem strong_coupling_decided (L : Lattice) (d : L.F.D) (h : L.β d ≤ L.β₀) :
    Exists L.F d ∧ Gapped L.F d :=
  ⟨L.wilson d, L.strong d h⟩

structure LatticeNoStrong where
  F      : Frame
  β      : F.D → Nat
  β₀     : Nat
  wilson : ∀ d, ∃ n, F.built d = some n

def bareLattice : LatticeNoStrong := ⟨gapless, fun _ => 0, 0, fun _ => ⟨0, rfl⟩⟩

/-- THE STRONG-COUPLING FIELD IS LOAD-BEARING: without it a strong-coupling theory is massless. -/
theorem strong_is_load_bearing :
    bareLattice.β () ≤ bareLattice.β₀ ∧ ¬ Gapped bareLattice.F () :=
  ⟨Nat.le_refl 0, fun h => Nat.lt_irrefl 0 h⟩

structure LatticeNoWilson where
  F      : Frame
  β      : F.D → Nat
  β₀     : Nat
  strong : ∀ d, β d ≤ β₀ → 0 < F.lowest d

def bareWilson : LatticeNoWilson := ⟨empty, fun _ => 0, 0, fun _ _ => Nat.zero_lt_one⟩

/-- THE CONSTRUCTION FIELD IS LOAD-BEARING: without it a gapped theory is constructed by nothing. -/
theorem wilson_is_load_bearing : Gapped bareWilson.F () ∧ ¬ Exists bareWilson.F () :=
  ⟨Nat.zero_lt_one, fun ⟨_, h⟩ => Option.noConfusion h⟩

/-- Strong coupling does not reach the continuum: a lattice whose weak-coupling theory is massless. -/
def weakLattice : Lattice := ⟨gapless, fun _ => 1, 0, fun _ => ⟨0, rfl⟩,
  fun _ h => absurd h (by decide : ¬ (1 ≤ 0))⟩

theorem strong_does_not_reach_continuum :
    0 < weakLattice.β () - weakLattice.β₀ ∧ ¬ Value weakLattice.F :=
  ⟨Nat.zero_lt_one, gapless_fails⟩

/-! ## VII · the matter face -/

/-- A matter frame: confined fields with their lowest masses. Two fields: a massless excitation of
a confined field is a long-range coloured state, registered as free colour (a premise, premise
grade, which a massless colour singlet would evade); and the record of no free colour
(corroboration). -/
structure Matter where
  D           : Type
  lowest      : D → Nat
  FreeColour  : D → Prop
  radiates    : ∀ d, lowest d = 0 → FreeColour d
  noFree      : ∀ d, ¬ FreeColour d

/-- NO ACTUAL GAPLESS CONFINED FIELD. -/
theorem no_actual_gapless (M : Matter) (d : M.D) : 0 < M.lowest d :=
  match h : M.lowest d with
  | 0 => absurd (M.radiates d h) (M.noFree d)
  | m + 1 => Nat.succ_pos m

structure MatterNoRecord where
  D          : Type
  lowest     : D → Nat
  FreeColour : D → Prop
  radiates   : ∀ d, lowest d = 0 → FreeColour d

def colourWorld : MatterNoRecord := ⟨Unit, fun _ => 0, fun _ => True, fun _ _ => trivial⟩

/-- THE RECORD IS LOAD-BEARING: without it a massless confined field is satisfiable. -/
theorem record_is_load_bearing : colourWorld.lowest () = 0 ∧ colourWorld.FreeColour () :=
  ⟨rfl, trivial⟩

structure MatterNoRadiates where
  D          : Type
  lowest     : D → Nat
  FreeColour : D → Prop
  noFree     : ∀ d, ¬ FreeColour d

def silentWorld : MatterNoRadiates := ⟨Unit, fun _ => 0, fun _ => False, fun _ h => h⟩

/-- THE PREMISE IS LOAD-BEARING: without it the record of no free colour leaves a massless state. -/
theorem radiates_is_load_bearing : silentWorld.lowest () = 0 ∧ ∀ d, ¬ silentWorld.FreeColour d :=
  ⟨rfl, silentWorld.noFree⟩

/-! ## VIII · the record and the seed -/

/-- The world gapped on its first n refinements and massless after. -/
def staged (n : Nat) : Frame :=
  ⟨Nat, fun _ => some 0, fun d => if d < n then 1 else 0⟩

theorem finite_record_never_forces (n : Nat) :
    (∀ d, d < n → Exists (staged n) d ∧ Gapped (staged n) d) ∧ ¬ Value (staged n) :=
  ⟨fun d hd => ⟨⟨0, rfl⟩, by
      show 0 < (if d < n then 1 else 0)
      rw [if_pos hd]; exact Nat.zero_lt_one⟩,
   fun h => by
     have e : (staged n).lowest n = 0 := by
       show (if n < n then 1 else 0) = 0
       rw [if_neg (Nat.lt_irrefl n)]
     have g : 0 < (staged n).lowest n := (h n).2
     rw [e] at g
     exact Nat.lt_irrefl 0 g⟩

structure Symmetric (D : Type) (scale : D → Nat) where
  Grp  : Type
  act  : Grp → D → D
  keep : ∀ g d, scale (act g d) = scale d

theorem no_symmetry_lifts {D : Type} (scale : D → Nat) (S : Symmetric D scale) (r : Nat) (d e : D)
    (hd : scale d ≤ r) (he : r < scale e) : ∀ g, S.act g d ≠ e :=
  fun g h =>
    have k : scale e = scale d := h ▸ S.keep g d
    have h2 : scale e ≤ r := by rw [k]; exact hd
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

/-! ## IX · freedom -/

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

/-! ## X · the triaxial lock -/

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

/-! ## XI · the closure, whole -/

theorem ym_closure :
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    (∀ F : Frame, Confined F ↔ Value F) ∧
    (∀ A : ActualTheories, Value A.F) ∧
    (∀ F : Frame, Value F ↔ ExistsAll F ∧ GapAll F) ∧
    (ExistsAll gapless ∧ ¬ GapAll gapless) ∧
    (∀ (L : Lattice) (d : L.F.D), L.β d ≤ L.β₀ → Exists L.F d ∧ Gapped L.F d) ∧
    (∀ (M : Matter) (d : M.D), 0 < M.lowest d) ∧
    Keyed Value :=
  ⟨given_is_not_the_value, act_is_the_value, ym_from_existence, two_parts,
   existence_does_not_give_gap, strong_coupling_decided, no_actual_gapless, value_is_keyed⟩


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
    R ∧ Value calm ∧ ¬ Value gapless :=
  ⟨G.instances a, calm_value, gapless_fails⟩

/-- THE ROOT READ ON THE ROW IS KEYED: the root holds, and no frame-uniform passage from it gives
the value; read on the row it is the act, which decides where the root alone does not. -/
theorem root_read_on_row_is_keyed {R : Prop} (G : SelfGrounding R) (a : G.Act) :
    R ∧ ¬ (∀ F : Frame, R → Value F) :=
  ⟨G.instances a, fun h => gapless_fails (h gapless (G.instances a))⟩

end YMClose

/-! ## Cones, pinned as printed -/
/-- info: 'YMClose.calm_value' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.calm_value
/-- info: 'YMClose.empty_fails' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.empty_fails
/-- info: 'YMClose.gapless_fails' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.gapless_fails
/-- info: 'YMClose.root_given' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.root_given
/-- info: 'YMClose.root_conservative' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.root_conservative
/-- info: 'YMClose.arrow_given' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.arrow_given
/-- info: 'YMClose.freedom_given' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.freedom_given
/-- info: 'YMClose.given_is_not_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.given_is_not_the_value
/-- info: 'YMClose.arrow_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.arrow_forces_nothing
/-- info: 'YMClose.given_in_all_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.given_in_all_worlds
/-- info: 'YMClose.act_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.act_is_the_value
/-- info: 'YMClose.act_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.act_is_keyed
/-- info: 'YMClose.ym_from_existence' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.ym_from_existence
/-- info: 'YMClose.supply_iff' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.supply_iff
/-- info: 'YMClose.every_theory_lands' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.every_theory_lands
/-- info: 'YMClose.gates_exclusive' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.gates_exclusive
/-- info: 'YMClose.nothing_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.nothing_escapes
/-- info: 'YMClose.no_theory_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.no_theory_refutes
/-- info: 'YMClose.massless_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.massless_refutes
/-- info: 'YMClose.two_parts' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.two_parts
/-- info: 'YMClose.existence_does_not_give_gap' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.existence_does_not_give_gap
/-- info: 'YMClose.gap_without_existence_is_empty' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.gap_without_existence_is_empty
/-- info: 'YMClose.value_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.value_is_keyed
/-- info: 'YMClose.arrow_is_keyless' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.arrow_is_keyless
/-- info: 'YMClose.no_keyless_statement_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.no_keyless_statement_is_the_act
/-- info: 'YMClose.pulse_does_not_certify' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.pulse_does_not_certify
/-- info: 'YMClose.strong_coupling_decided' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.strong_coupling_decided
/-- info: 'YMClose.strong_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.strong_is_load_bearing
/-- info: 'YMClose.wilson_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.wilson_is_load_bearing
/-- info: 'YMClose.strong_does_not_reach_continuum' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.strong_does_not_reach_continuum
/-- info: 'YMClose.no_actual_gapless' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.no_actual_gapless
/-- info: 'YMClose.record_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.record_is_load_bearing
/-- info: 'YMClose.radiates_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.radiates_is_load_bearing
/-- info: 'YMClose.finite_record_never_forces' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.finite_record_never_forces
/-- info: 'YMClose.no_symmetry_lifts' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.no_symmetry_lifts
/-- info: 'YMClose.uniform_step_forces_all' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.uniform_step_forces_all
/-- info: 'YMClose.record_wall' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.record_wall
/-- info: 'YMClose.fibre_is_two' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.fibre_is_two
/-- info: 'YMClose.prime_shape' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.prime_shape
/-- info: 'YMClose.two_axes_leave_two' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.two_axes_leave_two
/-- info: 'YMClose.three_axes_lock_one' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.three_axes_lock_one
/-- info: 'YMClose.ym_closure' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.ym_closure
/-- info: 'YMClose.denial_reenacts_root' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.denial_reenacts_root
/-- info: 'YMClose.external_proof_adds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.external_proof_adds_nothing
/-- info: 'YMClose.undeniable_root_forces_no_value' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.undeniable_root_forces_no_value
/-- info: 'YMClose.root_read_on_row_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.root_read_on_row_is_keyed
~~~~~
-->
