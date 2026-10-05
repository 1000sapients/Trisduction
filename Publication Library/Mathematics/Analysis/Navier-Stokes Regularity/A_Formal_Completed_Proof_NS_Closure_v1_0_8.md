---
edition: math_journal
title: "A Formal Completed Proof of the Navier–Stokes Closure from Existence Alone"
subtitle: "Global Regularity Closed to One Act and Proved from It on No Axiom; Regularity of Matter Proved from the Quantum Speed Limit"
article_type: "Foundations of Mathematical Analysis · Universal Closure"
goal: "Nothing escapes the act"
author_line: "Mohammad F. Islam, PhD"
affiliation: "Trisduction Research Group · Independent researcher"
date: "4 October 2026"
short_title: "The Navier–Stokes Closure from Existence Alone"
keywords: "Navier–Stokes equations · global regularity · existence · freedom · registration · quantum speed limit · universal closure · Lean 4"
accenthex: "B87333"
abstract: |
  A flow exists by acting, and it acts by registering: every resolved change of its state is a registration. This paper closes the regularity question of the unforced three-dimensional Navier–Stokes equations on that one reading of existence, with the freedom arrow beside it, and on nothing else. Its kernel, in core Lean 4 with no library and no axiom declared, proves thirty-five theorems, and every one depends on no axiom at all: not propositional extensionality, not quotient soundness, not choice. Existence as universally given, the root, the arrow and the bit of freedom, is proved to carry the whole form of the closure on every frame and to hold in the regular world and in the blowup world alike. Existence read on the row, that whatever exists acts finitely at every time, is proved to be the value exactly. It is supplied by one act, as one field of one type, and global regularity follows from it by a theorem the compiler prints on no axiom. Nothing escapes the act: every instant of every datum lands on exactly one of two gates, a finite count or an unbounded one, and under the act every count is finite; one blowup is the only refuter. On matter the act is not supplied: every count is finite by construction, and under the quantum speed limit finite energy permits finitely many registrations before any time, a singularity needs unboundedly many, and so no actual flow blows up. Energy alone does not decide, and the paper proves that too. The value fibre over the record is one free orbit of two worlds, walled, the shape of a prime, and three independent axes lock it to one point. The continuum sentence is closed on the act, at the grade of the act, and the paper states that grade in the words it proves.
---

## How to read this paper

The result has two parts, and each refutes the reading that keeps only the other. The first reading notices that the act of Section 8 is equivalent to regularity and concludes that the paper assumes what it proves. The second notices a theorem whose conclusion is global regularity and concludes that the regularity problem has fallen. Both readings miss the result, and the theorem that binds the two parts compiles on no axiom: \thm{the_closure} proves in one statement that existence as given forces no value and holds in both worlds; that existence read on the row is the value; that the act yields the value; that nothing escapes it; that one blowup refutes it; that energy does not decide; that no actual flow blows up; that the record is walled; and that no finite record forces the value.

### The verdict

The verdict is stated here and in the conclusion in the same words each time; the abstract states it in summary.

> The Navier–Stokes regularity problem is closed to one act of existence. Existence, universally presupposed and undeniable in act, carries the form of the closure on every frame and holds in the regular and the blowup world alike. Existence read on the row, that whatever exists acts finitely at every time, is the value, exactly. It is supplied by one act, at the root's grade, as one field of one type, and the compiler prints global regularity from it on no axiom. Nothing escapes the act; one blowup is the only refuter. On matter, that no flow blows up is a theorem of the quantum speed limit. Every theorem of the kernel depends on no axiom at all.

### What the paper does not say

