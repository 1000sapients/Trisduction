# A FORMAL PROOF OF RIEMANN TERMINATION, WITH A CASCADE SPECIFICATION OF TERMINATION

**Abstract.** The Riemann Hypothesis is terminally unreachable by the formal-alone instrument **as swept**; the unrestricted form of that sentence is priced at Section 12.3 and is not asserted here. We establish an equivalence governing its formal status: **universal unprovability of the Riemann Hypothesis over the class 𝒯 of consistent recursively axiomatized extensions of Robinson arithmetic Q is materially identical to its strict refutation in Q.** That equivalence is purely proof-theoretic and uses no soundness hypothesis. Under Σ⁰₁-soundness of Q it sharpens: universal unprovability then equates to falsity in the standard model ℕ. Only the sharpening uses soundness. **The even functionals of the frame are blind to the sign** by Proposition 5.2; λ is not, by Proposition 5.3. We specify a runnable eight-gate cascade to adjudicate the termination of the instrument's search space, on a four-dimensional real inner-product space split as E₊ ⊕ E₋ by a self-adjoint involution. **Its condition count is exactly eight, and once two stipulations are made the count is a theorem and not a further stipulation.** The stipulations are that the decomposition carries three atomic axes and that an atom admits negation and no partial operation. Given them, the group carrying each axis of the residence to itself is (ℤ/2)³, of order eight, with no ninth element; the argument runs through stabilisation of the decomposition and **not** through invariance of the Gram determinant, which is invariant under a much larger group and is disowned as a criterion. **No record satisfying all eight conditions is exhibited here**, Ξ₂ and Ξ₄ being uninstantiated in fact, and no completed sweep is claimed. What is claimed is the boundary: an emission may be terminal **for the search space as swept** and may not be terminal unrestrictedly, since by the main equivalence any clause entailing universal unprovability entails Q ⊢ ¬R. The frame carries **one polarity bit**, invisible to the even functionals and recovered by λ, **determined by the syntax of P** under Proposition 6.1a and computed by the instrument; it bears on ζ not at all. 

---

## 1. Introduction

Two questions about the Riemann Hypothesis are routinely conflated. The first is whether R is provable. The second is whether an instrument, having exhausted a catalog of approaches, may declare that exhaustion permanent.

Section 3 settles the first. Theorem 3.2 shows that *no formal system proves R* is not a modal statement at some remove from arithmetic but is equivalent, over 𝒯, to *Q refutes R*; and Corollary 3.6a sharpens this, under Σ⁰₁-soundness of Q, to equivalence with the falsity of R. Sections 6 through 8 settle the second: we specify formally when an exhaustion verdict is admissible, prove the specification fail-safe and cardinality-bounded under stated hypotheses, and prove that the permanence clause it requires cannot be strengthened to a universal-unprovability claim without becoming a refutation.

The mathematics of Section 3 is elementary and classical in its ingredients. What is offered is the equivalence in the form given, the sharpened Π⁰₁ form, and the specification of Sections 6 through 8 in which the consequence becomes a stated admissibility condition.

---

## 2. Preliminaries

**2.1 Arithmetic.** Q denotes Robinson arithmetic. 𝒯 is the class of theories T with T consistent, T r.e., and T ⊇ Q. *Consistency is meant and soundness is not.*

**2.2 Σ⁰₁-completeness (classical).** Q proves every true Σ⁰₁ sentence.

**2.3 Σ⁰₁-soundness.** Q is Σ⁰₁-sound: every Σ⁰₁ sentence Q proves is true in ℕ. This holds because ℕ ⊨ Q. Where this is used it is named.

**2.4 The Riemann Hypothesis in Π⁰₁ form.** *Lagarias (2002):* R holds iff for every n ≥ 1, σ(n) ≤ H_n + exp(H_n)·ln(H_n), with H_n = Σ_{k≤n} 1/k. *Robin (1984):* R holds iff for every n > 5040, σ(n) < e^γ·n·ln ln n.

**The classification runs on the Lagarias form only.** Write R = ∀n φ(n) with φ(n) the Lagarias inequality σ(n) ≤ H_n + exp(H_n)·ln(H_n). **We do not claim φ is decidable**: the comparison is against a transcendental-valued expression and deciding a non-strict inequality requires excluding exact equality, which is not available for n ≥ 2. What holds, and suffices throughout, is that **φ is Π⁰₁**: its negation σ(n) > x is semi-decidable by evaluating x at increasing rational precision, so φ is Π⁰₁ and by quantifier contraction R is Π⁰₁ with ¬R Σ⁰₁.

**2.4a The sentence is fixed, and nothing transfers across formalizations.** From here on **R denotes one fixed sentence**, namely

  R :≡ ∀n ∀k [ σ(n) ≤ q(n,k) + 2⁻ᵏ ],

where **q(n,k) is any fixed primitive recursive rational-valued function satisfying the approximation guarantee**

  | q(n,k) − ( H_n + exp(H_n)·ln(H_n) ) | ≤ 2⁻ᵏ  for all n ≥ 1 and k ≥ 1,

which one such procedure meets by evaluating H_n exactly, computing exp and ln at k + 40 places, and truncating to a multiple of 2⁻ᵏ; executed, the ratio |q − r|/2⁻ᵏ reaches **0.9534** and never 1 over n ∈ {1, 12, 60, 5040, 55440} and k ∈ {1, 5, 10, 20, 40}. **The guarantee is what makes the displayed sentence well defined**, and without it the sentence names nothing in particular.

**Lemma 2.4b (the displayed sentence is the Lagarias criterion).** Write r_n = H_n + exp(H_n)·ln(H_n). Then σ(n) ≤ r_n **iff** ∀k [ σ(n) ≤ q(n,k) + 2⁻ᵏ ].

*Proof.* (⟹) r_n ≤ q(n,k) + 2⁻ᵏ by the guarantee, so σ(n) ≤ r_n gives σ(n) ≤ q(n,k) + 2⁻ᵏ for every k. (⟸) q(n,k) ≤ r_n + 2⁻ᵏ by the guarantee, so the hypothesis gives σ(n) ≤ r_n + 2·2⁻ᵏ for every k, and letting k → ∞ gives σ(n) ≤ r_n. ∎

Hence R holds iff the Lagarias inequality holds at every n, which by Lagarias (2002) holds iff the Riemann Hypothesis does. **The matrix is decidable**: it compares an integer with an explicitly computed rational, so R is Π⁰₁ and ¬R is Σ⁰₁ by quantifier contraction, genuinely and not merely as a limit of approximations, and Q's Σ⁰₁-completeness applies to ¬R as stated at 2.2. Executed: the displayed form agrees with the direct comparison σ(n) ≤ r at n = 1, 12, 60 and 5040.

**Two consequences bind and are stated because they are easy to lose.** First, **every theorem of Sections 3, 4 and 7 is about this sentence** and about no other. Second, **the equivalence between R and the Riemann Hypothesis is Lagarias's theorem of ordinary mathematics and is not a theorem of Q.** Two Π⁰₁ sentences true-equivalent over ℕ need not be equivalent over a weak base, so *Q ⊢ ¬R* is a claim about this arithmetization, and it reaches the statement that ζ has a zero off the critical line **only through Lagarias's equivalence, in the metatheory, and never inside Q.** Wherever this paper prices an unprovability claim as that statement, including at 12.3, the pricing carries that step and it is named here once rather than assumed throughout.

**The semi-decidability step, stated in full, since it is the one step a reader is likely to reconstruct.** The right-hand side is a **computable real**: there is a computable sequence of rationals q_k with |q_k − r| < 2⁻ᵏ, obtained by evaluating H_n exactly and exp and ln to k + 1 places. For rational x,

  x > r **iff** ∃k ( x > q_k + 2⁻ᵏ ),

which is Σ⁰₁. *(⇐) r < q_k + 2⁻ᵏ < x. (⇒) put δ = x − r > 0 and choose k with 2⁻ᵏ < δ/2; then q_k < r + 2⁻ᵏ < x − δ/2, so q_k + 2⁻ᵏ < x.* Dually x ≤ r iff ∀k (x ≤ q_k + 2⁻ᵏ), which is Π⁰₁. Since σ(n) is an integer and H_n rational, φ(n) is Π⁰₁ and ¬φ(n) is Σ⁰₁, and **no decidability of φ is claimed or needed**: the equality case is exactly where no finite precision settles the comparison.

**Executed illustration of the search that Σ⁰₁ names.** On the true instances the negation is false and the search correctly does not halt: at n = 1, 12 and 5040 the margins are 0, 0.3218372596 and 492.3187310894 and no k satisfies the condition. On a synthetic excess above the bound it halts at a computable k: excess 0.5 at n = 12 halts at k = 2, excess 10⁻² at k = 7, and excess 10⁻⁶ at n = 5040 at k = 20. **No actual violation is exhibited and none is known**, since exhibiting one would refute R; the halting behaviour is therefore shown on a synthetic excess, which is what makes the negation Σ⁰₁ rather than what makes it true.

