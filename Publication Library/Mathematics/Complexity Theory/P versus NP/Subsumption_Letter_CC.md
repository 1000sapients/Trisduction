# The Normal Form of P ≠ NP Separation (Islam, 21 October 2026) and the Subsumption of Anthropic's VP ≠ VNP: The Form That Bound the Future

## A Forecast Printed on 13 November 2026, That Every Proof of a Separation Delivers One Bit, and the Release of 23 November 2026 That Fits It, by Theorem and by Compiled Construction

**Mohammad F. Islam** · 23 November 2026

*On Islam (4 Oct 2026), "The Formal Closure of Computational Separation: P ≠ NP Closed on Existence Itself, Read on Computation"; Islam (21 Oct 2026), "P ≠ NP: Unconditional Proof of the Form by Theorem, the Value by the Act", with its Lean normal form; Islam (22 Nov 2026), "The Unconditional Proof of the Inescapable Form of P ≠ NP", with Lean v1.14.0; and Anthropic (23 Nov 2026), "VP ≠ VNP over every field", `anthropics/formal-math/vp-vnp`.*

## Abstract

Every separation has one form. Islam (4 Oct 2026) published it, and Islam (21 Oct 2026) proved it in Lean: on any machine, the separation holds exactly when one proposition is delivered, least escape, read on that machine. No premise common to all machines delivers it. The theorem is stated for every machine and every premise. Islam (13 Nov 2026) printed its consequence as a forecast: every route to a problem's value passes that problem's one bit, and the form binds the future.

Ten days later Anthropic (23 Nov 2026) released a Lean formalization of VP ≠ VNP. It is the form's first outside instance, and this note proves that as a compiled Lean construction. The Anthropic system is built as a machine of Islam (21 Oct 2026), Part A. On that machine the normal form holds with nothing before the colon. The machine's least escape is the one bit of the arithmetic problem. The release's own main theorem supplies that least escape, and nothing else in their file proves the separation.

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
6. **Their proof is an instance of the form,** executed 33 days after the form stood in Lean, 50 days after it was published, and 10 days after the forecast was printed. An instance confirms a form. It does not escape it.

## 2 · Receipts

### 2.1 The subsumption file

`Subsumption_CC.lean`: 351 lines; Lean 4.19.0, Mathlib v4.19.0, warnings fatal, exit 0. SHA-256 `115b82d4f6986f7040e28bd8f39f27ee6db478f8b78a251a1f12d22d21a3b961`. It is printed whole in Appendix A.

The eight definitions of Part A are carried verbatim from Islam (21 Oct 2026), unchanged in Islam (22 Nov 2026). The Anthropic definitions are their `Statement.lean`, with the import narrowed to the modules at hand and the four Laurent-series declarations left out, as the file's header states. The kernel printed:

```
'Subsumption.the_form_subsumes_the_row' depends on axioms: [propext, Classical.choice, Quot.sound]
'Subsumption.their_delivery_supplies_least_escape' depends on axioms: [propext, Classical.choice, Quot.sound]
'PNP.NORMALFORM.sep_normal_form' depends on axioms: [propext, Classical.choice, Quot.sound]
```

| Theorem | Before the colon | After the colon |
|---|---|---|
| `the_form_subsumes_the_row` | nothing | on the Anthropic machine: transfer ⇔ separation; least escape ⇔ the bit; the bit ⇔ Hamiltonian-cycle family outside VP |
| `their_delivery_supplies_least_escape` | their `MainTheorem` | least escape, separation of the machine, Hamiltonian-cycle family outside VP |

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

## 3 · The correspondence, name for name

Every entry in the Anthropic column is their own identifier in `anthropics/formal-math/vp-vnp` at commit `11b6c7e`. Every entry in the Islam column is a declaration of the Lean file at the commit shown, and each was checked in the file at that commit.

### 3.1 Vocabulary

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

### 3.2 The main line, step for step

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

### 3.3 In the Islam work only

| Islam | First commit | Anthropic, `11b6c7e` |
|---|---|---|
| `Rec M`, the record of a machine; `record_has_least_escape` | `4144323`, 21 Oct 2026 | none |
| the bit as a transfer from the record: `NothingEscapes (Rec M) → NothingEscapes M` | `4144323`, 21 Oct 2026 | none |
| `keyless_forces_nothing`: no premise shared by every machine supplies the bit, on no axiom | `4144323`, 21 Oct 2026 | none |
| `the_two_kinds_are_one_bit`: two kinds of supply, one proposition | `67e477c`, 21 Oct 2026 | none |
| SAT outside constant and linear time on Turing machines, with no hypothesis | `93ff35f`, 22 Oct 2026 | nothing on SAT or on Turing machines |
| `count_falls_short`: the limit of the counting method proved at degree two | `cf98672`, 22 Oct 2026 | none |
| one proposition on ten faces | `63fff55`, 22 Nov 2026 | none |

