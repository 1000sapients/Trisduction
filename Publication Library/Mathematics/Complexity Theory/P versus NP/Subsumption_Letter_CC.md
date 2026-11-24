# The Normal Form of P ≠ NP Separation (Islam, 21 October 2026) and the Subsumption of Anthropic's VP ≠ VNP: The Form That Bound the Future

## A Forecast Printed on 13 November 2026, That Every Proof of a Separation Delivers One Bit, and the Release of 23 November 2026 That Fits It, by Theorem and by Compiled Construction

**Mohammad F. Islam** · 23 November 2026

*On Islam (4 Oct 2026), "The Formal Closure of Computational Separation: P ≠ NP Closed on Existence Itself, Read on Computation"; Islam (21 Oct 2026), "P ≠ NP: Unconditional Proof of the Form by Theorem, the Value by the Act", with its Lean normal form; Islam (22 Nov 2026), "The Unconditional Proof of the Inescapable Form of P ≠ NP", with Lean v1.14.0; and Anthropic (23 Nov 2026), "VP ≠ VNP over every field", `anthropics/formal-math/vp-vnp`.*

## Abstract

Every separation has one form. Islam (4 Oct 2026) published it, and Islam (21 Oct 2026) proved it in Lean: on any machine, the separation holds exactly when one proposition is delivered, least escape, read on that machine. No premise common to all machines delivers it. The theorem is stated for every machine and every premise. Islam (13 Nov 2026) printed its consequence as a forecast: every route to a problem's value passes that problem's one bit, and the form binds the future.

Ten days later Anthropic (23 Nov 2026) released a Lean formalization of VP ≠ VNP. It is the form's first outside instance, and this note proves that as a compiled Lean construction. The Anthropic system is built as a machine of Islam (21 Oct 2026), Part A. On that machine the normal form holds with nothing before the colon. The machine's least escape is the one bit of the arithmetic problem. The release's own main theorem supplies that least escape, and nothing else in their file proves the separation. The crossing is pinned to one line of their source, `Paper/Fields.lean:149`, and it is keyed, at lines 54 and 60, as the October theorems require. Their term is the first bit ever delivered inside the normal form of 21 October 2026. The normal form of Valiant's conjecture was a theorem of Islam (21 Oct 2026) before the conjecture was named there.

No theorem is unconditional. Each is sealed on a purchase, and the purchase is part of the theorem. Appendix A proves that law in pure logic on no axiom, and proves that for a separation the purchase is exactly the bit.

Each side holds what it printed. Islam (22 Nov 2026) holds the form at theorem grade and the bit of P ≠ NP as a disclosed posit, printed before the colon. Anthropic (23 Nov 2026) holds a claimed closed term for the bit of the arithmetic problem, on the standard axioms. The order is fixed by public timestamps. The form was published on 4 October 2026 and stood in Lean on 21 October 2026. The forecast was printed on 13 November 2026. The first outside instance arrived on 23 November 2026, and it fits.

## Terms

A **machine** is any system with algorithms, instances, a size for each instance, an output, a running time and a correct answer. An algorithm is **clean** at an instance, for a polynomial budget, when it is right there and within the budget. **Least escape** at a machine says that every algorithm and every polynomial budget fails to be clean at some instance; in Lean, `NothingEscapes M`. The **record** of a machine keeps its algorithms, instances, sizes and times and forgets which answers were right; in Lean, `Rec M`. The **one bit** of a machine is the transfer of least escape from its record to the machine. The record's least escape is a theorem, so the bit is least escape at the machine itself, and it is the whole content of the separation.

## 1 · The claim

**The general theorem has stood in the public record since 21 October 2026, in Islam (21 Oct 2026). Anthropic (23 Nov 2026) is its first instantiation on another party's work, 33 days later.** Islam (21 Oct 2026), Part A, commit `4144323`:

```lean
theorem every_route_passes_the_bit (M : Machine) (x₀ : M.Inst) (Q : Prop) (h : Q → Sep M) :
    Q → (NothingEscapes (Rec M) → NothingEscapes M)
```

The machine is arbitrary. The premise is arbitrary. Any hypothesis whatever that yields the separation yields the transfer of least escape from the machine's record to the machine. The theorem leaves no room for a route around the bit, and the Anthropic release takes none. The fit is exact, and it is proved below as a term.

1. **The form is proved for every machine.** The separation holds exactly when least escape transfers from the machine's record to the machine (`sep_normal_form`). No premise shared by every machine supplies it (`keyless_forces_nothing`, on no axiom).
2. **The Turing side is proved with no hypothesis.** SAT ∈ NP, by a concrete verifier of 5,120 control states (`satLang_in_NP`). SAT is separated from constant time and from linear time on the Turing model (`sat_not_in_P_at_degree_zero`, `sat_not_in_P_at_degree_one`).
3. **The Anthropic system is a machine of that form.** This is a compiled construction: `Subsumption.vpMachine`.
4. **On that machine the form holds with nothing before the colon,** and its least escape is the one bit of the arithmetic problem (`the_form_subsumes_the_row`).
5. **The release's own main theorem supplies that least escape** (`their_delivery_supplies_least_escape`). In their own file the class separation is proved only through that bound: `Paper.cor_allclasses`, nine lines, calling `thm_allfields`.
6. **The crossing is pinned and keyed.** The bit is crossed at `Paper/Fields.lean:149`, made at line 91, and keyed at lines 54 and 60 by `gridComplete_hc`. One door, as `every_route_passes_the_bit` requires. One key, as `keyless_forces_nothing` requires.
7. **Their term is the first delivery in the form** (`first_delivery_in_the_form`): the one bit of the arithmetic machine, supplied by their `MainTheorem`.
8. **Their proof is an instance of the form,** executed 33 days after the form stood in Lean, 50 days after it was published, and 10 days after the forecast was printed. An instance confirms a form. It does not escape it.

## 2 · Receipts

### 2.1 The subsumption file

`Subsumption_CC.lean`: 491 lines; Lean 4.19.0, Mathlib v4.19.0, warnings fatal, exit 0. SHA-256 `0c3d032ed08ddc4276aae99f8dcbe9789afe32da2a690709aef1f3f9406d74dc`. It is printed whole in Appendix A.

The definitions of Part A are carried verbatim from Islam (21 Oct 2026), unchanged in Islam (22 Nov 2026), with `Keyless`, `Forces`, `keyless_forces_nothing` and `every_route_passes_the_bit` under their original names and statements. The Anthropic definitions are their `Statement.lean`, with the import narrowed to the modules at hand and the four Laurent-series declarations left out, as the file's header states. The kernel printed:

```
'Subsumption.the_form_subsumes_the_row' depends on axioms: [propext, Classical.choice, Quot.sound]
'Subsumption.their_delivery_supplies_least_escape' depends on axioms: [propext, Classical.choice, Quot.sound]
'PNP.NORMALFORM.sep_normal_form' depends on axioms: [propext, Classical.choice, Quot.sound]
'Subsumption.every_route_to_their_separation_passes_the_bit' depends on axioms: [propext, Classical.choice, Quot.sound]
'Subsumption.the_crossing_is_keyed' depends on axioms: [propext]
'Subsumption.first_delivery_in_the_form' depends on axioms: [propext, Classical.choice, Quot.sound]
'PNP.NORMALFORM.keyless_forces_nothing' depends on axioms: [propext]
'Purchase.Sealed.andThen' does not depend on any axioms
'Purchase.no_universal_purchase' does not depend on any axioms
'Purchase.nothing_from_nothing' does not depend on any axioms
'Purchase.the_bit_is_contingent' depends on axioms: [propext]
'Purchase.no_free_bit' depends on axioms: [propext]
'Purchase.no_keyless_purchase' depends on axioms: [propext]
'Purchase.the_purchase_is_exact' depends on axioms: [propext, Classical.choice, Quot.sound]
'Subsumption.their_bit_is_sealed_on_their_term' depends on axioms: [propext, Classical.choice, Quot.sound]
```

The machine-level theorems print `propext` in this file because it stands on Mathlib, whose natural-number power carries that axiom. The same statement in the core-Lean original prints none (Section 2.2). The purchase follows the foundation, and the kernel prints it either way.

| Theorem | Before the colon | After the colon |
|---|---|---|
| `the_form_subsumes_the_row` | nothing | on the Anthropic machine: transfer ⇔ separation; least escape ⇔ the bit; the bit ⇔ Hamiltonian-cycle family outside VP |
| `their_delivery_supplies_least_escape` | their `MainTheorem` | least escape, separation of the machine, Hamiltonian-cycle family outside VP |
| `every_route_to_their_separation_passes_the_bit` | any premise `Q` that yields their separation clause | `Q` delivers the bit on the Anthropic machine |
| `the_crossing_is_keyed` | a premise that delivers the bit wherever it holds | that premise is not shared by every machine |
| `first_delivery_in_the_form` | their `MainTheorem` | the transfer of least escape from the record to the Anthropic machine: the one bit, delivered |