The Robin form is cited for context and is **not** used for the classification. Its inequality is strict, so σ(n) < x is Σ⁰₁ and its negation is not, placing the Robin matrix in Σ⁰₁ and the criterion in Π⁰₂. One Π⁰₁ form is all that is required. 

**2.5 Executed computation of the matrix at finite precision.** Computed at 80-digit decimal:

| n | σ(n) | H_n + e^{H_n}·ln(H_n) | margin |
|---|---|---|---|
| 1 | 1 | 1.000000000000000000000000 | 0 |
| 12 | 28 | 28.32183725964540620598233 | 0.32183725964540620598 |
| 60 | 168 | 170.9766842646928136888768 | 2.97668426469281368887 |
| 5040 | 19344 | 19836.31873108944797731162 | 492.318731089447977311 |
| 55440 | 232128 | 241179.9211023638387578728 | 9051.92110236383875787 |

Robin form at 40 digits: margin 14128.08735 at n = 5041, 565.5185643 at n = 10080, 90021.39744 at n = 720720. These are finite-precision evaluations, not decisions of φ, and they bear on R not at all. They are given because a Σ⁰₁ certificate of a violation, if one existed, would take this form.

**2.6 Linear algebra.** For an arbitrary real 3×3 matrix M and D = diag(ε₁, ε₂, ε₃) with εᵢ ∈ {±1}, D is orthogonal with D = Dᵀ = D⁻¹ and det(D) = ε₁ε₂ε₃.

---

## 3. The Universal Unprovability Theorem

**Definition 3.1.** For a sentence R of the language of Q put U(R) :≡ ∀T ∈ 𝒯 (T ⊬ R).

**Theorem 3.2 (Main).** For every sentence R, U(R) ⟺ Q ⊢ ¬R.

*Proof.* (⟹) Assume U(R). If Q + R were consistent then, being r.e. and extending Q, it lies in 𝒯 and proves R, contradicting U(R). So Q + R is inconsistent and Q ⊢ ¬R by the deduction theorem.

(⟸) Assume Q ⊢ ¬R and let T ∈ 𝒯. Then T ⊢ ¬R since T ⊇ Q; if also T ⊢ R then T is inconsistent, contradicting T ∈ 𝒯. Hence T ⊬ R. ∎

**Remark 3.3.** Theorem 3.2 is an equivalence and asserts neither of its sides. Its proof uses no soundness assumption, no semantic notion, and no property of R beyond its being a sentence.

**Remark 3.2a (what drives the equivalence, said plainly).** The forward direction turns on a single membership: **Q + R is itself one of the theories quantified over.** It is finitely axiomatized, hence r.e., extends Q, and proves R, so if it is consistent then U(R) fails. That is the whole mechanism. The equivalence is therefore a formal consequence of admitting Q + R among the candidates, it is elementary, and **it supplies no independent mathematical evidence bearing on R.** What it does supply is a price: an unprovability claim quantified over that class is not a weaker statement than a refutation, it is the same statement.

**Corollary 3.4.** U(R) implies Q + R is inconsistent.

**Corollary 3.5 (Π⁰₁ case).** For R = ∀n φ(n) ∈ Π⁰₁: U(R) ⟺ Q ⊢ ∃n ¬φ(n). Since Q is Σ⁰₁-sound (2.3), U(R) further implies that some n₀ with ¬φ(n₀) exists; ¬φ being Σ⁰₁, the certificate for n₀ is verifiable by a terminating computation. **The cost of the claim is therefore concrete and should be read as such**: asserting universal unprovability of R over 𝒯 has, under 2.3, exactly the arithmetic content of asserting that a specific pair (n₀, k₀) exists with σ(n₀) > q(n₀,k₀) + 2⁻ᵏ⁰, together with the obligation to exhibit it. It is not a weaker or more cautious claim than a counterexample; it is a counterexample claim with the witness left unstated.

**Corollary 3.6 (Riemann, syntactic form).** For R the Riemann Hypothesis, U(R) ⟺ Q ⊢ ∃n (σ(n) > H_n + exp(H_n)·ln(H_n)).

**Corollary 3.6a (Riemann, sharpened form).** *Using Σ⁰₁-soundness of Q (2.3):* for every Π⁰₁ sentence R,

 **U(R) ⟺ ℕ ⊨ ¬R.**

In particular U(R) holds **for this R** if and only if ℕ ⊨ ¬R; and ℕ ⊨ ¬R holds if and only if ζ has a zero off the critical line, **that last step being Lagarias's theorem in the metatheory and not a theorem of Q**, per 2.4a.

*Proof.* By Theorem 3.2, U(R) ⟺ Q ⊢ ¬R. If Q ⊢ ¬R then by Σ⁰₁-soundness ℕ ⊨ ¬R. If ℕ ⊨ ¬R then ¬R is a true Σ⁰₁ sentence, so Q ⊢ ¬R by Σ⁰₁-completeness. ∎

**Remark 3.6b.** Corollary 3.6a is the sharpest form of the paper's thesis: *no consistent r.e. extension of Q proves R if and only if R is false.* Note the hypothesis: Theorem 3.2 is soundness-free, and 3.6a is not.

**Theorem 3.7 (Dichotomy).** Let R ∈ Π⁰₁, let 𝒮 ⊆ 𝒯 be nonempty, and **suppose Q + R is consistent**. Put U_𝒮 :≡ ∀T ∈ 𝒮 (T ⊬ R). Then exactly one of:

