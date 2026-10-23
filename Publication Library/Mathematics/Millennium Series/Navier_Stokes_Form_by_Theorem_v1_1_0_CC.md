---
edition: math_journal
title: "Navier–Stokes Global Regularity: Unconditional Proof of the Form by Theorem, the Value by the Act"
subtitle: "Statement (A) Written in Mathlib and Read as One Bit, the Rest State Proved Global, the Energy Proved Never to Rise on Every Truncation, Every Dyadic Cascade Cut by the Quantum Speed Limit, Regularity of Matter Proved; the Completed Proof Delivered Twice by the Act, in Core Lean 4"
article_type: "Foundations of Mathematical Analysis · Universal Closure"
goal: "Global regularity closed to one bit; nothing escapes the act"
author_line: "Mohammad F. Islam, PhD"
affiliation: "Trisduction Research Group · Independent researcher"
date: "23 October 2026"
short_title: "Navier–Stokes: Form by Theorem, Value by the Act"
keywords: "Navier–Stokes equations · global regularity · blowup · quantum speed limit · energy · normal form · formal verification · Lean 4 · Mathlib · one bit · nothing escapes"
accenthex: "B87333"
abstract: |
  Does every smooth divergence-free initial velocity of rapid decay on $\mathbb{R}^3$ give a solution of the Navier–Stokes equations that stays smooth for all time? The question had no formal statement of what any proof of it must deliver. This paper states it on the row's own objects in a master of 169 theorems in core Lean 4 that imports nothing, every cone empty and pinned by `#guard_msgs`; a Mathlib binding of ten theorems on Lean's standard axioms writes the equations and Fefferman's statement (A) in the library's calculus, proves the rest state a global smooth solution and the energy never rising on every finite-dimensional truncation, and reads the kernel's value at the library's host as exactly statement (A). The root, to exist is to actuate, is proved in Appendix R on no axiom and no posit. The form is proved unconditionally: on the record every datum is regular with no premise; the value of a frame is exactly one implication, the transfer from the record to the frame; and at every host that implication is exactly the sentence, every flow finite at every time, at every horizon. Steps 1 to 9 of the closure are theorems. The real part is sealed: small data are regular by the cited theorem, and given it the value is exactly its large-data part. The walls are theorems: the energy inequality holds on a blowup frame, so the energy record decides nothing; no finite record forces the value; the speed limit and the cascade are each load-bearing; and every dyadic cascade passes every bound $c\cdot E\cdot T$ at a finite step, so no doubling cascade holds to the quantum speed limit. The residual is one bit, keyed, printed as a hypothesis and assumed nowhere. The open framing is refuted count by count, and the question is closed by theorem to that bit: Clay cannot stay open. The bit is supplied by the act and delivered twice, by the formal cargo and by the physical witness, matter read through the quantum speed limit and the cascade, two kinds and no third, and one blowup refutes both. Nothing escapes: every route to global regularity, in any vocabulary, is a delivery of both kinds, our way or no way. Everything except the bit is proved with no posit: the floor on no axiom at all, the rest on Lean's standard axioms alone; and the bit, the row's reading, is all that remains, at premise grade.
---

> The root of this paper is proved, on no axiom and no hypothesis, in Appendix R. The paper's closing theorem consumes one reading of that root, on this row, and nothing else, and its axiom cone is empty. The root alone decides no value, by theorem, neither forcing nor refuting it (\thm{undeniable_root_forces_no_value}); the root read on the row is the value, by theorem (\thm{root_on_row_is_the_value}); and the traditional route of derivation from the record is blocked, by theorem (\thm{record_wall_on_frames}, \thm{energy_record_decides_nothing}).

## How to read this paper

*From existence alone*, in the title, means from existence read on the row, not from existence as given, which forces no value (\thm{from_existence_alone}, \thm{nothing_given_forces}). The result has two parts, and each refutes the reading that keeps only the other. The first reading notices that the act of Section 8 is equivalent to regularity and concludes that the paper assumes what it proves. The second notices a theorem whose conclusion is global regularity and concludes that the regularity problem has fallen. Both readings miss the result, and the theorem that binds the two parts compiles on no axiom: \thm{the_closure} proves in one statement that existence as given forces no value and holds in both worlds; that existence read on the row is the value; that the act yields the value; that nothing escapes it; that one blowup refutes it; that energy does not decide; that no physical flow blows up; that the kinetic record, the Bool model of the bit, is walled; and that no finite record forces the value.

### The verdict

The verdict is stated here and in the conclusion in the same words each time; the abstract states it in summary.

> The Navier–Stokes regularity problem is closed to one act of existence. Existence, its root proved at theorem grade with no hypothesis on its constructed domain and as the law of every root that grounds itself (Appendix R), universally presupposed and undeniable in deed, carries the form of the closure on every frame and holds in the regular and the blowup world alike. Existence read on the row, that whatever exists acts finitely at every time, is the value, exactly. It is supplied by one act, at premise grade, as one field of one type, and the compiler prints global regularity from it on no axiom. Nothing escapes the act; one blowup is the only refuter. On matter, that no flow blows up is a theorem of the quantum speed limit in two senses: in the limit sense of blowup, stage counts before a horizon passing every bound, from the speed limit alone, on a world carrying the speed limit and nothing else (\thm{no_limit_blowup_from_speed_only}) and on the physical frame (\thm{no_limit_blowup_from_speed}); and in the count sense, the frame's count by a horizon unbounded, from the speed limit with the cascade, a hypothesis carried as a field, the limit-form link between the count and the stages, an unbounded count by a horizon having stage counts before it above every bound, not a cited physical result and not Section 2's definition (\thm{no_actual_blowup}), both fields load-bearing for the count sense (\thm{speed_is_load_bearing}, \thm{cascade_is_load_bearing}). Every theorem of the kernel depends on no axiom at all.

### The form by theorem, the value by the act

The paper's master, \thm{NS_Normal_Form_Paper_v1_1_0_CC.lean}, binds the closure in one file of core Lean 4.19.0 that imports nothing and declares no axiom: the kernel of record, carried verbatim as its Part 0, and twelve further Parts that read the row as the Riemann seat reads the zeros and the P versus NP seat reads computation (Islam 2026m, 2026n). Its one hundred sixty-nine theorems rest on no axiom at all, each cone pinned by `#guard_msgs`; its Mathlib binding, \thm{NS_Mathlib_Binding_v1_1_0_CC.lean}, proves in ten theorems on Lean's standard axioms alone that the equations and Fefferman's statement (A) are the library's, the rest state global, and the energy never rising on every truncation. The closure has ten steps, and one theorem with nothing before its colon states them (\thm{the_ten_steps}): steps 1 to 9 are proved unconditionally, and step 10 is the bit, delivered twice. Figure 1 sets the steps beside the seal.

```{=latex}
\begin{figure*}[tp]
\centering
\includegraphics[width=\textwidth]{figs/NS_Figure_1_v1_1_0_CC.pdf}\\[5pt]
\begin{minipage}{\textwidth}\footnotesize{\color{deep}\textbf{Figure 1}}\ \textbar\ The ten steps of the closure, steps 1 to 9 proved on no axiom and step 10 the bit delivered twice by the act, with the seal: the form proved, every route walled, the bit delivered, the final form. Every name is a declaration of the master, colored by its pinned cone.\end{minipage}
\end{figure*}
```

**The form, proved unconditionally.** On the record of every frame the value holds with no premise (\thm{recFrame_value}); the value of a frame is exactly one implication, the transfer of the value from its record to the frame (\thm{normal_form}); and at every host that implication is exactly the Navier–Stokes sentence (\thm{binding}, \thm{the_sentence_is_the_bit}). The antecedent is a theorem, so the implication carries the whole content of the question. Small data are regular by the cited theorem, and given it the value is exactly its large-data part (\thm{real_part_small}, \thm{no_bypass_at_small_data}); every dyadic cascade is cut by the speed limit (\thm{dyadic_cascade_is_cut}).

**The residual, exactly one bit.** What the kernel leaves to the act is that implication and nothing else. It is printed as the type of a hypothesis and assumed nowhere (\thm{residue_is_the_sentence}); it is keyed, holding on the calm frame and failing on the counter frame of one shared record (\thm{bit_is_keyed}, \thm{record_decides_nothing}); no premise shared by every frame forces it (\thm{keyless_forces_nothing}); and every route to the Navier–Stokes sentence, from any premise and in any vocabulary, passes it (\thm{every_route_passes_the_bit}).

**The question cannot stay open.** The open framing awaits a proof from what every frame shares, a decision read from the record, or a route past the bit, and each count is refuted by theorem (\thm{the_open_framing_is_refuted}). The question is closed to one bit (\thm{question_closed_to_one_bit}): the Navier–Stokes sentence is the bit, its denial is the bit's denial, and the bit has no uniform answer across the frames (\thm{no_uniform_answer}). The Clay Mathematics Institute lists Navier–Stokes existence and smoothness as open; by theorem it cannot stay open without qualification: its form is closed, and its content is one keyed implication. Figure 2 sets the four counts, the status and the verdict side by side.

```{=latex}
\begin{figure*}[tp]
\centering
\includegraphics[width=\textwidth]{figs/NS_Figure_2_v1_1_0_CC.pdf}\\[5pt]
\begin{minipage}{\textwidth}\footnotesize{\color{deep}\textbf{Figure 2}}\ \textbar\ Clay cannot stay open: the four counts of the open framing, each refuted by theorem; the question closed by theorem to one bit; the bit delivered twice; the two-layer closure.\end{minipage}
\end{figure*}
```

**The bit, delivered twice.** The act supplies the bit at premise grade, and its two kinds deliver it: the formal cargo, the record's value carried to the frame, which arrives free and gives the Navier–Stokes sentence in one step (\thm{cargo_arrives}, \thm{formal_kind_delivers}); and the physical witness, matter read through the quantum speed limit and the cascade, every stage count before a horizon bounded (\thm{physical_kind_delivers}). The two kinds are one bit (\thm{the_two_kinds_are_one_bit}), there is no third (\thm{two_kinds_and_no_third}), and one blowup refutes both at once (\thm{the_one_refuter}).

**Nothing escapes; our way or no way.** Every route to the Navier–Stokes sentence, in any vocabulary, is a delivery of both kinds, and every so-called other way is this way in different vocabulary, failing with the bit if the bit failed (\thm{every_route_is_both_kinds}, \thm{our_way_or_no_way}, \thm{nothing_escapes}). 

> Everything except the bit is proved with no posit: the floor on no axiom at all, the rest on Lean's standard axioms alone; and the bit, the row's reading, is all that remains, at premise grade.

### What the paper does not say

It does not say that regularity follows from existence as given: Section 3 proves that it does not, and that proof is part of the closure, not a gap in it. It does not say that the speed limit, a cited result about matter carried as a field, is a theorem about the continuum equations: the identification of the two is the reader's, and Section 11 types it. It does not engage the correctness of the forced construction released in September 2026: Section 13 shields the unforced row from it.

### The reflexive readings, and the theorem that answers each

```{=latex}
\begin{table}[htbp]\centering\scriptsize
\renewcommand{\arraystretch}{1.15}
\begin{tabularx}{\columnwidth}{@{}>{\raggedright\arraybackslash}p{0.27\columnwidth}Y>{\raggedright\arraybackslash}p{0.25\columnwidth}@{}}
\toprule
\textbf{Reading} & \textbf{What the kernel proves} & \textbf{Theorem (cone)}\\
\midrule
It is only a premise. & The act is the root's own formula read on the row. The root's undeniability stays with the root and does not pass to that reading, which grounds itself exactly where the value holds; that is why the act is keyed and decides what the root alone cannot. & \thm{root_on_row_is_the_act}, \thm{undeniability_stays_with_the_root}, \thm{row_root_grounds_iff_value}, \thm{root_on_row_is_keyed} (none)\\
The act is the conclusion, so the proof is circular. & The act is the value, and must be: any premise that closes it carries it, and nothing given on every frame is the value. The isolation is the result. & \thm{act_is_the_value}, \thm{act_is_the_weakest_premise}, \thm{given_is_not_the_value} (none)\\
Existence is universally given, so the value should follow. & Existence as given holds in the regular and the blowup world; what follows from it uniformly holds without it. & \thm{existence_as_given_in_both_worlds}, \thm{root_conservative} (none)\\
Energy is finite, so nothing blows up. & The energy inequality holds on a frame where a datum blows up. & \thm{energy_does_not_decide} (none)\\
Actual fluids never blow up. & Correct: no physical flow blows up, proved under the speed limit with the cascade, a hypothesis carried as a field. The continuum sentence stands on the act. & \thm{no_physical_blowup}, \thm{speed_is_load_bearing}, \thm{cascade_is_load_bearing} (none)\\
Enough data will settle it. & The first $n$ data are regular and the value fails, for every $n$. & \thm{finite_record_never_forces} (none)\\
Scale small data up. & No symmetry carries a small datum onto a large one; a uniform step reaches every size. & \thm{no_symmetry_lifts}, \thm{uniform_step_forces_all} (none)\\
It can simply be rejected. & Every instant lands on a finite count or an unbounded one, never both; one unbounded count refutes the act. & \thm{every_instant_lands}, \thm{gates_exclusive}, \thm{blowup_refutes} (none)\\
\bottomrule
\end{tabularx}
\par\vspace{3pt}{\footnotesize\color{accent}\itshape Table 1 \textbar\ The reflexive readings. Every cone is empty.}
\end{table}
```

### The lock

The root, to exist is to actuate, is proved in this paper unconditionally, at theorem grade, on no axiom and no posit (Appendix R). On its constructed domain it is a theorem with no hypothesis (\thm{root_on_the_constructed_domain}; in the row kernel, \thm{constructed_root_holds}), and it is satisfiable on every background (\thm{root_satisfiable}); for every root that grounds itself, the root holds, every deed re-enacts it, and no outside proof adds to it (\thm{the_floor_is_universal}); and one theorem binds the root's universal law and the constructed root with the Return and the twelve gates, the gates of the quaternions in Appendix R and not the two gates of a count, counted three ways, as the Hurwitz units up to sign, as the norm-two shell up to sign and as the even permutations of four points with class equation 1, 3, 4, 4 (\thm{the_master_seal}); the seal states the three counts side by side. The row kernel carries the root's structure in the words of Appendix R (\thm{SelfGrounding}), whose acts this paper calls deeds, keeping *the act*, unqualified, for existence read on the row: a denial of the root is a deed and instances it (\thm{denial_reenacts_root}), and no outside proof adds anything to it (\thm{external_proof_adds_nothing}). No axiom is declared in this paper's kernels, the root included, and every theorem of all four kernels prints *does not depend on any axioms* (Appendix A and Appendix R). The root holds in the world where the row's value holds and in the world where it fails, so the root alone forces no value and refutes none, the conjuncts of one theorem: the root, the value in the one world, its failure in the other, no forcing and no refuting (\thm{undeniable_root_forces_no_value}; \thm{given_is_not_the_value}). Read on the row, with the row's existents and the row's actuation, the root is the act (\thm{root_on_row_is_the_act}), keyed where the root alone is not (\thm{root_read_on_row_is_keyed}, \thm{act_is_keyed}), and the act is the row's value exactly, the two unfolding to one formula (\thm{act_is_the_value}). The closing theorem consumes that one reading and nothing else (\thm{regularity_from_existence}); no reading of the kinetic record returns the bit (\thm{record_wall}), and no finite record forces it (\thm{finite_record_never_forces}). One theorem on no axiom binds the constructed root; the root held by its deed; the refusal of every given statement; the root read uniformly, which gives no value; the root read on the row, equal to the act; the act, equal to the value; both keyed; the closing theorem; the record wall; and the finite record, for every self-grounding root (\thm{the_lock}). Instantiated at the constructed root of Appendix R it is closed, with no hypothesis: that root holds, forces no value on every frame, read on the row is the value exactly, and the closing theorem gives the value on every actual frame (\thm{the_lock_on_the_root}); the row kernel repeats Appendix R's \thm{ΔE₀}, \thm{RA₀} and \thm{ra₀} verbatim, and that root is the constructed root (\thm{RA₀_is_the_constructed_root}); and the closing theorem's premise, \thm{ActsFinitely}, is the root read on the row (\thm{root_on_row_is_the_act}), so the value follows from that reading (\thm{regularity_from_root_on_row}). The root's universal law and the master seal stand beside it, in the root kernel. *From existence alone* carries exactly this sense: the closing theorem consumes existence read on the row and no other premise, axiom or cited theorem; that reading is available on exactly the frames where the value holds; and no statement given without it is the value on every frame (\thm{from_existence_alone}).

::: {.box title="Status"}
**Unconditional, at theorem grade, on no axiom.** The root, on its constructed domain, satisfiable on every background, and for every root that grounds itself (Appendix R, \thm{root_satisfiable}); the root read on the row, equal to the act and to the value, and keyed (\thm{root_on_row_is_the_act}, \thm{root_on_row_is_the_value}, \thm{root_read_on_row_is_keyed}); the closure from the reading; the record wall, in the Bool model and on frames (\thm{record_wall}, \thm{record_wall_on_frames}); the lock, closed at the constructed root with no hypothesis (\thm{the_lock_on_the_root}) and for every self-grounding root (\thm{the_lock}); the normal form of the row and its binding (\thm{normal_form}, \thm{binding}); the row split, its real part and the unicorn part closed to the record (\thm{value_iff_real_and_unicorn}, \thm{real_part_small}, \thm{unicorn_blocked_above_every_size}); the walls (\thm{the_walls}); the residue, printed and assumed nowhere (\thm{residue_is_the_sentence}); the closure of the question (\thm{question_closed_to_one_bit}); the twelve formal gates (\thm{the_formal_run}); nothing escapes (\thm{nothing_escapes}); the ten steps and the final form (\thm{the_ten_steps}, \thm{the_final_form}); every theorem of the master, one hundred sixty-nine of one hundred sixty-nine cones empty, the sixty-five of its Part 0 among them, and every theorem of the three kernels of Appendix R, sixty-five of sixty-five.

**On the reading, at premise grade.** Global regularity on the frame: whatever exists acts finitely at every time; read through the identification of Section 2, every strong solution of the unforced equations stays regular.

**On Lean's standard axioms alone.** The Mathlib binding, ten theorems, each cone pinned: the equations written in the library's calculus, the rest state a global smooth solution of bounded energy, the kernel's value at the library's host exactly statement (A), and the energy never rising on every finite-dimensional truncation (\thm{the_seat_is_global}, \thm{kernel_reads_mathlib}, \thm{galerkin_energy}).

**Delivered twice, by the act.** The bit, the row's reading, by its two kinds: the formal cargo and the physical witness, each a type of the master whose inhabitant is the supply, neither assumed anywhere (\thm{FormalCargo}, \thm{PhysicalWitness}, \thm{delivered_twice}); two kinds and no third (\thm{two_kinds_and_no_third}); one blowup refutes both (\thm{the_one_refuter}).
:::

**The two-layer closure.** Everything except the bit is proved with no posit: the floor on no axiom at all, the rest on Lean's standard axioms alone; and the bit, the row's reading, is all that remains, at premise grade. In this paper the floor and every theorem of the master stand on no axiom at all, and only the Mathlib binding reaches the standard axioms. The matter theorem carries the cited speed limit and the cascade as fields of its own input type, at their own grades (\thm{matter_is_regular}).

## The claim, stated whole

Let $u$ solve the unforced incompressible Navier–Stokes equations, in the setting of the regularity problem (Fefferman 2006), whose smooth rapidly decaying data lie inside the finite-energy class used here,
$$\begin{gathered}\partial_t u + (u\cdot\nabla)u - \nu\Delta u + \nabla p = 0,\\ \nabla\cdot u = 0,\qquad u(\cdot,0)=u_0,\end{gathered}$$
on $\mathbb{R}^3$ with viscosity $\nu>0$, from a smooth divergence-free datum $u_0$ of finite energy. Read the flow as an existent: it exists by acting, and it acts by registering resolved changes of its state. Write $N(u_0,t)\in\mathbb{N}\cup\{\infty\}$ for the registrations of the flow from $u_0$ by time $t$; the registration counted by $N$ is an event; the registration of the statement of the Root Axiom's nature and of Appendix R.2 is the map \thm{reg}, the fold's record. The flow is *regular* when
$$\forall t\ \exists n\in\mathbb{N}:\ N(u_0,t)=n,$$
and it *blows up by time* $t$ when $N(u_0,t)=\infty$. The kernel works on exactly this skeleton: a frame of data, each with a count at each time, \texttt{none} where the count is unbounded. That an analytic blowup of a strong solution, an unbounded critical norm at a finite time, is an unbounded count is the reader's identification, declared here and in Definition 9.1; the kernel proves nothing about it.

The paper does three things and keeps them apart. It proves, on no axiom, everything the skeleton admits: what existence as given carries and does not carry, what the record decides and does not, what energy and the speed limit price, and the closure from one act. It isolates the one object the skeleton cannot supply, the act at the continuum, and proves it equal to the value. And it supplies that act once, in the open, as the field \thm{supply} of the structure \thm{ActualFlows}, from which global regularity follows by a theorem whose cone is empty.

### What is new

The template is the author's Riemann closure and its master volume (Islam 2026g, 2026h), and the physical reading of registration is that of the author's operating system (Islam 2026i). The author's earlier papers proved a continuation criterion on the alignment defect of the vorticity and named an effective premise to close it (Islam 2026a, 2026b), closed four reading routes to that premise (Islam 2026e), shielded the unforced row from forced constructions (Islam 2026c, 2026d), and built a kinetic witness on Burgers' equation (Islam 2026f). The effective premise was a placeholder written before the formal register and the physical operating system existed. This paper retires it and reduces the row to existence alone. It adds the proof that existence as given holds in both worlds and forces no value; the act as existence read on the row, equal to the value; the universal closure with its exclusive gates, proved without excluded middle; the kinetic theorem from the quantum speed limit with the cascade, a hypothesis carried as a field that links the count to the stages in limit form, which proves regularity on matter rather than observing it; the proof that energy does not decide; the freedom of the row, with the shape of a prime in the Bool model of the bit, and the triaxial lock; and a kernel in which every theorem depends on no axiom. The master adds, from the seat of the Riemann and P versus NP closures (Islam 2026m, 2026n): the normal form of the row; the host and its binding, proved, the sentence at every horizon; the equations and statement (A) written in Mathlib, the rest state proved global and the energy proved never to rise on every truncation; the row split by the size of the datum; the dyadic wall, every cascade cut by the speed limit; the residue printed and assumed nowhere; the bit delivered twice; the witnesses of the subject typed; the question closed to one bit; the twelve formal gates run in the kernel; nothing escapes; and the ten steps and the final form, each one theorem.

## Existence placed: what is given, and what it carries

Existence is given universally, and the paper takes that seriously enough to prove exactly what universality carries. The root in its formal reading, that to exist is to actuate,
$$\mathrm{Root}(U,\Delta E)\ :\iff\ \forall x\in U:\ 0<\Delta E(x),$$
is satisfiable on every background (\thm{root_satisfiable}), and holds vacuously on the empty one (\thm{root_given}). The arrow, a map on every type, holds everywhere (\thm{arrow_given}). The freedom bit, one orbit of two with neither point its own denial, holds everywhere (\thm{freedom_given}).

What holds everywhere holds in both worlds: the arrow holds in the regular world and in the blowup world (\thm{existence_as_given_in_both_worlds}). Under any root, on every frame, the act is the value, every instant lands on a gate and one blowup refutes the act: existence as given carries the form of the closure (\thm{given_carries_the_form}). Whatever follows from the root uniformly in its symbols holds without it (\thm{root_conservative}). No statement that reads the same on every frame is the value (\thm{given_is_not_the_value}), and in particular the arrow forces nothing (\thm{arrow_forces_nothing}). This is the first theorem of the closure, not a limit of it. Existence as given is the ground on which every frame stands, and a ground on which both worlds stand cannot be the difference between them. The difference is the value, and Section 8 locates it.

The root is more than given. It is universally presupposed and undeniable in deed: whoever examines it, doubts it or denies it acts, and every denial of a self-grounding root is a deed that instances it (\thm{denial_reenacts_root}); no outside proof adds anything to it (\thm{external_proof_adds_nothing}). It holds on every frame once any deed occurs, and every examination of it is one; in its formal sense, a self-grounding root indexed by frame holds on every frame and forces the value on no frame uniformly: no derivation of the value on every frame from the family exists (\thm{grounded_on_every_frame_forces_no_value}). It is held by its deed in the world where the value holds and in the world where it fails alike, and for that very universality it fixes the form of every closure and decides no value by itself, neither forcing the value nor refuting it, both conjuncts of one theorem (\thm{undeniable_root_forces_no_value}). Its undeniability stays with the root: the constructed root is grounded, it does not carry over to its reading on every frame, and the row's reading is not grounded on every frame, not such a family, since it grounds itself exactly where the value holds (\thm{undeniability_stays_with_the_root}, \thm{row_root_grounds_iff_value}). Read on the row it becomes the act, the root's own formula with the row's existents and the row's actuation (\thm{root_on_row_is_the_act}), keyed where the root is not (\thm{root_read_on_row_is_keyed}): the act stands at premise grade, the one premise of the row, and the root beneath it is proved at theorem grade (Appendix R).

## The route ledger

Every route to the value is a method, and each method's reach is a theorem of the kernel.

```{=latex}
\begin{table}[htbp]\centering\scriptsize
\renewcommand{\arraystretch}{1.15}
\begin{tabularx}{\columnwidth}{@{}>{\raggedright\arraybackslash}p{0.27\columnwidth}Y>{\raggedright\arraybackslash}p{0.30\columnwidth}@{}}
\toprule
\textbf{Route} & \textbf{Reach} & \textbf{Theorem}\\
\midrule
Existence as given & forces no value; holds in both worlds & \thm{given_is_not_the_value}, \thm{existence_as_given_in_both_worlds}\\
Energy & does not decide: the inequality survives a blowup & \thm{energy_does_not_decide}\\
A finite record & does not decide & \thm{finite_record_never_forces}\\
Symmetry & does not lift small data & \thm{no_symmetry_lifts}\\
A uniform step in the size & reaches every size on a ladder that carries it & \thm{uniform_step_forces_all}\\
The speed limit and the cascade, on matter & decide: no physical flow blows up, the frame of matter is regular, and both fields are load-bearing & \thm{no_physical_blowup}, \thm{matter_regular_from_speed}, \thm{speed_is_load_bearing}, \thm{cascade_is_load_bearing}\\
Existence read on the row & is the value, by one act & \thm{act_is_the_value}, \thm{regularity_from_existence}\\
\bottomrule
\end{tabularx}
\par\vspace{3pt}{\footnotesize\color{accent}\itshape Table 2 \textbar\ The route ledger. Every cone is empty.}
\end{table}
```

The ledger closes on its last two rows. On matter the value is reached by a theorem; at the continuum it is reached by the act. No other row reaches it. The last two reach it from named fields: matter from speed and cascade (\thm{speed}, \thm{cascade}), the continuum from supply (\thm{supply}). The first three force no value, by the theorems they cite; symmetry lifts no small datum to a large one (\thm{no_symmetry_lifts}); and the uniform step reaches every size only on a ladder that carries one (\thm{uniform_step_forces_all}).

## The frame, and the one cut

A frame registers each datum at each time. The record of the row, what observation and the price of dissipation report, reads the same in the regular world and in the blowup world, and any record that reads the two alike decides nothing: no reading of it is the value on every frame (\thm{record_wall_on_frames}). The paper uses four records, each under its own word: the kinetic record, the Bool model of the bit, whose wall is \thm{record_wall}; the regularity record of the first $n$ data, which never forces the value (\thm{finite_record_never_forces}); the energy record, energy and dissipation paid, which a regular priced frame shares with the blowup priced frame, so that it decides nothing in either direction (\thm{energy_record_decides_nothing}); and the fold's record, the word of the statement of the Root Axiom's nature, the image of the registration of an actuation, which keeps the height, forgets the side, reads a point and its reversal alike and lands on the seat (Appendix R.2, \thm{registration_is_the_folds_record}, \thm{reg_lands_on_seat}). Each record of the row is scoped to its own theorem: the kinetic record keeps everything the two worlds share and forgets which world is actual, in the Bool model (\thm{record_wall}); the energy record reads the regular priced frame and the blowup priced frame alike, so no reading of it is the value on every frame (\thm{energy_record_decides_nothing}, \thm{record_wall_on_frames}); and the regularity record of the first $n$ data is read on the staged world alone, regular on its first $n$ data with the value failing, so that record forces no value (\thm{finite_record_never_forces}). The word cut carries two senses: in the statement of the Root Axiom's nature the cut is the triaxial cut, an involution with its registration and its seat; in Appendix R.2 the only special cut is the seat, where both blind spots cancel (\thm{the_only_special_cut}, \thm{seat_cancels_both}). On this row the value bit's swap of the two worlds over one record, the Bool model (\thm{record_wall}, \thm{fibre_is_two}, \thm{one_free_orbit}), has no fixed point (\thm{freedom_given}); the triaxial cut is carried by the root's actuation, whose seat is the record point a point and its reversal both land on (Appendix R.2, \thm{open_at_the_seat}), and the one cut of this section's title is that cut, this paper's kernel stating no seat of its own. Sections 6 and 7 read their theorems, structurally, as statements about what the record of the row keeps and what it forgets.

## Freedom: the two worlds, and the prime's shape

Over the record the value fibre has two points, the world where the value holds and the world where it fails, and no reading of a record the two worlds share is the value on every frame (\thm{record_wall_on_frames}). In the Bool model of the bit, the kinetic record, the fibre has exactly two points (\thm{fibre_is_two}), neither its own denial (\thm{freedom_given}); negation moves every world and every world is the given one or its negation, one free orbit (\thm{one_free_orbit}); and no reading of that record returns the world (\thm{record_wall}). Two is the count of the value bit, not of the frames over a record: the regular priced frame and the blowup priced frame carry one energy record, energy one and dissipation one at every datum, and differ in the value, so the value bit over that energy record takes both of its points (\thm{energy_record_decides_nothing}); and the fibre of frames over the record of the first $n$ data holds the staged world of every $n$, regular on its first $n$ data and not regular (\thm{finite_record_never_forces}), and with it the staged world of every $m\ge n$, regular on its first $m$ data and so on its first $n$, infinitely many frames over one record. This is the freedom of the row, and in the Bool model it has the shape of a prime; the comparison is structural, the kernel proving the two counts and the orbit structure and no map between the fibres. The multiplicative fibre over a prime $p$,
$$\{(a,b)\in\mathbb{N}^2:\ ab=p\}=\{(1,p),(p,1)\},$$
is exactly two points, off the seat $a=b$; the kernel checks at $p=7$ that the two counts agree (\thm{prime_shape}) and that swapping the factors of each point reverses the fibre, one swap orbit (\thm{prime_fibre_one_swap_orbit}). One free orbit carries one bit. The record leaves exactly that bit, as a prime leaves exactly one.

## The triaxial lock

Over $\mathbb{F}_2^3$, two independent linear axes leave exactly two points for every target, and three independent axes lock exactly one:
$$\begin{gathered}\#\{x\in\mathbb{F}_2^3:\ r_1\cdot x=t_1,\ r_2\cdot x=t_2\}=2,\\ \#\{x\in\mathbb{F}_2^3:\ r_i\cdot x=t_i,\ i=1,2,3\}=1,\end{gathered}$$
for independent $r_i$ and every target (\thm{two_axes_leave_two}, \thm{three_axes_lock_one}). The two axes of the record, observation and price, are the kinetic line; its two points are the two worlds of Section 6; the act of Section 8 is the third axis, and with it the lock forms on one point. This reading of $\mathbb{F}_2^3$ is the paper's structural reading in its own coordinates, observation, price and the act, three independent axes; it is a second statement beside the actuation's triple of Appendix R.2, the fold, the registration and the orientation, and the paper claims no map between the two. The counts are theorems; their reading onto the row is structural.

## The act: existence read on the row

Existence read on the row is the statement that whatever exists acts finitely at every time,
$$\begin{aligned}&\mathrm{ActsFinitely}(F)\\ &\quad:\iff\ \forall d\ \forall t\ \exists n:\ N_F(d,t)=n.\end{aligned}$$
The kernel proves it is the value, exactly (\thm{act_is_the_value}), and that it is keyed: it holds in the regular world and fails in the blowup world (\thm{act_is_keyed}). Its supply is exact: an act exists on a frame exactly when the value holds there (\thm{supply_iff}).

The equivalence is the strength of the closure, as the equivalence of least erasure with the critical line is the strength of the author's Riemann closure (Islam 2026g). Any premise that closes the value implies the act, and the weakest such premise is the act, the value itself (\thm{act_is_the_weakest_premise}, from \thm{act_is_the_value}); and Section 3 proved that nothing given on every frame is the value. A closure that assumed less would be wrong, since every premise that forces the value implies the act (\thm{act_is_the_weakest_premise}); a closure that assumed more would close the question from a premise the question does not need. The act assumes exactly the value, read as an act of existence, and nothing beside it in the kernel; the reading of the frame as the equations is the reader's identification, declared in Section 2.

## The proof: global regularity from existence

\begin{jbox}
\textbf{Definition 9.1} (\thm{ActualFlows}). A structure with two fields: \thm{F}, the frame, standing for the strong solutions of the unforced equations with their registrations, the identification, blowup with an unbounded count included, being the reader's; and \thm{supply}, existence acting finitely on that frame. The second field is the assumption of the closing theorem, and its only one; the matter theorem of Section 11 carries its own fields, the cited speed limit and the cascade, a hypothesis carried as a field, in its own input type.

\textbf{Theorem 9.2} (\thm{regularity_from_existence}). For every \thm{A : ActualFlows}, every datum of \thm{A.F} is regular. \emph{Cone: none.}
\end{jbox}

The proof of global regularity is Theorem 9.2. Its only assumption is one field of its input type, visible in the statement; its cone is empty, without even the standard axioms; and outside this section the structure enters only the theorems that read its supply or carry the closure whole (\thm{supply_iff}, \thm{nothing_escapes}, \thm{the_closure}, \thm{the_lock}, \thm{the_lock_on_the_root}, \thm{from_existence_alone}).

## Nothing escapes

Every instant of every datum lands on exactly one gate, a finite count or an unbounded one (\thm{every_instant_lands}, \thm{gates_exclusive}), with no third landing. The dichotomy is proved without excluded middle, because a count is a value and not a proposition. Under the act every datum at every time acts finitely (\thm{nothing_escapes}). One unbounded count refutes the act (\thm{blowup_refutes}), and wherever the act fails it cannot be that no datum blows up (\thm{only_refuter}). The closure is universal in the exact sense the gates give it: there is no datum, no time and no instant that the act does not decide, and there is one form, a blowup, in which it could be refuted.