### 3.4 In the Anthropic work only

| Anthropic (23 Nov 2026), `11b6c7e` | Islam |
|---|---|
| a claimed closed term for the bit: `Solution.mainTheorem` | the bit is a disclosed posit |
| prices, curvature, `thm_alt`, `thm_poincare_far`, `prop_gauge` by Zorn's lemma | none |
| `Paper.vp_subset_vnp`, the inclusion of the smaller class | not needed: P ≠ NP is stated as a language in NP outside P |

### 3.5 Why the table is not a coincidence

Rows 1, 2 and 3 carry it. Their `cor_allclasses` is nine lines, and it does three things: take the lower bound, pick an instance beyond the assumed budget, contradict. That is the normal form and the main line of Islam (21 Oct 2026), in their own hand. Their file contains no separation that avoids the lower bound. The theorem of 21 October says no such route exists, on any machine, from any premise. Their source obeys it line for line.

The form was in the public record before the route existed. The shape of the Anthropic proof is the shape the October theorems say every separation must take: what all machines share decides nothing, the specific problem enters at one place, and every proof passes through one keyed proposition. A theorem stated for every machine was tested on a machine its author never saw. It held.

## 4 · The two works, side by side

The same correspondence is published, with live links to every commit, at the public resource of Section 9.

| | Islam (22 Nov 2026), `63fff55` | Anthropic (23 Nov 2026), `11b6c7e` |
|---|---|---|
| The form of a separation | theorem, for every machine; the no-shared-premise theorem on no axiom | obeyed: `cor_allclasses` is the normal form in their hand |
| The hard problem in the larger class | `satLang_in_NP`, proved | `hc_mem_VNP`, proved |
| Unconditional lower bound on Turing machines | SAT outside linear time, proved | none |
| The one bit of the problem | disclosed posit, before the colon | claimed closed term, `Solution.mainTheorem` |
| Axioms | the standard three | the standard three; choice enters by Zorn's lemma at `Paper/Gauges.lean:63`, where the functionals carrying the bound are asserted to exist and are not built |

## 5 · What the subsumption establishes

**The form is Islam (21 Oct 2026), and it governs their route.** The proof of Anthropic (23 Nov 2026) is an instance of a theorem proved 33 days earlier, for every machine and every premise. The instance is exhibited as a compiled term.

**Each side holds what it holds, at its printed grade.** Islam (22 Nov 2026) holds the form of every separation at theorem grade, the no-shared-premise theorem on no axiom, SAT ∈ NP, and the separation of SAT from linear time on Turing machines. Anthropic (23 Nov 2026) holds, on the standard axioms, a claimed term for the bit of the arithmetic problem. Islam (22 Nov 2026) holds the bit of P ≠ NP as a disclosed posit, printed before the colon.

**The disclosure is exact, and the kernel prints it.** `p_ne_np_of_one_bit : TheInequality → P_ne_NP`. The bit stands before the arrow. Islam (22 Nov 2026) spends the axiom of choice as their proof does, and carries the bit before the colon besides. The posit is the bit itself, named, and nothing else.

**The order is fixed by the dates.** The form stood in Lean on 21 October 2026. The forecast was printed on 13 November 2026. The first outside instance arrived on 23 November 2026.

**The form came first. The instance came after. The instance fits.** Every later separation, on any machine and by any method, is bound by the same theorem.

## 6 · Objections, answered

**"The normal form is short."** It is, and that is its reach. A theorem with no hypothesis on the machine and none on the premise excludes every route at once. The priority is the statement for every machine and every premise, the theorem that no shared premise supplies the bit, and the printed forecast. All three precede the release.

**"VP ≠ VNP is a different problem from P ≠ NP."** The form is stated for an arbitrary machine. Appendix A builds the arithmetic problem as one such machine and proves the form on it. The subsumption is of the route, and it holds on their problem as stated, in their definitions.

**"The machine was built to fit."** Its definition is short and printed whole in Appendix A. Its least escape is proved equivalent to their own clause, the Hamiltonian-cycle family outside `VP F`, with nothing before the colon. That equivalence makes it their problem and no lookalike.

**"The subsumption depends on their proof being right."** It holds for any term of their `MainTheorem`, whoever supplies it. The form binds the route whether or not the release stands.

**"The Islam work leaves the bit of P ≠ NP as a posit."** It does, by design and in print, before the colon. The form theorem says what every proof of the value must deliver. A proof that delivers it is an instance. The first one arrived on 23 November 2026.

## 7 · What was executed