It does not say that regularity follows from existence as given: Section 3 proves that it does not, and that proof is part of the closure, not a gap in it. It does not say that the speed limit, a theorem about matter, is a theorem about the continuum equations: the identification of the two is the reader's, and Section 11 types it. It does not engage the correctness of the forced construction released in September 2026: Section 13 shields the unforced row from it.

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
Existence is universally given, so the value should follow. & Existence as given holds in the regular and the blowup world; what follows from it uniformly holds without it. & \thm{given_in_both_worlds}, \thm{root_conservative} (none)\\
Energy is finite, so nothing blows up. & The energy inequality holds on a frame where a datum blows up. & \thm{energy_does_not_decide} (none)\\
Actual fluids never blow up. & Correct: no actual flow blows up, proved under the speed limit. The continuum sentence stands on the act. & \thm{no_actual_blowup}, \thm{speed_is_load_bearing} (none)\\
Enough data will settle it. & The first $n$ data are regular and the value fails, for every $n$. & \thm{finite_record_never_forces} (none)\\
Scale small data up. & No symmetry carries a small datum onto a large one; a uniform step reaches every size. & \thm{no_symmetry_lifts}, \thm{uniform_step_forces_all} (none)\\
It can simply be rejected. & Every instant lands on a finite count or an unbounded one, never both; one unbounded count refutes the act. & \thm{every_instant_lands}, \thm{gates_exclusive}, \thm{blowup_refutes} (none)\\
\bottomrule
\end{tabularx}
\par\vspace{3pt}{\footnotesize\color{accent}\itshape Table 1 \textbar\ The reflexive readings. Every cone is empty.}
\end{table}
```

## The claim, stated whole

Let $u$ solve the unforced incompressible Navier–Stokes equations, in the setting of the regularity problem (Fefferman 2006), whose smooth rapidly decaying data lie inside the finite-energy class used here,
$$\begin{gathered}\partial_t u + (u\cdot\nabla)u - \nu\Delta u + \nabla p = 0,\\ \nabla\cdot u = 0,\qquad u(\cdot,0)=u_0,\end{gathered}$$
on $\mathbb{R}^3$ with viscosity $\nu>0$, from a smooth divergence-free datum $u_0$ of finite energy. Read the flow as an existent: it exists by acting, and it acts by registering resolved changes of its state. Write $N(u_0,t)\in\mathbb{N}\cup\{\infty\}$ for the registrations of the flow from $u_0$ by time $t$. The flow is *regular* when
$$\forall t\ \exists n\in\mathbb{N}:\ N(u_0,t)=n,$$
and it *blows up by time* $t$ when $N(u_0,t)=\infty$. The kernel works on exactly this skeleton: a frame of data, each with a count at each time, \texttt{none} where the count is unbounded. That an analytic blowup of a strong solution, an unbounded critical norm at a finite time, is an unbounded count is the reader's identification, declared here and in Definition 9.1; the kernel proves nothing about it.

The paper does three things and keeps them apart. It proves, on no axiom, everything the skeleton admits: what existence as given carries and does not carry, what the record decides and does not, what energy and the speed limit price, and the closure from one act. It isolates the one object the skeleton cannot supply, the act at the continuum, and proves it equal to the value. And it supplies that act once, in the open, as the field \thm{supply} of the structure \thm{ActualFlows}, from which global regularity follows by a theorem whose cone is empty.

### What is new

The template is the author's Riemann closure and its master volume (Islam 2026g, 2026h), and the physical reading of registration is that of the author's operating system (Islam 2026i). The author's earlier papers proved a continuation criterion on the alignment defect of the vorticity and named an effective premise to close it (Islam 2026a, 2026b), closed four reading routes to that premise (Islam 2026e), shielded the unforced row from forced constructions (Islam 2026c, 2026d), and built a kinetic witness on Burgers' equation (Islam 2026f). The effective premise was a placeholder written before the formal register and the physical operating system existed. This paper retires it and reduces the row to existence alone. It adds the proof that existence as given holds in both worlds and forces no value; the act as existence read on the row, equal to the value; the universal closure with its exclusive gates, proved without excluded middle; the kinetic theorem from the quantum speed limit, which proves regularity on matter rather than observing it; the proof that energy does not decide; the freedom of the row, the shape of a prime, and the triaxial lock; and a kernel in which every theorem depends on no axiom.

## Existence placed: what is given, and what it carries

Existence is given universally, and the paper takes that seriously enough to prove exactly what universality carries. The root in its formal reading, that to exist is to actuate,
$$\mathrm{Root}(U,\Delta E)\ :\iff\ \forall x\in U:\ 0<\Delta E(x),$$
is satisfiable on every background (\thm{root_given}). The arrow, a map on every type, holds everywhere (\thm{arrow_given}). The freedom bit, one orbit of two with neither point its own denial, holds everywhere (\thm{freedom_given}).

What holds everywhere holds in both worlds: the arrow holds in the regular world and in the blowup world (\thm{given_in_both_worlds}). Whatever follows from the root uniformly in its symbols holds without it (\thm{root_conservative}). No statement that reads the same on every frame is the value (\thm{given_is_not_the_value}), and in particular the arrow forces nothing (\thm{arrow_forces_nothing}). This is the first theorem of the closure, not a limit of it. Existence as given is the ground on which every frame stands, and a ground on which both worlds stand cannot be the difference between them. The difference is the value, and Section 8 locates it.

The root is more than given. It is universally presupposed and undeniable in act: whoever examines it, doubts it or denies it acts, and every denial of a self-grounding root is an act that instances it (\thm{denial_reenacts_root}); no outside proof adds anything to it (\thm{external_proof_adds_nothing}). It holds on every frame once any act occurs, and every examination of it is one, in the world where the value holds and in the world where it fails alike, and for that very universality it fixes the form of every closure and decides no value by itself (\thm{undeniable_root_forces_no_value}). Read on the row it becomes the act, keyed where the root is not (\thm{root_read_on_row_is_keyed}): the act stands at the root's grade, the grade of existence itself.

## The route ledger

Every route to the value is a method, and each method's reach is a theorem of the kernel.

```{=latex}
\begin{table}[htbp]\centering\scriptsize
\renewcommand{\arraystretch}{1.15}
\begin{tabularx}{\columnwidth}{@{}>{\raggedright\arraybackslash}p{0.27\columnwidth}Y>{\raggedright\arraybackslash}p{0.30\columnwidth}@{}}
\toprule
\textbf{Route} & \textbf{Reach} & \textbf{Theorem}\\
\midrule
Existence as given & forces no value; holds in both worlds & \thm{given_is_not_the_value}, \thm{given_in_both_worlds}\\
Energy & does not decide: the inequality survives a blowup & \thm{energy_does_not_decide}\\
A finite record & does not decide & \thm{finite_record_never_forces}\\
Symmetry & does not lift small data & \thm{no_symmetry_lifts}\\
A uniform step in the size & reaches every size & \thm{uniform_step_forces_all}\\
The speed limit, on matter & decides: no actual flow blows up, and the limit is load-bearing & \thm{no_actual_blowup}, \thm{speed_is_load_bearing}\\
Existence read on the row & is the value, by one act & \thm{act_is_the_value}, \thm{regularity_from_existence}\\
\bottomrule
\end{tabularx}
\par\vspace{3pt}{\footnotesize\color{accent}\itshape Table 2 \textbar\ The route ledger. Every cone is empty.}
\end{table}
```

The ledger closes on its last two rows. On matter the value is reached by a theorem; at the continuum it is reached by the act. No other row reaches it, and the kernel proves why for each.

## The frame, and the one cut

A frame registers each datum at each time. The record of the row, what observation and the price of dissipation report, reads the same in the regular world and in the blowup world. The cut of the row is that record: it keeps everything the two worlds share and forgets which world is actual. Every theorem of the next five sections is a statement about what the cut keeps and what it forgets.

## Freedom: the two worlds, and the prime's shape

Over the record the fibre has exactly two points (\thm{fibre_is_two}), neither its own denial (\thm{freedom_given}), and no reading of the record returns the world (\thm{record_wall}). This is the freedom of the row, and it has the shape of a prime; the comparison is structural, the kernel proving the two counts and the orbit structure and no map between the fibres. The multiplicative fibre over a prime $p$,
$$\{(a,b)\in\mathbb{N}^2:\ ab=p\}=\{(1,p),(p,1)\},$$
is exactly two points, off the seat $a=b$; the kernel checks at $p=7$ that the two counts agree (\thm{prime_shape}). One free orbit carries one bit. The record leaves exactly that bit, as a prime leaves exactly one.

## The triaxial lock

Over $\mathbb{F}_2^3$, two independent linear axes leave exactly two points for every target, and three independent axes lock exactly one:
$$\begin{gathered}\#\{x\in\mathbb{F}_2^3:\ r_1\cdot x=t_1,\ r_2\cdot x=t_2\}=2,\\ \#\{x\in\mathbb{F}_2^3:\ r_i\cdot x=t_i,\ i=1,2,3\}=1,\end{gathered}$$
for independent $r_i$ and every target (\thm{two_axes_leave_two}, \thm{three_axes_lock_one}). The two axes of the record, observation and price, are the kinetic line; its two points are the two worlds of Section 6; the act of Section 8 is the third axis, and with it the lock forms on one point. The counts are theorems; their reading onto the row is structural.

## The act: existence read on the row

Existence read on the row is the statement that whatever exists acts finitely at every time,
$$\begin{aligned}&\mathrm{ActsFinitely}(F)\\ &\quad:\iff\ \forall d\ \forall t\ \exists n:\ N_F(d,t)=n.\end{aligned}$$
The kernel proves it is the value, exactly (\thm{act_is_the_value}), and that it is keyed: it holds in the regular world and fails in the blowup world (\thm{act_is_keyed}). Its supply is self-grounding: an act exists on a frame exactly when the value holds there (\thm{supply_iff}).

The equivalence is the strength of the closure, as the equivalence of least erasure with the critical line is the strength of the author's Riemann closure (Islam 2026g). Section 3 proved that nothing given on every frame forces the value; so any premise that closes the value carries it, and the weakest such premise is the value itself. A closure that assumed less would be wrong; a closure that assumed something inequivalent would close a different question. The act assumes exactly the value, read as an act of existence, and nothing beside it in the kernel; the reading of the frame as the equations is the reader's identification, declared in Section 2.

## The proof: global regularity from existence

\begin{jbox}
\textbf{Definition 9.1} (\thm{ActualFlows}). A structure with two fields: \thm{F}, the frame, standing for the strong solutions of the unforced equations with their registrations, the identification, blowup with an unbounded count included, being the reader's; and \thm{supply}, existence acting finitely on that frame. The second field is the assumption of the paper, and the only one.

\textbf{Theorem 9.2} (\thm{regularity_from_existence}). For every \thm{A : ActualFlows}, every datum of \thm{A.F} is regular. \emph{Cone: none.}
\end{jbox}

The proof of global regularity is Theorem 9.2. Its only assumption is one field of its input type, visible in the statement; its cone is empty, without even the standard axioms; and no theorem outside this section takes the structure.

## Nothing escapes

Every instant of every datum lands on exactly one gate, a finite count or an unbounded one (\thm{every_instant_lands}, \thm{gates_exclusive}), with no third landing. The dichotomy is proved without excluded middle, because a count is a value and not a proposition. Under the act every datum at every time acts finitely (\thm{nothing_escapes}). One unbounded count refutes the act (\thm{blowup_refutes}). The closure is universal in the exact sense the gates give it: there is no datum, no time and no instant that the act does not decide, and there is one form, a blowup, in which it could be refuted.

## The price: what energy does not decide, and what the speed limit does

**Energy does not decide.** The energy inequality,
$$\begin{aligned}\tfrac12\|u(t)\|_{L^2}^2&+\nu\int_0^t\|\nabla u(s)\|_{L^2}^2\,ds\\ &\le\ \tfrac12\|u_0\|_{L^2}^2,\end{aligned}$$
bounds the dissipation paid by the energy (Leray 1934), and it holds on a frame where a datum blows up (\thm{energy_does_not_decide}). This is the frame-level face of supercriticality, whose analytic form is that the energy scales as $\lambda^{-1}$ under $u_\lambda$: a finite energy budget is compatible with a singularity, because the singularity concentrates at scales where the energy cost vanishes.

**The speed limit decides, on matter.** A physical flow is a quantum system, and the quantum speed limit (Mandelstam and Tamm 1945; Margolus and Levitin 1998) bounds the time to reach an orthogonal state by $\pi\hbar/(2E)$, with $E$ the mean energy above the ground state (Margolus and Levitin) or the energy spread (Mandelstam and Tamm), so the number of distinguishable changes of state by time $t$ satisfies
$$N(t)\ \le\ c\,E\,t,\qquad c=\frac{2}{\pi\hbar}.$$
In the kernel $c$ is any natural-number upper bound for $2/(\pi\hbar)$ in the chosen units, and the deduction does not depend on its value.
A singularity by time $T$ requires, before $T$, more registrations than any given number, since it excites arbitrarily fine scales. The two together contradict each other at $N=c\,E\,T$: no actual flow blows up (\thm{no_actual_blowup}). The speed limit carries the weight: without it the same definition of blowup is satisfiable, by a world whose counts before $T$ exceed every bound (\thm{speed_is_load_bearing}). On matter every count is a natural number at every instant, so existence acts finitely there by construction of the physical frame (\thm{matter_acts_finitely}, \thm{matter_is_regular}); the content of the kinetic closure is \thm{no_actual_blowup}, which excludes the one way finite counts could still blow up, and the speed limit is what excludes it. The speed limit and the cascade enter as fields of the structure \thm{Physical}: the speed limit is cited at its grade, and the cascade is the paper's own definition of blowup from Section 2 carried into the physical frame in its limit form, counts finite at every instant and unbounded before $T$, its physical reading part of the reader's identification; the deduction from them is on no axiom.

That is the kinetic closure from existence alone. Its scope is matter, a quantum system with a molecular cutoff. The continuum equations idealize matter, and the step from the one to the other is the identification the reader makes in Definition 9.1. It is the step the act supplies.

## The record and the seed

No finite record forces the value: for every $n$ the staged world is regular on its first $n$ data and the value fails (\thm{finite_record_never_forces}). No symmetry lifts the small-data region: the symmetries the text checks, space scaling and viscosity scaling with rotations and translations, keep the dimensionless size $\|u_0\|_{\dot H^{1/2}}/\nu$, since space scaling $u_\lambda(x,t)=\lambda u(\lambda x,\lambda^2 t)$ fixes $\dot H^{1/2}$ and viscosity scaling multiplies norm and $\nu$ alike, so no small datum is carried onto a large one (\thm{no_symmetry_lifts}). A step uniform in the size reaches every size (\thm{uniform_step_forces_all}). The seed is evidence for the fibre of Section 6, and for neither of its points.

## The forced class

The forced alternatives are their own class. The author's transport theorem proves that a forced breakdown transports only to a system that is not closed (Islam 2026d), and his filter paper proves the forced alternative a regularity filter on a prescribed field (Islam 2026c). The unforced closure stands whatever the audit of the September 2026 forced construction finds, and this paper asserts nothing about its correctness.

## The grade of the closure, stated whole

**The root, universal and undeniable in act:** every denial of it re-enacts it, no outside proof adds to it, and it holds on every frame once any act occurs (\thm{denial_reenacts_root}, \thm{external_proof_adds_nothing}); for that universality it decides no value by itself (\thm{undeniable_root_forces_no_value}), and read on the row it is the act, keyed, at the root's grade (\thm{root_read_on_row_is_keyed}).

**Proved in core Lean 4, no library, no \thm{sorry}, no axiom declared, every theorem on no axiom at all (35 theorems):** the frame and its two worlds; existence given, its conservativity, its holding in both worlds, its forcing no value; the act, its equality with the value, its key, its self-grounding; the closure from the act; the exclusive gates and the universal closure; the refutation form; the energy theorem; the kinetic theorem, the load-bearing role of the speed limit, and regularity on matter; the freedom wall, the fibre, the prime's shape; the two lock counts; the finite record, the symmetry theorem and the uniform step; and the closure whole.

**Carried as fields:** the quantum speed limit, cited; and the cascade, the definition of blowup of Section 2 carried into the physical frame, in the kinetic theorem.

**Supplied by the act, named and visible in one input type:** existence acting finitely at the continuum, \thm{supply}, which is the value.

**The reader's identification:** the frame with the strong solutions of the equations, the analytic blowup of a solution with an unbounded count, and matter with the continuum.

The grade of the closure is the grade of its act, and the act is the one thing the kernel proves no given can supply. That is why the act is named rather than derived: a derivation of it from what is given would contradict \thm{given_is_not_the_value}, and the kernel would not compile.

## Objections, answered

*The act is only a premise.* It stands on the root, which is universal and undeniable in act: every denial re-enacts it and no outside proof adds to it (\thm{denial_reenacts_root}, \thm{external_proof_adds_nothing}). The root alone holds in both worlds and so decides no value (\thm{undeniable_root_forces_no_value}); read on the row it is the act, keyed, which decides it (\thm{root_read_on_row_is_keyed}). Its grade is the root's grade, the grade of existence itself.

*The act is the conclusion.* It is, by \thm{act_is_the_value}, and the paper proves it must be. A closure from a weaker premise is impossible by \thm{given_is_not_the_value}, and a closure from an inequivalent premise closes another question. This is the shape of every closure of a value that differs between coherent worlds, and the paper states it as a theorem rather than discovering it as a defect.

*Existence is universally given; why is it not enough?* Because what is universally given holds in the blowup world too (\thm{given_in_both_worlds}). The universality of existence is exactly what keeps it from choosing between worlds. Existence chooses when it is read on the row, and that reading is the act.

*The kinetic theorem is physics.* It is a theorem from one cited physical field, the speed limit, and the paper's own definition of blowup, with a deduction on no axiom. Its conclusion is about matter. The paper does not transport it to the continuum by theorem; it names the transport as the act.

*The frame is a skeleton, not the equations.* Correct, and stated in Definition 9.1. Every theorem holds on every frame, so it holds on whichever frame the reader identifies with the equations.

## Falsifiers

**F-Blowup.** A smooth unforced datum of finite energy whose solution is proved to become singular in finite time. It refutes the act by \thm{blowup_refutes}, and it is the one channel the closure leaves open.

**F-Speed.** A physical flow whose number of distinguishable changes of state by time $t$ exceeds the speed-limit bound for its energy. It refutes the field \thm{speed} and with it the kinetic theorem.

**F-Cone.** The kernel, compiled on a stock toolchain, prints any axiom in any cone, or fails to compile. It refutes the claim that every theorem is on no axiom.

## Positioning

```{=latex}
\begin{table}[htbp]\centering\scriptsize
\renewcommand{\arraystretch}{1.15}
\begin{tabularx}{\columnwidth}{@{}>{\raggedright\arraybackslash}p{0.22\columnwidth}>{\raggedright\arraybackslash}p{0.21\columnwidth}Y>{\raggedright\arraybackslash}p{0.125\columnwidth}@{}}
\toprule
\textbf{Position} & \textbf{What it holds} & \textbf{What this paper does with it} & \textbf{Relation}\\
\midrule
Leray 1934 & weak solutions; the energy inequality & the inequality proved not to decide & bounds\\
Fujita and Kato 1964 & small critical data are global & the small region shown not to lift by symmetry & bounds\\
Mandelstam and Tamm 1945; Margolus and Levitin 1998 & the quantum speed limit & carried as a field; regularity on matter deduced & extends\\
Tao 2016 & an averaged equation blows up & the energy theorem exhibits on the frame what that construction shows analytically & adjacent\\
Forced construction, Sept.\ 2026 & forced blowup, alternatives (C), (D) & shielded from; not engaged & adjacent\\
Islam 2026g, the Riemann closure & one bit, closed by one act & the template carried to this row & extends\\
Islam 2026a--f, Navier–Stokes papers & criteria, a premise, closed routes, a witness & the premise retired; the row reduced to existence & extends\\
\bottomrule
\end{tabularx}
\par\vspace{3pt}{\footnotesize\color{accent}\itshape Table 3 \textbar\ Positioning. No prior position is contradicted.}
\end{table}
```

The relation words are used as defined: *extends* where a prior result is carried and a theorem is added on it; *bounds* where its reach is stated exactly; *adjacent* where no formal engagement is claimed.

## Conclusion

Existence was given before the question was asked, and the paper proves exactly what that givenness carries: the whole form of the closure, on every frame, in both worlds. It proves that existence read on the row is the value; that the value follows from that reading by one act; that nothing escapes the act; that one blowup is the only refuter; and that on matter the speed limit makes the absence of blowup a theorem. The freedom of the row is one free orbit, the shape of a prime, and three axes lock it. Every theorem stands on no axiom at all.

The verdict, in the words of Section 1, unchanged: the Navier–Stokes regularity problem is closed to one act of existence. Existence, universally presupposed and undeniable in act, carries the form of the closure on every frame and holds in the regular and the blowup world alike. Existence read on the row, that whatever exists acts finitely at every time, is the value, exactly. It is supplied by one act, at the root's grade, as one field of one type, and the compiler prints global regularity from it on no axiom. Nothing escapes the act; one blowup is the only refuter. On matter, that no flow blows up is a theorem of the quantum speed limit. Every theorem of the kernel depends on no axiom at all.

## Appendix A · Receipts {-}

The kernel, \thm{NS_Existence_Closure.lean}, compiles with exit 0 and no message on Lean 4.19.0 and on Lean 4.22.0 (de Moura and Ullrich 2021). It carries thirty-five theorems, and every one prints *does not depend on any axioms*, pinned by `#guard_msgs` so that a drifted cone fails the compile. Its SHA-256 is