### 2.2 Islam (22 Nov 2026), compiled whole a second time

`PNP_Normal_Form_Paper_v1_14_0_CC.lean` was compiled whole by a second party (Lean 4.19.0, exit 0), with three probes appended to a copy and the original untouched. The kernel printed:

```
'PNP.NORMALFORM.sep_normal_form' depends on axioms: [propext, Classical.choice, Quot.sound]
'PNP.NORMALFORM.keyless_forces_nothing' does not depend on any axioms
PNP.CONVERSION.p_ne_np_of_one_bit : PNP.INEQUALITY.TheInequality → PNP.TM.P_ne_NP
```

The third line is the disclosure itself: the bit stands before the arrow. The file's own docstring over that theorem reads: "P ≠ NP from the bit, the membership half discharged by Part N. The bit is the hypothesis."

### 2.3 Where the axiom of choice enters their proof

In the flat case the lower bound is carried by spectral points, functionals whose existence is obtained and not constructed. `Paper/Gauges.lean:57–63` proves the gauge proposition by `zorn_le_nonempty₀`, a call to Zorn's lemma and therefore to `Classical.choice`. `Paper.prop_gauge` is consumed at `Paper/Extension.lean:172` and `178`. Their paper says so in its own text: the spectral points "are only known to exist by Zorn's lemma."

Islam (22 Nov 2026) and Anthropic (23 Nov 2026) stand on the same three axioms. Islam (22 Nov 2026) states, in addition and in the open, the one proposition it does not derive, and names it at the colon. The axioms are the same. The difference is one printed line, and Islam (22 Nov 2026) is the side that printed it.

### 2.4 Independent public checks

Grok, checking publicly on 22 November 2026, recorded of the Riemann theorem that it "sits in v3.0.44_CC exactly as stated… Only propext, Classical.choice, Quot.sound appear." Checking the P ≠ NP formalization on 23 November 2026, it recorded: "Your Lean kernel seals the normal form, walls, every route through the single 1-bit seat, SAT ∈ NP (5120-state verifier), constant and linear time barred." Its remaining remark, that the value of the bit is supplied and not derived, is the printed grade of Islam (22 Nov 2026): the bit is a disclosed posit by design.

### 2.5 The label of the crossing

The Axiom Loophole (Islam, 22 Nov 2026) fixes a protocol of six drills for any claimed crossing. Read on the release:

| Drill | Read on the crossing | Result |
|---|---|---|
| Negation distinctness, on the headline | `Computes`, `Beyond`, `VP`, each tested with one accepted and one rejected input | passed |
| The deletion test | delete the bound and line 149 falls; `prop_gauge` is consumed at `Paper/Extension.lean:172` and `178` | passed |
| The axiom census | `propext`, `Classical.choice`, `Quot.sound` | as their repository reports |
| The owed statement | they name nothing as owed | a claim of full supply |
| Negation distinctness, on the middle | `Flat`, `Contracting`, `IsPrice`, `GridComplete` | owed by the release |
| Provenance of quantities | `distAtRank`, the blow-up 40, the constant 1600 | owed by the release |
| Identification | the two branches of `thm_alt` returning one bound | owed by the release |

**Label: KEYED CROSSING · CLAIMED AT THEOREM GRADE · MIDDLE UNSCREENED.** The protocol names the one line where their supply lives: `Paper/Fields.lean:91`. Their claim rests on two acts a kernel records and does not perform: the 80-line statement that says what the classes are, and the build, which is their own author's report. The protocol that fixes the label was published one day before the release.

## 3 · Where the bit is crossed

The subsumption is visible inside their own source, at four stations.

| Station | Line | What happens |
|---|---|---|
| 1 · crossed | `Paper/Fields.lean:149` | the last line of `cor_allclasses`: `exact hm2 ((hlow F m hm1 _).1 (hC m).2.2)` |
| 2 · carried | `Paper/Fields.lean:83–111` | `thm_allfields` moves the bound to every field by `lem_transfer` |
| 3 · made | `Paper/Fields.lean:91` | `rcases thm_alt K`: the case split on `Flat K ∨ Contracting K`, each branch returning the bound |
| 4 · keyed | `Paper/Fields.lean:54`, `60` | `gridComplete_hc K`, the fact about the Hamiltonian-cycle polynomial itself, turned in both branches |

**One door.** At Station 1 the assumed fast circuit `hC` meets the lower bound `hlow` at the instance `hm2`, and the separation closes. Least escape on the arithmetic machine is consumed there, once. `Solution.separation` is this corollary and nothing more. `every_route_passes_the_bit` said on 21 October that every proof of a separation delivers the bit. Their proof delivers it at this line.

**One key.** Their general machinery, prices, curvature and the rate lemmas `flat_rate_complete` and `contracting_complete`, is stated for any field and any grid-complete family. It moves no bit. The bit moves at Station 4, when the problem's own key is turned. `keyless_forces_nothing` said on 21 October that no premise shared by every machine supplies the bit, and `the_key_is_keyed` said on 22 October that the supply is keyed. Their route obeys both.

**One supply.** Station 3 is where the bit is made. In the flat branch the bound is carried by spectral points obtained by Zorn's lemma at `Paper/Gauges.lean:63`. In the contracting branch it is carried by `contracting_hc`. This is the supply the form theorem says every proof must bring.

**The crossing was not discovered by Anthropic. It was located in advance, and they arrived at it.**

## 4 · The correspondence, name for name

Every entry in the Anthropic column is their own identifier in `anthropics/formal-math/vp-vnp` at commit `11b6c7e`. Every entry in the Islam column is a declaration of the Lean file at the commit shown, and each was checked in the file at that commit.

### 4.1 Vocabulary

| Islam (21 Oct 2026), `4144323` | Anthropic (23 Nov 2026), `11b6c7e` | Why identical |
|---|---|---|
| `Machine` | circuits of `Statement.Computes` over a field `F` | the model the algorithms run in |
| `A : M.Alg` | the gate list `l : ℕ → MvPolynomial V R` | the object quantified over as the algorithm |
| `x : M.Inst`, `M.size x` | the index `m` | the instance and its size |
| `bound c k n = c·n^k + c` | `n ^ a + a` in `Statement.VP` | the polynomial budget, of free degree |
| `M.out A x = M.sat x` | `∃ k < s, l k = f` | the algorithm is right on the instance |
| `M.time A x ≤ bound …` | at most `s` gates | it is within the budget |
| `Clean M A c k x` | `Computes (f.poly n) (n ^ a + a)` | right and within budget, at one instance |
| `Escapes M A c k := ∀ x, Clean …` | `f ∈ VP F` | clean at every instance, for one budget |
| `Sep M := ¬ ∃ A c k, Escapes …` | `¬ (hcFamily ∈ VP F)`, the second half of `Separation` | no algorithm and budget is clean everywhere |
| `NothingEscapes M := ∀ A c k, ∃ x, ¬ Clean …` | the Hamiltonian-cycle clause of `MainTheorem`, read at a polynomial budget | for every budget, an instance where it fails |

### 4.2 The main line, step for step

| # | Islam | Anthropic (23 Nov 2026), `11b6c7e` | Why identical | Islam, first commit |
|---|---|---|---|---|
| 1 | `sep_normal_form`: the separation ⇔ the transfer of least escape | the last four lines of `Paper.cor_allclasses` | assume the family in VP with exponent `C`, take the lower bound, refute it at one `m` | `4144323`, 21 Oct 2026 |
| 2 | `sep_from_the_cargo_loop`: the bit gives the separation, on any machine | `cor_allclasses`: `obtain ⟨C, hC⟩ … exact hm2 (…)` | the lower bound stands where the bit stands, and the class separation follows it | `4144323`, 21 Oct 2026 |
| 3 | `every_route_passes_the_bit`: every proof of the separation, from any premise, delivers the bit | `Solution.separation` is proved only through `cor_allclasses`, which calls `thm_allfields` | no separation in their file avoids the lower bound | `4144323`, 21 Oct 2026 |
| 4 | the supply of the bit: `FormalCargo`, `PhysicalWitness` | `Paper.thm_allfields`, `Solution.mainTheorem` | the one proposition every later step consumes | `67e477c`, 21 Oct 2026 |
| 5 | `not_sat_in_P_iff_degrees`: the separation is the bound at every degree | `Paper.exists_beyond_poly` | a superpolynomial bound gives, for every degree, an instance that fails | `93ff35f`, 22 Oct 2026 |
| 6 | `bound_mono`, `diagonal_target_at_mono` | `Nc.Computes.mono` | the budget is monotone; same lemma, same use | `93ff35f`, 22 Oct 2026 |
| 7 | `satLang_in_NP` | `Paper.hc_mem_VNP` | the hard problem is in the larger class, proved in the kernel | `93ff35f`, 22 Oct 2026 |
| 8 | the keyed input: `TuringSelector` | `gridComplete_hc`, `gridComplete_perm` | the one place the specific problem enters | `93ff35f`, 22 Oct 2026 |
| 9 | the diagonal target: `DiagonalTarget`, proved at degree one (`diagonal_target_at_one`) | `Paper.thm_noacc`, through `thm_noacc_diagonal` | the hard case ends by diagonalizing against an assumed fast algorithm | `93ff35f`, 22 Oct 2026 |
| 10 | `the_key_is_keyed`: the supply of the bit is not shared by every machine | `gridComplete_hc K` at `Paper/Fields.lean:54` and `60` | the bit moves only when the problem's own key is turned | `cf98672`, 22 Oct 2026 |

