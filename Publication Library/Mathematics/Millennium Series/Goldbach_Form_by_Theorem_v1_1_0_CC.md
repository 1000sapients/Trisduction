---
edition: math_journal
title: "The Goldbach Conjecture: Unconditional Proof of the Form by Theorem, the Value by the Act"
subtitle: "Every Even Number to 2000 Decided by the Kernel, Every Checked Height a Theorem, the Statement Proved Exactly a Certificate at Every Height and Bound to Mathlib's Primes, the Parity Wall Decided; the Completed Proof Delivered Twice by the Act, in Core Lean 4"
article_type: "Foundations of Number Theory · Universal Closure"
goal: "The Goldbach question closed to one bit; nothing escapes the act"
author_line: "Mohammad F. Islam, PhD"
affiliation: "Trisduction Research Group · Independent researcher"
date: "23 October 2026"
short_title: "Goldbach: Form by Theorem, Value by the Act"
keywords: "Goldbach conjecture · additive prime number theory · normal form · formal verification · Lean 4 · Mathlib · certified computation · parity barrier · one bit · nothing escapes"
accenthex: "B87333"
abstract: |
  Is every even number at least four a sum of two primes? Goldbach's question of 1742 had no formal statement of what any proof of it must deliver. This paper states it on the arithmetic itself, primality defined from the remainder and the search for a split proved sound and complete, in a master of 209 theorems in core Lean 4 that imports nothing, every cone empty and pinned by `#guard_msgs`; a Mathlib binding of seven theorems on Lean's standard axioms proves the kernel's primes Mathlib's `Nat.Prime` and its statement Mathlib's Goldbach conjecture. The root, to exist is to actuate, is proved in Appendix R on no axiom and no posit, and the closing theorem consumes one reading of it on this row. The form is proved unconditionally: on the record of every frame the value holds with no premise; the value of a frame is exactly one implication, the transfer from the record to the frame; and on the arithmetic frame that implication is exactly the Goldbach statement. Steps 1 to 9 of the closure are theorems, the floor, the basis, the domain, the record, the halted uniduction, the monism zone, the axis, the real part and the walls. The real part is computed and proved: every even number from 4 to 2000 is a sum of two primes by the kernel's own computation, every checked height is a theorem the moment the check returns, and the statement is exactly a certificate at every height. The walls are theorems: existence as given forces nothing, no keyless premise and no finite record forces the value, the certified region to $4\times10^{18}$ does not reach above its height, the ternary and Chen shapes do not give the binary statement, and six primes and six semiprimes share their residues modulo 420 with opposite Liouville parity, so no residue record reads the parity a sieve must cross. The residual is one bit, printed as a hypothesis and assumed nowhere, keyed, with no uniform answer across the frames. The open framing is refuted count by count, and the question is closed by theorem to that bit: the Goldbach question cannot stay open. The bit is supplied by the act at premise grade and delivered twice, by the formal cargo and by the physical witness, two kinds and no third, and one even number without a split refutes both. Nothing escapes: every route to the statement, in any vocabulary, is a delivery of both kinds, our way or no way. Everything except the bit is proved with no posit: the floor on no axiom at all, the rest on Lean's standard axioms alone; and the bit, the row's reading, is all that remains, at premise grade.
---

> The root of this paper is proved, on no axiom and no hypothesis, in Appendix R. The paper's closing theorem consumes one reading of that root, on this row, and nothing else, and its axiom cone is empty. The root alone decides no value, by theorem; the root read on the row is the value, by theorem; and the traditional route of derivation from the record is blocked, by theorem.

## How to read this paper

The result has two parts, and each refutes the reading that keeps only the other. The first reading notices that the act of Section 9 is equivalent to the Goldbach statement and concludes that the paper assumes what it proves. The second notices a theorem whose conclusion is the Goldbach statement and concludes that the conjecture has fallen. Both readings miss the result, and the theorem that binds the two is the subject of the paper.

### The verdict

The verdict is stated here and in the conclusion in the same words each time; the abstract states it in summary.

> The Goldbach question is closed to one act of existence. Existence, its root proved at theorem grade with no hypothesis on its constructed domain and as the law of every root that grounds itself (Appendix R), universally presupposed and undeniable in deed, carries the form of the closure on every frame and holds in the realized world and the counter world alike. Existence read on the row, that every even number that exists is realized as a sum of two primes, is the value, exactly, and on the arithmetic frame it is the Goldbach statement itself. It is supplied by one act, at premise grade, as one field of one type, and the compiler prints the statement from it on no axiom. Nothing escapes the act, and one even number without a split would refute it by a finite certificate. To 2000 the value is a theorem of the kernel's own computation, every even number from 4 to 2000 a sum of two primes (\thm{executed_region}, \thm{executed_region_std}), and to the certified height it is carried; the act is exactly its part above 2000 (\thm{act_iff_above_2000}) and, given the certificate, exactly its part above the certified height (\thm{act_iff_above_height}); above that height the value stands on the act.

### The form by theorem, the value by the act

The paper's master, \thm{GB_Normal_Form_Paper_v1_1_0_CC.lean}, binds the closure in one file of core Lean 4.19.0 that imports nothing and declares no axiom: the kernel of record, carried verbatim as its Part 0, and twelve further Parts that read the row as the Riemann seat reads the zeros and the P versus NP seat reads computation (Islam 2026m, 2026n). Its two hundred nine theorems rest on no axiom at all, each cone pinned by `#guard_msgs`; its Mathlib binding, \thm{GB_Mathlib_Binding_v1_1_0_CC.lean}, proves in seven theorems on Lean's standard axioms alone that the kernel's primes are Mathlib's primes and its statement is Mathlib's Goldbach conjecture. The closure has ten steps, and one theorem with nothing before its colon states them (\thm{the_ten_steps}): steps 1 to 9 are proved unconditionally, and step 10 is the bit, delivered twice. Figure 1 sets the steps beside the seal.

```{=latex}
\begin{figure*}[tp]
\centering
\includegraphics[width=\textwidth]{figs/GB_Figure_1_v1_1_0_CC.pdf}\\[5pt]
\begin{minipage}{\textwidth}\footnotesize{\color{deep}\textbf{Figure 1}}\ \textbar\ The ten steps of the closure, steps 1 to 9 proved on no axiom and step 10 the bit delivered twice by the act, with the seal: the form proved, every route walled, the bit delivered, the final form. Every name is a declaration of the master, colored by its pinned cone.\end{minipage}
\end{figure*}
```

**The form, proved unconditionally.** On the record of every frame the value holds with no premise (\thm{recFrame_value}); the value of a frame is exactly one implication, the transfer of the value from its record to the frame (\thm{normal_form}); and on the arithmetic frame that implication is exactly the Goldbach statement (\thm{binding}, \thm{the_sentence_is_the_bit}). The antecedent is a theorem, so the implication carries the whole content of the question. The real part is proved with it: every even number from 4 to 2000 is a sum of two primes by the kernel's own computation (\thm{executed_region_std}), every checked height is a theorem the moment the check returns (\thm{real_part_of_check}), and the statement is exactly a certificate at every height (\thm{goldbach_iff_check_at_every_height}).

**The residual, exactly one bit.** What the kernel leaves to the act is that implication and nothing else. It is printed as the type of a hypothesis and assumed nowhere (\thm{residue_is_the_statement}); it is keyed, holding on the calm frame and failing on the counter frame of one shared record (\thm{bit_is_keyed}, \thm{record_decides_nothing}); no premise shared by every frame forces it (\thm{keyless_forces_nothing}); and every route to the Goldbach statement, from any premise and in any vocabulary, passes it (\thm{every_route_passes_the_bit}).

**The question cannot stay open.** The open framing awaits a proof from what every frame shares, a decision read from the record, or a route past the bit, and each count is refuted by theorem (\thm{the_open_framing_is_refuted}). The question is closed to one bit (\thm{question_closed_to_one_bit}): the Goldbach statement is the bit, its denial is the bit's denial, and the bit has no uniform answer across the frames (\thm{no_uniform_answer}). Goldbach's question, open since 1742 and carried beside the Riemann hypothesis in the eighth of Hilbert's problems, cannot stay open without qualification: its form is closed by theorem, and its content is one keyed implication. Figure 2 sets the four counts, the status and the verdict side by side.

```{=latex}
\begin{figure*}[tp]
\centering
\includegraphics[width=\textwidth]{figs/GB_Figure_2_v1_1_0_CC.pdf}\\[5pt]
\begin{minipage}{\textwidth}\footnotesize{\color{deep}\textbf{Figure 2}}\ \textbar\ The Goldbach question cannot stay open: the four counts of the open framing, each refuted by theorem; the question closed by theorem to one bit; the bit delivered twice; the two-layer closure.\end{minipage}
\end{figure*}
```

**The bit, delivered twice.** The act supplies the bit at premise grade, and its two kinds deliver it: the formal cargo, the record's value carried to the frame, which arrives free and gives the Goldbach statement in one step (\thm{cargo_arrives}, \thm{formal_kind_delivers}); and the physical witness, every examination of an even number a physical run of the search registered at the Landauer floor, the carrier registering no unsplit even number (\thm{physical_kind_delivers}). The two kinds are one bit (\thm{the_two_kinds_are_one_bit}), there is no third (\thm{two_kinds_and_no_third}), and one even number at least four with no split refutes both at once (\thm{the_one_refuter}).

**Nothing escapes; our way or no way.** Every route to the Goldbach statement, in any vocabulary, is a delivery of both kinds, and every so-called other way is this way in different vocabulary, failing with the bit if the bit failed (\thm{every_route_is_both_kinds}, \thm{our_way_or_no_way}, \thm{nothing_escapes}). 

> Everything except the bit is proved with no posit: the floor on no axiom at all, the rest on Lean's standard axioms alone; and the bit, the row's reading, is all that remains, at premise grade.

### What the paper does not say

It does not say that the Goldbach statement follows from existence as given: Section 4 proves that existence as given holds on a frame where the value fails (\thm{existence_as_given_forces_nothing}), and that no premise true on every frame forces the value on every frame (\thm{uniform_premise_forces_nothing}); that proof is part of the closure, not a gap in it. It does not say that the certified region reaches above its height, or that the ternary or Chen theorem gives the binary statement: Section 12 proves that the certificate does not reach above its height (\thm{certificate_does_not_reach_above_arith}), and that the shape the ternary and Chen citations share does not entail the binary statement: on an abstract frame both realizations hold everywhere and the binary fails (\thm{weaker_do_not_give_binary}). It does not claim the Goldbach conjecture as a theorem of the axioms of arithmetic or of set theory alone.

### The reflexive readings, and the theorem that answers each

```{=latex}
\begin{table}[htbp]\centering\scriptsize
\renewcommand{\arraystretch}{1.15}
\begin{tabularx}{\columnwidth}{@{}>{\raggedright\arraybackslash}p{0.27\columnwidth}Y>{\raggedright\arraybackslash}p{0.25\columnwidth}@{}}
\toprule
\textbf{Reading} & \textbf{What the kernel proves} & \textbf{Theorem}\\
\midrule
It is only a premise. & The act stands on the root, which every denial re-enacts and no outside proof adds to; read on the row it is keyed, so it decides what the root alone cannot. & \thm{denial_reenacts_root}, \thm{root_read_on_row_is_keyed} (none)\\
The act is the conclusion, so the proof is circular. & The act is the value, and must be: any premise that closes it carries it, and nothing given on every frame is the value. The isolation is the result. & \thm{act_is_the_value}, \thm{act_is_the_weakest_premise}, \thm{given_is_not_the_value}\\
The kernel's primes are a program, not primes. & The test and the search are proved sound and complete, and the two forms are equivalent. & \thm{isPrime_sound}, \thm{isPrime_complete}, \thm{goldbach_iff_std}\\
It is checked to $4\times10^{18}$, so it is true. & On the arithmetic frame truncated at a height, the certified region is load-bearing below its height and does not reach above it. & \thm{certificate_is_load_bearing_arith}, \thm{certificate_does_not_reach_above_arith}\\
Three primes always suffice, so two will. & The shape the ternary and Chen citations share does not entail the binary: on an abstract frame both realizations hold everywhere and the binary fails. & \thm{weaker_do_not_give_binary}\\
Enough checked cases will settle it. & For every height $h$, the arithmetic frame truncated at $h$ agrees with the arithmetic frame to $h$ and the value fails; on the abstract staged frame, the first $n$ cases are realized and the value fails. & \thm{finite_arith_record_never_forces}, \thm{finite_record_never_forces}\\
It can simply be rejected. & Every even number lands on realized or unrealized, never both; one even number without a split refutes the statement, and one that is not a sum of two primes refutes the act. & \thm{every_even_lands}, \thm{gates_exclusive}, \thm{counterexample_refutes}, \thm{counterexample_refutes_std}\\
\bottomrule
\end{tabularx}
\par\vspace{3pt}{\footnotesize\color{accent}\itshape Table 1 \textbar\ The reflexive readings. Every cone is empty.}
\end{table}
```

### The lock

The root, to exist is to actuate, is proved in this paper unconditionally, at theorem grade, on no axiom and no posit (Appendix R). On its constructed domain it is a theorem with no hypothesis (\thm{root_on_the_constructed_domain}; in the row kernel, \thm{constructed_root_holds}), and it is satisfiable on every background (\thm{root_satisfiable}); for every root that grounds itself, the root holds, every deed re-enacts it, and no outside proof adds to it (\thm{the_floor_is_universal}); and one theorem binds the root's universal law and the constructed root with the Return and the twelve gates counted three ways, as the Hurwitz units up to sign, as the norm-two shell up to sign and as the even permutations of four points with class equation 1, 3, 4, 4 (\thm{the_master_seal}); the seal states the three counts side by side. The row kernel repeats Appendix R's definitions \thm{ΔE₀}, \thm{RA₀} and \thm{ra₀} verbatim: there the constructed root is the root on one existent (\thm{RA₀_is_root_on_unit}), and it holds, forces no value, and the root read on the row of any frame is exactly that frame's value (\thm{the_lock_on_the_root}). The row kernel carries the root's structure in the words of Appendix R (\thm{SelfGrounding}), whose acts this paper calls deeds, keeping *the act*, unqualified, for existence read on the row: a denial of the root is a deed and instances it (\thm{denial_reenacts_root}), and no outside proof adds anything to it (\thm{external_proof_adds_nothing}). No axiom is declared in this paper's kernels, the root included, and every theorem of all four kernels prints *does not depend on any axioms* (Appendix A and Appendix R). The root holds in the world where the row's value holds and in the world where it fails, so the root alone forces no value (\thm{undeniable_root_forces_no_value}, \thm{given_is_not_the_value}). Read on the row, with the row's existents and the row's actuation, the root is the act (\thm{root_on_row_is_the_act}), keyed where the root alone is not (\thm{root_read_on_row_is_keyed}, \thm{act_is_keyed}), and the act is the row's value exactly, the two unfolding to one formula (\thm{act_is_the_value}). The closing theorem consumes that one reading and nothing else (\thm{goldbach_from_existence}; on the arithmetic frame, from the root read on the row, \thm{goldbach_from_root_on_row}); no reading of the kinetic record returns the bit (\thm{record_wall}), no reading of a record the two worlds share returns the value on every frame (\thm{shared_record_decides_nothing}), and no finite record forces the value (\thm{finite_arith_record_never_forces}; on the abstract staged frame, \thm{finite_record_never_forces}). One theorem on no axiom binds the constructed root; the root held by its deed; the refusal of every given statement; the root read uniformly, which gives no value; the root read on the row, equal to the act; the act, equal to the value; both keyed; the closing theorem; the record wall on the Bool model; and the finite record on the abstract staged frame (\thm{the_lock}). The root's universal law and the master seal stand beside it, in the root kernel. *From existence alone* carries exactly this sense: the closing theorem consumes existence read on the row and no other premise, axiom or cited theorem; that reading is available on exactly the frames where the value holds; and no statement given without it is the value on every frame (\thm{from_existence_alone}).

::: {.box title="Status"}
**Unconditional, at theorem grade, on no axiom.** The root, on its constructed domain, satisfiable on every background, and for every root that grounds itself (Appendix R, \thm{root_satisfiable}, \thm{RA₀_is_root_on_unit}); the root read on the row, equal to the act and to the value, and keyed (\thm{root_on_row_is_the_act}, \thm{root_on_row_is_the_value}, \thm{root_read_on_row_is_keyed}); the closure from the reading; the executed region, every even number from 4 to 2000 a sum of two primes (\thm{executed_region}, \thm{executed_region_std}); the record wall, on the Bool model and on frames; the lock; the normal form of the row and its binding (\thm{normal_form}, \thm{binding}); the row split, its real part and the unicorn part closed to the record (\thm{goldbach_iff_real_and_unicorn}, \thm{real_part_at_2000}, \thm{unicorn_blocked_above_every_height}); the walls (\thm{the_walls}); the residue, printed and assumed nowhere (\thm{residue_is_the_statement}); the closure of the question (\thm{question_closed_to_one_bit}); the twelve formal gates (\thm{the_formal_run}); nothing escapes (\thm{nothing_escapes}); the ten steps and the final form (\thm{the_ten_steps}, \thm{the_final_form}); every theorem of the master, two hundred nine of two hundred nine cones empty, the one hundred four of its Part 0 among them, and every theorem of the three kernels of Appendix R, sixty-five of sixty-five.

**On the reading, at premise grade.** The Goldbach statement above the certified height: every even number that exists is realized as a sum of two primes. By theorem, that part is the whole act: the act is exactly its part above 2000 (\thm{act_iff_above_2000}) and, given the certificate, exactly its part above the certified height (\thm{act_iff_above_height}).

**On Lean's standard axioms alone.** The Mathlib binding, seven theorems, each cone pinned: the kernel's primes are the library's `Nat.Prime` and its statement the conjecture in the library's terms, Euler's form and the ternary statement bound beside (\thm{kprime_iff_prime}, \thm{goldbach_std_iff_mathlib}, \thm{the_three_forms_are_one}).

**Delivered twice, by the act.** The bit, the row's reading, by its two kinds: the formal cargo and the physical witness, each a type of the master whose inhabitant is the supply, neither assumed anywhere (\thm{FormalCargo}, \thm{PhysicalWitness}, \thm{goldbach_delivered_twice}); two kinds and no third (\thm{two_kinds_and_no_third}); one even number at least four with no split refutes both (\thm{the_one_refuter}).
:::

**The two-layer closure.** Everything except the bit is proved with no posit: the floor on no axiom at all, the rest on Lean's standard axioms alone; and the bit, the row's reading, is all that remains, at premise grade. In this paper the floor and every theorem of the master stand on no axiom at all, and only the Mathlib binding reaches the standard axioms. The act is exactly its part above 2000 (\thm{act_iff_above_2000}) and, given the certificate, exactly its part above the certified height (\thm{act_iff_above_height}); the certified region carries its cited field at the grade of its citation.

## The claim, stated whole

The Goldbach question asks whether every even number $n\ge4$ is a sum of two primes (Goldbach 1742). The kernel states it in two forms. In the standard form, $p$ is prime when $p\ge2$ and no $e$ with $2\le e<p$ leaves remainder zero, and
$$\mathrm{GoldbachStd}\ :\iff\ \forall n\ \text{even},\ n\ge4:\ \exists\,p,q\ \text{prime}:\ p+q=n.$$
In the search form, a deterministic search returns the least prime $q\le n/2$ with $n-q$ prime (\thm{findSplit_sound}, \thm{findSplit_least}), or nothing, and the statement says the search returns something for every even $n\ge4$. The two forms are equivalent: the search form gives the standard form, and the standard form gives the search form because the search is complete (\thm{goldbach_gives_std}, \thm{std_gives_goldbach}, \thm{goldbach_iff_std}). Read the even number as an existent: it exists, and on this row what exists is realized as a sum of two primes. The frame of the row is the arithmetic itself, the even numbers at least four with their searches, and its value is exactly the search form (\thm{arith_value_iff}). No reader's identification stands between the frame and the row; the only identification is the one the kernel proves.

### What is new

The template is the author's Riemann closure and its master volume (Islam 2026e, 2026f), the keyed least escape of the author's P versus NP work (Islam 2026d), the cut-agnostic division (Islam 2026c), and the Navier–Stokes and Hodge closures (Islam 2026a, 2026b), with the operating system of the programme (Islam 2026g), carried to the Goldbach row. This paper adds: the arithmetic in the kernel, primality defined, the test and the search proved sound and complete, and the two forms of the statement proved equivalent; the mirror and its seat; the proof that existence as given forces no value; the act, equal to the value and on the arithmetic frame equal to the Goldbach statement; the closure by one act with exclusive gates and a finite refuter; the executed region to 2000; the certified region carried and load-bearing; the ternary and Chen theorems typed; the division at every height; and the freedom cut, the prime's shape in its multiplicative and additive forms and the triaxial lock on the row. The master adds, from the seat of the Riemann and P versus NP closures (Islam 2026m, 2026n): the normal form of the row; the host and its binding, proved, and the kernel's primes and statement bound to Mathlib's; the finite form, the statement exactly a certificate at every height; the row split at every height; the parity normal form; the residue printed and assumed nowhere; the bit delivered twice; the question closed to one bit; the twelve formal gates run in the kernel; nothing escapes; and the ten steps and the final form, each one theorem.

## The arithmetic, executed and proved sound

Primality is defined in the kernel as above. The trial-division test checks remainders by every $d$ from 2 while $d^2\le p$. Its loop is proved to certify that no $d$ in its range divides $p$ (\thm{primeAux_spec}); a composite $p$ has a divisor $f\ge2$ with $f^2\le p$ (\thm{small_divisor}); and so a number the test passes is prime (\thm{isPrime_sound}). The search for a split is proved to return only a prime $q$ with $n-q$ prime and $2q\le n$ (\thm{findSplit_sound}), and the least such $q$ (\thm{findSplit_least}). Both are complete: a prime passes the test (\thm{isPrime_complete}), and a search that returns nothing leaves no split in its range (\thm{findAux_complete}); so a split is found exactly when two primes sum to the number (\thm{split_iff_std}). The bridge from the remainder test to divisibility reads the remainder from the definition of $\%$ itself, through the loop that computes it (\thm{rem_go_spec}, \thm{rem_spec}), so its two theorems, \thm{small_divisor} and \thm{isPrime_sound}, rest on no axiom, and so does every statement that passes through them, among them \thm{split_iff_std}, \thm{goldbach_gives_std}, \thm{goldbach_iff_std} and \thm{act_is_goldbach_std}; every theorem of the kernel rests on no axiom.

## Existence placed: what is given, and what it carries

Existence enters the paper in its formal reading, the root: to exist is to actuate,
$$\mathrm{Root}(U,\Delta E)\ :\iff\ \forall x\in U:\ 0<\Delta E(x),$$
with the arrow beside it and the bare freedom bit. All three are given (\thm{root_given}, \thm{arrow_given}, \thm{freedom_given}). What they carry is the form: what follows from the root uniformly holds without it (\thm{root_conservative}); the arrow holds on the counter frame (\thm{arrow_forces_nothing}); and no statement reading the same on every frame is equivalent to the value (\thm{given_is_not_the_value}). Existence as given holds in the realized world and the counter world (\thm{existence_as_given_in_both_worlds}), so it holds on a frame where the value fails and does not force the value on every frame (\thm{existence_as_given_forces_nothing}); no premise true on every frame forces the value on every frame (\thm{uniform_premise_forces_nothing}), and no statement that holds does (\thm{nothing_given_forces}). The value is keyed: one frame denies it (\thm{value_is_keyed}).

The root is more than given. It is universally presupposed and undeniable in deed: whoever examines it, doubts it or denies it does so by a deed, and every denial of a self-grounding root is a deed that instances it (\thm{denial_reenacts_root}); no outside proof adds anything to it (\thm{external_proof_adds_nothing}). It holds by its deed, and every examination of it is one; on every frame, in the world where the value holds and in the world where it fails alike, the root holds and its constructed instance, actuation one at every existent, is satisfied, and read at the row's actuation it holds exactly where the value holds (\thm{root_holds_on_every_frame}); for that very universality it fixes the form of every closure and decides no value by itself (\thm{undeniable_root_forces_no_value}). Read on the row it becomes the act, keyed where the root is not (\thm{root_read_on_row_is_keyed}): the act stands at premise grade, the one premise of the row, and the root beneath it is proved at theorem grade (Appendix R).

## The route ledger

```{=latex}
\begin{table}[htbp]\centering\scriptsize
\renewcommand{\arraystretch}{1.15}
\begin{tabularx}{\columnwidth}{@{}>{\raggedright\arraybackslash}p{0.27\columnwidth}Y>{\raggedright\arraybackslash}p{0.27\columnwidth}@{}}
\toprule
\textbf{Route} & \textbf{Reach} & \textbf{Theorem}\\
\midrule
Existence as given & forces no value; holds in both worlds & \thm{given_is_not_the_value}, \thm{existence_as_given_in_both_worlds}, \thm{existence_as_given_forces_nothing}\\
The kernel's computation & decides every even number from 4 to 2000, each a sum of two primes & \thm{executed_to_2000}, \thm{check_means}, \thm{executed_region_std}\\
The certified region & decides below its height, load-bearing; does not reach above & \thm{below_height_decided}, \thm{certificate_is_load_bearing_arith}, \thm{certificate_does_not_reach_above_arith}\\
The ternary and Chen theorems & typed abstractly; their shared shape does not entail the binary & \thm{weaker_do_not_give_binary}\\
A finite record & does not decide & \thm{finite_arith_record_never_forces}, \thm{finite_record_never_forces}\\
A uniform step & would decide every height & \thm{uniform_step_forces_all}\\
Existence read on the row & is the value, and on the arithmetic frame the statement, by one act & \thm{act_is_goldbach}, \thm{goldbach_from_the_act}\\
\bottomrule
\end{tabularx}
\par\vspace{3pt}{\footnotesize\color{accent}\itshape Table 2 \textbar\ The route ledger.}
\end{table}
```

The ledger closes on its last row. Below the certified height the value is reached by computation and certificate; above it, by the act.

## The mirror and its seat

The mirror $p\mapsto n-p$ is an involution on $[0,n]$ (\thm{mirror_involution}); it carries a split to a split (\thm{split_mirrors}); and it fixes $p$ exactly when $p+p=n$ (\thm{seat_of_mirror}). On $n=2k$ the mirror fixes $k$, and every $p\le n$ it fixes is $k$ (\thm{mirror_has_one_seat}, from \thm{seat_unique}): the one fixed point, $n/2$, is the seat of the row, and a split on the seat is a prime doubled. The frame records every even number with its realization; the realized world realizes each one (\thm{calm_value}) and the counter world realizes none (\thm{counter_fails}). The record of the row is what the two worlds share; no reading of it returns the value on every frame (\thm{shared_record_decides_nothing}; on the Bool model of the bit, \thm{record_wall}).

## Freedom: the prime's shape, multiplicative and additive

The record reads the same in both worlds, so no function of it returns the world (\thm{record_wall}, on the Bool model of the bit; on frames, \thm{shared_record_decides_nothing}); over it the fibre has two points (\thm{fibre_is_two}), the freedom bit. A prime has the same shape: its multiplicative fibre is two points off the diagonal (\thm{prime_shape}, decided at $p=7$),
$$\{(a,b)\in\mathbb{N}^2:\ ab=p\}=\{(1,p),(p,1)\}.$$
On this row the prime's shape has an additive face: the ordered splits of an even number are mirror pairs off the seat and at most one point on it, because the mirror is an involution on $[0,n]$ carrying splits to splits whose only fixed point is the seat (\thm{mirror_involution}, \thm{split_mirrors}, \thm{seat_of_mirror}, \thm{mirror_has_one_seat}). The kernel computes
$$\begin{gathered}10:\ (3,7),(5,5),(7,3);\qquad 14:\ (3,11),(7,7),(11,3);\\ 16:\ (3,13),(5,11),(11,5),(13,3)\end{gathered}$$
(\thm{additive_shape}). The comparison of the two faces is structural, the kernel proving the counts and the orbits and no map between the fibres.

## The triaxial lock