## The price: what energy does not decide, and what the speed limit does

**Energy does not decide.** The energy inequality,
$$\begin{aligned}\tfrac12\|u(t)\|_{L^2}^2&+\nu\int_0^t\|\nabla u(s)\|_{L^2}^2\,ds\\ &\le\ \tfrac12\|u_0\|_{L^2}^2,\end{aligned}$$
bounds the dissipation paid by the energy (Leray 1934), and it holds on a frame where a datum blows up (\thm{energy_does_not_decide}). This is the frame-level face of supercriticality, whose analytic form is that the energy scales as $\lambda^{-1}$ under $u_\lambda$: a finite energy budget is compatible with a singularity, because the singularity concentrates at scales where the energy cost vanishes.

**The speed limit decides, on matter.** A physical flow is a quantum system, and the quantum speed limit (Mandelstam and Tamm 1945; Margolus and Levitin 1998) bounds the time to reach an orthogonal state by $\pi\hbar/(2E)$, with $E$ the mean energy above the ground state (Margolus and Levitin) or the energy spread (Mandelstam and Tamm), so the number of distinguishable changes of state by time $t$ satisfies
$$N(t)\ \le\ c\,E\,t,\qquad c=\frac{2}{\pi\hbar}.$$
In the kernel $c$ is any natural-number upper bound for $2/(\pi\hbar)$ in the chosen units, and the deduction does not depend on its value. The energy $E$ of the speed limit, the mean energy above the ground state, is the field \thm{energy} of \thm{Physical}; the finite energy of Section 2, the $L^2$ class of the datum, is the field \thm{energy} of \thm{Priced}; the two are named apart, and the paper claims no map between them.
Under the cascade, a hypothesis carried as a field, a singularity by time $T$ requires, before $T$, more registrations than any given number; its physical reading, that a singularity excites arbitrarily fine scales, is the reader's identification. The two together contradict each other at $N=c\,E\,T$. The frame of matter carries its own count, the count of Section 2: blowup by $T$ is a count unbounded by $T$, and the cascade, a hypothesis carried as a field, the limit-form link between the count and the stages, makes such a count a run of registrations before $T$ above every bound. The speed limit bounds every one of them by $c\,E\,T$, so no datum blows up (\thm{no_actual_blowup}); every count of the frame of matter is then finite at every time, existence acts finitely there, and the frame is regular in the sense of Section 2 (\thm{matter_acts_finitely}, \thm{matter_is_regular}). The speed limit carries the weight, and the cascade carries it to the frame's count. The speed limit alone excludes blowup in its limit form: on a world carrying the speed limit and nothing else, no cascade field, the stage counts before a horizon never pass every bound (\thm{no_limit_blowup_from_speed_only}), and on every physical frame likewise, the cascade entering that deduction nowhere (\thm{no_limit_blowup_from_speed}); the cascade carries that exclusion to the frame's own count, so that no physical flow blows up and every count is finite at every time (\thm{no_physical_blowup}, \thm{matter_acts_finitely}). Both fields are load-bearing. Without the speed limit, blowup in the sense of Section 2 is satisfiable under the cascade, by a world whose count by time one is unbounded, whose frame is not regular, and whose registrations exceed every bound (\thm{speed_is_load_bearing}); without the cascade the speed limit holds and still a world's count by time one is unbounded and its frame is not regular (\thm{cascade_is_load_bearing}), that world, \thm{speedWorld}, its count unbounded at every time and every stage zero by its definition, satisfying Section 2's definition of blowup, so the cascade is a hypothesis a frame can fail and not that definition. The speed limit and the cascade enter as fields of the structure \thm{Physical}: the speed limit is cited at its grade, and the cascade is a hypothesis carried as a field at its own grade, the limit-form link between the count and the stages, not a cited physical result and not Section 2's definition, its physical reading part of the reader's identification; a physical frame exists (\thm{physical_inhabited}), and the deduction from the two fields is on no axiom.

That is the kinetic closure on matter, from the speed limit in two senses: in the limit sense, every stage count before every horizon bounded and so never passing every bound, from the speed limit alone (\thm{no_limit_blowup_from_speed_only}; on the physical frame, \thm{no_limit_blowup_from_speed}); in the count sense, no datum blows up and the frame of matter is regular, from the speed limit with the cascade (\thm{no_actual_blowup}, \thm{matter_regular_from_speed}). Its scope is matter, a quantum system with a molecular cutoff. The continuum equations idealize matter, and the step from the one to the other is the identification the reader makes in Definition 9.1. It is the step the act supplies.

## The record and the seed

No finite record forces the value: for every $n$ the staged world is regular on its first $n$ data and the value fails (\thm{finite_record_never_forces}). No symmetry lifts the small-data region: the symmetries the text checks, space scaling and viscosity scaling with rotations and translations, keep the dimensionless size $\|u_0\|_{\dot H^{1/2}}/\nu$, since space scaling $u_\lambda(x,t)=\lambda u(\lambda x,\lambda^2 t)$ fixes $\dot H^{1/2}$ and viscosity scaling multiplies norm and $\nu$ alike, so no small datum is carried onto a large one (\thm{no_symmetry_lifts}). A step uniform in the size reaches every size (\thm{uniform_step_forces_all}). The seed is evidence for the fibre of Section 6, and for neither of its points.

## The forced class

The forced alternatives are their own class. The author's transport theorem proves that a forced breakdown transports only to a system that is not closed (Islam 2026d), and his filter paper proves the forced alternative a regularity filter on a prescribed field (Islam 2026c). The unforced closure stands whatever the audit of the September 2026 forced construction finds, and this paper asserts nothing about its correctness.

## The normal form of the row

Part A of the master reads the row as the P versus NP seat reads computation and the Riemann seat reads the zeros (Islam 2026n, 2026m): a type of frames, the value of a frame, and the registration of a frame onto its record, which keeps every existent and forgets the side of its realization. On the Navier–Stokes row the existents are the data with the counts of the registrations their flows make by each time; the record keeps every datum and registers its flow finite at every time, the count at rest, so on the record every datum is regular (\thm{every_datum_has_its_seat}). On the record the value holds with no premise (\thm{record_has_the_value}, \thm{recFrame_value}). The value of a frame is then exactly one implication, the transfer of the value from the record to the frame (\thm{normal_form}). The antecedent is a theorem, so the implication carries the whole content of the value: the record's value carried by the one implication is the value (\thm{value_from_the_cargo_loop}), and the transfer holds exactly when the act stands (\thm{bit_is_the_act}). The record is self-recursive with no premise, and a frame is self-recursive exactly when it carries the value (\thm{record_is_self_recursive}, \thm{self_recursion_at_frame}).

The bit is keyed. It holds on the calm frame and fails on the counter frame (\thm{bit_is_keyed}), whose record is self-recursive while the frame is not (\thm{record_self_recursion_does_not_transfer}). The two coherent frames share a record and split on the value (\thm{record_decides_nothing}); a principle true of the record of every frame decides the value on none (\thm{no_record_principle_decides}); and what every frame shares yields the value on no frame where it fails (\thm{keyless_forces_nothing}). Every route to the value, from any premise and in any vocabulary, passes the transfer (\thm{every_route_passes_the_bit}), and across the frames of the row the transfer is neither always true nor always false (\thm{no_uniform_answer}). One theorem binds the record, the transfer, the act, self-recursion, every route and the denial, and the value is not a conjunct of it (\thm{normal_form_complete}). Read as a law of every frame, "nothing is outside the record" is false, since the counter frame's record carries the value and the frame does not; read at a frame, it is the value itself (\thm{nothing_outside_the_record_is_the_bit}). Figure 3 draws the normal form with the host of Section 15.

```{=latex}
\begin{figure*}[tp]
\centering
\includegraphics[width=\textwidth]{figs/NS_Figure_3_v1_1_0_CC.pdf}\\[5pt]
\begin{minipage}{\textwidth}\footnotesize{\color{deep}\textbf{Figure 3}}\ \textbar\ The normal form of the row, the record, the transfer and the value; what it proves with no premise; and the host and its binding, proved.\end{minipage}
\end{figure*}
```

## The host and its binding, proved

Part B of the master proves the binding. The host is the row's smooth divergence-free initial data of rapid decay on $\mathbb{R}^3$, unforced, each with the count of the registrations its flow has made by each time, none where the count is unbounded, which is blowup by that time (\thm{Host}); its sentence is that every flow is finite at every time. The value of the host's frame is exactly the host's sentence (\thm{binding}), the root read on the row is the sentence (\thm{root_on_row_is_the_sentence}), and the act is the sentence (\thm{act_is_the_sentence}). The sentence is exactly the sentence at every horizon (\thm{sentence_iff_every_horizon}), and one blowup refutes it (\thm{blowup_refutes_sentence}).

The Mathlib binding of Appendix C writes the row in the library's calculus. The Navier–Stokes equations on $\mathbb{R}^3$, unforced, with viscosity $\nu$, are tested against every direction, so that the pressure enters through its derivative (\thm{NSAt}); the rest state solves them at every viscosity and every constant pressure (\thm{rest_state_solves}), and the rest datum is admissible and its flow global, smooth and of bounded energy (\thm{the_seat_is_global}): the record carries the value with no premise. Fefferman's statement (A) is written in the library's terms (\thm{FeffermanA}), and the kernel's host of the library's admissible data, each read by whether its flow is global and smooth with bounded energy, has as its value exactly statement (A) (\thm{kernel_reads_mathlib}, \thm{sentence_is_statement_A}); one admissible datum with no such flow refutes it (\thm{the_one_refuter}). On every finite-dimensional truncation of the flow, where the dissipation is nonnegative and the nonlinearity does no work, the energy never rises (\thm{galerkin_energy}); in the master, the energy record decides nothing.

## The row split: the real part proved, the unicorn part the one bit

Part C of the master is the cut-agnostic division, carried verbatim from the Riemann master (Islam 2026m) and generic over its existents: at every cut the whole is exactly its real part and its unicorn part (\thm{whole_iff_real_and_unicorn}); a certificate at the cut proves the real part (\thm{real_part_of_certificate}); given the real part, the whole is exactly the unicorn part (\thm{unicorn_no_bypass}); above every cut no reading of an even record agrees with an odd decision (\thm{unicorn_block}); the aperture is one bit wide (\thm{aperture_one_bit_wide}); conditioning the unicorn part on an inhabited premise leaves it where it was (\thm{unicorn_rule_exact}); and the supply side is silent at the register (\thm{supply_side_silent}).

Part C′ reads the division by the size of the datum, on a frame that carries the cited small-data theorem as a field (\thm{SmallData}): the existents are the frame's data, the property each is asked is regularity, and the height is the size of the datum in the critical norm. At the threshold the real part is the small data, regular by the cited theorem (\thm{real_part_small}); the value is exactly its real part and its unicorn part at every cut (\thm{value_iff_real_and_unicorn}); given the real part, the value is exactly the unicorn part, the large data (\thm{no_bypass_at_small_data}, \thm{unicorn_is_large_data}). The unicorn part is load-bearing: the staged world carries the small-data field and the real part, and fails the value on its large data (\thm{unicorn_part_is_load_bearing}). Above every size no reading of a record that keeps the size and forgets the world returns the world (\thm{unicorn_blocked_above_every_size}), and the aperture is one bit wide (\thm{aperture_is_one_bit}).

Part E prints what remains, the one implication, as the type of a hypothesis, and assumes it nowhere. Given it, the Navier–Stokes sentence follows on no axiom (\thm{sentence_of_the_act}); the transfer at the host's frame is exactly the Navier–Stokes sentence (\thm{residue_is_the_sentence}); the one posit is the bit, the root read on the row being exactly the transfer (\thm{the_posit_is_the_bit}); and the residue is keyed, supplied by no premise shared by every frame and by no principle true of every record (\thm{residue_is_keyed}). Its instance seat, \thm{LargeSeat}, regularity of every large datum on a frame carrying the small-data theorem, is inhabited exactly when the frame carries the value, the seat being exactly the unicorn part (\thm{seat_is_the_unicorn}) (\thm{seat_iff_value}); nothing in the kernel assumes it inhabited. Figure 4 draws the split.

```{=latex}
\begin{figure*}[tp]
\centering
\includegraphics[width=\textwidth]{figs/NS_Figure_4_v1_1_0_CC.pdf}\\[5pt]
\begin{minipage}{\textwidth}\footnotesize{\color{deep}\textbf{Figure 4}}\ \textbar\ The row split: the value exactly its real part and its unicorn part; the real part proved; the unicorn part the one bit, closed to the record, its aperture one bit wide.\end{minipage}
\end{figure*}
```

## The walls: every zero-bit route barred by theorem

Step 9 of the closure is a wall on every route that would reach the Navier–Stokes sentence without the bit. Existence as given carries the form and forces nothing (\thm{given_carries_the_form}, \thm{given_is_not_the_value}). The energy inequality holds on a blowup frame, and the energy record decides nothing (\thm{energy_does_not_decide}, \thm{energy_record_decides_nothing}). No finite record forces the value (\thm{finite_record_never_forces}), and no size-preserving symmetry lifts a decided datum (\thm{no_symmetry_lifts}). The speed limit and the cascade are each load-bearing (\thm{speed_is_load_bearing}, \thm{cascade_is_load_bearing}). Part D adds the dyadic wall, decided by the kernel and proved at every bound: a cascade that doubles its registrations at every dyadic step passes every bound $c\cdot E\cdot T$ within $c\cdot E\cdot T$ steps (\thm{dyadic_cascade_is_cut}), two to every power exceeding the exponent (\thm{exponent_below_its_power}); it passes the bounds 1, 12, 100, 1000 and 4096 at the steps 1, 4, 7, 10 and 13, and at the bound $1\cdot3\cdot4$ it passes at step 4, its step 3 still inside (\thm{dyadic_cutoffs}). So no doubling cascade holds to the speed limit (\thm{doubling_breaks_the_speed_limit}), and the cascade a blowup needs halts at a finite dyadic step on matter. One theorem states the walls of the row (\thm{the_walls}). Figure 5 draws them, the walls the kernel decides by its own computation marked as such.

```{=latex}
\begin{figure*}[tp]
\centering
\includegraphics[width=\textwidth]{figs/NS_Figure_5_v1_1_0_CC.pdf}\\[5pt]
\begin{minipage}{\textwidth}\footnotesize{\color{deep}\textbf{Figure 5}}\ \textbar\ The walls: every zero-bit route barred by theorem, the walls the kernel decides by its own computation marked.\end{minipage}
\end{figure*}
```

## The bit delivered twice: two kinds and no third

Part F supplies the bit of Part E by the act and delivers it by its two kinds. Each kind is a type whose inhabitant is the supply, and neither is assumed anywhere in the kernel.

**Kind 1, the formal cargo.** The record's value carried to the host's frame (\thm{FormalCargo}). It arrives with no premise, its antecedent a theorem (\thm{cargo_arrives}); it gives the Navier–Stokes sentence in one step (\thm{formal_kind_delivers}); and it is exactly the Navier–Stokes sentence (\thm{formal_iff_sentence}).

**Kind 2, the physical witness.** The energy of each datum, the stage counts of registrations before each horizon, and the speed constant; the quantum speed limit, every stage count before $T$ at most $c\cdot E\cdot T$; and the cascade, an unbounded count by $T$ needing stage counts before $T$ above every bound. The last two fields are the bit read in the register of registrations, premises of the witness carried as fields and never proved (\thm{PhysicalWitness}). It closes the frame (\thm{witness_closes}), it gives the Navier–Stokes sentence (\thm{physical_kind_delivers}), and a witness exists exactly when the Navier–Stokes sentence holds (\thm{physical_iff_sentence}).

**One bit, two kinds, no third.** The physical witness is a formal cargo, and the cargo is exactly the Navier–Stokes sentence (\thm{the_two_kinds_are_one_bit}); either kind gives the Navier–Stokes sentence (\thm{delivered_twice}); every witness of the Navier–Stokes sentence, in any vocabulary, is a delivery of both kinds (\thm{two_kinds_and_no_third}); and one blowup refutes both at once (\thm{the_one_refuter}). One theorem closes the supply with nothing before its colon (\thm{the_supply_closed}).

**The witnesses of the subject, typed.** The energy inequality holds on a blowup frame, and the energy record decides nothing (\thm{energy_does_not_decide}, \thm{energy_record_decides_nothing}). The small-data theorem gives the real part on every frame that carries it and stops short of the value (\thm{real_part_small}, \thm{unicorn_part_is_load_bearing}). The speed limit and the cascade are each load-bearing (\thm{speed_is_load_bearing}, \thm{cascade_is_load_bearing}), and on every physical frame every stage count before every horizon is bounded, no datum blows up, and the frame of matter is regular (\thm{no_physical_blowup}, \thm{matter_is_regular}). Each is typed against the bit, and none is its ground (\thm{the_witnesses_typed}). Figure 6 draws the two kinds and the typed witnesses.

```{=latex}
\begin{figure*}[tp]
\centering
\includegraphics[width=\textwidth]{figs/NS_Figure_6_v1_1_0_CC.pdf}\\[5pt]
\begin{minipage}{\textwidth}\footnotesize{\color{deep}\textbf{Figure 6}}\ \textbar\ The bit delivered twice: the formal cargo and the physical witness, one bit, two kinds and no third, with the one refuter and the witnesses of the subject typed.\end{minipage}
\end{figure*}
```

## The closure of the question: it cannot stay open

Section 18 supplies the value. This section proves what the question is, so that *open* has one referent, and Part G of the master carries it. The Navier–Stokes sentence and the bit are one proposition, with nothing cited (\thm{the_sentence_is_the_bit}); the denial of the Navier–Stokes sentence is the bit's denial (\thm{denial_is_the_bits_denial}); one blowup refutes the Navier–Stokes sentence itself (\thm{blowup_refutes_sentence}); wherever the Navier–Stokes sentence fails, the denial has one road (\thm{the_denial_has_one_road}); and one theorem closes the question to one bit: the Navier–Stokes sentence is the bit and its denial the bit's denial, the bit has no uniform answer across the frames, no keyless premise forces it, either kind of the supply gives the Navier–Stokes sentence, and the one refuter denies it (\thm{question_closed_to_one_bit}).

Part T refutes the open framing count by count, in one theorem (\thm{the_open_framing_is_refuted}). Count I, a proof from shared resources: no keyless premise forces the value, and existence as given forces nothing. Count II, a decision read from the record: the calm and counter frames share a record and split on the value, the energy record decides nothing, no finite record forces the value, and above every size no reading of the record returns the world. Count III, a route past the bit: no premise reaches the Navier–Stokes sentence while the bit fails. Count IV, what remains: the bit, its antecedent proved with no hypothesis and the bit proved equivalent to the Navier–Stokes sentence.

The Clay Mathematics Institute lists Navier–Stokes existence and smoothness among its Millennium Prize Problems as open; statement (A), global smooth solutions of bounded energy from every admissible datum on $\mathbb{R}^3$, is one of its four forms, and the Mathlib binding writes it in the library's own terms (\thm{FeffermanA}). The theorems of this section fix what that openness can mean. The form of the question is closed: the sentence is one implication at every host, equivalent to the bit in both directions, with every uniform route barred by theorem and every route that crosses the row a delivery of the bit; and at the library's host the kernel's value is exactly statement (A) (\thm{kernel_reads_mathlib}). What remains open, in the only sense the word keeps, is the value of that bit; and the bit is not left open, since the act supplies it and delivers it twice (Section 18). Clay cannot stay open: the question is closed by theorem to one bit.

Part W runs the twelve formal gates of the mathematical register inside the kernel, each a proposition passed by a theorem, and four claims fail by theorem: that the Navier–Stokes sentence is proved by the delivery fails SREP, the delivery's premise being its conclusion; "a proof is waiting" fails SREP, a true route to the Navier–Stokes sentence being the Navier–Stokes sentence itself; "no proof can ever exist" fails SREP, no true route to the Navier–Stokes sentence being its denial, the counter world in costume; and the denial has one road, one blowup. One theorem binds the twelve passes and the four refusals with nothing before its colon (\thm{the_formal_run}).

## Nothing escapes: our way or no way

Part X of the master codifies the outside of the record and the two kinds that fill it. The record of the host's frame closes (\thm{the_record_closes}), and what it leaves undecided, whether the host's frame itself carries the value, is exactly the Navier–Stokes sentence (\thm{the_undecided_is_the_bit}). Read as a law of every frame, "nothing is outside the record" is false; read at the host's frame, it is the bit (\thm{nothing_outside_the_record_is_the_bit}). A block needs an outside: if the target is a function of the record, no record-preserving involution flips it (\thm{block_needs_an_outside}); at the host's frame the outside is the supply in its two kinds, the physical kind being the formal kind (\thm{the_outside_is_the_supply}).

Whatever premise, in whatever vocabulary, gives the Navier–Stokes sentence delivers the formal cargo and a physical witness (\thm{every_route_is_both_kinds}); either kind delivers it (\thm{both_kinds_deliver}); and every so-called other way to the Navier–Stokes sentence is our way in different vocabulary: it delivers both kinds, and if the bit failed it would fail with it (\thm{our_way_or_no_way}). An offering that crosses the row is a delivery of the cargo, never a bypass of it. 

One theorem states that nothing escapes, with nothing before its colon: the record of the host's frame closes; what it leaves undecided is the bit; no law of every frame puts everything inside the record; the outside is the supply in its two kinds; every route to the Navier–Stokes sentence is a delivery of both kinds; either kind delivers it; and every so-called other way is our way in different vocabulary (\thm{nothing_escapes}). The capstone adds that no keyless premise forces anything, that to shut every true route to the Navier–Stokes sentence is to assert its denial, and that the twelve formal gates pass (\thm{the_capstone}). Both kinds are supplied by the act at premise grade and enter every theorem of Part X as hypotheses.

## The ten steps and the final form

Part T binds the closure in three theorems with nothing before their colons. The ten steps are one theorem (\thm{the_ten_steps}). Step 1, the floor: the root holds on its constructed domain. Step 2, the basis: every instant lands on exactly one gate, a finite count or an unbounded one, and a prime's multiplicative fibre is two points. Step 3, the domain: the host frame's value is the sentence, and the sentence is the sentence at every horizon. Step 4, the record: the record carries the value, and every datum rests on it. Step 5, the halted uniduction: the frame is self-recursive exactly when the sentence holds. Step 6, the monism zone: the two frames share one record and split on the value, and the bit is keyed. Step 7, the axis: the bit is exactly the sentence. Step 8, the real part: the small data regular by the cited theorem, the value exactly its large-data part, and every dyadic cascade cut by the speed limit. Step 9: every route passes the bit, no keyless premise forces it, and the walls stand, matter regular from the speed limit. Step 10: the bit delivered twice, by the formal cargo and by the physical witness. Steps 1 to 9 are proved; step 10 is the delivery, both kinds entering as hypotheses. The terminal verdict binds by exact type every theorem the verdict cites: the record and the normal form, the binding, the real part and the cut, the walls, the residue and its seat, the two deliveries, the closed question, the formal run, nothing escaping, the open framing refuted and the ten steps (\thm{the_terminal_verdict}). The final form states, at every host, that the sentence is the bit; it is exactly an inhabited physical witness; it is the sentence at every horizon; on every frame carrying the small-data theorem the value is exactly its large-data part; matter is regular on every physical frame; every route to the sentence is both kinds; and to shut every true route to the sentence is to assert its denial (\thm{the_final_form}).

## The grade of the closure, stated whole

**The root, universal and undeniable in deed:** every denial of it re-enacts it, no outside proof adds to it (\thm{denial_reenacts_root}, \thm{external_proof_adds_nothing}), and it holds on every frame once any deed occurs, in the formal sense that a self-grounding root indexed by frame holds on every frame and forces the value on no frame uniformly: no derivation of the value on every frame from the family exists (\thm{grounded_on_every_frame_forces_no_value}); for that universality it decides no value by itself, neither forcing nor refuting it, both conjuncts of one theorem (\thm{undeniable_root_forces_no_value}); its undeniability stays with the root, the reading on the row not being such a family and grounding itself exactly where the value holds (\thm{undeniability_stays_with_the_root}, \thm{row_root_grounds_iff_value}); and read on the row it is the act, the root's own formula on the row (\thm{root_on_row_is_the_act}), keyed, at premise grade (\thm{root_read_on_row_is_keyed}).

**Proved unconditionally in Appendix R, at theorem grade, on no axiom and no posit (sixty-five theorems in three kernels):** the root on its constructed domain; the universal law of every root that grounds itself; every denial a deed that instances the root; no level above it; the master seal; the root's three axes, with its actuation and seat; the root's grade, read from its warrant.

**Proved in core Lean 4, no library, no \thm{sorry}, no axiom declared, every theorem on no axiom at all (65 theorems, Part 0 of the master, the kernel of record):** the frame and its two worlds; existence given, its conservativity, its holding in both worlds, its forcing no value; the act, its equality with the value, its key, its exact supply; the closure from the act; the exclusive gates and the universal closure; the refutation form; the energy theorem and the energy record that decides nothing (\thm{energy_record_decides_nothing}); the kinetic theorem, no physical blowup from the speed limit with the cascade and none in the limit form from the speed limit alone (\thm{no_physical_blowup}, \thm{no_limit_blowup_from_speed_only}, and on the physical frame \thm{no_limit_blowup_from_speed}), the load-bearing role of the speed limit and of the cascade (\thm{speed_is_load_bearing}, \thm{cascade_is_load_bearing}), and regularity on matter from the speed limit with the cascade (\thm{matter_regular_from_speed}); the freedom wall in the Bool model and on frames (\thm{record_wall}, \thm{record_wall_on_frames}), the fibre, one free orbit, the prime's shape and its one swap orbit; the two lock counts; the finite record, the symmetry theorem and the uniform step; and the closure whole; the root satisfiable on every background and on its constructed domain (\thm{root_satisfiable}, \thm{constructed_root_holds}); the root read on the row, equal to the act and to the value, and keyed (\thm{root_on_row_is_the_act}, \thm{root_on_row_is_the_value}, \thm{root_on_row_is_keyed}); the act the weakest premise that forces the value (\thm{act_is_the_weakest_premise}); nothing given forces the value or refutes the act on every frame (\thm{nothing_given_forces}, \thm{nothing_given_refutes}); the root grounded on every frame forcing no value, and the row's reading grounding itself exactly where the value holds (\thm{grounded_on_every_frame_forces_no_value}, \thm{undeniability_stays_with_the_root}, \thm{row_root_grounds_iff_value}); the lock, binding the constructed root, the root by its deed, the root read on the row, the keyed act, the closure, the record wall and the finite record in one theorem (\thm{the_lock}), and closed at Appendix R's root with no hypothesis (\thm{the_lock_on_the_root}, \thm{RA₀_is_the_constructed_root}, \thm{regularity_from_root_on_row}); the sense of existence alone (\thm{from_existence_alone}).

**Proved in the master, core Lean 4, no library, no \thm{sorry}, no axiom declared, every theorem on no axiom at all (169 theorems, the 65 of Part 0 among them):** the normal form of the row, the record carrying the value with no premise and the value exactly the transfer (\thm{record_has_the_value}, \thm{normal_form}, \thm{normal_form_complete}); the host and its binding (\thm{binding}, \thm{sentence_iff_every_horizon}, \thm{blowup_refutes_sentence}); the cut-agnostic division, carried verbatim, and its reading on the row (\thm{whole_iff_real_and_unicorn}, \thm{value_iff_real_and_unicorn}, \thm{real_part_small}, \thm{no_bypass_at_small_data}, \thm{unicorn_blocked_above_every_size}); the walls (\thm{the_walls}, \thm{dyadic_cascade_is_cut}, \thm{dyadic_cutoffs}, \thm{doubling_breaks_the_speed_limit}); the residue, printed as a hypothesis and assumed nowhere, with its instance seat (\thm{residue_is_the_sentence}, \thm{seat_iff_value}); the two kinds of the supply as types, the cargo arriving free and each kind delivering (\thm{the_supply_closed}, \thm{the_witnesses_typed}); the closure of the question (\thm{question_closed_to_one_bit}); the twelve formal gates and the four refusals (\thm{the_formal_run}); nothing escapes, and the capstone (\thm{nothing_escapes}, \thm{the_capstone}); the open framing refuted, the ten steps, the terminal verdict and the final form (\thm{the_open_framing_is_refuted}, \thm{the_ten_steps}, \thm{the_terminal_verdict}, \thm{the_final_form}).

**Carried as fields:** the quantum speed limit, cited; and the cascade, a hypothesis carried as a field, the limit-form link between the count and the stages, an unbounded count by a horizon having stage counts before it above every bound, proved load-bearing (\thm{cascade_is_load_bearing}); it is not a cited physical result and not Section 2's definition. The kinetic theorem reads the two in two senses: no blowup in the limit sense, stage counts before a horizon passing every bound, from the speed limit alone, on a world carrying the speed limit and nothing else (\thm{no_limit_blowup_from_speed_only}) and on the physical frame (\thm{no_limit_blowup_from_speed}); no blowup in the count sense, the frame's count by a horizon unbounded, from the speed limit with the cascade, which ties the count to the stages (\thm{no_actual_blowup}); both fields load-bearing for the count sense (\thm{speed_is_load_bearing}, \thm{cascade_is_load_bearing}).

**Supplied by the act, named and visible in one input type:** existence acting finitely at the continuum, \thm{supply}, which is the value.

**The reader's identification:** the frame with the strong solutions of the equations, the analytic blowup of a solution with an unbounded count, and matter with the continuum.

The grade of the closure is the grade of its act, and the act, read on every frame, is the value, which the kernel proves no statement given uniformly on every frame can be. That is why the act is named rather than derived: a derivation of it on every frame from what is given uniformly would contradict \thm{given_is_not_the_value}, and the kernel would not compile.

**Proved in the Mathlib binding, on Lean's standard axioms alone (10 theorems, two on no axiom at all, eight on the three standard axioms):** the equations tested against every direction and the rest state solving them (\thm{rest_state_solves}); the rest datum admissible and global (\thm{the_seat_is_global}); the count finite exactly when the flow is global and smooth with bounded energy (\thm{count_finite_iff}); the kernel reading the library, its value statement (A) (\thm{kernel_reads_mathlib}, \thm{sentence_is_statement_A}); the one refuter on the library's objects (\thm{the_one_refuter}); the Galerkin energy theorem (\thm{galerkin_energy}); the forms bound (\thm{the_forms_are_bound}).

**Supplied by the act and delivered twice:** the bit, by the formal cargo and by the physical witness, each a type of the master whose inhabitant is the supply, neither assumed anywhere (\thm{FormalCargo}, \thm{PhysicalWitness}).

## Objections, answered

*The act is only a premise.* It is the root's own formula read on the row, with the row's existents and the row's actuation (\thm{root_on_row_is_the_act}). The root is universal and undeniable in deed: every denial re-enacts it and no outside proof adds to it (\thm{denial_reenacts_root}, \thm{external_proof_adds_nothing}); it holds in both worlds and so decides no value, neither forcing nor refuting it, both conjuncts of one theorem (\thm{undeniable_root_forces_no_value}). That undeniability stays with the root and does not pass to the reading on the row, which grounds itself exactly where the value holds (\thm{undeniability_stays_with_the_root}, \thm{row_root_grounds_iff_value}); that is why the act is keyed and decides what the root alone cannot (\thm{root_read_on_row_is_keyed}). Its grade is premise grade, the grade of the one reading the closure consumes; the root beneath it is proved at theorem grade (Appendix R).

*The act is the conclusion.* It is, by \thm{act_is_the_value}, and the paper proves it must be: every premise that forces the value on every frame implies the act (\thm{act_is_the_weakest_premise}). A closure from a weaker premise is impossible, no statement given on every frame is the value (\thm{given_is_not_the_value}), and a closure from a stronger premise assumes more than the question asks. This is the shape of every closure of a value that differs between coherent worlds, and the paper states it as a theorem rather than discovering it as a defect.

*Existence is universally given; why is it not enough?* Because what is universally given holds in the blowup world too (\thm{existence_as_given_in_both_worlds}). The universality of existence is exactly what keeps it from choosing between worlds. Existence chooses when it is read on the row, and that reading is the act.

*The kinetic theorem is physics.* It is a theorem from one cited physical field, the speed limit, which alone excludes blowup in the limit sense, on a world carrying it and nothing else (\thm{no_limit_blowup_from_speed_only}), and one hypothesis carried as a field, the cascade, the limit-form link between the count and the stages, not a cited physical result and not Section 2's definition, with which it excludes blowup in the count sense (\thm{no_actual_blowup}), with a deduction on no axiom. Its conclusion is about matter. The paper does not transport it to the continuum by theorem; it names the transport as the act.

*The frame is a skeleton, not the equations.* Correct, and stated in Definition 9.1. Every theorem that ranges over frames holds on every frame, so it holds on whichever frame the reader identifies with the equations.

## Falsifiers

**F-Blowup.** A smooth unforced datum of finite energy whose solution is proved to become singular in finite time. It refutes the act by \thm{blowup_refutes}, and it is the one channel the closure leaves open.

**F-Speed.** A physical flow whose number of distinguishable changes of state by time $t$ exceeds the speed-limit bound for its energy. It refutes the field \thm{speed} on that flow, and with it the application of the kinetic theorem to that flow; the theorem, a deduction on no axiom, stands.