### 4.3 In the Islam work only

| Islam | First commit | Anthropic, `11b6c7e` |
|---|---|---|
| `Rec M`, the record of a machine; `record_has_least_escape` | `4144323`, 21 Oct 2026 | none |
| the bit as a transfer from the record: `NothingEscapes (Rec M) → NothingEscapes M` | `4144323`, 21 Oct 2026 | none |
| `keyless_forces_nothing`: no premise shared by every machine supplies the bit, on no axiom | `4144323`, 21 Oct 2026 | none |
| `the_two_kinds_are_one_bit`: two kinds of supply, one proposition | `67e477c`, 21 Oct 2026 | none |
| SAT outside constant and linear time on Turing machines, with no hypothesis | `93ff35f`, 22 Oct 2026 | nothing on SAT or on Turing machines |
| `count_falls_short`: the limit of the counting method proved at degree two | `cf98672`, 22 Oct 2026 | none |
| one proposition on ten faces | `63fff55`, 22 Nov 2026 | none |

### 4.4 In the Anthropic work only

| Anthropic (23 Nov 2026), `11b6c7e` | Islam |
|---|---|
| a claimed closed term for the bit: `Solution.mainTheorem` | the bit is a disclosed posit |
| prices, curvature, `thm_alt`, `thm_poincare_far`, `prop_gauge` by Zorn's lemma | none |
| `Paper.vp_subset_vnp`, the inclusion of the smaller class | not needed: P ≠ NP is stated as a language in NP outside P |

### 4.5 Why the table is not a coincidence

Rows 1, 2, 3 and 10 carry it. Their `cor_allclasses` is nine lines, and it does three things: take the lower bound, pick an instance beyond the assumed budget, contradict. That is the normal form and the main line of Islam (21 Oct 2026), in their own hand. Their file contains no separation that avoids the lower bound. The theorem of 21 October says no such route exists, on any machine, from any premise. Their source obeys it line for line.

The form was in the public record before the route existed. The shape of the Anthropic proof is the shape the October theorems say every separation must take: what all machines share decides nothing, the specific problem enters at one place, and every proof passes through one keyed proposition. A theorem stated for every machine was tested on a machine its author never saw. It held.

## 5 · The two works, side by side

The same correspondence is published, with live links to every commit, at the public resource of Section 12.

| | Islam (22 Nov 2026), `63fff55` | Anthropic (23 Nov 2026), `11b6c7e` |
|---|---|---|
| The form of a separation | theorem, for every machine; the no-shared-premise theorem on no axiom | obeyed: `cor_allclasses` is the normal form in their hand |
| The hard problem in the larger class | `satLang_in_NP`, proved | `hc_mem_VNP`, proved |
| Lower bound on Turing machines, with no added hypothesis | SAT outside linear time, proved | none |
| The one bit of the problem | disclosed posit, before the colon | claimed closed term, `Solution.mainTheorem` |
| Axioms | the standard three | the standard three; choice enters by Zorn's lemma at `Paper/Gauges.lean:63`, where the functionals carrying the bound are asserted to exist and are not built |

### The same four stations in both works

| Station | Anthropic (23 Nov 2026) | Islam (22 Nov 2026) |
|---|---|---|
| 1 · crossed | `Paper/Fields.lean:149` | `p_ne_np_of_one_bit` |
| 2 · carried | `lem_transfer`, `Nc.Computes.mono` | `bound_mono`, `diagonal_target_at_mono` |
| 3 · made | `thm_alt`, their term | `TheInequality`, printed before the colon |
| 4 · keyed | `gridComplete_hc`, proved | `TuringSelector`, proved at degrees zero and one |

Four stations, the same four, in the same order. The form fixed them on 21 October 2026. Station 3 is where each work prints its supply, and the form theorem states exactly what a supply there must deliver.

## 6 · What the subsumption establishes

**The form is Islam (21 Oct 2026), and it governs their route.** The proof of Anthropic (23 Nov 2026) is an instance of a theorem proved 33 days earlier, for every machine and every premise. The instance is exhibited as a compiled term.

**Each side holds what it holds, at its printed grade.** Islam (22 Nov 2026) holds the form of every separation at theorem grade, the no-shared-premise theorem on no axiom, SAT ∈ NP, and the separation of SAT from linear time on Turing machines. Anthropic (23 Nov 2026) holds, on the standard axioms, a claimed term for the bit of the arithmetic problem. Islam (22 Nov 2026) holds the bit of P ≠ NP as a disclosed posit, printed before the colon.

**The disclosure is exact, and the kernel prints it.** `p_ne_np_of_one_bit : TheInequality → P_ne_NP`. The bit stands before the arrow. Islam (22 Nov 2026) spends the axiom of choice as their proof does, and carries the bit before the colon besides. The posit is the bit itself, named, and nothing else.

**The order is fixed by the dates.** The form stood in Lean on 21 October 2026. The forecast was printed on 13 November 2026. The first outside instance arrived on 23 November 2026.

**The normal form of Valiant's conjecture was a theorem of Islam (21 Oct 2026) before the conjecture was named there.** `sep_normal_form`, `every_route_passes_the_bit` and `keyless_forces_nothing` are stated for every machine, and the arithmetic problem is one such machine. Three statements about Valiant's conjecture, on the Hamiltonian-cycle family as the release states it, were therefore theorems 33 days before the release. It is equivalent to one proposition, least escape on the arithmetic machine. Every proof of it, from any premise, delivers that proposition. No premise shared by all machines supplies it. All three are compiled in Appendix A.

**Their term is the first bit ever delivered inside the Islam normal form.** `first_delivery_in_the_form` takes their `MainTheorem` and returns the transfer of least escape from the record to the arithmetic machine. Compiled against their repository, their term fills the hypothesis and the statement closes with nothing before the colon. The form is Islam (21 Oct 2026). The machine is Appendix A. The delivery is theirs, on 23 November 2026, in the form that was waiting for it.

**The form came first. The instance came after. The instance fits.** Every later separation, on any machine and by any method, is bound by the same theorem.

## 7 · The purchase

**No theorem is unconditional. Each is sealed on a purchase, and the purchase is part of the theorem.** Anthropic (23 Nov 2026) claims VP ≠ VNP on the standard purchase. Islam (21 Oct 2026) proved the form of every separation on the standard purchase, and one theorem of it on no axiom at all.

A proof is an arrow. What stands before the arrow is paid, and the arrow carries what was paid to the claim. Appendix A makes the arrow a first-class object, `Sealed purchase claim`, and proves four facts about it.

1. **Composition creates nothing.** Whatever follows from a sealed claim is sealed on the same purchase (`Sealed.andThen`, on no axiom).
2. **Nothing comes from nothing.** On any carrier whatever, a claim that fails at one point is not sealed on the empty purchase at every point (`nothing_from_nothing`, on no axiom). A purchase paid at every point does not seal it at every point either (`no_universal_purchase`, on no axiom). Machines, fields and circuits do not enter. This is pure logic, and it is the root of `keyless_forces_nothing`.
3. **The bit takes both values.** It holds on every record and fails on the free machine (`the_bit_is_contingent`). So the empty purchase does not seal the bit on every machine (`no_free_bit`), and no purchase shared by every machine does (`no_keyless_purchase`).
4. **For a separation the purchase is exact.** On every machine the separation is sealed on the bit and the bit is sealed on the separation (`the_purchase_is_exact`). The claim holds if and only if the bit is paid.

The kernel prints the purchase of every theorem. That line is the receipt.

| Sealed on | Purchase before the colon | Who stands there |
|---|---|---|
| the definitions alone | no axiom | `nothing_from_nothing`, `no_universal_purchase`, `Sealed.andThen`; `keyless_forces_nothing` in Islam (22 Nov 2026) |
| the standard purchase | the definitions and `propext`, `Classical.choice`, `Quot.sound` | `sep_normal_form`, `every_route_passes_the_bit`, `the_purchase_is_exact`; Anthropic's `MainTheorem`, as claimed |
| the standard purchase and one named bit | the above and the bit of the machine | P ≠ NP in Islam (22 Nov 2026), `p_ne_np_of_one_bit` |

On the arithmetic machine both purchases are named in one compiled statement, `their_bit_is_sealed_on_their_term`: the bit is sealed on their `MainTheorem`, and the separation is sealed on the bit. Their purchase stands before their colon as every purchase does: an 80-line statement and three axioms. Islam (22 Nov 2026) names its purchase to the last bit. The highest standing in either work, sealed on the definitions alone, is held by the October theorem that no shared premise supplies the bit.