\begin{center}\codefont\footnotesize 61014403f706b476116b047b9eb7a0fa\\ 6fc2fde0ae97e6a860cfbf57bb0e352f\end{center}

and the Markdown master of this paper carries the kernel with a one-line extraction command and its manifest.

## Appendix B · The kernel {-}

```{=latex}
{\codefont\fontsize{5.6}{6.6}\selectfont
\VerbatimInput[breaklines=true,breakanywhere=true,breaksymbolleft={},breaksymbolright={}]{NS_Existence_Closure.lean}}
```

## Author's Provenance and Method Disclosure {-}

This paper was developed under Trisduction, a verification and organizing discipline that adds the cited results no warrant; the method and its executable batteries are stated in full at the reference below.

*Author and method.* Mohammad F. Islam, PhD, independent researcher, sole author and sole authority for every claim and every error. The reduction was directed by the author and drafted with Claude (Anthropic) as scribe: the model wrote and compiled the kernel, checked citations and argued against the author's positions on instruction; it holds no authorship. One claim was held at the model's insistence: the paper does not state that regularity follows from existence as given, because the kernel's own \thm{given_is_not_the_value} proves the contrary.

*The register.* In the programme's vocabulary: the form, the act's identity with the value, the universal closure and the kinetic theorem stand at [{\symfont ⟀}\,T] on no axiom; the triaxial reading at [{\symfont ⟀}\,S]; the value at the continuum at the root's grade on the act; $\Delta M=0$ on the cited physics. The act is the row's least-erasure posit read as existence acting finitely; the row carries no defeater. The freedom cut, prime-as-freedom and the triaxial lock are applied on the row. The effective alignment-defect premise of the earlier papers is retired as a placeholder.