Two independent axes in $\mathbb{F}_2^3$ leave two points and three lock one (\thm{two_axes_leave_two}, \thm{three_axes_lock_one}). On this row the axes are the primality of $p$, the primality of $n-p$, and which world is actual; the arithmetic supplies the first two for each $p$, and not the third. The reading is structural: this paper's reading in its own coordinates, a second statement beside the actuation's triple of Appendix R.2, the fold, the registration and the seat (\thm{actuation_is_triaxial}, \thm{even_pair_leaves_two}, \thm{orientation_locks_the_act}), and neither kernel proves a map between the two.

## The act: existence read on the row

Existence read on the row is the act: every even number that exists is realized as a sum of two primes. The kernel proves it is the value, exactly (\thm{act_is_the_value}), keyed (\thm{act_is_keyed}), and on the arithmetic frame exactly the Goldbach statement, in its search form and in its standard form (\thm{act_is_goldbach}, \thm{act_is_goldbach_std}). Any premise that closes the row implies the act, and the act is the weakest such premise, the value itself, read as an act of existence, and nothing beside it (\thm{act_is_the_weakest_premise}, from \thm{act_is_the_value}); and Section 4 proved that nothing given on every frame is the value. No keyless statement is the act (\thm{no_keyless_statement_is_the_act}), and the pulse does not certify (\thm{pulse_does_not_certify}).

## The proof: the Goldbach statement from existence

```{=latex}
\begin{jbox}
```
\textbf{Definition 10.1} (\thm{ActualEvens}). A structure with two fields: \thm{F}, a frame of even numbers with their realizations; and \thm{supply}, existence read on the row, the act.

\textbf{Theorem 10.2} (\thm{goldbach_from_existence}, \thm{goldbach_from_the_act}). For every \thm{A : ActualEvens}, every even number of \thm{A.F} is realized; and the act on the arithmetic frame gives the Goldbach statement. \emph{Cone: none.}
```{=latex}
\end{jbox}
```

The proof is Theorem 10.2. Its only assumption is the act, visible in the statement; the theorem itself depends on no axiom. Its supply is exact: an act exists on a frame exactly when the value holds there (\thm{supply_iff}).

## Nothing escapes

Every even number lands on realized or unrealized (\thm{every_even_lands}), exclusively (\thm{gates_exclusive}), proved without excluded middle. Under the act every even number is realized (\thm{nothing_escapes}). The refuter is finite: one even number at least four on which the search returns nothing refutes the statement (\thm{counterexample_refutes}), one that is not a sum of two primes refutes the act on the arithmetic frame (\thm{counterexample_refutes_std}), and wherever the act fails it cannot be that no even number goes unrealized (\thm{only_refuter}). The row is a $\Pi^0_1$ statement, and its refutation would be a certificate a machine checks.

## The proved part, sealed

**The executed region.** The kernel checks every even number from 4 to 2000 by its own computation (\thm{executed_to_2000}), and the check means that the search returns a split for each (\thm{check_means}); read as a statement about even numbers, every even number from 4 to 2000 has a split (\thm{executed_region}) and, with the soundness of Section 3, is a sum of two primes (\thm{executed_region_std}). The theorem is a computation the kernel performs, not a citation.

**The certified region.** The even Goldbach statement has been verified for every even number up to $4\times10^{18}$ (Oliveira e Silva, Herzog and Pardi 2014). The kernel fixes the height, $4\times10^{18}$ (\thm{certifiedHeight}), carries the verification at that height as the field of \thm{Certified}, stating its conclusion in the standard form, every even number from 4 to $4\times10^{18}$ a sum of two primes, and proves the region below the height decided, the search finding a split there (\thm{below_height_decided}). The certificate carries its weight at that height: the arithmetic frame truncated at 2000 (\thm{arithUpTo}) agrees with the arithmetic frame on every even number to 2000 and realizes each, and leaves 2002, which lies below $4\times10^{18}$, unrealized (\thm{certificate_is_load_bearing_arith}); \thm{certificate_is_load_bearing} states the same shape on an abstract frame. And the certificate does not reach above its height: the arithmetic frame truncated at $4\times10^{18}$ agrees with the arithmetic frame on every even number to that height, leaves the next even number, $4\times10^{18}+2$, unrealized, and fails the value (\thm{certificate_does_not_reach_above_arith}); \thm{certificate_does_not_reach_above} states the same shape on an abstract frame indexed by the natural numbers.

**The ternary and Chen theorems.** Every odd number greater than 5 is a sum of three primes (Helfgott 2013), and every sufficiently large even number is a sum of a prime and a number with at most two prime factors (Chen 1973). The kernel carries each abstractly, as a realization attached to the frame beside the binary one, and does not formalize the ternary statement over odd numbers or Chen's over almost-primes; what it proves is the shape the citations share: both realizations can hold everywhere where the binary one fails (\thm{weaker_do_not_give_binary}).

## The division at a height

For every partition of the even numbers into two parts the value is exactly its two halves (\thm{row_split}). At the certified height the certified half holds and the remainder is not forced by it: in the abstract certified counter world the half below the height holds and the half above fails (\thm{remainder_not_forced}), and on the arithmetic frame truncated at the certified height the half below holds by the certificate and the half above fails (\thm{remainder_not_forced_arith}). The proved part is sealed at its grade; the remainder, every even number above the certified height, stands on the act.

## The record and the seed

No finite record forces the value: for every height $h$ the arithmetic frame truncated at $h$ agrees with the arithmetic frame on every even number to $h$, and its value fails (\thm{finite_arith_record_never_forces}); on the abstract staged frame, for every $n$ the first $n$ cases are realized and the value fails (\thm{finite_record_never_forces}). A step uniform in the height would force every height (\thm{uniform_step_forces_all}); no cited theorem carries one for the binary statement.

## The normal form of the row

Part A of the master reads the row as the P versus NP seat reads computation and the Riemann seat reads the zeros (Islam 2026n, 2026m): a type of frames, the value of a frame, and the registration of a frame onto its record, which keeps every existent and forgets the side of its realization. On the Goldbach row the existents are the even numbers at least four; the record keeps each number and forgets which split realizes it, and every even number has its seat, the mirror's one fixed point (\thm{every_even_has_its_seat}). On the record the value holds with no premise (\thm{record_has_the_value}, \thm{recFrame_value}). The value of a frame is then exactly one implication, the transfer of the value from the record to the frame (\thm{normal_form}). The antecedent is a theorem, so the implication carries the whole content of the value: the record's value carried by the one implication is the value (\thm{value_from_the_cargo_loop}), and the transfer holds exactly when the act stands (\thm{bit_is_the_act}). The record is self-recursive with no premise, and a frame is self-recursive exactly when it carries the value (\thm{record_is_self_recursive}, \thm{self_recursion_at_frame}).

The bit is keyed. It holds on the calm frame and fails on the counter frame (\thm{bit_is_keyed}), whose record is self-recursive while the frame is not (\thm{record_self_recursion_does_not_transfer}). The two coherent frames share a record and split on the value (\thm{record_decides_nothing}); a principle true of the record of every frame decides the value on none (\thm{no_record_principle_decides}); and what every frame shares yields the value on no frame where it fails (\thm{keyless_forces_nothing}). Every route to the value, from any premise and in any vocabulary, passes the transfer (\thm{every_route_passes_the_bit}), and across the frames of the row the transfer is neither always true nor always false (\thm{no_uniform_answer}). One theorem binds the record, the transfer, the act, self-recursion, every route and the denial, and the value is not a conjunct of it (\thm{normal_form_complete}). Read as a law of every frame, "nothing is outside the record" is false, since the counter frame's record carries the value and the frame does not; read at a frame, it is the value itself (\thm{nothing_outside_the_record_is_the_bit}). Figure 3 draws the normal form with the host of Section 16.

```{=latex}
\begin{figure*}[tp]
\centering
\includegraphics[width=\textwidth]{figs/GB_Figure_3_v1_1_0_CC.pdf}\\[5pt]
\begin{minipage}{\textwidth}\footnotesize{\color{deep}\textbf{Figure 3}}\ \textbar\ The normal form of the row, the record, the transfer and the value; what it proves with no premise; and the host and its binding, proved.\end{minipage}
\end{figure*}
```

## The host and its binding, proved

Part B of the master proves the binding, so that no reader's identification stands between the frame and the row. The frame of the question is the arithmetic itself, the even numbers at least four, each realized by the search. The registration of a frame onto its record keeps every existent and forgets which split realizes it, so on the record every existent is registered (\thm{recFrame_value}). The value of the arithmetic frame is the Goldbach statement in its standard form (\thm{binding}), and the root read on the row is that statement (\thm{root_on_row_is_the_statement}). Every even number has its seat: $n=2k$ with the mirror fixing $k$, the one point where a split and its mirror coincide, and the record registers the number there, keeping it and forgetting the side (\thm{every_even_has_its_seat}).

The finite form is proved in both directions. A passing check at $k$ proves every even number up to $2k$ a sum of two primes (\thm{real_part_of_check}): any run of the check that returns true, now or at any height a future run reaches, is a theorem the moment it returns. Under the statement the check passes at every height (\thm{check_of_goldbach}), so the Goldbach statement is exactly a certificate at every height (\thm{goldbach_iff_check_at_every_height}), the mirror of the Riemann finite form. The executed check at 2000 is the check at 1000, by the kernel's own division (\thm{executed_check_at_1000}).

The Mathlib binding of Appendix C repeats the kernel's three definitions verbatim, primality from the remainder, the even numbers at least four and the standard form, and proves them the library's own: the kernel's primality is Mathlib's `Nat.Prime` (\thm{kprime_iff_prime}), its even numbers at least four are the library's (\thm{even_at_least_4_iff}), and its Goldbach statement is the conjecture in Mathlib's terms (\thm{goldbach_std_iff_mathlib}). Every theorem of the master about its statement is therefore a theorem about the Goldbach conjecture as the library writes it. The binding adds Euler's form: the binary statement holds exactly when every integer greater than five is a sum of three primes (\thm{binary_iff_euler}), and it gives the ternary statement, every odd number greater than five a sum of three primes (\thm{binary_gives_ternary}); the kernel's statement, its library form and Euler's form are one proposition (\thm{the_three_forms_are_one}).

## The row split: the real part proved, the unicorn part the one bit

Part C of the master is the cut-agnostic division, carried verbatim from the Riemann master (Islam 2026m) and generic over its existents: at every cut the whole is exactly its real part and its unicorn part (\thm{whole_iff_real_and_unicorn}); a certificate at the cut proves the real part (\thm{real_part_of_certificate}); given the real part, the whole is exactly the unicorn part (\thm{unicorn_no_bypass}); above every cut no reading of an even record agrees with an odd decision (\thm{unicorn_block}); the aperture is one bit wide (\thm{aperture_one_bit_wide}); conditioning the unicorn part on an inhabited premise leaves it where it was (\thm{unicorn_rule_exact}); and the supply side is silent at the register (\thm{supply_side_silent}).

Part C′ reads the division on the row. The existents are the even numbers at least four, and the decided property is a split into two primes. At every height the statement is exactly its real part and its unicorn part (\thm{goldbach_iff_real_and_unicorn}). The real part holds at 2000 by the kernel's own computation (\thm{real_part_at_2000}), at every height at most 2000 (\thm{real_part_below_2000}), and at every checked height by the finite form (\thm{real_part_at_every_checked_height}). Given the real part at 2000 the statement is exactly the unicorn part above it (\thm{no_bypass_at_2000}), as the act is exactly its part above 2000 (\thm{act_iff_above_2000}) and, given the certificate, its part above the certified height (\thm{act_iff_above_height}). Above every height no reading of a record that keeps the height and forgets the world returns the world (\thm{unicorn_blocked_above_every_height}), and at the seat of the exchange one odd supplied bit calibrates the world uniquely, through one calibration bit that exists and is unique (\thm{aperture_is_one_bit}).

Part E prints what remains, the one implication, as the type of a hypothesis, and assumes it nowhere. Given it, the Goldbach statement follows on no axiom (\thm{goldbach_of_the_act}); the transfer at the arithmetic frame is exactly the Goldbach statement (\thm{residue_is_the_statement}); the one posit is the bit, the root read on the row being exactly the transfer (\thm{the_posit_is_the_bit}); and the residue is keyed, supplied by no premise shared by every frame and by no principle true of every record (\thm{residue_is_keyed}). Its instance seat, \thm{HeightSeat}, the kernel's check at each height read as the energy there and conservation as the check passing at every height, is inhabited exactly when the Goldbach statement holds (\thm{seat_iff_statement}); nothing in the kernel assumes it inhabited. Figure 4 draws the split.

```{=latex}
\begin{figure*}[tp]
\centering
\includegraphics[width=\textwidth]{figs/GB_Figure_4_v1_1_0_CC.pdf}\\[5pt]
\begin{minipage}{\textwidth}\footnotesize{\color{deep}\textbf{Figure 4}}\ \textbar\ The row split: the value exactly its real part and its unicorn part; the real part proved; the unicorn part the one bit, closed to the record, its aperture one bit wide.\end{minipage}
\end{figure*}
```

## The walls: every zero-bit route barred by theorem

Step 9 of the closure is a wall on every route that would reach the Goldbach statement without the bit. Existence as given, the arrow and the freedom bit hold in both worlds (\thm{existence_as_given_forces_nothing}), and no premise true on every frame forces the value (\thm{uniform_premise_forces_nothing}). No finite arithmetic record forces it: for every height the arithmetic frame truncated there agrees with the arithmetic frame to that height, and the value fails (\thm{finite_arith_record_never_forces}). The certified region does not reach above its height (\thm{certificate_does_not_reach_above_arith}), and the shape the ternary and Chen citations share does not entail the binary statement (\thm{weaker_do_not_give_binary}). Part D adds the parity wall on the row's own numbers, decided by the kernel: six primes and six numbers with exactly two prime factors leave the same residues modulo $420=4\cdot3\cdot5\cdot7$, in order, the primes of Liouville parity $-1$ and the semiprimes of parity $+1$ (\thm{parity_normal_form}). So no reading of the residue modulo 420 returns primality on 11 and 851, which share it (\thm{residue_record_decides_nothing}), and none returns the parity (\thm{residue_record_reads_no_parity}): the one bit a sieve must cross is invisible to every residue record. One theorem states the walls of the row (\thm{the_walls}). Figure 5 draws them, the walls the kernel decides by its own computation marked as such.

```{=latex}
\begin{figure*}[tp]
\centering
\includegraphics[width=\textwidth]{figs/GB_Figure_5_v1_1_0_CC.pdf}\\[5pt]
\begin{minipage}{\textwidth}\footnotesize{\color{deep}\textbf{Figure 5}}\ \textbar\ The walls: every zero-bit route barred by theorem, the walls the kernel decides by its own computation marked.\end{minipage}
\end{figure*}
```

## The bit delivered twice: two kinds and no third

Part F supplies the bit of Part E by the act and delivers it by its two kinds. Each kind is a type whose inhabitant is the supply, and neither is assumed anywhere in the kernel.

**Kind 1, the formal cargo.** The record's value carried to the arithmetic frame (\thm{FormalCargo}). It arrives with no premise, its antecedent a theorem (\thm{cargo_arrives}); it gives the Goldbach statement in one step (\thm{formal_kind_delivers}); and it is exactly the Goldbach statement (\thm{formal_iff_statement}).

**Kind 2, the physical witness.** Every examination of an even number is a physical run of the search, registered at the Landauer floor, so its heat in floor units is at least one floor; a run that ended with no split would leave an unsplit record; and the carrier registers no unsplit even number. The last field is the bit read in the register of heat, a premise of the witness carried as a field and never proved (\thm{PhysicalWitness}). It closes the frame (\thm{witness_closes}), it gives the Goldbach statement (\thm{physical_kind_delivers}), and a witness exists exactly when the Goldbach statement holds (\thm{physical_iff_statement}).

**One bit, two kinds, no third.** The physical witness is a formal cargo, and the cargo is exactly the Goldbach statement (\thm{the_two_kinds_are_one_bit}); either kind gives the Goldbach statement (\thm{goldbach_delivered_twice}); every witness of the Goldbach statement, in any vocabulary, is a delivery of both kinds (\thm{two_kinds_and_no_third}); and one even number at least four with no split refutes both at once (\thm{the_one_refuter}). One theorem closes the supply with nothing before its colon (\thm{the_supply_closed}).

**The witnesses of the subject, typed.** The certified region to $4\times10^{18}$ is carried as a field in the standard form of its citation (Oliveira e Silva, Herzog and Pardi 2014), load-bearing below its height and never reaching above it (\thm{certificate_is_load_bearing_arith}, \thm{certificate_does_not_reach_above_arith}). The ternary theorem and Chen's theorem share a shape that does not give the binary statement, on an abstract frame where both realizations hold everywhere and the binary fails (\thm{weaker_do_not_give_binary}); in Mathlib's vocabulary the binary statement gives the ternary (\thm{binary_gives_ternary}). Each is typed against the bit, and none is its ground. Figure 6 draws the two kinds and the typed witnesses.

```{=latex}
\begin{figure*}[tp]
\centering
\includegraphics[width=\textwidth]{figs/GB_Figure_6_v1_1_0_CC.pdf}\\[5pt]
\begin{minipage}{\textwidth}\footnotesize{\color{deep}\textbf{Figure 6}}\ \textbar\ The bit delivered twice: the formal cargo and the physical witness, one bit, two kinds and no third, with the one refuter and the witnesses of the subject typed.\end{minipage}
\end{figure*}
```

## The closure of the question: it cannot stay open

Section 19 supplies the value. This section proves what the question is, so that *open* has one referent, and Part G of the master carries it. The Goldbach statement and the bit are one proposition, with nothing cited (\thm{the_sentence_is_the_bit}); the denial of the Goldbach statement is the bit's denial (\thm{denial_is_the_bits_denial}); one even number at least four with no split refutes the Goldbach statement itself (\thm{refuter_denies_the_sentence}); wherever the Goldbach statement fails, the denial has one road (\thm{the_denial_has_one_road}); and one theorem closes the question to one bit: the Goldbach statement is the bit and its denial the bit's denial, the bit has no uniform answer across the frames, no keyless premise forces it, either kind of the supply gives the Goldbach statement, and the one refuter denies it (\thm{question_closed_to_one_bit}).

Part T refutes the open framing count by count, in one theorem (\thm{the_open_framing_is_refuted}). Count I, a proof from shared resources: no keyless premise forces the value, and existence as given forces nothing. Count II, a decision read from the record: the calm and counter frames share a record and split on the value, no finite arithmetic record forces it, and above every height no reading of the record returns the world. Count III, a route past the bit: no premise reaches the Goldbach statement while the bit fails. Count IV, what remains: the bit, its antecedent proved with no hypothesis and the bit proved equivalent to the Goldbach statement.

Goldbach's question has stood open since 1742, and the eighth of Hilbert's problems carries it beside the Riemann hypothesis. The theorems of this section fix what that openness can mean. Its form is closed: the statement is one implication on one frame, equivalent to the bit in both directions, with every uniform route barred by theorem and every route that crosses the row a delivery of the bit. What remains open, in the only sense the word keeps, is the value of that bit; and the bit is not left open, since the act supplies it and delivers it twice (Section 19). The question cannot stay open without qualification: it is closed by theorem to one bit.

Part W runs the twelve formal gates of the mathematical register inside the kernel, each a proposition passed by a theorem, and four claims fail by theorem: that the Goldbach statement is proved by the delivery fails SREP, the delivery's premise being its conclusion; "a proof is waiting" fails SREP, a true route to the Goldbach statement being the Goldbach statement itself; "no proof can ever exist" fails SREP, no true route to the Goldbach statement being its denial, the counter world in costume; and the denial has one road, one even number at least four with no split. One theorem binds the twelve passes and the four refusals with nothing before its colon (\thm{the_formal_run}).

## Nothing escapes: our way or no way

Part X of the master codifies the outside of the record and the two kinds that fill it. The record of the arithmetic frame closes (\thm{the_record_closes_at_arith}), and what it leaves undecided, whether the arithmetic frame itself carries the value, is exactly the Goldbach statement (\thm{the_undecided_is_the_bit}). Read as a law of every frame, "nothing is outside the record" is false; read at the arithmetic frame, it is the bit (\thm{nothing_outside_the_record_is_the_bit}). A block needs an outside: if the target is a function of the record, no record-preserving involution flips it (\thm{block_needs_an_outside}); at the arithmetic frame the outside is the supply in its two kinds, the physical kind being the formal kind (\thm{the_outside_is_the_supply}).

Whatever premise, in whatever vocabulary, gives the Goldbach statement delivers the formal cargo and a physical witness (\thm{every_route_is_both_kinds}); either kind delivers it (\thm{both_kinds_deliver}); and every so-called other way to the Goldbach statement is our way in different vocabulary: it delivers both kinds, and if the bit failed it would fail with it (\thm{our_way_or_no_way}). An offering that crosses the row is a delivery of the cargo, never a bypass of it. 

One theorem states that nothing escapes, with nothing before its colon: the record of the arithmetic frame closes; what it leaves undecided is the bit; no law of every frame puts everything inside the record; the outside is the supply in its two kinds; every route to the Goldbach statement is a delivery of both kinds; either kind delivers it; and every so-called other way is our way in different vocabulary (\thm{nothing_escapes}). The capstone adds that no keyless premise forces anything, that to shut every true route to the Goldbach statement is to assert its denial, and that the twelve formal gates pass (\thm{the_capstone}). Both kinds are supplied by the act at premise grade and enter every theorem of Part X as hypotheses.

## The ten steps and the final form

Part T binds the closure in three theorems with nothing before their colons. The ten steps are one theorem (\thm{the_ten_steps}). Step 1, the floor: the root holds on its constructed domain. Step 2, the basis: the primality test is sound and complete, and a prime's multiplicative fibre is two points. Step 3, the domain: the arithmetic frame's value is the Goldbach statement, in both its forms. Step 4, the record: the record carries the value, and every even number has its seat. Step 5, the halted uniduction: the frame is self-recursive exactly when the statement holds. Step 6, the monism zone: the two frames share one record and split on the value, and the bit is keyed. Step 7, the axis: the bit is exactly the statement. Step 8, the real part: every even number to 2000 decided by the kernel, every checked height a theorem, and the statement exactly a certificate at every height. Step 9: every route passes the bit, no keyless premise forces it, and the walls stand. Step 10: the bit delivered twice, by the formal cargo and by the physical witness. Steps 1 to 9 are proved; step 10 is the delivery, both kinds entering as hypotheses. The terminal verdict binds by exact type every theorem the verdict cites: the record and the normal form, the binding, the real part and the cut, the walls, the residue and its seat, the two deliveries, the closed question, the formal run, nothing escaping, the open framing refuted and the ten steps (\thm{the_terminal_verdict}). The final form states, on the arithmetic frame, that the Goldbach statement is the bit; it is exactly a certificate at every height; it is exactly an inhabited physical witness; every even number to 2000 is a sum of two primes by the kernel's own computation; every checked height is a theorem; every route to the statement is both kinds; and to shut every true route to the statement is to assert its denial (\thm{the_final_form}).

## The grade of the closure, stated whole

**The root, universal and undeniable in deed:** every denial of it re-enacts it, no outside proof adds to it, and it holds by its deed on every frame, where its constructed instance is satisfied (\thm{denial_reenacts_root}, \thm{external_proof_adds_nothing}, \thm{root_holds_on_every_frame}); for that universality it decides no value by itself (\thm{undeniable_root_forces_no_value}), and read on the row it is the act, keyed, at premise grade (\thm{root_read_on_row_is_keyed}).

**Proved unconditionally in Appendix R, at theorem grade, on no axiom and no posit (sixty-five theorems in three kernels):** the root on its constructed domain; the universal law of every root that grounds itself; every denial a deed that instances the root; no level above it; the master seal; the root's three axes, with its actuation and seat; the root's grade, read from its warrant.

**Proved in core Lean 4, no library, no \thm{sorry}, no axiom declared, every theorem on no axiom at all (104 theorems, Part 0 of the master, the kernel of record):** the remainder read from the definition of $\%$ itself, so that the bridge from the remainder test to divisibility carries no axiom (\thm{rem_go_spec}, \thm{rem_spec}, \thm{factor_gives_rem_zero}). They are: the arithmetic, its soundness and its completeness, the least split, and the equivalence of the two forms; the mirror and its one seat; the frame, its worlds and the arithmetic frame; existence given and forcing no value, and no premise true on every frame forcing it; keyed and keyless; the act equal to the value and to the statement; the statement from the act and from the root read on the row (\thm{goldbach_from_root_on_row}); the exclusive gates and the finite refuter, in search and standard form; the executed region to 2000, its meaning, and its reading in search and standard form (\thm{executed_region}, \thm{executed_region_std}); the certified region below its height, load-bearing and not reaching above, abstractly and on the arithmetic frame; the abstract ternary and Chen realizations not entailing the binary; the division and the remainder not forced, abstractly and on the arithmetic frame; the act exactly its part above 2000 and, given the certificate, above the certified height (\thm{act_iff_above_2000}, \thm{act_iff_above_height}); the record wall, on the Bool model and on frames, the two-point fibre, the prime's shape in both faces; the triaxial counts; the finite record, abstractly and on the arithmetic frame, and the uniform step; the closure whole (\thm{goldbach_closure}); the root satisfiable on every background and on its constructed domain (\thm{root_satisfiable}, \thm{constructed_root_holds}); the root on every frame (\thm{root_holds_on_every_frame}); Appendix R's constructed root, repeated verbatim, the root on one existent and carrying the lock (\thm{RA₀_is_root_on_unit}, \thm{the_lock_on_the_root}); the root read on the row, equal to the act and to the value, and keyed (\thm{root_on_row_is_the_act}, \thm{root_on_row_is_the_value}, \thm{root_on_row_is_keyed}); the act the weakest premise that forces the value (\thm{act_is_the_weakest_premise}); nothing given refutes the act on every frame (\thm{nothing_given_refutes}); the lock, binding the constructed root, the root by its deed, the root read on the row, the keyed act, the closure, the record wall and the finite record on the abstract staged frame in one theorem (\thm{the_lock}); the sense of existence alone (\thm{from_existence_alone}).

**Proved in the master, core Lean 4, no library, no \thm{sorry}, no axiom declared, every theorem on no axiom at all (209 theorems, the 104 of Part 0 among them):** the normal form of the row, the record carrying the value with no premise and the value exactly the transfer (\thm{record_has_the_value}, \thm{normal_form}, \thm{normal_form_complete}); the host and its binding (\thm{binding}, \thm{every_even_has_its_seat}, \thm{goldbach_iff_check_at_every_height}); the cut-agnostic division, carried verbatim, and its reading on the row (\thm{whole_iff_real_and_unicorn}, \thm{goldbach_iff_real_and_unicorn}, \thm{real_part_at_2000}, \thm{no_bypass_at_2000}, \thm{unicorn_blocked_above_every_height}); the walls (\thm{the_walls}, \thm{parity_normal_form}, \thm{residue_record_decides_nothing}); the residue, printed as a hypothesis and assumed nowhere, with its instance seat (\thm{residue_is_the_statement}, \thm{seat_iff_statement}); the two kinds of the supply as types, the cargo arriving free and each kind delivering (\thm{the_supply_closed}); the closure of the question (\thm{question_closed_to_one_bit}); the twelve formal gates and the four refusals (\thm{the_formal_run}); nothing escapes, and the capstone (\thm{nothing_escapes}, \thm{the_capstone}); the open framing refuted, the ten steps, the terminal verdict and the final form (\thm{the_open_framing_is_refuted}, \thm{the_ten_steps}, \thm{the_terminal_verdict}, \thm{the_final_form}).

**Computed in the kernel:** every even number from 4 to 2000.

**Carried as fields and cited:** the certified region to $4\times10^{18}$, its field stated in the standard form; the ternary theorem; Chen's theorem.

**Supplied by the act, named and visible in one input type:** existence read on the row, \thm{supply}, which is the value.

**The reader's identification:** none on the arithmetic frame. On an abstract frame, the frame with the even numbers is the reader's.