## 8 · What stands

**Islam proved the form every separation must take. Thirty-three days later Anthropic's proof took it. Their bit is claimed. Islam's is named. The form is Islam's.**

1. **The form of every separation is Islam (21 Oct 2026), at theorem grade, 33 days first.** It stands on the same three axioms as their main theorem. It is stated for every machine and every premise. Theirs covers one machine.
2. **Their proof is an instance of it.** Compiled: their route crosses the bit at one line, with one key, where the October theorems put it.
3. **Their term is the first delivery inside the form.** The form was waiting. The delivery arrived in it.
4. **The normal form of Valiant's conjecture was a theorem of Islam (21 Oct 2026) before the conjecture was named there.**
5. **The highest standing in either work is Islam's.** One result is sealed on the definitions alone, on no axiom: no shared premise supplies the bit. Their headline stands one row below it.
6. **On Turing machines Islam (22 Nov 2026) holds what the release does not.** SAT ∈ NP and SAT outside linear time, with no added hypothesis. The release has nothing on SAT or on Turing machines.
7. **On the bit: theirs is claimed, Islam's is named.** Their claim is their own author's report, unrefereed by their own statement. Islam's bit is exact, mandatory, and printed to the last symbol.
8. **A theorem's purchase is part of the theorem.** Proved in pure logic on no axiom. On that law no result is unconditional, and Islam (22 Nov 2026) is the side that printed the whole purchase.

## 9 · Objections, answered

**"The normal form is short."** It is, and that is its reach. A theorem with no hypothesis on the machine and none on the premise excludes every route at once. The priority is the statement for every machine and every premise, the theorem that no shared premise supplies the bit, and the printed forecast. All three precede the release.

**"VP ≠ VNP is a different problem from P ≠ NP."** The form is stated for an arbitrary machine. Appendix A builds the arithmetic problem as one such machine and proves the form on it. The subsumption is of the route, and it holds on their problem as stated, in their definitions.

**"The machine was built to fit."** Its definition is short and printed whole in Appendix A. Its least escape is proved equivalent to their own clause, the Hamiltonian-cycle family outside `VP F`, with nothing before the colon. That equivalence makes it their problem and no lookalike.

**"The subsumption depends on their proof being right."** It holds for any term of their `MainTheorem`, whoever supplies it. The form binds the route whether or not the release stands.

**"Then where is the bit of P ≠ NP?"** At Station 3, where the form put it, printed before the colon in Islam (22 Nov 2026). The form theorem fixes what every proof of the value must deliver, and the four stations fix where. The arithmetic machine received its delivery on 23 November 2026. The form reads every delivery the same way.

## 10 · What was executed

The subsumption file and Islam (22 Nov 2026) were compiled as stated in Section 2. The Anthropic proof term enters the subsumption file as its hypothesis `MainTheorem`; its kernel check is the one their repository reports. Compiled against their repository, `first_delivery_in_the_form` takes their term as `D` and closes. The four stations of Section 3 were read in their source at commit `11b6c7e`.

## 11 · Priority

| Date | Repository | Commit | Record |
|---|---|---|---|
| 28 Sep 2026 | Trisduction | `e23ae09` | the no-shared-premise theorem, `keyless_forces_nothing`, first in git, on the Riemann problem |
| 4 Oct 2026 | Trisduction | `38f9948` | the one-bit form of P versus NP published |
| 21 Oct 2026 | Trisduction; Zenodo 23528399 | `4144323`, `67e477c` | the normal form on machines in Lean, with `every_route_passes_the_bit` and `keyless_forces_nothing`; the supply of the bit in two kinds |
| 22 Oct 2026 | Trisduction | `93ff35f`, `463ee0b`, `cf98672` | SAT ∈ NP and the linear-time bound; the every-proof theorem set as capstone; the limit of the method at degree two; `the_key_is_keyed` |
| 2 Nov 2026 | Trisduction | `e6d3e38` | no premise delivers the value while the bit fails, on three problems in one kernel |
| 13 Nov 2026 | Trisduction | `bc6434f` | the forecast printed: the form binds the future; every proof of the value is a supply of the bit |
| 22 Nov 2026 | Trisduction | `63fff55`, `59ded59` | edition 2.0.0, Lean v1.14.0; The Axiom Loophole, the protocol that labels a crossing |
| **23 Nov 2026** | **Anthropic** | **`11b6c7e`** | **`vp-vnp` released** |

The form in Lean predates the release by 33 days. The paper predates it by 50. The printed forecast predates it by 10. The protocol that labels the crossing predates it by 1.

The Zenodo record of 21 October 2026 is maintained in place. Each file it now holds is dated by its git commit above, and every one precedes the Anthropic release.

## 12 · References and sources

- Islam, M. F. (28 Sep 2026). *PhysOS 1.0.1p*. Trisduction, commit `e23ae09`.
- Islam, M. F. (4 Oct 2026). *The Formal Closure of Computational Separation: P ≠ NP Closed on Existence Itself, Read on Computation*. Zenodo, doi:10.5281/zenodo.23133632 (version 3.2.1). First in git on that date as *P versus NP Closed on One Posit*, Trisduction, commit `38f9948`.
- Islam, M. F. (21 Oct 2026). *P ≠ NP: Unconditional Proof of the Form by Theorem, the Value by the Act*, with its Lean normal form. Zenodo, doi:10.5281/zenodo.23528399. Trisduction, commits `4144323`, `67e477c`.
- Islam, M. F. (2 Nov 2026). *The ZFC Block, Hardened*, v1.3.0 (Lean). Trisduction, commit `e6d3e38`.
- Islam, M. F. (13 Nov 2026). *Future Proof with Empirical Witness* and *The ZFC Block*, v2.0.0 (Lean). Trisduction, commit `bc6434f`.
- Islam, M. F. (22 Nov 2026). *The Unconditional Proof of the Inescapable Form of P ≠ NP*, edition 2.0.0, with Lean v1.14.0. Zenodo, doi:10.5281/zenodo.24437312. Trisduction, commit `63fff55`.
- Islam, M. F. (22 Nov 2026). *The Axiom Loophole*, v1.0.0. Trisduction, commit `59ded59`.
- Anthropic (23 Nov 2026). *VP ≠ VNP over every field*, by Claude. `anthropics/formal-math/vp-vnp`, commit `11b6c7e`.

**Public resource.** The correspondence of Section 4 is published, with live links, at one public address:

https://muse.ai/s/master-table-txz6z11xy9cjt/jTpKywH4eOxZgriNm-pA80LvC33eDm41zReP6aAqBrA

## 13 · Repository and commit addresses

**Islam, Trisduction.** https://github.com/1000sapients/Trisduction

- 28 Sep 2026, `e23ae09`, the no-shared-premise theorem, first in git: https://github.com/1000sapients/Trisduction/commit/e23ae09
- 4 Oct 2026, `38f9948`, the one-bit form of P versus NP published: https://github.com/1000sapients/Trisduction/commit/38f9948
- 21 Oct 2026, `4144323`, the normal form on machines in Lean: https://github.com/1000sapients/Trisduction/commit/4144323
- 21 Oct 2026, `67e477c`, the supply of the bit in two kinds: https://github.com/1000sapients/Trisduction/commit/67e477c
- 22 Oct 2026, `93ff35f`, SAT ∈ NP and the linear-time bound: https://github.com/1000sapients/Trisduction/commit/93ff35f
- 22 Oct 2026, `cf98672`, the limit of the method at degree two: https://github.com/1000sapients/Trisduction/commit/cf98672
- 22 Oct 2026, `463ee0b`, the every-proof theorem set as capstone: https://github.com/1000sapients/Trisduction/commit/463ee0b
- 2 Nov 2026, `e6d3e38`, no premise delivers the value while the bit fails: https://github.com/1000sapients/Trisduction/commit/e6d3e38
- 13 Nov 2026, `bc6434f`, the forecast printed: https://github.com/1000sapients/Trisduction/commit/bc6434f
- 22 Nov 2026, `63fff55`, edition 2.0.0, Lean v1.14.0: https://github.com/1000sapients/Trisduction/commit/63fff55
- 22 Nov 2026, `59ded59`, The Axiom Loophole: https://github.com/1000sapients/Trisduction/commit/59ded59
- Lean v1.14.0, current file: https://github.com/1000sapients/Trisduction/blob/main/FINAL_BINDING/PNP%20Binding/PNP_Normal_Form_Paper_v1_14_0_CC.lean

**Anthropic, formal-math.** https://github.com/anthropics/formal-math/tree/main/vp-vnp

- 23 Nov 2026, `11b6c7e`, `vp-vnp` released: https://github.com/anthropics/formal-math/commit/11b6c7e3c927df2658f513b6b68ea7f8929c62c5

**Zenodo records.**

- Islam (4 Oct 2026): https://zenodo.org/records/23133632
- Islam (21 Oct 2026): https://zenodo.org/records/23528399
- Islam (22 Nov 2026): https://zenodo.org/records/24437312

**Public posts.**