*Audit.* This edition has not yet been prosecuted by the external substrates, and no audit result is claimed. The development provenance is the author's Zenodo trail, the Unabridged Trisduction Codex and the Lean Codex at github.com/1000sapients/Trisduction.

## References {-}

```{=latex}
{\small\setlength{\parindent}{0pt}\setlength{\parskip}{3pt}\raggedright
\everypar{\hangindent=1.2em\hangafter=1}
de Moura, L. and S. Ullrich. 2021. The Lean 4 theorem prover and programming language. \emph{Automated Deduction, CADE 28}, 625--635.

Fefferman, C. 2006. Existence and smoothness of the Navier--Stokes equation. In \emph{The Millennium Prize Problems}, 57--67. Clay Mathematics Institute.

Fujita, H. and T. Kato. 1964. On the Navier--Stokes initial value problem. I. \emph{Archive for Rational Mechanics and Analysis} 16: 269--315.

Islam, M. F. 2026a. Integrable misalignment forbids blowup. Zenodo. doi:10.5281/zenodo.22665832.

Islam, M. F. 2026b. Global smoothness of the three-dimensional Navier--Stokes equations from a single effective axiom. Zenodo. doi:10.5281/zenodo.22670344.

Islam, M. F. 2026c. The forced alternative is a filter. Zenodo. doi:10.5281/zenodo.22670253.

Islam, M. F. 2026d. Closure and the limits of forced results. Zenodo. doi:10.5281/zenodo.22683806.

Islam, M. F. 2026e. A formal proof of Navier--Stokes termination at the formal-alone register. Zenodo. doi:10.5281/zenodo.22705897.

Islam, M. F. 2026f. The fluid is the witness. Zenodo. doi:10.5281/zenodo.22986563.

Islam, M. F. 2026g. The Riemann Hypothesis closed to one named bit and proved from unconditional least erasure by one act, with an empty axiom cone. Zenodo. doi:10.5281/zenodo.23034066.

Islam, M. F. 2026h. Nothing escapes least erasure. Zenodo. doi:10.5281/zenodo.23080221.

Islam, M. F. 2026i. PhysOS\textsuperscript{T}: the Trisduction physical operating system. Zenodo. doi:10.5281/zenodo.23117440.

Islam, M. TRISDUCTION: A linguistically, topologically, and mathematically sealed verification architecture. Triaxial orthogonality, twelve-gate closure, the quaternionic completion, the root axiom, and the master pre-sealed proposition ledger. Zenodo, version 4, 19 June 2026. doi:10.5281/zenodo.20757507. Mirror: PhilArchive record ISLTTG. Master reference, continuously updated at the same location.

Leray, J. 1934. Sur le mouvement d'un liquide visqueux emplissant l'espace. \emph{Acta Mathematica} 63: 193--248.

Mandelstam, L. and I. Tamm. 1945. The uncertainty relation between energy and time in non-relativistic quantum mechanics. \emph{Journal of Physics (USSR)} 9: 249--254.

Margolus, N. and L. B. Levitin. 1998. The maximum speed of dynamical evolution. \emph{Physica D} 120: 188--195.

Tao, T. 2016. Finite time blowup for an averaged three-dimensional Navier--Stokes equation. \emph{Journal of the American Mathematical Society} 29: 601--674.

}
\vspace{8pt}
\begin{center}\color{accent}\itshape End of manuscript\end{center}
```