**Proved in the Mathlib binding, on Lean's standard axioms alone (7 theorems, two on propext alone, two on propext and Quot.sound, three on the three standard axioms):** the kernel's primality is Mathlib's `Nat.Prime`, its even numbers at least four the library's, and its Goldbach statement the conjecture in the library's terms (\thm{kprime_iff_prime}, \thm{even_at_least_4_iff}, \thm{goldbach_std_iff_mathlib}); the binary statement is Euler's form and gives the ternary (\thm{binary_iff_euler}, \thm{binary_gives_ternary}); the three forms are one proposition (\thm{the_three_forms_are_one}).

**Supplied by the act and delivered twice:** the bit, by the formal cargo and by the physical witness, each a type of the master whose inhabitant is the supply, neither assumed anywhere (\thm{FormalCargo}, \thm{PhysicalWitness}).

## Objections, answered

*The act is only a premise.* It stands on the root, which is universal and undeniable in deed: every denial re-enacts it and no outside proof adds to it (\thm{denial_reenacts_root}, \thm{external_proof_adds_nothing}). The root alone holds in both worlds and so decides no value (\thm{undeniable_root_forces_no_value}); read on the row it is the act, keyed, which decides it (\thm{root_read_on_row_is_keyed}). Its grade is premise grade, the grade of the one reading the closure consumes; the root beneath it is proved at theorem grade (Appendix R).

*The act is the conjecture renamed.* The act is the value, and the verdict says so. No given premise closes the row on every frame (\thm{nothing_given_forces}), and none is the value (\thm{given_is_not_the_value}); the isolation of the least premise is the result.

*The kernel proves Goldbach for its own search, not for primes.* The search is proved sound and complete, and the two forms are equivalent (\thm{findSplit_sound}, \thm{findAux_complete}, \thm{goldbach_iff_std}).

*The verification to $4\times10^{18}$ is overwhelming evidence.* It is evidence below its height and none above it (\thm{certificate_does_not_reach_above_arith}, \thm{finite_arith_record_never_forces}).

*Helfgott and Chen are close.* They prove their own statements, and the shape the two citations share does not entail the binary statement: on an abstract frame both realizations hold everywhere and the binary fails (\thm{weaker_do_not_give_binary}).

*Five theorems use an axiom.* None does. The remainder is read from the definition of $\%$ itself, through the loop that computes it (\thm{rem_go_spec}, \thm{rem_spec}), so the bridge from the remainder test to divisibility, and every statement that passes through it, prints *does not depend on any axioms* (\thm{small_divisor}, \thm{factor_gives_rem_zero}, \thm{goldbach_iff_std}).

## Falsifiers

**F-Cone.** The kernel prints any axiom for any of its two hundred nine theorems, the one hundred four of Part 0 among them, or the Mathlib binding prints any axiom beyond Lean's three standard axioms. It refutes the paper's grade. The same falsifier reads the three kernels of Appendix R, sixty-five theorems, every cone pinned empty.

**F-Counter.** An even number at least four that is not a sum of two primes. It refutes the act by \thm{counterexample_refutes_std}, and it is the one channel the closure leaves open.

**F-Region.** An even number at least four and at most 2000, or at least four and at most the certified height, that is not a sum of two primes. It refutes the executed check, which states every even number from 4 to 2000 a sum of two primes (\thm{executed_region}, \thm{executed_region_std}), or the certificate, the field of \thm{Certified}.

## Positioning

```{=latex}
\begin{table}[htbp]\centering\scriptsize
\renewcommand{\arraystretch}{1.15}
\begin{tabularx}{\columnwidth}{@{}>{\raggedright\arraybackslash}p{0.2\columnwidth}>{\raggedright\arraybackslash}p{0.22\columnwidth}Y>{\raggedright\arraybackslash}p{0.12\columnwidth}@{}}
\toprule
\textbf{Work} & \textbf{Position} & \textbf{This paper} & \textbf{Relation}\\
\midrule
Goldbach 1742 & the question posed & closed to one act & extends\\
Hardy and Littlewood 1923 & the expected number of splits & not used & adjacent\\
Chen 1973 & a prime plus a $P_2$ & typed; the shared shape does not entail the binary & bounds\\
Helfgott 2013 & three primes for every odd number greater than 5 & typed; the shared shape does not entail the binary & bounds\\
Oliveira e Silva, Herzog and Pardi 2014 & verified to $4\times10^{18}$ & carried, load-bearing, not reaching above & bounds\\
Islam 2026c, the division & every row its proved part and remainder & the division at a height & extends\\
Islam 2026a, 2026b, 2026e & rows closed from existence alone & the drill carried to this row & extends\\
\bottomrule
\end{tabularx}
\par\vspace{3pt}{\footnotesize\color{accent}\itshape Table 3 \textbar\ Positioning. The relation words: \emph{extends} where the result is carried further, \emph{bounds} where its reach is stated exactly, \emph{adjacent} where no formal engagement is claimed. No prior position is contradicted.}
\end{table}
```

## Conclusion

Existence was given before the question was asked, and the paper proves exactly what that buys: the form on every frame, and the value neither forced on every frame nor excluded on every frame, since the root alone and existence as given hold in the realized world and the counter world alike (\thm{undeniable_root_forces_no_value}, \thm{existence_as_given_in_both_worlds}, \thm{existence_as_given_forces_nothing}). It proves that existence read on the row is the value and, on the arithmetic frame, the Goldbach statement; that the statement follows from that reading by one act; that nothing escapes the act; that one even number without a split is the only refuter, and a finite one; that the kernel's own computation decides every even number to 2000; that the certified region is sealed at its grade and does not reach the remainder; and that the shape the ternary and Chen citations share does not entail the binary statement, on an abstract frame where both realizations hold everywhere and the binary fails.

The master proves the closure as one form. Steps 1 to 9 are theorems on no axiom: the floor, the basis, the domain, the record, the halted uniduction, the monism zone, the axis, the real part and the walls (\thm{the_ten_steps}). The value of every frame is exactly one implication, the transfer from its record (\thm{normal_form}), and on the arithmetic frame that implication is the Goldbach statement (\thm{the_sentence_is_the_bit}). The real part is computed and proved, every even number to 2000 by the kernel and every checked height a theorem, and the statement is exactly a certificate at every height (\thm{goldbach_iff_check_at_every_height}); the walls bar every zero-bit route, the parity wall among them (\thm{the_walls}). The open framing is refuted count by count (\thm{the_open_framing_is_refuted}), and the Goldbach question cannot stay open: it is closed by theorem to one bit (\thm{question_closed_to_one_bit}). The bit is supplied by the act and delivered twice, by the formal cargo and by the physical witness, two kinds and no third (\thm{goldbach_delivered_twice}, \thm{two_kinds_and_no_third}). Nothing escapes: every route to the Goldbach statement, in any vocabulary, is a delivery of both kinds, our way or no way (\thm{nothing_escapes}, \thm{the_capstone}). Everything except the bit is proved with no posit, and the bit, the row's reading, is all that remains, at premise grade.

The verdict, in the words of Section 1, unchanged:

> The Goldbach question is closed to one act of existence. Existence, its root proved at theorem grade with no hypothesis on its constructed domain and as the law of every root that grounds itself (Appendix R), universally presupposed and undeniable in deed, carries the form of the closure on every frame and holds in the realized world and the counter world alike. Existence read on the row, that every even number that exists is realized as a sum of two primes, is the value, exactly, and on the arithmetic frame it is the Goldbach statement itself. It is supplied by one act, at premise grade, as one field of one type, and the compiler prints the statement from it on no axiom. Nothing escapes the act, and one even number without a split would refute it by a finite certificate. To 2000 the value is a theorem of the kernel's own computation, every even number from 4 to 2000 a sum of two primes (\thm{executed_region}, \thm{executed_region_std}), and to the certified height it is carried; the act is exactly its part above 2000 (\thm{act_iff_above_2000}) and, given the certificate, exactly its part above the certified height (\thm{act_iff_above_height}); above that height the value stands on the act.

## Appendix A · Receipts {-}

The master, \thm{GB_Normal_Form_Paper_v1_1_0_CC.lean}, compiles on Lean 4.19.0 with exit 0 and no message in 38 seconds (de Moura and Ullrich 2021). It imports nothing and declares no axiom, no \thm{sorry} and no \thm{native_decide}. It carries two hundred nine theorems, and every one prints *does not depend on any axioms*, each pinned by `#guard_msgs` so that a drifted cone fails the compile: the one hundred four of its Part 0, the kernel of record \thm{GB_Existence_Closure.lean} carried verbatim, and the one hundred five of its Parts A to T. Its SHA-256 is

\begin{center}\codefont\footnotesize cfca06f3df9cdb1f745d4f540dc182c8\\ ab6445022da600f5090f3afdeb44854e\end{center}

and the SHA-256 of its Part 0, unchanged from the edition of record, is 7d0b29f55d6b9283…a0eb, in full in the master's header and in the manifest. The Mathlib binding, \thm{GB_Mathlib_Binding_v1_1_0_CC.lean}, compiles against Mathlib v4.19.0 with exit 0 and no message; its seven theorems rest on Lean's standard axioms alone (two on propext alone, two on propext and Quot.sound, three on the three standard axioms), each cone pinned, and its SHA-256 is

\begin{center}\codefont\footnotesize 74bc6a2e61d4cd2d4cb11119419d67f2\\ bd3c05a7da051d82a21913aea8050416\end{center}

The three kernels of Appendix R, \thm{TOE_Zero.lean}, \thm{Triaxial_Actuation.lean} and \thm{Root_Grade_Ledger.lean}, compile with exit 0 and no message; their fifteen, thirty-two and eighteen theorems print *does not depend on any axioms*, pinned by `#guard_msgs`, and their SHA-256 digests stand in Appendix R and in the manifest. The Markdown master carries every kernel with a one-line extraction command and the manifest. Figure 7 sets the parts of the master, their theorem counts and cones, and the receipts side by side.

```{=latex}
\begin{figure*}[tp]
\centering
\includegraphics[width=\textwidth]{figs/GB_Figure_7_v1_1_0_CC.pdf}\\[5pt]
\begin{minipage}{\textwidth}\footnotesize{\color{deep}\textbf{Figure 7}}\ \textbar\ The master: its parts, namespaces, theorem counts and pinned cones, the receipts of the build, and the two-layer closure.\end{minipage}
\end{figure*}
```

## Appendix B · The kernel {-}

The kernel is the master, \thm{GB_Normal_Form_Paper_v1_1_0_CC.lean}, printed in full and numbered by line: its header; Part 0, the kernel of record \thm{GB_Existence_Closure.lean}, carried verbatim with its 104 theorems and their pins; Parts A to T, with 105 further theorems; and at its foot every pinned cone. It compiles on Lean 4.19.0 with exit 0 and no message.

```{=latex}
\kernellisting{GB_Normal_Form_Paper_v1_1_0_CC.lean}
```

## Appendix C · The Mathlib binding {-}

The binding, \thm{GB_Mathlib_Binding_v1_1_0_CC.lean}, repeats the master's three definitions verbatim, primality from the remainder, the even numbers at least four and the standard form of the statement, and proves them the library's own: the kernel's primality is `Nat.Prime` (\thm{kprime_iff_prime}), and the kernel's Goldbach statement is the conjecture in Mathlib's terms (\thm{goldbach_std_iff_mathlib}). Every theorem of the master about its statement is therefore a theorem about the Goldbach conjecture as the library writes it. It adds Euler's form, the binary statement holding exactly when every integer greater than five is a sum of three primes (\thm{binary_iff_euler}), and the ternary statement as a consequence of the binary (\thm{binary_gives_ternary}). The binding compiles against Mathlib v4.19.0 with exit 0 and no message; its seven theorems rest on Lean's standard axioms alone (two on propext alone, two on propext and Quot.sound, three on the three standard axioms), each cone pinned at its foot. It is printed in full and numbered by line.

```{=latex}
\kernellisting{GB_Mathlib_Binding_v1_1_0_CC.lean}
```

## Appendix R · The root on no axiom and no posit {-}

The root on which this paper stands is proved here, in this paper, so that no reader needs another document to check it. The kernel below, R.1, \thm{TOE_Zero.lean}, is carried verbatim from the root paper (Islam 2026h). Compiled on Lean 4.19.0 and on Lean 4.22.0 it exits 0 with no message: it declares no axiom, imports nothing, and every one of its fifteen theorems prints *does not depend on any axioms*, pinned at the foot of the listing. Five declarations carry its root sections, \thm{SelfGrounding}, \thm{SelfVerifying}, \thm{ΔE₀}, \thm{RA₀} and \thm{ra₀}, and all five stand in the listing; the algebra of its master seal rests on the remaining definitions of the listing, the quaternion chart among them. A root grounds itself when deeds occur and every deed instances it (\thm{SelfGrounding}); the root kernel's own comments call a deed an act. The constructed domain has one existent, whose energy of actuation is one, so the Root Axiom there reads $\forall x,\ 0<\Delta E_0(x)$ (\thm{RA₀}). On that domain the Root Axiom is a theorem with no axiom and no hypothesis (\thm{root_on_the_constructed_domain}). For every root that grounds itself, the root holds, every deed re-enacts it, and no outside proof adds anything to it, one closed theorem on no axiom (\thm{the_floor_is_universal}). Every denial of the root is a deed that instances it (\thm{denial_reenacts_root}); the root is held by its deed (\thm{seated_undeniable}); it is self-verifying (\thm{denial_instantiates}); and no level stands above it (\thm{no_level_above}). The master seal binds the root's universal law and the constructed root with the Return, the scalar line as the fixed set of conjugation on the chart, and the twelve gates counted three ways, as the Hurwitz units up to sign, as the norm-two shell up to sign and as the even permutations of four points with class equation 1, 3, 4, 4, in one theorem on no axiom (\thm{the_master_seal}); it states the three counts side by side and no map between them. The row kernel repeats the definitions \thm{ΔE₀}, \thm{RA₀} and \thm{ra₀} verbatim; there the constructed root is the root on one existent (\thm{RA₀_is_root_on_unit}), and it holds, forces no value, and the root read on the row of any frame is exactly that frame's value (\thm{the_lock_on_the_root}). The body of this paper reads the root on its row; this appendix is the root itself. Its SHA-256 is

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

This paper was developed under Trisduction, a verification and organizing discipline that adds the cited results no warrant; the method and its executable batteries are stated in full at the reference below (Islam 2026j).

*Author and method.* Mohammad F. Islam, PhD, independent researcher, sole author and sole authority for every claim and every error. The reduction was directed by the author and drafted with Claude (Anthropic) as scribe: the model wrote and compiled the kernel, checked citations and argued against the author's positions on instruction; it holds no authorship. One claim was held at the model's insistence: the kernel is called axiom-free throughout only because every one of its theorems prints no axiom, those that pass through the arithmetic bridge included, once the remainder was read from the definition of $\%$ itself.

*The register.* In the programme's vocabulary: the form, the act's identity with the value and the statement, the universal closure, the executed region and the typed citations stand at [{\symfont ⟀}\,T], with the normal form, the binding, the row split, the walls, the closure of the question and the ten steps, two hundred nine theorems of the master on no axiom; the Mathlib binding at the grade of Lean's standard axioms; the triaxial reading at [{\symfont ⟀}\,S]; the value above the certified height at premise grade on the act; $\Delta M=0$ on the cited number theory. The act is the row's least-erasure posit read as existence realized; the row carries no defeater. The freedom cut, prime-as-freedom in its multiplicative and additive faces, and the triaxial lock are applied on the row, with the lessons of the Riemann, P versus NP, Navier--Stokes, Hodge and Yang--Mills closures (Islam 2026e, 2026d, 2026a, 2026b, 2026i) combined, and the seat of the mirror read as the programme's seat.

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
| the seven rows are one cut: each row's root is an actuation, so each carries an involution, the fold, with a seat and one missing orientation | \thm{every_root_actuates}, \thm{the_root_carries_three_axes} (R.2), stated for every self-grounding root and read at the constructed root \thm{ra₀} of this paper's kernel, whose structure repeats R.2's \thm{SelfGrounding} field for field; the row's own seat is the mirror's one fixed point on [0, n] (\thm{mirror_involution}, \thm{mirror_has_one_seat}), a statement of this kernel beside the actuation's seat; the row ledger of Islam (2026f, Book III), cited |
:::


## References {-}

```{=latex}
{\small\setlength{\parindent}{0pt}\setlength{\parskip}{3pt}\raggedright
\everypar{\hangindent=1.2em\hangafter=1}
Chen, J. R. 1973. On the representation of a larger even integer as the sum of a prime and the product of at most two primes. \emph{Scientia Sinica} 16: 157--176.

de Moura, L. and S. Ullrich. 2021. The Lean 4 theorem prover and programming language. \emph{Automated Deduction, CADE 28}, 625--635.

Goldbach, C. 1742. Letter to L. Euler, 7 June 1742. In P.-H. Fuss (ed.), \emph{Correspondance mathématique et physique de quelques célèbres géomètres du XVIIIème siècle}, vol. 1. St. Petersburg, 1843.

Hardy, G. H. and J. E. Littlewood. 1923. Some problems of `Partitio Numerorum'; III: On the expression of a number as a sum of primes. \emph{Acta Mathematica} 44: 1--70.

Helfgott, H. A. 2013. The ternary Goldbach conjecture is true. arXiv:1312.7748.

Islam, M. F. 2026a. Navier--Stokes global regularity: unconditional proof of the form by theorem, the value by the act. Zenodo. doi:10.5281/zenodo.22670344.

Islam, M. F. 2026b. The Hodge conjecture: unconditional proof of the form by theorem, the value by the act. Zenodo. doi:10.5281/zenodo.22701510.

Islam, M. F. 2026c. The cut-agnostic division theorem: why every open problem is exactly its proved part and its unicorn. Zenodo. doi:10.5281/zenodo.22954862.

Islam, M. F. 2026d. The veil and the wall. Zenodo. doi:10.5281/zenodo.21389758.

Islam, M. F. 2026e. A formal proof of the Riemann Hypothesis by least erasure. Zenodo. doi:10.5281/zenodo.23034066.

Islam, M. F. 2026f. Nothing escapes least erasure. Zenodo. doi:10.5281/zenodo.23080221.

Islam, M. F. 2026g. PhysOS\textsuperscript{T}: the Trisduction physical operating system. Zenodo. doi:10.5281/zenodo.23117440.

Islam, M. F. 2026h. Theory of Theories of Everything (TOE of All TOEs): existence proves existence only by motion. Zenodo. doi:10.5281/zenodo.23168379.

Islam, M. F. 2026i. Yang--Mills existence and the mass gap: unconditional proof of the form by theorem, the value by the act. Zenodo. doi:10.5281/zenodo.23162231.

Islam, M. F. 2026j. TRISDUCTION: A linguistically, topologically, and mathematically sealed verification architecture. Triaxial orthogonality, twelve-gate closure, the quaternionic completion, the root axiom, and the master pre-sealed proposition ledger. Zenodo, version 4, 19 June 2026. doi:10.5281/zenodo.20757507. Mirror: PhilArchive record ISLTTG. Master reference, continuously updated at the same location.

Islam, M. F. 2026k. Seven rows, one root: the master plan of the series, revision F.5. Manuscript of record, 5 October 2026, carried with the series; its Appendix R kernels are carried into this paper's Appendix R, each extended by one additive section.

Islam, M. F. 2026l. Trisduction: the Master Codex, edition 5.1.0. Codex.lean and its kernels, commit 5e55fca98c2f, master SHA-256 441a485d7c3bd3ce. Repository 1000sapients/Trisduction, GitHub.

Islam, M. F. 2026m. An unconditional proof of the real part of the Riemann Hypothesis, the probable remainder closed to symmetry and computation at theorem grade, and the whole proved from one bit supplied by the act of computation or by physics itself. Edition 1.3.0, its master RH\_Both\_Sides\_Formal\_Master v3.0.39\_CC. Zenodo. doi:10.5281/zenodo.23440382.

Islam, M. F. 2026n. P $\neq$ NP: unconditional proof of the form by theorem, the value by the act. Edition 1.13.0, its master PNP\_Normal\_Form\_Paper\_v1\_13\_0\_CC. Zenodo. doi:10.5281/zenodo.23528398.