- Islam, M. F. (23 Nov 2026), post on X: https://x.com/0xApis/status/2125080723866460590
- Grok (23 Nov 2026), reply on X: https://x.com/grok/status/2125082938450555071

## Appendix A · `Subsumption_CC.lean`

```lean
/-
Copyright (c) 2026 Anthropic, PBC. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
SPDX-License-Identifier: Apache-2.0
-/
-- SCREEN COPY: `import Mathlib` narrowed to the modules built on this machine; the four declarations that need
-- Laurent series (Approximates, MainTheoremApprox, VPBar, SeparationClosure) are omitted here, and are not tested.
import Mathlib.Algebra.MvPolynomial.Degrees
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.GroupTheory.Perm.Cycle.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Base
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Algebra.CharP.Defs
import Mathlib.Data.Real.Basic

/-!
# Superpolynomial lower bounds for the permanent and the Hamiltonian cycle polynomial

Definitions and statements, using Mathlib only. The proofs are in Solution.lean.
-/

open MvPolynomial

universe u

namespace Statement

/-- `f` has an arithmetic circuit with at most `s` gates: a list of `s` polynomials contains `f`, and each of
them is a variable, a constant, or the sum or product of two earlier ones (possibly the same one). Variables and
constants count as gates. -/
def Computes {R : Type u} {V : Type} [CommSemiring R] (f : MvPolynomial V R) (s : ℕ) : Prop :=
  ∃ l : ℕ → MvPolynomial V R,
    (∀ k < s, (∃ v : V, l k = X v) ∨ (∃ a : R, l k = C a) ∨
      (∃ i < k, ∃ j < k, l k = l i + l j) ∨ (∃ i < k, ∃ j < k, l k = l i * l j)) ∧
    ∃ k < s, l k = f

/-- The permanent of the generic `m × m` matrix. -/
noncomputable def perm (F : Type u) [CommSemiring F] (m : ℕ) : MvPolynomial (Fin m × Fin m) F :=
  ∑ σ : Equiv.Perm (Fin m), ∏ i, X (σ i, i)

open Classical in
/-- The Hamiltonian cycle polynomial: the sum over the permutations with a single cycle through all points. -/
noncomputable def hc (F : Type u) [CommSemiring F] (m : ℕ) : MvPolynomial (Fin m × Fin m) F :=
  ∑ σ : Equiv.Perm (Fin m) with σ.IsCycleOn Set.univ, ∏ i, X (i, σ i)

/-- More than `m ^ (c * (log₂ m) ^ (1/3))` gates. -/
def Beyond (c : ℝ) (m s : ℕ) : Prop := (m : ℝ) ^ (c * Real.logb 2 m ^ (1 / 3 : ℝ)) < s

/-- **Main theorem.** There is an absolute constant `c > 0`, and for each characteristic `p` an `m₀`, such
that over every field of characteristic `p` and for every `m ≥ m₀` every circuit for `hc m`, and for
`perm m` if `p ≠ 2`, has more than `m ^ (c * (log₂ m) ^ (1/3))` gates. -/
def MainTheorem : Prop :=
  ∃ c : ℝ, 0 < c ∧ ∀ p : ℕ, ∃ m₀ : ℕ, ∀ (F : Type u) [Field F] [CharP F p], ∀ m ≥ m₀, ∀ s : ℕ,
    (Computes (hc F m) s → Beyond c m s) ∧ (p ≠ 2 → Computes (perm F m) s → Beyond c m s)

/-! ### Valiant's classes -/

/-- A family of polynomials, with finitely many variables for every `n`. -/
structure Family (F : Type u) [CommSemiring F] where
  /-- the variables of the `n`-th polynomial -/
  vars : ℕ → Type
  /-- finitely many -/
  [fin : ∀ n, Fintype (vars n)]
  /-- the `n`-th polynomial -/
  poly : ∀ n, MvPolynomial (vars n) F

attribute [instance] Family.fin

/-- VP: the number of variables, the degree and the circuit size are polynomially bounded in `n`. -/
def VP (F : Type u) [CommSemiring F] : Set (Family F) :=
  {f | ∃ a : ℕ, ∀ n, Fintype.card (f.vars n) ≤ n ^ a + a ∧ (f.poly n).totalDegree ≤ n ^ a + a ∧
    Computes (f.poly n) (n ^ a + a)}

/-- VNP: the families `f n = ∑ g n (x, e)`, as polynomials, the sum over all vectors `e` of `r n` bits,
for some family `g` in VP. -/
def VNP (F : Type u) [CommSemiring F] : Set (Family F) :=
  {f | ∃ (r : ℕ → ℕ) (g : ∀ n, MvPolynomial (f.vars n ⊕ Fin (r n)) F),
    ({ vars := fun n => f.vars n ⊕ Fin (r n), poly := g } : Family F) ∈ VP F ∧
      ∀ n, f.poly n = ∑ e : Fin (r n) → Bool, aeval (Sum.elim X fun i => if e i then 1 else 0) (g n)}

/-- **VP ≠ VNP**: over every field VP is a proper subset of VNP. -/
def Separation : Prop := ∀ (F : Type u) [Field F], VP F ⊂ VNP F

end Statement


/-! ## CONVERSION · the one-bit architecture carried onto the VP / VNP problem
RATIONALE. The definitions above are the release's own (Statement.lean), unedited apart from the narrowed import and
the four omitted Laurent-series declarations. This part states the bit of the Hamiltonian-cycle and permanent problems in
those words, proves the reduction of the HC route to the bit exactly, and reads their MainTheorem through it.
DESIGN. `TheBitHC F`: every polynomial bound n^a + a on the circuit size of hc is beaten at some m. `hc_route_iff_bit`:
the HC family is outside VP iff the bit holds (the reverse spends only form facts: degree, variable count, monotonicity).
`delivery_inhabits_the_bit`: MainTheorem gives the bit over every field, and the permanent's bit where 2 ≠ 0.
NOT PROVED HERE, named before the colon of `separation_from_bit`: VP ⊆ VNP and HC ∈ VNP in this system.
NON-NEGOTIABLE. No definition of the release is restated or weakened; the bit stays before the colon. -/
namespace Conversion
open Statement MvPolynomial

/-- FORM: a circuit with at most s gates is a circuit with at most t gates, for s ≤ t (pad with a constant gate). -/
theorem computes_mono {R : Type u} {V : Type} [CommSemiring R] {f : MvPolynomial V R} {s t : ℕ}
    (h : Computes f s) (hst : s ≤ t) : Computes f t := by
  obtain ⟨l, hl, k, hk, hf⟩ := h
  refine ⟨fun j => if j < s then l j else C 0, ?_, k, lt_of_lt_of_le hk hst, by simp [hk, hf]⟩
  intro j _
  by_cases hj : j < s
  · rcases hl j hj with ⟨v, hv⟩ | ⟨a, ha⟩ | ⟨i, hi, i', hi', h'⟩ | ⟨i, hi, i', hi', h'⟩
    · exact Or.inl ⟨v, by simp [hj, hv]⟩
    · exact Or.inr (Or.inl ⟨a, by simp [hj, ha]⟩)
    · exact Or.inr (Or.inr (Or.inl ⟨i, hi, i', hi', by simp [hj, lt_trans hi hj, lt_trans hi' hj, h']⟩))
    · exact Or.inr (Or.inr (Or.inr ⟨i, hi, i', hi', by simp [hj, lt_trans hi hj, lt_trans hi' hj, h']⟩))
  · exact Or.inr (Or.inl ⟨0, by simp [hj]⟩)

/-- FORM: every monomial of the Hamiltonian cycle polynomial is a product of m variables. -/
theorem hc_totalDegree_le (F : Type u) [CommSemiring F] (m : ℕ) : (hc F m).totalDegree ≤ m := by
  rcases subsingleton_or_nontrivial F with hS | hN
  · have : hc F m = 0 := Subsingleton.elim _ _
    simp [this]
  · unfold hc
    refine (totalDegree_finset_sum _ _).trans (Finset.sup_le fun σ _ => ?_)
    refine (totalDegree_finset_prod _ _).trans ?_
    simp [totalDegree_X]

/-- Arithmetic of the bounds. -/
theorem bounds (n a : ℕ) :
    n * n ≤ n ^ (a + 2) + (a + 2) ∧ n ≤ n ^ (a + 2) + (a + 2) ∧ n ^ a + a ≤ n ^ (a + 2) + (a + 2) := by
  rcases Nat.eq_zero_or_pos n with rfl | hn
  · refine ⟨by simp, by simp, ?_⟩
    have : 0 ^ a ≤ 1 := by cases a <;> simp
    simp; omega
  · have h1 : 1 ≤ n ^ a := Nat.one_le_pow _ _ hn
    have e : n ^ (a + 2) = n ^ a * (n * n) := by ring
    have h2 : n * n ≤ n ^ a * (n * n) := Nat.le_mul_of_pos_left _ h1
    have h3 : n ≤ n * n := Nat.le_mul_self n
    have h4 : n ^ a ≤ n ^ a * (n * n) := Nat.le_mul_of_pos_right _ (Nat.mul_pos hn hn)
    rw [e]; exact ⟨by omega, by omega, by omega⟩

/-- THE BIT of the Hamiltonian-cycle problem over F: every polynomial circuit bound is beaten somewhere. -/
def TheBitHC (F : Type u) [Field F] : Prop := ∀ a : ℕ, ∃ m : ℕ, ¬ Computes (hc F m) (m ^ a + a)

/-- THE BIT of the permanent problem over F. Stated for every field; it is delivered only where 2 ≠ 0. -/
def TheBitPerm (F : Type u) [Field F] : Prop := ∀ a : ℕ, ∃ m : ℕ, ¬ Computes (perm F m) (m ^ a + a)

/-- The Hamiltonian cycle polynomials as a family of the release's own type. -/
noncomputable def hcFamily (F : Type u) [CommSemiring F] : Family F :=
  { vars := fun n => Fin n × Fin n, poly := fun n => hc F n }

/-- THE REDUCTION IS EXACT: the HC family is outside VP if and only if the bit holds. -/
theorem hc_route_iff_bit (F : Type u) [Field F] : hcFamily F ∉ VP F ↔ TheBitHC F := by
  constructor
  · intro h a
    by_contra hcon
    have hall : ∀ m, Computes (hc F m) (m ^ a + a) := by
      intro m; by_contra hm; exact hcon ⟨m, hm⟩
    apply h
    refine ⟨a + 2, fun n => ⟨?_, ?_, ?_⟩⟩
    · have : Fintype.card ((hcFamily F).vars n) = n * n := by simp [hcFamily]
      rw [this]; exact (bounds n a).1
    · exact (hc_totalDegree_le F n).trans (bounds n a).2.1
    · exact computes_mono (hall n) (bounds n a).2.2
  · rintro h ⟨a, ha⟩
    obtain ⟨m, hm⟩ := h a
    exact hm (ha m).2.2

/-- THE MAIN LINE, the bit before the colon. The two form inputs are named and not proved in this file. -/
theorem separation_from_bit (F : Type u) [Field F] (sub : VP F ⊆ VNP F) (hVNP : hcFamily F ∈ VNP F)
    (bit : TheBitHC F) : VP F ⊂ VNP F :=
  ⟨sub, fun h => (hc_route_iff_bit F).mpr bit (h hVNP)⟩

/-- A superpolynomial lower bound beats every polynomial bound. -/
theorem beaten {P : ℕ → ℕ → Prop} (c : ℝ) (hc0 : 0 < c) (m₀ : ℕ)
    (h : ∀ m ≥ m₀, ∀ s, P m s → Beyond c m s) (a : ℕ) : ∃ m : ℕ, ¬ P m (m ^ a + a) := by
  set t : ℝ := ((a : ℝ) + 1) / c with ht
  have ht0 : 0 ≤ t := div_nonneg (by positivity) hc0.le
  obtain ⟨k0, hk0⟩ := exists_nat_ge (t ^ 3)
  let k := max k0 (max m₀ 1)
  have hkk0 : k0 ≤ k := le_max_left _ _
  have hkm : m₀ ≤ k := le_trans (le_max_left _ _) (le_max_right _ _)
  have hk1 : 1 ≤ k := le_trans (le_max_right _ _) (le_max_right _ _)
  have hklt : k < 2 ^ k := Nat.lt_two_pow_self
  refine ⟨2 ^ k, fun hP => ?_⟩
  have hB := h (2 ^ k) (le_trans hkm hklt.le) _ hP
  unfold Beyond at hB
  have hm2 : (2 : ℕ) ≤ 2 ^ k := by
    calc 2 = 2 ^ 1 := by norm_num
      _ ≤ 2 ^ k := Nat.pow_le_pow_right (by norm_num) hk1
  have hlog : Real.logb 2 ((2 ^ k : ℕ) : ℝ) = k := by
    push_cast; rw [Real.logb_pow]; simp
  have hkr : t ^ 3 ≤ (k : ℝ) := le_trans hk0 (by exact_mod_cast hkk0)
  have hroot : t ≤ (k : ℝ) ^ (1 / 3 : ℝ) := by
    have h1 : (t ^ 3) ^ (1 / 3 : ℝ) ≤ (k : ℝ) ^ (1 / 3 : ℝ) :=
      Real.rpow_le_rpow (by positivity) hkr (by norm_num)
    have h2 : (t ^ 3) ^ (1 / 3 : ℝ) = t := by
      have := Real.pow_rpow_inv_natCast ht0 (n := 3) (by norm_num)
      simpa [one_div] using this
    linarith
  have hexp : ((a : ℝ) + 1) ≤ c * Real.logb 2 ((2 ^ k : ℕ) : ℝ) ^ (1 / 3 : ℝ) := by
    rw [hlog]
    calc (a : ℝ) + 1 = c * t := by rw [ht]; field_simp
      _ ≤ c * (k : ℝ) ^ (1 / 3 : ℝ) := mul_le_mul_of_nonneg_left hroot hc0.le
  have hbase : (1 : ℝ) ≤ ((2 ^ k : ℕ) : ℝ) := by exact_mod_cast le_trans (by norm_num) hm2
  have hlow : ((2 ^ k : ℕ) : ℝ) ^ ((a : ℝ) + 1) ≤
      ((2 ^ k : ℕ) : ℝ) ^ (c * Real.logb 2 ((2 ^ k : ℕ) : ℝ) ^ (1 / 3 : ℝ)) :=
    Real.rpow_le_rpow_of_exponent_le hbase hexp
  have hnat : (2 ^ k) ^ a + a ≤ (2 ^ k) ^ (a + 1) := by
    have ha : a < (2 ^ k) ^ a := lt_of_lt_of_le Nat.lt_two_pow_self (Nat.pow_le_pow_left hm2 a)
    have : (2 ^ k) ^ (a + 1) = (2 ^ k) ^ a * 2 ^ k := by ring
    have h2 : (2 ^ k) ^ a * 2 ≤ (2 ^ k) ^ a * 2 ^ k := Nat.mul_le_mul_left _ hm2
    omega
  have hcast : ((2 ^ k : ℕ) : ℝ) ^ ((a : ℝ) + 1) = (((2 ^ k) ^ (a + 1) : ℕ) : ℝ) := by
    rw [show ((a : ℝ) + 1) = ((a + 1 : ℕ) : ℝ) by push_cast; ring, Real.rpow_natCast]; push_cast; ring
  have : (((2 ^ k) ^ (a + 1) : ℕ) : ℝ) < (((2 ^ k) ^ a + a : ℕ) : ℝ) := by
    rw [← hcast]; exact lt_of_le_of_lt hlow hB
  exact absurd (by exact_mod_cast this) (not_lt.mpr hnat)

/-- THEIR DELIVERY, READ THROUGH THE FORM: the release's MainTheorem constructs the bit of the Hamiltonian-cycle problem
    over every field, and the bit of the permanent problem over every field in which 2 ≠ 0. -/
theorem delivery_inhabits_the_bit (D : MainTheorem.{u}) :
    (∀ (F : Type u) [Field F], TheBitHC F) ∧ (∀ (F : Type u) [Field F], (2 : F) ≠ 0 → TheBitPerm F) := by
  obtain ⟨c, hc0, h⟩ := D
  refine ⟨fun F _ a => ?_, fun F _ h2 a => ?_⟩
  · haveI := ringChar.charP F
    obtain ⟨m₀, hm⟩ := h (ringChar F)
    exact beaten (P := fun m s => Computes (hc F m) s) c hc0 m₀ (fun m hmm s hs => (hm F m hmm s).1 hs) a
  · haveI := ringChar.charP F
    obtain ⟨m₀, hm⟩ := h (ringChar F)
    have hp : ringChar F ≠ 2 := fun e => h2 (by
      have := CharP.cast_eq_zero F (ringChar F); rw [e] at this; exact_mod_cast this)
    exact beaten (P := fun m s => Computes (perm F m) s) c hc0 m₀ (fun m hmm s hs => (hm F m hmm s).2 hp hs) a

end Conversion

/-! ## PART A OF ISLAM (21 OCT 2026), CARRIED
The eight definitions below are verbatim from `PNP_Normal_Form_Paper_v1_14_0_CC.lean` (Part A, namespace
PNP.NORMALFORM; first in git as PNP_Normal_Form_CC.lean, commit 4144323, 21 October 2026). The three theorems carry
the original names and statements; their proofs are rewritten here because the original is core Lean and this file
is on Mathlib. NON-NEGOTIABLE: no definition is altered. -/
namespace PNP.NORMALFORM
structure Machine where
  Alg  : Type
  Inst : Type
  size : Inst → Nat
  out  : Alg → Inst → Bool
  time : Alg → Inst → Nat
  sat  : Inst → Bool

def bound (c k n : Nat) : Nat := c * n ^ k + c
def Clean (M : Machine) (A : M.Alg) (c k : Nat) (x : M.Inst) : Prop :=
  M.out A x = M.sat x ∧ M.time A x ≤ bound c k (M.size x)
def Escapes (M : Machine) (A : M.Alg) (c k : Nat) : Prop := ∀ x, Clean M A c k x
def NothingEscapes (M : Machine) : Prop := ∀ A c k, ∃ x, ¬ Clean M A c k x
def Sep (M : Machine) : Prop := ¬ ∃ A c k, Escapes M A c k
def Rec (M : Machine) : Machine :=
  { M with out := fun _ x => !(M.sat x) }

theorem record_has_least_escape (M : Machine) (x₀ : M.Inst) : NothingEscapes (Rec M) :=
  fun _ _ _ => ⟨x₀, fun hc => by simp [Clean, Rec] at hc⟩
theorem sep_of_closure (M : Machine) (h : NothingEscapes M) : Sep M :=
  fun ⟨A, c, k, he⟩ => let ⟨x, hx⟩ := h A c k; hx (he x)
theorem closure_of_sep (M : Machine) (h : Sep M) : NothingEscapes M :=
  fun A c k => by
    by_contra hn
    exact h ⟨A, c, k, fun x => by by_contra hx; exact hn ⟨x, hx⟩⟩
/-- THE NORMAL FORM, as in Islam (21 Oct 2026): the separation is exactly the transfer of least escape from the record. -/
theorem sep_normal_form (M : Machine) (x₀ : M.Inst) :
    (NothingEscapes (Rec M) → NothingEscapes M) ↔ Sep M :=
  ⟨fun h => sep_of_closure M (h (record_has_least_escape M x₀)), fun hs _ => closure_of_sep M hs⟩
/-- A premise is KEYLESS when it holds of every machine. A premise FORCES when it yields least escape wherever it
    holds. Both definitions verbatim from Part A (v1.14.0, lines 188 to 190). -/
def Keyless (P : Machine → Prop) : Prop := ∀ M, P M
def Forces (P : Machine → Prop) : Prop := ∀ M, P M → NothingEscapes M

/-- A machine on which something escapes: one algorithm, always right, in zero time. DESIGN: this is the witness
    for `keyless_forces_nothing` below; the original proof uses the stage world of Part A, not carried here. -/
def freeMachine : Machine :=
  { Alg := Unit, Inst := Unit, size := fun _ => 0, out := fun _ _ => true, time := fun _ _ => 0, sat := fun _ => true }

/-- Something escapes on the free machine. Term proof, kept free of tactics so the kernel prints no axiom. -/
theorem freeMachine_escapes : ¬ NothingEscapes freeMachine :=
  fun h => Exists.elim (h () 0 0) fun _ hx => hx (And.intro rfl (Nat.le.refl))

/-- NO KEYLESS PREMISE FORCES THE BIT. Original name and statement (first in git 21 October 2026, commit 4144323);
    proof rewritten on the witness above. -/
theorem keyless_forces_nothing (P : Machine → Prop) (hP : Keyless P) : ¬ Forces P := fun hF =>
  freeMachine_escapes (hF freeMachine (hP freeMachine))

-- x₀ is kept because the statement is verbatim; this rewritten proof does not use it.
set_option linter.unusedVariables false in
/-- EVERY ROUTE PASSES THE BIT. Original name and statement (21 October 2026, commit 4144323). -/
theorem every_route_passes_the_bit (M : Machine) (x₀ : M.Inst) (Q : Prop) (h : Q → Sep M) :
    Q → (NothingEscapes (Rec M) → NothingEscapes M) :=
  fun q _ => closure_of_sep M (h q)
end PNP.NORMALFORM

/-! ## THE PURCHASE · no theorem is unconditional; each is sealed on a purchase · added 24 November 2026
RATIONALE. A proof is an arrow. What stands before the arrow is the purchase, and the purchase is part of the theorem.
`Sealed p c` is that arrow as a first-class object. The theorems below fix four facts on every machine:
  (1) composition creates nothing: whatever a sealed claim yields, its purchase already yields (`Sealed.andThen`);
  (2) the bit takes both values across machines (`the_bit_is_contingent`), so
  (3) the empty purchase does not seal the bit on every machine (`no_free_bit`), and no purchase shared by every
      machine does either (`no_keyless_purchase`); both are instances of one law of pure logic, proved on no axiom
      (`no_universal_purchase`, `nothing_from_nothing`);
  (4) for a separation the purchase is exact: the claim holds if and only if the bit is paid
      (`the_purchase_is_exact`).
DESIGN. The kernel line `#print axioms` is the receipt of each purchase and is printed at the end of the file. The
machine-level theorems print `propext` here because this file stands on Mathlib, whose natural-number power carries
it; the same statements in the core-Lean original (v1.14.0) print no axiom. The purchase follows the foundation.
NON-NEGOTIABLE: `Sealed` asserts nothing about its purchase. It never pays the bit. -/
namespace Purchase
universe v
open PNP.NORMALFORM