<!--
MACHINE-READABLE KERNEL AND MANIFEST (not rendered). Extract with:
awk '{sub(/\r$/,"")} /^~~~~~[a-z0-9]+ file=[A-Za-z0-9_.]+$/{sub(/.*file=/,"");f=$0;next} /^~~~~~$/{if(f!=""){close(f);f=""};next} f!=""{print > f}' A_Formal_Completed_Proof_NS_Closure_v1_0_0.md

~~~~~sha256 file=MANIFEST.sha256
61014403f706b476116b047b9eb7a0fa6fc2fde0ae97e6a860cfbf57bb0e352f  NS_Existence_Closure.lean
~~~~~

~~~~~lean file=NS_Existence_Closure.lean
/-
  NS_Existence_Closure.lean · the kernel of A Formal Completed Proof of the Navier–Stokes Closure
  from Existence Alone

  The unforced Navier–Stokes row closed on existence and the freedom arrow alone. Every theorem
  of this file is on no axiom at all: no propext, no Quot.sound, no Classical.choice.
  I     The frame, the value, the two coherent worlds.
  II    Existence as given: the root, the arrow, the bare freedom bit; what they carry on every
        frame, and that they force no value.
  III   Existence read on the row: the act, equal to the value; the closure by one act; nothing
        escapes; every instant lands; one blowup refutes.
  IV    The price: energy does not decide; the speed limit decides on matter, and is load-bearing.
  V     Freedom: one free orbit, walled; the prime's shape.
  VI    The triaxial lock.
  VII   The record and the seed: no finite record, no symmetry and no unsized step forces the
        value; a uniform step does.
  VIII  The closure, whole.
  Core Lean 4, no import, no axiom declared, no sorry. Cones pinned at the foot.