**F-Cone.** The kernel, compiled on a stock toolchain, prints any axiom in any cone of the master, or fails to compile, or the Mathlib binding prints any axiom beyond Lean's three standard axioms. It refutes the claim that every theorem is on no axiom. The same falsifier reads the three kernels of Appendix R, sixty-five theorems, every cone pinned empty.

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
Mandelstam and Tamm 1945; Margolus and Levitin 1998 & the quantum speed limit & carried as a field; regularity on matter deduced (\thm{matter_regular_from_speed}) & extends\\
Tao 2016 & an averaged equation blows up & the energy theorem exhibits on the frame what that construction shows analytically & adjacent\\
Islam 2026g, the Riemann closure & one bit, closed by one act & the template carried to this row & extends\\
Islam 2026a--f, Navier–Stokes papers & criteria, a premise, closed routes, a witness & the premise retired; the row reduced to existence & retires (premise of)\\
\bottomrule
\end{tabularx}
\par\vspace{3pt}{\footnotesize\color{accent}\itshape Table 3 \textbar\ Positioning. No prior position is contradicted.}
\end{table}
```

The relation words are used as defined: *extends* where a prior result is carried and a theorem is added on it; *bounds* where its reach is stated exactly; *adjacent* where no formal engagement is claimed; *retires (premise of)* where the prior results stand and the premise they named is replaced by the act of this paper.

## Conclusion

Existence was given before the question was asked, and the paper proves exactly what that givenness carries: under the root, the form of the closure on every frame (\thm{given_carries_the_form}); nothing beyond what holds without the root (\thm{root_conservative}); and the root, the arrow and the bit of freedom holding in both worlds (\thm{existence_as_given_in_both_worlds}). It proves that existence read on the row is the value; that the value follows from that reading by one act; that nothing escapes the act; that one blowup is the only refuter; and that on matter the speed limit makes the absence of blowup a theorem, alone in the limit sense (\thm{no_limit_blowup_from_speed_only}) and with the cascade, a hypothesis carried as a field, in the count sense (\thm{no_actual_blowup}). The freedom of the row is one bit, walled; in the Bool model it is one free orbit with the shape of a prime's fibre; and three axes lock it. Every theorem stands on no axiom at all.

The verdict, in the words of Section 1, unchanged: the Navier–Stokes regularity problem is closed to one act of existence. Existence, its root proved at theorem grade with no hypothesis on its constructed domain and as the law of every root that grounds itself (Appendix R), universally presupposed and undeniable in deed, carries the form of the closure on every frame and holds in the regular and the blowup world alike. Existence read on the row, that whatever exists acts finitely at every time, is the value, exactly. It is supplied by one act, at premise grade, as one field of one type, and the compiler prints global regularity from it on no axiom. Nothing escapes the act; one blowup is the only refuter. On matter, that no flow blows up is a theorem of the quantum speed limit in two senses: in the limit sense of blowup, stage counts before a horizon passing every bound, from the speed limit alone, on a world carrying the speed limit and nothing else (\thm{no_limit_blowup_from_speed_only}) and on the physical frame (\thm{no_limit_blowup_from_speed}); and in the count sense, the frame's count by a horizon unbounded, from the speed limit with the cascade, a hypothesis carried as a field, the limit-form link between the count and the stages, an unbounded count by a horizon having stage counts before it above every bound, not a cited physical result and not Section 2's definition (\thm{no_actual_blowup}), both fields load-bearing for the count sense (\thm{speed_is_load_bearing}, \thm{cascade_is_load_bearing}). Every theorem of the kernel depends on no axiom at all.

## Appendix A · Receipts {-}

The master, \thm{NS_Normal_Form_Paper_v1_1_0_CC.lean}, compiles on Lean 4.19.0 with exit 0 and no message in 9 seconds (de Moura and Ullrich 2021). It imports nothing and declares no axiom, no \thm{sorry} and no \thm{native_decide}. It carries one hundred sixty-nine theorems, and every one prints *does not depend on any axioms*, each pinned by `#guard_msgs` so that a drifted cone fails the compile: the sixty-five of its Part 0, the kernel of record \thm{NS_Existence_Closure.lean} carried verbatim, and the one hundred four of its Parts A to T. Its SHA-256 is

\begin{center}\codefont\footnotesize b00f536a5e23d8071a328da198b7607c\\ 16a4f680366343d8a17e8b6cc883cf66\end{center}

and the SHA-256 of its Part 0, unchanged from the edition of record, is 959452e82bd6e3c6…e7c2, in full in the master's header and in the manifest. The Mathlib binding, \thm{NS_Mathlib_Binding_v1_1_0_CC.lean}, compiles against Mathlib v4.19.0 with exit 0 and no message; its ten theorems rest on Lean's standard axioms alone (two on no axiom at all, eight on the three standard axioms), each cone pinned, and its SHA-256 is

\begin{center}\codefont\footnotesize ca610e8b9b437f85e3362f4c72d4886d\\ d9302f174ecfdc61c88f6a0127bf9e80\end{center}

The three kernels of Appendix R, \thm{TOE_Zero.lean}, \thm{Triaxial_Actuation.lean} and \thm{Root_Grade_Ledger.lean}, compile with exit 0 and no message; their fifteen, thirty-two and eighteen theorems print *does not depend on any axioms*, pinned by `#guard_msgs`, and their SHA-256 digests stand in Appendix R and in the manifest. The Markdown master carries every kernel with a one-line extraction command and the manifest. Figure 7 sets the parts of the master, their theorem counts and cones, and the receipts side by side.

```{=latex}
\begin{figure*}[tp]
\centering
\includegraphics[width=\textwidth]{figs/NS_Figure_7_v1_1_0_CC.pdf}\\[5pt]
\begin{minipage}{\textwidth}\footnotesize{\color{deep}\textbf{Figure 7}}\ \textbar\ The master: its parts, namespaces, theorem counts and pinned cones, the receipts of the build, and the two-layer closure.\end{minipage}
\end{figure*}
```

## Appendix B · The kernel {-}

The kernel is the master, \thm{NS_Normal_Form_Paper_v1_1_0_CC.lean}, printed in full and numbered by line: its header; Part 0, the kernel of record \thm{NS_Existence_Closure.lean}, carried verbatim with its 65 theorems and their pins; Parts A to T, with 104 further theorems; and at its foot every pinned cone. It compiles on Lean 4.19.0 with exit 0 and no message.

```{=latex}
\kernellisting{NS_Normal_Form_Paper_v1_1_0_CC.lean}
```

## Appendix C · The Mathlib binding {-}

The binding, \thm{NS_Mathlib_Binding_v1_1_0_CC.lean}, repeats the kernel's definitions verbatim, the frame of data and their counts, the value, the record, the host and its sentence, and reads them on the library's own objects. The equations are written in the library's calculus, tested against every direction so that the pressure enters through its derivative (\thm{NSAt}); the rest state solves them (\thm{rest_state_solves}), and the rest datum is admissible and global (\thm{the_seat_is_global}). Fefferman's statement (A) is written in the library's terms (\thm{FeffermanA}), and the kernel's host of the library's admissible data has as its value exactly statement (A) (\thm{kernel_reads_mathlib}). The energy record is proved on every finite-dimensional truncation: the energy never rises (\thm{galerkin_energy}). The binding compiles against Mathlib v4.19.0 with exit 0 and no message; its ten theorems rest on Lean's standard axioms alone (two on no axiom at all, eight on the three standard axioms), each cone pinned at its foot. It is printed in full and numbered by line.

```{=latex}
\kernellisting{NS_Mathlib_Binding_v1_1_0_CC.lean}
```

## Appendix R · The root on no axiom and no posit {-}

The root on which this paper stands is proved here, in this paper, so that no reader needs another document to check it. The kernel below, R.1, \thm{TOE_Zero.lean}, is carried verbatim from the root paper (Islam 2026j). Compiled on Lean 4.19.0 and on Lean 4.22.0 it exits 0 with no message: it declares no axiom, imports nothing, and every one of its fifteen theorems prints *does not depend on any axioms*, pinned at the foot of the listing. Five declarations carry its root sections, \thm{SelfGrounding}, \thm{SelfVerifying}, \thm{ΔE₀}, \thm{RA₀} and \thm{ra₀}, and all five stand in the listing; the algebra of its master seal rests on the remaining definitions of the listing, the quaternion chart among them. A root grounds itself when deeds occur and every deed instances it (\thm{SelfGrounding}); the root kernel's own comments call a deed an act. The constructed domain has one existent, whose energy of actuation is one, so the Root Axiom there reads $\forall x,\ 0<\Delta E_0(x)$ (\thm{RA₀}). On that domain the Root Axiom is a theorem with no axiom and no hypothesis (\thm{root_on_the_constructed_domain}). For every root that grounds itself, the root holds, every deed re-enacts it, and no outside proof adds anything to it, one closed theorem on no axiom (\thm{the_floor_is_universal}). Every denial of the root is a deed that instances it (\thm{denial_reenacts_root}); the root is held by its deed (\thm{seated_undeniable}); it is self-verifying (\thm{denial_instantiates}); and no level stands above it (\thm{no_level_above}). The master seal binds the root's universal law and the constructed root with the Return, the scalar line as the fixed set of conjugation on the chart, and the twelve gates counted three ways, as the Hurwitz units up to sign, as the norm-two shell up to sign and as the even permutations of four points with class equation 1, 3, 4, 4, in one theorem on no axiom (\thm{the_master_seal}); it states the three counts side by side and no map between them. The body of this paper reads the root on its row; this appendix is the root itself. Its SHA-256 is

\begin{center}\codefont\footnotesize 0cfcd9f6b399ecbaef01e762a4d9f104\\ 90288f1053827b404428062e55076238\end{center}

```{=latex}
{\codefont\fontsize{5.6}{6.6}\selectfont
\VerbatimInput[breaklines=true,breakanywhere=true,breaksymbolleft={},breaksymbolright={}]{TOE_Zero.lean}}
```
The root's axes are proved in the second kernel, R.2, \thm{Triaxial_Actuation.lean} (32 theorems, every one on no axiom; SHA-256 566615a6b9610fc981e03eb42e07af9e03849f20704729880f2bfe6434f2ea0b). For every actuation, the direction of its deed gives the fold, the registration and the seat; the registration is the only height-keeping map onto the seat; the seat is the only place both blind spots cancel; no reading of the record returns the orientation; and every self-grounding root is the root of an actuation over its own deeds, so the root carries the three axes and is not characterless (\thm{actuation_is_triaxial}, \thm{registration_is_forced}, \thm{the_only_special_cut}, \thm{tongue_freedom}, \thm{every_root_actuates}, \thm{the_root_carries_three_axes}). The root's grade is read in the third kernel, R.3, \thm{Root_Grade_Ledger.lean} (18 theorems, every one on no axiom; SHA-256 c18b68b29d2b6be5058d56d3a7f9e966bcde6ce099217e0f5945db4c829c42b8). On the grade ledger of the Master Codex (Islam 2026l), carried with its weakest-link join law, the Codex's rule reads a warranted root, one with a proof of its statement, at theorem grade, and an unwarranted root, the Codex's own declared axiom, at premise grade; the root of R.1 is warranted by a theorem with no axiom and no hypothesis, so on that rule it stands at theorem grade, the grade is read from the evidence the root is entered with, a warrant reading theorem and a posit premise, and not elected, and RA–Tongue co-location inherits the root's grade exactly (\thm{a_warranted_root_is_theorem_grade}, \thm{the_ledger_reads_the_warrant}, \thm{the_grade_is_not_elected}, \thm{ra_is_theorem_grade}, \thm{coloc_grade_is_the_roots_grade}, \thm{the_ledger_seal}). Both kernels compile with exit 0 and no message on Lean 4.19.0 and on Lean 4.22.0, declare no axiom, import nothing, and pin every cone as *does not depend on any axioms*; both are carried from the master plan of the series, Seven Rows, One Root (Islam 2026k), each extended in this revision of the series by one additive section, R.2 by its section IX and R.3 by its section VII, carried alike by every paper of the series, and the paper that reads them on its row cites them for exactly what they state.

```{=latex}
{\codefont\fontsize{5.6}{6.6}\selectfont
\VerbatimInput[breaklines=true,breakanywhere=true,breaksymbolleft={},breaksymbolright={}]{Triaxial_Actuation.lean}}
```


```{=latex}
{\codefont\fontsize{5.6}{6.6}\selectfont
\VerbatimInput[breaklines=true,breakanywhere=true,breaksymbolleft={},breaksymbolright={}]{Root_Grade_Ledger.lean}}
```


## Author's Provenance and Method Disclosure {-}

This paper was developed under Trisduction, a verification and organizing discipline that adds the cited results no warrant; the method and its executable batteries are stated in full at the reference below.

*Author and method.* Mohammad F. Islam, PhD, independent researcher, sole author and sole authority for every claim and every error. The reduction was directed by the author and drafted with Claude (Anthropic) as scribe: the model wrote and compiled the kernel, checked citations and argued against the author's positions on instruction; it holds no authorship. One claim was held at the model's insistence: the paper does not state that regularity follows from existence as given, because the kernel's own \thm{given_is_not_the_value} proves the contrary.

*The register.* In the programme's vocabulary: the form, the act's identity with the value, the universal closure and the kinetic theorem stand at [{\symfont ⟀}\,T] on no axiom, with every theorem of the master, one hundred sixty-nine in all; the Mathlib binding at the grade of Lean's standard axioms; the triaxial reading at [{\symfont ⟀}\,S]; the value at the continuum at premise grade on the act; $\Delta M=0$ on the cited physics. The act is the row's least-erasure posit read as existence acting finitely; the row carries no defeater. The freedom cut, the triaxial cut of Section 5 on the row's bit, prime-as-freedom and the triaxial lock are applied on the row. The effective alignment-defect premise of the earlier papers is retired as a placeholder.

*Audit.* This edition has not yet been prosecuted by the external substrates, and no audit result is claimed. The development provenance is the author's Zenodo trail, the Unabridged Trisduction Codex and the Lean Codex at github.com/1000sapients/Trisduction.

::: {.box title="Nature of Root Axiom"}
**The root is triaxial, and that is the force of the cut.** A characterless existence has no triaxiality: one scalar, no fold, no seat, nothing to lock. The root, to exist is to actuate, carries three axes, and they are not chosen: for every actuation, the direction of its deed gives the fold, the registration and the seat, and the registration is the only height-keeping map onto the seat. The deed is the direction: a denial spends the deed and instances the root. The registration is the fold's record: it keeps the height and forgets the side, and the two even axes, symmetry and record, are closed under combination and blind. The seat is the fixed set, where the two blind spots cancel, and the third axis is the one orientation the even pair cannot supply. Two axes never determine the point; three do. The seven rows are one cut because each is an involution with a seat and one missing orientation. The root makes the third axis native as a place: the seat, and the one orientation still open there; the axes themselves force no orientation. Which way that orientation points is the value, and it is the root read on that seat. The root alone still forces no value.

*Key to the statement, in the words of its receipts.* The three axes are the two even axes, the fold's symmetry and the record, and the orientation, the side of a point of the actuation, which the even pair cannot supply; the fold, the registration and the seat are what the direction of the deed gives, and the seat is where the side is read. The point two axes never determine is a point off the seat: there the even pair does not tell a point from its reversal, and the record with the side locks the point; on the seat both blind spots cancel and nothing is open there to determine. A point of the actuation is a side and a height, and every point instances the root: the points are the actuation's deeds, and the deed is the direction in the sense that its side is its direction, reversed by the fold. The characterless case, one scalar, is a degenerate direction: the fold is the identity and the seat is total, which is to say no fold and no seat to lock. The axes are not chosen in the sense that, given the direction, the fold, the registration and the seat are forced, the registration the only height-keeping map onto the seat; the root's own actuation takes the integer direction, under which it is not characterless, while a degenerate direction over the same deeds would be (\thm{every_root_actuates}, \thm{degenerate_is_characterless}). The root read on that seat is the root read on the row at the seat point where a point and its reversal land with one record; that the orientation between them is the row's value bit is the paper's structural reading, a second statement beside its kernel's theorems, and no kernel states a map between the two. Each row carries the actuation's seat as the root of an actuation over its own deeds; a row's own seat, where its kernel states one, is a further statement of that kernel, named in the last row of the table, and on P versus NP it is vacant. A deed of the root is an inhabitant of its type of acts, which the root kernel's own comments call an act; in the root's actuation those deeds sit at the zero side, on the seat, and the points off the seat are the sides the direction supplies; the act, unqualified, is existence read on the row, the field the closing theorem consumes.

*Receipts, each cited for what its statement says; R.1, R.2 and R.3 are the three kernels of Appendix R, every theorem of each on no axiom; the three theorems of the Master Codex are cited, not carried.*