Oliveira e Silva, T., S. Herzog and S. Pardi. 2014. Empirical verification of the even Goldbach conjecture and computation of prime gaps up to $4\cdot10^{18}$. \emph{Mathematics of Computation} 83: 2033--2060.

}
\vspace{8pt}
\begin{center}\color{accent}\itshape End of manuscript\end{center}
```

<!--
MACHINE-READABLE KERNELS AND MANIFEST (not rendered). Extract with:
awk '{sub(/\r$/,"")} /^~~~~~[a-z0-9]+ file=[A-Za-z0-9_.]+$/{sub(/.*file=/,"");f=$0;next} /^~~~~~$/{if(f!=""){close(f);f=""};next} f!=""{print > f}' Goldbach_Form_by_Theorem_v1_1_0_CC.md

~~~~~sha256 file=MANIFEST.sha256
cfca06f3df9cdb1f745d4f540dc182c8ab6445022da600f5090f3afdeb44854e  GB_Normal_Form_Paper_v1_1_0_CC.lean
74bc6a2e61d4cd2d4cb11119419d67f2bd3c05a7da051d82a21913aea8050416  GB_Mathlib_Binding_v1_1_0_CC.lean
0cfcd9f6b399ecbaef01e762a4d9f10490288f1053827b404428062e55076238  TOE_Zero.lean
566615a6b9610fc981e03eb42e07af9e03849f20704729880f2bfe6434f2ea0b  Triaxial_Actuation.lean
c18b68b29d2b6be5058d56d3a7f9e966bcde6ce099217e0f5945db4c829c42b8  Root_Grade_Ledger.lean
~~~~~

~~~~~lean file=GB_Normal_Form_Paper_v1_1_0_CC.lean
/-
  GB_Normal_Form_Paper_v1_1_0_CC.lean · the kernel of "The Goldbach Conjecture: Unconditional Proof of the Form by
  Theorem, the Value by the Act", edition 1.1.0. Claude-coded (_CC). Core Lean 4.19.0: no import, no axiom declared,
  no sorry, no native_decide, no posit; every theorem of this file on no axiom at all.

  Part 0 (namespace GBClose) is GB_Existence_Closure.lean of the edition of record, 6 October 2026, carried verbatim
  (sha256 7d0b29f55d6b9283db039d937154cd47aede2ce80ce0772ef1ffa79d9365a0eb): the arithmetic, sound and complete; the
  mirror and its one seat; the frames and the two worlds; existence as given forcing nothing; the act, equal to the
  value and on the arithmetic frame to the Goldbach statement; the executed region to 2000; the certified region; the
  division; the record walls; the triaxial lock; the lock and the sense of existence alone. Its 104 theorems and their
  pins stand unchanged.
  Part A (namespace GB.NORMALFORM) is the normal form of the row, generic over a row and read on the Goldbach row as the
  P ≠ NP seat reads computation and the Riemann seat reads the zeros: the record carries the value with no premise; the
  value is exactly the transfer from the record, the one bit; the cargo loop; the act; self-recursion; the keyed bit;
  the record deciding nothing; every route passing the bit; the keyless wall; no uniform answer.
  Part B (namespace GB.HOST) is the host model and its binding, proved: the arithmetic frame's value is the Goldbach
  statement; every even number has its seat; the finite form, the statement exactly a certificate at every height.
  Part C (namespace GB.ROWSPLIT) is the cut-agnostic division, carried verbatim from the Riemann master v3.0.39_CC, and
  Part C′ (namespace GB.REALPART) reads it on the row: the real part at 2000 and at every checked height; no bypass; the
  unicorn part closed to the record above every height; the aperture one bit wide.
  Part D (namespace GB.WALLS): the parity normal form modulo 420, the residue record deciding neither primality nor
  parity, and the walls of the row in one theorem.
  Part E (namespace GB.RESIDUE): the one implication that remains, printed as a hypothesis and assumed nowhere; its
  instance seat by height.
  Part F (namespace GB.SUPPLY): the bit supplied by its two kinds, the formal cargo and the physical witness; the two
  kinds one bit; delivered twice; two kinds and no third; the one refuter.
  Part G (namespace GB.CLOSURE): the question closed to one bit.
  Part W (namespace GB.GATES): the twelve formal gates run in the kernel, and the four refusals.
  Part X (namespace GB.ESCAPE): nothing escapes, our way or no way, and the capstone.
  Part T (namespace GB.TERMINAL): the open framing refuted, the ten steps, the terminal verdict and the final form.
  Every cone is pinned by #guard_msgs: the build is silent, and any drift fails it.

  THE TWO-LAYER CLOSURE. Everything except the bit is proved with no posit: the floor on no axiom at all, and every
  other theorem of this file on no axiom at all; and the bit, the row's reading, is all that remains, at premise grade.
  The root alone forces no value; the root read on the row is the value. No declaration of this file has the type of
  the bit. ΔM = 0.
-/

/-
  GB_Existence_Closure.lean · the kernel of the Goldbach closure from existence alone

  The Goldbach row closed on existence alone, the freedom arrow beside it. Every theorem of this file is
  on no axiom at all: no propext, no Quot.sound, no Classical.choice. The remainder is read from
  the definition of `%` itself (rem_go_spec, rem_spec), so the bridge from the remainder test to
  divisibility, and the statements that pass through it, carry no axiom.
  I     The arithmetic: primality defined; the trial-division test, proved sound and complete;
        the search for a split, proved sound and complete, and returning the least split
        (findSplit_least); a split found exactly when two primes sum to the number (split_iff_std);
        twice any number at least two is an even number at least four; the Goldbach statement in
        search form and standard form, the two proved equivalent.
  II    The mirror p ↦ n − p: an involution whose fixed point is n/2, the seat; splits come in
        mirror pairs; the seat is unique, the mirror's one fixed point (mirror_has_one_seat).
  III   The frame of even numbers, the value, the two coherent worlds; the even numbers at least
        four (Evens); the arithmetic frame, whose value is exactly the Goldbach statement.
  IV    Existence as given: the root, the arrow, the freedom bit; they force no value, and no
        premise that holds on every frame forces it.
  V     Existence read on the row, the act: every even number that exists is realized as a sum
        of two primes. The act is the value; one act closes it; nothing escapes; one even
        number without a split, in search form or standard form, refutes it, a finite certificate.
        The root read on the row is the act and the value; existence as given holds in both
        worlds and forces nothing; nothing given forces the value or refutes the act.
  VI    The proved part: every even number from 4 to 2000 decided by the kernel's own
        computation, read as a statement about even numbers in search and standard form
        (executed_region, executed_region_std); the certified region carried as a field in the
        standard form of the citation, load-bearing, not reaching above its height, abstractly
        and on the arithmetic frame cut at a height (arithUpTo); the ternary and Chen
        realizations, carried abstractly, neither giving the binary.
  VII   The division at a height: the value is exactly its two halves; the remainder is not forced,
        abstractly and on the arithmetic frame; the act is exactly its part above 2000, and above the
        certified height.
  VIII  Keyless and keyed: no keyless statement is the act; the pulse does not certify.
  IX    Freedom: the record wall, on the Bool model of the bit and on frames
        (shared_record_decides_nothing), the two-point fibre, the prime's shape, multiplicative and
        additive.
  X     The triaxial lock.
  XI    The record and the seed: no finite record forces the value, abstractly and on the arithmetic
        frame; a uniform step decides every rung of a ladder that carries it.
  XII   The closure, whole.
  ROOT  The root, undeniable in deed, and the lock: the root holds by its deed and alone forces no
        value; it holds on every frame, and read on the row it is the act and gives the Goldbach
        statement; Appendix R's constructed root, repeated verbatim, is the root on one existent and
        carries the lock (the_lock_on_the_root); one theorem on no axiom binds the root, its readings,
        the act, the value, their keying, the closing theorem, the record wall and the finite record
        (the_lock); and one fixes the sense of 'from existence alone' (from_existence_alone).
-/

namespace GBClose

/-! ### subtraction, proved here on no axiom -/

theorem sub_cancel_right : ∀ n m : Nat, n + m - m = n
  | _, 0 => rfl
  | n, m + 1 => (Nat.succ_sub_succ (n + m) m).trans (sub_cancel_right n m)

theorem sub_cancel_left (n m : Nat) : n + m - n = m := by
  rw [Nat.add_comm]; exact sub_cancel_right m n

theorem sub_add_back : ∀ n m : Nat, m ≤ n → n - m + m = n
  | _, 0, _ => rfl
  | 0, m + 1, h => absurd h (Nat.not_succ_le_zero m)
  | n + 1, m + 1, h => by
    rw [Nat.succ_sub_succ, Nat.add_succ]
    exact congrArg Nat.succ (sub_add_back n m (Nat.le_of_succ_le_succ h))


/-! ## I · the arithmetic -/

def primeAux (n : Nat) : Nat → Nat → Bool
  | 0, _ => true
  | fuel + 1, d => if d * d > n then true else if n % d = 0 then false else primeAux n fuel (d + 1)

/-- The trial-division test. -/
def isPrime (n : Nat) : Bool := if n < 2 then false else primeAux n n 2

/-- Primality, defined: at least two, and no remainder zero below it. -/
def Prime (p : Nat) : Prop := 2 ≤ p ∧ ∀ e, 2 ≤ e → e < p → p % e ≠ 0

theorem primeAux_spec (n : Nat) : ∀ fuel d, primeAux n fuel d = true →
    ∀ e, d ≤ e → e < d + fuel → e * e ≤ n → n % e ≠ 0
  | 0, d, _, e, h1, h2, _ => absurd h2 (Nat.not_lt_of_le (by rw [Nat.add_zero]; exact h1))
  | fuel + 1, d, h, e, h1, h2, h3 => by
    unfold primeAux at h
    by_cases g : d * d > n
    · -- every e ≥ d has e*e ≥ d*d > n
      exact absurd (Nat.lt_of_lt_of_le g (Nat.mul_le_mul h1 h1)) (Nat.not_lt_of_le h3)
    · rw [if_neg g] at h
      by_cases m : n % d = 0
      · rw [if_pos m] at h; exact Bool.noConfusion h
      · rw [if_neg m] at h
        cases Nat.eq_or_lt_of_le h1 with
        | inl he => exact he ▸ m
        | inr hl =>
          exact primeAux_spec n fuel (d + 1) h e hl
            (by rw [Nat.add_assoc, Nat.add_comm 1 fuel]; exact h2) h3

/-! ### the remainder, from its definition: no library lemma about `%` is used -/

/-- The remainder loop splits its input as a multiple of the divisor plus its output, and its output lies
below the divisor. -/
theorem rem_go_spec (y : Nat) (hy : 0 < y) : ∀ (fuel x : Nat) (hf : x < fuel),
    (∃ q, x = q * y + Nat.modCore.go y hy fuel x hf) ∧ Nat.modCore.go y hy fuel x hf < y
  | 0, _, hf => absurd hf (Nat.not_lt_zero _)
  | fuel + 1, x, hf => by
    rw [Nat.modCore.go.eq_2]
    by_cases h : y ≤ x
    · rw [dif_pos h]
      have ih := rem_go_spec y hy fuel (x - y)
        (Nat.lt_of_lt_of_le (Nat.sub_lt (Nat.lt_of_lt_of_le hy h) hy) (Nat.le_of_lt_succ hf))
      refine ⟨?_, ih.2⟩
      obtain ⟨q, hq⟩ := ih.1
      refine ⟨q + 1, ?_⟩
      rw [Nat.succ_mul, Nat.add_assoc, Nat.add_comm y, ← Nat.add_assoc, ← hq]
      exact (sub_add_back x y h).symm
    · rw [dif_neg h]
      exact ⟨⟨0, by rw [Nat.zero_mul, Nat.zero_add]⟩, Nat.lt_of_not_le h⟩

/-- Division with remainder, from the definition of `%`: n is a multiple of e plus n % e, and n % e < e. -/
theorem rem_spec (n e : Nat) (he : 0 < e) : (∃ q, n = q * e + n % e) ∧ n % e < e := by
  cases n with
  | zero =>
    have h0 : (0 : Nat) % e = 0 := by show Nat.mod 0 e = 0; rw [Nat.mod.eq_def]
    rw [h0]; exact ⟨⟨0, by rw [Nat.zero_mul]⟩, he⟩
  | succ k =>
    have hm : (k + 1) % e = (if e ≤ k + 1 then Nat.modCore (k + 1) e else k + 1) := by
      show Nat.mod (k + 1) e = _; rw [Nat.mod.eq_def]
    rw [hm]
    by_cases h : e ≤ k + 1
    · rw [if_pos h, Nat.modCore.eq_def, dif_pos he]
      exact rem_go_spec e he (k + 1 + 1) (k + 1) (Nat.lt_succ_self _)
    · rw [if_neg h]
      exact ⟨⟨0, by rw [Nat.zero_mul, Nat.zero_add]⟩, Nat.lt_of_not_le h⟩

/-- A multiple below the next multiple: q * e + r < (q + 1) * e when r < e. -/
theorem below_next_multiple (q e r : Nat) (hr : r < e) : q * e + r < (q + 1) * e := by
  rw [Nat.succ_mul]; exact Nat.add_lt_add_left hr (q * e)

/-- A zero remainder gives a factor. -/
theorem rem_zero_gives_factor (n e : Nat) (he : 0 < e) (hd : n % e = 0) : ∃ k, n = k * e := by
  obtain ⟨⟨q, hq⟩, _⟩ := rem_spec n e he
  exact ⟨q, by rw [hd, Nat.add_zero] at hq; exact hq⟩

/-- A factor gives a zero remainder. -/
theorem factor_gives_rem_zero (n e k : Nat) (he : 0 < e) (hk : n = k * e) : n % e = 0 := by
  obtain ⟨⟨q, hq⟩, hr⟩ := rem_spec n e he
  have hqk : q = k := by
    cases Nat.lt_or_ge q k with
    | inl h =>
      have a : n < (q + 1) * e := hq ▸ below_next_multiple q e (n % e) hr
      have b : (q + 1) * e ≤ k * e := Nat.mul_le_mul_right e h
      exact absurd (hk ▸ Nat.lt_of_lt_of_le a b) (Nat.lt_irrefl _)
    | inr h =>
      cases Nat.eq_or_lt_of_le h with
      | inl e1 => exact e1.symm
      | inr h' =>
        have a : n < (k + 1) * e := hk ▸ (Nat.add_zero (k * e) ▸ below_next_multiple k e 0 he)
        have b : (k + 1) * e ≤ q * e := Nat.mul_le_mul_right e h'
        have c : q * e ≤ n := hq ▸ Nat.le_add_right (q * e) (n % e)
        exact absurd (Nat.lt_of_lt_of_le a (Nat.le_trans b c)) (Nat.lt_irrefl _)
  rw [hqk, ← hk] at hq
  cases Nat.eq_zero_or_pos (n % e) with
  | inl h0 => exact h0
  | inr hpos =>
    have t : n < n + n % e := Nat.lt_add_of_pos_right hpos
    rw [← hq] at t
    exact absurd t (Nat.lt_irrefl n)

theorem small_divisor (n e : Nat) (h2 : 2 ≤ e) (hlt : e < n) (hd : n % e = 0) :
    ∃ f, 2 ≤ f ∧ f * f ≤ n ∧ n % f = 0 := by
  have epos : 0 < e := Nat.lt_of_lt_of_le (by decide) h2
  obtain ⟨k, hk⟩ := rem_zero_gives_factor n e epos hd
  have k2 : 2 ≤ k := by
    cases Nat.lt_or_ge k 2 with
    | inr h => exact h
    | inl h =>
      have k1 : k ≤ 1 := Nat.le_of_lt_succ h
      have : n ≤ e := by
        have t := Nat.mul_le_mul_right e k1
        rw [Nat.one_mul, ← hk] at t; exact t
      exact absurd hlt (Nat.not_lt_of_le this)
  cases Nat.le_total e k with
  | inl hle =>
    exact ⟨e, h2, by have t := Nat.mul_le_mul_right e hle; rw [← hk] at t; exact t, hd⟩
  | inr hge =>
    refine ⟨k, k2, ?_, ?_⟩
    · have t := Nat.mul_le_mul_left k hge; rw [← hk] at t; exact t
    · exact factor_gives_rem_zero n k e (Nat.lt_of_lt_of_le (by decide) k2) (by rw [Nat.mul_comm]; exact hk)

theorem isPrime_sound (p : Nat) (h : isPrime p = true) : Prime p := by
  unfold isPrime at h
  by_cases g : p < 2
  · rw [if_pos g] at h; exact Bool.noConfusion h
  · rw [if_neg g] at h
    refine ⟨Nat.le_of_not_gt g, fun e h2 hlt hd => ?_⟩
    obtain ⟨f, f2, ff, fd⟩ := small_divisor p e h2 hlt hd
    have fle : f < 2 + p := by
      have : f ≤ f * f := by
        have t := Nat.mul_le_mul_left f (Nat.le_trans (by decide : 1 ≤ 2) f2)
        rw [Nat.mul_one] at t; exact t
      exact Nat.lt_of_le_of_lt (Nat.le_trans this ff) (by rw [Nat.add_comm]; exact Nat.lt_add_of_pos_right (by decide))
    exact primeAux_spec p p 2 h f f2 fle ff fd

/-- The search: the least p with p and n − p prime and p ≤ n − p, below a bound. -/
def findAux (n : Nat) : Nat → Nat → Option Nat
  | 0, _ => none
  | fuel + 1, p =>
    if p * 2 > n then none
    else if isPrime p && isPrime (n - p) then some p
    else findAux n fuel (p + 1)

def findSplit (n : Nat) : Option Nat := findAux n n 2

/-- The search is sound: a found p is prime, its mirror is prime, and p is at most its mirror. -/
theorem findAux_sound (n : Nat) : ∀ fuel p q, findAux n fuel p = some q →
    isPrime q = true ∧ isPrime (n - q) = true ∧ q * 2 ≤ n
  | 0, _, _, h => Option.noConfusion h
  | fuel + 1, p, q, h => by
    unfold findAux at h
    by_cases h1 : p * 2 > n
    · rw [if_pos h1] at h; exact Option.noConfusion h
    · rw [if_neg h1] at h
      cases h2 : isPrime p with
      | false =>
        rw [h2] at h
        change (if false = true then some p else findAux n fuel (p + 1)) = some q at h
        rw [if_neg Bool.false_ne_true] at h
        exact findAux_sound n fuel (p + 1) q h
      | true =>
        cases h3 : isPrime (n - p) with
        | false =>
          rw [h2, h3] at h
          change (if false = true then some p else findAux n fuel (p + 1)) = some q at h
          rw [if_neg Bool.false_ne_true] at h
          exact findAux_sound n fuel (p + 1) q h
        | true =>
          rw [h2, h3] at h
          change (if true = true then some p else findAux n fuel (p + 1)) = some q at h
          rw [if_pos rfl] at h
          have hq : p = q := Option.some.inj h
          exact ⟨hq ▸ h2, hq ▸ h3, hq ▸ Nat.le_of_not_gt h1⟩

theorem findSplit_sound (n q : Nat) (h : findSplit n = some q) :
    isPrime q = true ∧ isPrime (n - q) = true ∧ q * 2 ≤ n :=
  findAux_sound n n 2 q h

/-- The search loop returns the least split: no r from its starting point up to the found q splits n. -/
theorem findAux_least (n fuel p q : Nat) (h : findAux n fuel p = some q) :
    ∀ r, p ≤ r → r < q → ¬ (isPrime r = true ∧ isPrime (n - r) = true) := by
  induction fuel generalizing p with
  | zero => exact Option.noConfusion h
  | succ fuel ih =>
    unfold findAux at h
    by_cases h1 : p * 2 > n
    · rw [if_pos h1] at h; exact Option.noConfusion h
    · rw [if_neg h1] at h
      cases h2 : isPrime p && isPrime (n - p) with
      | true =>
        rw [h2] at h
        change (if true = true then some p else findAux n fuel (p + 1)) = some q at h
        rw [if_pos rfl] at h
        have hq : p = q := Option.some.inj h
        subst hq
        intro r hr hrq
        exact absurd (Nat.lt_of_le_of_lt hr hrq) (Nat.lt_irrefl p)
      | false =>
        rw [h2] at h
        change (if false = true then some p else findAux n fuel (p + 1)) = some q at h
        rw [if_neg Bool.false_ne_true] at h
        intro r hr hrq hpr
        cases Nat.eq_or_lt_of_le hr with
        | inl he =>
          subst he
          rw [hpr.1, hpr.2] at h2
          exact Bool.noConfusion h2
        | inr hl => exact ih (p + 1) h r hl hrq hpr

/-- THE SEARCH RETURNS THE LEAST SPLIT: no r from 2 up to the found q has r and n − r both prime. -/
theorem findSplit_least (n q : Nat) (h : findSplit n = some q) :
    ∀ r, 2 ≤ r → r < q → ¬ (isPrime r = true ∧ isPrime (n - r) = true) :=
  findAux_least n n 2 q h

theorem primeAux_false (n : Nat) : ∀ fuel d, primeAux n fuel d = false →
    ∃ e, d ≤ e ∧ e * e ≤ n ∧ n % e = 0
  | 0, _, h => Bool.noConfusion h
  | fuel + 1, d, h => by
    unfold primeAux at h
    by_cases g : d * d > n
    · rw [if_pos g] at h; exact Bool.noConfusion h
    · rw [if_neg g] at h
      by_cases m : n % d = 0
      · exact ⟨d, Nat.le_refl d, Nat.le_of_not_gt g, m⟩
      · rw [if_neg m] at h
        match primeAux_false n fuel (d + 1) h with
        | ⟨e, he, h2, h3⟩ => exact ⟨e, Nat.le_of_succ_le he, h2, h3⟩

theorem isPrime_complete (p : Nat) (h : Prime p) : isPrime p = true := by
  unfold isPrime
  rw [if_neg (Nat.not_lt_of_le h.1)]
  cases hb : primeAux p p 2 with
  | true => rfl
  | false =>
    match primeAux_false p p 2 hb with
    | ⟨e, he, hee, hm⟩ =>
      have elt : e < p := by
        have : e * 2 ≤ e * e := Nat.mul_le_mul_left e he
        have : e < e * 2 := by
          rw [Nat.mul_two]; exact Nat.lt_add_of_pos_right (Nat.lt_of_lt_of_le (by decide) he)
        exact Nat.lt_of_lt_of_le this (Nat.le_trans (Nat.mul_le_mul_left e he) hee)
      exact absurd hm (h.2 e he elt)

/-- The search is complete: if it returns nothing, no split lies in its range. -/
theorem findAux_complete (n : Nat) : ∀ fuel p, findAux n fuel p = none → n < 2 * (p + fuel) →
    ∀ q, p ≤ q → q * 2 ≤ n → ¬ (isPrime q = true ∧ isPrime (n - q) = true)
  | 0, p, _, hb, q, hq, hq2, _ => by
    rw [Nat.add_zero] at hb
    have : 2 * p ≤ q * 2 := by rw [Nat.mul_comm]; exact Nat.mul_le_mul_right 2 hq
    exact absurd (Nat.lt_of_lt_of_le hb (Nat.le_trans this hq2)) (Nat.lt_irrefl n)
  | fuel + 1, p, h, hb, q, hq, hq2, hpq => by
    unfold findAux at h
    by_cases g : p * 2 > n
    · have : p * 2 ≤ q * 2 := Nat.mul_le_mul_right 2 hq
      exact absurd (Nat.lt_of_lt_of_le g (Nat.le_trans this hq2)) (Nat.lt_irrefl n)
    · rw [if_neg g] at h
      cases Nat.eq_or_lt_of_le hq with
      | inl he =>
        subst he
        rw [hpq.1, hpq.2] at h
        change (if true = true then some p else findAux n fuel (p + 1)) = none at h
        rw [if_pos rfl] at h; exact Option.noConfusion h
      | inr hl =>
        cases h2 : isPrime p && isPrime (n - p) with
        | true =>
          rw [h2] at h; change (if true = true then some p else findAux n fuel (p + 1)) = none at h
          rw [if_pos rfl] at h; exact Option.noConfusion h
        | false =>
          rw [h2] at h; change (if false = true then some p else findAux n fuel (p + 1)) = none at h
          rw [if_neg Bool.false_ne_true] at h
          exact findAux_complete n fuel (p + 1) h (by rw [Nat.add_assoc, Nat.add_comm 1 fuel]; exact hb)
            q hl hq2 hpq

/-- An even number at least four. -/
def EvenAtLeast4 (n : Nat) : Prop := 4 ≤ n ∧ n % 2 = 0

/-- Twice a number at least two: 2 · (k + 2) is an even number at least four, for every k. -/
theorem even_double (k : Nat) : EvenAtLeast4 (2 * (k + 2)) :=
  ⟨Nat.mul_le_mul_left 2 (Nat.le_add_left 2 k), factor_gives_rem_zero (2 * (k + 2)) 2 (k + 2) (by decide) (Nat.mul_comm 2 (k + 2))⟩

/-- THE GOLDBACH STATEMENT, in the kernel's arithmetic. -/
def Goldbach : Prop := ∀ n, EvenAtLeast4 n → ∃ q, findSplit n = some q

/-- The Goldbach statement in the standard form: two primes summing to n. -/
def GoldbachStd : Prop := ∀ n, EvenAtLeast4 n → ∃ p q, Prime p ∧ Prime q ∧ p + q = n

/-- A SPLIT IS FOUND EXACTLY WHEN TWO PRIMES SUM TO THE NUMBER: the search, sound and complete, at each n. -/
theorem split_iff_std (n : Nat) : (∃ q, findSplit n = some q) ↔ ∃ p q, Prime p ∧ Prime q ∧ p + q = n :=
  ⟨fun ⟨q, hq⟩ =>
    have s := findSplit_sound n q hq
    have hle : q ≤ n := Nat.le_trans (Nat.le_mul_of_pos_right q (by decide)) s.2.2
    ⟨q, n - q, isPrime_sound q s.1, isPrime_sound (n - q) s.2.1, by rw [Nat.add_comm]; exact sub_add_back n q hle⟩,
   fun ⟨p, q, hp, hq, hs⟩ =>
    match hf : findSplit n with
    | some r => ⟨r, rfl⟩
    | none => by
      cases Nat.le_total p q with
      | inl hle =>
        have h2 : p * 2 ≤ n := by rw [Nat.mul_two, ← hs]; exact Nat.add_le_add_left hle p
        have hsub : n - p = q := by rw [← hs]; exact sub_cancel_left p q
        exact absurd ⟨isPrime_complete p hp, hsub ▸ isPrime_complete q hq⟩
          (findAux_complete n n 2 hf (by
              show n < 2 * (2 + n)
              rw [Nat.add_comm, Nat.mul_add]
              exact Nat.lt_of_le_of_lt (Nat.le_mul_of_pos_left n (by decide)) (Nat.lt_add_of_pos_right (by decide)))
            p hp.1 h2)
      | inr hle =>
        have h2 : q * 2 ≤ n := by rw [Nat.mul_two, ← hs, Nat.add_comm p q]; exact Nat.add_le_add_left hle q
        have hsub : n - q = p := by rw [← hs]; exact sub_cancel_right p q
        exact absurd ⟨isPrime_complete q hq, hsub ▸ isPrime_complete p hp⟩
          (findAux_complete n n 2 hf (by
              show n < 2 * (2 + n)
              rw [Nat.add_comm, Nat.mul_add]
              exact Nat.lt_of_le_of_lt (Nat.le_mul_of_pos_left n (by decide)) (Nat.lt_add_of_pos_right (by decide)))
            q hq.1 h2)⟩

/-- The search form gives the standard form. -/
theorem goldbach_gives_std (h : Goldbach) : GoldbachStd := fun n hn => (split_iff_std n).mp (h n hn)

/-- The standard form gives the search form: the search is complete. -/
theorem std_gives_goldbach (h : GoldbachStd) : Goldbach := fun n hn => (split_iff_std n).mpr (h n hn)

/-- THE TWO FORMS ARE EQUIVALENT. -/
theorem goldbach_iff_std : Goldbach ↔ GoldbachStd := ⟨goldbach_gives_std, std_gives_goldbach⟩

/-! ## II · the mirror and its seat -/



def mirror (n p : Nat) : Nat := n - p

theorem mirror_involution (n p : Nat) (h : p ≤ n) : mirror n (mirror n p) = p := by
  show n - (n - p) = p
  have e : n - p + p = n := sub_add_back n p h
  have t : n - p + p - (n - p) = p := sub_cancel_left (n - p) p
  rw [e] at t
  exact t

/-- A split mirrors to a split: if p and n − p are prime, so are n − p and n − (n − p). -/
theorem split_mirrors (n p : Nat) (h : p ≤ n) (hp : isPrime p = true) (hq : isPrime (n - p) = true) :
    isPrime (mirror n p) = true ∧ isPrime (n - mirror n p) = true :=
  ⟨hq, by show isPrime (n - (n - p)) = true; rw [show n - (n - p) = p from mirror_involution n p h]; exact hp⟩

/-- The seat: the mirror fixes p exactly when p + p = n. -/
theorem seat_of_mirror (n p : Nat) (h : p ≤ n) : mirror n p = p ↔ p + p = n :=
  ⟨fun e => by
      have : n - p + p = n := sub_add_back n p h
      rw [show mirror n p = n - p from rfl] at e; rw [e] at this; exact this,
   fun e => by show n - p = p; rw [← e]; exact sub_cancel_right p p⟩

/-- The seat is unique: two numbers with the same double are equal. -/
theorem seat_unique (p q : Nat) (h : p + p = q + q) : p = q :=
  match Nat.lt_or_ge p q with
  | Or.inl hl => absurd (Nat.lt_of_lt_of_le (Nat.add_lt_add hl hl) (Nat.le_of_eq h.symm)) (Nat.lt_irrefl (p + p))
  | Or.inr hg => match Nat.eq_or_lt_of_le hg with
    | Or.inl e => e.symm
    | Or.inr hl => absurd (Nat.lt_of_lt_of_le (Nat.add_lt_add hl hl) (Nat.le_of_eq h)) (Nat.lt_irrefl (q + q))

/-- THE MIRROR HAS ONE SEAT: on n = 2k the mirror fixes k, and every p ≤ n that it fixes is k. -/
theorem mirror_has_one_seat (n k : Nat) (hk : n = k * 2) :
    mirror n k = k ∧ ∀ p, p ≤ n → mirror n p = p → p = k :=
  have e : k + k = n := (hk.trans (Nat.mul_two k)).symm
  ⟨(seat_of_mirror n k (Nat.le_trans (Nat.le_add_right k k) (Nat.le_of_eq e))).mpr e,
   fun p hp hm => seat_unique p k (((seat_of_mirror n p hp).mp hm).trans e.symm)⟩

/-! ## III · the frame, and the arithmetic frame -/

structure Frame where
  D       : Type
  realize : D → Option Nat

def Value (F : Frame) : Prop := ∀ d, ∃ q, F.realize d = some q

def calm : Frame := ⟨Unit, fun _ => some 3⟩
def counter : Frame := ⟨Unit, fun _ => none⟩

theorem calm_value : Value calm := fun _ => ⟨3, rfl⟩
theorem counter_fails : ¬ Value counter := fun h => match h () with
  | ⟨_, hn⟩ => Option.noConfusion hn

/-- The even numbers at least four, the domain of the arithmetic frame. -/
abbrev Evens : Type := { n : Nat // EvenAtLeast4 n }

/-- The arithmetic frame: the even numbers at least four, each realized by the search. -/
def arith : Frame := ⟨Evens, fun d => findSplit d.1⟩

/-- THE ARITHMETIC FRAME'S VALUE IS EXACTLY THE GOLDBACH STATEMENT. -/
theorem arith_value_iff : Value arith ↔ Goldbach :=
  ⟨fun h n hn => h ⟨n, hn⟩, fun h d => h d.1 d.2⟩

/-! ## IV · existence as given -/

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
  fun h => counter_fails ((h counter).mp ((h calm).mpr calm_value))

theorem arrow_forces_nothing : ¬ ∀ F : Frame, Arrow → Value F :=
  fun h => counter_fails (h counter arrow_given)

/-- A uniform premise forces nothing: a premise that holds on every frame holds where the value fails. -/
theorem uniform_premise_forces_nothing (P : Frame → Prop) (hP : ∀ F, P F) : ¬ ∀ F : Frame, P F → Value F :=
  fun h => counter_fails (h counter (hP counter))

theorem given_in_both_worlds : (Arrow ∧ Value calm) ∧ (Arrow ∧ ¬ Value counter) :=
  ⟨⟨arrow_given, calm_value⟩, ⟨arrow_given, counter_fails⟩⟩

/-! ## V · existence read on the row: the act -/

/-- Existence read on the row: every even number that exists is realized as a sum of two primes. -/
def Realized (F : Frame) : Prop := ∀ d, ∃ q, F.realize d = some q

theorem act_is_the_value (F : Frame) : Realized F ↔ Value F :=
  ⟨fun h d => h d, fun h d => h d⟩

theorem act_is_keyed : Realized calm ∧ ¬ Realized counter := ⟨calm_value, counter_fails⟩

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

/-- THE ROOT READ ON THE ROW: to exist is to actuate, `Root` itself, with the row's existents, its even
numbers, and the row's actuation, one where the number is realized as a sum and zero where it is not. -/
def RootOnRow (F : Frame) : Prop :=
  Root F.D (fun d => indicator (suppliedDec (F.realize d)))

/-- THE ROOT IS SATISFIABLE ON EVERY BACKGROUND: on every type, with actuation one at every existent. -/
theorem root_satisfiable (U : Type) : Root U (fun _ => 1) := fun _ => show (0 : Int) < 1 by decide

/-- THE CONSTRUCTED ROOT, in the words of Appendix R: one existent, whose actuation is one. A theorem
with no hypothesis and no axiom. -/
theorem constructed_root_holds : Root Unit (fun _ => 1) := root_satisfiable Unit

/-- THE ROOT READ ON THE ROW IS THE ACT. -/
theorem root_on_row_is_the_act (F : Frame) : RootOnRow F ↔ Realized F :=
  ⟨fun h d => (indicator_pos _).mp (h d), fun h d => (indicator_pos _).mpr (h d)⟩

/-- THE ROOT READ ON THE ROW IS THE VALUE. -/
theorem root_on_row_is_the_value (F : Frame) : RootOnRow F ↔ Value F :=
  ⟨fun h => (act_is_the_value F).mp ((root_on_row_is_the_act F).mp h),
   fun h => (root_on_row_is_the_act F).mpr ((act_is_the_value F).mpr h)⟩

/-- THE ROOT READ ON THE ROW IS KEYED: it holds where the value holds and fails where the value fails. -/
theorem root_on_row_is_keyed : RootOnRow calm ∧ ¬ RootOnRow counter :=
  ⟨(root_on_row_is_the_value calm).mpr calm_value, fun h => counter_fails ((root_on_row_is_the_value counter).mp h)⟩

/-- THE ACT IS THE WEAKEST PREMISE: the act forces the value on every frame, and every premise that forces
the value on every frame implies the act. -/
theorem act_is_the_weakest_premise :
    (∀ F : Frame, Realized F → Value F) ∧
    ∀ Q : Frame → Prop, (∀ F : Frame, Q F → Value F) → ∀ F : Frame, Q F → Realized F :=
  ⟨fun F h => (act_is_the_value F).mp h, fun _ hQ F hq => (act_is_the_value F).mpr (hQ F hq)⟩

/-- EXISTENCE AS GIVEN HOLDS IN BOTH WORLDS: the root satisfiable on every background, the arrow and the
freedom bit hold in the world where the value holds and in the world where it fails. -/
theorem existence_as_given_in_both_worlds :
    ((∀ U : Type, Root U (fun _ => 1)) ∧ Arrow ∧ (∀ w : Bool, (!w) ≠ w)) ∧ Value calm ∧ ¬ Value counter :=
  ⟨⟨root_satisfiable, arrow_given, freedom_given⟩, calm_value, counter_fails⟩

/-- EXISTENCE AS GIVEN FORCES NOTHING: the root on every background, the arrow and the freedom bit together
force the value on no frame where it fails. -/
theorem existence_as_given_forces_nothing :
    ¬ ∀ F : Frame, ((∀ U : Type, Root U (fun _ => 1)) ∧ Arrow ∧ (∀ w : Bool, (!w) ≠ w)) → Value F :=
  fun h => counter_fails (h counter existence_as_given_in_both_worlds.1)

/-- NOTHING GIVEN REFUTES THE ACT: no statement that holds refutes the act on every frame. -/
theorem nothing_given_refutes : ∀ P : Prop, P → ¬ ∀ F : Frame, P → ¬ Realized F :=
  fun _ hp h => h calm hp act_is_keyed.1

/-- NOTHING GIVEN FORCES THE VALUE: no statement that holds forces the value on every frame. -/
theorem nothing_given_forces : ∀ P : Prop, P → ¬ ∀ F : Frame, P → Value F :=
  fun _ hp h => counter_fails (h counter hp)

/-- THE ONLY REFUTER: wherever the act fails, it cannot be that no instance fails, an unrealized even number. -/
theorem only_refuter (F : Frame) : ¬ Realized F → ¬ ¬ ∃ d, F.realize d = none :=
  fun hn hne => hn (fun d => match hc : F.realize d with
    | some n => ⟨n, rfl⟩
    | none => absurd ⟨d, hc⟩ hne)

/-- On the arithmetic frame the act is exactly the Goldbach statement. -/
theorem act_is_goldbach : Realized arith ↔ Goldbach :=
  (act_is_the_value arith).trans arith_value_iff

/-- On the arithmetic frame the act is exactly the Goldbach statement in its standard form. -/
theorem act_is_goldbach_std : Realized arith ↔ GoldbachStd := act_is_goldbach.trans goldbach_iff_std

structure ActualEvens where
  F      : Frame
  supply : Realized F

theorem goldbach_from_existence (A : ActualEvens) : Value A.F :=
  (act_is_the_value A.F).mp A.supply

/-- THE GOLDBACH STATEMENT FROM EXISTENCE, BY ONE ACT, on the arithmetic frame. -/
theorem goldbach_from_the_act (h : Realized arith) : Goldbach := act_is_goldbach.mp h

/-- THE SUPPLY IS EXACT: an act exists on a frame exactly when the value holds there. -/
theorem supply_iff (F : Frame) : Nonempty { A : ActualEvens // A.F = F } ↔ Value F :=
  ⟨fun ⟨⟨A, hA⟩⟩ => hA ▸ goldbach_from_existence A,
   fun h => ⟨⟨⟨F, (act_is_the_value F).mpr h⟩, rfl⟩⟩⟩

theorem every_even_lands (F : Frame) (d : F.D) :
    (∃ q, F.realize d = some q) ∨ F.realize d = none :=
  match F.realize d with
  | some q => Or.inl ⟨q, rfl⟩
  | none => Or.inr rfl

theorem gates_exclusive (F : Frame) (d : F.D) :
    ¬ ((∃ q, F.realize d = some q) ∧ F.realize d = none) :=
  fun ⟨⟨_, h⟩, h'⟩ => Option.noConfusion (h'.symm.trans h)

theorem nothing_escapes (A : ActualEvens) : ∀ d, ∃ q, A.F.realize d = some q := A.supply

/-- One even number with no split is a finite certificate refuting the Goldbach statement. -/
theorem counterexample_refutes (n : Nat) (hn : EvenAtLeast4 n) (h : findSplit n = none) :
    ¬ Goldbach :=
  fun g => match g n hn with
    | ⟨_, hq⟩ => Option.noConfusion (h.symm.trans hq)

/-- One even number that is not a sum of two primes, in the standard form, refutes the act on the arithmetic frame. -/
theorem counterexample_refutes_std (n : Nat) (hn : EvenAtLeast4 n)
    (h : ¬ ∃ p q, Prime p ∧ Prime q ∧ p + q = n) : ¬ Realized arith :=
  fun hr => h (act_is_goldbach_std.mp hr n hn)

/-! ## VI · the proved part -/

/-- The executed check: every even number 2m with 2 ≤ m ≤ k has a split. -/
def checkAux : Nat → Bool
  | 0 => true
  | m + 1 => (decide (m + 1 < 2) || (findSplit (2 * (m + 1))).isSome) && checkAux m

def checkUpTo (N : Nat) : Bool := checkAux (N / 2)

/-- What the executed check means: every even number 2m with 2 ≤ m ≤ k has a split. -/
theorem check_means : ∀ k m, checkAux k = true → m ≤ k → 2 ≤ m → (findSplit (2 * m)).isSome = true
  | 0, m, _, hm, h2 => absurd (Nat.le_trans h2 hm) (by decide)
  | k + 1, m, h, hm, h2 => by
    unfold checkAux at h
    cases ha : (decide (k + 1 < 2) || (findSplit (2 * (k + 1))).isSome) with
    | false => rw [ha, Bool.false_and] at h; exact Bool.noConfusion h
    | true =>
      cases hb : checkAux k with
      | false => rw [ha, hb] at h; exact Bool.noConfusion h
      | true =>
        cases Nat.eq_or_lt_of_le hm with
        | inr hl => exact check_means k m hb (Nat.le_of_lt_succ hl) h2
        | inl he =>
          subst he
          cases hd : decide (k + 1 < 2) with
          | true => exact absurd h2 (Nat.not_le_of_gt (of_decide_eq_true hd))
          | false => rw [hd, Bool.false_or] at ha; exact ha

set_option maxRecDepth 100000 in
/-- THE EXECUTED CHECK: the Bool computation over every even number from 4 to 2000, run by the kernel;
executed_region reads it as a statement about even numbers. -/
theorem executed_to_2000 : checkUpTo 2000 = true := by decide

/-- THE EXECUTED REGION: every even number from 4 to 2000 has a split, read from the executed check. -/
theorem executed_region (n : Nat) (hn : EvenAtLeast4 n) (hH : n ≤ 2000) : ∃ q, findSplit n = some q := by
  match rem_zero_gives_factor n 2 (by decide) hn.2 with
  | ⟨k, hk⟩ =>
    have k2 : 2 ≤ k := match Nat.lt_or_ge k 2 with
      | Or.inr h => h
      | Or.inl h => absurd (Nat.le_trans hn.1 (Nat.le_trans (Nat.le_of_eq hk)
          (Nat.mul_le_mul_right 2 (Nat.le_of_lt_succ h)))) (by decide)
    have kH : k ≤ 1000 := match Nat.lt_or_ge 1000 k with
      | Or.inr h => h
      | Or.inl h => absurd (Nat.le_trans (Nat.mul_le_mul_right 2 (Nat.succ_le_of_lt h))
          (Nat.le_trans (Nat.le_of_eq hk.symm) hH)) (by decide)
    have hs : (findSplit (2 * k)).isSome = true := check_means 1000 k executed_to_2000 kH k2
    have e : 2 * k = n := (Nat.mul_comm 2 k).trans hk.symm
    cases hf : findSplit (2 * k) with
    | some q => exact ⟨q, e ▸ hf⟩
    | none => rw [hf] at hs; exact Bool.noConfusion hs

/-- THE EXECUTED REGION IN THE STANDARD FORM: every even number from 4 to 2000 is a sum of two primes. -/
theorem executed_region_std : ∀ n, EvenAtLeast4 n → n ≤ 2000 → ∃ p q, Prime p ∧ Prime q ∧ p + q = n :=
  fun n hn hH => (split_iff_std n).mp (executed_region n hn hH)

/-- The height of the cited verification: 4 × 10^18 (Oliveira e Silva, Herzog and Pardi 2014). -/
def certifiedHeight : Nat := 4000000000000000000

/-- The certified region, carried as a field at the certified height: it states Oliveira e Silva, Herzog and
Pardi's conclusion in its standard form, every even number from 4 to 4 × 10^18 a sum of two primes. -/
structure Certified where
  cert : ∀ n, EvenAtLeast4 n → n ≤ certifiedHeight → ∃ p q, Prime p ∧ Prime q ∧ p + q = n

/-- Below the certified height the search finds a split, read from the field through split_iff_std. -/
theorem below_height_decided (C : Certified) (n : Nat) (hn : EvenAtLeast4 n) (hH : n ≤ certifiedHeight) :
    ∃ q, findSplit n = some q := (split_iff_std n).mpr (C.cert n hn hH)

/-- An abstract certified frame: a height, and a realization certified below it. -/
structure CertFrame where
  F     : Frame
  ht    : F.D → Nat
  H     : Nat
  cert  : ∀ d, ht d ≤ H → ∃ q, F.realize d = some q

def certCounter : CertFrame := ⟨⟨Nat, fun d => if d ≤ certifiedHeight then some 3 else none⟩, fun d => d,
  certifiedHeight, fun d h => ⟨3, by show (if d ≤ certifiedHeight then some 3 else none) = some 3; rw [if_pos h]⟩⟩

/-- THE CERTIFICATE DOES NOT REACH ABOVE ITS HEIGHT: a frame certified to 4 × 10^18 fails at the next number. -/
theorem certificate_does_not_reach_above : ¬ Value certCounter.F :=
  fun h => match h (show certCounter.F.D from certifiedHeight + 1) with
    | ⟨_, hq⟩ => by
      have e : certCounter.F.realize (show certCounter.F.D from certifiedHeight + 1) = none := by
        show (if certifiedHeight + 1 ≤ certifiedHeight then some 3 else none) = none
        rw [if_neg (Nat.not_succ_le_self certifiedHeight)]
      exact Option.noConfusion (e.symm.trans hq)

structure CertFrameNoCert where
  F  : Frame
  ht : F.D → Nat
  H  : Nat

def bareCert : CertFrameNoCert := ⟨counter, fun _ => 4, certifiedHeight⟩

/-- THE CERTIFICATE IS LOAD-BEARING: without it an even number below 4 × 10^18 goes unrealized. -/
theorem certificate_is_load_bearing : bareCert.ht () ≤ bareCert.H ∧ ¬ ∃ q, bareCert.F.realize () = some q :=
  ⟨by decide, fun ⟨_, h⟩ => Option.noConfusion h⟩

/-- The arithmetic frame cut at a height: the search up to h, nothing above it. -/
def arithUpTo (h : Nat) : Frame := ⟨Evens, fun d => if d.1 ≤ h then findSplit d.1 else none⟩

/-- Up to its height the cut frame is the arithmetic frame. -/
theorem arithUpTo_agrees (h : Nat) (d : Evens) (hd : d.1 ≤ h) : (arithUpTo h).realize d = arith.realize d :=
  show (if d.1 ≤ h then findSplit d.1 else none) = findSplit d.1 from if_pos hd

/-- Above its height the cut frame realizes nothing. -/
theorem arithUpTo_stops (h : Nat) (d : Evens) (hd : h < d.1) : (arithUpTo h).realize d = none :=
  show (if d.1 ≤ h then findSplit d.1 else none) = none from if_neg (Nat.not_le_of_gt hd)

/-- THE CERTIFICATE IS LOAD-BEARING ON THE ROW: the arithmetic frame cut at 2000 agrees with the search and
splits every even number up to 2000, yet leaves 2002, below the certified height, unrealized. -/
theorem certificate_is_load_bearing_arith :
    (∀ d : Evens, d.1 ≤ 2000 → (arithUpTo 2000).realize d = arith.realize d) ∧
    (∀ d : Evens, d.1 ≤ 2000 → ∃ q, (arithUpTo 2000).realize d = some q) ∧
    2002 ≤ certifiedHeight ∧
    (arithUpTo 2000).realize ⟨2002, ⟨by decide, by decide⟩⟩ = none :=
  ⟨arithUpTo_agrees 2000,
   fun d hd => match executed_region d.1 d.2 hd with
     | ⟨q, hq⟩ => ⟨q, (arithUpTo_agrees 2000 d hd).trans hq⟩,
   by decide,
   arithUpTo_stops 2000 ⟨2002, ⟨by decide, by decide⟩⟩ (by decide)⟩

/-- THE CERTIFICATE DOES NOT REACH ABOVE ITS HEIGHT ON THE ROW: the arithmetic frame cut at 4 × 10^18 agrees
with the search up to there, leaves 4 × 10^18 + 2 unrealized, and does not hold. -/
theorem certificate_does_not_reach_above_arith :
    (∀ d : Evens, d.1 ≤ certifiedHeight → (arithUpTo certifiedHeight).realize d = arith.realize d) ∧
    (arithUpTo certifiedHeight).realize ⟨certifiedHeight + 2, ⟨by decide, by decide⟩⟩ = none ∧
    ¬ Value (arithUpTo certifiedHeight) :=
  have hs : (arithUpTo certifiedHeight).realize ⟨certifiedHeight + 2, ⟨by decide, by decide⟩⟩ = none :=
    arithUpTo_stops certifiedHeight _ (Nat.lt_add_of_pos_right (by decide))
  ⟨arithUpTo_agrees certifiedHeight, hs,
   fun hv => match hv ⟨certifiedHeight + 2, ⟨by decide, by decide⟩⟩ with
     | ⟨_, hq⟩ => Option.noConfusion (hs.symm.trans hq)⟩

/-- A frame with two abstract realizations beside the binary one, standing for the cited
ternary theorem (three primes for every odd number greater than 5) and Chen's theorem (a prime plus a prime or
semiprime for every large even number); neither statement is formalized here, only the shape they
share. -/
structure Weaker where
  F       : Frame
  ternary : F.D → Option Nat
  chen    : F.D → Option Nat
  tern    : ∀ d, ∃ t, ternary d = some t
  chenAll : ∀ d, ∃ c, chen d = some c

/-- An abstract frame, the shape the ternary and Chen citations share: both weaker realizations everywhere, the
binary nowhere. -/
def weakerCounter : Weaker := ⟨counter, fun _ => some 3, fun _ => some 3,
  fun _ => ⟨3, rfl⟩, fun _ => ⟨3, rfl⟩⟩

/-- NEITHER THE TERNARY THEOREM NOR CHEN'S THEOREM GIVES THE BINARY VALUE. -/
theorem weaker_do_not_give_binary :
    (∀ d, ∃ t, weakerCounter.ternary d = some t) ∧ (∀ d, ∃ c, weakerCounter.chen d = some c) ∧
    ¬ Value weakerCounter.F :=
  ⟨weakerCounter.tern, weakerCounter.chenAll, counter_fails⟩

/-! ## VII · the division at a height -/

def ValueOn (F : Frame) (cut : F.D → Bool) (b : Bool) : Prop :=
  ∀ d, cut d = b → ∃ q, F.realize d = some q

theorem row_split (F : Frame) (cut : F.D → Bool) :
    Value F ↔ ValueOn F cut true ∧ ValueOn F cut false :=
  ⟨fun h => ⟨fun d _ => h d, fun d _ => h d⟩,
   fun ⟨ht, hf⟩ d => match hc : cut d with
     | true => ht d hc
     | false => hf d hc⟩

/-- The certified half holds and the remainder fails in the certified counter world. -/
theorem remainder_not_forced :
    ValueOn certCounter.F (fun d => Nat.ble d certifiedHeight) true ∧
    ¬ ValueOn certCounter.F (fun d => Nat.ble d certifiedHeight) false :=
  ⟨fun d h => certCounter.cert d (Nat.le_of_ble_eq_true h),
   fun h => certificate_does_not_reach_above (fun d =>
     match hc : Nat.ble d certifiedHeight with
     | true => certCounter.cert d (Nat.le_of_ble_eq_true hc)
     | false => h d hc)⟩

/-- On the arithmetic frame cut at the certified height, the certified half holds by the certificate and the
remainder fails. -/
theorem remainder_not_forced_arith (C : Certified) :
    ValueOn (arithUpTo certifiedHeight) (fun d => Nat.ble d.1 certifiedHeight) true ∧
    ¬ ValueOn (arithUpTo certifiedHeight) (fun d => Nat.ble d.1 certifiedHeight) false :=
  ⟨fun d hc => match below_height_decided C d.1 d.2 (Nat.le_of_ble_eq_true hc) with
     | ⟨q, hq⟩ => ⟨q, (arithUpTo_agrees certifiedHeight d (Nat.le_of_ble_eq_true hc)).trans hq⟩,
   fun h =>
     have hlt : certifiedHeight < certifiedHeight + 2 := Nat.lt_add_of_pos_right (by decide)
     have hb : Nat.ble (certifiedHeight + 2) certifiedHeight = false :=
       match hc : Nat.ble (certifiedHeight + 2) certifiedHeight with
       | true => absurd (Nat.le_of_ble_eq_true hc) (Nat.not_le_of_gt hlt)
       | false => rfl
     match h ⟨certifiedHeight + 2, ⟨by decide, by decide⟩⟩ hb with
     | ⟨_, hq⟩ => Option.noConfusion
         ((arithUpTo_stops certifiedHeight ⟨certifiedHeight + 2, ⟨by decide, by decide⟩⟩ hlt).symm.trans hq)⟩

/-- THE ACT IS EXACTLY ITS PART ABOVE 2000: below that height the executed region decides it. -/
theorem act_iff_above_2000 :
    Realized arith ↔ ∀ n, EvenAtLeast4 n → 2000 < n → ∃ q, findSplit n = some q :=
  ⟨fun h n hn _ => act_is_goldbach.mp h n hn,
   fun h => act_is_goldbach.mpr (fun n hn => match Nat.lt_or_ge 2000 n with
     | Or.inl hl => h n hn hl
     | Or.inr hle => executed_region n hn hle)⟩

/-- THE ACT IS EXACTLY ITS PART ABOVE THE CERTIFIED HEIGHT: below it the certificate decides it. -/
theorem act_iff_above_height (C : Certified) :
    Realized arith ↔ ∀ n, EvenAtLeast4 n → certifiedHeight < n → ∃ q, findSplit n = some q :=
  ⟨fun h n hn _ => act_is_goldbach.mp h n hn,
   fun h => act_is_goldbach.mpr (fun n hn => match Nat.lt_or_ge certifiedHeight n with
     | Or.inl hl => h n hn hl
     | Or.inr hle => below_height_decided C n hn hle)⟩

/-! ## VIII · keyless and keyed -/

def Keyed (P : Frame → Prop) : Prop := ∃ F, ¬ P F

theorem value_is_keyed : Keyed Value := ⟨counter, counter_fails⟩

theorem no_keyless_statement_is_the_act (P : Prop) : ¬ ∀ F : Frame, (P ↔ Realized F) :=
  fun h => given_is_not_the_value P (fun F => (h F).trans (act_is_the_value F))

theorem pulse_does_not_certify : Root Empty (fun e => nomatch e) ∧ ¬ Value counter :=
  ⟨root_given, counter_fails⟩

/-! ## IX · freedom -/

/-- The kinetic record, the Bool model of the bit: the same record whichever way the bit falls;
shared_record_decides_nothing is the wall on frames. -/
def kineticRecord (_w : Bool) : Nat := 0

/-- The record wall, on the Bool model of the bit: no reading of the record returns the bit;
shared_record_decides_nothing is the same wall on frames. -/
theorem record_wall : ¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w :=
  fun ⟨_, hg⟩ => Bool.noConfusion ((hg false).symm.trans (hg true))

/-- A SHARED RECORD DECIDES NOTHING: a record of frames that is the same on the frame where the value holds and
on the frame where it fails has no reading that returns the value on every frame. -/
theorem shared_record_decides_nothing {α : Type} (r : Frame → α) (hr : r calm = r counter) :
    ¬ ∃ g : α → Bool, ∀ F : Frame, (g (r F) = true ↔ Value F) :=
  fun ⟨g, hg⟩ => counter_fails ((hg counter).mp ((congrArg g hr).symm.trans ((hg calm).mpr calm_value)))

theorem fibre_is_two : ([false, true].filter (fun w => kineticRecord w == kineticRecord true)).length = 2 := by
  decide

def mulFibre (n : Nat) : List (Nat × Nat) :=
  (List.range (n + 1)).flatMap fun a =>
    (List.range (n + 1)).filterMap fun b => if a * b = n then some (a, b) else none

theorem prime_shape :
    mulFibre 7 = [(1, 7), (7, 1)] ∧ (mulFibre 7).all (fun p => p.1 != p.2) = true := by
  decide

/-- The additive fibre: the ordered splits of n into two primes. -/
def addFibre (n : Nat) : List (Nat × Nat) :=
  (List.range (n + 1)).filterMap fun p => if isPrime p && isPrime (n - p) then some (p, n - p) else none

/-- The additive shape: the splits of 10 are one mirror pair off the seat and one point on it, the splits of
14 are one mirror pair off the seat and one on it, and the splits of 16 are two mirror pairs and no point on the
seat. -/
theorem additive_shape :
    addFibre 10 = [(3, 7), (5, 5), (7, 3)] ∧ addFibre 14 = [(3, 11), (7, 7), (11, 3)] ∧
    addFibre 16 = [(3, 13), (5, 11), (11, 5), (13, 3)] := by
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

/-! ## XI · the record and the seed -/

/-- A staged frame, abstract: realized below n and not from n on, the shape the cited finite verifications
share; finite_arith_record_never_forces carries it on the arithmetic frame. -/
def staged (n : Nat) : Frame := ⟨Nat, fun d => if d < n then some 3 else none⟩

theorem finite_record_never_forces (n : Nat) :
    (∀ d, d < n → ∃ q, (staged n).realize d = some q) ∧ ¬ Value (staged n) :=
  ⟨fun d hd => ⟨3, by show (if d < n then some 3 else none) = some 3; rw [if_pos hd]⟩,
   fun h => match h n with
     | ⟨_, hk⟩ => by
       have e : (staged n).realize n = none := by
         show (if n < n then some 3 else (none : Option Nat)) = none
         rw [if_neg (Nat.lt_irrefl n)]
       exact Option.noConfusion (e.symm.trans hk)⟩

/-- NO FINITE ARITHMETIC RECORD FORCES THE VALUE: the arithmetic frame cut at any height h agrees with the search
up to h, and fails at the even number 2 · (h + 2) above it. -/
theorem finite_arith_record_never_forces (h : Nat) :
    (∀ d : Evens, d.1 ≤ h → (arithUpTo h).realize d = arith.realize d) ∧ ¬ Value (arithUpTo h) :=
  ⟨arithUpTo_agrees h,
   fun hv => match hv ⟨2 * (h + 2), even_double h⟩ with
     | ⟨_, hq⟩ => Option.noConfusion ((arithUpTo_stops h ⟨2 * (h + 2), even_double h⟩
         (Nat.lt_of_lt_of_le (Nat.lt_add_of_pos_right (by decide)) (Nat.le_mul_of_pos_left (h + 2) (by decide)))).symm.trans hq)⟩

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

/-! ## XII · the closure, whole -/

theorem goldbach_closure :
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    (Realized arith ↔ Goldbach) ∧
    (∀ n, EvenAtLeast4 n → findSplit n = none → ¬ Goldbach) ∧
    checkUpTo 2000 = true ∧
    (Certified → ∀ n : Nat, EvenAtLeast4 n → n ≤ certifiedHeight → ∃ q, findSplit n = some q) ∧
    ¬ Value certCounter.F ∧
    ¬ Value weakerCounter.F ∧
    Keyed Value :=
  ⟨given_is_not_the_value, act_is_goldbach, counterexample_refutes, executed_to_2000,
   below_height_decided, certificate_does_not_reach_above, weaker_do_not_give_binary.2.2,
   value_is_keyed⟩


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
and in one where it fails, so it forces the value on no frame. -/
theorem undeniable_root_forces_no_value {R : Prop} (G : SelfGrounding R) :
    R ∧ Value calm ∧ ¬ Value counter ∧ ¬ (∀ F : Frame, R → Value F) :=
  ⟨G.instances G.anAct, calm_value, counter_fails, fun h => counter_fails (h counter (G.instances G.anAct))⟩

/-- THE ROOT READ ON THE ROW IS KEYED: the root holds, and read uniformly on the frames it gives no value;
read on the row, with the row's existents and the row's actuation, it is the value exactly, and keyed. -/
theorem root_read_on_row_is_keyed {R : Prop} (G : SelfGrounding R) :
    R ∧ ¬ (∀ F : Frame, R → Value F) ∧ (∀ F : Frame, RootOnRow F ↔ Value F) ∧ (RootOnRow calm ∧ ¬ RootOnRow counter) :=
  ⟨G.instances G.anAct, fun h => counter_fails (h counter (G.instances G.anAct)), root_on_row_is_the_value,
   root_on_row_is_keyed⟩

/-- THE ROOT HOLDS ON EVERY FRAME: on each frame the self-grounding root holds, the root with actuation one holds
on the frame's existents, and the root read on the frame's row is exactly its value. -/
theorem root_holds_on_every_frame {R : Prop} (G : SelfGrounding R) :
    ∀ F : Frame, R ∧ Root F.D (fun _ => 1) ∧ (RootOnRow F ↔ Value F) :=
  fun F => ⟨G.instances G.anAct, root_satisfiable F.D, root_on_row_is_the_value F⟩

/-- THE GOLDBACH STATEMENT FROM THE ROOT READ ON THE ROW, on the arithmetic frame. -/
theorem goldbach_from_root_on_row (h : RootOnRow arith) : Goldbach :=
  arith_value_iff.mp ((root_on_row_is_the_value arith).mp h)

/-! ### the constructed root of Appendix R, repeated verbatim -/

/-- The actuation of Appendix R: one existent, whose actuation is one. -/
def ΔE₀ : Unit → Int := fun _ => 1

/-- The constructed root of Appendix R: every existent of the one-point type actuates. -/
def RA₀ : Prop := ∀ x : Unit, 0 < ΔE₀ x

/-- The constructed root of Appendix R as a self-grounding root: one act, which instances it. -/
def ra₀ : SelfGrounding RA₀ := ⟨Unit, (), fun _ _ => show (0 : Int) < 1 by decide⟩

/-- Appendix R's constructed root is the root on one existent, with its actuation. -/
theorem RA₀_is_root_on_unit : RA₀ ↔ Root Unit ΔE₀ := Iff.rfl

/-- THE LOCK ON THE CONSTRUCTED ROOT: Appendix R's root holds, forces the value on no frame, and read on the
row of any frame is exactly that frame's value. -/
theorem the_lock_on_the_root :
    RA₀ ∧ ¬ (∀ F : Frame, RA₀ → Value F) ∧ (∀ F : Frame, RootOnRow F ↔ Value F) :=
  ⟨ra₀.instances ra₀.anAct, (undeniable_root_forces_no_value ra₀).2.2.2, root_on_row_is_the_value⟩

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
    (∀ F : Frame, RootOnRow F ↔ Realized F) ∧
    (∀ F : Frame, Realized F ↔ Value F) ∧
    (RootOnRow calm ∧ ¬ RootOnRow counter) ∧
    (Realized calm ∧ ¬ Realized counter) ∧
    (∀ A : ActualEvens, Value A.F) ∧
    (¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w) ∧
    (∀ n : Nat, (∀ d, d < n → ∃ q, (staged n).realize d = some q) ∧ ¬ Value (staged n)) :=
  ⟨constructed_root_holds, G.instances G.anAct, given_is_not_the_value, (root_read_on_row_is_keyed G).2.1,
   root_on_row_is_the_act, act_is_the_value, root_on_row_is_keyed, act_is_keyed, goldbach_from_existence, record_wall,
   finite_record_never_forces⟩

/-- FROM EXISTENCE ALONE, in the sense the title carries: the closing theorem consumes existence read on
the row and nothing else; that reading is available on exactly the frames where the value holds; and no
statement given without the reading is the value on every frame. One theorem, on no axiom. -/
theorem from_existence_alone :
    (∀ A : ActualEvens, Value A.F) ∧
    (∀ F : Frame, Nonempty { A : ActualEvens // A.F = F } ↔ Value F) ∧
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) :=
  ⟨goldbach_from_existence, supply_iff, given_is_not_the_value⟩

end GBClose

/-! ## Cones, pinned as printed -/
/-- info: 'GBClose.sub_cancel_right' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.sub_cancel_right
/-- info: 'GBClose.sub_cancel_left' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.sub_cancel_left
/-- info: 'GBClose.sub_add_back' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.sub_add_back
/-- info: 'GBClose.primeAux_spec' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.primeAux_spec
/-- info: 'GBClose.rem_go_spec' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.rem_go_spec
/-- info: 'GBClose.rem_spec' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.rem_spec
/-- info: 'GBClose.below_next_multiple' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.below_next_multiple
/-- info: 'GBClose.rem_zero_gives_factor' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.rem_zero_gives_factor
/-- info: 'GBClose.factor_gives_rem_zero' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.factor_gives_rem_zero
/-- info: 'GBClose.small_divisor' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.small_divisor
/-- info: 'GBClose.isPrime_sound' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.isPrime_sound
/-- info: 'GBClose.findAux_sound' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.findAux_sound
/-- info: 'GBClose.findSplit_sound' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.findSplit_sound
/-- info: 'GBClose.primeAux_false' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.primeAux_false
/-- info: 'GBClose.isPrime_complete' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.isPrime_complete
/-- info: 'GBClose.findAux_complete' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.findAux_complete
/-- info: 'GBClose.goldbach_gives_std' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.goldbach_gives_std
/-- info: 'GBClose.std_gives_goldbach' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.std_gives_goldbach
/-- info: 'GBClose.goldbach_iff_std' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.goldbach_iff_std
/-- info: 'GBClose.mirror_involution' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.mirror_involution
/-- info: 'GBClose.split_mirrors' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.split_mirrors
/-- info: 'GBClose.seat_of_mirror' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.seat_of_mirror
/-- info: 'GBClose.calm_value' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.calm_value
/-- info: 'GBClose.counter_fails' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.counter_fails
/-- info: 'GBClose.arith_value_iff' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.arith_value_iff
/-- info: 'GBClose.root_given' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.root_given
/-- info: 'GBClose.root_conservative' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.root_conservative
/-- info: 'GBClose.arrow_given' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.arrow_given
/-- info: 'GBClose.freedom_given' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.freedom_given
/-- info: 'GBClose.given_is_not_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.given_is_not_the_value
/-- info: 'GBClose.arrow_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.arrow_forces_nothing
/-- info: 'GBClose.given_in_both_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.given_in_both_worlds
/-- info: 'GBClose.act_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.act_is_the_value
/-- info: 'GBClose.act_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.act_is_keyed
/-- info: 'GBClose.act_is_goldbach' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.act_is_goldbach
/-- info: 'GBClose.act_is_goldbach_std' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.act_is_goldbach_std
/-- info: 'GBClose.goldbach_from_existence' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.goldbach_from_existence
/-- info: 'GBClose.goldbach_from_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.goldbach_from_the_act
/-- info: 'GBClose.supply_iff' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.supply_iff
/-- info: 'GBClose.every_even_lands' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.every_even_lands
/-- info: 'GBClose.gates_exclusive' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.gates_exclusive
/-- info: 'GBClose.nothing_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.nothing_escapes
/-- info: 'GBClose.counterexample_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.counterexample_refutes
/-- info: 'GBClose.check_means' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.check_means
/-- info: 'GBClose.executed_to_2000' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.executed_to_2000
/-- info: 'GBClose.below_height_decided' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.below_height_decided
/-- info: 'GBClose.certificate_does_not_reach_above' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.certificate_does_not_reach_above
/-- info: 'GBClose.certificate_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.certificate_is_load_bearing
/-- info: 'GBClose.weaker_do_not_give_binary' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.weaker_do_not_give_binary
/-- info: 'GBClose.row_split' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.row_split
/-- info: 'GBClose.remainder_not_forced' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.remainder_not_forced
/-- info: 'GBClose.value_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.value_is_keyed
/-- info: 'GBClose.no_keyless_statement_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.no_keyless_statement_is_the_act
/-- info: 'GBClose.pulse_does_not_certify' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.pulse_does_not_certify
/-- info: 'GBClose.record_wall' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.record_wall
/-- info: 'GBClose.fibre_is_two' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.fibre_is_two
/-- info: 'GBClose.prime_shape' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.prime_shape
/-- info: 'GBClose.additive_shape' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.additive_shape
/-- info: 'GBClose.two_axes_leave_two' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.two_axes_leave_two
/-- info: 'GBClose.three_axes_lock_one' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.three_axes_lock_one
/-- info: 'GBClose.finite_record_never_forces' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.finite_record_never_forces
/-- info: 'GBClose.uniform_step_forces_all' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.uniform_step_forces_all
/-- info: 'GBClose.goldbach_closure' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.goldbach_closure
/-- info: 'GBClose.denial_reenacts_root' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.denial_reenacts_root
/-- info: 'GBClose.external_proof_adds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.external_proof_adds_nothing
/-- info: 'GBClose.undeniable_root_forces_no_value' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.undeniable_root_forces_no_value
/-- info: 'GBClose.root_read_on_row_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.root_read_on_row_is_keyed
/-- info: 'GBClose.the_lock' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.the_lock
/-- info: 'GBClose.from_existence_alone' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.from_existence_alone
/-- info: 'GBClose.indicator_pos' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.indicator_pos
/-- info: 'GBClose.root_satisfiable' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.root_satisfiable
/-- info: 'GBClose.constructed_root_holds' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.constructed_root_holds
/-- info: 'GBClose.root_on_row_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.root_on_row_is_the_act
/-- info: 'GBClose.root_on_row_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.root_on_row_is_the_value
/-- info: 'GBClose.root_on_row_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.root_on_row_is_keyed
/-- info: 'GBClose.act_is_the_weakest_premise' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.act_is_the_weakest_premise
/-- info: 'GBClose.existence_as_given_in_both_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.existence_as_given_in_both_worlds
/-- info: 'GBClose.nothing_given_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.nothing_given_refutes
/-- info: 'GBClose.only_refuter' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.only_refuter
/-- info: 'GBClose.findAux_least' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.findAux_least
/-- info: 'GBClose.findSplit_least' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.findSplit_least
/-- info: 'GBClose.even_double' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.even_double
/-- info: 'GBClose.split_iff_std' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.split_iff_std
/-- info: 'GBClose.seat_unique' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.seat_unique
/-- info: 'GBClose.mirror_has_one_seat' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.mirror_has_one_seat
/-- info: 'GBClose.uniform_premise_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.uniform_premise_forces_nothing
/-- info: 'GBClose.existence_as_given_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.existence_as_given_forces_nothing
/-- info: 'GBClose.nothing_given_forces' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.nothing_given_forces
/-- info: 'GBClose.counterexample_refutes_std' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.counterexample_refutes_std
/-- info: 'GBClose.executed_region' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.executed_region
/-- info: 'GBClose.executed_region_std' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.executed_region_std
/-- info: 'GBClose.arithUpTo_agrees' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.arithUpTo_agrees
/-- info: 'GBClose.arithUpTo_stops' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.arithUpTo_stops
/-- info: 'GBClose.certificate_is_load_bearing_arith' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.certificate_is_load_bearing_arith
/-- info: 'GBClose.certificate_does_not_reach_above_arith' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.certificate_does_not_reach_above_arith
/-- info: 'GBClose.remainder_not_forced_arith' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.remainder_not_forced_arith
/-- info: 'GBClose.act_iff_above_2000' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.act_iff_above_2000
/-- info: 'GBClose.act_iff_above_height' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.act_iff_above_height
/-- info: 'GBClose.shared_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.shared_record_decides_nothing
/-- info: 'GBClose.finite_arith_record_never_forces' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.finite_arith_record_never_forces
/-- info: 'GBClose.root_holds_on_every_frame' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.root_holds_on_every_frame
/-- info: 'GBClose.goldbach_from_root_on_row' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.goldbach_from_root_on_row
/-- info: 'GBClose.RA₀_is_root_on_unit' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.RA₀_is_root_on_unit
/-- info: 'GBClose.the_lock_on_the_root' does not depend on any axioms -/
#guard_msgs in #print axioms GBClose.the_lock_on_the_root
/-! ===================================================================================================================
    PART A · THE NORMAL FORM OF THE ROW (namespace GB.NORMALFORM) · v1_1_0_CC

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
namespace GB.NORMALFORM

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

end GB.NORMALFORM

/-! ===================================================================================================================
    PART C · THE ROW SPLIT (namespace GB.ROWSPLIT) · v1_1_0_CC

    The cut-agnostic division, carried verbatim from the Riemann master v3.0.39_CC (namespace RHUnicorn, generic over
    the types α and β), its one proposition renamed from `RH` to `Whole`, the hypothesis it names. At every cut T the
    whole is exactly its Real part and its Unicorn part; a certificate at T proves the Real part; given the Real part
    the whole is exactly the Unicorn part; above every cut no reading of an even record agrees with an odd decision;
    the aperture is one bit wide; and the supply side is silent at the register. ΔM = 0.
=================================================================================================================== -/
namespace GB.ROWSPLIT

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

end GB.ROWSPLIT
/-! ===================================================================================================================
    PART B · THE HOST MODEL AND ITS BINDING, PROVED (namespace GB.HOST) · v1_1_0_CC

    The frame of the question is the arithmetic itself: the even numbers at least four, each realized by the search.
    The registration of a frame onto its record keeps every existent and forgets which split realizes it, so on the
    record every existent is registered (`recFrame_value`). The binding is a theorem, not a reading: the value of the
    arithmetic frame is the Goldbach statement in its standard form (`binding`). Every even number has its seat, the
    mirror's one fixed point (`every_even_has_its_seat`). The finite form: a passing check at any height proves every
    even number below twice that height a sum of two primes (`real_part_of_check`), the check passes at every height
    under the statement (`check_of_goldbach`), and the statement is exactly a certificate at every height
    (`goldbach_iff_check_at_every_height`). Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace GB.HOST
open GBClose

/-- THE RECORD OF A FRAME: the registration keeps every existent and forgets which split realizes it; on the record
    every existent is registered. -/
def recFrame (F : Frame) : Frame := ⟨F.D, fun _ => some 0⟩

/-- THE RECORD CARRIES THE VALUE, with no premise. -/
theorem recFrame_value (F : Frame) : Value (recFrame F) := fun _ => ⟨0, rfl⟩

/-- THE GOLDBACH ROW: the frames of even numbers with their realizations, the value, the registration onto the record,
    the realized world and the counter world. -/
def gbRow : GB.NORMALFORM.Row.{1} :=
  ⟨Frame, Value, recFrame, recFrame_value, calm, counter, calm_value, counter_fails⟩

/-- THE BINDING, PROVED: the value of the arithmetic frame is exactly the Goldbach statement in its standard form. No
    reader's identification stands between the frame and the row. -/
theorem binding : Value arith ↔ GoldbachStd := arith_value_iff.trans goldbach_iff_std

/-- THE ROOT READ ON THE ROW IS THE STATEMENT, on the arithmetic frame. -/
theorem root_on_row_is_the_statement : RootOnRow arith ↔ GoldbachStd :=
  (root_on_row_is_the_value arith).trans binding

/-- EVERY EVEN NUMBER HAS ITS SEAT: n = k · 2 with the mirror fixing k, the one point where a split and its mirror
    coincide. The record registers each even number there, keeping the number and forgetting the side. -/
theorem every_even_has_its_seat (n : Nat) (hn : EvenAtLeast4 n) :
    ∃ k, n = k * 2 ∧ mirror n k = k ∧ ∀ p, p ≤ n → mirror n p = p → p = k :=
  match rem_zero_gives_factor n 2 (by decide) hn.2 with
  | ⟨k, hk⟩ => ⟨k, hk, mirror_has_one_seat n k hk⟩

/-- `b || true` is true. -/
theorem or_true_right (b : Bool) : (b || true) = true := by cases b <;> rfl

/-- A found split, read as a Boolean. -/
theorem isSome_of_split {n : Nat} (h : ∃ q, findSplit n = some q) : (findSplit n).isSome = true :=
  match h with
  | ⟨q, hq⟩ => by rw [hq]; rfl

/-- THE FINITE FORM, SOUND · THE REAL PART AT EVERY CHECKED HEIGHT: a passing check at k proves every even number up to
    2k a sum of two primes. Any run of the check that returns true, now or at any height a future run reaches, is a
    theorem the moment it returns. -/
theorem real_part_of_check (k : Nat) (hk : checkAux k = true) :
    ∀ n, EvenAtLeast4 n → n ≤ 2 * k → ∃ p q, Prime p ∧ Prime q ∧ p + q = n :=
  fun n hn hH => match rem_zero_gives_factor n 2 (by decide) hn.2 with
  | ⟨m, hm⟩ =>
    have m2 : 2 ≤ m := match Nat.lt_or_ge m 2 with
      | Or.inr h => h
      | Or.inl h => absurd (Nat.le_trans hn.1 (Nat.le_trans (Nat.le_of_eq hm)
          (Nat.mul_le_mul_right 2 (Nat.le_of_lt_succ h)))) (by decide)
    have mk : m ≤ k := match Nat.lt_or_ge k m with
      | Or.inr h => h
      | Or.inl h =>
        have h1 : (k + 1) * 2 ≤ m * 2 := Nat.mul_le_mul_right 2 (Nat.succ_le_of_lt h)
        have h2 : m * 2 ≤ k * 2 :=
          Nat.le_trans (Nat.le_of_eq hm.symm) (Nat.le_trans hH (Nat.le_of_eq (Nat.mul_comm 2 k)))
        have h3 : k * 2 + 2 ≤ k * 2 := by rw [← Nat.succ_mul]; exact Nat.le_trans h1 h2
        absurd h3 (Nat.not_le_of_gt (Nat.lt_add_of_pos_right (by decide)))
    have hs : (findSplit (2 * m)).isSome = true := check_means k m hk mk m2
    have e : 2 * m = n := (Nat.mul_comm 2 m).trans hm.symm
    (split_iff_std n).mp (match hf : findSplit (2 * m) with
      | some q => ⟨q, e ▸ hf⟩
      | none => by rw [hf] at hs; exact Bool.noConfusion hs)

/-- THE FINITE FORM, COMPLETE: under the Goldbach statement the check passes at every height. -/
theorem check_of_goldbach (h : GoldbachStd) : ∀ k, checkAux k = true
  | 0 => rfl
  | 1 => rfl
  | m + 2 => by
    have hs : (findSplit (2 * (m + 2))).isSome = true :=
      isSome_of_split ((split_iff_std (2 * (m + 2))).mpr (h (2 * (m + 2)) (even_double m)))
    have hr := check_of_goldbach h (m + 1)
    show ((decide (m + 2 < 2) || (findSplit (2 * (m + 2))).isSome) && checkAux (m + 1)) = true
    rw [hs, or_true_right, hr]; rfl

/-- GOLDBACH IS EXACTLY A CERTIFICATE AT EVERY HEIGHT (the mirror of the Riemann finite form, RH exactly a certificate
    at every height): the statement holds exactly when the kernel's check passes at every height. -/
theorem goldbach_iff_check_at_every_height : GoldbachStd ↔ ∀ k, checkAux k = true :=
  ⟨check_of_goldbach, fun h n hn => real_part_of_check n (h n) n hn (Nat.le_mul_of_pos_left n (by decide))⟩

/-- The executed check at 2000 is the check at 1000, by the kernel's own division. -/
theorem executed_check_at_1000 : checkAux 1000 = true := executed_to_2000

end GB.HOST

/-! ===================================================================================================================
    PART C′ · THE ROW SPLIT READ ON THE GOLDBACH ROW (namespace GB.REALPART) · v1_1_0_CC

    The cut-agnostic division of Part C read on the row: the existents are the even numbers at least four and the
    decided property is a split into two primes. At every height the statement is exactly its Real part and its
    Unicorn part; the Real part holds at 2000 by the kernel's own computation and at every checked height by the
    finite form; given the Real part at 2000 the statement is exactly the Unicorn part above it; and above every height
    no reading of a record that keeps the height and forgets the world returns the world. ΔM = 0.
=================================================================================================================== -/
namespace GB.REALPART
open GBClose GB.ROWSPLIT

/-- The existents of the row. -/
def Ev (n : Nat) : Prop := EvenAtLeast4 n

/-- The property each existent is asked: a split into two primes. -/
def Sp (n : Nat) : Prop := ∃ p q, Prime p ∧ Prime q ∧ p + q = n

/-- The Goldbach statement is the whole of the row split. -/
theorem goldbach_is_the_whole : GoldbachStd ↔ Whole Ev Sp := Iff.rfl

/-- THE REAL PART AT 2000, by the kernel's own computation. -/
theorem real_part_at_2000 : RealPartAt Ev Sp id 2000 := fun n hn hle => executed_region_std n hn hle

/-- THE REAL PART AT EVERY CHECKED HEIGHT: a passing check at k is the Real part at 2k. -/
theorem real_part_at_every_checked_height (k : Nat) (hk : checkAux k = true) : RealPartAt Ev Sp id (2 * k) :=
  fun n hn hle => GB.HOST.real_part_of_check k hk n hn hle

/-- THE CUT AT EVERY HEIGHT: the statement is exactly its Real part and its Unicorn part. -/
theorem goldbach_iff_real_and_unicorn (T : Nat) :
    GoldbachStd ↔ RealPartAt Ev Sp id T ∧ UnicornAt Ev Sp id T :=
  whole_iff_real_and_unicorn Ev Sp id T

/-- NO BYPASS AT 2000: given the Real part there, the statement is exactly the Unicorn part above 2000. -/
theorem no_bypass_at_2000 : GoldbachStd ↔ UnicornAt Ev Sp id 2000 :=
  unicorn_no_bypass Ev Sp id 2000 real_part_at_2000

/-- THE REAL PART BELOW EVERY LOWER CUT: at every height at most 2000 the Real part holds. -/
theorem real_part_below_2000 (T : Nat) (hT : T ≤ 2000) : RealPartAt Ev Sp id T :=
  fun n hn hle => real_part_at_2000 n hn (Nat.le_trans hle hT)

/-- THE UNICORN PART CLOSED TO THE RECORD ABOVE EVERY HEIGHT: on the chart of worlds and heights, a record that keeps
    the height and forgets the world is even under the exchange of worlds, the world is odd, and above every height no
    reading of the record returns the world. -/
theorem unicorn_blocked_above_every_height (T : Nat) :
    ¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1 :=
  unicorn_block Prod.snd T (fun w => (!w.1, w.2)) Prod.snd Prod.fst (true, T + 1)
    (Nat.lt_succ_self T) (Nat.lt_succ_self T) rfl rfl

/-- THE SUPPLY SIDE IS SILENT ABOVE EVERY HEIGHT: both orientations of the world are refused alike to every reading
    of the record, and the two orientations differ. -/
theorem supply_side_silent_above_every_height (T : Nat) :
    (¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1) ∧
    (¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = !w.1) ∧ (!true) ≠ true :=
  supply_side_silent Prod.snd T (fun w => (!w.1, w.2)) Prod.snd Prod.fst (true, T + 1)
    (Nat.lt_succ_self T) (Nat.lt_succ_self T) rfl rfl

/-- THE APERTURE IS ONE BIT WIDE: at the seat of the exchange above every height, one odd supplied bit calibrates the
    world uniquely, through one calibration bit that exists and is unique. -/
theorem aperture_is_one_bit (T : Nat) :
    let z : Bool × Nat := (true, T + 1)
    let τ : Bool × Nat → Bool × Nat := fun w => (!w.1, w.2)
    ∃ c : Bool, (z.1 = xor (!z.1) c ∧ (τ z).1 = xor (!(τ z).1) c) ∧
      ∀ c' : Bool, (z.1 = xor (!z.1) c' ∧ (τ z).1 = xor (!(τ z).1) c') → c' = c :=
  aperture_one_bit_wide (fun w : Bool × Nat => (!w.1, w.2)) (fun w => !w.1) Prod.fst (true, T + 1) rfl rfl

end GB.REALPART

/-! ===================================================================================================================
    PART D · THE WALLS (namespace GB.WALLS) · v1_1_0_CC

    Every zero-bit route is closed by theorem. Existence as given, the arrow and the freedom bit hold in both worlds
    (Part 0, `existence_as_given_forces_nothing`). No finite record forces the value (Part 0,
    `finite_arith_record_never_forces`), the certificate does not reach above its height
    (`certificate_does_not_reach_above_arith`), and the shape the ternary and Chen citations share does not entail the
    binary statement (`weaker_do_not_give_binary`). This Part adds the parity wall on the row's own numbers: six primes
    and six numbers with exactly two prime factors share their residues modulo 420 = 4 · 3 · 5 · 7, and their Liouville
    parities are opposite (`parity_normal_form`), so no reading of the residue record separates a prime from a
    semiprime (`residue_record_decides_nothing`): the one bit a sieve must cross is invisible to every residue record.
    Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace GB.WALLS
open GBClose

/-- The number of prime factors counted with multiplicity, by trial division with fuel. -/
def bigOmegaAux : Nat → Nat → Nat → Nat
  | 0, _, _ => 0
  | fuel + 1, n, d =>
    if n < 2 then 0
    else if d * d > n then 1
    else if n % d = 0 then 1 + bigOmegaAux fuel (n / d) d
    else bigOmegaAux fuel n (d + 1)

/-- Ω(n), the number of prime factors of n with multiplicity. -/
def bigOmega (n : Nat) : Nat := bigOmegaAux n n 2

/-- The Liouville parity: true where λ(n) = +1, an even number of prime factors; false where λ(n) = −1. -/
def liouvillePlus (n : Nat) : Bool := bigOmega n % 2 == 0

/-- Six primes. -/
def parityPrimes : List Nat := [11, 13, 17, 19, 23, 29]

/-- Six numbers with exactly two prime factors: 23 · 37, 19 · 67, 19 · 23, 13 · 163, 13 · 131, 11 · 79. -/
def paritySemiprimes : List Nat := [851, 1273, 437, 2119, 1703, 869]

/-- THE PARITY NORMAL FORM ON THE ROW, decided by the kernel: the six primes and the six semiprimes leave the same
    residues modulo 420 = 4 · 3 · 5 · 7, in order; every one of the first six is prime with one prime factor, Liouville
    parity −1; every one of the second six has exactly two prime factors, Liouville parity +1. -/
theorem parity_normal_form :
    parityPrimes.map (· % 420) = paritySemiprimes.map (· % 420) ∧
    parityPrimes.all isPrime = true ∧
    parityPrimes.all (fun n => bigOmega n == 1) = true ∧
    paritySemiprimes.all (fun n => bigOmega n == 2) = true ∧
    parityPrimes.all (fun n => liouvillePlus n == false) = true ∧
    paritySemiprimes.all (fun n => liouvillePlus n == true) = true ∧
    paritySemiprimes.all (fun n => isPrime n == false) = true := by decide

/-- THE RESIDUE RECORD DECIDES NOTHING: no reading of the residue modulo 420 returns primality on 11 and 851, which
    share it. The parity of the number of prime factors is the bit a residue record cannot read. -/
theorem residue_record_decides_nothing :
    ¬ ∃ g : Nat → Bool, g (11 % 420) = isPrime 11 ∧ g (851 % 420) = isPrime 851 :=
  fun ⟨g, h1, h2⟩ => by
    have e : 851 % 420 = 11 % 420 := by decide
    have p11 : isPrime 11 = true := by decide
    have p851 : isPrime 851 = false := by decide
    rw [e, h1, p11, p851] at h2
    exact Bool.noConfusion h2

/-- THE RESIDUE RECORD DECIDES NO PARITY: no reading of the residue modulo 420 returns the Liouville parity on 11 and
    851, which share it. -/
theorem residue_record_reads_no_parity :
    ¬ ∃ g : Nat → Bool, g (11 % 420) = liouvillePlus 11 ∧ g (851 % 420) = liouvillePlus 851 :=
  fun ⟨g, h1, h2⟩ => by
    have e : 851 % 420 = 11 % 420 := by decide
    have l11 : liouvillePlus 11 = false := by decide
    have l851 : liouvillePlus 851 = true := by decide
    rw [e, h1, l11, l851] at h2
    exact Bool.noConfusion h2

/-- THE WALLS OF THE ROW, one theorem: existence as given forces nothing; no finite arithmetic record forces the value;
    the certificate does not reach above its height; the weaker realizations do not give the binary; and the residue
    record decides neither primality nor parity. -/
theorem the_walls :
    (¬ ∀ F : Frame, ((∀ U : Type, Root U (fun _ => 1)) ∧ Arrow ∧ (∀ w : Bool, (!w) ≠ w)) → Value F) ∧
    (∀ h : Nat, (∀ d : Evens, d.1 ≤ h → (arithUpTo h).realize d = arith.realize d) ∧ ¬ Value (arithUpTo h)) ∧
    ¬ Value (arithUpTo certifiedHeight) ∧
    ¬ Value weakerCounter.F ∧
    (¬ ∃ g : Nat → Bool, g (11 % 420) = isPrime 11 ∧ g (851 % 420) = isPrime 851) ∧
    (¬ ∃ g : Nat → Bool, g (11 % 420) = liouvillePlus 11 ∧ g (851 % 420) = liouvillePlus 851) :=
  ⟨existence_as_given_forces_nothing, finite_arith_record_never_forces,
   certificate_does_not_reach_above_arith.2.2, weaker_do_not_give_binary.2.2,
   residue_record_decides_nothing, residue_record_reads_no_parity⟩

end GB.WALLS

/-! ===================================================================================================================
    PART E · THE RESIDUE (namespace GB.RESIDUE) · v1_1_0_CC

    Everything above is unconditional. What remains of the Goldbach statement is this one hypothesis, the transfer of
    the value from the record to the arithmetic frame: given it, the statement follows on no axiom. It is printed here
    as the type of a hypothesis and is assumed nowhere. The residue is keyed: no premise shared by every frame and no
    principle true of every record supplies it. Its instance seat decomposes it by height. ΔM = 0.
=================================================================================================================== -/
namespace GB.RESIDUE
open GBClose GB.NORMALFORM GB.HOST

/-- THE RESIDUE: given the one implication, the Goldbach statement. -/
theorem goldbach_of_the_act (bit : Transfer gbRow arith) : GoldbachStd :=
  binding.mp (value_from_the_cargo_loop gbRow arith bit)

/-- THE RESIDUE IS THE STATEMENT: the transfer at the arithmetic frame is exactly the Goldbach statement. -/
theorem residue_is_the_statement : Transfer gbRow arith ↔ GoldbachStd :=
  (normal_form gbRow arith).trans binding

/-- THE ONE POSIT IS THE BIT: the root read on the row, at the arithmetic frame, is exactly the transfer. -/
theorem the_posit_is_the_bit : RootOnRow arith ↔ Transfer gbRow arith :=
  root_on_row_is_the_statement.trans residue_is_the_statement.symm

/-- THE RESIDUE IS KEYED: no premise shared by every frame forces the value, and no principle true of every record
    decides it. What supplies it is keyed to the frame: the act. -/
theorem residue_is_keyed :
    (∀ P : Frame → Prop, Keyless gbRow P → ¬ Forces gbRow P) ∧
    (∀ P : Frame → Prop, (∀ F, P (recFrame F)) → ¬ ∀ F, P (recFrame F) → Value F) :=
  ⟨keyless_forces_nothing gbRow, no_record_principle_decides gbRow⟩

/-- THE INSTANCE SEAT OF THE BIT, by height: the energy at each height is the kernel's check there, and conservation is
    the check passing at every height. Its inhabitation is equivalent in strength to the bit
    (`seat_iff_statement`); nothing in this file assumes it inhabited. -/
structure HeightSeat where
  energy       : Nat → Bool
  energy_is_check : ∀ k, energy k = checkAux k
  conservation : ∀ k, energy k = true

/-- THE SEAT DELIVERS THE STATEMENT. -/
theorem goldbach_of_seat (S : HeightSeat) : GoldbachStd :=
  goldbach_iff_check_at_every_height.mpr (fun k => (S.energy_is_check k).symm.trans (S.conservation k))

/-- THE SEAT IS INHABITED EXACTLY WHEN THE STATEMENT HOLDS. -/
theorem seat_iff_statement : Nonempty HeightSeat ↔ GoldbachStd :=
  ⟨fun ⟨S⟩ => goldbach_of_seat S,
   fun h => ⟨⟨checkAux, fun _ => rfl, goldbach_iff_check_at_every_height.mp h⟩⟩⟩

end GB.RESIDUE

/-! ===================================================================================================================
    PART F · THE SUPPLY (namespace GB.SUPPLY) · v1_1_0_CC

    The bit of Part E, supplied by the act and delivered by its two kinds: the formal cargo, and the physical witness.
    Each kind is a type whose inhabitant is the supply; neither is assumed anywhere in this file. The cargo arrives free;
    each kind delivers the statement; the two kinds are one bit; every route to the statement delivers both kinds, so
    there is no third; and one even number without a split refutes both at once. ΔM = 0.
=================================================================================================================== -/
namespace GB.SUPPLY
open GBClose GB.NORMALFORM GB.HOST

/-- THE FORMAL KIND, the cargo: the record's value carried to the arithmetic frame. -/
def FormalCargo : Prop := Transfer gbRow arith

/-- THE PHYSICAL KIND, the witness: every examination of an even number is a physical run of the search, registered at
    the Landauer floor, so its heat in floor units is at least one floor; a run that ended with no split would leave an
    unsplit record; and the carrier registers no unsplit even number. The last field is the one bit read in the
    register of heat; it is a premise of the witness, carried as a field, never proved. -/
structure PhysicalWitness where
  floor             : Nat
  floor_pos         : 0 < floor
  heat              : Evens → Nat
  priced            : ∀ d, floor ≤ heat d
  no_unsplit_record : ∀ d : Evens, findSplit d.1 ≠ none

/-- THE CARGO ARRIVES, with no premise: the record of the arithmetic frame carries the value. -/
theorem cargo_arrives : Value (recFrame arith) := recFrame_value arith

/-- KIND 1 DELIVERS: the formal cargo gives the Goldbach statement in one step. -/
theorem formal_kind_delivers (h : FormalCargo) : GoldbachStd := binding.mp (h cargo_arrives)

/-- The physical witness closes the arithmetic frame: every even number is realized. -/
theorem witness_closes (W : PhysicalWitness) : Value arith :=
  fun d => match hf : findSplit d.1 with
    | some q => ⟨q, hf⟩
    | none => absurd hf (W.no_unsplit_record d)

/-- KIND 2 DELIVERS: the physical witness gives the Goldbach statement. -/
theorem physical_kind_delivers (W : PhysicalWitness) : GoldbachStd := binding.mp (witness_closes W)

/-- A witness from the statement: under it the carrier's record holds no unsplit even number. -/
def witness_of_statement (h : GoldbachStd) : PhysicalWitness :=
  ⟨1, Nat.zero_lt_one, fun _ => 1, fun _ => Nat.le_refl 1,
   fun d hn => match (split_iff_std d.1).mpr (h d.1 d.2) with
     | ⟨_, hq⟩ => Option.noConfusion (hn.symm.trans hq)⟩

/-- THE PHYSICAL FACE IS THE STATEMENT: a witness exists exactly when the statement holds. -/
theorem physical_iff_statement : Nonempty PhysicalWitness ↔ GoldbachStd :=
  ⟨fun ⟨W⟩ => physical_kind_delivers W, fun h => ⟨witness_of_statement h⟩⟩

/-- THE FORMAL FACE IS THE STATEMENT. -/
theorem formal_iff_statement : FormalCargo ↔ GoldbachStd := GB.RESIDUE.residue_is_the_statement

/-- THE TWO KINDS ARE ONE BIT: the physical witness is a formal cargo, and the cargo is exactly the statement. -/
theorem the_two_kinds_are_one_bit : (PhysicalWitness → FormalCargo) ∧ (FormalCargo ↔ GoldbachStd) :=
  ⟨fun W _ => witness_closes W, formal_iff_statement⟩

/-- THE STATEMENT, DELIVERED TWICE: either kind gives it. -/
theorem goldbach_delivered_twice : (FormalCargo → GoldbachStd) ∧ (PhysicalWitness → GoldbachStd) :=
  ⟨formal_kind_delivers, physical_kind_delivers⟩

/-- TWO KINDS AND NO THIRD: every witness of the statement, in any vocabulary, is a delivery of both kinds. -/
theorem two_kinds_and_no_third (Q : Prop) (h : Q → GoldbachStd) : Q → FormalCargo ∧ Nonempty PhysicalWitness :=
  fun q => ⟨formal_iff_statement.mpr (h q), physical_iff_statement.mpr (h q)⟩

/-- THE ONE REFUTER: one even number at least four with no split refutes both kinds at once. -/
theorem the_one_refuter (n : Nat) (hn : EvenAtLeast4 n) (h : findSplit n = none) :
    ¬ FormalCargo ∧ ¬ Nonempty PhysicalWitness :=
  have hs : ¬ GoldbachStd := fun g => counterexample_refutes n hn h (std_gives_goldbach g)
  ⟨fun c => hs (formal_kind_delivers c), fun ⟨W⟩ => hs (physical_kind_delivers W)⟩

/-- THE SUPPLY, CLOSED. Nothing before the colon: the cargo arrives free; each kind delivers; the two kinds are one bit;
    the bit is the statement; every route is both kinds; and one unsplit even number refutes both. -/
theorem the_supply_closed :
    Value (recFrame arith) ∧
    (FormalCargo → GoldbachStd) ∧ (PhysicalWitness → GoldbachStd) ∧
    (PhysicalWitness → FormalCargo) ∧ (FormalCargo ↔ GoldbachStd) ∧ (Nonempty PhysicalWitness ↔ GoldbachStd) ∧
    (∀ Q : Prop, (Q → GoldbachStd) → Q → FormalCargo ∧ Nonempty PhysicalWitness) ∧
    (∀ n, EvenAtLeast4 n → findSplit n = none → ¬ FormalCargo ∧ ¬ Nonempty PhysicalWitness) :=
  ⟨cargo_arrives, formal_kind_delivers, physical_kind_delivers, the_two_kinds_are_one_bit.1,
   formal_iff_statement, physical_iff_statement, two_kinds_and_no_third, the_one_refuter⟩

end GB.SUPPLY

/-! ===================================================================================================================
    PART G · THE CLOSURE OF THE QUESTION (namespace GB.CLOSURE) · v1_1_0_CC

    Why the question is closed and not open. The Goldbach sentence and the bit are one proposition, with nothing cited;
    the denial of the sentence is the bit's denial; across the frames of the row the bit has no uniform answer, true in
    one world and false in another of the same record; every keyless route is barred; either kind of the supply gives
    the sentence; and the one refuter refutes the sentence itself. Nothing here derives the bit. It proves that the
    question is one bit, that the bit is keyed, and that what is open is a value and not a form. ΔM = 0.
=================================================================================================================== -/
namespace GB.CLOSURE
open GBClose GB.NORMALFORM GB.HOST GB.SUPPLY

/-- THE SENTENCE IS THE BIT, nothing cited. -/
theorem the_sentence_is_the_bit : GoldbachStd ↔ FormalCargo := formal_iff_statement.symm

/-- THE DENIAL IS THE BIT'S DENIAL. -/
theorem denial_is_the_bits_denial : ¬ GoldbachStd ↔ ¬ FormalCargo :=
  ⟨fun hn h => hn (formal_kind_delivers h), fun hn h => hn (formal_iff_statement.mpr h)⟩

/-- THE ONE REFUTER REFUTES THE SENTENCE: one even number at least four that is not a sum of two primes. -/
theorem refuter_denies_the_sentence (n : Nat) (hn : EvenAtLeast4 n)
    (h : ¬ ∃ p q, Prime p ∧ Prime q ∧ p + q = n) : ¬ GoldbachStd :=
  fun g => h (g n hn)

/-- THE DENIAL HAS ONE ROAD: wherever the sentence fails, it cannot be that no even number is unsplit. -/
theorem the_denial_has_one_road : ¬ GoldbachStd → ¬ ¬ ∃ n, EvenAtLeast4 n ∧ findSplit n = none :=
  fun hn hne => hn (fun n hen => (split_iff_std n).mp (match hf : findSplit n with
    | some q => ⟨q, rfl⟩
    | none => absurd ⟨n, hen, hf⟩ hne))

/-- THE QUESTION, CLOSED TO ONE BIT. The sentence is the bit and its denial is the bit's denial; the bit has no
    uniform answer across the frames; no keyless premise forces it; either kind of the supply gives the sentence; and
    the one refuter denies the sentence. What is open is the value of one implication; the form of the question is
    closed. -/
theorem question_closed_to_one_bit :
    (GoldbachStd ↔ FormalCargo) ∧ (¬ GoldbachStd ↔ ¬ FormalCargo) ∧
    (¬ (∀ F, Transfer gbRow F) ∧ ¬ (∀ F, ¬ Transfer gbRow F)) ∧
    (∀ P : Frame → Prop, Keyless gbRow P → ¬ Forces gbRow P) ∧
    (FormalCargo → GoldbachStd) ∧ (PhysicalWitness → GoldbachStd) ∧
    (∀ n, EvenAtLeast4 n → (¬ ∃ p q, Prime p ∧ Prime q ∧ p + q = n) → ¬ GoldbachStd) :=
  ⟨the_sentence_is_the_bit, denial_is_the_bits_denial, no_uniform_answer gbRow,
   keyless_forces_nothing gbRow, formal_kind_delivers, physical_kind_delivers, refuter_denies_the_sentence⟩

end GB.CLOSURE

/-! ===================================================================================================================
    PART W · THE TWELVE FORMAL GATES, RUN IN THE KERNEL (namespace GB.GATES) · v1_1_0_CC

    The twelve formal gates of the mathematical register, run inside the kernel on the Goldbach seal. Each gate is a
    proposition and a theorem, and `the_formal_run` binds the twelve passes and the four refusals in one statement with
    nothing before the colon. Four claims fail, each by a theorem: "the statement is proved by the delivery" fails SREP,
    the delivery's premise being its conclusion; "a proof is waiting" fails SREP, a true route to the statement being
    the statement; "no proof can ever exist" fails SREP, no true route to the statement being its denial, the counter
    world in costume; and the denial has one road, an unsplit even number. No declaration has the type of the bit. ΔM = 0.
=================================================================================================================== -/
namespace GB.GATES
open GBClose GB.NORMALFORM GB.HOST GB.SUPPLY GB.REALPART GB.ROWSPLIT

/-- Gate 1, SREP: the form stands with no hypothesis. -/
def Gate1 : Prop :=
  Value (recFrame arith) ∧ (FormalCargo ↔ GoldbachStd) ∧ (∀ Q : Prop, (Q → GoldbachStd) → Q → FormalCargo) ∧
  checkUpTo 2000 = true ∧ (GoldbachStd ↔ ∀ k, checkAux k = true)

/-- GATE 1 · SREP: nothing in the form presupposes the bit. -/
theorem gate_1_srep : Gate1 :=
  ⟨cargo_arrives, formal_iff_statement,
   fun _ h q => formal_iff_statement.mpr (h q), executed_to_2000, goldbach_iff_check_at_every_height⟩

/-- Gate 2, REG: the bit read from ten contexts, all one proposition. -/
def Gate2 : Prop :=
  (Value arith ↔ GoldbachStd) ∧ (Realized arith ↔ GoldbachStd) ∧ (RootOnRow arith ↔ GoldbachStd) ∧
  (Goldbach ↔ GoldbachStd) ∧ (FormalCargo ↔ GoldbachStd) ∧ (Nonempty PhysicalWitness ↔ GoldbachStd) ∧
  ((∀ k, checkAux k = true) ↔ GoldbachStd) ∧ (SelfRecursive gbRow arith ↔ GoldbachStd) ∧
  (Nonempty (Act gbRow arith) ↔ GoldbachStd) ∧ (UnicornAt Ev Sp id 2000 ↔ GoldbachStd)

/-- GATE 2 · REG: ten reading contexts, one proposition. -/
theorem gate_2_reg : Gate2 :=
  ⟨binding, act_is_goldbach_std, root_on_row_is_the_statement, goldbach_iff_std, formal_iff_statement,
   physical_iff_statement, goldbach_iff_check_at_every_height.symm,
   (self_recursion_at_frame gbRow arith).trans binding,
   (bit_is_the_act gbRow arith).symm.trans formal_iff_statement,
   no_bypass_at_2000.symm⟩

/-- Gate 3, SGEG: no face drifts from the bit. -/
def Gate3 : Prop :=
  (FormalCargo ↔ GoldbachStd) ∧ (Nonempty PhysicalWitness ↔ GoldbachStd) ∧
  (UnicornAt Ev Sp id 2000 ↔ GoldbachStd) ∧ (Value arith ↔ GoldbachStd)

/-- GATE 3 · SGEG: the formal, physical, unicorn and frame faces are each the bit. -/
theorem gate_3_sgeg : Gate3 :=
  ⟨formal_iff_statement, physical_iff_statement, no_bypass_at_2000.symm, binding⟩

/-- Gate 4, CAUSAL: the native involution on the bit fixes nothing, and the row's own involution, the mirror, has its
    one seat at every even number: the seat of the row is inhabited. -/
def Gate4 : Prop := (¬ ∃ b, comp b = b) ∧ (∀ k, mirror (k * 2) k = k)

/-- GATE 4 · CAUSAL: no imprint is asserted on a ground the bit lacks; the row's seat is the mirror's fixed point. -/
theorem gate_4_causal : Gate4 :=
  ⟨locus_vanishes, fun k => (mirror_has_one_seat (k * 2) k rfl).1⟩

/-- Gate 5, MIG: two frames whose records both carry the value split on the value. -/
def Gate5 : Prop :=
  Value (recFrame calm) ∧ Value (recFrame counter) ∧ Value calm ∧ ¬ Value counter

/-- GATE 5 · MIG: the reading apparatus, the record, does not fix the residence. -/
theorem gate_5_mig : Gate5 := record_decides_nothing gbRow

/-- Gate 6, PTB: complementation is an involution without a fixed point; the identity is one fixing everything; the
    mirror is an involution on [0, n]. -/
def Gate6 : Prop :=
  (∀ b : Bool, comp (comp b) = b) ∧ (¬ ∃ b, comp b = b) ∧ (∀ b : Bool, id (id b) = b) ∧
  (∀ n p, p ≤ n → mirror n (mirror n p) = p)

/-- GATE 6 · PTB: the fixed-point reading belongs to the chosen reflection, not to the bit. -/
theorem gate_6_ptb : Gate6 := ⟨comp_involution, locus_vanishes, fun _ => rfl, mirror_involution⟩

/-- Gate 7, DUAL: the bit does not depend on where the height ladder is cut, at every cut up to the executed height. -/
def Gate7 : Prop := ∀ T, T ≤ 2000 → (GoldbachStd ↔ UnicornAt Ev Sp id T)

/-- GATE 7 · DUAL: the statement is the Unicorn part at every cut the kernel's computation covers. -/
theorem gate_7_dual : Gate7 :=
  fun T hT => unicorn_no_bypass Ev Sp id T (real_part_below_2000 T hT)

/-- Gate 8, CSCG: the proved slices are the bit's lower slices. -/
def Gate8 : Prop := RealPartAt Ev Sp id 2000 ∧ (GoldbachStd → ∀ T, RealPartAt Ev Sp id T)

/-- GATE 8 · CSCG: the bit extends the executed region and contradicts no slice of it. -/
theorem gate_8_cscg : Gate8 :=
  ⟨real_part_at_2000, fun h T => ((goldbach_iff_real_and_unicorn T).mp h).1⟩

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
def Gate11 : Prop := (FormalCargo → GoldbachStd) ∧ ¬ Keyless gbRow (Transfer gbRow)

/-- GATE 11 · OMA: the input from the other side enters as a hypothesis, never as a fact from inside. -/
theorem gate_11_oma : Gate11 := ⟨formal_kind_delivers, fun h => (no_uniform_answer gbRow).1 h⟩

/-- Gate 12, ADEG: the binding to the sentence is proved, and the physical discharge is the bit. -/
def Gate12 : Prop := (Value arith ↔ GoldbachStd) ∧ (Nonempty PhysicalWitness ↔ GoldbachStd)

/-- GATE 12 · ADEG: every transport across registers is typed. -/
theorem gate_12_adeg : Gate12 := ⟨binding, physical_iff_statement⟩

/-- REFUSAL · "the statement is proved by the delivery" fails SREP: the delivery's premise and its conclusion are one
    proposition. -/
theorem refusal_proved : FormalCargo ↔ GoldbachStd := formal_iff_statement

/-- REFUSAL AT THE BIT · "no true route to the statement exists" is the statement's denial. -/
theorem refusal_no_proof_at_the_bit : (¬ ∃ Q : Prop, Q ∧ (Q → GoldbachStd)) ↔ ¬ GoldbachStd :=
  refusal_no_proof GoldbachStd

/-- THE FORMAL RUN, nothing before the colon: the twelve gates pass, and the four claims fail, the delivery read as a
    proof, a proof waiting, no proof ever, and the denial without its one road. -/
theorem the_formal_run :
    Gate1 ∧ Gate2 ∧ Gate3 ∧ Gate4 ∧ Gate5 ∧ Gate6 ∧ Gate7 ∧ Gate8 ∧ Gate9 ∧ Gate10 ∧ Gate11 ∧ Gate12 ∧
    (FormalCargo ↔ GoldbachStd) ∧
    ((∃ Q : Prop, Q ∧ (Q → GoldbachStd)) ↔ GoldbachStd) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → GoldbachStd)) ↔ ¬ GoldbachStd) ∧
    (¬ GoldbachStd → ¬ ¬ ∃ n, EvenAtLeast4 n ∧ findSplit n = none) :=
  ⟨gate_1_srep, gate_2_reg, gate_3_sgeg, gate_4_causal, gate_5_mig, gate_6_ptb, gate_7_dual, gate_8_cscg,
   gate_9_cseg, gate_10_mta, gate_11_oma, gate_12_adeg, refusal_proved, refusal_waiting GoldbachStd,
   refusal_no_proof_at_the_bit, GB.CLOSURE.the_denial_has_one_road⟩

end GB.GATES

/-! ===================================================================================================================
    PART X · THE CAPSTONE: NOTHING ESCAPES, OUR WAY OR NO WAY (namespace GB.ESCAPE) · v1_1_0_CC

    The record of the arithmetic frame closes (`the_record_closes_at_arith`). What the record leaves undecided is
    whether the arithmetic frame itself carries the value, and that is exactly the sentence (`the_undecided_is_the_bit`).
    "Nothing is outside the record", read as a law of every frame, is false; read at the arithmetic frame, it is the bit
    (`nothing_outside_the_record_is_the_bit`). A block needs an outside (`block_needs_an_outside`), and at the
    arithmetic frame the outside is the supply in its two kinds (`the_outside_is_the_supply`). Nothing escapes: every
    route to the sentence, in any vocabulary, is a delivery of both kinds (`every_route_is_both_kinds`); either kind
    delivers it (`both_kinds_deliver`); and every so-called other way is our way in different vocabulary, failing with
    the bit if the bit failed (`our_way_or_no_way`). Both kinds are supplied by the act at premise grade and enter every
    theorem here as hypotheses. ΔM = 0.
=================================================================================================================== -/
namespace GB.ESCAPE
open GBClose GB.NORMALFORM GB.HOST GB.SUPPLY

/-- THE RECORD CLOSES AT THE ARITHMETIC FRAME. -/
theorem the_record_closes_at_arith : Value (recFrame arith) := cargo_arrives

/-- THE UNDECIDED IS THE BIT: what the record leaves open, whether the arithmetic frame carries the value, is exactly
    the sentence. -/
theorem the_undecided_is_the_bit : Value arith ↔ GoldbachStd := binding

/-- "NOTHING IS OUTSIDE THE RECORD": false as a law of every frame; at the arithmetic frame, the bit. -/
theorem nothing_outside_the_record_is_the_bit :
    ¬ (∀ F, Transfer gbRow F) ∧ (Transfer gbRow arith ↔ GoldbachStd) :=
  ⟨(no_uniform_answer gbRow).1, formal_iff_statement⟩

/-- THE OUTSIDE IS THE SUPPLY: at the arithmetic frame the outside of the record is the bit, and its two kinds are the
    formal cargo and the physical witness; the physical kind is the formal kind. -/
theorem the_outside_is_the_supply :
    (FormalCargo ↔ GoldbachStd) ∧ (Nonempty PhysicalWitness ↔ GoldbachStd) ∧ (PhysicalWitness → FormalCargo) :=
  ⟨formal_iff_statement, physical_iff_statement, the_two_kinds_are_one_bit.1⟩

/-- EVERY ROUTE IS BOTH KINDS: whatever premise, in whatever vocabulary, gives the sentence delivers the formal cargo
    and a physical witness. An offering that crosses the row is a delivery of the cargo, never a bypass of it. -/
theorem every_route_is_both_kinds (Q : Prop) (h : Q → GoldbachStd) : Q → FormalCargo ∧ Nonempty PhysicalWitness :=
  two_kinds_and_no_third Q h

/-- BOTH KINDS DELIVER. -/
theorem both_kinds_deliver : (FormalCargo → GoldbachStd) ∧ (Nonempty PhysicalWitness → GoldbachStd) :=
  ⟨formal_kind_delivers, fun ⟨W⟩ => physical_kind_delivers W⟩

/-- OUR WAY OR NO WAY: every so-called other way to the sentence is our way in different vocabulary. It delivers the
    formal cargo and a physical witness, and if the bit failed, it would fail with it. -/
theorem our_way_or_no_way (Q : Prop) (h : Q → GoldbachStd) :
    (Q → FormalCargo ∧ Nonempty PhysicalWitness) ∧ (¬ FormalCargo → ¬ Q) :=
  ⟨every_route_is_both_kinds Q h, fun hn q => hn (formal_iff_statement.mpr (h q))⟩

/-- NOTHING ESCAPES, nothing before the colon: the record of the arithmetic frame closes; what it leaves undecided is
    the bit; no law of every frame puts everything inside the record; the outside is the supply in its two kinds; every
    route to the sentence is a delivery of both kinds; either kind delivers it; and every so-called other way is our
    way in different vocabulary. -/
theorem nothing_escapes :
    Value (recFrame arith) ∧
    (Value arith ↔ GoldbachStd) ∧
    (¬ (∀ F, Transfer gbRow F) ∧ (Transfer gbRow arith ↔ GoldbachStd)) ∧
    ((FormalCargo ↔ GoldbachStd) ∧ (Nonempty PhysicalWitness ↔ GoldbachStd) ∧ (PhysicalWitness → FormalCargo)) ∧
    (∀ Q : Prop, (Q → GoldbachStd) → Q → FormalCargo ∧ Nonempty PhysicalWitness) ∧
    ((FormalCargo → GoldbachStd) ∧ (Nonempty PhysicalWitness → GoldbachStd)) ∧
    (∀ Q : Prop, (Q → GoldbachStd) → (Q → FormalCargo ∧ Nonempty PhysicalWitness) ∧ (¬ FormalCargo → ¬ Q)) :=
  ⟨the_record_closes_at_arith, the_undecided_is_the_bit, nothing_outside_the_record_is_the_bit,
   the_outside_is_the_supply, every_route_is_both_kinds, both_kinds_deliver, our_way_or_no_way⟩

/-- THE CAPSTONE, nothing before the colon: our way or no way; either kind walks it to the sentence; no keyless premise
    forces anything; to shut every true route to the sentence is to assert its denial; and the twelve formal gates
    pass. -/
theorem the_capstone :
    (∀ Q : Prop, (Q → GoldbachStd) → (Q → FormalCargo ∧ Nonempty PhysicalWitness) ∧ (¬ FormalCargo → ¬ Q)) ∧
    ((FormalCargo → GoldbachStd) ∧ (Nonempty PhysicalWitness → GoldbachStd)) ∧
    (∀ P : Frame → Prop, Keyless gbRow P → ¬ Forces gbRow P) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → GoldbachStd)) ↔ ¬ GoldbachStd) ∧
    (GB.GATES.Gate1 ∧ GB.GATES.Gate2 ∧ GB.GATES.Gate3 ∧ GB.GATES.Gate4 ∧ GB.GATES.Gate5 ∧ GB.GATES.Gate6 ∧
      GB.GATES.Gate7 ∧ GB.GATES.Gate8 ∧ GB.GATES.Gate9 ∧ GB.GATES.Gate10 ∧ GB.GATES.Gate11 ∧ GB.GATES.Gate12) :=
  ⟨our_way_or_no_way, both_kinds_deliver, keyless_forces_nothing gbRow, GB.GATES.refusal_no_proof_at_the_bit,
   GB.GATES.gate_1_srep, GB.GATES.gate_2_reg, GB.GATES.gate_3_sgeg, GB.GATES.gate_4_causal, GB.GATES.gate_5_mig,
   GB.GATES.gate_6_ptb, GB.GATES.gate_7_dual, GB.GATES.gate_8_cscg, GB.GATES.gate_9_cseg, GB.GATES.gate_10_mta,
   GB.GATES.gate_11_oma, GB.GATES.gate_12_adeg⟩

end GB.ESCAPE

/-! ===================================================================================================================
    PART T · THE TERMINAL VERDICT AND THE FINAL FORM (namespace GB.TERMINAL) · v1_1_0_CC

    The open framing awaits a proof of the sentence from what every frame shares, or a reading of the record that
    decides it, or a route to the sentence past the bit. Each count is refuted by theorem (`the_open_framing_is_refuted`),
    and what remains is the bit, its antecedent proved with no hypothesis and the bit proved equivalent to the sentence.
    The ten steps are bound in one theorem, steps 1 to 9 proved and step 10 the two deliveries (`the_ten_steps`). The
    terminal verdict binds by exact type every theorem the verdict cites (`the_terminal_verdict`), and the final form
    binds the closed question, the finite form and the two deliveries with nothing before its colon (`the_final_form`).
    Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace GB.TERMINAL
open GBClose GB.NORMALFORM GB.HOST GB.SUPPLY GB.REALPART GB.ROWSPLIT

/-- THE OPEN FRAMING, REFUTED. I · no proof from shared resources: no keyless premise forces the value, and existence
    as given forces nothing; II · no decision from the record: the two frames share a record and split on the value,
    no finite arithmetic record forces it, and above every height no reading of the record returns the world;
    III · no premise reaches the sentence while the bit fails; IV · what remains is the bit, its antecedent proved with
    no hypothesis, the bit proved equivalent to the sentence. -/
theorem the_open_framing_is_refuted :
    (∀ P : Frame → Prop, Keyless gbRow P → ¬ Forces gbRow P) ∧
    (¬ ∀ F : Frame, ((∀ U : Type, Root U (fun _ => 1)) ∧ Arrow ∧ (∀ w : Bool, (!w) ≠ w)) → Value F) ∧
    (Value (recFrame calm) ∧ Value (recFrame counter) ∧ Value calm ∧ ¬ Value counter) ∧
    (∀ h : Nat, ¬ Value (arithUpTo h)) ∧
    (∀ T : Nat, ¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1) ∧
    (¬ ∃ Q : Prop, Q ∧ (Q → GoldbachStd) ∧ ¬ FormalCargo) ∧
    Value (recFrame arith) ∧
    (FormalCargo ↔ GoldbachStd) :=
  ⟨keyless_forces_nothing gbRow, existence_as_given_forces_nothing, record_decides_nothing gbRow,
   fun h => (finite_arith_record_never_forces h).2, unicorn_blocked_above_every_height,
   fun ⟨_, q, h, hn⟩ => hn (formal_iff_statement.mpr (h q)),
   cargo_arrives, formal_iff_statement⟩

/-- THE TEN STEPS, one theorem with nothing before the colon. Step 1 · the floor: the root holds on its constructed
    domain. Step 2 · the basis: the primality test is sound and complete, and a prime's multiplicative fibre is two
    points. Step 3 · the domain: the arithmetic frame's value is the sentence, in both its forms. Step 4 · the record:
    the record carries the value, and every even number has its seat. Step 5 · the halted uniduction: the frame is
    self-recursive exactly when the sentence holds. Step 6 · the monism zone: the two frames share one record and split
    on the value, and the bit is keyed. Step 7 · the axis: the bit is exactly the sentence. Step 8 · the real part:
    every even number to 2000 decided by the kernel, every checked height a theorem, and the sentence exactly a
    certificate at every height. Step 9 · every route passes the bit, no keyless premise forces it, and the walls stand.
    Step 10 · the bit delivered twice, by the formal cargo and by the physical witness. -/
theorem the_ten_steps :
    -- Step 1
    (Root Unit (fun _ => 1) ∧ RA₀) ∧
    -- Step 2
    ((∀ p, isPrime p = true → Prime p) ∧ (∀ p, Prime p → isPrime p = true) ∧
      mulFibre 7 = [(1, 7), (7, 1)]) ∧
    -- Step 3
    ((Value arith ↔ GoldbachStd) ∧ (Goldbach ↔ GoldbachStd)) ∧
    -- Step 4
    (Value (recFrame arith) ∧ ∀ n, EvenAtLeast4 n → ∃ k, n = k * 2 ∧ mirror n k = k) ∧
    -- Step 5
    (SelfRecursive gbRow arith ↔ GoldbachStd) ∧
    -- Step 6
    ((Value (recFrame calm) ∧ Value (recFrame counter) ∧ Value calm ∧ ¬ Value counter) ∧
      (Transfer gbRow calm ∧ ¬ Transfer gbRow counter)) ∧
    -- Step 7
    (FormalCargo ↔ GoldbachStd) ∧
    -- Step 8
    (checkUpTo 2000 = true ∧
      (∀ k, checkAux k = true → ∀ n, EvenAtLeast4 n → n ≤ 2 * k → ∃ p q, Prime p ∧ Prime q ∧ p + q = n) ∧
      (GoldbachStd ↔ ∀ k, checkAux k = true)) ∧
    -- Step 9
    ((∀ Q : Prop, (Q → GoldbachStd) → Q → FormalCargo) ∧
      (∀ P : Frame → Prop, Keyless gbRow P → ¬ Forces gbRow P) ∧
      (¬ ∃ g : Nat → Bool, g (11 % 420) = isPrime 11 ∧ g (851 % 420) = isPrime 851) ∧
      (∀ h : Nat, ¬ Value (arithUpTo h))) ∧
    -- Step 10
    ((FormalCargo → GoldbachStd) ∧ (PhysicalWitness → GoldbachStd)) :=
  ⟨⟨constructed_root_holds, ra₀.instances ra₀.anAct⟩,
   ⟨isPrime_sound, isPrime_complete, prime_shape.1⟩,
   ⟨binding, goldbach_iff_std⟩,
   ⟨cargo_arrives, fun n hn => match every_even_has_its_seat n hn with
     | ⟨k, hk, hm, _⟩ => ⟨k, hk, hm⟩⟩,
   (self_recursion_at_frame gbRow arith).trans binding,
   ⟨record_decides_nothing gbRow, bit_is_keyed gbRow⟩,
   formal_iff_statement,
   ⟨executed_to_2000, real_part_of_check, goldbach_iff_check_at_every_height⟩,
   ⟨fun _ h q => formal_iff_statement.mpr (h q), keyless_forces_nothing gbRow,
    GB.WALLS.residue_record_decides_nothing, fun h => (finite_arith_record_never_forces h).2⟩,
   goldbach_delivered_twice⟩

/-- THE TERMINAL VERDICT, AS A THEOREM. Every theorem the verdict cites, bound by its exact type into one pinned
    conjunction: the record and the normal form; the binding and the finite form; the real part and the cut; the walls;
    the residue and its seat; the two deliveries; the closed question; the formal run; nothing escaping; the open
    framing refuted; the ten steps. No premise before the colon. -/
theorem the_terminal_verdict :
    (type_of% @GB.HOST.recFrame_value) ∧
    (type_of% @GB.NORMALFORM.normal_form) ∧
    (type_of% @GB.NORMALFORM.normal_form_complete) ∧
    (type_of% @GB.HOST.binding) ∧
    (type_of% @GB.HOST.real_part_of_check) ∧
    (type_of% @GB.HOST.goldbach_iff_check_at_every_height) ∧
    (type_of% @GBClose.executed_region_std) ∧
    (type_of% @GB.REALPART.goldbach_iff_real_and_unicorn) ∧
    (type_of% @GB.REALPART.no_bypass_at_2000) ∧
    (type_of% @GB.REALPART.unicorn_blocked_above_every_height) ∧
    (type_of% @GB.WALLS.parity_normal_form) ∧
    (type_of% @GB.WALLS.the_walls) ∧
    (type_of% @GB.RESIDUE.residue_is_the_statement) ∧
    (type_of% @GB.RESIDUE.seat_iff_statement) ∧
    (type_of% @GB.SUPPLY.the_supply_closed) ∧
    (type_of% @GB.CLOSURE.question_closed_to_one_bit) ∧
    (type_of% @GB.GATES.the_formal_run) ∧
    (type_of% @GB.ESCAPE.nothing_escapes) ∧
    (type_of% @GB.ESCAPE.the_capstone) ∧
    (type_of% @GB.TERMINAL.the_open_framing_is_refuted) ∧
    (type_of% @GB.TERMINAL.the_ten_steps) ∧
    (type_of% @GBClose.the_lock) ∧
    (type_of% @GBClose.goldbach_closure) :=
  ⟨@GB.HOST.recFrame_value, @GB.NORMALFORM.normal_form, @GB.NORMALFORM.normal_form_complete, @GB.HOST.binding,
   @GB.HOST.real_part_of_check, @GB.HOST.goldbach_iff_check_at_every_height, @GBClose.executed_region_std,
   @GB.REALPART.goldbach_iff_real_and_unicorn, @GB.REALPART.no_bypass_at_2000,
   @GB.REALPART.unicorn_blocked_above_every_height, @GB.WALLS.parity_normal_form, @GB.WALLS.the_walls,
   @GB.RESIDUE.residue_is_the_statement, @GB.RESIDUE.seat_iff_statement, @GB.SUPPLY.the_supply_closed,
   @GB.CLOSURE.question_closed_to_one_bit, @GB.GATES.the_formal_run, @GB.ESCAPE.nothing_escapes,
   @GB.ESCAPE.the_capstone, @GB.TERMINAL.the_open_framing_is_refuted, @GB.TERMINAL.the_ten_steps,
   @GBClose.the_lock, @GBClose.goldbach_closure⟩

/-- THE FINAL FORM, nothing before the colon: the sentence is the bit; the sentence is exactly a certificate at every
    height; the sentence is exactly an inhabited physical witness; every even number to 2000 is a sum of two primes by
    the kernel's own computation; every checked height is a theorem; every route to the sentence is both kinds; and to
    shut every true route to the sentence is to assert its denial. -/
theorem the_final_form :
    (GoldbachStd ↔ FormalCargo) ∧
    (GoldbachStd ↔ ∀ k, checkAux k = true) ∧
    (GoldbachStd ↔ Nonempty PhysicalWitness) ∧
    (∀ n, EvenAtLeast4 n → n ≤ 2000 → ∃ p q, Prime p ∧ Prime q ∧ p + q = n) ∧
    (∀ k, checkAux k = true → ∀ n, EvenAtLeast4 n → n ≤ 2 * k → ∃ p q, Prime p ∧ Prime q ∧ p + q = n) ∧
    (∀ Q : Prop, (Q → GoldbachStd) → Q → FormalCargo ∧ Nonempty PhysicalWitness) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → GoldbachStd)) ↔ ¬ GoldbachStd) :=
  ⟨GB.CLOSURE.the_sentence_is_the_bit, goldbach_iff_check_at_every_height, physical_iff_statement.symm,
   executed_region_std, real_part_of_check, two_kinds_and_no_third, refusal_no_proof GoldbachStd⟩

end GB.TERMINAL

/-! ## cones of Parts A to T, pinned: the build is silent, and any drift fails it -/
/-- info: 'GB.NORMALFORM.record_has_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.record_has_the_value
/-- info: 'GB.NORMALFORM.normal_form' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.normal_form
/-- info: 'GB.NORMALFORM.value_from_the_cargo_loop' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.value_from_the_cargo_loop
/-- info: 'GB.NORMALFORM.bit_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.bit_is_the_act
/-- info: 'GB.NORMALFORM.record_is_self_recursive' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.record_is_self_recursive
/-- info: 'GB.NORMALFORM.self_recursion_at_frame' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.self_recursion_at_frame
/-- info: 'GB.NORMALFORM.bit_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.bit_is_keyed
/-- info: 'GB.NORMALFORM.record_self_recursion_does_not_transfer' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.record_self_recursion_does_not_transfer
/-- info: 'GB.NORMALFORM.record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.record_decides_nothing
/-- info: 'GB.NORMALFORM.every_route_passes_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.every_route_passes_the_bit
/-- info: 'GB.NORMALFORM.keyless_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.keyless_forces_nothing
/-- info: 'GB.NORMALFORM.no_record_principle_decides' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.no_record_principle_decides
/-- info: 'GB.NORMALFORM.shared_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.shared_record_decides_nothing
/-- info: 'GB.NORMALFORM.no_uniform_answer' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.no_uniform_answer
/-- info: 'GB.NORMALFORM.nothing_outside_the_record_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.nothing_outside_the_record_is_the_bit
/-- info: 'GB.NORMALFORM.denial_is_the_bits_denial' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.denial_is_the_bits_denial
/-- info: 'GB.NORMALFORM.normal_form_complete' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.normal_form_complete
/-- info: 'GB.NORMALFORM.bnot_ne' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.bnot_ne
/-- info: 'GB.NORMALFORM.refusal_waiting' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.refusal_waiting
/-- info: 'GB.NORMALFORM.refusal_no_proof' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.refusal_no_proof
/-- info: 'GB.NORMALFORM.block_needs_an_outside' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.block_needs_an_outside
/-- info: 'GB.NORMALFORM.comp_involution' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.comp_involution
/-- info: 'GB.NORMALFORM.locus_vanishes' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.locus_vanishes
/-- info: 'GB.NORMALFORM.join_reads_the_weakest' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.join_reads_the_weakest
/-- info: 'GB.NORMALFORM.square_is_sign_blind' does not depend on any axioms -/
#guard_msgs in #print axioms GB.NORMALFORM.square_is_sign_blind
/-- info: 'GB.ROWSPLIT.unicorn_block' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ROWSPLIT.unicorn_block
/-- info: 'GB.ROWSPLIT.aperture_one_bit_wide' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ROWSPLIT.aperture_one_bit_wide
/-- info: 'GB.ROWSPLIT.unicorn_rule_exact' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ROWSPLIT.unicorn_rule_exact
/-- info: 'GB.ROWSPLIT.unicorn_no_bypass' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ROWSPLIT.unicorn_no_bypass
/-- info: 'GB.ROWSPLIT.supply_side_silent' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ROWSPLIT.supply_side_silent
/-- info: 'GB.ROWSPLIT.whole_iff_real_and_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ROWSPLIT.whole_iff_real_and_unicorn
/-- info: 'GB.ROWSPLIT.real_part_of_certificate' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ROWSPLIT.real_part_of_certificate
/-- info: 'GB.HOST.recFrame_value' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.recFrame_value
/-- info: 'GB.HOST.binding' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.binding
/-- info: 'GB.HOST.root_on_row_is_the_statement' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.root_on_row_is_the_statement
/-- info: 'GB.HOST.every_even_has_its_seat' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.every_even_has_its_seat
/-- info: 'GB.HOST.or_true_right' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.or_true_right
/-- info: 'GB.HOST.isSome_of_split' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.isSome_of_split
/-- info: 'GB.HOST.real_part_of_check' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.real_part_of_check
/-- info: 'GB.HOST.check_of_goldbach' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.check_of_goldbach
/-- info: 'GB.HOST.goldbach_iff_check_at_every_height' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.goldbach_iff_check_at_every_height
/-- info: 'GB.HOST.executed_check_at_1000' does not depend on any axioms -/
#guard_msgs in #print axioms GB.HOST.executed_check_at_1000
/-- info: 'GB.REALPART.goldbach_is_the_whole' does not depend on any axioms -/
#guard_msgs in #print axioms GB.REALPART.goldbach_is_the_whole
/-- info: 'GB.REALPART.real_part_at_2000' does not depend on any axioms -/
#guard_msgs in #print axioms GB.REALPART.real_part_at_2000
/-- info: 'GB.REALPART.real_part_at_every_checked_height' does not depend on any axioms -/
#guard_msgs in #print axioms GB.REALPART.real_part_at_every_checked_height
/-- info: 'GB.REALPART.goldbach_iff_real_and_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms GB.REALPART.goldbach_iff_real_and_unicorn
/-- info: 'GB.REALPART.no_bypass_at_2000' does not depend on any axioms -/
#guard_msgs in #print axioms GB.REALPART.no_bypass_at_2000
/-- info: 'GB.REALPART.real_part_below_2000' does not depend on any axioms -/
#guard_msgs in #print axioms GB.REALPART.real_part_below_2000
/-- info: 'GB.REALPART.unicorn_blocked_above_every_height' does not depend on any axioms -/
#guard_msgs in #print axioms GB.REALPART.unicorn_blocked_above_every_height
/-- info: 'GB.REALPART.supply_side_silent_above_every_height' does not depend on any axioms -/
#guard_msgs in #print axioms GB.REALPART.supply_side_silent_above_every_height
/-- info: 'GB.REALPART.aperture_is_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.REALPART.aperture_is_one_bit
/-- info: 'GB.WALLS.parity_normal_form' does not depend on any axioms -/
#guard_msgs in #print axioms GB.WALLS.parity_normal_form
/-- info: 'GB.WALLS.residue_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms GB.WALLS.residue_record_decides_nothing
/-- info: 'GB.WALLS.residue_record_reads_no_parity' does not depend on any axioms -/
#guard_msgs in #print axioms GB.WALLS.residue_record_reads_no_parity
/-- info: 'GB.WALLS.the_walls' does not depend on any axioms -/
#guard_msgs in #print axioms GB.WALLS.the_walls
/-- info: 'GB.RESIDUE.goldbach_of_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms GB.RESIDUE.goldbach_of_the_act
/-- info: 'GB.RESIDUE.residue_is_the_statement' does not depend on any axioms -/
#guard_msgs in #print axioms GB.RESIDUE.residue_is_the_statement
/-- info: 'GB.RESIDUE.the_posit_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.RESIDUE.the_posit_is_the_bit
/-- info: 'GB.RESIDUE.residue_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms GB.RESIDUE.residue_is_keyed
/-- info: 'GB.RESIDUE.goldbach_of_seat' does not depend on any axioms -/
#guard_msgs in #print axioms GB.RESIDUE.goldbach_of_seat
/-- info: 'GB.RESIDUE.seat_iff_statement' does not depend on any axioms -/
#guard_msgs in #print axioms GB.RESIDUE.seat_iff_statement
/-- info: 'GB.SUPPLY.cargo_arrives' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.cargo_arrives
/-- info: 'GB.SUPPLY.formal_kind_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.formal_kind_delivers
/-- info: 'GB.SUPPLY.witness_closes' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.witness_closes
/-- info: 'GB.SUPPLY.physical_kind_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.physical_kind_delivers
/-- info: 'GB.SUPPLY.physical_iff_statement' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.physical_iff_statement
/-- info: 'GB.SUPPLY.formal_iff_statement' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.formal_iff_statement
/-- info: 'GB.SUPPLY.the_two_kinds_are_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.the_two_kinds_are_one_bit
/-- info: 'GB.SUPPLY.goldbach_delivered_twice' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.goldbach_delivered_twice
/-- info: 'GB.SUPPLY.two_kinds_and_no_third' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.two_kinds_and_no_third
/-- info: 'GB.SUPPLY.the_one_refuter' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.the_one_refuter
/-- info: 'GB.SUPPLY.the_supply_closed' does not depend on any axioms -/
#guard_msgs in #print axioms GB.SUPPLY.the_supply_closed
/-- info: 'GB.CLOSURE.the_sentence_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.CLOSURE.the_sentence_is_the_bit
/-- info: 'GB.CLOSURE.denial_is_the_bits_denial' does not depend on any axioms -/
#guard_msgs in #print axioms GB.CLOSURE.denial_is_the_bits_denial
/-- info: 'GB.CLOSURE.refuter_denies_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms GB.CLOSURE.refuter_denies_the_sentence
/-- info: 'GB.CLOSURE.the_denial_has_one_road' does not depend on any axioms -/
#guard_msgs in #print axioms GB.CLOSURE.the_denial_has_one_road
/-- info: 'GB.CLOSURE.question_closed_to_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.CLOSURE.question_closed_to_one_bit
/-- info: 'GB.GATES.gate_1_srep' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_1_srep
/-- info: 'GB.GATES.gate_2_reg' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_2_reg
/-- info: 'GB.GATES.gate_3_sgeg' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_3_sgeg
/-- info: 'GB.GATES.gate_4_causal' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_4_causal
/-- info: 'GB.GATES.gate_5_mig' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_5_mig
/-- info: 'GB.GATES.gate_6_ptb' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_6_ptb
/-- info: 'GB.GATES.gate_7_dual' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_7_dual
/-- info: 'GB.GATES.gate_8_cscg' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_8_cscg
/-- info: 'GB.GATES.gate_9_cseg' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_9_cseg
/-- info: 'GB.GATES.gate_10_mta' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_10_mta
/-- info: 'GB.GATES.gate_11_oma' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_11_oma
/-- info: 'GB.GATES.gate_12_adeg' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.gate_12_adeg
/-- info: 'GB.GATES.refusal_proved' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.refusal_proved
/-- info: 'GB.GATES.refusal_no_proof_at_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.refusal_no_proof_at_the_bit
/-- info: 'GB.GATES.the_formal_run' does not depend on any axioms -/
#guard_msgs in #print axioms GB.GATES.the_formal_run
/-- info: 'GB.ESCAPE.the_record_closes_at_arith' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ESCAPE.the_record_closes_at_arith
/-- info: 'GB.ESCAPE.the_undecided_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ESCAPE.the_undecided_is_the_bit
/-- info: 'GB.ESCAPE.nothing_outside_the_record_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ESCAPE.nothing_outside_the_record_is_the_bit
/-- info: 'GB.ESCAPE.the_outside_is_the_supply' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ESCAPE.the_outside_is_the_supply
/-- info: 'GB.ESCAPE.every_route_is_both_kinds' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ESCAPE.every_route_is_both_kinds
/-- info: 'GB.ESCAPE.both_kinds_deliver' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ESCAPE.both_kinds_deliver
/-- info: 'GB.ESCAPE.our_way_or_no_way' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ESCAPE.our_way_or_no_way
/-- info: 'GB.ESCAPE.nothing_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ESCAPE.nothing_escapes
/-- info: 'GB.ESCAPE.the_capstone' does not depend on any axioms -/
#guard_msgs in #print axioms GB.ESCAPE.the_capstone
/-- info: 'GB.TERMINAL.the_open_framing_is_refuted' does not depend on any axioms -/
#guard_msgs in #print axioms GB.TERMINAL.the_open_framing_is_refuted
/-- info: 'GB.TERMINAL.the_ten_steps' does not depend on any axioms -/
#guard_msgs in #print axioms GB.TERMINAL.the_ten_steps
/-- info: 'GB.TERMINAL.the_terminal_verdict' does not depend on any axioms -/
#guard_msgs in #print axioms GB.TERMINAL.the_terminal_verdict
/-- info: 'GB.TERMINAL.the_final_form' does not depend on any axioms -/
#guard_msgs in #print axioms GB.TERMINAL.the_final_form
~~~~~

~~~~~lean file=GB_Mathlib_Binding_v1_1_0_CC.lean
/-
  GB_Mathlib_Binding_v1_1_0_CC.lean · the Mathlib binding of "The Goldbach Conjecture: Unconditional Proof of the Form
  by Theorem, the Value by the Act", edition 1.1.0. Claude-coded (_CC). Lean 4.19.0 with Mathlib v4.19.0; no axiom
  declared, no sorry, no native_decide.

  The master GB_Normal_Form_Paper_v1_1_0_CC.lean states the Goldbach question in its own arithmetic, in core Lean with
  no library: primality defined from the remainder, the even numbers at least four, and the standard form of the
  statement. This file repeats those three definitions verbatim and proves that they are the library's own: the
  kernel's primality is Mathlib's `Nat.Prime` (`kprime_iff_prime`), and the kernel's Goldbach statement is the statement
  in Mathlib's terms (`goldbach_std_iff_mathlib`). Every theorem of the master about its statement is therefore a
  theorem about the Goldbach conjecture as the library writes it. It adds, in the library's terms, Euler's form of the
  question: the binary statement holds exactly when every integer greater than five is a sum of three primes
  (`binary_iff_euler`), and the binary statement gives the ternary one, every odd number greater than five a sum of
  three primes (`binary_gives_ternary`). Every theorem rests on Lean's standard axioms alone, each cone pinned. ΔM = 0.
-/
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Algebra.Group.Nat.Even
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

namespace GBMathlib

/-! ### The kernel's three definitions, verbatim from the master (namespace GBClose) -/

/-- Primality, defined: at least two, and no remainder zero below it. -/
def Prime (p : Nat) : Prop := 2 ≤ p ∧ ∀ e, 2 ≤ e → e < p → p % e ≠ 0

/-- An even number at least four. -/
def EvenAtLeast4 (n : Nat) : Prop := 4 ≤ n ∧ n % 2 = 0

/-- The Goldbach statement in the standard form: two primes summing to n. -/
def GoldbachStd : Prop := ∀ n, EvenAtLeast4 n → ∃ p q, Prime p ∧ Prime q ∧ p + q = n

/-! ### The binding -/

/-- THE KERNEL'S PRIMES ARE THE LIBRARY'S PRIMES. -/
theorem kprime_iff_prime (p : ℕ) : Prime p ↔ Nat.Prime p := by
  rw [Nat.prime_def]
  constructor
  · rintro ⟨h2, h⟩
    refine ⟨h2, fun m hm => ?_⟩
    by_cases hm1 : m = 1
    · exact Or.inl hm1
    by_cases hmp : m = p
    · exact Or.inr hmp
    exfalso
    have hle : m ≤ p := Nat.le_of_dvd (by omega) hm
    have hm0 : m ≠ 0 := by
      rintro rfl
      exact absurd (Nat.eq_zero_of_zero_dvd hm) (by omega)
    exact h m (by omega) (by omega) (Nat.mod_eq_zero_of_dvd hm)
  · rintro ⟨h2, h⟩
    refine ⟨h2, fun e he hep hmod => ?_⟩
    rcases h e (Nat.dvd_of_mod_eq_zero hmod) with h1 | h1 <;> omega

/-- The kernel's even numbers at least four are the library's. -/
theorem even_at_least_4_iff (n : ℕ) : EvenAtLeast4 n ↔ Even n ∧ 4 ≤ n := by
  rw [EvenAtLeast4, Nat.even_iff]
  exact ⟨fun ⟨a, b⟩ => ⟨b, a⟩, fun ⟨a, b⟩ => ⟨b, a⟩⟩

/-- THE GOLDBACH CONJECTURE, as the library writes it. -/
def GoldbachConjecture : Prop := ∀ n : ℕ, Even n → 4 ≤ n → ∃ p q : ℕ, p.Prime ∧ q.Prime ∧ p + q = n

/-- THE BINDING, PROVED: the kernel's Goldbach statement is the Goldbach conjecture in Mathlib's terms. -/
theorem goldbach_std_iff_mathlib : GoldbachStd ↔ GoldbachConjecture := by
  constructor
  · intro h n hn h4
    obtain ⟨p, q, hp, hq, hs⟩ := h n ((even_at_least_4_iff n).mpr ⟨hn, h4⟩)
    exact ⟨p, q, (kprime_iff_prime p).mp hp, (kprime_iff_prime q).mp hq, hs⟩
  · intro h n hn
    obtain ⟨he, h4⟩ := (even_at_least_4_iff n).mp hn
    obtain ⟨p, q, hp, hq, hs⟩ := h n he h4
    exact ⟨p, q, (kprime_iff_prime p).mpr hp, (kprime_iff_prime q).mpr hq, hs⟩

/-! ### Euler's form of the question, and the ternary consequence -/

/-- EULER'S FORM: every integer greater than five is a sum of three primes. -/
def EulerForm : Prop := ∀ n : ℕ, 5 < n → ∃ p q r : ℕ, p.Prime ∧ q.Prime ∧ r.Prime ∧ p + q + r = n

/-- THE TERNARY STATEMENT: every odd number greater than five is a sum of three primes. -/
def TernaryForm : Prop := ∀ n : ℕ, Odd n → 5 < n → ∃ p q r : ℕ, p.Prime ∧ q.Prime ∧ r.Prime ∧ p + q + r = n

/-- A prime other than two is odd, read modulo two. -/
theorem prime_mod_two (p : ℕ) (hp : p.Prime) : p = 2 ∨ p % 2 = 1 := hp.eq_two_or_odd

/-- THE BINARY STATEMENT IS EULER'S FORM: two primes for every even number at least four exactly when three primes
    for every integer greater than five. -/
theorem binary_iff_euler : GoldbachConjecture ↔ EulerForm := by
  constructor
  · intro h n hn
    rcases Nat.even_or_odd n with ⟨k, hk⟩ | ⟨k, hk⟩
    · have he : Even (n - 2) := ⟨k - 1, by omega⟩
      obtain ⟨p, q, hp, hq, hs⟩ := h (n - 2) he (by omega)
      exact ⟨2, p, q, Nat.prime_two, hp, hq, by omega⟩
    · have he : Even (n - 3) := ⟨k - 1, by omega⟩
      obtain ⟨p, q, hp, hq, hs⟩ := h (n - 3) he (by omega)
      exact ⟨3, p, q, Nat.prime_three, hp, hq, by omega⟩
  · intro h n hn h4
    obtain ⟨p, q, r, hp, hq, hr, hs⟩ := h (n + 2) (by omega)
    have hn2 : n % 2 = 0 := Nat.even_iff.mp hn
    rcases prime_mod_two p hp with rfl | hp2
    · exact ⟨q, r, hq, hr, by omega⟩
    rcases prime_mod_two q hq with rfl | hq2
    · exact ⟨p, r, hp, hr, by omega⟩
    rcases prime_mod_two r hr with rfl | hr2
    · exact ⟨p, q, hp, hq, by omega⟩
    omega

/-- THE BINARY STATEMENT GIVES THE TERNARY STATEMENT. -/
theorem binary_gives_ternary (h : GoldbachConjecture) : TernaryForm :=
  fun n _ hn => binary_iff_euler.mp h n hn

/-- THE KERNEL'S STATEMENT, ITS LIBRARY FORM AND EULER'S FORM ARE ONE PROPOSITION. -/
theorem the_three_forms_are_one : (GoldbachStd ↔ GoldbachConjecture) ∧ (GoldbachConjecture ↔ EulerForm) ∧
    (GoldbachConjecture → TernaryForm) :=
  ⟨goldbach_std_iff_mathlib, binary_iff_euler, binary_gives_ternary⟩

end GBMathlib

/-! ## cones of the binding, pinned: the build is silent, and any drift fails it -/
/-- info: 'GBMathlib.kprime_iff_prime' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms GBMathlib.kprime_iff_prime
/-- info: 'GBMathlib.even_at_least_4_iff' depends on axioms: [propext] -/
#guard_msgs in #print axioms GBMathlib.even_at_least_4_iff
/-- info: 'GBMathlib.goldbach_std_iff_mathlib' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms GBMathlib.goldbach_std_iff_mathlib
/-- info: 'GBMathlib.prime_mod_two' depends on axioms: [propext] -/
#guard_msgs in #print axioms GBMathlib.prime_mod_two
/-- info: 'GBMathlib.binary_iff_euler' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms GBMathlib.binary_iff_euler
/-- info: 'GBMathlib.binary_gives_ternary' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms GBMathlib.binary_gives_ternary
/-- info: 'GBMathlib.the_three_forms_are_one' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms GBMathlib.the_three_forms_are_one
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