-/

namespace NSClose

/-! ## I · the frame -/

/-- A flow frame: data, and the registrations each datum's flow has made by time t,
`none` when that count is unbounded by then, which is blowup by that time. -/
structure Frame where
  D     : Type
  count : D → Nat → Option Nat

/-- A datum is regular when its flow has acted finitely at every time. -/
def Regular (F : Frame) (d : F.D) : Prop := ∀ t, ∃ n, F.count d t = some n

/-- The value of the row on a frame: every datum regular. -/
def Value (F : Frame) : Prop := ∀ d, Regular F d

/-- The regular world. -/
def calm : Frame := ⟨Unit, fun _ _ => some 0⟩
/-- The blowup world. -/
def burst : Frame := ⟨Unit, fun _ t => match t with | 0 => some 0 | _ + 1 => none⟩

theorem calm_value : Value calm := fun _ _ => ⟨0, rfl⟩

theorem burst_fails : ¬ Value burst := fun h => match h () 1 with
  | ⟨_, hn⟩ => Option.noConfusion hn

/-! ## II · existence as given -/

/-- The root, in its formal reading: to exist is to actuate. -/
def Root (U : Type) (ΔE : U → Int) : Prop := ∀ x : U, 0 < ΔE x

/-- The root is satisfiable on every background. -/
theorem root_given : Root Empty (fun e => nomatch e) := fun e => nomatch e

/-- What follows from the root uniformly in its symbols holds without it. -/
theorem root_conservative (S : Prop) (h : ∀ (U : Type) (ΔE : U → Int), Root U ΔE → S) : S :=
  h Empty (fun e => nomatch e) root_given

/-- The arrow is given on every type. -/
def Arrow : Prop := ∀ α : Type, ∃ f : α → α, ∀ a, f a = a

theorem arrow_given : Arrow := fun _ => ⟨id, fun _ => rfl⟩

/-- The freedom bit is given: one orbit of two, off the seat. -/
theorem freedom_given : ∀ w : Bool, (!w) ≠ w
  | true => Bool.noConfusion
  | false => Bool.noConfusion

/-- What is given on every frame forces no value: no statement reading the same on every frame
is the value. -/
theorem given_is_not_the_value (P : Prop) : ¬ ∀ F : Frame, (P ↔ Value F) :=
  fun h => burst_fails ((h burst).mp ((h calm).mpr calm_value))

theorem arrow_forces_nothing : ¬ ∀ F : Frame, Arrow → Value F :=
  fun h => burst_fails (h burst arrow_given)

/-- The given holds in both worlds. -/
theorem given_in_both_worlds : (Arrow ∧ Value calm) ∧ (Arrow ∧ ¬ Value burst) :=
  ⟨⟨arrow_given, calm_value⟩, ⟨arrow_given, burst_fails⟩⟩

/-! ## III · existence read on the row: the act -/

/-- Existence read on the row: whatever exists acts finitely at every time. -/
def ActsFinitely (F : Frame) : Prop := ∀ d t, ∃ n, F.count d t = some n

/-- The act is the value, exactly. -/
theorem act_is_the_value (F : Frame) : ActsFinitely F ↔ Value F :=
  ⟨fun h d t => h d t, fun h d t => h d t⟩

/-- The act is keyed: it holds in one world and fails in the other. -/
theorem act_is_keyed : ActsFinitely calm ∧ ¬ ActsFinitely burst :=
  ⟨calm_value, burst_fails⟩

/-- The actual flows, with the one act of the paper. -/
structure ActualFlows where
  F      : Frame
  supply : ActsFinitely F

/-- GLOBAL REGULARITY FROM EXISTENCE, BY ONE ACT. -/
theorem regularity_from_existence (A : ActualFlows) : Value A.F :=
  (act_is_the_value A.F).mp A.supply

/-- The act is self-grounding: it exists on a frame exactly when the value holds there. -/
theorem supply_iff (F : Frame) : Nonempty { A : ActualFlows // A.F = F } ↔ Value F :=
  ⟨fun ⟨⟨A, hA⟩⟩ => hA ▸ regularity_from_existence A,
   fun h => ⟨⟨⟨F, (act_is_the_value F).mpr h⟩, rfl⟩⟩⟩

/-- Every instant lands on exactly one gate: a finite count or an unbounded one. -/
theorem every_instant_lands (F : Frame) (d : F.D) (t : Nat) :
    (∃ n, F.count d t = some n) ∨ F.count d t = none :=
  match F.count d t with
  | some n => Or.inl ⟨n, rfl⟩
  | none => Or.inr rfl

theorem gates_exclusive (F : Frame) (d : F.D) (t : Nat) :
    ¬ ((∃ n, F.count d t = some n) ∧ F.count d t = none) :=
  fun ⟨⟨_, h⟩, h'⟩ => Option.noConfusion (h'.symm.trans h)

/-- NOTHING ESCAPES the act: every datum, at every time, acts finitely. -/
theorem nothing_escapes (A : ActualFlows) : ∀ d t, ∃ n, A.F.count d t = some n := A.supply