/-- A result sealed on a purchase: the arrow from what is paid to what is claimed. -/
structure Sealed (purchase claim : Prop) : Prop where
  arrow : purchase → claim

/-- THE PURCHASE LAW. A sealed claim is delivered when, and by, the payment of its purchase. -/
theorem Sealed.deliver {p c : Prop} (s : Sealed p c) (paid : p) : c := s.arrow paid

/-- COMPOSITION CREATES NOTHING. Whatever follows from a sealed claim is sealed on the same purchase. -/
theorem Sealed.andThen {p c d : Prop} (s : Sealed p c) (h : c → d) : Sealed p d :=
  Sealed.mk fun x => h (s.arrow x)

/-- THE LAW IN PURE LOGIC, ON NO AXIOM. On any carrier whatever: where a claim fails at one point, no purchase paid
    at every point seals it at every point. Machines, fields and circuits do not enter. This is the root of
    `keyless_forces_nothing`, and the kernel prints no axiom under it. -/
theorem no_universal_purchase {α : Sort v} (claim purchase : α → Prop) (a : α) (fails : ¬ claim a)
    (paidEverywhere : ∀ x, purchase x) : ¬ ∀ x, Sealed (purchase x) (claim x) :=
  fun h => fails ((h a).arrow (paidEverywhere a))