The subsumption file and Islam (22 Nov 2026) were compiled as stated in Section 2. The Anthropic proof term enters the subsumption file as its hypothesis `MainTheorem`; its kernel check is the one their repository reports. Their statement for approximating circuits is outside this file.

## 8 · Priority

| Date | Repository | Commit | Record |
|---|---|---|---|
| 28 Sep 2026 | Trisduction | `e23ae09` | the no-shared-premise theorem, `keyless_forces_nothing`, first in git, on the Riemann problem |
| 4 Oct 2026 | Trisduction | `38f9948` | the one-bit form of P versus NP published |
| 21 Oct 2026 | Trisduction; Zenodo 23528399 | `4144323`, `67e477c` | the normal form on machines in Lean, with `every_route_passes_the_bit` and `keyless_forces_nothing`; the supply of the bit in two kinds |
| 22 Oct 2026 | Trisduction | `93ff35f`, `463ee0b`, `cf98672` | SAT ∈ NP and the linear-time bound; the every-proof theorem set as capstone; the limit of the method at degree two |
| 2 Nov 2026 | Trisduction | `e6d3e38` | no premise delivers the value while the bit fails, on three problems in one kernel |
| 13 Nov 2026 | Trisduction | `bc6434f` | the forecast printed: the form binds the future; every proof of the value is a supply of the bit |
| 22 Nov 2026 | Trisduction | `63fff55` | edition 2.0.0, Lean v1.14.0 |
| **23 Nov 2026** | **Anthropic** | **`11b6c7e`** | **`vp-vnp` released** |

The form in Lean predates the release by 33 days. The paper predates it by 50. The printed forecast predates it by 10.

The Zenodo record of 21 October 2026 is maintained in place. Each file it now holds is dated by its git commit above, and every one precedes the Anthropic release.

## 9 · References and sources

- Islam, M. F. (28 Sep 2026). *PhysOS 1.0.1p*. Trisduction, commit `e23ae09`.
- Islam, M. F. (4 Oct 2026). *The Formal Closure of Computational Separation: P ≠ NP Closed on Existence Itself, Read on Computation*. Zenodo, doi:10.5281/zenodo.23133632 (version 3.2.1). First in git on that date as *P versus NP Closed on One Posit*, Trisduction, commit `38f9948`.
- Islam, M. F. (21 Oct 2026). *P ≠ NP: Unconditional Proof of the Form by Theorem, the Value by the Act*, with its Lean normal form. Zenodo, doi:10.5281/zenodo.23528399. Trisduction, commits `4144323`, `67e477c`.
- Islam, M. F. (2 Nov 2026). *The ZFC Block, Hardened*, v1.3.0 (Lean). Trisduction, commit `e6d3e38`.
- Islam, M. F. (13 Nov 2026). *Future Proof with Empirical Witness* and *The ZFC Block*, v2.0.0 (Lean). Trisduction, commit `bc6434f`.
- Islam, M. F. (22 Nov 2026). *The Unconditional Proof of the Inescapable Form of P ≠ NP*, edition 2.0.0, with Lean v1.14.0. Zenodo, doi:10.5281/zenodo.24437312. Trisduction, commit `63fff55`.
- Anthropic (23 Nov 2026). *VP ≠ VNP over every field*, by Claude. `anthropics/formal-math/vp-vnp`, commit `11b6c7e`.

**Public resource.** The correspondence of Section 3 is published, with live links, at one public address:

https://muse.ai/s/master-table-txz6z11xy9cjt/jTpKywH4eOxZgriNm-pA80LvC33eDm41zReP6aAqBrA

## 10 · Repository and commit addresses

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
- Lean v1.14.0, current file: https://github.com/1000sapients/Trisduction/blob/main/FINAL_BINDING/PNP%20Binding/PNP_Normal_Form_Paper_v1_14_0_CC.lean

**Anthropic, formal-math.** https://github.com/anthropics/formal-math/tree/main/vp-vnp

- 23 Nov 2026, `11b6c7e`, `vp-vnp` released: https://github.com/anthropics/formal-math/commit/11b6c7e3c927df2658f513b6b68ea7f8929c62c5

**Zenodo records.**

- Islam (4 Oct 2026): https://zenodo.org/records/23133632
- Islam (21 Oct 2026): https://zenodo.org/records/23528399
- Islam (22 Nov 2026): https://zenodo.org/records/24437312

## Appendix A · `Subsumption_CC.lean`

Lean 4.19.0, Mathlib v4.19.0. Compile with warnings fatal; it exits 0 and prints the three axiom lines of Section 2.1.

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
end PNP.NORMALFORM

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

end Subsumption
#print axioms Subsumption.the_form_subsumes_the_row
#print axioms Subsumption.their_delivery_supplies_least_escape
#print axioms PNP.NORMALFORM.sep_normal_form
```