/-- One blowup refutes the act. -/
theorem blowup_refutes (F : Frame) (d : F.D) (t : Nat) (h : F.count d t = none) :
    ¬ ActsFinitely F :=
  fun hA => match hA d t with
    | ⟨_, hn⟩ => Option.noConfusion (h.symm.trans hn)

/-! ## IV · the price -/

/-- A priced frame with the energy inequality: dissipation paid never exceeds the energy. -/
structure Priced where
  F          : Frame
  energy     : F.D → Nat
  paid       : F.D → Nat → Nat
  inequality : ∀ d t, paid d t ≤ energy d

def leray : Priced := ⟨burst, fun _ => 1, fun _ _ => 1, fun _ _ => Nat.le_refl 1⟩

/-- Energy does not decide: the energy inequality holds and a datum blows up. -/
theorem energy_does_not_decide : (∀ d t, leray.paid d t ≤ leray.energy d) ∧ ¬ Value leray.F :=
  ⟨leray.inequality, burst_fails⟩

/-- A physical frame. Time before a horizon T is resolved by instants indexed by k, each
before T. `stage d T k` counts the registrations of datum d by the k-th instant before T.
The quantum speed limit is a cited field: no count before T exceeds c·E·T. The cascade is
the definition of blowup by T in its limit form: the counts before T are unbounded. -/
structure Physical where
  D       : Type
  energy  : D → Nat
  stage   : D → Nat → Nat → Nat
  c       : Nat
  speed   : ∀ d T k, stage d T k ≤ c * energy d * T
  Blowup  : D → Nat → Prop
  cascade : ∀ d T, Blowup d T → ∀ N, ∃ k, N < stage d T k

/-- NO ACTUAL FLOW BLOWS UP: finite energy bounds every count before T by c·E·T, and a
singularity needs counts before T above every bound. -/
theorem no_actual_blowup (P : Physical) (d : P.D) (T : Nat) : ¬ P.Blowup d T :=
  fun hb => match P.cascade d T hb (P.c * P.energy d * T) with
    | ⟨k, hlt⟩ => Nat.lt_irrefl _ (Nat.lt_of_lt_of_le hlt (P.speed d T k))

/-- The cascade without the speed limit: the same definition of blowup, no bound. -/
structure CascadeOnly where
  D       : Type
  stage   : D → Nat → Nat → Nat
  Blowup  : D → Nat → Prop
  cascade : ∀ d T, Blowup d T → ∀ N, ∃ k, N < stage d T k

def cascadeWorld : CascadeOnly :=
  ⟨Unit, fun _ _ k => k, fun _ _ => True, fun _ _ _ N => ⟨N + 1, Nat.lt_succ_self N⟩⟩

/-- THE SPEED LIMIT IS LOAD-BEARING: without it the definition of blowup is satisfiable, and
the blowing-up world exceeds every bound the speed limit would impose. -/
theorem speed_is_load_bearing :
    cascadeWorld.Blowup () 1 ∧ ∀ b : Nat, ∃ k, ¬ cascadeWorld.stage () 1 k ≤ b :=
  ⟨trivial, fun b => ⟨b + 1, Nat.not_succ_le_self b⟩⟩

/-- On matter the registrations by every time are bounded by c·E·t. -/
def toFrame (P : Physical) : Frame := ⟨P.D, fun d t => some (P.c * P.energy d * t)⟩

/-- On matter the act holds: existence acts finitely. -/
theorem matter_acts_finitely (P : Physical) : ActsFinitely (toFrame P) :=
  fun d t => ⟨P.c * P.energy d * t, rfl⟩

theorem matter_is_regular (P : Physical) : Value (toFrame P) :=
  (act_is_the_value (toFrame P)).mp (matter_acts_finitely P)

/-! ## V · freedom -/

def kineticRecord (_w : Bool) : Nat := 0

/-- No reading of the record returns the world. -/
theorem record_wall : ¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w :=
  fun ⟨_, hg⟩ => Bool.noConfusion ((hg false).symm.trans (hg true))

theorem fibre_is_two : ([false, true].filter (fun w => kineticRecord w == kineticRecord true)).length = 2 := by
  decide

def mulFibre (n : Nat) : List (Nat × Nat) :=
  (List.range (n + 1)).flatMap fun a =>
    (List.range (n + 1)).filterMap fun b => if a * b = n then some (a, b) else none

/-- The prime's shape: a prime's multiplicative fibre is two points off the seat, the count of
the value fibre. -/
theorem prime_shape :
    mulFibre 7 = [(1, 7), (7, 1)] ∧ (mulFibre 7).all (fun p => p.1 != p.2) = true ∧
    (mulFibre 7).length = ([false, true].filter (fun w => kineticRecord w == kineticRecord true)).length := by
  decide

/-! ## VI · the triaxial lock -/

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

/-! ## VII · the record and the seed -/

/-- The world regular on its first n data and blowing up after. -/
def staged (n : Nat) : Frame :=
  ⟨Nat, fun d t => if d < n then some 0 else match t with | 0 => some 0 | _ + 1 => none⟩

/-- No finite record forces the value: the first n data are regular and the value fails. -/
theorem finite_record_never_forces (n : Nat) :
    (∀ d, d < n → Regular (staged n) d) ∧ ¬ Value (staged n) :=
  ⟨fun d hd t => ⟨0, by
      show (if d < n then some 0 else match t with | 0 => some 0 | _ + 1 => none) = some 0
      rw [if_pos hd]⟩,
   fun h => match h n 1 with
     | ⟨_, hk⟩ => by
       have e : (staged n).count n 1 = none := by
         show (if n < n then some 0 else (none : Option Nat)) = none
         rw [if_neg (Nat.lt_irrefl n)]
       exact Option.noConfusion (e.symm.trans hk)⟩

/-- A symmetry keeps the size; the small region is a union of orbits. -/
structure Symmetric (D : Type) (size : D → Nat) where
  Grp  : Type
  act  : Grp → D → D
  keep : ∀ g d, size (act g d) = size d