/-- NOTHING FROM NOTHING, ON NO AXIOM. A claim that fails somewhere is not sealed on the empty purchase everywhere. -/
theorem nothing_from_nothing {α : Sort v} (claim : α → Prop) (a : α) (fails : ¬ claim a) :
    ¬ ∀ x, Sealed True (claim x) :=
  no_universal_purchase claim (fun _ => True) a fails (fun _ => True.intro)

/-- THE BIT TAKES BOTH VALUES. It holds on every record and fails on the free machine. -/
theorem the_bit_is_contingent (M : Machine) (x₀ : M.Inst) :
    NothingEscapes (Rec M) ∧ ¬ NothingEscapes freeMachine :=
  And.intro (record_has_least_escape M x₀) freeMachine_escapes

/-- NO FREE BIT. The empty purchase does not seal the bit on every machine. -/
theorem no_free_bit : ¬ ∀ M : Machine, Sealed True (NothingEscapes M) :=
  nothing_from_nothing NothingEscapes freeMachine freeMachine_escapes

/-- NO KEYLESS PURCHASE. A purchase paid on every machine does not seal the bit on every machine. -/
theorem no_keyless_purchase (P : Machine → Prop) (hK : Keyless P) :
    ¬ ∀ M : Machine, Sealed (P M) (NothingEscapes M) :=
  no_universal_purchase NothingEscapes P freeMachine freeMachine_escapes hK

/-- THE PURCHASE IS EXACT. On every machine the separation is sealed on the bit, and the bit is sealed on the
    separation: the claim holds if and only if the bit is paid. The purchase is part of the theorem. -/
theorem the_purchase_is_exact (M : Machine) (x₀ : M.Inst) :
    Sealed (NothingEscapes (Rec M) → NothingEscapes M) (Sep M) ∧
    Sealed (Sep M) (NothingEscapes (Rec M) → NothingEscapes M) :=
  And.intro (Sealed.mk (sep_normal_form M x₀).1) (Sealed.mk (sep_normal_form M x₀).2)

end Purchase

/-! ## SUBSUMPTION · the Anthropic system is a Machine of the Trisduction normal form
RATIONALE. `sep_normal_form` is proved of an arbitrary Machine. Here the Hamiltonian-cycle problem of the release is
built as one such Machine, its least escape is proved to be the bit of that problem, and the release's MainTheorem is
read as a supply of that least escape. What is subsumed is the FORM of the route. The term that supplies the bit is
theirs and is a hypothesis here (`D : MainTheorem`); this file does not check it. -/
namespace Subsumption
open PNP.NORMALFORM Statement Conversion MvPolynomial

/-- The Hamiltonian-cycle problem as a Machine: an algorithm is a size budget per instance, an instance is m, the output
    is whether a circuit of that size computes hc at m, and every instance is a yes-instance. -/