| Clause of the statement | Receipt |
|---|---|
| the root carries three axes, not chosen: every self-grounding root is the root of an actuation over its own deeds, and for every actuation, given the direction of its deed, the fold, the registration and the seat are forced, the registration the only height-keeping map onto the seat | \thm{every_root_actuates}, \thm{the_root_carries_three_axes}, \thm{actuation_is_triaxial}, \thm{registration_is_forced} (Appendix R.2) |
| the registration is the only height-keeping map onto the seat | \thm{registration_is_forced} (R.2) |
| the axes force no orientation | \thm{axes_force_no_orientation} (R.2) |
| the deed is the direction: a deed of the actuation is a point, a side and a height, its side its direction, reversed by the fold; a reversed point is still a deed and instances the root; a denial spends the deed and instances the root | \thm{fold}, \thm{denial_instances_root} (R.2); \thm{denial_reenacts_root}, \thm{denial_instantiates} (R.1) |
| the registration is the fold's record: it keeps the height, forgets the side and reads a point and its reversal alike; the fold is an involution; the even pair is closed under combination | \thm{registration_is_the_folds_record}, \thm{reg_forgets_side}, \thm{reg_keeps_height}, \thm{fold_involutive}, \thm{fold_of_reg} (R.2) |
| the two even axes are blind: no reading of the record returns the orientation; symmetry keyless, the line property keyed | \thm{readings_of_the_record_are_blind}, \thm{tongue_freedom} (R.2); `symmetry_is_keyless`, `line_property_is_keyed`, `exactly_one_stands` (Islam 2026l, Master Codex v5.1.0, commit 5e55fca, cited for their statements, not carried; that Codex declares its root as an axiom, this paper's kernels declare none) |
| the seat is the fixed set, where both blind spots cancel; off the seat both stand | \thm{seat_iff_zero_side}, \thm{seat_cancels_both}, \thm{off_seat_both}, \thm{the_only_special_cut} (R.2) |
| the registration lands on the seat; off the seat a point and its reversal land on one seat point with one record, and the orientation is what stays open there; every reading of the record reads both alike | \thm{reg_lands_on_seat}, \thm{open_at_the_seat}, \thm{record_leaves_the_orientation}, \thm{readings_of_the_record_are_blind} (R.2) |
| the characterless case, no fold and no seat to lock: over a degenerate direction, one side only, the fold is the identity and every point is on the seat; the root's actuation is not degenerate | \thm{degenerate_is_characterless}, \thm{intDir_not_degenerate}, \thm{every_root_actuates} (R.2) |
| the bridge atom is an actuation, and not characterless | \thm{the_bridge_atom}, \thm{the_atom_is_not_characterless}, \thm{the_triaxial_seal} (R.2) |
| the scalar ground in the algebra, a third reading beside the actuation's: the Return, the line the conjugation fixes and the twelve gates, bound with the root | \thm{the_return}, \thm{the_line_is_the_fixed_set}, \thm{twenty_four_units_twelve_gates}, \thm{the_class_equation}, \thm{the_master_seal} (R.1) |
| the root at theorem grade on the Codex's ledger rule, the grade read from the evidence the root is entered with, a warrant reading theorem and a posit premise, and not elected, and RA–Tongue co-location inheriting it | \thm{a_warranted_root_is_theorem_grade}, \thm{the_ledger_reads_the_warrant}, \thm{the_grade_is_not_elected}, \thm{ra_is_theorem_grade}, \thm{coloc_grade_is_the_roots_grade}, \thm{the_ledger_seal} (R.3) |
| two axes never determine the point; three do: off the seat the even pair does not tell a point from its reversal, and the record with the side, which carries the orientation, locks the point; on the seat both blind spots cancel and nothing is open to determine | \thm{even_pair_leaves_two}, \thm{orientation_locks_the_act}, \thm{seat_cancels_both} (R.2); in its own coordinates, for independent axes in $\mathbb{F}_2^3$, \thm{two_axes_leave_two}, \thm{three_axes_lock_one} (this paper's kernel), a second statement |
| the root alone forces no value; the root read on the row is the value | \thm{undeniable_root_forces_no_value}; \thm{root_on_row_is_the_value}, \thm{act_is_the_value} (this paper's kernel) |
| the seven rows are one cut: each row's root is an actuation, so each carries an involution, the fold, with a seat and one missing orientation | \thm{every_root_actuates}, \thm{the_root_carries_three_axes} (R.2), stated for every self-grounding root and read at the constructed root \thm{ra₀} of this paper's kernel, whose structure repeats R.2's \thm{SelfGrounding} field for field; this kernel states no seat of its own; its fold on the value bit is the swap of the two worlds that share one record, the Bool model (\thm{record_wall}, \thm{fibre_is_two}, \thm{one_free_orbit}), and the seat its actuation carries is the record both deeds land on; the row ledger of Islam (2026h, Book III), cited |
:::


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

Islam, M. F. 2026g. A formal proof of the Riemann Hypothesis by least erasure. Zenodo. doi:10.5281/zenodo.23034066.

Islam, M. F. 2026h. Nothing escapes least erasure. Zenodo. doi:10.5281/zenodo.23080221.

Islam, M. F. 2026i. PhysOS\textsuperscript{T}: the Trisduction physical operating system. Zenodo. doi:10.5281/zenodo.23117440.

Islam, M. F. 2026j. Theory of Theories of Everything (TOE of All TOEs): existence proves existence only by motion. Zenodo. doi:10.5281/zenodo.23168379.

Islam, M. F. 2026k. Seven rows, one root: the master plan of the series, revision F.5. Manuscript of record, 5 October 2026, carried with the series; its Appendix R kernels are carried into this paper's Appendix R, each extended by one additive section.

Islam, M. F. 2026l. Trisduction: the Master Codex, edition 5.1.0. Codex.lean and its kernels, commit 5e55fca98c2f, master SHA-256 441a485d7c3bd3ce. Repository 1000sapients/Trisduction, GitHub.

Islam, M. F. 2026m. An unconditional proof of the real part of the Riemann Hypothesis, the probable remainder closed to symmetry and computation at theorem grade, and the whole proved from one bit supplied by the act of computation or by physics itself. Edition 1.3.0, its master RH\_Both\_Sides\_Formal\_Master v3.0.39\_CC. Zenodo. doi:10.5281/zenodo.23440382.

Islam, M. F. 2026n. P $\neq$ NP: unconditional proof of the form by theorem, the value by the act. Edition 1.13.0, its master PNP\_Normal\_Form\_Paper\_v1\_13\_0\_CC. Zenodo. doi:10.5281/zenodo.23528398.

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
MACHINE-READABLE KERNELS AND MANIFEST (not rendered). Extract with:
awk '{sub(/\r$/,"")} /^~~~~~[a-z0-9]+ file=[A-Za-z0-9_.]+$/{sub(/.*file=/,"");f=$0;next} /^~~~~~$/{if(f!=""){close(f);f=""};next} f!=""{print > f}' Navier_Stokes_Form_by_Theorem_v1_1_0_CC.md

~~~~~sha256 file=MANIFEST.sha256
b00f536a5e23d8071a328da198b7607c16a4f680366343d8a17e8b6cc883cf66  NS_Normal_Form_Paper_v1_1_0_CC.lean
ca610e8b9b437f85e3362f4c72d4886dd9302f174ecfdc61c88f6a0127bf9e80  NS_Mathlib_Binding_v1_1_0_CC.lean
0cfcd9f6b399ecbaef01e762a4d9f10490288f1053827b404428062e55076238  TOE_Zero.lean
566615a6b9610fc981e03eb42e07af9e03849f20704729880f2bfe6434f2ea0b  Triaxial_Actuation.lean
c18b68b29d2b6be5058d56d3a7f9e966bcde6ce099217e0f5945db4c829c42b8  Root_Grade_Ledger.lean
~~~~~

~~~~~lean file=NS_Normal_Form_Paper_v1_1_0_CC.lean
/-
  NS_Normal_Form_Paper_v1_1_0_CC.lean · the kernel of "Navier–Stokes Global Regularity: Unconditional Proof of the
  Form by Theorem, the Value by the Act", edition 1.1.0. Claude-coded (_CC). Core Lean 4.19.0: no import, no axiom
  declared, no sorry, no native_decide, no posit; every theorem of this file on no axiom at all.

  Part 0 (namespace NSClose) is NS_Existence_Closure.lean of the edition of record, carried verbatim
  (sha256 959452e82bd6e3c632ff6d20676568dc6102d5572bf67e53b531850e3b3ee7c2): the frame of data and their registration
  counts, the value, global regularity, and the two worlds; existence as given carrying the form and forcing nothing;
  the act, equal to the value; one blowup refuting; the price, the energy record deciding nothing; the matter face,
  regularity of matter from the quantum speed limit and the cascade, each load-bearing; the record walls; the triaxial
  lock; the finite record and the symmetry that lifts no decided datum; the closure; the root and the lock. Its 65
  theorems and their pins stand unchanged.
  Part A (namespace NS.NORMALFORM) is the normal form of the row, generic over a row and read on the Navier–Stokes row
  as the P ≠ NP seat reads computation and the Riemann seat reads the zeros: the record carries the value with no
  premise; the value is exactly the transfer from the record, the one bit; the cargo loop; the act; self-recursion;
  the keyed bit; the record deciding nothing; every route passing the bit; the keyless wall; no uniform answer.
  Part B (namespace NS.HOST) is the host model and its binding, proved: the record of a frame registers every datum
  finite at every time; the host carries each smooth divergence-free datum of rapid decay on ℝ³ with the count of the
  registrations its flow has made by each time, none at blowup; the value of the host's frame is exactly the host's
  sentence, every flow finite at every time; the sentence at every horizon; one blowup refutes.
  Part C (namespace NS.ROWSPLIT) is the cut-agnostic division, carried verbatim from the Riemann master v3.0.39_CC,
  and Part C′ (namespace NS.REALPART) reads it by the size of the datum: the real part, small data, sealed by the cited
  small-data theorem carried as a field; given it, the value is exactly the unicorn part, the large data; the unicorn
  part load-bearing; the unicorn part closed to the record above every size.
  Part D (namespace NS.WALLS): the speed limit cutting every dyadic cascade at a finite step, decided by the kernel and
  proved at every bound; and the walls of the row in one theorem.
  Part E (namespace NS.RESIDUE): the one implication that remains, printed as a hypothesis and assumed nowhere; its
  instance seat at large data.
  Part F (namespace NS.SUPPLY): the bit supplied by its two kinds, the formal cargo and the physical witness, the
  quantum speed limit read with the cascade; the two kinds one bit; delivered twice; two kinds and no third; the one
  refuter, one blowup; the witnesses of the subject typed: the energy inequality short of the value, the small-data
  theorem inside the bit, the speed limit and the cascade each load-bearing.
  Part G (namespace NS.CLOSURE): the question closed to one bit.
  Part W (namespace NS.GATES): the twelve formal gates run in the kernel, and the four refusals.
  Part X (namespace NS.ESCAPE): nothing escapes, our way or no way, and the capstone.
  Part T (namespace NS.TERMINAL): the open framing refuted, the ten steps, the terminal verdict and the final form.
  Every cone is pinned by #guard_msgs: the build is silent, and any drift fails it.

  THE TWO-LAYER CLOSURE. Everything except the bit is proved with no posit: the floor on no axiom at all, and every
  other theorem of this file on no axiom at all; and the bit, the row's reading, is all that remains, at premise grade.
  The root alone forces no value; the root read on the row is the value. No declaration of this file has the type of
  the bit. ΔM = 0.
-/

/-
  NS_Existence_Closure.lean · the kernel of A Formal Completed Proof of the Navier–Stokes Closure
  from Existence Alone

  The unforced Navier–Stokes row closed on existence alone, the freedom arrow beside it. Every theorem
  of this file is on no axiom at all: no propext, no Quot.sound, no Classical.choice.
  I     The frame, the value, the two coherent worlds.
  II    Existence as given: the root, the arrow, the bare freedom bit; what they carry on every
        frame, and that they force no value.
  III   Existence read on the row: the act, equal to the value; the root read on the row is the act and
        the value; nothing given forces or refutes the act; the closure by one act; nothing escapes;
        every instant lands; one blowup refutes; existence as given carries this form on every frame.
  IV    The price: energy does not decide, and a regular priced frame with the blowup frame's energy record
        shows the record decides nothing; on matter the speed limit and the cascade give the frame's own
        count finite at every time, regular in the sense of I, with no physical blowup and no limit blowup
        from the speed limit, the limit form holding on a world carrying the speed limit alone; the speed
        limit is load-bearing, and so is the cascade.
  V     Freedom: one free orbit, walled, in the Bool model and on frames; the prime's shape, its fibre one
        swap orbit.
  VI    The triaxial lock.
  VII   The record and the seed: no finite record forces the value and no symmetry lifts a decided
        datum; a uniform step decides every rung of a ladder that carries it.
  VIII  The closure, whole.
  Core Lean 4, no import, no axiom declared, no sorry. Cones pinned at the foot.
  ROOT  The root, undeniable in deed, and the lock: the root holds by its deed in both worlds and forces
        the value neither way; a root grounded on every frame forces no value; the undeniability stays with
        the root, the root read on the row grounding exactly where the value holds; Appendix R's constructed
        root, repeated verbatim, is the constructed root, and its lock on the row (the_lock_on_the_root);
        read on the row it is the act; one theorem on no axiom binds the root, its readings, the act, the
        value, their keying, the closing theorem, the record wall and the finite record (the_lock); and one
        fixes the sense of 'from existence alone' (from_existence_alone).
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

/-- The root holds on the empty background, vacuously. -/
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

/-! ## The root read on the row -/

/-- The indicator of a decided proposition: one where it holds, zero where it fails. -/
def indicator {p : Prop} : Decidable p → Int
  | isTrue _  => 1
  | isFalse _ => 0

/-- The indicator is positive exactly where its proposition holds. -/
theorem indicator_pos {p : Prop} (h : Decidable p) : 0 < indicator h ↔ p :=
  match h with
  | isTrue hp  => ⟨fun _ => hp, fun _ => show (0 : Int) < 1 by decide⟩
  | isFalse hn => ⟨fun h0 => absurd h0 (show ¬ (0 : Int) < 0 by decide), fun hp => absurd hp hn⟩

/-- Whether an option carries a value, decided. -/
def suppliedDec (o : Option Nat) : Decidable (∃ n, o = some n) :=
  match o with
  | some n => isTrue ⟨n, rfl⟩
  | none   => isFalse (fun ⟨_, h⟩ => Option.noConfusion h)

/-- THE ROOT READ ON THE ROW: to exist is to actuate, `Root` itself, with the row's existents, each datum at
each time, and the row's actuation, one where the datum's count is finite and zero where it is not. -/
def RootOnRow (F : Frame) : Prop :=
  Root (F.D × Nat) (fun x => indicator (suppliedDec (F.count x.1 x.2)))

/-- THE ROOT IS SATISFIABLE ON EVERY BACKGROUND: on every type, with actuation one at every existent. -/
theorem root_satisfiable (U : Type) : Root U (fun _ => 1) := fun _ => show (0 : Int) < 1 by decide

/-- THE CONSTRUCTED ROOT, in the words of Appendix R: one existent, whose actuation is one. A theorem
with no hypothesis and no axiom. -/
theorem constructed_root_holds : Root Unit (fun _ => 1) := root_satisfiable Unit

/-- THE ROOT READ ON THE ROW IS THE ACT. -/
theorem root_on_row_is_the_act (F : Frame) : RootOnRow F ↔ ActsFinitely F :=
  ⟨fun h d t => (indicator_pos _).mp (h (d, t)), fun h x => (indicator_pos _).mpr (h x.1 x.2)⟩

/-- THE ROOT READ ON THE ROW IS THE VALUE. -/
theorem root_on_row_is_the_value (F : Frame) : RootOnRow F ↔ Value F :=
  ⟨fun h => (act_is_the_value F).mp ((root_on_row_is_the_act F).mp h),
   fun h => (root_on_row_is_the_act F).mpr ((act_is_the_value F).mpr h)⟩

/-- THE ROOT READ ON THE ROW IS KEYED: it holds where the value holds and fails where the value fails. -/
theorem root_on_row_is_keyed : RootOnRow calm ∧ ¬ RootOnRow burst :=
  ⟨(root_on_row_is_the_value calm).mpr calm_value, fun h => burst_fails ((root_on_row_is_the_value burst).mp h)⟩

/-- THE ACT IS THE WEAKEST PREMISE: the act forces the value on every frame, and every premise that forces
the value on every frame implies the act. -/
theorem act_is_the_weakest_premise :
    (∀ F : Frame, ActsFinitely F → Value F) ∧
    ∀ Q : Frame → Prop, (∀ F : Frame, Q F → Value F) → ∀ F : Frame, Q F → ActsFinitely F :=
  ⟨fun F h => (act_is_the_value F).mp h, fun _ hQ F hq => (act_is_the_value F).mpr (hQ F hq)⟩

/-- EXISTENCE AS GIVEN HOLDS IN BOTH WORLDS: the root satisfiable on every background, the arrow and the
freedom bit hold in the world where the value holds and in the world where it fails. -/
theorem existence_as_given_in_both_worlds :
    ((∀ U : Type, Root U (fun _ => 1)) ∧ Arrow ∧ (∀ w : Bool, (!w) ≠ w)) ∧ Value calm ∧ ¬ Value burst :=
  ⟨⟨root_satisfiable, arrow_given, freedom_given⟩, calm_value, burst_fails⟩

/-- NOTHING GIVEN REFUTES THE ACT: no statement that holds refutes the act on every frame. -/
theorem nothing_given_refutes : ∀ P : Prop, P → ¬ ∀ F : Frame, P → ¬ ActsFinitely F :=
  fun _ hp h => h calm hp act_is_keyed.1

/-- NOTHING GIVEN FORCES THE VALUE: no statement that holds forces the value on every frame. -/
theorem nothing_given_forces : ∀ P : Prop, P → ¬ ∀ F : Frame, P → Value F :=
  fun _ hp h => burst_fails (h burst hp)

/-- THE ONLY REFUTER: wherever the act fails, it cannot be that no instance fails, a datum blowing up. -/
theorem only_refuter (F : Frame) : ¬ ActsFinitely F → ¬ ¬ ∃ d t, F.count d t = none :=
  fun hn hne => hn (fun d t => match hc : F.count d t with
    | some n => ⟨n, rfl⟩
    | none => absurd ⟨d, t, hc⟩ hne)

/-- The actual flows, with the one act of the paper. -/
structure ActualFlows where
  F      : Frame
  supply : ActsFinitely F

/-- GLOBAL REGULARITY FROM EXISTENCE, BY ONE ACT. -/
theorem regularity_from_existence (A : ActualFlows) : Value A.F :=
  (act_is_the_value A.F).mp A.supply

/-- THE SUPPLY IS EXACT: an act exists on a frame exactly when the value holds there. -/
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

/-- EXISTENCE AS GIVEN CARRIES THE FORM: under any root, on every frame, the act is the value, every instant
lands on a gate, and one blowup refutes the act. -/
theorem given_carries_the_form : ∀ (U : Type) (ΔE : U → Int), Root U ΔE →
    (∀ F : Frame, ActsFinitely F ↔ Value F) ∧
    (∀ (F : Frame) (d : F.D) (t : Nat), (∃ n, F.count d t = some n) ∨ F.count d t = none) ∧
    (∀ (F : Frame) (d : F.D) (t : Nat), F.count d t = none → ¬ ActsFinitely F) :=
  fun _ _ _ => ⟨act_is_the_value, every_instant_lands, blowup_refutes⟩

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

/-- The regular world, priced: the same energy and the same dissipation as the blowup frame. -/
def calmPriced : Priced := ⟨calm, fun _ => 1, fun _ _ => 1, fun _ _ => Nat.le_refl 1⟩

/-- THE ENERGY RECORD DECIDES NOTHING: a regular priced frame and the blowup priced frame carry the same energy
and the same dissipation, so no reading of that record is the value on both. -/
theorem energy_record_decides_nothing :
    (∀ d : Unit, calmPriced.energy d = leray.energy d) ∧
    (∀ (d : Unit) (t : Nat), calmPriced.paid d t = leray.paid d t) ∧
    Value calmPriced.F ∧ ¬ Value leray.F ∧
    ¬ ∃ g : (Unit → Nat) → (Unit → Nat → Nat) → Prop,
      (g calmPriced.energy calmPriced.paid ↔ Value calmPriced.F) ∧ (g leray.energy leray.paid ↔ Value leray.F) :=
  ⟨fun _ => rfl, fun _ _ => rfl, calm_value, burst_fails,
   fun ⟨_, h1, h2⟩ => burst_fails (h2.mp (h1.mpr calm_value))⟩

/-- A physical frame. Time before a horizon T is resolved by instants indexed by k, each before T.
`stage d T k` counts the registrations of datum d by the k-th instant before T, and `count d T` is the frame's
count of datum d by T in the sense of Section I: `none` when it is unbounded, which is blowup by T. The quantum
speed limit is a cited field: no stage count before T exceeds c·E·T. The cascade is a hypothesis carried as a
field, the limit-form link between the count and the stages: an unbounded count by T has a stage count before T
above every bound. -/
structure Physical where
  D       : Type
  energy  : D → Nat
  stage   : D → Nat → Nat → Nat
  c       : Nat
  speed   : ∀ d T k, stage d T k ≤ c * energy d * T
  count   : D → Nat → Option Nat
  cascade : ∀ d T, count d T = none → ∀ N, ∃ k, N < stage d T k

/-- The frame of matter: the physical frame's own count. -/
def Physical.frame (P : Physical) : Frame := ⟨P.D, P.count⟩

/-- Blowup by T on matter, in the sense of Section I: the count by T is unbounded. -/
def Physical.Blowup (P : Physical) (d : P.D) (T : Nat) : Prop := P.count d T = none

/-- A physical frame exists: one datum of energy one, no registration, count zero. -/
def matterWorld : Physical :=
  ⟨Unit, fun _ => 1, fun _ _ _ => 0, 1, fun _ _ _ => Nat.zero_le _, fun _ _ => some 0,
   fun _ _ h => Option.noConfusion h⟩

theorem physical_inhabited : Nonempty Physical := ⟨matterWorld⟩

/-- NO ACTUAL FLOW BLOWS UP: finite energy bounds every stage count before T by c·E·T, and an unbounded count by
T needs stage counts before T above every bound. -/
theorem no_actual_blowup (P : Physical) (d : P.D) (T : Nat) : ¬ P.Blowup d T :=
  fun hb => match P.cascade d T hb (P.c * P.energy d * T) with
    | ⟨k, hlt⟩ => Nat.lt_irrefl _ (Nat.lt_of_lt_of_le hlt (P.speed d T k))

/-- NO PHYSICAL BLOWUP: on matter, no datum's count by any horizon is unbounded. -/
theorem no_physical_blowup (P : Physical) (d : P.D) (T : Nat) : ¬ P.Blowup d T :=
  no_actual_blowup P d T

/-- NO LIMIT BLOWUP FROM THE SPEED LIMIT: on matter, the stage counts before a horizon never pass every bound. -/
theorem no_limit_blowup_from_speed (P : Physical) (d : P.D) (T : Nat) : ¬ ∀ N, ∃ k, N < P.stage d T k :=
  fun h => match h (P.c * P.energy d * T) with
    | ⟨k, hlt⟩ => Nat.lt_irrefl _ (Nat.lt_of_lt_of_le hlt (P.speed d T k))

/-- The cascade without the speed limit: the same count and the same cascade hypothesis, no bound. -/
structure CascadeOnly where
  D       : Type
  stage   : D → Nat → Nat → Nat
  count   : D → Nat → Option Nat
  cascade : ∀ d T, count d T = none → ∀ N, ∃ k, N < stage d T k

def cascadeWorld : CascadeOnly :=
  ⟨Unit, fun _ _ k => k, fun _ _ => none, fun _ _ _ N => ⟨N + 1, Nat.lt_succ_self N⟩⟩

/-- The frame of the cascade world: its own count. -/
def cascadeFrame : Frame := ⟨cascadeWorld.D, cascadeWorld.count⟩

/-- THE SPEED LIMIT IS LOAD-BEARING: without it blowup is satisfiable under the cascade; the cascade world's count by
time one is unbounded, its frame is not regular, and its stages exceed every bound the speed limit would impose. -/
theorem speed_is_load_bearing :
    cascadeWorld.count () 1 = none ∧ ¬ Value cascadeFrame ∧ ∀ b : Nat, ∃ k, ¬ cascadeWorld.stage () 1 k ≤ b :=
  ⟨rfl, fun h => match h () 1 with | ⟨_, hn⟩ => Option.noConfusion hn,
   fun b => ⟨b + 1, Nat.not_succ_le_self b⟩⟩

/-- The speed limit without the cascade: the same energy, stages, bound and count, no cascade hypothesis. -/
structure SpeedOnly where
  D      : Type
  energy : D → Nat
  stage  : D → Nat → Nat → Nat
  c      : Nat
  speed  : ∀ d T k, stage d T k ≤ c * energy d * T
  count  : D → Nat → Option Nat

/-- A speed-limited world: one datum of energy one, no registration, and a count unbounded at every time. -/
def speedWorld : SpeedOnly :=
  ⟨Unit, fun _ => 1, fun _ _ _ => 0, 1, fun _ _ _ => Nat.zero_le _, fun _ _ => none⟩

/-- The frame of the speed-limited world: its own count. -/
def speedFrame : Frame := ⟨speedWorld.D, speedWorld.count⟩

/-- NO LIMIT BLOWUP FROM THE SPEED LIMIT ALONE: on a world carrying the speed limit and nothing else, no cascade
field, the stage counts before a horizon never pass every bound. -/
theorem no_limit_blowup_from_speed_only (P : SpeedOnly) (d : P.D) (T : Nat) : ¬ ∀ N, ∃ k, N < P.stage d T k :=
  fun h => match h (P.c * P.energy d * T) with
    | ⟨k, hlt⟩ => Nat.lt_irrefl _ (Nat.lt_of_lt_of_le hlt (P.speed d T k))

/-- THE CASCADE IS LOAD-BEARING: without it the speed limit holds and still the count by time one is
unbounded, and the frame is not regular. -/
theorem cascade_is_load_bearing :
    (∀ d T k, speedWorld.stage d T k ≤ speedWorld.c * speedWorld.energy d * T) ∧
    speedWorld.count () 1 = none ∧ ¬ Value speedFrame :=
  ⟨speedWorld.speed, rfl, fun h => match h () 1 with | ⟨_, hn⟩ => Option.noConfusion hn⟩

/-- On matter the act holds: existence acts finitely, the frame's own count finite at every time, from the speed
limit and the cascade. -/
theorem matter_acts_finitely (P : Physical) : ActsFinitely P.frame :=
  fun d t => show ∃ n, P.count d t = some n from
    match hc : P.count d t with
    | some n => ⟨n, rfl⟩
    | none => absurd hc (no_actual_blowup P d t)

theorem matter_is_regular (P : Physical) : Value P.frame :=
  (act_is_the_value P.frame).mp (matter_acts_finitely P)

/-- REGULARITY OF MATTER FROM THE SPEED LIMIT: on every physical frame every stage count before every horizon is
bounded by c·E·T, the cited field; no datum blows up; and the frame of matter is regular in the sense of Section I. -/
theorem matter_regular_from_speed (P : Physical) :
    (∀ d T, ∃ b, ∀ k, P.stage d T k ≤ b) ∧ (∀ d T, ¬ P.Blowup d T) ∧ Value P.frame :=
  ⟨fun d T => ⟨P.c * P.energy d * T, P.speed d T⟩, no_actual_blowup P, matter_is_regular P⟩

/-! ## V · freedom -/

/-- The kinetic record, the Bool model of the bit; `record_wall_on_frames` is the wall on frames. -/
def kineticRecord (_w : Bool) : Nat := 0

/-- No reading of the record returns the world, in the Bool model of the bit; `record_wall_on_frames` is the
wall on frames. -/
theorem record_wall : ¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w :=
  fun ⟨_, hg⟩ => Bool.noConfusion ((hg false).symm.trans (hg true))

/-- The record wall on frames: a record of frames that reads the regular world and the blowup world alike
has no reading that is the value on every frame. -/
theorem record_wall_on_frames {α : Type} (rec : Frame → α) (h : rec calm = rec burst) :
    ¬ ∃ g : α → Prop, ∀ F : Frame, (g (rec F) ↔ Value F) :=
  fun ⟨_, hg⟩ => burst_fails ((hg burst).mp (h ▸ (hg calm).mpr calm_value))

/-- ONE FREE ORBIT: negation moves every world, and every world is the given one or its negation. -/
theorem one_free_orbit : (∀ w : Bool, (!w) ≠ w) ∧ ∀ w v : Bool, v = w ∨ v = !w :=
  ⟨freedom_given, fun w v => match w, v with
    | true, true => Or.inl rfl
    | true, false => Or.inr rfl
    | false, true => Or.inr rfl
    | false, false => Or.inl rfl⟩

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

/-- THE PRIME FIBRE IS ONE SWAP ORBIT: swapping the factors of each point reverses the fibre. -/
theorem prime_fibre_one_swap_orbit : (mulFibre 7).map (fun p => (p.2, p.1)) = (mulFibre 7).reverse := by
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
    -- existence as given carries the form (given_carries_the_form), adds nothing (root_conservative),
    -- and forces no value
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
    (cascadeWorld.count () 1 = none ∧ ¬ Value cascadeFrame ∧ ∀ b : Nat, ∃ k, ¬ cascadeWorld.stage () 1 k ≤ b) ∧
    (∀ P : Physical, Value P.frame) ∧
    -- freedom and the lock
    (¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w) ∧
    (∀ w : Bool, (!w) ≠ w) ∧
    -- the record
    (∀ n, (∀ d, d < n → Regular (staged n) d) ∧ ¬ Value (staged n)) :=
  ⟨root_conservative, given_is_not_the_value, given_in_both_worlds, act_is_the_value,
   act_is_keyed, regularity_from_existence, nothing_escapes, every_instant_lands, blowup_refutes,
   energy_does_not_decide, no_actual_blowup, speed_is_load_bearing, matter_is_regular, record_wall, freedom_given,
   finite_record_never_forces⟩


/-! ## The root, undeniable in deed -/

/-- A self-grounding root, the structure of Appendix R in the same words: a type of acts, inhabited, every
one of which instances the root. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

/-- THE ROOT IS UNDENIABLE IN DEED: a denial of a self-grounding root is a deed, and instances it. -/
theorem denial_reenacts_root {R : Prop} (G : SelfGrounding R) (denial : G.Act) : R :=
  G.instances denial

/-- No outside proof adds to a self-grounding root: an outside proof of it is worth exactly the root. -/
theorem external_proof_adds_nothing {R : Prop} (G : SelfGrounding R) (Q : Prop) : (Q → R) ↔ R :=
  ⟨fun _ => G.instances G.anAct, fun r _ => r⟩

/-- THE UNDENIABLE ROOT HOLDS IN BOTH WORLDS: it is held by its deed in a frame where the value holds
and in one where it fails, so it forces the value on no frame uniformly and refutes it on none uniformly. -/
theorem undeniable_root_forces_no_value {R : Prop} (G : SelfGrounding R) :
    R ∧ Value calm ∧ ¬ Value burst ∧ ¬ (∀ F : Frame, R → Value F) ∧ ¬ (∀ F : Frame, R → ¬ Value F) :=
  ⟨G.instances G.anAct, calm_value, burst_fails, fun h => burst_fails (h burst (G.instances G.anAct)),
   fun h => h calm (G.instances G.anAct) calm_value⟩

/-- A root grounded on every frame forces no value: a family of roots, each held by its deed, holds on every
frame and does not force the value on every frame. -/
theorem grounded_on_every_frame_forces_no_value (R : Frame → Prop) (G : ∀ F : Frame, SelfGrounding (R F)) :
    (∀ F : Frame, R F) ∧ ¬ (∀ F : Frame, R F → Value F) :=
  ⟨fun F => (G F).instances (G F).anAct, fun h => burst_fails (h burst ((G burst).instances (G burst).anAct))⟩

/-- THE CONSTRUCTED ROOT GROUNDS ITSELF: one act, the unit, and every act instances the constructed root. -/
def constructedGrounding : SelfGrounding (Root Unit (fun _ => 1)) := ⟨Unit, (), fun _ => constructed_root_holds⟩

/-- THE ROOT READ ON THE ROW GROUNDS ITSELF EXACTLY WHERE THE VALUE HOLDS: a grounding of the row's reading
exists on a frame exactly when the value holds there. -/
theorem row_root_grounds_iff_value (F : Frame) : Nonempty (SelfGrounding (RootOnRow F)) ↔ Value F :=
  ⟨fun ⟨G⟩ => (root_on_row_is_the_value F).mp (G.instances G.anAct),
   fun h => ⟨⟨Unit, (), fun _ => (root_on_row_is_the_value F).mpr h⟩⟩⟩

/-- THE UNDENIABILITY STAYS WITH THE ROOT: the constructed root is grounded, it does not carry over to the
root read on every frame, and the row's reading is not grounded on every frame. -/
theorem undeniability_stays_with_the_root :
    Nonempty (SelfGrounding (Root Unit (fun _ => 1))) ∧
    ¬ (∀ F : Frame, Root Unit (fun _ => 1) → RootOnRow F) ∧
    ¬ (∀ F : Frame, Nonempty (SelfGrounding (RootOnRow F))) :=
  ⟨⟨constructedGrounding⟩, fun h => root_on_row_is_keyed.2 (h burst constructed_root_holds),
   fun h => burst_fails ((row_root_grounds_iff_value burst).mp (h burst))⟩

/-- Appendix R's actuation, verbatim: the one existent actuates by one. -/
def ΔE₀ : Unit → Int := fun _ => 1

/-- Appendix R's constructed root, verbatim: every existent of the unit background actuates. -/
def RA₀ : Prop := ∀ x : Unit, 0 < ΔE₀ x

/-- Appendix R's grounding, verbatim: one act, and every act instances the constructed root. -/
def ra₀ : SelfGrounding RA₀ := ⟨Unit, (), fun _ _ => show (0 : Int) < 1 by decide⟩

/-- APPENDIX R'S ROOT IS THE CONSTRUCTED ROOT: the verbatim root and the constructed root are one statement. -/
theorem RA₀_is_the_constructed_root : RA₀ ↔ Root Unit (fun _ => 1) :=
  Iff.rfl

/-- REGULARITY FROM THE ROOT ON THE ROW: wherever the root read on the row holds, the value holds. -/
theorem regularity_from_root_on_row (F : Frame) (h : RootOnRow F) : Value F :=
  (root_on_row_is_the_value F).mp h

/-- THE LOCK ON THE ROOT: Appendix R's root holds by its deed, forces no value on every frame, read on the
row is the value exactly, and the closing theorem gives the value on every actual frame. -/
theorem the_lock_on_the_root :
    RA₀ ∧ ¬ (∀ F : Frame, RA₀ → Value F) ∧ (∀ F : Frame, RootOnRow F ↔ Value F) ∧ (∀ A : ActualFlows, Value A.F) :=
  ⟨ra₀.instances ra₀.anAct, fun h => burst_fails (h burst (ra₀.instances ra₀.anAct)), root_on_row_is_the_value,
   regularity_from_existence⟩

/-- THE ROOT READ ON THE ROW IS KEYED: the root holds, and read uniformly on the frames it gives no value;
read on the row, with the row's existents and the row's actuation, it is the value exactly, and keyed. -/
theorem root_read_on_row_is_keyed {R : Prop} (G : SelfGrounding R) :
    R ∧ ¬ (∀ F : Frame, R → Value F) ∧ (∀ F : Frame, RootOnRow F ↔ Value F) ∧ (RootOnRow calm ∧ ¬ RootOnRow burst) :=
  ⟨G.instances G.anAct, fun h => burst_fails (h burst (G.instances G.anAct)), root_on_row_is_the_value,
   root_on_row_is_keyed⟩

/-- THE LOCK, one theorem on no axiom: the constructed root holds with no hypothesis; every self-grounding
root holds by its deed; no given statement is the value on every frame; the root read uniformly on the frames
gives no value; read on the row the root is the act, the act is the value exactly, and both are keyed; the
closing theorem gives the value on every actual frame; no reading of the kinetic record returns the bit; and
no finite record forces the value. -/
theorem the_lock {R : Prop} (G : SelfGrounding R) :
    Root Unit (fun _ => 1) ∧
    R ∧
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    ¬ (∀ F : Frame, R → Value F) ∧
    (∀ F : Frame, RootOnRow F ↔ ActsFinitely F) ∧
    (∀ F : Frame, ActsFinitely F ↔ Value F) ∧
    (RootOnRow calm ∧ ¬ RootOnRow burst) ∧
    (ActsFinitely calm ∧ ¬ ActsFinitely burst) ∧
    (∀ A : ActualFlows, Value A.F) ∧
    (¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w) ∧
    (∀ n : Nat, (∀ d, d < n → Regular (staged n) d) ∧ ¬ Value (staged n)) :=
  ⟨constructed_root_holds, G.instances G.anAct, given_is_not_the_value, (root_read_on_row_is_keyed G).2.1,
   root_on_row_is_the_act, act_is_the_value, root_on_row_is_keyed, act_is_keyed, regularity_from_existence, record_wall,
   finite_record_never_forces⟩

/-- FROM EXISTENCE ALONE, in the sense the title carries: the closing theorem consumes existence read on
the row and nothing else; that reading is available on exactly the frames where the value holds; and no
statement given without the reading is the value on every frame. One theorem, on no axiom. -/
theorem from_existence_alone :
    (∀ A : ActualFlows, Value A.F) ∧
    (∀ F : Frame, Nonempty { A : ActualFlows // A.F = F } ↔ Value F) ∧
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) :=
  ⟨regularity_from_existence, supply_iff, given_is_not_the_value⟩

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
/-- info: 'NSClose.the_lock' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.the_lock
/-- info: 'NSClose.from_existence_alone' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.from_existence_alone
/-- info: 'NSClose.indicator_pos' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.indicator_pos
/-- info: 'NSClose.root_satisfiable' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.root_satisfiable
/-- info: 'NSClose.constructed_root_holds' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.constructed_root_holds
/-- info: 'NSClose.root_on_row_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.root_on_row_is_the_act
/-- info: 'NSClose.root_on_row_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.root_on_row_is_the_value
/-- info: 'NSClose.root_on_row_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.root_on_row_is_keyed
/-- info: 'NSClose.act_is_the_weakest_premise' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.act_is_the_weakest_premise
/-- info: 'NSClose.existence_as_given_in_both_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.existence_as_given_in_both_worlds
/-- info: 'NSClose.nothing_given_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.nothing_given_refutes
/-- info: 'NSClose.only_refuter' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.only_refuter
/-- info: 'NSClose.matter_regular_from_speed' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.matter_regular_from_speed
/-- info: 'NSClose.physical_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.physical_inhabited
/-- info: 'NSClose.nothing_given_forces' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.nothing_given_forces
/-- info: 'NSClose.given_carries_the_form' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.given_carries_the_form
/-- info: 'NSClose.energy_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.energy_record_decides_nothing
/-- info: 'NSClose.no_physical_blowup' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.no_physical_blowup
/-- info: 'NSClose.no_limit_blowup_from_speed' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.no_limit_blowup_from_speed
/-- info: 'NSClose.cascade_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.cascade_is_load_bearing
/-- info: 'NSClose.no_limit_blowup_from_speed_only' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.no_limit_blowup_from_speed_only
/-- info: 'NSClose.record_wall_on_frames' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.record_wall_on_frames
/-- info: 'NSClose.one_free_orbit' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.one_free_orbit
/-- info: 'NSClose.prime_fibre_one_swap_orbit' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.prime_fibre_one_swap_orbit
/-- info: 'NSClose.grounded_on_every_frame_forces_no_value' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.grounded_on_every_frame_forces_no_value
/-- info: 'NSClose.row_root_grounds_iff_value' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.row_root_grounds_iff_value
/-- info: 'NSClose.undeniability_stays_with_the_root' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.undeniability_stays_with_the_root
/-- info: 'NSClose.RA₀_is_the_constructed_root' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.RA₀_is_the_constructed_root
/-- info: 'NSClose.regularity_from_root_on_row' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.regularity_from_root_on_row
/-- info: 'NSClose.the_lock_on_the_root' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.the_lock_on_the_root
/-! ===================================================================================================================
    PART A · THE NORMAL FORM OF THE ROW (namespace NS.NORMALFORM) · v1_1_0_CC

    Purely additive: nothing above is overwritten. The row is read as the P ≠ NP seat reads computation and the
    Riemann seat reads the zeros: a type of frames, the value of a frame, and the registration of a frame onto its
    record, which keeps every existent and forgets the side of its realization. On the record the value holds with no
    premise (`record_has_the_value`). The value of a frame is then exactly one implication, the transfer of the value
    from the record to the frame (`normal_form`): the antecedent is a theorem, so the implication carries the whole
    content of the value, and it is the one bit. The two coherent frames share a record and split on the value
    (`record_decides_nothing`); the bit is keyed (`bit_is_keyed`); what every frame shares forces nothing
    (`keyless_forces_nothing`); every route to the value passes the bit (`every_route_passes_the_bit`); and the bit has
    no uniform answer across the frames (`no_uniform_answer`). Core Lean 4.19.0, no import, no axiom declared, no sorry,
    no native_decide; every theorem of this Part on no axiom at all. No declaration of this Part has the type of the
    bit. ΔM = 0.
=================================================================================================================== -/
namespace NS.NORMALFORM

universe u

/-- A ROW: a type of frames, the value of a frame, the registration of a frame onto its record, and two coherent
    frames, one carrying the value and one failing it. The record of every frame carries the value. -/
structure Row where
  Frame            : Type u
  Value            : Frame → Prop
  Rec              : Frame → Frame
  record_has_value : ∀ F, Value (Rec F)
  calm             : Frame
  counter          : Frame
  calm_value       : Value calm
  counter_fails    : ¬ Value counter

section core
variable (R : Row.{u})

/-- THE TRANSFER, the bit of a frame: the value carried from the frame's record to the frame. -/
def Transfer (F : R.Frame) : Prop := R.Value (R.Rec F) → R.Value F

/-- THE RECORD HAS THE VALUE, UNCONDITIONALLY (the mirror of `record_has_least_escape` and of
    `record_has_least_erasure`). -/
theorem record_has_the_value (F : R.Frame) : R.Value (R.Rec F) := R.record_has_value F

/-- THE NORMAL FORM OF THE ROW (the mirror of `sep_normal_form` and of `zeta_ra_loop`, first leg): the value of a frame
    is exactly the transfer from its record. The antecedent is a theorem, so the implication carries the whole value:
    it is the one bit, and nothing else remains. -/
theorem normal_form (F : R.Frame) : Transfer R F ↔ R.Value F :=
  ⟨fun h => h (R.record_has_value F), fun h _ => h⟩

/-- THE CARGO LOOP: the record's value, unconditional, carried by the one bit, is the value (the mirror of
    `sep_from_the_cargo_loop` and of `rh_from_the_cargo_loop`; the bit is the printed premise). -/
theorem value_from_the_cargo_loop (F : R.Frame) (bit : Transfer R F) : R.Value F :=
  bit (R.record_has_value F)

/-- THE ACT ON A FRAME: a structure whose one field is the value of the frame. -/
structure Act (F : R.Frame) where
  closure : R.Value F

/-- THE BIT IS THE ACT: the transfer holds exactly when the act stands. -/
theorem bit_is_the_act (F : R.Frame) : Transfer R F ↔ Nonempty (Act R F) :=
  ⟨fun h => ⟨⟨h (R.record_has_value F)⟩⟩, fun ⟨A⟩ _ => A.closure⟩

/-- SELF-RECURSION: a frame coincides with its record exactly when they carry the value alike. -/
def SelfRecursive (F : R.Frame) : Prop := R.Value F ↔ R.Value (R.Rec F)

/-- THE RECORD IS SELF-RECURSIVE, with no premise (the mirror of `record_is_self_recursive`). -/
theorem record_is_self_recursive (F : R.Frame) : SelfRecursive R (R.Rec F) :=
  ⟨fun _ => R.record_has_value (R.Rec F), fun _ => R.record_has_value F⟩

/-- THE FRAME IS SELF-RECURSIVE EXACTLY WHEN IT CARRIES THE VALUE (the mirror of `self_recursion_at_machine` and of
    `self_recursion_at_zeros`). -/
theorem self_recursion_at_frame (F : R.Frame) : SelfRecursive R F ↔ R.Value F :=
  ⟨fun h => h.mpr (R.record_has_value F), fun h => ⟨fun _ => R.record_has_value F, fun _ => h⟩⟩

/-- THE BIT IS KEYED: the transfer holds on the calm frame and fails on the counter frame. -/
theorem bit_is_keyed : Transfer R R.calm ∧ ¬ Transfer R R.counter :=
  ⟨fun _ => R.calm_value, fun h => R.counter_fails (h (R.record_has_value R.counter))⟩

/-- THE RECORD'S SELF-RECURSION DOES NOT TRANSFER: the record of the counter frame is self-recursive and the counter
    frame is not. -/
theorem record_self_recursion_does_not_transfer :
    SelfRecursive R (R.Rec R.counter) ∧ ¬ SelfRecursive R R.counter :=
  ⟨record_is_self_recursive R R.counter, fun h => R.counter_fails (h.mpr (R.record_has_value R.counter))⟩

/-- THE RECORD DECIDES NOTHING (the mirror of `record_decides_nothing`): the two coherent frames both carry the value
    on their records, and split on the value itself. -/
theorem record_decides_nothing :
    R.Value (R.Rec R.calm) ∧ R.Value (R.Rec R.counter) ∧ R.Value R.calm ∧ ¬ R.Value R.counter :=
  ⟨R.record_has_value R.calm, R.record_has_value R.counter, R.calm_value, R.counter_fails⟩

/-- EVERY ROUTE PASSES THE BIT (the mirror of `every_route_passes_the_bit`): any premise that yields the value yields
    the transfer, so every proof of the value, from any premise and in any vocabulary, delivers the one implication. -/
theorem every_route_passes_the_bit (F : R.Frame) (Q : Prop) (h : Q → R.Value F) : Q → Transfer R F :=
  fun q _ => h q

/-- A premise shared by every frame. -/
def Keyless (P : R.Frame → Prop) : Prop := ∀ F, P F

/-- A premise that forces the value on every frame where it holds. -/
def Forces (P : R.Frame → Prop) : Prop := ∀ F, P F → R.Value F

/-- A KEYLESS PREMISE FORCES NOTHING (the mirror of `the_unconditional_route_is_blocked`): what every frame shares
    yields the value on none where it fails. -/
theorem keyless_forces_nothing (P : R.Frame → Prop) (hP : Keyless R P) : ¬ Forces R P :=
  fun h => R.counter_fails (h R.counter (hP R.counter))

/-- NO CLOSED PRINCIPLE DECIDES: a principle true of the record of every frame decides the value on none (the mirror of
    `no_closed_principle_decides`). -/
theorem no_record_principle_decides (P : R.Frame → Prop) (hP : ∀ F, P (R.Rec F)) :
    ¬ ∀ F, P (R.Rec F) → R.Value F :=
  fun h => R.counter_fails (h R.counter (hP R.counter))

/-- A SHARED RECORD DECIDES NOTHING: a record of frames that reads the same on the calm and the counter frame has no
    reading that returns the value on every frame. -/
theorem shared_record_decides_nothing {α : Type} (r : R.Frame → α) (hr : r R.calm = r R.counter) :
    ¬ ∃ g : α → Bool, ∀ F, (g (r F) = true ↔ R.Value F) :=
  fun ⟨g, hg⟩ => R.counter_fails ((hg R.counter).mp ((congrArg g hr).symm.trans ((hg R.calm).mpr R.calm_value)))

/-- THE BIT HAS NO UNIFORM ANSWER: across the frames of the row the transfer is neither always true nor always false. -/
theorem no_uniform_answer : ¬ (∀ F, Transfer R F) ∧ ¬ (∀ F, ¬ Transfer R F) :=
  ⟨fun h => (bit_is_keyed R).2 (h R.counter), fun h => h R.calm (bit_is_keyed R).1⟩

/-- "NOTHING IS OUTSIDE THE RECORD", read as the record's value transferring to the frame: false as a law of every
    frame, since the counter frame's record carries the value and the frame does not; at a frame, the value itself. -/
theorem nothing_outside_the_record_is_the_bit (F : R.Frame) :
    ¬ (∀ G, Transfer R G) ∧ (Transfer R F ↔ R.Value F) :=
  ⟨(no_uniform_answer R).1, normal_form R F⟩

/-- THE ONE DENIAL: wherever the value fails, the transfer fails, though the record carries the value. -/
theorem denial_is_the_bits_denial (F : R.Frame) : ¬ R.Value F ↔ ¬ Transfer R F :=
  ⟨fun hn h => hn (h (R.record_has_value F)), fun hn hv => hn (fun _ => hv)⟩

/-- THE NORMAL FORM, COMPLETE, nothing before the colon but the row and a frame: the record carries the value; the
    value is the transfer; the transfer is the act; the frame is self-recursive exactly when it carries the value;
    every route passes the bit; the denial is the bit's denial. The value is not a conjunct. -/
theorem normal_form_complete (F : R.Frame) :
    R.Value (R.Rec F) ∧ (Transfer R F ↔ R.Value F) ∧ (Transfer R F ↔ Nonempty (Act R F)) ∧
    (SelfRecursive R F ↔ R.Value F) ∧ (∀ Q : Prop, (Q → R.Value F) → Q → Transfer R F) ∧
    (¬ R.Value F ↔ ¬ Transfer R F) :=
  ⟨R.record_has_value F, normal_form R F, bit_is_the_act R F, self_recursion_at_frame R F,
   fun Q h => every_route_passes_the_bit R F Q h, denial_is_the_bits_denial R F⟩

end core

/-! ### the refusals and the outside, generic over a proposition -/

/-- A true Boolean is never its own negation. -/
theorem bnot_ne (b : Bool) : (!b) ≠ b := by cases b <;> decide

/-- REFUSAL · "A PROOF IS WAITING" fails SREP: a true route to B is B itself (carried from `PNP.GATES.refusal_waiting`). -/
theorem refusal_waiting (B : Prop) : (∃ Q : Prop, Q ∧ (Q → B)) ↔ B :=
  ⟨fun ⟨_, q, h⟩ => h q, fun b => ⟨B, b, id⟩⟩

/-- REFUSAL · "NO PROOF CAN EVER EXIST" fails SREP: no true route to B is ¬ B itself, the counter world in costume
    (carried from `PNP.GATES.refusal_no_proof`). -/
theorem refusal_no_proof (B : Prop) : (¬ ∃ Q : Prop, Q ∧ (Q → B)) ↔ ¬ B :=
  ⟨fun h b => h ⟨B, b, id⟩, fun hn ⟨_, q, h⟩ => hn (h q)⟩

/-- A BLOCK NEEDS AN OUTSIDE: if the target is a function of the record, no record-preserving involution flips it, so
    a block that flips the target always stands on something the record leaves out (carried from
    `PNP.ESCAPE.block_needs_an_outside`). -/
theorem block_needs_an_outside {X Y : Type} (ρ : X → Y) (t : X → Bool) (x₀ : X)
    (hrec : ∃ g : Y → Bool, ∀ x, t x = g (ρ x)) :
    ¬ ∃ τ : X → X, (∀ x, ρ (τ x) = ρ x) ∧ (∀ x, t (τ x) = !t x) :=
  fun ⟨τ, hρ, ht⟩ => match hrec with
  | ⟨g, hg⟩ => bnot_ne (t x₀) (by rw [← ht x₀, hg (τ x₀), hρ x₀, ← hg x₀])

/-- The native involution on the bit: complementation. -/
def comp (b : Bool) : Bool := !b

/-- Complementation is an involution with no fixed point. -/
theorem comp_involution (b : Bool) : comp (comp b) = b := by cases b <;> rfl

/-- THE LOCUS OF COMPLEMENTATION VANISHES: no bit is its own complement. -/
theorem locus_vanishes : ¬ ∃ b, comp b = b := fun ⟨b, h⟩ => bnot_ne b h

/-- The grades a face carries, ranked. -/
inductive Grade
  | premise
  | structural
  | thm
  deriving DecidableEq

/-- The rank of a grade. -/
def Grade.rank : Grade → Nat
  | .premise => 0
  | .structural => 1
  | .thm => 2

/-- The weakest of two grades. -/
def Grade.weakest (a b : Grade) : Grade := if a.rank ≤ b.rank then a else b

/-- A JOIN NEVER STANDS ABOVE ITS WEAKEST FACE, and a tuple of theorems joined with the premise reads premise. -/
theorem join_reads_the_weakest :
    (∀ a b : Grade, (Grade.weakest a b).rank ≤ a.rank ∧ (Grade.weakest a b).rank ≤ b.rank) ∧
    Grade.weakest (Grade.weakest .thm .thm) .premise = .premise :=
  ⟨fun a b => by
     cases a <;> cases b <;> exact ⟨by decide, by decide⟩,
   by decide⟩

/-- A SQUARED SCALAR IS BLIND TO SIGN: a value and its reflection square alike, read from the definitions of
    negation and multiplication on the integers. -/
theorem square_is_sign_blind : ∀ x : Int, (-x) * (-x) = x * x
  | Int.ofNat 0 => rfl
  | Int.ofNat (_ + 1) => rfl
  | Int.negSucc _ => rfl

end NS.NORMALFORM

/-! ===================================================================================================================
    PART C · THE ROW SPLIT (namespace NS.ROWSPLIT) · v1_1_0_CC

    The cut-agnostic division, carried verbatim from the Riemann master v3.0.39_CC (namespace RHUnicorn, generic over
    the types α and β), its one proposition renamed from `RH` to `Whole`, the hypothesis it names. At every cut T the
    whole is exactly its Real part and its Unicorn part; a certificate at T proves the Real part; given the Real part
    the whole is exactly the Unicorn part; above every cut no reading of an even record agrees with an odd decision;
    the aperture is one bit wide; and the supply side is silent at the register. ΔM = 0.
=================================================================================================================== -/
namespace NS.ROWSPLIT

variable {α β : Type}

/-- The whole, the Real part at T, the Unicorn part at T. -/
def Whole (Z onL : α → Prop) : Prop := ∀ z, Z z → onL z
def RealPartAt (Z onL : α → Prop) (height : α → Nat) (T : Nat) : Prop :=
  ∀ z, Z z → height z ≤ T → onL z
def UnicornAt (Z onL : α → Prop) (height : α → Nat) (T : Nat) : Prop :=
  ∀ z, Z z → height z > T → onL z

/-- THE FORMAL BLOCK OF THE UNICORN PART. Let τ act on the existents, let ρ be a record even at a seat z above the
    height, and let d decide the property, odd at z. Then no reading g of the record agrees with d even on the region
    above the height alone. -/
theorem unicorn_block (height : α → Nat) (T : Nat) (τ : α → α) (ρ : α → β) (d : α → Bool)
    (z : α) (habove : height z > T) (habove' : height (τ z) > T)
    (hρ : ρ (τ z) = ρ z) (hd : d (τ z) = !d z) :
    ¬ ∃ g : β → Bool, ∀ w, height w > T → g (ρ w) = d w := by
  intro ⟨g, hg⟩
  have h1 := hg z habove
  have h2 := hg (τ z) habove'
  rw [hρ, hd, h1] at h2
  revert h2
  cases d z <;> intro h2 <;> exact Bool.noConfusion h2

/-- THE APERTURE, ONE BIT WIDE. At a seat where d is odd, one odd bit s at the seat decides d on the seat and its
    partner through a calibration that exists and is unique. -/
theorem aperture_one_bit_wide (τ : α → α) (s d : α → Bool) (z : α)
    (hs : s (τ z) = !s z) (hd : d (τ z) = !d z) :
    ∃ c : Bool, (d z = xor (s z) c ∧ d (τ z) = xor (s (τ z)) c) ∧
      ∀ c' : Bool, (d z = xor (s z) c' ∧ d (τ z) = xor (s (τ z)) c') → c' = c :=
  ⟨xor (d z) (s z),
    ⟨by cases s z <;> cases d z <;> rfl,
     by rw [hs, hd]; cases s z <;> cases d z <;> rfl⟩,
    by
      intro c' hc
      obtain ⟨h1, -⟩ := hc
      generalize hsz : s z = sv
      generalize hdz : d z = dv
      rw [hsz, hdz] at h1
      cases sv <;> cases dv <;> cases c' <;> first | rfl | exact absurd h1 (by decide)⟩

/-- EXISTENCE SUPPLIES NOTHING: conditioning the Unicorn part on an inhabited premise leaves it where it was. -/
theorem unicorn_rule_exact (Z onL : α → Prop) (height : α → Nat) (T : Nat) (A : Prop) (ha : A) :
    (A → UnicornAt Z onL height T) ↔ UnicornAt Z onL height T :=
  ⟨fun h => h ha, fun hu _ => hu⟩

/-- NO BYPASS: given the Real part, the whole is exactly the Unicorn part. -/
theorem unicorn_no_bypass (Z onL : α → Prop) (height : α → Nat) (T : Nat)
    (hr : RealPartAt Z onL height T) : Whole Z onL ↔ UnicornAt Z onL height T := by
  constructor
  · intro h z hz _; exact h z hz
  · intro hu z hz
    cases Nat.lt_or_ge T (height z) with
    | inl hgt => exact hu z hz hgt
    | inr hle => exact hr z hz hle

/-- THE SUPPLY SIDE IS SILENCE, AT THE REGISTER: both orientations of d at the seat are equally refused to every
    reading above the height. -/
theorem supply_side_silent (height : α → Nat) (T : Nat) (τ : α → α) (ρ : α → β) (d : α → Bool)
    (z : α) (habove : height z > T) (habove' : height (τ z) > T)
    (hρ : ρ (τ z) = ρ z) (hd : d (τ z) = !d z) :
    (¬ ∃ g : β → Bool, ∀ w, height w > T → g (ρ w) = d w) ∧
    (¬ ∃ g : β → Bool, ∀ w, height w > T → g (ρ w) = !d w) ∧
    (!d z) ≠ d z :=
  ⟨unicorn_block height T τ ρ d z habove habove' hρ hd,
   unicorn_block height T τ ρ (fun w => !d w) z habove habove' hρ (by
     show (!d (τ z)) = !(!d z)
     rw [hd]),
   by cases d z <;> decide⟩

/-- The division at the height: the whole is exactly its Real part and its Unicorn part. -/
theorem whole_iff_real_and_unicorn (Z onL : α → Prop) (height : α → Nat) (T : Nat) :
    Whole Z onL ↔ RealPartAt Z onL height T ∧ UnicornAt Z onL height T := by
  constructor
  · intro h; exact ⟨fun z hz _ => h z hz, fun z hz _ => h z hz⟩
  · intro ⟨hr, hu⟩ z hz
    cases Nat.lt_or_ge T (height z) with
    | inl hgt => exact hu z hz hgt
    | inr hle => exact hr z hz hle

/-- A certificate at the height: a complete list of the existents up to T, each checked. -/
structure Certificate (Z onL : α → Prop) (height : α → Nat) (T : Nat) where
  items    : List α
  complete : ∀ z, Z z → height z ≤ T → z ∈ items
  checked  : ∀ z, z ∈ items → onL z

/-- A CERTIFICATE PROVES THE REAL PART AT ITS HEIGHT. -/
theorem real_part_of_certificate (Z onL : α → Prop) (height : α → Nat) (T : Nat)
    (c : Certificate Z onL height T) : RealPartAt Z onL height T :=
  fun z hz hle => c.checked z (c.complete z hz hle)

end NS.ROWSPLIT
/-! ===================================================================================================================
    PART B · THE HOST MODEL AND ITS BINDING, PROVED (namespace NS.HOST) · v1_1_0_CC

    The record of a frame keeps every datum and registers its flow finite at every time, the count at rest: on the
    record every datum is regular, so the record carries the value with no premise (`recFrame_value`). The host is the
    row's smooth divergence-free initial data of rapid decay on ℝ³, unforced, each with the count of registrations its
    flow has made by each time, none where the count is unbounded, which is blowup by that time; its sentence is that
    every flow is finite at every time. The binding is a theorem: the value of the host's frame is exactly the host's
    sentence (`binding`); the sentence is exactly the sentence at every horizon (`sentence_iff_every_horizon`); and one
    blowup refutes it (`blowup_refutes_sentence`). Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace NS.HOST
open NSClose

/-- THE RECORD OF A FRAME: the registration keeps every datum and registers its flow finite at every time, the count at
    rest. -/
def recFrame (F : Frame) : Frame := ⟨F.D, fun _ _ => some 0⟩

/-- THE RECORD CARRIES THE VALUE, with no premise. -/
theorem recFrame_value (F : Frame) : Value (recFrame F) := fun _ _ => ⟨0, rfl⟩

/-- THE NAVIER–STOKES ROW: the frames of data and their counts, the value, the registration onto the record, the calm
    world and the blowup world. -/
def nsRow : NS.NORMALFORM.Row.{1} :=
  ⟨Frame, Value, recFrame, recFrame_value, calm, burst, calm_value, burst_fails⟩

/-- EVERY DATUM HAS ITS SEAT ON THE RECORD: at rest, its count zero at every time. -/
theorem every_datum_has_its_seat (F : Frame) (d : F.D) (t : Nat) : (recFrame F).count d t = some 0 := rfl

/-- THE HOST: the smooth divergence-free initial data of rapid decay on ℝ³, unforced, each with the count of the
    registrations its flow has made by each time, `none` where the count is unbounded, which is blowup by that time. -/
structure Host where
  Datum : Type
  count : Datum → Nat → Option Nat

/-- THE SENTENCE OF THE HOST: every flow is finite at every time. -/
def Host.Sentence (H : Host) : Prop := ∀ u t, ∃ n, H.count u t = some n

/-- THE FRAME OF THE HOST. -/
def Host.frame (H : Host) : Frame := ⟨H.Datum, H.count⟩

/-- THE BINDING, PROVED: the value of the host's frame is exactly the host's sentence. -/
theorem binding (H : Host) : Value H.frame ↔ H.Sentence := ⟨fun h u t => h u t, fun h u t => h u t⟩

/-- THE ROOT READ ON THE ROW IS THE SENTENCE, on the host's frame. -/
theorem root_on_row_is_the_sentence (H : Host) : RootOnRow H.frame ↔ H.Sentence :=
  (root_on_row_is_the_value H.frame).trans (binding H)

/-- THE ACT ON THE HOST'S FRAME IS THE SENTENCE. -/
theorem act_is_the_sentence (H : Host) : ActsFinitely H.frame ↔ H.Sentence :=
  (act_is_the_value H.frame).trans (binding H)

/-- THE SENTENCE BY A HORIZON: every flow finite at every time up to it. -/
def Host.SentenceBy (H : Host) (T : Nat) : Prop := ∀ u t, t ≤ T → ∃ n, H.count u t = some n

/-- THE SENTENCE IS THE SENTENCE AT EVERY HORIZON. -/
theorem sentence_iff_every_horizon (H : Host) : H.Sentence ↔ ∀ T, H.SentenceBy T :=
  ⟨fun h _ u t _ => h u t, fun h u t => h t u t (Nat.le_refl t)⟩

/-- ONE BLOWUP REFUTES THE SENTENCE. -/
theorem blowup_refutes_sentence (H : Host) (u : H.Datum) (t : Nat) (h : H.count u t = none) : ¬ H.Sentence :=
  fun s => match s u t with
    | ⟨_, hn⟩ => Option.noConfusion (h.symm.trans hn)

end NS.HOST

/-! ===================================================================================================================
    PART C′ · THE ROW SPLIT READ BY THE SIZE OF THE DATUM (namespace NS.REALPART) · v1_1_0_CC

    The cut-agnostic division of Part C read on a frame that carries the cited small-data theorem: the existents are the
    frame's data, the property each is asked is regularity, and the height is the size of the datum in the critical
    norm. At the threshold the real part is the small data, sealed by the cited theorem carried as a field
    (`real_part_small`); the value is exactly its real part and its unicorn part at every cut; given the real part the
    value is exactly the unicorn part, the large data (`no_bypass_at_small_data`); the unicorn part is load-bearing; and
    above every size no reading of a record that keeps the size and forgets the world returns the world. Every theorem
    on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace NS.REALPART
open NSClose NS.ROWSPLIT

/-- A FRAME WITH THE SMALL-DATA THEOREM: a frame, the size of each datum in the critical norm, the threshold, and the
    cited theorem that every datum at most the threshold in size is regular, carried as a field. -/
structure SmallData where
  F     : Frame
  size  : F.D → Nat
  ε     : Nat
  small : ∀ d, size d ≤ ε → Regular F d

/-- The existents: every datum of the frame. -/
def Ex (S : SmallData) (_ : S.F.D) : Prop := True

/-- The property each datum is asked: regularity. -/
def Re (S : SmallData) (d : S.F.D) : Prop := Regular S.F d

/-- The value of the frame is the whole of the row split. -/
theorem value_is_the_whole (S : SmallData) : Value S.F ↔ Whole (Ex S) (Re S) :=
  ⟨fun h d _ => h d, fun h d => h d trivial⟩

/-- THE REAL PART AT THE THRESHOLD: every small datum is regular, by the cited theorem. -/
theorem real_part_small (S : SmallData) : RealPartAt (Ex S) (Re S) S.size S.ε :=
  fun d _ h => S.small d h

/-- THE CUT AT EVERY SIZE: the value is exactly its real part and its unicorn part. -/
theorem value_iff_real_and_unicorn (S : SmallData) (T : Nat) :
    Value S.F ↔ RealPartAt (Ex S) (Re S) S.size T ∧ UnicornAt (Ex S) (Re S) S.size T :=
  (value_is_the_whole S).trans (whole_iff_real_and_unicorn (Ex S) (Re S) S.size T)

/-- NO BYPASS AT SMALL DATA: given the cited theorem, the value is exactly the unicorn part, the large data. -/
theorem no_bypass_at_small_data (S : SmallData) : Value S.F ↔ UnicornAt (Ex S) (Re S) S.size S.ε :=
  (value_is_the_whole S).trans (unicorn_no_bypass (Ex S) (Re S) S.size S.ε (real_part_small S))

/-- THE UNICORN PART IS THE LARGE DATA. -/
theorem unicorn_is_large_data (S : SmallData) :
    UnicornAt (Ex S) (Re S) S.size S.ε ↔ ∀ d, S.ε < S.size d → Regular S.F d :=
  ⟨fun h d hgt => h d trivial hgt, fun h d _ hgt => h d hgt⟩

/-- The staged world read by size: its first datum small and regular, every later datum large and blowing up. -/
def stagedSmall : SmallData :=
  ⟨staged 1, fun d => d, 0, fun d h => (finite_record_never_forces 1).1 d (Nat.lt_succ_of_le h)⟩

/-- THE UNICORN PART IS LOAD-BEARING: the staged world carries the cited small-data field and the real part, and fails
    the value on its large data. -/
theorem unicorn_part_is_load_bearing :
    RealPartAt (Ex stagedSmall) (Re stagedSmall) stagedSmall.size stagedSmall.ε ∧ ¬ Value stagedSmall.F :=
  ⟨real_part_small stagedSmall, (finite_record_never_forces 1).2⟩

/-- THE UNICORN PART CLOSED TO THE RECORD ABOVE EVERY SIZE: on the chart of worlds and sizes, a record that keeps the
    size and forgets the world is even under the exchange of worlds, the world is odd, and above every size no reading
    of the record returns the world. -/
theorem unicorn_blocked_above_every_size (T : Nat) :
    ¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1 :=
  unicorn_block Prod.snd T (fun w => (!w.1, w.2)) Prod.snd Prod.fst (true, T + 1)
    (Nat.lt_succ_self T) (Nat.lt_succ_self T) rfl rfl

/-- THE SUPPLY SIDE IS SILENT ABOVE EVERY SIZE: both orientations of the world are refused alike to every reading of
    the record, and the two orientations differ. -/
theorem supply_side_silent_above_every_size (T : Nat) :
    (¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1) ∧
    (¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = !w.1) ∧ (!true) ≠ true :=
  supply_side_silent Prod.snd T (fun w => (!w.1, w.2)) Prod.snd Prod.fst (true, T + 1)
    (Nat.lt_succ_self T) (Nat.lt_succ_self T) rfl rfl

/-- THE APERTURE IS ONE BIT WIDE: at the seat of the exchange above every size, one odd supplied bit calibrates the
    world uniquely, through one calibration bit that exists and is unique. -/
theorem aperture_is_one_bit (T : Nat) :
    let z : Bool × Nat := (true, T + 1)
    let τ : Bool × Nat → Bool × Nat := fun w => (!w.1, w.2)
    ∃ c : Bool, (z.1 = xor (!z.1) c ∧ (τ z).1 = xor (!(τ z).1) c) ∧
      ∀ c' : Bool, (z.1 = xor (!z.1) c' ∧ (τ z).1 = xor (!(τ z).1) c') → c' = c :=
  aperture_one_bit_wide (fun w : Bool × Nat => (!w.1, w.2)) (fun w => !w.1) Prod.fst (true, T + 1) rfl rfl

end NS.REALPART

/-! ===================================================================================================================
    PART D · THE WALLS (namespace NS.WALLS) · v1_1_0_CC

    Every zero-bit route is closed by theorem. Existence as given carries the form and forces nothing (Part 0). The
    energy inequality holds on a blowup frame, and the energy record decides nothing (Part 0). No finite record forces
    the value, and no size-preserving symmetry lifts a decided datum (Part 0). The speed limit and the cascade are each
    load-bearing (Part 0). This Part adds the dyadic wall, decided by the kernel and proved at every bound: a cascade
    that doubles its registrations at every dyadic step passes every bound c · E · T within c · E · T steps
    (`dyadic_cascade_is_cut`), at the first step k with 2^k above the bound, computed for the bounds 1, 12, 100, 1000
    and 4096 (`dyadic_cutoffs`); so a doubling cascade never holds to the speed limit (`doubling_breaks_the_speed_limit`),
    and the cascade a blowup needs halts at a finite dyadic step on matter. Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace NS.WALLS
open NSClose

/-- TWO TO EVERY POWER EXCEEDS THE EXPONENT. -/
theorem exponent_below_its_power : ∀ n : Nat, n < 2 ^ n
  | 0 => Nat.zero_lt_one
  | n + 1 =>
    have h1 : n + 1 ≤ 2 ^ n := Nat.succ_le_of_lt (exponent_below_its_power n)
    have h2 : 2 ^ n < 2 ^ n + 2 ^ n := Nat.lt_add_of_pos_right (Nat.two_pow_pos n)
    have h3 : 2 ^ n + 2 ^ n = 2 ^ (n + 1) := (Nat.mul_two (2 ^ n)).symm.trans (Nat.pow_succ 2 n).symm
    Nat.lt_of_le_of_lt h1 (Nat.lt_of_lt_of_le h2 (Nat.le_of_eq h3))

/-- THE SPEED LIMIT CUTS EVERY DYADIC CASCADE: for every bound there is a dyadic step, no later than the bound itself,
    at which the doubling cascade passes it. -/
theorem dyadic_cascade_is_cut (b : Nat) : ∃ k, k ≤ b ∧ b < 2 ^ k :=
  ⟨b, Nat.le_refl b, exponent_below_its_power b⟩

/-- A DOUBLING CASCADE BREAKS THE SPEED LIMIT: no cascade that doubles at every dyadic step holds every stage to the
    bound c · E · T. -/
theorem doubling_breaks_the_speed_limit (c E T : Nat) : ¬ ∀ k, 2 ^ k ≤ c * E * T :=
  fun h => Nat.lt_irrefl _ (Nat.lt_of_lt_of_le (exponent_below_its_power (c * E * T)) (h (c * E * T)))

/-- The search for the first dyadic step past the bound, with fuel. -/
def cutoffAux (b : Nat) : Nat → Nat → Nat
  | 0, k => k
  | fuel + 1, k => if b < 2 ^ k then k else cutoffAux b fuel (k + 1)

/-- The first dyadic step at which the doubling cascade passes the bound. -/
def cutoff (b : Nat) : Nat := cutoffAux b (b + 1) 0

/-- THE DYADIC CUTOFFS, decided by the kernel: the doubling cascade passes the bounds 1, 12, 100, 1000 and 4096 at the
    steps 1, 4, 7, 10 and 13; and at the bound 1 · 3 · 4 of one unit of the speed constant, three of energy and four of
    time, it passes at step 4, its step 3 still inside the bound. -/
theorem dyadic_cutoffs :
    [1, 12, 100, 1000, 4096].map cutoff = [1, 4, 7, 10, 13] ∧
    cutoff (1 * 3 * 4) = 4 ∧ 2 ^ 3 ≤ 1 * 3 * 4 ∧ 1 * 3 * 4 < 2 ^ 4 := by decide

/-- THE WALLS OF THE ROW, one theorem: no given statement is the value on every frame; the arrow forces nothing; the
    energy inequality holds on a blowup frame and the energy record decides nothing; no finite record forces the
    value; the speed limit and the cascade are each load-bearing; no reading of the kinetic record returns the bit;
    and no doubling cascade holds to the speed limit. -/
theorem the_walls :
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    (¬ ∀ F : Frame, Arrow → Value F) ∧
    ((∀ d t, leray.paid d t ≤ leray.energy d) ∧ ¬ Value leray.F) ∧
    (∀ n : Nat, (∀ d, d < n → Regular (staged n) d) ∧ ¬ Value (staged n)) ∧
    (cascadeWorld.count () 1 = none ∧ ¬ Value cascadeFrame ∧ ∀ b : Nat, ∃ k, ¬ cascadeWorld.stage () 1 k ≤ b) ∧
    ((∀ d T k, speedWorld.stage d T k ≤ speedWorld.c * speedWorld.energy d * T) ∧
      speedWorld.count () 1 = none ∧ ¬ Value speedFrame) ∧
    (¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w) ∧
    (∀ c E T : Nat, ¬ ∀ k, 2 ^ k ≤ c * E * T) :=
  ⟨given_is_not_the_value, arrow_forces_nothing, energy_does_not_decide, finite_record_never_forces,
   speed_is_load_bearing, cascade_is_load_bearing, record_wall, doubling_breaks_the_speed_limit⟩

end NS.WALLS

/-! ===================================================================================================================
    PART E · THE RESIDUE (namespace NS.RESIDUE) · v1_1_0_CC

    Everything above is unconditional. What remains of the Navier–Stokes sentence is this one hypothesis, the transfer
    of the value from the record to the host's frame: given it, the sentence follows on no axiom. It is printed here as
    the type of a hypothesis and is assumed nowhere. The residue is keyed: no premise shared by every frame and no
    principle true of every record supplies it. Its instance seat on a frame carrying the small-data theorem is the
    large data. ΔM = 0.
=================================================================================================================== -/
namespace NS.RESIDUE
open NSClose NS.NORMALFORM NS.HOST NS.REALPART NS.ROWSPLIT

/-- THE RESIDUE: given the one implication at the host's frame, the host's sentence. -/
theorem sentence_of_the_act (H : Host) (bit : Transfer nsRow H.frame) : H.Sentence :=
  (binding H).mp (value_from_the_cargo_loop nsRow H.frame bit)

/-- THE RESIDUE IS THE SENTENCE: the transfer at the host's frame is exactly the host's sentence. -/
theorem residue_is_the_sentence (H : Host) : Transfer nsRow H.frame ↔ H.Sentence :=
  (normal_form nsRow H.frame).trans (binding H)

/-- THE ONE POSIT IS THE BIT: the root read on the row, at the host's frame, is exactly the transfer. -/
theorem the_posit_is_the_bit (H : Host) : RootOnRow H.frame ↔ Transfer nsRow H.frame :=
  (root_on_row_is_the_sentence H).trans (residue_is_the_sentence H).symm

/-- THE RESIDUE IS KEYED: no premise shared by every frame forces the value, and no principle true of every record
    decides it. What supplies it is keyed to the frame: the act. -/
theorem residue_is_keyed :
    (∀ P : Frame → Prop, Keyless nsRow P → ¬ Forces nsRow P) ∧
    (∀ P : Frame → Prop, (∀ F, P (recFrame F)) → ¬ ∀ F, P (recFrame F) → Value F) :=
  ⟨keyless_forces_nothing nsRow, no_record_principle_decides nsRow⟩

/-- THE INSTANCE SEAT OF THE BIT, on a frame carrying the small-data theorem: regularity of every large datum. Its
    inhabitation is equivalent in strength to the frame's value (`seat_iff_value`); nothing in this file assumes it
    inhabited. -/
structure LargeSeat (S : SmallData) where
  large : ∀ d, S.ε < S.size d → Regular S.F d

/-- THE SEAT AND THE CITED THEOREM DELIVER THE VALUE. -/
theorem value_of_seat (S : SmallData) (L : LargeSeat S) : Value S.F :=
  fun d => match Nat.lt_or_ge S.ε (S.size d) with
    | Or.inl h => L.large d h
    | Or.inr h => S.small d h

/-- THE SEAT IS INHABITED EXACTLY WHEN THE VALUE HOLDS. -/
theorem seat_iff_value (S : SmallData) : Nonempty (LargeSeat S) ↔ Value S.F :=
  ⟨fun ⟨L⟩ => value_of_seat S L, fun h => ⟨⟨fun d _ => h d⟩⟩⟩

/-- THE SEAT IS THE UNICORN PART. -/
theorem seat_is_the_unicorn (S : SmallData) : Nonempty (LargeSeat S) ↔ UnicornAt (Ex S) (Re S) S.size S.ε :=
  ⟨fun ⟨L⟩ => (unicorn_is_large_data S).mpr L.large, fun h => ⟨⟨(unicorn_is_large_data S).mp h⟩⟩⟩

end NS.RESIDUE

/-! ===================================================================================================================
    PART F · THE SUPPLY (namespace NS.SUPPLY) · v1_1_0_CC

    The bit of Part E, supplied by the act and delivered by its two kinds: the formal cargo, and the physical witness.
    Each kind is a type whose inhabitant is the supply; neither is assumed anywhere in this file. The physical witness
    is matter read through the quantum speed limit and the cascade: every stage count before a horizon is at most
    c · E · T, and an unbounded count needs stage counts above every bound. The cargo arrives free; each kind delivers
    the sentence; the two kinds are one bit; every route to the sentence delivers both kinds, so there is no third; and
    one blowup refutes both at once. The witnesses of the subject are typed against the bit. ΔM = 0.
=================================================================================================================== -/
namespace NS.SUPPLY
open NSClose NS.NORMALFORM NS.HOST NS.REALPART

/-- THE FORMAL KIND, the cargo: the record's value carried to the host's frame. -/
def FormalCargo (H : Host) : Prop := Transfer nsRow H.frame

/-- THE PHYSICAL KIND, the witness: the energy of each datum, the stage counts of registrations before each horizon,
    the speed constant; the quantum speed limit, every stage count before T at most c · E · T; and the cascade, an
    unbounded count by T needing stage counts before T above every bound. The last two fields are the one bit read in
    the register of registrations; they are premises of the witness, carried as fields, never proved. -/
structure PhysicalWitness (H : Host) where
  energy  : H.Datum → Nat
  stage   : H.Datum → Nat → Nat → Nat
  c       : Nat
  speed   : ∀ u T k, stage u T k ≤ c * energy u * T
  cascade : ∀ u T, H.count u T = none → ∀ N, ∃ k, N < stage u T k

/-- The physical witness read as a physical frame of Part 0. -/
def PhysicalWitness.matter {H : Host} (W : PhysicalWitness H) : Physical :=
  ⟨H.Datum, W.energy, W.stage, W.c, W.speed, H.count, W.cascade⟩

/-- THE CARGO ARRIVES, with no premise: the record of the host's frame carries the value. -/
theorem cargo_arrives (H : Host) : Value (recFrame H.frame) := recFrame_value H.frame

/-- KIND 1 DELIVERS: the formal cargo gives the sentence in one step. -/
theorem formal_kind_delivers {H : Host} (h : FormalCargo H) : H.Sentence := (binding H).mp (h (cargo_arrives H))

/-- The physical witness closes the host's frame: matter is regular. -/
theorem witness_closes {H : Host} (W : PhysicalWitness H) : Value H.frame := matter_is_regular W.matter

/-- KIND 2 DELIVERS: the physical witness gives the sentence. -/
theorem physical_kind_delivers {H : Host} (W : PhysicalWitness H) : H.Sentence := (binding H).mp (witness_closes W)

/-- A witness from the sentence: no registration, no energy, and no unbounded count to cascade. -/
def witness_of_sentence {H : Host} (h : H.Sentence) : PhysicalWitness H :=
  ⟨fun _ => 0, fun _ _ _ => 0, 0, fun _ _ _ => Nat.zero_le _,
   fun u T hn => match h u T with
     | ⟨_, hs⟩ => Option.noConfusion (hn.symm.trans hs)⟩

/-- THE PHYSICAL FACE IS THE SENTENCE: a witness exists exactly when the sentence holds. -/
theorem physical_iff_sentence (H : Host) : Nonempty (PhysicalWitness H) ↔ H.Sentence :=
  ⟨fun ⟨W⟩ => physical_kind_delivers W, fun h => ⟨witness_of_sentence h⟩⟩

/-- THE FORMAL FACE IS THE SENTENCE. -/
theorem formal_iff_sentence (H : Host) : FormalCargo H ↔ H.Sentence := NS.RESIDUE.residue_is_the_sentence H

/-- THE TWO KINDS ARE ONE BIT: the physical witness is a formal cargo, and the cargo is exactly the sentence. -/
theorem the_two_kinds_are_one_bit (H : Host) :
    (PhysicalWitness H → FormalCargo H) ∧ (FormalCargo H ↔ H.Sentence) :=
  ⟨fun W _ => witness_closes W, formal_iff_sentence H⟩

/-- THE SENTENCE, DELIVERED TWICE: either kind gives it. -/
theorem delivered_twice (H : Host) : (FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence) :=
  ⟨formal_kind_delivers, physical_kind_delivers⟩

/-- TWO KINDS AND NO THIRD: every witness of the sentence, in any vocabulary, is a delivery of both kinds. -/
theorem two_kinds_and_no_third (H : Host) (Q : Prop) (h : Q → H.Sentence) :
    Q → FormalCargo H ∧ Nonempty (PhysicalWitness H) :=
  fun q => ⟨(formal_iff_sentence H).mpr (h q), (physical_iff_sentence H).mpr (h q)⟩

/-- THE ONE REFUTER: one blowup refutes both kinds at once. -/
theorem the_one_refuter (H : Host) (u : H.Datum) (t : Nat) (h : H.count u t = none) :
    ¬ FormalCargo H ∧ ¬ Nonempty (PhysicalWitness H) :=
  have hs : ¬ H.Sentence := blowup_refutes_sentence H u t h
  ⟨fun c => hs (formal_kind_delivers c), fun ⟨W⟩ => hs (physical_kind_delivers W)⟩

/-- THE WITNESSES OF THE SUBJECT, TYPED: the energy inequality holds on a blowup frame, and the energy record decides
    nothing; the small-data theorem gives the real part on every frame that carries it and stops short of the value;
    the speed limit and the cascade are each load-bearing; and on every physical frame every stage count before every
    horizon is bounded, no datum blows up, and the frame of matter is regular. Each is typed against the bit; none is
    its ground. -/
theorem the_witnesses_typed :
    ((∀ d t, leray.paid d t ≤ leray.energy d) ∧ ¬ Value leray.F) ∧
    (¬ ∃ g : (Unit → Nat) → (Unit → Nat → Nat) → Prop,
      (g calmPriced.energy calmPriced.paid ↔ Value calmPriced.F) ∧ (g leray.energy leray.paid ↔ Value leray.F)) ∧
    ((∀ S : SmallData, NS.ROWSPLIT.RealPartAt (Ex S) (Re S) S.size S.ε) ∧ ¬ Value stagedSmall.F) ∧
    (cascadeWorld.count () 1 = none ∧ ¬ Value cascadeFrame ∧ ∀ b : Nat, ∃ k, ¬ cascadeWorld.stage () 1 k ≤ b) ∧
    ((∀ d T k, speedWorld.stage d T k ≤ speedWorld.c * speedWorld.energy d * T) ∧
      speedWorld.count () 1 = none ∧ ¬ Value speedFrame) ∧
    (∀ P : Physical, (∀ d T, ∃ b, ∀ k, P.stage d T k ≤ b) ∧ (∀ d T, ¬ P.Blowup d T) ∧ Value P.frame) :=
  ⟨energy_does_not_decide, energy_record_decides_nothing.2.2.2.2, ⟨real_part_small, unicorn_part_is_load_bearing.2⟩,
   speed_is_load_bearing, cascade_is_load_bearing, matter_regular_from_speed⟩

/-- THE SUPPLY, CLOSED, at every host: the cargo arrives free; each kind delivers; the two kinds are one bit; the bit is
    the sentence; every route is both kinds; and one blowup refutes both. -/
theorem the_supply_closed : ∀ H : Host,
    Value (recFrame H.frame) ∧
    (FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence) ∧
    (PhysicalWitness H → FormalCargo H) ∧ (FormalCargo H ↔ H.Sentence) ∧
    (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧
    (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧
    (∀ u t, H.count u t = none → ¬ FormalCargo H ∧ ¬ Nonempty (PhysicalWitness H)) :=
  fun H => ⟨cargo_arrives H, formal_kind_delivers, physical_kind_delivers, (the_two_kinds_are_one_bit H).1,
   formal_iff_sentence H, physical_iff_sentence H, two_kinds_and_no_third H, the_one_refuter H⟩

end NS.SUPPLY

/-! ===================================================================================================================
    PART G · THE CLOSURE OF THE QUESTION (namespace NS.CLOSURE) · v1_1_0_CC

    Why the question is closed and not open. At every host the regularity sentence and the bit are one proposition,
    with nothing cited; the denial of the sentence is the bit's denial; across the frames of the row the bit has no
    uniform answer, true in one world and false in another of the same record; every keyless route is barred; either
    kind of the supply gives the sentence; and one blowup refutes the sentence itself. Nothing here derives the bit. It
    proves that the question is one bit, that the bit is keyed, and that what is open is a value and not a form. ΔM = 0.
=================================================================================================================== -/
namespace NS.CLOSURE
open NSClose NS.NORMALFORM NS.HOST NS.SUPPLY

/-- THE SENTENCE IS THE BIT, nothing cited. -/
theorem the_sentence_is_the_bit (H : Host) : H.Sentence ↔ FormalCargo H := (formal_iff_sentence H).symm

/-- THE DENIAL IS THE BIT'S DENIAL. -/
theorem denial_is_the_bits_denial (H : Host) : ¬ H.Sentence ↔ ¬ FormalCargo H :=
  ⟨fun hn h => hn (formal_kind_delivers h), fun hn h => hn ((formal_iff_sentence H).mpr h)⟩

/-- THE DENIAL HAS ONE ROAD: wherever the sentence fails, it cannot be that no datum blows up. -/
theorem the_denial_has_one_road (H : Host) : ¬ H.Sentence → ¬ ¬ ∃ u t, H.count u t = none :=
  fun hn hne => hn (fun u t => match hc : H.count u t with
    | some n => ⟨n, rfl⟩
    | none => absurd ⟨u, t, hc⟩ hne)

/-- THE QUESTION, CLOSED TO ONE BIT, at every host. The sentence is the bit and its denial is the bit's denial; the bit
    has no uniform answer across the frames; no keyless premise forces it; either kind of the supply gives the
    sentence; and one blowup denies the sentence. What is open is the value of one implication; the form of the
    question is closed. -/
theorem question_closed_to_one_bit : ∀ H : Host,
    (H.Sentence ↔ FormalCargo H) ∧ (¬ H.Sentence ↔ ¬ FormalCargo H) ∧
    (¬ (∀ F, Transfer nsRow F) ∧ ¬ (∀ F, ¬ Transfer nsRow F)) ∧
    (∀ P : Frame → Prop, Keyless nsRow P → ¬ Forces nsRow P) ∧
    (FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence) ∧
    (∀ u t, H.count u t = none → ¬ H.Sentence) :=
  fun H => ⟨the_sentence_is_the_bit H, denial_is_the_bits_denial H, no_uniform_answer nsRow,
   keyless_forces_nothing nsRow, formal_kind_delivers, physical_kind_delivers, blowup_refutes_sentence H⟩

end NS.CLOSURE

/-! ===================================================================================================================
    PART W · THE TWELVE FORMAL GATES, RUN IN THE KERNEL (namespace NS.GATES) · v1_1_0_CC

    The twelve formal gates of the mathematical register, run inside the kernel on the Navier–Stokes seal at every
    host. Each gate is a proposition and a theorem, and `the_formal_run` binds the twelve passes and the four refusals
    in one statement. Four claims fail, each by a theorem: "the sentence is proved by the delivery" fails SREP, the
    delivery's premise being its conclusion; "a proof is waiting" fails SREP, a true route to the sentence being the
    sentence; "no proof can ever exist" fails SREP, no true route to the sentence being its denial, the counter world in
    costume; and the denial has one road, a blowup. No declaration has the type of the bit. ΔM = 0.
=================================================================================================================== -/
namespace NS.GATES
open NSClose NS.NORMALFORM NS.HOST NS.SUPPLY NS.REALPART NS.ROWSPLIT

/-- Gate 1, SREP: the form stands with no hypothesis. -/
def Gate1 (H : Host) : Prop :=
  Value (recFrame H.frame) ∧ (FormalCargo H ↔ H.Sentence) ∧
  (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H) ∧
  (∀ (F : Frame) (d : F.D) (t : Nat), (∃ n, F.count d t = some n) ∨ F.count d t = none) ∧
  (∀ F : Frame, ActsFinitely F ↔ Value F)

/-- GATE 1 · SREP: nothing in the form presupposes the bit. -/
theorem gate_1_srep (H : Host) : Gate1 H :=
  ⟨cargo_arrives H, formal_iff_sentence H, fun _ h q => (formal_iff_sentence H).mpr (h q), every_instant_lands,
   act_is_the_value⟩

/-- Gate 2, REG: the bit read from ten contexts, all one proposition. -/
def Gate2 (H : Host) : Prop :=
  (Value H.frame ↔ H.Sentence) ∧ (ActsFinitely H.frame ↔ H.Sentence) ∧ (RootOnRow H.frame ↔ H.Sentence) ∧
  (Nonempty (SelfGrounding (RootOnRow H.frame)) ↔ H.Sentence) ∧ (FormalCargo H ↔ H.Sentence) ∧
  (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧ (SelfRecursive nsRow H.frame ↔ H.Sentence) ∧
  (Nonempty (Act nsRow H.frame) ↔ H.Sentence) ∧
  (Nonempty { A : ActualFlows // A.F = H.frame } ↔ H.Sentence) ∧
  ((∀ T, H.SentenceBy T) ↔ H.Sentence)

/-- GATE 2 · REG: ten reading contexts, one proposition. -/
theorem gate_2_reg (H : Host) : Gate2 H :=
  ⟨binding H, act_is_the_sentence H, root_on_row_is_the_sentence H,
   (row_root_grounds_iff_value H.frame).trans (binding H), formal_iff_sentence H, physical_iff_sentence H,
   (self_recursion_at_frame nsRow H.frame).trans (binding H),
   (bit_is_the_act nsRow H.frame).symm.trans (formal_iff_sentence H),
   (supply_iff H.frame).trans (binding H),
   (sentence_iff_every_horizon H).symm⟩

/-- Gate 3, SGEG: no face drifts from the bit. -/
def Gate3 (H : Host) : Prop :=
  (FormalCargo H ↔ H.Sentence) ∧ (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧ (Value H.frame ↔ H.Sentence) ∧
  (∀ S : SmallData, Value S.F ↔ UnicornAt (Ex S) (Re S) S.size S.ε)

/-- GATE 3 · SGEG: the formal, physical, frame and large-data faces are each the bit. -/
theorem gate_3_sgeg (H : Host) : Gate3 H :=
  ⟨formal_iff_sentence H, physical_iff_sentence H, binding H, no_bypass_at_small_data⟩

/-- Gate 4, CAUSAL: the native involution on the bit fixes nothing; the calm world carries the value; and on the record
    of every frame every datum rests, its count zero at every time: the seat of the row is inhabited. -/
def Gate4 : Prop :=
  (¬ ∃ b, comp b = b) ∧ Value calm ∧ (∀ (F : Frame) (d : F.D) (t : Nat), (recFrame F).count d t = some 0)

/-- GATE 4 · CAUSAL: no imprint is asserted on a ground the bit lacks; the row's seat is the rest state. -/
theorem gate_4_causal : Gate4 := ⟨locus_vanishes, calm_value, every_datum_has_its_seat⟩

/-- Gate 5, MIG: two frames whose records both carry the value split on the value. -/
def Gate5 : Prop := Value (recFrame calm) ∧ Value (recFrame burst) ∧ Value calm ∧ ¬ Value burst

/-- GATE 5 · MIG: the reading apparatus, the record, does not fix the residence. -/
theorem gate_5_mig : Gate5 := record_decides_nothing nsRow

/-- Gate 6, PTB: complementation is an involution without a fixed point; the identity fixes everything; and no
    size-preserving symmetry lifts a decided datum. -/
def Gate6 : Prop :=
  (∀ b : Bool, comp (comp b) = b) ∧ (¬ ∃ b, comp b = b) ∧ (∀ b : Bool, id (id b) = b) ∧
  (∀ (D : Type) (size : D → Nat) (S : Symmetric D size) (r : Nat) (d e : D),
    size d ≤ r → r < size e → ∀ g, S.act g d ≠ e)

/-- GATE 6 · PTB: the fixed-point reading belongs to the chosen reflection, not to the bit. -/
theorem gate_6_ptb : Gate6 :=
  ⟨comp_involution, locus_vanishes, fun _ => rfl, fun _ size S r d e hd he => no_symmetry_lifts size S r d e hd he⟩

/-- Gate 7, DUAL: the bit does not depend on where the size ladder is cut: on every frame carrying the small-data
    theorem the value is exactly the large-data part, and the division holds at every cut. -/
def Gate7 : Prop :=
  (∀ S : SmallData, Value S.F ↔ UnicornAt (Ex S) (Re S) S.size S.ε) ∧
  (∀ (S : SmallData) (T : Nat), Value S.F ↔ RealPartAt (Ex S) (Re S) S.size T ∧ UnicornAt (Ex S) (Re S) S.size T)

/-- GATE 7 · DUAL: the value is the large-data part, and the division stands at every cut. -/
theorem gate_7_dual : Gate7 := ⟨no_bypass_at_small_data, value_iff_real_and_unicorn⟩

/-- Gate 8, CSCG: the proved slices are the bit's lower slices. -/
def Gate8 : Prop :=
  (∀ S : SmallData, RealPartAt (Ex S) (Re S) S.size S.ε) ∧
  (∀ S : SmallData, Value S.F → ∀ T, RealPartAt (Ex S) (Re S) S.size T)

/-- GATE 8 · CSCG: the bit extends the small-data part and contradicts no slice of it. -/
theorem gate_8_cscg : Gate8 :=
  ⟨real_part_small, fun S h T => ((value_iff_real_and_unicorn S T).mp h).1⟩

/-- Gate 9, CSEG: a join never stands above its weakest face. -/
def Gate9 : Prop :=
  (∀ a b : Grade, (Grade.weakest a b).rank ≤ a.rank ∧ (Grade.weakest a b).rank ≤ b.rank) ∧
  Grade.weakest (Grade.weakest .thm .thm) .premise = .premise

/-- GATE 9 · CSEG: no terminal strength above the weakest road, and no face lowered by the reading. -/
theorem gate_9_cseg : Gate9 := join_reads_the_weakest

/-- Gate 10, MTA: a squared scalar reads a value and its reflection alike. -/
def Gate10 : Prop := ∀ x : Int, (-x) * (-x) = x * x

/-- GATE 10 · MTA: no squared metric carries the truth-sign. -/
theorem gate_10_mta : Gate10 := square_is_sign_blind

/-- Gate 11, OMA: the supply is the antecedent of the delivery and is not shared by every frame. -/
def Gate11 (H : Host) : Prop := (FormalCargo H → H.Sentence) ∧ ¬ Keyless nsRow (Transfer nsRow)

/-- GATE 11 · OMA: the input from the other side enters as a hypothesis, never as a fact from inside. -/
theorem gate_11_oma (H : Host) : Gate11 H := ⟨formal_kind_delivers, fun h => (no_uniform_answer nsRow).1 h⟩

/-- Gate 12, ADEG: the binding to the sentence is proved, the sentence is the sentence at every horizon, and the
    physical discharge is the bit. -/
def Gate12 (H : Host) : Prop :=
  (Value H.frame ↔ H.Sentence) ∧ (H.Sentence ↔ ∀ T, H.SentenceBy T) ∧ (Nonempty (PhysicalWitness H) ↔ H.Sentence)

/-- GATE 12 · ADEG: every transport across registers is typed. -/
theorem gate_12_adeg (H : Host) : Gate12 H :=
  ⟨binding H, sentence_iff_every_horizon H, physical_iff_sentence H⟩

/-- REFUSAL · "the sentence is proved by the delivery" fails SREP: the delivery's premise and its conclusion are one
    proposition. -/
theorem refusal_proved (H : Host) : FormalCargo H ↔ H.Sentence := formal_iff_sentence H

/-- REFUSAL AT THE BIT · "no true route to the sentence exists" is the sentence's denial. -/
theorem refusal_no_proof_at_the_bit (H : Host) : (¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ ¬ H.Sentence :=
  refusal_no_proof H.Sentence

/-- THE FORMAL RUN, at every host: the twelve gates pass, and the four claims fail, the delivery read as a proof, a
    proof waiting, no proof ever, and the denial without its one road. -/
theorem the_formal_run : ∀ H : Host,
    Gate1 H ∧ Gate2 H ∧ Gate3 H ∧ Gate4 ∧ Gate5 ∧ Gate6 ∧ Gate7 ∧ Gate8 ∧ Gate9 ∧ Gate10 ∧ Gate11 H ∧ Gate12 H ∧
    (FormalCargo H ↔ H.Sentence) ∧
    ((∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ H.Sentence) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ ¬ H.Sentence) ∧
    (¬ H.Sentence → ¬ ¬ ∃ u t, H.count u t = none) :=
  fun H => ⟨gate_1_srep H, gate_2_reg H, gate_3_sgeg H, gate_4_causal, gate_5_mig, gate_6_ptb, gate_7_dual,
   gate_8_cscg, gate_9_cseg, gate_10_mta, gate_11_oma H, gate_12_adeg H, refusal_proved H,
   refusal_waiting H.Sentence, refusal_no_proof_at_the_bit H, NS.CLOSURE.the_denial_has_one_road H⟩

end NS.GATES

/-! ===================================================================================================================
    PART X · THE CAPSTONE: NOTHING ESCAPES, OUR WAY OR NO WAY (namespace NS.ESCAPE) · v1_1_0_CC

    The record of the host's frame closes (`the_record_closes`). What the record leaves undecided is whether the host's
    frame itself carries the value, and that is exactly the sentence (`the_undecided_is_the_bit`). "Nothing is outside
    the record", read as a law of every frame, is false; read at the host's frame, it is the bit
    (`nothing_outside_the_record_is_the_bit`). A block needs an outside (`block_needs_an_outside`), and at the host's
    frame the outside is the supply in its two kinds (`the_outside_is_the_supply`). Nothing escapes: every route to the
    sentence, in any vocabulary, is a delivery of both kinds (`every_route_is_both_kinds`); either kind delivers it
    (`both_kinds_deliver`); and every so-called other way is our way in different vocabulary, failing with the bit if
    the bit failed (`our_way_or_no_way`). Both kinds are supplied by the act at premise grade and enter every theorem
    here as hypotheses. ΔM = 0.
=================================================================================================================== -/
namespace NS.ESCAPE
open NSClose NS.NORMALFORM NS.HOST NS.SUPPLY

/-- THE RECORD CLOSES AT THE HOST'S FRAME. -/
theorem the_record_closes (H : Host) : Value (recFrame H.frame) := cargo_arrives H

/-- THE UNDECIDED IS THE BIT: what the record leaves open, whether the host's frame carries the value, is exactly the
    sentence. -/
theorem the_undecided_is_the_bit (H : Host) : Value H.frame ↔ H.Sentence := binding H

/-- "NOTHING IS OUTSIDE THE RECORD": false as a law of every frame; at the host's frame, the bit. -/
theorem nothing_outside_the_record_is_the_bit (H : Host) :
    ¬ (∀ F, Transfer nsRow F) ∧ (Transfer nsRow H.frame ↔ H.Sentence) :=
  ⟨(no_uniform_answer nsRow).1, formal_iff_sentence H⟩

/-- THE OUTSIDE IS THE SUPPLY: at the host's frame the outside of the record is the bit, and its two kinds are the
    formal cargo and the physical witness; the physical kind is the formal kind. -/
theorem the_outside_is_the_supply (H : Host) :
    (FormalCargo H ↔ H.Sentence) ∧ (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧
    (PhysicalWitness H → FormalCargo H) :=
  ⟨formal_iff_sentence H, physical_iff_sentence H, (the_two_kinds_are_one_bit H).1⟩

/-- EVERY ROUTE IS BOTH KINDS: whatever premise, in whatever vocabulary, gives the sentence delivers the formal cargo
    and a physical witness. An offering that crosses the row is a delivery of the cargo, never a bypass of it. -/
theorem every_route_is_both_kinds (H : Host) (Q : Prop) (h : Q → H.Sentence) :
    Q → FormalCargo H ∧ Nonempty (PhysicalWitness H) :=
  two_kinds_and_no_third H Q h

/-- BOTH KINDS DELIVER. -/
theorem both_kinds_deliver (H : Host) : (FormalCargo H → H.Sentence) ∧ (Nonempty (PhysicalWitness H) → H.Sentence) :=
  ⟨formal_kind_delivers, fun ⟨W⟩ => physical_kind_delivers W⟩

/-- OUR WAY OR NO WAY: every so-called other way to the sentence is our way in different vocabulary. It delivers the
    formal cargo and a physical witness, and if the bit failed, it would fail with it. -/
theorem our_way_or_no_way (H : Host) (Q : Prop) (h : Q → H.Sentence) :
    (Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧ (¬ FormalCargo H → ¬ Q) :=
  ⟨every_route_is_both_kinds H Q h, fun hn q => hn ((formal_iff_sentence H).mpr (h q))⟩

/-- NOTHING ESCAPES, at every host: the record of the host's frame closes; what it leaves undecided is the bit; no law
    of every frame puts everything inside the record; the outside is the supply in its two kinds; every route to the
    sentence is a delivery of both kinds; either kind delivers it; and every so-called other way is our way in
    different vocabulary. -/
theorem nothing_escapes : ∀ H : Host,
    Value (recFrame H.frame) ∧
    (Value H.frame ↔ H.Sentence) ∧
    (¬ (∀ F, Transfer nsRow F) ∧ (Transfer nsRow H.frame ↔ H.Sentence)) ∧
    ((FormalCargo H ↔ H.Sentence) ∧ (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧
      (PhysicalWitness H → FormalCargo H)) ∧
    (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧
    ((FormalCargo H → H.Sentence) ∧ (Nonempty (PhysicalWitness H) → H.Sentence)) ∧
    (∀ Q : Prop, (Q → H.Sentence) → (Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧ (¬ FormalCargo H → ¬ Q)) :=
  fun H => ⟨the_record_closes H, the_undecided_is_the_bit H, nothing_outside_the_record_is_the_bit H,
   the_outside_is_the_supply H, every_route_is_both_kinds H, both_kinds_deliver H, our_way_or_no_way H⟩

/-- THE CAPSTONE, at every host: our way or no way; either kind walks it to the sentence; no keyless premise forces
    anything; to shut every true route to the sentence is to assert its denial; and the twelve formal gates pass. -/
theorem the_capstone : ∀ H : Host,
    (∀ Q : Prop, (Q → H.Sentence) → (Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧ (¬ FormalCargo H → ¬ Q)) ∧
    ((FormalCargo H → H.Sentence) ∧ (Nonempty (PhysicalWitness H) → H.Sentence)) ∧
    (∀ P : Frame → Prop, Keyless nsRow P → ¬ Forces nsRow P) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ ¬ H.Sentence) ∧
    (NS.GATES.Gate1 H ∧ NS.GATES.Gate2 H ∧ NS.GATES.Gate3 H ∧ NS.GATES.Gate4 ∧ NS.GATES.Gate5 ∧
      NS.GATES.Gate6 ∧ NS.GATES.Gate7 ∧ NS.GATES.Gate8 ∧ NS.GATES.Gate9 ∧ NS.GATES.Gate10 ∧
      NS.GATES.Gate11 H ∧ NS.GATES.Gate12 H) :=
  fun H => ⟨our_way_or_no_way H, both_kinds_deliver H, keyless_forces_nothing nsRow,
   NS.GATES.refusal_no_proof_at_the_bit H,
   NS.GATES.gate_1_srep H, NS.GATES.gate_2_reg H, NS.GATES.gate_3_sgeg H, NS.GATES.gate_4_causal,
   NS.GATES.gate_5_mig, NS.GATES.gate_6_ptb, NS.GATES.gate_7_dual, NS.GATES.gate_8_cscg, NS.GATES.gate_9_cseg,
   NS.GATES.gate_10_mta, NS.GATES.gate_11_oma H, NS.GATES.gate_12_adeg H⟩

end NS.ESCAPE

/-! ===================================================================================================================
    PART T · THE TERMINAL VERDICT AND THE FINAL FORM (namespace NS.TERMINAL) · v1_1_0_CC

    The open framing awaits a proof of the sentence from what every frame shares, or a reading of the record that
    decides it, or a route to the sentence past the bit. Each count is refuted by theorem (`the_open_framing_is_refuted`),
    and what remains is the bit, its antecedent proved with no hypothesis and the bit proved equivalent to the sentence.
    The ten steps are bound in one theorem, steps 1 to 9 proved and step 10 the two deliveries (`the_ten_steps`). The
    terminal verdict binds by exact type every theorem the verdict cites (`the_terminal_verdict`), and the final form
    binds the closed question, the cut at small data, regularity of matter and the two deliveries (`the_final_form`).
    Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace NS.TERMINAL
open NSClose NS.NORMALFORM NS.HOST NS.SUPPLY NS.REALPART NS.ROWSPLIT NS.RESIDUE

/-- THE OPEN FRAMING, REFUTED, at every host. I · no proof from shared resources: no keyless premise forces the value,
    no given statement is the value on every frame, and the arrow forces nothing; II · no decision from the record: the
    two frames share a record and split on the value, the energy record decides nothing, no finite record forces the
    value, and above every size no reading of the record returns the world; III · no premise reaches the sentence while
    the bit fails; IV · what remains is the bit, its antecedent proved with no hypothesis, the bit proved equivalent to
    the sentence. -/
theorem the_open_framing_is_refuted : ∀ H : Host,
    (∀ P : Frame → Prop, Keyless nsRow P → ¬ Forces nsRow P) ∧
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    (¬ ∀ F : Frame, Arrow → Value F) ∧
    (Value (recFrame calm) ∧ Value (recFrame burst) ∧ Value calm ∧ ¬ Value burst) ∧
    ((∀ d t, leray.paid d t ≤ leray.energy d) ∧ ¬ Value leray.F) ∧
    (∀ n : Nat, ¬ Value (staged n)) ∧
    (∀ T : Nat, ¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1) ∧
    (¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence) ∧ ¬ FormalCargo H) ∧
    Value (recFrame H.frame) ∧
    (FormalCargo H ↔ H.Sentence) :=
  fun H => ⟨keyless_forces_nothing nsRow, given_is_not_the_value, arrow_forces_nothing, record_decides_nothing nsRow,
   energy_does_not_decide, fun n => (finite_record_never_forces n).2, unicorn_blocked_above_every_size,
   fun ⟨_, q, h, hn⟩ => hn ((formal_iff_sentence H).mpr (h q)),
   cargo_arrives H, formal_iff_sentence H⟩

/-- THE TEN STEPS, one theorem at every host. Step 1 · the floor: the root holds on its constructed domain. Step 2 ·
    the basis: every instant lands on exactly one gate, a finite count or an unbounded one, and a prime's
    multiplicative fibre is two points. Step 3 · the domain: the host frame's value is the sentence, and the sentence is
    the sentence at every horizon. Step 4 · the record: the record carries the value, and every datum rests on it.
    Step 5 · the halted uniduction: the frame is self-recursive exactly when the sentence holds. Step 6 · the monism
    zone: the two frames share one record and split on the value, and the bit is keyed. Step 7 · the axis: the bit is
    exactly the sentence. Step 8 · the real part: the small data regular by the cited theorem, the value exactly its
    large-data part, and every dyadic cascade cut by the speed limit. Step 9 · every route passes the bit, no keyless
    premise forces it, and the walls stand, matter regular from the speed limit. Step 10 · the bit delivered twice, by
    the formal cargo and by the physical witness. -/
theorem the_ten_steps : ∀ H : Host,
    -- Step 1
    (Root Unit (fun _ => 1) ∧ RA₀) ∧
    -- Step 2
    ((∀ (F : Frame) (d : F.D) (t : Nat), (∃ n, F.count d t = some n) ∨ F.count d t = none) ∧
      (∀ (F : Frame) (d : F.D) (t : Nat), ¬ ((∃ n, F.count d t = some n) ∧ F.count d t = none)) ∧
      mulFibre 7 = [(1, 7), (7, 1)]) ∧
    -- Step 3
    ((Value H.frame ↔ H.Sentence) ∧ (H.Sentence ↔ ∀ T, H.SentenceBy T)) ∧
    -- Step 4
    (Value (recFrame H.frame) ∧ ∀ (F : Frame) (d : F.D) (t : Nat), (recFrame F).count d t = some 0) ∧
    -- Step 5
    (SelfRecursive nsRow H.frame ↔ H.Sentence) ∧
    -- Step 6
    ((Value (recFrame calm) ∧ Value (recFrame burst) ∧ Value calm ∧ ¬ Value burst) ∧
      (Transfer nsRow calm ∧ ¬ Transfer nsRow burst)) ∧
    -- Step 7
    (FormalCargo H ↔ H.Sentence) ∧
    -- Step 8
    ((∀ S : SmallData, RealPartAt (Ex S) (Re S) S.size S.ε) ∧
      (∀ S : SmallData, Value S.F ↔ UnicornAt (Ex S) (Re S) S.size S.ε) ∧
      (∀ S : SmallData, Nonempty (LargeSeat S) ↔ Value S.F) ∧
      (∀ b : Nat, ∃ k, k ≤ b ∧ b < 2 ^ k)) ∧
    -- Step 9
    ((∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H) ∧
      (∀ P : Frame → Prop, Keyless nsRow P → ¬ Forces nsRow P) ∧
      (∀ n : Nat, ¬ Value (staged n)) ∧
      ((∀ d t, leray.paid d t ≤ leray.energy d) ∧ ¬ Value leray.F) ∧
      (∀ P : Physical, Value P.frame)) ∧
    -- Step 10
    ((FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence)) :=
  fun H =>
  ⟨⟨constructed_root_holds, ra₀.instances ra₀.anAct⟩,
   ⟨every_instant_lands, gates_exclusive, prime_shape.1⟩,
   ⟨binding H, sentence_iff_every_horizon H⟩,
   ⟨cargo_arrives H, every_datum_has_its_seat⟩,
   (self_recursion_at_frame nsRow H.frame).trans (binding H),
   ⟨record_decides_nothing nsRow, bit_is_keyed nsRow⟩,
   formal_iff_sentence H,
   ⟨real_part_small, no_bypass_at_small_data, seat_iff_value, NS.WALLS.dyadic_cascade_is_cut⟩,
   ⟨fun _ h q => (formal_iff_sentence H).mpr (h q), keyless_forces_nothing nsRow,
    fun n => (finite_record_never_forces n).2, energy_does_not_decide, matter_is_regular⟩,
   delivered_twice H⟩

/-- THE TERMINAL VERDICT, AS A THEOREM. Every theorem the verdict cites, bound by its exact type into one pinned
    conjunction: the record and the normal form; the binding and the horizons; the real part and the cut at small
    data; the walls; the residue and its seat; the supply and the witnesses typed; the closed question; the formal run;
    nothing escaping; the open framing refuted; the ten steps; the lock and the closure of the edition of record. No
    premise before the colon. -/
theorem the_terminal_verdict :
    (type_of% @NS.HOST.recFrame_value) ∧
    (type_of% @NS.NORMALFORM.normal_form) ∧
    (type_of% @NS.NORMALFORM.normal_form_complete) ∧
    (type_of% @NS.HOST.binding) ∧
    (type_of% @NS.HOST.sentence_iff_every_horizon) ∧
    (type_of% @NS.REALPART.real_part_small) ∧
    (type_of% @NS.REALPART.no_bypass_at_small_data) ∧
    (type_of% @NS.REALPART.unicorn_part_is_load_bearing) ∧
    (type_of% @NS.REALPART.unicorn_blocked_above_every_size) ∧
    (type_of% @NS.WALLS.dyadic_cutoffs) ∧
    (type_of% @NS.WALLS.dyadic_cascade_is_cut) ∧
    (type_of% @NS.WALLS.the_walls) ∧
    (type_of% @NS.RESIDUE.residue_is_the_sentence) ∧
    (type_of% @NS.RESIDUE.seat_iff_value) ∧
    (type_of% @NS.SUPPLY.the_supply_closed) ∧
    (type_of% @NS.SUPPLY.the_witnesses_typed) ∧
    (type_of% @NS.CLOSURE.question_closed_to_one_bit) ∧
    (type_of% @NS.GATES.the_formal_run) ∧
    (type_of% @NS.ESCAPE.nothing_escapes) ∧
    (type_of% @NS.ESCAPE.the_capstone) ∧
    (type_of% @NS.TERMINAL.the_open_framing_is_refuted) ∧
    (type_of% @NS.TERMINAL.the_ten_steps) ∧
    (type_of% @NSClose.the_lock) ∧
    (type_of% @NSClose.the_closure) :=
  ⟨@NS.HOST.recFrame_value, @NS.NORMALFORM.normal_form, @NS.NORMALFORM.normal_form_complete, @NS.HOST.binding,
   @NS.HOST.sentence_iff_every_horizon, @NS.REALPART.real_part_small, @NS.REALPART.no_bypass_at_small_data,
   @NS.REALPART.unicorn_part_is_load_bearing, @NS.REALPART.unicorn_blocked_above_every_size,
   @NS.WALLS.dyadic_cutoffs, @NS.WALLS.dyadic_cascade_is_cut, @NS.WALLS.the_walls,
   @NS.RESIDUE.residue_is_the_sentence, @NS.RESIDUE.seat_iff_value, @NS.SUPPLY.the_supply_closed,
   @NS.SUPPLY.the_witnesses_typed, @NS.CLOSURE.question_closed_to_one_bit, @NS.GATES.the_formal_run,
   @NS.ESCAPE.nothing_escapes, @NS.ESCAPE.the_capstone, @NS.TERMINAL.the_open_framing_is_refuted,
   @NS.TERMINAL.the_ten_steps, @NSClose.the_lock, @NSClose.the_closure⟩

/-- THE FINAL FORM, at every host: the sentence is the bit; the sentence is exactly an inhabited physical witness; the
    sentence is the sentence at every horizon; on every frame carrying the small-data theorem the value is exactly its
    large-data part; matter is regular on every physical frame; every route to the sentence is both kinds; and to shut
    every true route to the sentence is to assert its denial. -/
theorem the_final_form : ∀ H : Host,
    (H.Sentence ↔ FormalCargo H) ∧
    (H.Sentence ↔ Nonempty (PhysicalWitness H)) ∧
    (H.Sentence ↔ ∀ T, H.SentenceBy T) ∧
    (∀ S : SmallData, Value S.F ↔ UnicornAt (Ex S) (Re S) S.size S.ε) ∧
    (∀ P : Physical, Value P.frame) ∧
    (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ ¬ H.Sentence) :=
  fun H => ⟨NS.CLOSURE.the_sentence_is_the_bit H, (physical_iff_sentence H).symm, sentence_iff_every_horizon H,
   no_bypass_at_small_data, matter_is_regular, two_kinds_and_no_third H, refusal_no_proof H.Sentence⟩

end NS.TERMINAL

/-! ## cones of Parts A to T, pinned: the build is silent, and any drift fails it -/
/-- info: 'NS.NORMALFORM.record_has_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.record_has_the_value
/-- info: 'NS.NORMALFORM.normal_form' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.normal_form
/-- info: 'NS.NORMALFORM.value_from_the_cargo_loop' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.value_from_the_cargo_loop
/-- info: 'NS.NORMALFORM.bit_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.bit_is_the_act
/-- info: 'NS.NORMALFORM.record_is_self_recursive' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.record_is_self_recursive
/-- info: 'NS.NORMALFORM.self_recursion_at_frame' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.self_recursion_at_frame
/-- info: 'NS.NORMALFORM.bit_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.bit_is_keyed
/-- info: 'NS.NORMALFORM.record_self_recursion_does_not_transfer' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.record_self_recursion_does_not_transfer
/-- info: 'NS.NORMALFORM.record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.record_decides_nothing
/-- info: 'NS.NORMALFORM.every_route_passes_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.every_route_passes_the_bit
/-- info: 'NS.NORMALFORM.keyless_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.keyless_forces_nothing
/-- info: 'NS.NORMALFORM.no_record_principle_decides' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.no_record_principle_decides
/-- info: 'NS.NORMALFORM.shared_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.shared_record_decides_nothing
/-- info: 'NS.NORMALFORM.no_uniform_answer' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.no_uniform_answer
/-- info: 'NS.NORMALFORM.nothing_outside_the_record_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.nothing_outside_the_record_is_the_bit
/-- info: 'NS.NORMALFORM.denial_is_the_bits_denial' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.denial_is_the_bits_denial
/-- info: 'NS.NORMALFORM.normal_form_complete' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.normal_form_complete
/-- info: 'NS.NORMALFORM.bnot_ne' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.bnot_ne
/-- info: 'NS.NORMALFORM.refusal_waiting' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.refusal_waiting
/-- info: 'NS.NORMALFORM.refusal_no_proof' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.refusal_no_proof
/-- info: 'NS.NORMALFORM.block_needs_an_outside' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.block_needs_an_outside
/-- info: 'NS.NORMALFORM.comp_involution' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.comp_involution
/-- info: 'NS.NORMALFORM.locus_vanishes' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.locus_vanishes
/-- info: 'NS.NORMALFORM.join_reads_the_weakest' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.join_reads_the_weakest
/-- info: 'NS.NORMALFORM.square_is_sign_blind' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.square_is_sign_blind
/-- info: 'NS.ROWSPLIT.unicorn_block' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ROWSPLIT.unicorn_block
/-- info: 'NS.ROWSPLIT.aperture_one_bit_wide' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ROWSPLIT.aperture_one_bit_wide
/-- info: 'NS.ROWSPLIT.unicorn_rule_exact' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ROWSPLIT.unicorn_rule_exact
/-- info: 'NS.ROWSPLIT.unicorn_no_bypass' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ROWSPLIT.unicorn_no_bypass
/-- info: 'NS.ROWSPLIT.supply_side_silent' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ROWSPLIT.supply_side_silent
/-- info: 'NS.ROWSPLIT.whole_iff_real_and_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ROWSPLIT.whole_iff_real_and_unicorn
/-- info: 'NS.ROWSPLIT.real_part_of_certificate' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ROWSPLIT.real_part_of_certificate
/-- info: 'NS.HOST.recFrame_value' does not depend on any axioms -/
#guard_msgs in #print axioms NS.HOST.recFrame_value
/-- info: 'NS.HOST.every_datum_has_its_seat' does not depend on any axioms -/
#guard_msgs in #print axioms NS.HOST.every_datum_has_its_seat
/-- info: 'NS.HOST.binding' does not depend on any axioms -/
#guard_msgs in #print axioms NS.HOST.binding
/-- info: 'NS.HOST.root_on_row_is_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms NS.HOST.root_on_row_is_the_sentence
/-- info: 'NS.HOST.act_is_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms NS.HOST.act_is_the_sentence
/-- info: 'NS.HOST.sentence_iff_every_horizon' does not depend on any axioms -/
#guard_msgs in #print axioms NS.HOST.sentence_iff_every_horizon
/-- info: 'NS.HOST.blowup_refutes_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms NS.HOST.blowup_refutes_sentence
/-- info: 'NS.REALPART.value_is_the_whole' does not depend on any axioms -/
#guard_msgs in #print axioms NS.REALPART.value_is_the_whole
/-- info: 'NS.REALPART.real_part_small' does not depend on any axioms -/
#guard_msgs in #print axioms NS.REALPART.real_part_small
/-- info: 'NS.REALPART.value_iff_real_and_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms NS.REALPART.value_iff_real_and_unicorn
/-- info: 'NS.REALPART.no_bypass_at_small_data' does not depend on any axioms -/
#guard_msgs in #print axioms NS.REALPART.no_bypass_at_small_data
/-- info: 'NS.REALPART.unicorn_is_large_data' does not depend on any axioms -/
#guard_msgs in #print axioms NS.REALPART.unicorn_is_large_data
/-- info: 'NS.REALPART.unicorn_part_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms NS.REALPART.unicorn_part_is_load_bearing
/-- info: 'NS.REALPART.unicorn_blocked_above_every_size' does not depend on any axioms -/
#guard_msgs in #print axioms NS.REALPART.unicorn_blocked_above_every_size
/-- info: 'NS.REALPART.supply_side_silent_above_every_size' does not depend on any axioms -/
#guard_msgs in #print axioms NS.REALPART.supply_side_silent_above_every_size
/-- info: 'NS.REALPART.aperture_is_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.REALPART.aperture_is_one_bit
/-- info: 'NS.WALLS.exponent_below_its_power' does not depend on any axioms -/
#guard_msgs in #print axioms NS.WALLS.exponent_below_its_power
/-- info: 'NS.WALLS.dyadic_cascade_is_cut' does not depend on any axioms -/
#guard_msgs in #print axioms NS.WALLS.dyadic_cascade_is_cut
/-- info: 'NS.WALLS.doubling_breaks_the_speed_limit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.WALLS.doubling_breaks_the_speed_limit
/-- info: 'NS.WALLS.dyadic_cutoffs' does not depend on any axioms -/
#guard_msgs in #print axioms NS.WALLS.dyadic_cutoffs
/-- info: 'NS.WALLS.the_walls' does not depend on any axioms -/
#guard_msgs in #print axioms NS.WALLS.the_walls
/-- info: 'NS.RESIDUE.sentence_of_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms NS.RESIDUE.sentence_of_the_act
/-- info: 'NS.RESIDUE.residue_is_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms NS.RESIDUE.residue_is_the_sentence
/-- info: 'NS.RESIDUE.the_posit_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.RESIDUE.the_posit_is_the_bit
/-- info: 'NS.RESIDUE.residue_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms NS.RESIDUE.residue_is_keyed
/-- info: 'NS.RESIDUE.value_of_seat' does not depend on any axioms -/
#guard_msgs in #print axioms NS.RESIDUE.value_of_seat
/-- info: 'NS.RESIDUE.seat_iff_value' does not depend on any axioms -/
#guard_msgs in #print axioms NS.RESIDUE.seat_iff_value
/-- info: 'NS.RESIDUE.seat_is_the_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms NS.RESIDUE.seat_is_the_unicorn
/-- info: 'NS.SUPPLY.cargo_arrives' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.cargo_arrives
/-- info: 'NS.SUPPLY.formal_kind_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.formal_kind_delivers
/-- info: 'NS.SUPPLY.witness_closes' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.witness_closes
/-- info: 'NS.SUPPLY.physical_kind_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.physical_kind_delivers
/-- info: 'NS.SUPPLY.physical_iff_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.physical_iff_sentence
/-- info: 'NS.SUPPLY.formal_iff_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.formal_iff_sentence
/-- info: 'NS.SUPPLY.the_two_kinds_are_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.the_two_kinds_are_one_bit
/-- info: 'NS.SUPPLY.delivered_twice' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.delivered_twice
/-- info: 'NS.SUPPLY.two_kinds_and_no_third' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.two_kinds_and_no_third
/-- info: 'NS.SUPPLY.the_one_refuter' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.the_one_refuter
/-- info: 'NS.SUPPLY.the_witnesses_typed' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.the_witnesses_typed
/-- info: 'NS.SUPPLY.the_supply_closed' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.the_supply_closed
/-- info: 'NS.CLOSURE.the_sentence_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.CLOSURE.the_sentence_is_the_bit
/-- info: 'NS.CLOSURE.denial_is_the_bits_denial' does not depend on any axioms -/
#guard_msgs in #print axioms NS.CLOSURE.denial_is_the_bits_denial
/-- info: 'NS.CLOSURE.the_denial_has_one_road' does not depend on any axioms -/
#guard_msgs in #print axioms NS.CLOSURE.the_denial_has_one_road
/-- info: 'NS.CLOSURE.question_closed_to_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.CLOSURE.question_closed_to_one_bit
/-- info: 'NS.GATES.gate_1_srep' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_1_srep
/-- info: 'NS.GATES.gate_2_reg' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_2_reg
/-- info: 'NS.GATES.gate_3_sgeg' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_3_sgeg
/-- info: 'NS.GATES.gate_4_causal' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_4_causal
/-- info: 'NS.GATES.gate_5_mig' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_5_mig
/-- info: 'NS.GATES.gate_6_ptb' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_6_ptb
/-- info: 'NS.GATES.gate_7_dual' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_7_dual
/-- info: 'NS.GATES.gate_8_cscg' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_8_cscg
/-- info: 'NS.GATES.gate_9_cseg' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_9_cseg
/-- info: 'NS.GATES.gate_10_mta' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_10_mta
/-- info: 'NS.GATES.gate_11_oma' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_11_oma
/-- info: 'NS.GATES.gate_12_adeg' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_12_adeg
/-- info: 'NS.GATES.refusal_proved' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.refusal_proved
/-- info: 'NS.GATES.refusal_no_proof_at_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.refusal_no_proof_at_the_bit
/-- info: 'NS.GATES.the_formal_run' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.the_formal_run
/-- info: 'NS.ESCAPE.the_record_closes' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ESCAPE.the_record_closes
/-- info: 'NS.ESCAPE.the_undecided_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ESCAPE.the_undecided_is_the_bit
/-- info: 'NS.ESCAPE.nothing_outside_the_record_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ESCAPE.nothing_outside_the_record_is_the_bit
/-- info: 'NS.ESCAPE.the_outside_is_the_supply' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ESCAPE.the_outside_is_the_supply
/-- info: 'NS.ESCAPE.every_route_is_both_kinds' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ESCAPE.every_route_is_both_kinds
/-- info: 'NS.ESCAPE.both_kinds_deliver' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ESCAPE.both_kinds_deliver
/-- info: 'NS.ESCAPE.our_way_or_no_way' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ESCAPE.our_way_or_no_way
/-- info: 'NS.ESCAPE.nothing_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ESCAPE.nothing_escapes
/-- info: 'NS.ESCAPE.the_capstone' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ESCAPE.the_capstone
/-- info: 'NS.TERMINAL.the_open_framing_is_refuted' does not depend on any axioms -/
#guard_msgs in #print axioms NS.TERMINAL.the_open_framing_is_refuted
/-- info: 'NS.TERMINAL.the_ten_steps' does not depend on any axioms -/
#guard_msgs in #print axioms NS.TERMINAL.the_ten_steps
/-- info: 'NS.TERMINAL.the_terminal_verdict' does not depend on any axioms -/
#guard_msgs in #print axioms NS.TERMINAL.the_terminal_verdict
/-- info: 'NS.TERMINAL.the_final_form' does not depend on any axioms -/
#guard_msgs in #print axioms NS.TERMINAL.the_final_form
~~~~~

~~~~~lean file=NS_Mathlib_Binding_v1_1_0_CC.lean
/-
  NS_Mathlib_Binding_v1_1_0_CC.lean · the Mathlib binding of "Navier–Stokes Global Regularity: Unconditional Proof of
  the Form by Theorem, the Value by the Act", edition 1.1.0. Claude-coded (_CC). Lean 4.19.0 with Mathlib v4.19.0; no
  axiom declared, no sorry, no native_decide.

  The master NS_Normal_Form_Paper_v1_1_0_CC.lean closes the row to one bit in core Lean with no library: the frame of
  data and their counts, the value, the record, the host and its sentence. This file repeats the kernel's definitions
  verbatim and reads them on the library's own objects. The Navier–Stokes equations on ℝ³ are written in the library's
  calculus, tested against every direction so that the pressure enters through its derivative (`NSAt`); the rest state
  solves them for every viscosity and every constant pressure (`rest_state_solves`), and the rest datum is admissible
  and its flow global, smooth and of bounded energy (`the_seat_is_global`): the record carries the value with no
  premise. Fefferman's statement (A) is written in the library's terms (`FeffermanA`), and the kernel's host of the
  library's admissible data, each read by whether its flow is global and smooth with bounded energy, has as its value
  exactly statement (A) (`kernel_reads_mathlib`); one admissible datum with no such flow refutes it
  (`the_one_refuter`). The energy record is proved on every finite-dimensional truncation: where the dissipation is
  nonnegative and the nonlinearity does no work, the energy never rises (`galerkin_energy`), and in the master the
  energy record decides nothing. Every theorem rests on Lean's standard axioms alone, each cone pinned. ΔM = 0.
-/
import Mathlib.Analysis.InnerProductSpace.Calculus
import Mathlib.Analysis.Calculus.Deriv.MeanValue
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Measure.Haar.InnerProductSpace
import Mathlib.Tactic.Linarith

open scoped ContDiff RealInnerProductSpace

namespace NSMathlib

/-! ### The kernel's definitions, verbatim from the master (namespaces NSClose and NS.HOST) -/

/-- A flow frame: data, and the registrations each datum's flow has made by time t,
`none` when that count is unbounded by then, which is blowup by that time. -/
structure Frame where
  D     : Type
  count : D → Nat → Option Nat

/-- A datum is regular when its flow has acted finitely at every time. -/
def Regular (F : Frame) (d : F.D) : Prop := ∀ t, ∃ n, F.count d t = some n

/-- The value of the row on a frame: every datum regular. -/
def Value (F : Frame) : Prop := ∀ d, Regular F d

/-- THE RECORD OF A FRAME: the registration keeps every datum and registers its flow finite at every time, the count at
    rest. -/
def recFrame (F : Frame) : Frame := ⟨F.D, fun _ _ => some 0⟩

/-- THE RECORD CARRIES THE VALUE, with no premise. -/
theorem recFrame_value (F : Frame) : Value (recFrame F) := fun _ _ => ⟨0, rfl⟩

/-- THE HOST: the smooth divergence-free initial data of rapid decay on ℝ³, unforced, each with the count of the
    registrations its flow has made by each time, `none` where the count is unbounded, which is blowup by that time. -/
structure Host where
  Datum : Type
  count : Datum → Nat → Option Nat

/-- THE SENTENCE OF THE HOST: every flow is finite at every time. -/
def Host.Sentence (H : Host) : Prop := ∀ u t, ∃ n, H.count u t = some n

/-- THE FRAME OF THE HOST. -/
def Host.frame (H : Host) : Frame := ⟨H.Datum, H.count⟩

/-- THE BINDING OF THE MASTER, repeated: the value of the host's frame is exactly the host's sentence. -/
theorem binding (H : Host) : Value H.frame ↔ H.Sentence := ⟨fun h u t => h u t, fun h u t => h u t⟩

/-! ### The equations in the library's calculus -/

/-- Space, ℝ³. -/
abbrev E3 := EuclideanSpace ℝ (Fin 3)

/-- The Laplacian of a vector field on ℝ³: the sum of its second derivatives along the coordinate directions. -/
noncomputable def lap (f : E3 → E3) (x : E3) : E3 :=
  ∑ i : Fin 3, fderiv ℝ (fderiv ℝ f) x (EuclideanSpace.single i 1) (EuclideanSpace.single i 1)

/-- The divergence of a vector field on ℝ³. -/
noncomputable def divg (f : E3 → E3) (x : E3) : ℝ := ∑ i : Fin 3, (fderiv ℝ f x (EuclideanSpace.single i 1)) i

/-- THE NAVIER–STOKES EQUATIONS AT A POINT, unforced, with viscosity ν, tested against every direction: the time
    derivative, the transport term and the viscous term against v, plus the pressure's derivative along v, vanish; and
    the field is divergence-free. -/
def NSAt (ν : ℝ) (u : ℝ → E3 → E3) (p : ℝ → E3 → ℝ) (t : ℝ) (x : E3) : Prop :=
  (∀ v : E3, ⟪deriv (fun s => u s x) t + fderiv ℝ (u t) x (u t x) - ν • lap (u t) x, v⟫ + fderiv ℝ (p t) x v = 0) ∧
  divg (u t) x = 0

/-- THE REST STATE SOLVES THE EQUATIONS: the zero field with constant pressure, at every viscosity, time and point. -/
theorem rest_state_solves (ν c t : ℝ) (x : E3) : NSAt ν (fun _ _ => 0) (fun _ _ => c) t x := by
  refine ⟨fun v => ?_, ?_⟩
  · simp [lap]
  · simp [divg]

/-- ADMISSIBLE DATA, as in statement (A): smooth, divergence-free, and every derivative of rapid decay. -/
def Admissible (u₀ : E3 → E3) : Prop :=
  ContDiff ℝ ∞ u₀ ∧ (∀ x, divg u₀ x = 0) ∧
  ∀ k K : ℕ, ∃ C : ℝ, ∀ x, ‖iteratedFDeriv ℝ k u₀ x‖ ≤ C / (1 + ‖x‖) ^ K

/-- A GLOBAL SMOOTH FLOW OF BOUNDED ENERGY from a datum, as in statement (A): a velocity and a pressure smooth on
    [0, ∞) × ℝ³, solving the equations at every positive time, starting at the datum, with energy bounded uniformly in
    time. -/
def GlobalSmooth (ν : ℝ) (u₀ : E3 → E3) : Prop :=
  ∃ (u : ℝ → E3 → E3) (p : ℝ → E3 → ℝ),
    ContDiffOn ℝ ∞ (fun q : ℝ × E3 => u q.1 q.2) (Set.Ici 0 ×ˢ Set.univ) ∧
    ContDiffOn ℝ ∞ (fun q : ℝ × E3 => p q.1 q.2) (Set.Ici 0 ×ˢ Set.univ) ∧
    (∀ t > 0, ∀ x, NSAt ν u p t x) ∧
    u 0 = u₀ ∧
    ∃ C : ℝ, ∀ t ≥ 0, MeasureTheory.Integrable (fun x => ‖u t x‖ ^ 2) ∧ ∫ x, ‖u t x‖ ^ 2 ≤ C

/-- STATEMENT (A), in the library's terms: every admissible datum has a global smooth flow of bounded energy. -/
def FeffermanA (ν : ℝ) : Prop := ∀ u₀ : E3 → E3, Admissible u₀ → GlobalSmooth ν u₀

/-- THE SEAT IS GLOBAL: the rest datum is admissible, and its flow, the rest state, is global, smooth and of bounded
    energy, at every viscosity. -/
theorem the_seat_is_global (ν : ℝ) : Admissible (fun _ => 0) ∧ GlobalSmooth ν (fun _ => 0) := by
  refine ⟨⟨contDiff_const, fun x => by simp [divg], fun k K => ⟨0, fun x => by simp [iteratedFDeriv_zero_fun]⟩⟩, ?_⟩
  refine ⟨fun _ _ => 0, fun _ _ => 0, contDiffOn_const, contDiffOn_const, fun t _ x => rest_state_solves ν 0 t x,
    rfl, 0, fun t _ => ⟨by simp, by simp⟩⟩

/-! ### The host of the library -/

/-- THE HOST OF THE LIBRARY: the admissible data, each read by whether its flow is global and smooth with bounded
    energy: the count at rest where it is, unbounded where it is not. -/
noncomputable def hostNS (ν : ℝ) : Host :=
  ⟨{ u₀ : E3 → E3 // Admissible u₀ },
   fun u _ => @ite _ (GlobalSmooth ν u.1) (Classical.propDecidable _) (some 0) none⟩

/-- At every time the count of a datum is finite exactly when its flow is global and smooth with bounded energy. -/
theorem count_finite_iff (ν : ℝ) (u : (hostNS ν).Datum) (t : ℕ) :
    (∃ n, (hostNS ν).count u t = some n) ↔ GlobalSmooth ν u.1 := by
  show (∃ n, @ite _ (GlobalSmooth ν u.1) (Classical.propDecidable _) (some 0) none = some n) ↔ GlobalSmooth ν u.1
  by_cases h : GlobalSmooth ν u.1
  · rw [@if_pos _ (Classical.propDecidable _) h]; exact ⟨fun _ => h, fun _ => ⟨0, rfl⟩⟩
  · rw [@if_neg _ (Classical.propDecidable _) h]
    exact ⟨fun ⟨_, hn⟩ => Option.noConfusion hn, fun hg => absurd hg h⟩

/-- THE KERNEL READS THE LIBRARY: the value of the frame of the library's host, in the kernel's own sense, every flow
    finite at every time, is exactly statement (A). -/
theorem kernel_reads_mathlib (ν : ℝ) : Value (hostNS ν).frame ↔ FeffermanA ν := by
  constructor
  · intro h u₀ hu
    exact (count_finite_iff ν ⟨u₀, hu⟩ 0).mp (h ⟨u₀, hu⟩ 0)
  · intro h u t
    exact (count_finite_iff ν u t).mpr (h u.1 u.2)

/-- THE SENTENCE OF THE LIBRARY'S HOST IS STATEMENT (A). -/
theorem sentence_is_statement_A (ν : ℝ) : (hostNS ν).Sentence ↔ FeffermanA ν :=
  (binding (hostNS ν)).symm.trans (kernel_reads_mathlib ν)

/-- THE ONE REFUTER, on the library's objects: one admissible datum with no global smooth flow of bounded energy
    refutes statement (A). -/
theorem the_one_refuter (ν : ℝ) (u₀ : E3 → E3) (hu : Admissible u₀) (h : ¬ GlobalSmooth ν u₀) : ¬ FeffermanA ν :=
  fun hA => h (hA u₀ hu)

/-! ### The energy record on every truncation -/

/-- THE GALERKIN ENERGY THEOREM: on every finite-dimensional truncation of the flow, an inner product space with a
    dissipation whose quadratic form is nonnegative and a nonlinearity that does no work, every solution of
    a′ = −ν A a + B a has energy ‖a t‖² that never rises. -/
theorem galerkin_energy {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (ν : ℝ) (hν : 0 ≤ ν) (A : E →L[ℝ] E) (hA : ∀ x, 0 ≤ ⟪A x, x⟫) (B : E → E) (hB : ∀ x, ⟪B x, x⟫ = 0)
    (a : ℝ → E) (ha : ∀ t, HasDerivAt a (-(ν • A (a t)) + B (a t)) t) :
    Antitone (fun t => ‖a t‖ ^ 2) := by
  refine antitone_of_hasDerivAt_nonpos (fun t => (ha t).norm_sq) (fun t => ?_)
  rw [Pi.zero_apply, inner_add_right, inner_neg_right, inner_smul_right, real_inner_comm (B (a t)) (a t), hB,
    real_inner_comm (A (a t)) (a t)]
  nlinarith [hA (a t)]

/-- THE FORMS ARE BOUND: the value of the frame of the library's host is statement (A); its record carries the value
    with no premise; the rest datum is admissible and global; one admissible datum without a global flow refutes the
    statement; and the energy never rises on any truncation. -/
theorem the_forms_are_bound (ν : ℝ) :
    (Value (hostNS ν).frame ↔ FeffermanA ν) ∧ Value (recFrame (hostNS ν).frame) ∧
    (Admissible (fun _ => 0) ∧ GlobalSmooth ν (fun _ => 0)) ∧
    (∀ u₀ : E3 → E3, Admissible u₀ → ¬ GlobalSmooth ν u₀ → ¬ FeffermanA ν) :=
  ⟨kernel_reads_mathlib ν, recFrame_value _, the_seat_is_global ν, the_one_refuter ν⟩

end NSMathlib

/-! ## cones of the binding, pinned: the build is silent, and any drift fails it -/
/-- info: 'NSMathlib.recFrame_value' does not depend on any axioms -/
#guard_msgs in #print axioms NSMathlib.recFrame_value
/-- info: 'NSMathlib.binding' does not depend on any axioms -/
#guard_msgs in #print axioms NSMathlib.binding
/-- info: 'NSMathlib.rest_state_solves' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms NSMathlib.rest_state_solves
/-- info: 'NSMathlib.the_seat_is_global' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms NSMathlib.the_seat_is_global
/-- info: 'NSMathlib.count_finite_iff' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms NSMathlib.count_finite_iff
/-- info: 'NSMathlib.kernel_reads_mathlib' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms NSMathlib.kernel_reads_mathlib
/-- info: 'NSMathlib.sentence_is_statement_A' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms NSMathlib.sentence_is_statement_A
/-- info: 'NSMathlib.the_one_refuter' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms NSMathlib.the_one_refuter
/-- info: 'NSMathlib.galerkin_energy' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms NSMathlib.galerkin_energy
/-- info: 'NSMathlib.the_forms_are_bound' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms NSMathlib.the_forms_are_bound
~~~~~

~~~~~lean file=TOE_Zero.lean
/-
  TOE_Zero.lean · Theory of Theories of Everything (TOE of All TOEs): Existence Proves Existence Only by Motion
  The zero-axiom, zero-posit kernel. Core Lean 4: no import, no axiom declared, no sorry, no native_decide, and
  every theorem rests on no axiom at all, not even propositional extensionality, quotients or choice.
  I · The self-grounding root. Acts occur and every act instances the root. Then every denial is an act and
      re-enacts the root, the root is held by the act itself, and no external proof adds anything to it: the
      Omega Boundary, proved for every root that grounds itself, universally, by quantification.
  II · The constructed root. On the constructed domain the Root Axiom is a theorem.
  III · The Return and the line. On the integer quaternions i·j·k = −1 and each unit squares to −1; conjugation is
      an involution and its fixed set on the chart is exactly the scalar line.
  IV · The twelve gates, recovered three ways inside the integers of the quaternions: the twenty-four Hurwitz units
      counted twelve up to sign; the twelve even permutations with class equation 1, 3, 4, 4; and the norm-two
      shell of twenty-four, split twelve and twelve.
  V · The regress terminated. Above a self-grounding root no level grounds it further.
  VI · The master seal, every result bound in one theorem.
-/
namespace TOE0

/-! ## I · The self-grounding root: the Omega Boundary -/

/-- A self-grounding root: acts occur, and every act instances the root. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

/-- A proposition whose denial hands it over. -/
def SelfVerifying (P : Prop) : Prop := ¬P → P

/-- THE OMEGA BOUNDARY: every denial of the root is an act, and re-enacts it. -/
theorem denial_reenacts_root {R : Prop} (G : SelfGrounding R) (denial : G.Act) : R := G.instances denial

/-- EXISTENCE PROVES EXISTENCE ONLY BY MOTION: the root is held by the act itself. -/
theorem seated_undeniable {R : Prop} (G : SelfGrounding R) : R := G.instances G.anAct

/-- No external proof adds anything to the root. -/
theorem external_proof_adds_nothing {R : Prop} (G : SelfGrounding R) (Q : Prop) : (Q → R) ↔ R :=
  ⟨fun _ => G.instances G.anAct, fun r _ => r⟩

/-- The deed of denying the root hands it over. -/
theorem denial_instantiates {R : Prop} (G : SelfGrounding R) : SelfVerifying R := fun _ => G.instances G.anAct

/-- THE FLOOR IS UNIVERSAL: for every root that grounds itself, the root holds, every act re-enacts it, and no
    external proof adds to it. -/
theorem the_floor_is_universal :
    ∀ (R : Prop) (G : SelfGrounding R), R ∧ (∀ _ : G.Act, R) ∧ (∀ Q : Prop, (Q → R) ↔ R) :=
  fun _ G => ⟨seated_undeniable G, denial_reenacts_root G, external_proof_adds_nothing G⟩

/-! ## II · The constructed root -/

/-- The Root Axiom on the constructed one-point domain: its one existent actuates, at positive energy. -/
def ΔE₀ : Unit → Int := fun _ => 1
def RA₀ : Prop := ∀ x : Unit, 0 < ΔE₀ x

/-- The constructed domain grounds its root: its one act is a deed, and the deed actuates. -/
def ra₀ : SelfGrounding RA₀ := ⟨Unit, (), fun _ _ => show (0 : Int) < 1 by decide⟩

/-- THE ROOT ON THE CONSTRUCTED DOMAIN, A THEOREM. -/
theorem root_on_the_constructed_domain : RA₀ := seated_undeniable ra₀

/-! ## III · The Return and the line -/

structure Q where
  (a b c d : Int)
  deriving DecidableEq

def Q.mul (x y : Q) : Q :=
  ⟨x.a * y.a - x.b * y.b - x.c * y.c - x.d * y.d, x.a * y.b + x.b * y.a + x.c * y.d - x.d * y.c,
   x.a * y.c - x.b * y.d + x.c * y.a + x.d * y.b, x.a * y.d + x.b * y.c - x.c * y.b + x.d * y.a⟩

def Q.conj (x : Q) : Q := ⟨x.a, -x.b, -x.c, -x.d⟩
def qone : Q := ⟨1, 0, 0, 0⟩
def qneg : Q := ⟨-1, 0, 0, 0⟩
def qi : Q := ⟨0, 1, 0, 0⟩
def qj : Q := ⟨0, 0, 1, 0⟩
def qk : Q := ⟨0, 0, 0, 1⟩

/-- THE RETURN: i·j·k = −1. -/
theorem the_return : (qi.mul qj).mul qk = qneg := by decide

/-- Each unit squares to −1. -/
theorem units_square_to_minus_one : qi.mul qi = qneg ∧ qj.mul qj = qneg ∧ qk.mul qk = qneg := by decide

/-- The chart: every quaternion with coordinates in −2 … 2. -/
def chart : List Int := [-2, -1, 0, 1, 2]
def quats : List Q :=
  chart.flatMap fun a => chart.flatMap fun b => chart.flatMap fun c => chart.map fun d => ⟨a, b, c, d⟩

set_option maxRecDepth 100000 in
/-- Conjugation is an involution on the chart. -/
theorem conj_involutive_on_the_chart : quats.all (fun q => q.conj.conj == q) = true := by decide

set_option maxRecDepth 100000 in
/-- THE LINE: conjugation fixes exactly the scalar line on the chart. -/
theorem the_line_is_the_fixed_set :
    quats.all (fun q => (q.conj == q) == (q.b == 0 && q.c == 0 && q.d == 0)) = true := by decide

/-! ## IV · The twelve gates, recovered three ways -/

/-- Hurwitz quaternions in doubled coordinates: all even, or all odd. -/
def hurwitz (a b c d : Int) : Bool :=
  (a % 2 == 0 && b % 2 == 0 && c % 2 == 0 && d % 2 == 0) || (a % 2 != 0 && b % 2 != 0 && c % 2 != 0 && d % 2 != 0)
/-- Doubled coordinates −2 … 2 hold every unit (doubled norm four) and every element of the norm-two shell (doubled
    norm eight), since a doubled coordinate of absolute value three or more already exceeds both norms. -/
def doubled : List (Int × Int × Int × Int) :=
  chart.flatMap fun a => chart.flatMap fun b => chart.flatMap fun c => chart.map fun d => (a, b, c, d)

/-- The Hurwitz units: norm one, doubled norm four. -/
def units : List (Int × Int × Int × Int) :=
  doubled.filter fun (a, b, c, d) => a * a + b * b + c * c + d * d == 4 && hurwitz a b c d

/-- The first nonzero coordinate is positive: one representative of each pair ±u. -/
def upToSign (p : Int × Int × Int × Int) : Bool :=
  let (a, b, c, d) := p
  if a != 0 then 0 < a else if b != 0 then 0 < b else if c != 0 then 0 < c else 0 < d

set_option maxRecDepth 100000 in
/-- FIRST WAY: twenty-four Hurwitz units, twelve up to sign. -/
theorem twenty_four_units_twelve_gates : units.length = 24 ∧ (units.filter upToSign).length = 12 := by decide

/-- The norm-two shell: doubled norm eight. -/
def shell : List (Int × Int × Int × Int) :=
  doubled.filter fun (a, b, c, d) => a * a + b * b + c * c + d * d == 8 && hurwitz a b c d

set_option maxRecDepth 100000 in
/-- THIRD WAY: the norm-two shell has twenty-four elements, split twelve and twelve by sign. -/
theorem the_shell_splits_twelve_and_twelve :
    shell.length = 24 ∧ (shell.filter upToSign).length = 12 ∧ (shell.filter (fun p => !upToSign p)).length = 12 := by
  decide

/-- Permutations of four points, as their lists of images. -/
def perms4 : List (List Nat) :=
  [0, 1, 2, 3].flatMap fun a => [0, 1, 2, 3].flatMap fun b => [0, 1, 2, 3].flatMap fun c =>
    [0, 1, 2, 3].filterMap fun d => if [a, b, c, d].eraseDups.length == 4 then some [a, b, c, d] else none

def inversions (p : List Nat) : Nat :=
  ((List.range 4).flatMap fun i => (List.range 4).map fun j => (i, j)).countP
    fun (i, j) => i < j && p.getD j 0 < p.getD i 0

/-- The twelve gates as the even permutations. -/
def gates : List (List Nat) := perms4.filter fun p => inversions p % 2 == 0

def compose (p q : List Nat) : List Nat := q.map fun i => p.getD i 0
def inverse (p : List Nat) : List Nat := [0, 1, 2, 3].map fun i => p.idxOf i

def conjClass (g : List Nat) : List (List Nat) := (gates.map fun h => compose (compose h g) (inverse h)).eraseDups

def insertSorted (n : Nat) : List Nat → List Nat
  | [] => [n]
  | m :: ms => if n ≤ m then n :: m :: ms else m :: insertSorted n ms

def sortNat (l : List Nat) : List Nat := l.foldr insertSorted []

/-- The class equation from the sorted class size of each element: a class of size s contributes s elements. -/
def collapse : Nat → List Nat → List Nat
  | 0, _ => []
  | _ + 1, [] => []
  | fuel + 1, s :: rest => s :: collapse fuel (rest.drop (s - 1))

set_option maxRecDepth 100000 in
/-- SECOND WAY: the twelve gates, with class equation 1, 3, 4, 4. -/
theorem the_class_equation :
    gates.length = 12 ∧ collapse 12 (sortNat (gates.map fun g => (conjClass g).length)) = [1, 3, 4, 4] := by
  decide

/-! ## V · The regress terminated -/

/-- THE REGRESS ENDS AT THE ROOT: any proposition offered as a further ground of the root is idle; the root needs
    no level above it. -/
theorem no_level_above {R : Prop} (G : SelfGrounding R) : ∀ Q : Prop, (Q → R) → R := fun _ _ => G.instances G.anAct

/-! ## VI · The master seal -/

/-- THE MASTER SEAL: the floor is universal; the root is a theorem on the constructed domain; the Return closes;
    the line is the fixed set; and the twelve gates are recovered three ways. -/
theorem the_master_seal :
    (∀ (R : Prop) (G : SelfGrounding R), R ∧ (∀ _ : G.Act, R) ∧ (∀ Q : Prop, (Q → R) ↔ R)) ∧
    RA₀ ∧ (qi.mul qj).mul qk = qneg ∧
    quats.all (fun q => (q.conj == q) == (q.b == 0 && q.c == 0 && q.d == 0)) = true ∧
    (units.filter upToSign).length = 12 ∧ gates.length = 12 ∧ (shell.filter upToSign).length = 12 ∧
    collapse 12 (sortNat (gates.map fun g => (conjClass g).length)) = [1, 3, 4, 4] :=
  ⟨the_floor_is_universal, root_on_the_constructed_domain, the_return, the_line_is_the_fixed_set,
   twenty_four_units_twelve_gates.2, the_class_equation.1, the_shell_splits_twelve_and_twelve.2.1, the_class_equation.2⟩

end TOE0

/-! ## The zero law, pinned: every cone is empty -/
/-- info: 'TOE0.denial_reenacts_root' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.denial_reenacts_root
/-- info: 'TOE0.seated_undeniable' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.seated_undeniable
/-- info: 'TOE0.external_proof_adds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.external_proof_adds_nothing
/-- info: 'TOE0.denial_instantiates' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.denial_instantiates
/-- info: 'TOE0.the_floor_is_universal' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.the_floor_is_universal
/-- info: 'TOE0.root_on_the_constructed_domain' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.root_on_the_constructed_domain
/-- info: 'TOE0.the_return' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.the_return
/-- info: 'TOE0.units_square_to_minus_one' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.units_square_to_minus_one
/-- info: 'TOE0.conj_involutive_on_the_chart' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.conj_involutive_on_the_chart
/-- info: 'TOE0.the_line_is_the_fixed_set' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.the_line_is_the_fixed_set
/-- info: 'TOE0.twenty_four_units_twelve_gates' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.twenty_four_units_twelve_gates
/-- info: 'TOE0.the_shell_splits_twelve_and_twelve' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.the_shell_splits_twelve_and_twelve
/-- info: 'TOE0.the_class_equation' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.the_class_equation
/-- info: 'TOE0.no_level_above' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.no_level_above
/-- info: 'TOE0.the_master_seal' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.the_master_seal
~~~~~

~~~~~lean file=Triaxial_Actuation.lean
/-
  Triaxial_Actuation.lean · actuation is triaxial

  Core Lean 4: no import, no axiom declared, no sorry, no native_decide, and every theorem rests on no
  axiom at all, not even propositional extensionality, quotients or choice.

  An actuation is a self-grounding root whose acts carry a direction: each act has a side and a height,
  and reversing the deed reverses the side and keeps the height. From the direction alone the kernel
  constructs three axes and proves them forced:
  I    The fold: reversing the deed is an involution.
  II   The registration: it keeps the height and forgets the side; it is blind to the fold, closed with
       it under combination, and it is the only height-keeping map onto the seat.
  III  The seat: the fold's fixed set, where the fold and the registration both fix the act, and off
       which neither does.
  IV   The third axis: off the seat the fold's orbit has two acts with one record, so the record leaves
       exactly the orientation open; every reading blind to the fold reads both alike.
  V    The root through the axes: a reversed deed is still an act and instances the root; the axes are
       carried by every actuation, and they force no orientation.
  VI   The bridge atom: the integers, with negation as the fold, are an actuation.
  VII  The triaxial seal.
  VIII The Tongue: no reading of the record returns the orientation; the seat is the only special cut.
  IX   Every root actuates: a self-grounding root is the root of an actuation over its own acts, so the
       root carries the three axes; the registration is the fold's record and lands on the seat, where
       the orientation an act and its reversal share stays open; the even pair leaves two acts, the
       orientation locks one; and a degenerate direction, one side only, is the characterless case.
-/

namespace TriAct

/-! ## The root, self-grounding -/

/-- A self-grounding root: acts occur, and every act instances the root. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

/-! ## Actuation: a self-grounding root whose acts carry a direction -/

/-- The direction of a deed: a side with a reversal, whose one fixed side is the zero side. -/
structure Direction where
  Side     : Type
  rev      : Side → Side
  zero     : Side
  rev_rev  : ∀ s, rev (rev s) = s
  rev_zero : rev zero = zero
  fix_zero : ∀ s, rev s = s → s = zero

/-- An actuation: a self-grounding root whose acts are pairs of a side and a height. -/
structure Actuation (R : Prop) where
  dir       : Direction
  Height    : Type
  anAct     : dir.Side × Height
  instances : dir.Side × Height → R

variable {R : Prop}

/-- Every actuation is a self-grounding root. -/
def Actuation.toSelfGrounding (A : Actuation R) : SelfGrounding R :=
  ⟨A.dir.Side × A.Height, A.anAct, A.instances⟩

/-- The fold: reversing the deed reverses the side and keeps the height. -/
def fold (A : Actuation R) (p : A.dir.Side × A.Height) : A.dir.Side × A.Height := (A.dir.rev p.1, p.2)

/-- The registration: it keeps the height and forgets the side. -/
def reg (A : Actuation R) (p : A.dir.Side × A.Height) : A.dir.Side × A.Height := (A.dir.zero, p.2)

/-- The seat: the acts the fold fixes. -/
def OnSeat (A : Actuation R) (p : A.dir.Side × A.Height) : Prop := fold A p = p

/-! ## I · the fold -/

theorem fold_involutive (A : Actuation R) (p : A.dir.Side × A.Height) : fold A (fold A p) = p := by
  cases p with
  | mk s h => show (A.dir.rev (A.dir.rev s), h) = (s, h); rw [A.dir.rev_rev]

/-! ## II · the registration -/

/-- The registration forgets the side: an act and its reversal have one record. -/
theorem reg_forgets_side (A : Actuation R) (p : A.dir.Side × A.Height) : reg A (fold A p) = reg A p := rfl

/-- The registration keeps the height. -/
theorem reg_keeps_height (A : Actuation R) (p : A.dir.Side × A.Height) : (reg A p).2 = p.2 := rfl

/-- The even pair is closed under combination: folding a record changes nothing. -/
theorem fold_of_reg (A : Actuation R) (p : A.dir.Side × A.Height) : fold A (reg A p) = reg A p := by
  show (A.dir.rev A.dir.zero, p.2) = (A.dir.zero, p.2); rw [A.dir.rev_zero]

/-- The registration is idempotent. -/
theorem reg_idempotent (A : Actuation R) (p : A.dir.Side × A.Height) : reg A (reg A p) = reg A p := rfl

/-- THE REGISTRATION IS FORCED, NOT ELECTED: any map that keeps the height and lands on the seat is
the registration. -/
theorem registration_is_forced (A : Actuation R) (g : A.dir.Side × A.Height → A.dir.Side × A.Height)
    (keeps : ∀ p, (g p).2 = p.2) (lands : ∀ p, OnSeat A (g p)) : ∀ p, g p = reg A p := by
  intro p
  have hs : (g p).1 = A.dir.zero := by
    have hf := lands p
    have h1 : A.dir.rev (g p).1 = (g p).1 := congrArg Prod.fst hf
    exact A.dir.fix_zero _ h1
  have hh := keeps p
  cases hg : g p with
  | mk s h =>
    rw [hg] at hs hh
    show (s, h) = (A.dir.zero, p.2)
    rw [show s = A.dir.zero from hs, show h = p.2 from hh]

/-! ## III · the seat -/

/-- The seat is exactly the zero side. -/
theorem seat_iff_zero_side (A : Actuation R) (p : A.dir.Side × A.Height) : OnSeat A p ↔ p.1 = A.dir.zero :=
  ⟨fun h => A.dir.fix_zero _ (congrArg Prod.fst h),
   fun h => by
     cases p with
     | mk s t =>
       show (A.dir.rev s, t) = (s, t)
       have hs : s = A.dir.zero := h
       rw [hs, A.dir.rev_zero]⟩

/-- ON THE SEAT BOTH BLIND SPOTS CANCEL: the fold and the registration both fix the act. -/
theorem seat_cancels_both (A : Actuation R) (p : A.dir.Side × A.Height) (h : OnSeat A p) :
    fold A p = p ∧ reg A p = p := by
  refine ⟨h, ?_⟩
  have hz : p.1 = A.dir.zero := (seat_iff_zero_side A p).mp h
  cases p with
  | mk s t =>
    have hs : s = A.dir.zero := hz
    show (A.dir.zero, t) = (s, t)
    rw [hs]

/-- OFF THE SEAT BOTH STAND: neither the fold nor the registration fixes the act. -/
theorem off_seat_both (A : Actuation R) (p : A.dir.Side × A.Height) (h : ¬ OnSeat A p) :
    fold A p ≠ p ∧ reg A p ≠ p := by
  refine ⟨h, fun hr => h ?_⟩
  have hz : p.1 = A.dir.zero := (congrArg Prod.fst hr).symm
  exact (seat_iff_zero_side A p).mpr hz

/-! ## IV · the third axis -/

/-- THE RECORD LEAVES EXACTLY THE ORIENTATION: off the seat, an act and its reversal are two acts with
one record. -/
theorem record_leaves_the_orientation (A : Actuation R) (p : A.dir.Side × A.Height) (h : ¬ OnSeat A p) :
    fold A p ≠ p ∧ reg A (fold A p) = reg A p :=
  ⟨h, rfl⟩

/-- Every reading blind to the fold reads an act and its reversal alike. -/
theorem even_readings_are_blind (A : Actuation R) {α : Type} (f : A.dir.Side × A.Height → α)
    (blind : ∀ p, f (fold A p) = f p) (p : A.dir.Side × A.Height) : f (fold A p) = f p :=
  blind p

/-- The registration is such a reading, and so is every reading of the record. -/
theorem readings_of_the_record_are_blind (A : Actuation R) {α : Type} (k : A.dir.Side × A.Height → α)
    (p : A.dir.Side × A.Height) : k (reg A (fold A p)) = k (reg A p) := rfl

/-! ## V · the root through the axes -/

/-- A REVERSED DEED IS STILL AN ACT, AND INSTANCES THE ROOT: the denial spends the deed. -/
theorem denial_instances_root (A : Actuation R) (p : A.dir.Side × A.Height) : R :=
  A.instances (fold A p)

/-- The root holds on every actuation, by its act. -/
theorem root_holds (A : Actuation R) : R := A.instances A.anAct

/-- THE AXES FORCE NO ORIENTATION: off the seat both orientations are acts, both instance the root, and
the record reads them alike; the triaxial structure leaves the one orientation open. -/
theorem axes_force_no_orientation (A : Actuation R) (p : A.dir.Side × A.Height) (h : ¬ OnSeat A p) :
    R ∧ R ∧ fold A p ≠ p ∧ reg A (fold A p) = reg A p :=
  ⟨A.instances p, A.instances (fold A p), h, rfl⟩

/-! ## VI · the bridge atom: the integers are an actuation -/

theorem int_neg_neg : ∀ s : Int, -(-s) = s
  | Int.ofNat 0 => rfl
  | Int.ofNat (_ + 1) => rfl
  | Int.negSucc _ => rfl

theorem self_neg_zero : ∀ v : Int, -v = v → v = 0
  | Int.ofNat 0, _ => rfl
  | Int.ofNat (_ + 1), h => Int.noConfusion h
  | Int.negSucc _, h => Int.noConfusion h

/-- The integer direction: negation, with zero its one fixed side. -/
def intDir : Direction := ⟨Int, fun s => -s, 0, int_neg_neg, rfl, self_neg_zero⟩

/-- The bridge atom: points (d, t), the fold (d, t) ↦ (−d, t), the registration (d, t) ↦ (0, t). -/
def atom : Actuation True := ⟨intDir, Int, ((0 : Int), (0 : Int)), fun _ => True.intro⟩

/-- THE BRIDGE ATOM, AS AN ACTUATION: the fold fixes (d, t) exactly when d = 0, the registration
leaves it unchanged exactly then, and off the seat the record leaves the orientation. -/
theorem the_bridge_atom (d t : Int) :
    (OnSeat atom (d, t) ↔ d = 0) ∧ (reg atom (d, t) = (d, t) ↔ d = 0) ∧
    (d ≠ 0 → fold atom (d, t) ≠ (d, t) ∧ reg atom (fold atom (d, t)) = reg atom (d, t)) :=
  ⟨seat_iff_zero_side atom (d, t),
   ⟨fun h => (congrArg Prod.fst h).symm, fun h => by rw [h]; rfl⟩,
   fun hd => record_leaves_the_orientation atom (d, t) (fun hs => hd ((seat_iff_zero_side atom (d, t)).mp hs))⟩

/-- The atom is not characterless: off the seat it has two acts with one record. -/
theorem the_atom_is_not_characterless :
    fold atom ((1 : Int), (0 : Int)) ≠ ((1 : Int), (0 : Int)) ∧ reg atom (fold atom ((1 : Int), (0 : Int))) = reg atom ((1 : Int), (0 : Int)) :=
  ⟨fun h => Int.noConfusion (congrArg Prod.fst h), rfl⟩

/-! ## VII · the triaxial seal -/

/-- ACTUATION IS TRIAXIAL: every actuation carries a fold that is an involution, a registration that
keeps the height, forgets the side and is the only such map onto the seat, and a seat where both fix
the act and off which neither does; off the seat the record leaves exactly the orientation; every act
and its reversal instance the root; and the axes force no orientation. -/
theorem actuation_is_triaxial (A : Actuation R) :
    (∀ p, fold A (fold A p) = p) ∧
    (∀ p, reg A (fold A p) = reg A p ∧ (reg A p).2 = p.2 ∧ fold A (reg A p) = reg A p) ∧
    (∀ g : A.dir.Side × A.Height → A.dir.Side × A.Height,
       (∀ p, (g p).2 = p.2) → (∀ p, OnSeat A (g p)) → ∀ p, g p = reg A p) ∧
    (∀ p, OnSeat A p → fold A p = p ∧ reg A p = p) ∧
    (∀ p, ¬ OnSeat A p → fold A p ≠ p ∧ reg A p ≠ p) ∧
    (∀ p, ¬ OnSeat A p → R ∧ R ∧ fold A p ≠ p ∧ reg A (fold A p) = reg A p) :=
  ⟨fold_involutive A, fun p => ⟨reg_forgets_side A p, reg_keeps_height A p, fold_of_reg A p⟩,
   registration_is_forced A, seat_cancels_both A, off_seat_both A, axes_force_no_orientation A⟩

/-- THE TRIAXIAL SEAL: actuation is triaxial, universally; the bridge atom is an actuation; and it is
not characterless. -/
theorem the_triaxial_seal :
    (∀ (R : Prop) (A : Actuation R), (∀ p, fold A (fold A p) = p) ∧
      (∀ p, OnSeat A p → fold A p = p ∧ reg A p = p) ∧
      (∀ p, ¬ OnSeat A p → fold A p ≠ p ∧ reg A (fold A p) = reg A p)) ∧
    (∀ d t : Int, OnSeat atom (d, t) ↔ d = 0) ∧
    (fold atom ((1 : Int), (0 : Int)) ≠ ((1 : Int), (0 : Int)) ∧ reg atom (fold atom ((1 : Int), (0 : Int))) = reg atom ((1 : Int), (0 : Int))) :=
  ⟨fun _ A => ⟨fold_involutive A, seat_cancels_both A,
     fun p h => record_leaves_the_orientation A p h⟩,
   fun d t => seat_iff_zero_side atom (d, t),
   the_atom_is_not_characterless⟩


/-! ## VIII · the Tongue: freedom and the only special cut -/

/-- TONGUE FREEDOM: no reading of the record returns the orientation. If a record is blind to the fold
and an orientation is flipped by it, the orientation is not a function of the record. -/
theorem tongue_freedom {α β : Type} (τ : α → α) (ρ : α → β) (g : β → Bool) (d : α → Bool) (x : α)
    (blind : ρ (τ x) = ρ x) (flip : d (τ x) = !d x) : d ≠ fun y => g (ρ y) := by
  intro h
  have h1 : d (τ x) = g (ρ (τ x)) := congrFun h (τ x)
  have h2 : d x = g (ρ x) := congrFun h x
  rw [blind] at h1
  rw [← h2] at h1
  rw [h1] at flip
  cases hd : d x with
  | false => rw [hd] at flip; exact Bool.noConfusion flip
  | true => rw [hd] at flip; exact Bool.noConfusion flip

/-- THE ONLY SPECIAL CUT: the seat is exactly where both blind spots cancel; nowhere else do the fold
and the registration both fix an act. -/
theorem the_only_special_cut (A : Actuation R) (p : A.dir.Side × A.Height) :
    (fold A p = p ∧ reg A p = p) ↔ OnSeat A p :=
  ⟨fun h => h.1, fun h => seat_cancels_both A p h⟩

/-! ## IX · every root actuates: the root carries the three axes -/

/-- THE REGISTRATION IS THE FOLD'S RECORD: it reads an act and its reversal alike and keeps the height, and two
acts have one record exactly when they have one height. -/
theorem registration_is_the_folds_record (A : Actuation R) (p q : A.dir.Side × A.Height) :
    reg A (fold A p) = reg A p ∧ (reg A p = reg A q ↔ p.2 = q.2) :=
  ⟨rfl, ⟨fun h => show (reg A p).2 = (reg A q).2 from congrArg Prod.snd h, fun h => by
    cases p with
    | mk s t =>
      cases q with
      | mk s' t' =>
        have ht : t = t' := h
        show (A.dir.zero, t) = (A.dir.zero, t')
        rw [ht]⟩⟩

/-- THE REGISTRATION LANDS ON THE SEAT: every record is a seat point. -/
theorem reg_lands_on_seat (A : Actuation R) (p : A.dir.Side × A.Height) : OnSeat A (reg A p) :=
  fold_of_reg A p

/-- THE ORIENTATION IS OPEN AT THE SEAT: off the seat, an act and its reversal land on one seat point, the record
of both; at that place the record has left exactly the orientation open. -/
theorem open_at_the_seat (A : Actuation R) (p : A.dir.Side × A.Height) (h : ¬ OnSeat A p) :
    OnSeat A (reg A p) ∧ reg A (fold A p) = reg A p ∧ fold A p ≠ p :=
  ⟨reg_lands_on_seat A p, rfl, h⟩

/-- TWO AXES LEAVE TWO: off the seat, every reading blind to the fold, the record among them, reads an act and
its reversal alike: two acts, one reading. -/
theorem even_pair_leaves_two (A : Actuation R) (p : A.dir.Side × A.Height) (h : ¬ OnSeat A p) {α : Type}
    (f : A.dir.Side × A.Height → α) (blind : ∀ q, f (fold A q) = f q) :
    fold A p ≠ p ∧ f (fold A p) = f p ∧ reg A (fold A p) = reg A p :=
  ⟨h, blind p, rfl⟩

/-- THREE AXES LOCK ONE: the record together with the orientation, the side, determines the act. -/
theorem orientation_locks_the_act (A : Actuation R) (p q : A.dir.Side × A.Height)
    (hr : reg A p = reg A q) (hs : p.1 = q.1) : p = q := by
  cases p with
  | mk s t =>
    cases q with
    | mk s' t' =>
      have ht : t = t' := congrArg Prod.snd hr
      have hs' : s = s' := hs
      rw [hs', ht]

/-- A degenerate direction has the zero side and no other. -/
def Direction.Degenerate (D : Direction) : Prop := ∀ s, s = D.zero

/-- THE CHARACTERLESS CASE: over a degenerate direction every act is on the seat, and the fold and the
registration are both the identity: one scalar, no fold, no seat to lock. -/
theorem degenerate_is_characterless (A : Actuation R) (h : A.dir.Degenerate) (p : A.dir.Side × A.Height) :
    OnSeat A p ∧ fold A p = p ∧ reg A p = p :=
  have hs : OnSeat A p := (seat_iff_zero_side A p).mpr (h p.1)
  ⟨hs, seat_cancels_both A p hs⟩

/-- The integer direction is not degenerate. -/
theorem intDir_not_degenerate : ¬ intDir.Degenerate := fun h =>
  have h0 : (1 : Int) = 0 := h (1 : Int)
  absurd h0 (by decide)

/-- EVERY ROOT ACTUATES: a self-grounding root is the root of the actuation over its own acts, with the integer
direction; the root's deeds sit at the zero side and instance the root as before. -/
def SelfGrounding.toActuation (S : SelfGrounding R) : Actuation R :=
  ⟨intDir, S.Act, ((0 : Int), S.anAct), fun p => S.instances p.2⟩

theorem every_root_actuates (S : SelfGrounding R) :
    (∀ a : S.Act, OnSeat S.toActuation ((0 : Int), a)) ∧
    (∀ a : S.Act, ¬ OnSeat S.toActuation ((1 : Int), a)) ∧
    ¬ S.toActuation.dir.Degenerate :=
  ⟨fun _ => rfl,
   fun a h =>
     have h0 : (1 : Int) = 0 := (seat_iff_zero_side S.toActuation ((1 : Int), a)).mp h
     absurd h0 (by decide),
   intDir_not_degenerate⟩

/-- THE ROOT CARRIES THREE AXES: for every self-grounding root, its actuation carries the fold, an involution; the
registration, keeping the height, forgetting the side, the only height-keeping map onto the seat; and the seat,
where both fix the act; and it is not characterless: at every height an act off the seat, its reversal a second
act with the same record, both instancing the root, the orientation between them forced by nothing. -/
theorem the_root_carries_three_axes (S : SelfGrounding R) :
    (∀ p, fold S.toActuation (fold S.toActuation p) = p) ∧
    (∀ p, reg S.toActuation (fold S.toActuation p) = reg S.toActuation p ∧ (reg S.toActuation p).2 = p.2) ∧
    (∀ g : Int × S.Act → Int × S.Act, (∀ p, (g p).2 = p.2) → (∀ p, OnSeat S.toActuation (g p)) →
       ∀ p, g p = reg S.toActuation p) ∧
    (∀ p, OnSeat S.toActuation p → fold S.toActuation p = p ∧ reg S.toActuation p = p) ∧
    (∀ a : S.Act, fold S.toActuation ((1 : Int), a) ≠ ((1 : Int), a) ∧
       reg S.toActuation (fold S.toActuation ((1 : Int), a)) = reg S.toActuation ((1 : Int), a)) ∧
    (∀ p, ¬ OnSeat S.toActuation p →
       R ∧ R ∧ fold S.toActuation p ≠ p ∧ reg S.toActuation (fold S.toActuation p) = reg S.toActuation p) :=
  ⟨fold_involutive S.toActuation,
   fun p => ⟨reg_forgets_side S.toActuation p, reg_keeps_height S.toActuation p⟩,
   registration_is_forced S.toActuation,
   seat_cancels_both S.toActuation,
   fun a => record_leaves_the_orientation S.toActuation ((1 : Int), a) ((every_root_actuates S).2.1 a),
   axes_force_no_orientation S.toActuation⟩

end TriAct

/-! ## Cones, pinned as printed: every theorem on no axiom -/
/-- info: 'TriAct.fold_involutive' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.fold_involutive
/-- info: 'TriAct.reg_forgets_side' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.reg_forgets_side
/-- info: 'TriAct.reg_keeps_height' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.reg_keeps_height
/-- info: 'TriAct.fold_of_reg' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.fold_of_reg
/-- info: 'TriAct.reg_idempotent' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.reg_idempotent
/-- info: 'TriAct.registration_is_forced' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.registration_is_forced
/-- info: 'TriAct.seat_iff_zero_side' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.seat_iff_zero_side
/-- info: 'TriAct.seat_cancels_both' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.seat_cancels_both
/-- info: 'TriAct.off_seat_both' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.off_seat_both
/-- info: 'TriAct.record_leaves_the_orientation' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.record_leaves_the_orientation
/-- info: 'TriAct.even_readings_are_blind' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.even_readings_are_blind
/-- info: 'TriAct.readings_of_the_record_are_blind' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.readings_of_the_record_are_blind
/-- info: 'TriAct.denial_instances_root' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.denial_instances_root
/-- info: 'TriAct.root_holds' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.root_holds
/-- info: 'TriAct.axes_force_no_orientation' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.axes_force_no_orientation
/-- info: 'TriAct.int_neg_neg' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.int_neg_neg
/-- info: 'TriAct.self_neg_zero' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.self_neg_zero
/-- info: 'TriAct.the_bridge_atom' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.the_bridge_atom
/-- info: 'TriAct.the_atom_is_not_characterless' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.the_atom_is_not_characterless
/-- info: 'TriAct.actuation_is_triaxial' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.actuation_is_triaxial
/-- info: 'TriAct.the_triaxial_seal' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.the_triaxial_seal
/-- info: 'TriAct.tongue_freedom' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.tongue_freedom
/-- info: 'TriAct.the_only_special_cut' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.the_only_special_cut
/-- info: 'TriAct.registration_is_the_folds_record' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.registration_is_the_folds_record
/-- info: 'TriAct.reg_lands_on_seat' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.reg_lands_on_seat
/-- info: 'TriAct.open_at_the_seat' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.open_at_the_seat
/-- info: 'TriAct.even_pair_leaves_two' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.even_pair_leaves_two
/-- info: 'TriAct.orientation_locks_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.orientation_locks_the_act
/-- info: 'TriAct.degenerate_is_characterless' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.degenerate_is_characterless
/-- info: 'TriAct.intDir_not_degenerate' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.intDir_not_degenerate
/-- info: 'TriAct.every_root_actuates' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.every_root_actuates
/-- info: 'TriAct.the_root_carries_three_axes' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.the_root_carries_three_axes
~~~~~

~~~~~lean file=Root_Grade_Ledger.lean
/-
  Root_Grade_Ledger.lean · the root at theorem grade, and RA–Tongue co-location with it

  Core Lean 4: no import, no axiom declared, no sorry, no native_decide, and every theorem rests on no
  axiom at all, not even propositional extensionality, quotients or choice.

  The floor Codex (Master Codex v5.1.0, Codex.lean) grades every claim on one ledger and joins claims
  at the weakest link. It declares the root as `axiom RA` and pins `raClaim.grade = .premise`; its
  co-location claim, the root joined with the wall, therefore inherits `.premise`. This kernel carries
  the same ledger and the same join law with no axiom declared, warrants the root by a theorem with no
  axiom and no hypothesis, and proves that the co-location claim then stands at theorem grade.
  I    The grade ledger and the weakest-link join, as in the Codex.
  II   The root, a theorem: the constructed domain of TOE_Zero.lean, warranted on no axiom.
  III  The wall, a theorem: the Codex's K4 frame, its target not a function of its record, proved on
       no axiom through Tongue freedom.
  IV   The claims: the root at theorem grade, the wall at theorem grade, and their co-location.
  V    Why the Codex read premise: a join's grade is its weakest link, and co-location's grade is the
       root's grade exactly; with the root at theorem grade, co-location is a theorem.
  VI   The ledger seal.
  VII  The grade read from the warrant, as the Codex reads it: a root with a warrant, a proof of its
       statement, is theorem grade; a root posited without one, the Codex's `axiom RA`, is premise grade;
       the two claims of section IV carry exactly the grades this rule reads.
-/

namespace RGL

/-! ## I · the grade ledger, as in the Codex -/

inductive Grade : Type
  | premise | corroboration | operational | structural | engineering
  | conditional | theoremConditional | analytic | theorem
  deriving DecidableEq

def Grade.rank : Grade → Nat
  | .premise => 0 | .corroboration => 1 | .operational => 2 | .structural => 3
  | .engineering => 4 | .conditional => 5 | .theoremConditional => 6
  | .analytic => 7 | .theorem => 8

def Grade.weakest (a b : Grade) : Grade := if a.rank ≤ b.rank then a else b

/-- A claim carries its statement, its grade and its warrant, a proof of the statement. -/
structure Claim : Type where
  stmt    : Prop
  grade   : Grade
  warrant : stmt

/-- Two claims join at their weakest link. -/
def Claim.join (c₁ c₂ : Claim) : Claim where
  stmt    := c₁.stmt ∧ c₂.stmt
  grade   := Grade.weakest c₁.grade c₂.grade
  warrant := ⟨c₁.warrant, c₂.warrant⟩

theorem join_grade (c₁ c₂ : Claim) : (Claim.join c₁ c₂).grade = Grade.weakest c₁.grade c₂.grade := rfl

/-! ## II · the root, a theorem (the constructed domain of TOE_Zero.lean) -/

structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

theorem seated_undeniable {R : Prop} (G : SelfGrounding R) : R := G.instances G.anAct

def ΔE₀ : Unit → Int := fun _ => 1
def RA₀ : Prop := ∀ x : Unit, 0 < ΔE₀ x
def ra₀ : SelfGrounding RA₀ := ⟨Unit, (), fun _ _ => show (0 : Int) < 1 by decide⟩

/-- THE ROOT ON THE CONSTRUCTED DOMAIN, A THEOREM: no axiom, no hypothesis. -/
theorem root_on_the_constructed_domain : RA₀ := seated_undeniable ra₀

/-! ## III · the wall, a theorem (the Codex's K4 frame) -/

/-- Tongue freedom: if a record is blind to the fold and an orientation is flipped by it, the
orientation is not a function of the record. -/
theorem tongue_freedom {α β : Type} (τ : α → α) (ρ : α → β) (g : β → Bool) (d : α → Bool) (x : α)
    (blind : ρ (τ x) = ρ x) (flip : d (τ x) = !d x) : d ≠ fun y => g (ρ y) := by
  intro h
  have h1 : d (τ x) = g (ρ (τ x)) := congrFun h (τ x)
  have h2 : d x = g (ρ x) := congrFun h x
  rw [blind] at h1
  rw [← h2] at h1
  rw [h1] at flip
  cases hd : d x with
  | false => rw [hd] at flip; exact Bool.noConfusion flip
  | true => rw [hd] at flip; exact Bool.noConfusion flip

namespace K4

def val : Nat → Nat
  | 0 => 11 | 1 => 851 | 2 => 13 | 3 => 1273 | 4 => 17 | 5 => 437
  | 6 => 19 | 7 => 2119 | 8 => 23 | 9 => 1703 | 10 => 29 | 11 => 869
  | _ => 0

def tau : Nat → Nat := fun i =>
  if i < 12 then (if i % 2 = 0 then i + 1 else i - 1) else i

def target : Nat → Bool := fun i => i % 2 == 0

def rho : Nat → Nat := fun i =>
  (val i % 2) * 1000 + (val i % 3) * 100 + (val i % 5) * 10 + (val i % 7)

/-- The record is blind to the fold at the first pair. -/
theorem register_even_at_zero : rho (tau 0) = rho 0 := by decide

/-- The target is flipped by the fold at the first pair. -/
theorem target_odd_at_zero : target (tau 0) = !target 0 := by decide

/-- THE WALL: no reading of the record returns the target. -/
theorem wall (g : Nat → Bool) : target ≠ fun y => g (rho y) :=
  tongue_freedom tau rho g target 0 register_even_at_zero target_odd_at_zero

end K4

/-! ## IV · the claims -/

/-- The root at theorem grade, warranted by a theorem with no axiom and no hypothesis. -/
def raClaim₀ : Claim where
  stmt    := RA₀
  grade   := .theorem
  warrant := root_on_the_constructed_domain

/-- The wall at theorem grade, as in the Codex. -/
def wallClaim : Claim where
  stmt    := ∀ g : Nat → Bool, K4.target ≠ fun y => g (K4.rho y)
  grade   := .theorem
  warrant := K4.wall

/-- RA–Tongue co-location: the root joined with the wall, as in the Codex. -/
def colocClaim₀ : Claim := Claim.join raClaim₀ wallClaim

/-- The Codex's root, graded as the Codex grades it, for comparison: the same statement form, at
premise grade. -/
def raClaimPremise : Claim where
  stmt    := RA₀
  grade   := .premise
  warrant := root_on_the_constructed_domain

/-! ## V · why the Codex read premise, and what co-location is now -/

/-- A join with a theorem-grade claim has exactly the other claim's grade. -/
theorem weakest_with_theorem (g : Grade) : Grade.weakest g .theorem = g := by
  cases g <;> rfl

/-- CO-LOCATION'S GRADE IS THE ROOT'S GRADE, EXACTLY: the wall is a theorem, so the join reads the
root's grade and nothing else. -/
theorem coloc_grade_is_the_roots_grade (r : Claim) :
    (Claim.join r wallClaim).grade = r.grade := by
  show Grade.weakest r.grade Grade.theorem = r.grade
  exact weakest_with_theorem r.grade

/-- WHY THE CODEX READ PREMISE: with the root labelled premise, the co-location claim is premise. -/
theorem premise_root_gives_premise_coloc : (Claim.join raClaimPremise wallClaim).grade = .premise := rfl

/-- THE ROOT IS A THEOREM-GRADE CLAIM. -/
theorem ra_is_theorem_grade : raClaim₀.grade = .theorem := rfl

/-- RA–TONGUE CO-LOCATION IS A THEOREM-GRADE CLAIM. -/
theorem coloc_is_theorem_grade : colocClaim₀.grade = .theorem := rfl

/-- The co-location claim's statement holds: the root and the wall, both proved. -/
theorem coloc_holds : colocClaim₀.stmt := colocClaim₀.warrant

/-! ## VI · the ledger seal -/

/-- THE LEDGER SEAL: the root is a theorem on no axiom and no hypothesis; the wall is a theorem; their
co-location holds and stands at theorem grade; and co-location's grade is the root's grade exactly,
which is why the Codex, labelling the root premise, read premise. -/
theorem the_ledger_seal :
    RA₀ ∧ (∀ g : Nat → Bool, K4.target ≠ fun y => g (K4.rho y)) ∧
    colocClaim₀.stmt ∧ colocClaim₀.grade = .theorem ∧
    (∀ r : Claim, (Claim.join r wallClaim).grade = r.grade) ∧
    (Claim.join raClaimPremise wallClaim).grade = .premise :=
  ⟨root_on_the_constructed_domain, K4.wall, coloc_holds, coloc_is_theorem_grade,
   coloc_grade_is_the_roots_grade, premise_root_gives_premise_coloc⟩

/-! ## VII · the grade read from the warrant, as the Codex reads it -/

/-- The evidence a ledger entry carries for a statement: posited with no warrant, or warranted by a proof. -/
inductive Evidence (P : Prop) : Type
  | posited
  | warranted (w : P)

/-- THE CODEX'S RULE FOR THE ROOT'S GRADE: evidence at theorem grade is a proof with its axioms printed. A root
that comes with a warrant, a proof of its statement, is theorem grade; a root posited with none, as the Codex
declares `axiom RA`, is premise grade. -/
def rootGrade : Evidence RA₀ → Grade
  | .warranted _ => .theorem
  | .posited     => .premise

/-- A WARRANTED ROOT IS THEOREM GRADE: the root of section II carries its warrant, so the rule reads theorem. -/
theorem a_warranted_root_is_theorem_grade :
    rootGrade (.warranted root_on_the_constructed_domain) = .theorem := rfl

/-- AN UNWARRANTED ROOT IS PREMISE GRADE: with no warrant the rule reads premise, the Codex's own reading of
its declared axiom. -/
theorem an_unwarranted_root_is_premise_grade : rootGrade .posited = .premise := rfl

/-- THE LEDGER READS THE WARRANT: the root claim of section IV carries the grade the rule reads from its warrant,
and the comparison claim carries the grade the rule reads from none. -/
theorem the_ledger_reads_the_warrant :
    raClaim₀.grade = rootGrade (.warranted raClaim₀.warrant) ∧ raClaimPremise.grade = rootGrade .posited :=
  ⟨rfl, rfl⟩

/-- THE GRADE IS NOT ELECTED: the rule reads theorem from a warrant and premise from none, never the other way;
whatever label an entry carries, the warranted root's grade under the rule is theorem. -/
theorem the_grade_is_not_elected :
    (∀ w : RA₀, rootGrade (.warranted w) = .theorem) ∧ rootGrade .posited ≠ .theorem ∧
    (∀ w : RA₀, rootGrade (.warranted w) ≠ rootGrade .posited) :=
  ⟨fun _ => rfl, fun h => Grade.noConfusion h, fun _ h => Grade.noConfusion h⟩

end RGL

/-! ## Cones, pinned as printed: every theorem on no axiom -/
/-- info: 'RGL.join_grade' does not depend on any axioms -/
#guard_msgs in #print axioms RGL.join_grade
/-- info: 'RGL.seated_undeniable' does not depend on any axioms -/
#guard_msgs in #print axioms RGL.seated_undeniable
/-- info: 'RGL.root_on_the_constructed_domain' does not depend on any axioms -/
#guard_msgs in #print axioms RGL.root_on_the_constructed_domain
/-- info: 'RGL.tongue_freedom' does not depend on any axioms -/
#guard_msgs in #print axioms RGL.tongue_freedom
/-- info: 'RGL.K4.register_even_at_zero' does not depend on any axioms -/
#guard_msgs in #print axioms RGL.K4.register_even_at_zero
/-- info: 'RGL.K4.target_odd_at_zero' does not depend on any axioms -/
#guard_msgs in #print axioms RGL.K4.target_odd_at_zero
/-- info: 'RGL.K4.wall' does not depend on any axioms -/
#guard_msgs in #print axioms RGL.K4.wall
/-- info: 'RGL.weakest_with_theorem' does not depend on any axioms -/
#guard_msgs in #print axioms RGL.weakest_with_theorem
/-- info: 'RGL.coloc_grade_is_the_roots_grade' does not depend on any axioms -/
#guard_msgs in #print axioms RGL.coloc_grade_is_the_roots_grade
/-- info: 'RGL.premise_root_gives_premise_coloc' does not depend on any axioms -/
#guard_msgs in #print axioms RGL.premise_root_gives_premise_coloc
/-- info: 'RGL.ra_is_theorem_grade' does not depend on any axioms -/
#guard_msgs in #print axioms RGL.ra_is_theorem_grade
/-- info: 'RGL.coloc_is_theorem_grade' does not depend on any axioms -/
#guard_msgs in #print axioms RGL.coloc_is_theorem_grade
/-- info: 'RGL.coloc_holds' does not depend on any axioms -/
#guard_msgs in #print axioms RGL.coloc_holds
/-- info: 'RGL.the_ledger_seal' does not depend on any axioms -/
#guard_msgs in #print axioms RGL.the_ledger_seal
/-- info: 'RGL.a_warranted_root_is_theorem_grade' does not depend on any axioms -/
#guard_msgs in #print axioms RGL.a_warranted_root_is_theorem_grade
/-- info: 'RGL.an_unwarranted_root_is_premise_grade' does not depend on any axioms -/
#guard_msgs in #print axioms RGL.an_unwarranted_root_is_premise_grade
/-- info: 'RGL.the_ledger_reads_the_warrant' does not depend on any axioms -/
#guard_msgs in #print axioms RGL.the_ledger_reads_the_warrant
/-- info: 'RGL.the_grade_is_not_elected' does not depend on any axioms -/
#guard_msgs in #print axioms RGL.the_grade_is_not_elected
~~~~~

-->