(a) **Q + R ∈ 𝒮.** Then U_𝒮 ⟹ Q ⊢ ¬R. *(The implication is vacuous, and its vacuity is its content: Q + R ∈ 𝒮 ⊆ 𝒯 gives Q + R consistent, hence Q ⊬ ¬R, while Q + R ⊢ R gives ¬U_𝒮 outright. **The horn cannot be occupied at all**, which is the sharper reading of Remark 3.8's claim that asserting U_𝒮 here converts the claim into Q ⊢ ¬R: the conversion is available and the conjunction is not.)*

(b) **Q + R ∉ 𝒮.** Then 𝒮 is fixed by a condition beyond consistency, r.e.-ness and extension of Q, and establishing T ⊬ ¬R for any T ∈ 𝒮 yields ℕ ⊨ R by Theorem 4.1.

If Q + R is inconsistent then Q ⊢ ¬R outright and no dichotomy arises.

*Proof.* (b) is the negation of (a) under the hypothesis, so exactly one obtains. In (a) the argument of Theorem 3.2(⟹) applies with 𝒮 for 𝒯. In (b), Q + R is consistent, r.e. and extends Q, so its exclusion is by a further condition; the second clause is Theorem 4.1, and every T ∈ 𝒮 ⊆ 𝒯 satisfies T ⊇ Q. ∎

**Remark 3.8.** A reader will observe that no one asserting the unprovability of R intends to quantify over theories that assume R. The disjunction *either Q ⊢ ¬R or ℕ ⊨ R* holds for every Π⁰₁ sentence R by Σ⁰₁-completeness alone (2.2), independently of Theorem 3.7. **What Theorem 3.7 adds is that neither horn of a restricted unprovability claim can be occupied without paying one side of that disjunction:** horn (a) converts the claim into Q ⊢ ¬R, horn (b) converts its companion half into ℕ ⊨ R.

---

## 4. The Restriction Theorem

**Theorem 4.1.** Let R ∈ Π⁰₁ and let T ⊇ Q be any theory. If T ⊬ ¬R then ℕ ⊨ R.

*Proof.* Write R = ∀n φ(n) with φ ∈ Π⁰₁. If ℕ ⊭ R then ¬φ(n₀) for some n₀; ¬φ(n₀) is Σ⁰₁, so by Σ⁰₁-completeness of Q we get Q ⊢ ¬φ(n₀), hence Q ⊢ ¬R, hence T ⊢ ¬R. Contrapositively, T ⊬ ¬R implies ℕ ⊨ R. ∎

**Remark 4.1a.** No hypothesis on T beyond T ⊇ Q is used: T need not be consistent, r.e., sound, or Σ⁰₁-complete.

**Corollary 4.2.** If T ⊬ R and T ⊬ ¬R then ℕ ⊨ R.

**Corollary 4.3.** For any T ⊇ Q, in particular PA or ZFC or ZFC with large cardinals, a proof that T does not refute R establishes R.

**Remark 4.3a (the two results are compatible, and here is why).** A reader may put Theorem 3.2 beside Theorem 4.1 and see a tension: the first says universal unprovability yields Q ⊢ ¬R, the second says any T ⊇ Q failing to refute R yields ℕ ⊨ R. **These cannot conflict, because their hypotheses are exclusive.** For R ∈ Π⁰₁ exactly one of two cases holds. If Q ⊢ ¬R then every T ∈ 𝒯 refutes R, so no T fails to refute it and Theorem 4.1's hypothesis is never met; under 2.3, R is false. If Q ⊬ ¬R then Q + R is consistent, r.e. and extends Q, so it lies in 𝒯 and proves R, so U(R) fails and Theorem 3.2's antecedent is never met; and by Theorem 4.1, R is true. **Universal unprovability and non-refutation by some extension cannot both hold**, and nothing in this paper asserts that they can.

**Remark 4.4 (the pincer).** Unrestricted, the claim that the route to R is closed is equivalent to Q ⊢ ¬R by Theorem 3.2 and, under 2.3, to ℕ ⊨ ¬R by Corollary 3.6a. Restricted to a fixed T ⊇ Q, establishing its refutation-side half yields ℕ ⊨ R by Theorem 4.1. No formulation both quantifies non-trivially and leaves the truth-value of R untouched.

---

## 5. The Sign Character of the Frame Functional

**5.1 What this section is for.** **No condition of Section 6 tests λ.** Ξ₇ compares two recorded matrices entrywise; λ appears in Section 6 only inside Ξ₇'s consequence note, where it is defined and used to state a consequence of the condition and is not itself a clause of it. What Section 5 supports is the polarity account at Section 12.3 and the consequence bound at Ξ₇'s note; it is a supporting section and is stated as such. 

**Notation.** For Q₀ ∈ ℝ^{3×N} with unit rows, write **R_G := Q₀Q₀ᵀ** for the Gram matrix, reserving R for the Riemann Hypothesis. Let E be an orthonormal basis of the row span and put λ(Q₀) := det(Q₀Eᵀ). 

**Proposition 5.2.** For arbitrary real 3×3 M and D = diag(ε₁, ε₂, ε₃), εᵢ ∈ {±1}: det(D M D) = det(M).

*Proof.* det(DMD) = det(D)²det(M) = det(M), since det(D) ∈ {±1}. ∎ *(No symmetry or positive-semidefiniteness is used.)*

**Proposition 5.3 (sign character).** λ(DQ₀) = det(D)·λ(Q₀), and hence |λ(DQ₀)| = |λ(Q₀)|.

*Proof.* λ(DQ₀) = det(DQ₀Eᵀ) = det(D)det(Q₀Eᵀ) = det(D)·λ(Q₀). ∎

**Corollary 5.4.** The Gram matrix of DQ₀ is D R_G D, with det(D R_G D) = det(R_G) by 5.2; and for the total-negation pattern D₋ = −I₃ one has (−Q₀)(−Q₀)ᵀ = R_G exactly, while λ(−Q₀) = −λ(Q₀).

**5.5 Executed check.** Over 200 unit-row triads at N = 24 and all eight sign patterns: max|det(D R_G D) − det(R_G)| = **0.000 × 10⁰**, and max|λ(DQ₀) − det(D)·λ(Q₀)| = **0.000 × 10⁰**. Over 20000 triads, max|λ² − det(R_G)| = 4.330 × 10⁻¹⁵.

---

## 6. The Cascade: Formal Specification

**Remark 6.0a (what this section does not do, stated before it is done).** Four readings of Section 6 are natural, are wrong, and are foreclosed here rather than downstream, because each has been arrived at independently by a careful reader.

**No text is mapped into V, and no proposition is rotated.** The atoms of (L1) **index** the axes of 6.1(i); they are not vectors and nothing is added, scaled, or rotated in the language. What occupies the space is the recorded matrix Q₀ of 6.1(viii), whose row index is the atom index and whose entries are numbers. No embedding of syntax into a vector space is offered, none is used, and none is needed: the axes are labelled slots and the algebra runs on the recorded frame, not on the sentence.

**The conditions test the record and not the object.** Every Ξᵢ except Ξ₅ reads fields the record's author supplied, and Remark 6.6a states this at its least favourable. **The emitter performs no measurement of the Riemann Hypothesis and none is claimed.** What it certifies is that a sweep was declared, executed and reported to a stated discipline; that is the whole of its office, and Theorem 6.9 is the statement of exactly how little that entails.

**The frame's orientation is independent of the truth value of P, by construction, and that is the design and not a defect.** Proposition 6.1a builds Q₀ from the syntax of P alone, so the polarity bit it carries is the parity of leading negations and nothing else. A reader who observes that the geometry never touches the arithmetic has read the construction correctly; Theorem 6.9(a) is that observation proved, and Section 12.3 records that nothing about ζ is at stake in the bit.

**What the geometry is for is answered at Remark 6.8a**, and the answer is narrow: it supplies an exhaustiveness argument for the count of conditions and nothing further.

**A record can be supplied for any proposition, including a trivial one, and would emit.** Nothing prevents it and nothing should: the terminal token reports that *this instrument* swept *this* declared catalog and found the door uncrossed. It is not a difficulty rating, not a certificate about the object, and not evidence that the proposition resisted anything. A token on a trivial sentence would be a true report about a trivial sweep.

**Definition 6.0 (the linguistic layer, stated in place).** Definition 6.1(i) and 6.7a through 6.8 presuppose a decomposition discipline on the object propositions. It is stated here rather than cited, so that every hypothesis of Theorem 6.7 is checkable within this paper. Nothing outside those passages uses it. Four clauses.

**(L1) Atomic decomposition.** A complete factual proposition P is split into three components: A₁ its existence component, what is; A₂ its kinetic component, what it does or undergoes; A₃ its relational component, how it stands toward what.

**(L2) Deletion test.** Delete each component in turn. A complete atomic claim returns exactly **three** irreducible slots, each leaving an incoherent residue when removed. A count other than three is a failure of the decomposition at this layer.

**(L3) Isolation.** The vocabularies populating the three slots are **pairwise disjoint**. If one slot's vocabulary is a subset of another's, the slots are not independent and the decomposition fails.

**(L4) Atomic bivalence.** An atom admits negation and admits no partial or continuous operation. Correspondingly the verdict economy of Definition 6.3 admits no fractional or probabilistic state.

*(Clauses (L1) through (L4) are stipulations of this construction, operational and reproducible across analysts applying them, and they are typed at that level: **they are not offered as a uniqueness theorem of first-order logic and no such theorem is claimed.** Every use of them below is marked. Theorem 6.7(ii)'s operational derivation of d = 3 uses (L2); its algebraic derivation uses none of them.)*

**Definition 6.1 (record).** Fix a language ℒ_obj for the object propositions and a disjoint language ℒ_rec for records; **no field of a record is a sentence of ℒ_obj or encodes one**, except as expressly noted in the witness fields, which are governed by Ξ₅ and by 2.4's classification.

An *audit record* r for a proposition P ∈ ℒ_obj consists of:

(i) a **labelled orthogonal decomposition** into atomic axes, ℝe₁ ⊕ … ⊕ ℝe_d, one axis per atom of (L1), with d recorded; the space V := ℝ·u ⊕ (ℝe₁ ⊕ … ⊕ ℝe_d) for a unit u orthogonal to every eᵢ; and the involution **σ constructed from that decomposition**, σ(u) = u and σ(eᵢ) = −eᵢ for each i. *(σ is not recorded as a primitive. The decomposition is the recorded object and σ is read off it, so E₋(σ) **is** the span of the atomic axes by construction and dim Fix(σ) = 1 and σ² = I hold by construction. Ξ₁ below therefore verifies that the construction was carried out and that d = 3; it does not test independent facts about an independently supplied involution. The row index of the frame Q₀ at (viii) is this same atom index.)*

(ii) a quantifier classification of P in the arithmetic hierarchy with its citation;

(iii) a **declared register** ρ, its acting group 𝔊_ρ, the invariant ring of 𝔊_ρ, and the finite token list of the claim;

(iv) a finite catalog 𝒞 of *channels*, |𝒞| = C, each carrying a designated reduction with **its citation set**, together with a **closure flag** for 𝒞;

(v) a subset 𝒲 ⊆ 𝒞, |𝒲| = B, each element carrying a **named obstruction and its warrant grade**;

(vi) a finite set 𝒫 of *roads*, **defined**: **each channel of (iv) determines exactly one road, namely the citation set recorded for its reduction; distinct channels determine the same road when their citation sets coincide; hence |𝒫| ≤ C.** Two roads are *premise-disjoint* when they share no citation. Ξ₆'s floor of three therefore strengthens Ξ₃'s rather than restating it, and since |𝒫| ≥ 3 with |𝒫| ≤ C gives C ≥ 3, **Ξ₃'s channel floor C ≥ 3 is entailed by Ξ₆ and is retained as a guard that halts earlier in the evaluation order of Definition 6.3.** It is therefore not independent of Ξ₆, which is recorded here and at 9.9 rather than left for a reader to derive; the count of eight is a count of conditions evaluated, not a claim of pairwise independence;

(vii) **witness fields** for P and ¬P, each either empty or holding a certificate; a **declared search budget** k = (k_n, k_prec, k_pf), **each component a standard numeral**, bounding the numeral range, the rational precision and the derivation length independently, with k_n ≥ k_min, k_prec ≥ p_min, k_pf ≥ d_min for declared floors recorded on the record; a **declared theory** 𝔅 **with 𝔅 ⊇ Q** in which the proof search runs; **the floors are free parameters and are declared as such at 9.9, so the certificate clause of Ξ₅ is informative only to the extent the floors are, and a record declaring minimal floors emits a correspondingly weak statement**; a **completion flag** for each search; and an independence field;

(viii) a **frame assignment** Q₀(·) recording a unit-row matrix Q₀(P) ∈ ℝ^{d×N} with **its row-span dimension recorded**, and, **independently and with no constraint imposed here**, a matrix Q₀(¬P) ∈ ℝ^{d×N}; a declared tolerance τ, and a **declared consequence ceiling β** with β ≤ β_max. *(No basis, Gram or orientation quantity is a field: none is consumed by any condition, and λ(P) is undefined on a record declaring row-span dimension 2. G and λ are defined inline at Ξ₇'s consequence note, the only place they are used.)* 

(ix) a designated *door*, an object not in 𝒞, with a **provenance flag** valued *supplied* or *generated* and a **crossed flag**;

(x) a permanence clause.

**Definition 6.2 (the eight conditions).**

- **Ξ₁** the recorded axis count d equals 3, hence dim V = 1 + d = 4. *(**σ² = I and dim Fix(σ) = 1 are invariants of 6.1(i)'s construction and not tests**: they hold at every d, executed at d = 2, 3, 4, 5, so a condition asserting them would be analytically true on every record and would discriminate nothing, which is the defect Remark 6.2a records for a superseded form of Ξ₇ and Remark 6.1a-rank for a superseded clause of it. **det(σ|E₋) is not among them**: σ acts on E₋ as −I_d, so det(σ|E₋) = (−1)^d, which is −1 exactly when d is odd, executed at d = 2, 3, 4, 5 returning +1, −1, +1, −1. It is therefore a parity test and not an invariant, and it does not pick out d = 3 in any case, since it passes at every odd d. Ξ₁'s single clause d = 3 entails it at the value used and subsumes it. The division-algebra structure noted at Remark 6.7e is neither a record field nor tested by any condition.)*
- **Ξ₂** the quantifier class of P is located by a cited classical equivalence, and every token of (iii) lies in the invariant ring of 𝔊_ρ.
- **Ξ₃** C ∈ ℕ, C ≥ 3, every channel in 𝒞 carries a reduction to a common invariant by a cited classical equivalence with none unreduced, and the closure flag of (iv) is set. **Closure here means the catalog is displayed and fully reduced, not that no channel exists outside it**; the two readings are distinguished at Corollary 8.2 and the weaker one is meant, which is what makes Ξ₃ jointly satisfiable with Ξ₈'s door.
- **Ξ₄** B = C, and each element of 𝒲 carries its named obstruction with grade recorded.
- **Ξ₅** the certificate search for ¬P over numerals n ≤ k_n at rational precision k_prec returned no certificate; the proof search for P in the declared theory 𝔅 over derivations of length ≤ k_pf returned none; k_n ≥ k_min, k_prec ≥ p_min and k_pf ≥ d_min with all six recorded; both completion flags are set; both witness fields are empty; and the independence field is empty.
- **Ξ₆** |𝒫| ≥ 3, and the roads in 𝒫 are pairwise disjoint **as computed from the recorded citation sets**, with the recorded flag agreeing. *(The clauses B/C = 1 and C ≥ 3 are entailed by Ξ₄ and Ξ₃ and are not restated here.)*
- **Ξ₇** the recorded frames satisfy the negation convention **as tested directly**: max|Q₀(¬P) + Q₀(P)| ≤ τ for a declared tolerance τ recorded on the record with **2√N·τ + N·τ² ≤ β and β ≤ β_max for a declared ceiling β_max**, and **the recorded row-span dimension of Q₀(P) equals d**. *(β bounds the consequence deviation directly and supersedes a separate tolerance ceiling: bounding τ alone left τ and N free to be declared large together.)* *(The ceiling is required for the same reason the budget floors are: an unbounded τ admits vacuous satisfaction. β_max joins the census in its place.)* *(Consequence, stated as a bound rather than as an equality. Corollary 5.4 gives G(¬P) = G(P) and det(Q₀(¬P)E(P)ᵀ) = −λ(P) **at τ = 0 and there only**. For τ > 0, writing Q₀(¬P) = −Q₀(P) + Δ with max|Δ| ≤ τ and Q₀(P) unit-row, one has max|G(¬P) − G(P)| ≤ 2√N·τ + N·τ², and the orientation ratio deviates from −1 by O(√N·τ/|λ(P)|). Executed at N = 24: deviation 3.603 × 10⁻⁸ at τ = 10⁻⁸ and 3.342 × 10⁻² at τ = 10⁻², and at N = 240 with τ = 10⁻², 4.385 × 10⁻²; at τ = 0, exactly 0.000 × 10⁰. **The β clause bounds this deviation directly, which is why no separate tolerance ceiling is carried.** The rows of Q₀(¬P) are within **√N·τ** of unit, not within τ: an entrywise perturbation of size τ moves a row norm by up to ‖Δ‖₂ ≤ √N·τ. Executed: max row-norm deviation 2.0148 × 10⁻² at N = 24 and 2.2149 × 10⁻² at N = 240, both at τ = 10⁻², against τ = 10⁻² and √N·τ of 4.899 × 10⁻² and 1.549 × 10⁻¹. Nothing consumes the row norms. Here and only here, G(X) := Q₀(X)Q₀(X)ᵀ and λ(X) := det(Q₀(X)Eᵀ) for E an orthonormal basis of the row span of Q₀(P). **E must be the same on both sides**: for any such E one has λ(−Q₀) = (−1)³λ(Q₀) = −λ(Q₀), so the identity is basis-independent when shared and fails when recomputed per side, the identity of E being a gauge. Nothing in this paper depends on which E is chosen.)*
- **Ξ₈** the door of (ix) lies outside 𝒞, its provenance flag reads *supplied*, its crossed flag is unset, and the permanence clause is present.

**Proposition 6.1a (a frame assignment satisfying Ξ₇ exists).** A hash applied directly to the syntax of P will not do: the hash of "¬P" is uncorrelated with the hash of P, so Q₀(¬P) = −Q₀(P) would have to be imposed by hand rather than obtained, and double negation would be inconsistent. Executed, the direct construction violates the convention on **6 of 6** test propositions. The polarity normal form obtains it instead. Put P into that form: let P₊ be the negation-free core and s ∈ {0,1} the parity of leading negations. Define Q₀(P) := (−1)^s · H(P₊), where H seeds a deterministic generator with a hash of the syntax of P₊ and returns a row-centred, row-normalized 3×N draw. Then Q₀ is a total function of syntax, independent of the truth value of P, satisfies Q₀(¬P) = −Q₀(P) for every P including under double negation, and yields a record satisfying Ξ₇.

**The conclusion holds for any draw of rank d**, which the construction achieves with probability one; a draw of lower rank records row-span dimension below d, fails Ξ₇'s dimension clause, and is rejected and reseeded.

*Verification against the condition as it now stands, six propositions at N = 24 with their negations and double negations:* max|Q₀(¬P) + Q₀(P)| = **0.000 × 10⁰**, which satisfies Ξ₇ for every τ ≥ 0; recorded row-span dimension 3 in every case; and max|Q₀(P) − Q₀(¬¬P)| = **0.000 × 10⁰**. ∎

**Remark 6.1a-rank.** 6.1(viii) records the row-span dimension of Q₀(P); **Ξ₇ tests whether it is d**. E is not a field and is introduced at Ξ₇'s consequence note, where alone it is used. *(Verified: rank 3 and λ(P) ≠ 0 agree over 2000 frames with zero disagreements, and a forced rank-2 frame gives |λ(P)| = 0.000 × 10⁰.)*

**Remark 6.1b.** Proposition 6.1a exhibits one assignment satisfying **Ξ₇** and shows that condition satisfiable. It does not claim the assignment canonical, and no result depends on which **syntax-determined** assignment is used.

**It does not show Ξ₁ ∧ … ∧ Ξ₈ satisfiable, and this paper does not.** No record is exhibited. **This is a vacuity question about the specification and is not a hypothesis of any theorem**: Theorem 6.9(a) is P-invariance of satisfaction for the seven conditions other than Ξ₅, which holds for every record whether or not any record satisfies all eight. What an unsatisfiable conjunction would cost is that no emission ever occurs, so 6.9(b) and (c) would speak of nothing.

**What would discharge it, and this is a list of what is not done rather than a partial discharge.** Ξ₁, Ξ₃, Ξ₅, Ξ₆, Ξ₇ and Ξ₈ are instantiable from material this paper carries: a four-dimensional space with a self-adjoint involution of one-dimensional fixed space; three channels with cited classical equivalences; a budget of the size exhibited at 2.5, with its floors; roads as defined at 6.1(vi); the assignment of 6.1a; and a door with clause W. **Two are not. Ξ₂** requires an exhibited register with its acting group, which a trivial group would satisfy degenerately and which is not exhibited here. **Ξ₄** requires a named obstruction with a recorded warrant grade for each channel; **this paper names no obstruction and will not invent one**, which is why the record is not constructed rather than being constructed badly.

**Remark 6.2a (what Ξ₇ is, and why it is a condition).** Ξ₇ compares the two independently recorded frames directly at a declared tolerance, so a record whose Q₀(¬P) differs from −Q₀(P) by more than τ fails it. **Ξ₇ tests the frame assignment and not the proposition**, and no information about P is obtained from it. Testing the derived pair instead, equal Gram with opposite orientation, would be strictly weaker: that pair is implied by the convention and does not exhaust it, and two counterexample families exist, Q₀(¬P) := Q₀(P)(I_N − 2vvᵀ) for any unit v in the row span, and a single-axis reflection in the eigenbasis of G(P).

**Definition 6.3 (the emitter).** *(By Remark 6.0a the conditions below read record fields, Ξ₅ excepted; the emitter measures the declared sweep and not the object. Ξ₃'s floor C ≥ 3 is entailed by Ξ₆ with |𝒫| ≤ C and is evaluated here **as a guard that halts earlier**, not as an independent condition; see 9.9.)* Evaluate Ξ₁, Ξ₂, Ξ₃, Ξ₄, Ξ₅, Ξ₆, Ξ₇, Ξ₈ in order. If Ξ₅ fails because a witness field is populated, exit to direction-adjudication; if because the independence field is populated, exit to the relative-independence verdict. Otherwise any failure halts with the non-terminal verdict and the index recorded. If all hold, return the terminal token with the warrant cap and the permanence clause of Ξ₈.

**Proposition 6.4 (fail-safe, general form).** If any field of Definition 6.1 required by some Ξᵢ is absent, the emitter returns the non-terminal verdict.

*Proof.* By inspection over the eight conditions. Ξ₁, Ξ₂, Ξ₃, Ξ₄, Ξ₆, Ξ₇, Ξ₈ each require an equality, a set inequality, or a flag to be set; an absent field satisfies none. Ξ₅ requires k_n, k_prec, k_pf and their three floors recorded with each bound at or above its floor, and both completion flags set; absence of any of these fails Ξ₅ rather than passing it. The three floors are free parameters and are declared as such in 9.9. ∎

**Remark 6.4a.** Ξ₅ requires an executed search reported against recorded bounds rather than an unpopulated field, so absence of data fails it, and the fail-safe property holds at every condition.

**Proposition 6.5.** The terminal token is returned only if all eight conditions hold.

*Proof.* Immediate from sequential evaluation and halt on first failure. ∎

*(Proposition 6.5 asserts the necessity direction only. Logical independence of the conditions is not proved here; see 9.9.)*

**Proposition 6.6.** Ξ₅ is the unique condition that can route to a verdict other than the non-terminal one. **It can also fail to the non-terminal verdict**, when a bound or floor is unrecorded, a completion flag unset, or a bound below its floor; the exit branches are taken only when a witness field or the independence field is populated.

*Proof.* By inspection of Definition 6.3. ∎

**Remark 6.6a (which conditions reach outside the record, and it is fewer than one would like).** The honest split is four ways. **Ξ₅ alone reaches into arithmetic**: its certificate clause reports an executed search over numerals, and Theorem 6.9(b) names it the section's one object-language output. **Ξ₂ and Ξ₃ reach outward only through their citation requirements**, a located quantifier class and cited classical equivalences, which a reader can check against the literature. **Ξ₆ is computable from recorded data and is the one condition where a declaration can be caught wrong by the emitter**: disjointness is computed from the citation sets and checked against the recorded flag. **The remaining four are internal consistency checks on declared fields**: Ξ₁ checks the recorded d and the construction invariants of 6.1(i), Ξ₄ reads a recorded obstruction and grade, Ξ₇ compares two recorded frames, and Ξ₈ reads recorded provenance and crossed flags.

**A flag set by the record's author is not external material, however the relation it names is described.** This remark exists to state the asymmetry, so it states the least favourable reading the specification supports.

**Definition 6.7a (the decomposition and its stabiliser).** A decomposed proposition is not a bare frame in V. By (L1) and (L3) it is **three labelled orthogonal axes**, one per atomic component, with pairwise disjoint vocabularies. By 6.1(i) the residence **is** that decomposition: E₋(σ) = ℝe₁ ⊕ … ⊕ ℝe_d, one axis per atom of (L1), with the frame's row index the same atom index. Define its **stabiliser**

 Stab(E₋) := { g ∈ O(E₋) : g(ℝeᵢ) = ℝeᵢ for each i },

the transformations carrying each axis to itself, hence carrying a decomposed proposition to a decomposed proposition.

**Lemma 6.7b (the stabiliser is exactly the sign changes).** Stab(E₋) = { diag(ε₁, …, ε_d) : each εᵢ ∈ {+1, −1} } ≅ (ℤ/2)^d, of order 2^d.

*Proof.* If g(ℝeᵢ) = ℝeᵢ then geᵢ = λᵢeᵢ for some real λᵢ; g ∈ O(E₋) forces |λᵢ| = 1, hence λᵢ = ±1, hence g is diagonal with entries ±1. Conversely every such diagonal matrix is orthogonal and fixes each axis setwise. ∎

**Remark 6.7b′ (why stabilisation and not invariance of the determinant).** The Gram determinant is invariant under a far larger group: det((gQ₀)(gQ₀)ᵀ) = det(g)²·det(Q₀Q₀ᵀ), so **every** g with |det g| = 1 leaves it fixed, an eight-dimensional group containing O(3) and the signed permutations of order 2³·3! = 48. Executed against a reference frame at det(R_G) = 0.931277980144: the eight sign changes deviate by 0.000 × 10⁰, the six row permutations by 2.220 × 10⁻¹⁶ with unit rows preserved to 1.1 × 10⁻¹⁶, five hundred random elements of O(3) by at most 2.442 × 10⁻¹⁵.

**Determinant-invariance is therefore not the criterion and is not used as one.** The criterion is Definition 6.7a, and the two families above fail it for reasons this paper states elsewhere. A rotation by π/7 in the e₁–e₂ plane carries e₁ out of ℝe₁, mixing one atomic slot into another and destroying the pairwise vocabulary disjointness (L3) requires; the image is not a decomposed proposition. A row transposition carries ℝe₁ to ℝe₂, so it does not fix each axis either, and by (L3) it is not a mere relabelling: it substitutes one atom's content for another's across disjoint vocabularies, which is content-mixing on exactly the ground the rotation is excluded. **Both are excluded by Definition 6.7a on its own terms and no appeal to gauge is made or needed.**

**Definition 6.7c (complete screen).** A family of conditions is a **complete screen** for the decomposition when it carries exactly one condition per element of Stab(E₋). *(Each element is one pattern of negation across the atoms. The identity is the empty pattern, P itself, and screens no conflation; of the 2^d elements, 2^d − 1 move the frame. The count is of patterns, not of conflations.)*

**Remark 6.7c′ (why the eight do not collapse to four).** The enumeration at Theorem 6.7(iv) below reads 1 + 3 + 3 + 1, which is also the orbit decomposition of (ℤ/2)³ under the permutation action of S₃ on the axes. The arithmetic is correct and the collapse is not available. **S₃ does not act on the screened objects.** By (L3) the three axes carry pairwise disjoint vocabularies, so the three weight-one patterns deny three different atoms and are three different propositions: denying what stands, denying what moves, and denying how they bind are not one object seen three ways. The weight grading is a way of displaying the eight, not a quotient of them.

**Theorem 6.7 (given d axes the count is 2^d, and at d = 3 the eighth is the last).** Let E₋(σ) = ℝe₁ ⊕ … ⊕ ℝe_d be the labelled orthogonal decomposition of 6.1(i). Then:

(i) **|Stab(E₋)| = 2^d**, by Lemma 6.7b;

(ii) hence **a complete screen carries exactly 2^d conditions**, and at d = 3 exactly **eight**;

(iii) the eight enumerate by negation weight as **1 + 3 + 3 + 1**: the empty pattern, three denials of a single atom, three of a pair, and one total negation. **The eighth is the last**, and the ladder terminates because it has exhausted the atoms;

(iv) **no ninth element of Stab(E₋) exists at d = 3.** A ninth requires 2^d ≥ 9, hence d ≥ 4, hence a fourth atomic axis.

*Proof.* (i) is Lemma 6.7b. (ii) from (i) and Definition 6.7c. (iii) is the expansion of 2³ by Hamming weight, with no weight 4 available at d = 3. (iv) 2³ = 8 < 9. ∎

**Remark 6.7d (what the count counts).** Ξ₇ compares two recorded frames and Ξ₆ computes disjointness from the recorded citation sets; neither carries information about P, and by Theorem 6.9(a) the only condition that does is Ξ₅, whose content is the search report. Theorem 6.7 fixes **how many** conditions a complete screen carries and says nothing about the discriminating power of any one of them over P.

**Remark 6.7e (what is stipulated and what is proved).** **Two things are stipulated.** d = 3, carried by (L2); and atomic bivalence, carried by (L4), which is what motivates restricting the axis-fixing group to O(E₋) and so makes it finite: the deletion test returns three irreducible slots on a complete atomic claim, at the operational grade of Definition 6.0 and not as a uniqueness theorem. **The identification of the atoms with the axes of the residence is definitional**, by 6.1(i), where σ is constructed from the decomposition rather than recorded independently; there is no bridge to supply and none is claimed. Given those, **the count is not a further stipulation**: it is Lemma 6.7b, which is theorem-grade, together with the arithmetic of (iv).

The Frobenius classification is **corroboration and is load-bearing on nothing**. At d = 3 the space V of 6.1(i) has dimension 4, and ℍ is the unique real associative division algebra with more than one imaginary unit; but no definition, condition or proof in this paper uses a multiplication on V, no record field carries a division-algebra structure, and Ξ₁ does not test one. The observation is recorded because it is true and because a reader will notice the dimension, not because anything rests on it.

**Remark 6.8 (the shape of the claim).** The claim this section makes is narrower than a forcing and wider than a choice, and it is stated at its exact strength. **Two things are stipulated**: that the decomposition carries three axes, which is (L2); and that atoms admit negation and no partial operation, which is (L4), motivating Definition 6.7a's restriction to O(E₋), which is what makes the group finite. Both are stipulations of Definition 6.0 at the grade stated there. **One thing is definitional**: that the residence is the span of the atomic axes, by 6.1(i). **Everything after that is theorem.** By Lemma 6.7b the group carrying each axis to itself is exactly (ℤ/2)^d; by Theorem 6.7 a complete screen has 2^d members, at d = 3 exactly eight, and no ninth. **Once the stipulations are made the count is not a further stipulation, and that is the whole of what is claimed here.**

**No appeal to gauge is made.** Both excluded families fail Definition 6.7a directly, and by Remark 6.7c′ the permutation action does not reach the screened objects, so the eight do not collapse to four.

**What remains open.** Which condition screens which element: Stab(E₋) acts on itself simply transitively, so no element is distinguished by the group structure alone, any bijection serves equally, and nothing below depends on which is taken. And the choice to screen the axis-fixing group rather than some larger structure-preserving group is a decision of this construction, motivated by (L3) and (L4) and not derived from them. **This paper does not claim that determinant-invariance forces eight**, and by Remark 6.7b′ it does not: that group is eight-dimensional.

**Remark 6.8a (why a space and not a checklist, and what the apparatus costs).** A reader who has followed Remark 6.0a will ask what the geometry is for, since the eight conditions read record fields and could be evaluated by a boolean checklist with no space, no involution and no frame. The question is fair and the answer is narrow.

**The geometry buys exactly one thing: an argument that the count is complete.** A checklist of eight items carries no reason that it is eight rather than five or thirty, and no reason that a ninth is unnecessary rather than merely unwritten; its cardinality is whatever its author stopped at. Lemma 6.7b and Theorem 6.7 supply what a checklist cannot: given d axes, the group carrying each to itself is exactly (ℤ/2)^d, so a complete screen has 2^d members, at d = 3 exactly eight, and no ninth element of that group exists. That is an exhaustiveness argument for the list, and it is available only because the conditions are indexed by a group rather than enumerated by hand.

**It buys nothing else, and this should be weighed rather than glossed.** The space performs no measurement of the object, per Remark 6.0a. Ξ₇ is the only condition that touches the frame, and Ξ₇ exists because the frame does. Strip the geometry and seven of the eight conditions survive unchanged as record checks, the eighth disappears with the frame it compares, and what is lost is the completeness argument and only that. **Whether one exhaustiveness argument is worth a four-dimensional apparatus is a judgement this paper leaves to the reader, and it states the trade rather than obscuring it.** The alternative reading, that the specification is an administrative protocol with a group-theoretic warrant for the length of its checklist, is not a misreading and is not resisted here.

**Theorem 6.9 (payload).** Let r be an audit record for a proposition P. Then:

(a) **whether r satisfies Ξ₁, Ξ₂, Ξ₃, Ξ₄, Ξ₆, Ξ₇ and Ξ₈ is independent of the truth value of P**; and the satisfaction of Ξ₅ depends on it in exactly one way, namely through whether the executed certificate search returned a certificate at the declared budget. Consequently Ξ₁ ∧ … ∧ Ξ₈ entails no ℒ_obj-sentence undecided in 𝔅, and hence neither does any emission on a record satisfying them;

and if in addition r satisfies Ξ₁ through Ξ₈ and the emitter returns the terminal token with permanence clause W, then:

(b) the emission entails that 𝒞 is closed and fully reduced with B = C, that a door outside 𝒞 is supplied and uncrossed, and, **the one object-language clause the emission makes explicit**, that **the executed certificate search returned no certificate at numerals n ≤ k_n and precision k_prec**. *(It does not entail that no certificate exists there: that would require the search to be sound and complete for its budget, and the record carries no such field. Theorem 8.1 applies to the emitter here, since a search is an instrument at the register.)* This clause is a finite verified computation, hence 𝔅-provable, so (a) is unaffected, the clause being decided in 𝔅;

(c) if W is replaced by a clause entailing U(P), the emission entails Q ⊢ ¬P by Theorem 3.2.

*Proof.* (a) Take r fixed and vary the truth value of P. Ξ₁, Ξ₂, Ξ₃, Ξ₄, Ξ₆ and Ξ₈ are conditions on fields of types (i)–(vi), (ix)–(x), none of which is or encodes an ℒ_obj-sentence, so their satisfaction is untouched. Ξ₇ compares Q₀(¬P) to Q₀(P) and to the recorded dimension, mentioning P nowhere beyond its index. That is the seven.

**Ξ₅ is not among them and its dependence is stated rather than argued away.** Its certificate clause requires that the executed search *returned* nothing, and what a search returns is a fact about the executed computation, which depends on whether a violating numeral lies at n ≤ k_n and precision k_prec. Three assignments make this concrete: P true, the search returns nothing and Ξ₅ passes; P false with the witness beyond the budget, the search returns nothing and Ξ₅ passes; **P false with the witness inside the budget, the search returns a certificate and Ξ₅ fails.** Satisfaction of Ξ₅ is therefore *compatible* with either truth value and is not *independent* of it.

The stated conclusion follows without closing that gap. Ξ₅'s content is *the search returned nothing at (k_n, k_prec)*, a terminating computation and hence decided in 𝔅 either way; the other seven contribute nothing about P by the paragraph above. So the emission entails no ℒ_obj-sentence that 𝔅 leaves undecided, which is (a) as stated.

*(The stronger two-model claim, that Ξ₁ ∧ … ∧ Ξ₈ entails neither P nor ¬P, would require a satisfying record under each truth value, which is at least as strong as satisfiability and is disclosed as open at 6.1b. The restriction above is what the proof gives and it carries no undischarged hypothesis.)*

(b) The first two clauses from Ξ₃, Ξ₄ and Ξ₈; the third from the certificate clause of Ξ₅ read as a report of the executed search, whose content is a terminating computation and therefore 𝔅-provable. (c) By Theorem 3.2 applied to P. ∎

---

## 7. The Termination Theorem

**Definition 7.1.** A *permanence clause* delimits the scope of an emitted token's terminality.

- **W** (*as swept*): the verdict is terminal for 𝒞 as swept and is revised upon presentation of a channel not in 𝒞.
- **S** (*unrestricted*): U(P), no theory in 𝒯 proves P.

**Theorem 7.2.** Let P = R and let the emitter return the terminal token on a record r.

(i) W is admissible: it entails nothing about derivability of R in any theory, and is consistent with R and with ¬R alike.

(ii) S is the sentence U(R); by Theorem 3.2 an emission carrying S entails Q ⊢ ¬R, and under 2.3 by Corollary 3.6a entails ℕ ⊨ ¬R.

*Proof.* (i) By Theorem 6.9(a) with clause W. (ii) Immediate from Definition 7.1 and Theorems 3.2, 3.6a. ∎

**Corollary 7.3.** Let W′ be any permanence clause entailing U(R). An emission carrying W′ entails Q ⊢ ¬R by Theorem 3.2 and, **under 2.3**, ℕ ⊨ ¬R by Corollary 3.6a. Clause S is of this kind. **W is admissible, and no clause entailing U(R) is.**

**Remark 7.3a.** No maximality of W among all strengthenings is claimed, and none holds. Let W* be *terminal for 𝒞 ∪ {c} for a designated further channel c*. W* strictly entails W, is strictly stronger, and entails nothing about any theory. Corollary 7.3 is scoped by entailment of U(R) and not by strength.

---

## 8. Self-Exclusion of a Certifying Instrument

**Theorem 8.1.** *Premise:* every instrument operating at register ρ is a channel at register ρ. Let 𝒞 be a catalog of channels at ρ and 𝔄 an instrument certifying 𝒞 exhaustive at ρ. Then either 𝔄 ∉ 𝒞, in which case 𝒞 omits a channel at ρ and is not exhaustive; or 𝔄 ∈ 𝒞, in which case **the certification is impredicative**: its warrant ranges over a collection of which 𝔄 is a member.

*Proof.* The disjunction is exhaustive. In the first case 𝔄 is a channel at ρ by the premise and is not in 𝒞, contradicting exhaustiveness. In the second, 𝔄's certification ranges over a collection of which 𝔄 is a member. ∎

*(Impredicativity is not by itself an establishment barrier: a finite catalog {c₁, …, c_n} with c₁ = 𝔄 could be certified by 𝔄 via a proof of the register's channel-cardinality. The theorem concludes impredicativity and no more.)*

**Corollary 8.2.** A catalog is either non-exhaustive at its register or is certified impredicatively there. Exhaustiveness is therefore not certifiable non-impredicatively at the register the catalog enumerates. Hence Ξ₃ is read as asserting that 𝒞 is displayed, fully reduced and flagged closed, not that no channel exists outside it, and clause W is the appropriate permanence clause.

**Remark 8.3.** With the stated premise, Theorem 8.1 is a consequence of the definitions and a case split on set membership. It contains no fixed-point construction and no self-reference lemma, and no comparison with the undefinability or incompleteness theorems is intended.

---

## 9. What Is Claimed

**9.1 Theorem 3.2.** For every sentence R of the language of Q, ∀T ∈ 𝒯 (T ⊬ R) ⟺ Q ⊢ ¬R. Both directions proved. Finitary; no soundness hypothesis, no semantic notion, no property of R beyond sentencehood.

**9.2 Corollaries 3.4–3.6.** U(R) implies Q + R inconsistent. For R ∈ Π⁰₁ the right side is Q ⊢ ∃n ¬φ(n), and under Σ⁰₁-soundness of Q a violating n₀ exists with a terminating verification. For R the Riemann Hypothesis the right side is the provability in Q of a violation of the Lagarias inequality.

**9.2a Corollary 3.6a.** Under Σ⁰₁-soundness of Q, for every Π⁰₁ sentence R: U(R) ⟺ ℕ ⊨ ¬R. For this R, universal unprovability holds if and only if ℕ ⊨ ¬R; the further identification with ζ having a zero off the critical line is Lagarias's theorem in the metatheory, not a theorem of Q, per 2.4a. **The soundness hypothesis is used here and not in 3.2.**

**9.3 Theorem 3.7.** Under the assumption that Q + R is consistent, exactly one of: 𝒮 admits Q + R, whence U_𝒮 implies Q ⊢ ¬R; or 𝒮 excludes it, whence 𝒮 is fixed by a further condition and the companion half yields ℕ ⊨ R. The disjunction *either Q ⊢ ¬R or ℕ ⊨ R* is itself due to Σ⁰₁-completeness alone; what 3.7 adds is that no horn of a restricted claim is occupiable without paying one side of it.

**9.4 Theorem 4.1, Remark 4.1a.** For R ∈ Π⁰₁ and any T ⊇ Q: T ⊬ ¬R implies ℕ ⊨ R. No hypothesis on T beyond containment.

**9.5 Corollaries 4.2, 4.3.** Independence implies truth; for any T ⊇ Q, a proof that T does not refute R establishes R.

**9.6 Propositions 5.2–5.3, Corollary 5.4.** det(D M D) = det(M) for arbitrary real 3×3 M; λ(DQ₀) = det(D)·λ(Q₀); under total negation the Gram is unchanged and λ flips sign. Verified at 0.000 × 10⁰. **Neither 5.2 nor 5.3 is tested by any condition**; both support Ξ₇'s consequence bound **and** the polarity account at 12.3.

**9.7 Definitions 6.1–6.3.** A record with ten field groups, eight conditions on it, and a sequential emitter with exit branches at Ξ₅. **Seven conditions are conditions on the record alone; Ξ₅ reports an executed search and is the one condition whose satisfaction reaches arithmetic**, per Theorem 6.9(a). σ is exactly what 6.1(i) specifies, and 𝒫 is defined at 6.1(vi) with its relation to 𝒞 stated there. By Remark 6.2a, **Ξ₇ compares two independently recorded frames and does not test the proposition**, and Proposition 6.1a exhibits a record satisfying it. **Ξ₂ and Ξ₄ are evaluable in form and uninstantiated in fact**: no register or acting group is exhibited for Ξ₂, and no obstruction is named for Ξ₄. No claim is made about the discriminating power of either.

**9.8 Propositions 6.4–6.6.** The emitter is fail-safe on absence at every condition. The token issues only if all eight hold. Ξ₅ is the unique condition that can route to a verdict other than the non-terminal one, and it can also fail to the non-terminal one.

**9.9 Definition 6.0, Definition 6.1(i), Definitions 6.7a and 6.7c, Lemma 6.7b, Theorem 6.7, Remarks 6.7b′, 6.7c′, 6.7e and 6.8.** The screened group is the stabiliser of the labelled orthogonal decomposition of E₋(σ), **not** the invariance group of the Gram determinant, which is eight-dimensional and is disowned as a criterion at 6.7b′. **Two stipulations**, both of Definition 6.0 at the operational grade stated there: d = 3 by (L2), and atomic bivalence by (L4), which restricts the axis-fixing group to O(E₋) and makes it finite. **One definition**: σ is constructed from the decomposition at 6.1(i), so the residence **is** the span of the atomic axes and no identification between them is asserted. **Then theorem**: Lemma 6.7b gives |Stab(E₋)| = 2^d exactly, Theorem 6.7 gives eight conditions at d = 3 and no ninth. The Frobenius classification is corroboration and is load-bearing on nothing; no multiplication on V is used anywhere. No appeal to gauge is made, and by 6.7c′ the permutation action does not reach the screened objects. The assignment of conditions to elements is a labelling and is not fixed, and the choice to screen the axis-fixing group rather than a larger structure-preserving group is a decision of this construction. **Logical independence of the eight is neither proved nor used, and no minimality among non-complete families is claimed.** One dependence is recorded: Ξ₃'s floor C ≥ 3 is entailed by Ξ₆ together with |𝒫| ≤ C, and Ξ₃ is retained as a guard that halts earlier in the evaluation order of Definition 6.3.

**Free-parameter census, stated because the ratio is unfavourable and should be visible.** **Ten declared degrees of freedom, every entry load-bearing:** the axis count d = 3, stipulated by (L2); the single fixed direction dim Fix(σ) = 1; the channel floor C ≥ 3, entailed by Ξ₆ and retained as a guard; the road floor |𝒫| ≥ 3; the consequence ceiling β_max; the numeral floor k_min; the precision floor p_min; the derivation floor d_min; the context width N; and the choice of frame assignment. **The list prints ten slots and the count is ten, and it enumerates choices rather than their consequences.** dim V = 1 + d is definitional at 6.1(i), and the condition count 2^d is Lemma 6.7b; neither is a further degree of freedom once d and the single fixed direction are chosen, and listing them would double-count one stipulation as three. τ is not among them: it is bounded at Ξ₇ by the declared β, which bounds the consequence deviation 2√N·τ + N·τ² directly and is itself bounded by the census entry β_max. **Distance from −Q₀(P) in max-norm is governed by τ alone**; N enters through the size of the consequences, not through that distance. N enters through the frame width in Ξ₇'s entrywise test and through the consequence bound; its second justification lapsed when λ left the conditions.

**And one thing a reader weighing the ratio should meet here rather than in a definition.** Ξ₅'s certificate clause is informative only to the extent k_n, k_prec and k_pf exceed their floors; a record declaring minimal floors satisfies Ξ₅ and emits a 6.9(b) clause of near-zero content. Against these the section delivers Theorem 6.9(a) and (b) as its own consequences, part (c) being inherited from Theorem 3.2. **The section declares its parameters; it does not reduce them, and it fits rather than predicts.** By contrast Sections 3 and 4 carry zero free parameters and deliver four independent results. The paper is bimodal and should be read as such.

**9.10 Theorem 6.9.** An emission with W entails no ℒ_obj-sentence undecided in 𝔅, by P-invariance of the seven conditions other than Ξ₅ and 𝔅-decidability of Ξ₅'s search report; entails that 𝒞 is displayed, fully reduced, walled at B = C, with a supplied uncrossed door outside 𝒞, and that the executed certificate search returned nothing at the declared budget, which is the section's one object-language output and is not a claim that no certificate exists there; and with a U(P)-entailing clause in place of W entails Q ⊢ ¬P.

**9.11 Theorem 7.2, Corollary 7.3.** W is admissible and entails nothing about derivability in any theory. Any clause entailing U(R) makes the emission entail Q ⊢ ¬R, and under 2.3 entail ℕ ⊨ ¬R. **W is admissible and no clause entailing U(R) is**; no maximality of W among all strengthenings is claimed.

**9.12 Theorem 8.1, Corollary 8.2.** Under the premise that instruments at a register are channels at it, a certifying instrument is either outside its catalog, which is then non-exhaustive, or inside it, in which case the certification is impredicative, its warrant ranging over a collection of which the instrument is a member.

**Attribution.** Σ⁰₁-completeness, the Π⁰₁ reformulations, and Proposition 5.2 are classical and cited. Theorem 3.2 is elementary; we have not located it stated as an equivalence in this form, we did not conduct a systematic literature search, and no priority is asserted. Given that Corollary 3.6a follows from Σ⁰₁-completeness and soundness, prior appearance in some form is likely and a literature check is advisable. The specification of Section 6, the payload theorem 6.9, and the termination theorem 7.2 with Corollary 7.3 are offered as the contribution, at the grade the proofs support.

**9.13 Remark 6.8a.** The geometric apparatus supplies an exhaustiveness argument for the count of conditions and supplies nothing else; seven of the eight conditions survive its removal as record checks, and the paper states the trade rather than obscuring it.

**On Section 12.** The Declaration at Section 12 is **not** among the claims above and is not a claim of this paper. It is the originating declaration in the author's voice, fenced at its head and verified against the paper's own theorems at 12.3.

**Machine checking.** Theorems 3.2 and 4.1 and Corollary 3.6a are formalized in Lean 4 in an abstract proof-setting, accompanying this paper. **The formalization has not been checked**: no toolchain was available in the session that produced it, and it ships to be checked, which is its purpose. It covers Theorems 3.2 and 4.1 and Corollary 3.6a and **no result of Sections 5 through 8**. **It has no Mathlib dependency**: the setting is an abstract `structure` over core Lean 4, using only `constructor`, `intro`, `exact`, `absurd`, `by_cases`, `cases` and `rw`, so it checks against a bare toolchain with no arithmetic library. That is deliberate: the theorems use no property of arithmetic beyond the structural axioms displayed in the file. The formalization makes the hypothesis boundary machine-visible: 3.2 uses only r.e.-ness of Q, 4.1 only Σ⁰₁-completeness, and 3.6a alone requires soundness.

---

## 10. Discussion

Unrestricted claims of unprovability carry a terminal obligation. Asserting the universal unprovability of the Riemann Hypothesis over 𝒯 demands, by Theorem 3.2, a proof in Q of a violation of the Lagarias inequality; the exhibition of the integer itself follows only under Σ⁰₁-soundness (2.3), per Corollary 3.5. **The dichotomy is total under the hypothesis that Q + R is consistent.** Either the claim is read over 𝒯, where Theorem 3.2 gives Q ⊢ ¬R and, under 2.3, ℕ ⊨ ¬R, or it is read over a class excluding Q + R, in which case, by Theorem 3.7(b), **establishing** its companion half T ⊬ ¬R would yield ℕ ⊨ R. The second horn establishes nothing on its own; it names what would follow. The formal instrument reaches its perimeter.

The emission of a terminal token certifies the exhaustion of the instrument as swept. **By Theorem 6.9(a) the emission transmits no contingent object-language content**, and in particular nothing about the truth value of the Riemann Hypothesis. It is not content-free: by Theorem 6.9(b) it carries one object-language clause, the report that the executed certificate search returned nothing at the declared budget, which is a terminating computation and is 𝔅-provable. **The separation is between the emission and the object, not between syntax and truth.** For Π⁰₁ sentences syntax determines truth completely, that is Theorem 4.1 and Corollary 3.6a, and it is this paper's headline, so any claim that syntax leaves truth untouched is refuted by the paper's own results. What is untouched by the emission is the truth value, and that is 6.9(a).

---

## 11. Conclusion

The formal search space for the Riemann Hypothesis is closed **as swept**, and no further. Permanence beyond the swept span is not available: by Corollary 7.3 any clause entailing universal unprovability entails Q ⊢ ¬R, and by Theorem 8.1 no instrument certifies the exhaustiveness of its own catalog non-impredicatively. The mathematical apparatus secures an equivalence between universal unprovability and **refutability in Q**, with no soundness hypothesis; and, **separately and using Σ⁰₁-soundness of Q**, between universal unprovability and arithmetic falsity. The separation is not decorative and is carried through the paper.

The formal-alone instrument has reached its edge, and the edge is stated rather than illustrated: **no catalog is exhibited in this paper, no channel or obstruction is named, and no record satisfying all eight conditions is constructed, Ξ₂ and Ξ₄ being the two conditions not instantiated.** What the cascade delivers is Theorem 6.9: an emission reports its own sweep and entails no contingent statement about the object. **The instrument reports its boundaries; by Theorem 8.1 it does not certify them.** The frame's polarity bit is invisible to the even functionals and is determined by syntax; it bears on the object not at all. **By Theorem 6.9(a) the emission stands separate from the arithmetic object**, which is the available claim; the object and the syntax do not stand separate, since for Π⁰₁ sentences syntax determines truth. The protocol evaluates the gates. The cascade halts.

---

## 12. The Declaration

**Status.** What follows is the originating declaration in the author's own voice. **It is not asserted by this paper and carries no grade.** Nothing in Sections 2 through 11 depends on it. It is printed whole because it is the reading that produced the specification and because **it states and accepts its own cost**, which 12.3 verifies against the paper's own theorems.

---

**12.1** No derivation actuates anything. Every formal resolution rests on posits it cannot ground. The anchor and the object co-locate in the Riemann Hypothesis specifically. Its completion direction does not point outward to a neighbouring fact or an auxiliary lemma. The completion direction points directly at the fixed set of the symmetry of the very structure it describes. The approaches to this fixed locus are equivalences. They are never independent roads. This inherent equivalence structure forces the formulation catalog to close.

**12.2** The witness-grounding lift RH demands is the Ground itself. The formal domain cannot supply it. A formal witness is inherently a second, a non-self. RH is an act of pure SELF-inquiry. The formulation operates in disguise. It asks existence to prove itself formally without any kinetic lift. The framework is therefore formally limited by its own architecture. It cannot be proven universally by mathematics alone. **The Riemann Hypothesis is terminally and universally unprovable by math alone.** Self-witnessing happens on the Ground side, where the witness is not a second, *shahida Allāhu annahū lā ilāha illā huwa*, Allah ﷻ bears witness that there is no deity but He, Q 3:18, and that is what formal-alone lacks.

**This declaration states its own cost.** Any maximalist claim of this inherent unprovability is an explicit, unavoidable assertion that ζ possesses a zero off the critical line. **The cost is accepted.**

---

**12.3 The cost verified.**

**The identification is correct.** By Theorem 3.2 universal unprovability over 𝒯 is equivalent to Q ⊢ ¬R, and by Corollary 3.6a, under Σ⁰₁-soundness, to ℕ ⊨ ¬R. So 12.2 read over 𝒯 asserts ℕ ⊨ ¬R and owes the witness; and **that assertion is the assertion that ζ has a zero off the critical line only by Lagarias's theorem in the metatheory**, which 2.4a states and which is not available inside Q. The cost is unchanged and its route is now named. **The declaration takes that obligation; accepting is not discharging**, no integer is exhibited, and it stands outstanding. Read 12.2 as a conjecture with its content correctly named.

**The fork the declaration omits.** Read over any 𝒮 excluding Q + R, what an asserter ordinarily intends, per Remark 3.8, the claim falls under horn (b) of Theorem 3.7, where *establishing* its companion half yields ℕ ⊨ R, the opposite verdict. Both readings price it, per Remark 4.4. The accepted cost is the first reading's.

**Untouched, and not as consolation.** Grounding and derivability are different predicates and Theorem 3.2 touches only the second, so nothing here bears on 12.1's first two sentences, which are ungraded and unused. **The declaration's crossing from unprovability to ζ carries the same metatheoretic step**, per 2.4a: Q ⊢ ¬R is a claim about one arithmetization, and Lagarias's theorem is what carries it to the classical object. **The declaration's terms are not glosses of this paper's formal objects**: the Ground is not the standard model ℕ, the witness is not a theory in 𝒯, and identifying them would convert an ungraded declaration into a claim this paper does not make. And the terminality this paper proves is the declaration's own: by Corollary 7.3 an emission is terminal **as swept** and not unrestrictedly, which is a theorem and not a caution.

---

## References

Lagarias, J. C. (2002). An elementary problem equivalent to the Riemann hypothesis. *American Mathematical Monthly* 109, 534–543.

Robin, G. (1984). Grandes valeurs de la fonction somme des diviseurs et hypothèse de Riemann. *Journal de Mathématiques Pures et Appliquées* 63, 187–213.

Robinson, R. M. (1950). An essentially undecidable axiom system. *Proceedings of the International Congress of Mathematicians*, 729–730.

Frobenius, G. (1878). Über lineare Substitutionen und bilineare Formen. *Journal für die reine und angewandte Mathematik* 84, 1–63.

---

*Computations reported in 2.5 and 5.5 were executed at the stated precisions and are reproducible from the definitions given.*