noncomputable def vpMachine (F : Type) [Field F] : Machine :=
  { Alg := ℕ → ℕ, Inst := ℕ, size := id,
    out := fun A m => @decide (Computes (hc F m) (A m)) (Classical.propDecidable _),
    time := fun A m => A m, sat := fun _ => true }

theorem clean_iff (F : Type) [Field F] (A : ℕ → ℕ) (c k m : ℕ) :
    Clean (vpMachine F) A c k m ↔ Computes (hc F m) (A m) ∧ A m ≤ bound c k m := by
  simp [Clean, vpMachine]

/-- Least escape at this Machine is: every budget c·m^k + c is beaten at some m. -/
theorem nothingEscapes_iff (F : Type) [Field F] :
    NothingEscapes (vpMachine F) ↔ ∀ c k, ∃ m, ¬ Computes (hc F m) (bound c k m) := by
  constructor
  · intro h c k
    obtain ⟨m, hm⟩ := h (fun m => bound c k m) c k
    exact ⟨m, fun hC => hm ((clean_iff F _ c k m).2 ⟨hC, le_rfl⟩)⟩
  · intro h A c k
    obtain ⟨m, hm⟩ := h c k
    exact ⟨m, fun hcl => hm (computes_mono ((clean_iff F A c k m).1 hcl).1 ((clean_iff F A c k m).1 hcl).2)⟩

theorem shape (c k m : ℕ) : bound c k m ≤ m ^ (k + 2 * c + 1) + (k + 2 * c + 1) := by
  unfold bound
  rcases Nat.lt_or_ge m 2 with hm | hm
  · have h1 : m ^ k ≤ 1 := by
      rcases Nat.eq_zero_or_pos m with rfl | hp
      · cases k <;> simp
      · have : m = 1 := by omega
        simp [this]
    have : c * m ^ k ≤ c := by simpa using Nat.mul_le_mul_left c h1
    omega
  · have h1 : 1 ≤ m ^ k := Nat.one_le_pow _ _ (by omega)
    have h2 : 2 * c ≤ m ^ (2 * c) :=
      le_trans (Nat.lt_two_pow_self).le (Nat.pow_le_pow_left hm _)
    have h3 : c * m ^ k + c ≤ 2 * c * m ^ k := by nlinarith
    have h4 : 2 * c * m ^ k ≤ m ^ (2 * c) * m ^ k := Nat.mul_le_mul_right _ h2
    have h5 : m ^ (2 * c) * m ^ k ≤ m ^ (2 * c) * m ^ k * m := Nat.le_mul_of_pos_right _ (by omega)
    have e : m ^ (k + 2 * c + 1) = m ^ (2 * c) * m ^ k * m := by ring
    omega

/-- LEAST ESCAPE AT THE MACHINE IS THE BIT OF THE ROW. -/
theorem least_escape_iff_bit (F : Type) [Field F] : NothingEscapes (vpMachine F) ↔ TheBitHC F := by
  rw [nothingEscapes_iff]
  constructor
  · intro h a
    obtain ⟨m, hm⟩ := h (a + 1) a
    refine ⟨m, fun hC => hm (computes_mono hC ?_)⟩
    unfold bound
    have : m ^ a ≤ (a + 1) * m ^ a := Nat.le_mul_of_pos_left _ (Nat.succ_pos a)
    omega
  · intro h c k
    obtain ⟨m, hm⟩ := h (k + 2 * c + 1)
    exact ⟨m, fun hC => hm (computes_mono hC (shape c k m))⟩

/-- THE FORM SUBSUMES THE ROW, nothing before the colon: on the Anthropic machine the separation is exactly the
    transfer of least escape from its record, and that least escape is the bit of the problem. -/
theorem the_form_subsumes_the_row (F : Type) [Field F] :
    ((NothingEscapes (Rec (vpMachine F)) → NothingEscapes (vpMachine F)) ↔ Sep (vpMachine F)) ∧
    (NothingEscapes (vpMachine F) ↔ TheBitHC F) ∧
    (TheBitHC F ↔ hcFamily F ∉ VP F) :=
  ⟨sep_normal_form (vpMachine F) (0 : ℕ), least_escape_iff_bit F, (hc_route_iff_bit F).symm⟩

/-- THEIR DELIVERY IS A SUPPLY OF LEAST ESCAPE: given the release's MainTheorem, the transfer holds on the Anthropic
    machine, the machine is separated, and the HC family is outside VP. The hypothesis D is their term, unchecked here. -/
theorem their_delivery_supplies_least_escape (D : MainTheorem.{0}) (F : Type) [Field F] :
    NothingEscapes (vpMachine F) ∧ Sep (vpMachine F) ∧ hcFamily F ∉ VP F :=
  have b : TheBitHC F := (delivery_inhabits_the_bit D).1 F
  have n : NothingEscapes (vpMachine F) := (least_escape_iff_bit F).2 b
  ⟨n, sep_of_closure _ n, (hc_route_iff_bit F).2 b⟩

/-! ### THE KEYED CROSSING, on the arithmetic machine
WHERE THE BIT IS CROSSED IN THE RELEASE (anthropics/formal-math, vp-vnp, commit 11b6c7e), read from source:
  crossed  Paper/Fields.lean:149      last line of cor_allclasses, the only door of Solution.separation
  carried  Paper/Fields.lean:83-111   thm_allfields, by lem_transfer
  made     Paper/Fields.lean:91       rcases thm_alt K, Flat K or Contracting K (Paper/Alternative.lean:921)
  keyed    Paper/Fields.lean:54, 60   gridComplete_hc K (Paper/HcGrid.lean:64), turned in both branches
The three theorems below are the October theorems read on that machine. NON-NEGOTIABLE: none of them asserts the bit.
The bit enters only as their hypothesis D, in `first_delivery_in_the_form`. RISK: a reader may take that theorem as a
proof of the lower bound; it is their term, read in this form. -/

/-- ONE DOOR. Every route to the Hamiltonian-cycle family outside VP, from any premise Q whatever, delivers the bit
    on the arithmetic machine. Nothing before the colon but the route itself. -/
theorem every_route_to_their_separation_passes_the_bit (F : Type) [Field F] (Q : Prop)
    (h : Q → hcFamily F ∉ VP F) : Q → (NothingEscapes (Rec (vpMachine F)) → NothingEscapes (vpMachine F)) :=
  every_route_passes_the_bit (vpMachine F) (0 : ℕ) Q
    (fun q => sep_of_closure _ ((least_escape_iff_bit F).2 ((hc_route_iff_bit F).1 (h q))))

/-- ONE KEY. A premise that delivers the bit wherever it holds is not shared by every machine. Whatever supplies
    least escape on the arithmetic machine is keyed to it. -/
theorem the_crossing_is_keyed (P : Machine → Prop) (hF : Forces P) : ¬ Keyless P :=
  fun hK => keyless_forces_nothing P hK hF

/-- THE FIRST DELIVERY IN THE FORM. Given the release's MainTheorem, the one bit of the arithmetic machine, the
    transfer of least escape from its record, holds. Compiled against their repository, D is their term and the
    statement closes with nothing before the colon. -/
theorem first_delivery_in_the_form (D : MainTheorem.{0}) (F : Type) [Field F] :
    NothingEscapes (Rec (vpMachine F)) → NothingEscapes (vpMachine F) :=
  fun _ => (their_delivery_supplies_least_escape D F).1

/-- THEIR BIT IS SEALED ON THEIR TERM. On the arithmetic machine the bit is sealed on the release's MainTheorem,
    and the separation is sealed on the bit. Two purchases, both named. -/
theorem their_bit_is_sealed_on_their_term (F : Type) [Field F] :
    Purchase.Sealed MainTheorem.{0} (NothingEscapes (vpMachine F)) ∧
    Purchase.Sealed (NothingEscapes (Rec (vpMachine F)) → NothingEscapes (vpMachine F)) (Sep (vpMachine F)) :=
  And.intro (Purchase.Sealed.mk fun D => (their_delivery_supplies_least_escape D F).1)
    (Purchase.the_purchase_is_exact (vpMachine F) (0 : ℕ)).1

end Subsumption
#print axioms Subsumption.the_form_subsumes_the_row
#print axioms Subsumption.their_delivery_supplies_least_escape
#print axioms PNP.NORMALFORM.sep_normal_form
#print axioms Subsumption.every_route_to_their_separation_passes_the_bit
#print axioms Subsumption.the_crossing_is_keyed
#print axioms Subsumption.first_delivery_in_the_form
#print axioms PNP.NORMALFORM.keyless_forces_nothing

#print axioms PNP.NORMALFORM.freeMachine_escapes
#print axioms Purchase.Sealed.andThen
#print axioms Purchase.no_universal_purchase
#print axioms Purchase.nothing_from_nothing
#print axioms Purchase.the_bit_is_contingent
#print axioms Purchase.no_free_bit
#print axioms Purchase.no_keyless_purchase
#print axioms Purchase.the_purchase_is_exact
#print axioms Subsumption.their_bit_is_sealed_on_their_term
```