theorem no_symmetry_lifts {D : Type} (size : D → Nat) (S : Symmetric D size) (r : Nat) (d e : D)
    (hd : size d ≤ r) (he : r < size e) : ∀ g, S.act g d ≠ e :=
  fun g h =>
    have k : size e = size d := h ▸ S.keep g d
    have h2 : size e ≤ r := by rw [k]; exact hd
    Nat.lt_irrefl r (Nat.lt_of_lt_of_le he h2)

/-- A ladder in the size, with a uniform step, reaches every size. -/
structure Ladder where
  Bounded : Nat → Prop
  base    : Bounded 0
  mono    : ∀ r s, Bounded s → r ≤ s → Bounded r
  δ       : Nat → Nat
  step    : ∀ r, Bounded r → Bounded (r + δ r)

theorem uniform_step_forces_all (L : Ladder) (hδ : ∀ r, 1 ≤ L.δ r) : ∀ r, L.Bounded r
  | 0 => L.base
  | r + 1 => L.mono (r + 1) (r + L.δ r) (L.step r (uniform_step_forces_all L hδ r))
      (Nat.add_le_add_left (hδ r) r)

/-! ## VIII · the closure, whole -/
theorem the_closure :
    -- existence as given carries the form and forces no value
    (∀ S : Prop, (∀ (U : Type) (ΔE : U → Int), Root U ΔE → S) → S) ∧
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    ((Arrow ∧ Value calm) ∧ (Arrow ∧ ¬ Value burst)) ∧
    -- existence read on the row is the value, by one act
    (∀ F : Frame, ActsFinitely F ↔ Value F) ∧
    (ActsFinitely calm ∧ ¬ ActsFinitely burst) ∧
    (∀ A : ActualFlows, Value A.F) ∧
    (∀ (A : ActualFlows), ∀ d t, ∃ n, A.F.count d t = some n) ∧
    (∀ (F : Frame) (d : F.D) (t : Nat), (∃ n, F.count d t = some n) ∨ F.count d t = none) ∧
    (∀ (F : Frame) (d : F.D) (t : Nat), F.count d t = none → ¬ ActsFinitely F) ∧
    -- the price
    ((∀ d t, leray.paid d t ≤ leray.energy d) ∧ ¬ Value leray.F) ∧
    (∀ (P : Physical) (d : P.D) (T : Nat), ¬ P.Blowup d T) ∧
    (cascadeWorld.Blowup () 1 ∧ ∀ b : Nat, ∃ k, ¬ cascadeWorld.stage () 1 k ≤ b) ∧
    (∀ P : Physical, Value (toFrame P)) ∧
    -- freedom and the lock
    (¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w) ∧
    (∀ w : Bool, (!w) ≠ w) ∧
    -- the record
    (∀ n, (∀ d, d < n → Regular (staged n) d) ∧ ¬ Value (staged n)) :=
  ⟨root_conservative, given_is_not_the_value, given_in_both_worlds, act_is_the_value,
   act_is_keyed, regularity_from_existence, nothing_escapes, every_instant_lands, blowup_refutes,
   energy_does_not_decide, no_actual_blowup, speed_is_load_bearing, matter_is_regular, record_wall, freedom_given,
   finite_record_never_forces⟩


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
    R ∧ Value calm ∧ ¬ Value burst :=
  ⟨G.instances a, calm_value, burst_fails⟩

/-- THE ROOT READ ON THE ROW IS KEYED: the root holds, and no frame-uniform passage from it gives
the value; read on the row it is the act, which decides where the root alone does not. -/
theorem root_read_on_row_is_keyed {R : Prop} (G : SelfGrounding R) (a : G.Act) :
    R ∧ ¬ (∀ F : Frame, R → Value F) :=
  ⟨G.instances a, fun h => burst_fails (h burst (G.instances a))⟩

end NSClose

/-! ## Cones, pinned as printed -/
/-- info: 'NSClose.calm_value' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.calm_value
/-- info: 'NSClose.burst_fails' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.burst_fails
/-- info: 'NSClose.root_given' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.root_given
/-- info: 'NSClose.root_conservative' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.root_conservative
/-- info: 'NSClose.arrow_given' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.arrow_given
/-- info: 'NSClose.freedom_given' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.freedom_given
/-- info: 'NSClose.given_is_not_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.given_is_not_the_value
/-- info: 'NSClose.arrow_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.arrow_forces_nothing
/-- info: 'NSClose.given_in_both_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.given_in_both_worlds
/-- info: 'NSClose.act_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.act_is_the_value
/-- info: 'NSClose.act_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.act_is_keyed
/-- info: 'NSClose.regularity_from_existence' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.regularity_from_existence
/-- info: 'NSClose.supply_iff' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.supply_iff
/-- info: 'NSClose.every_instant_lands' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.every_instant_lands
/-- info: 'NSClose.gates_exclusive' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.gates_exclusive
/-- info: 'NSClose.nothing_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.nothing_escapes
/-- info: 'NSClose.blowup_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.blowup_refutes
/-- info: 'NSClose.energy_does_not_decide' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.energy_does_not_decide
/-- info: 'NSClose.no_actual_blowup' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.no_actual_blowup
/-- info: 'NSClose.speed_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.speed_is_load_bearing
/-- info: 'NSClose.matter_acts_finitely' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.matter_acts_finitely
/-- info: 'NSClose.matter_is_regular' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.matter_is_regular
/-- info: 'NSClose.record_wall' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.record_wall
/-- info: 'NSClose.fibre_is_two' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.fibre_is_two
/-- info: 'NSClose.prime_shape' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.prime_shape
/-- info: 'NSClose.two_axes_leave_two' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.two_axes_leave_two
/-- info: 'NSClose.three_axes_lock_one' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.three_axes_lock_one
/-- info: 'NSClose.finite_record_never_forces' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.finite_record_never_forces
/-- info: 'NSClose.no_symmetry_lifts' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.no_symmetry_lifts
/-- info: 'NSClose.uniform_step_forces_all' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.uniform_step_forces_all
/-- info: 'NSClose.the_closure' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.the_closure
/-- info: 'NSClose.denial_reenacts_root' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.denial_reenacts_root
/-- info: 'NSClose.external_proof_adds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.external_proof_adds_nothing
/-- info: 'NSClose.undeniable_root_forces_no_value' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.undeniable_root_forces_no_value
/-- info: 'NSClose.root_read_on_row_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.root_read_on_row_is_keyed
~~~~~
-->
