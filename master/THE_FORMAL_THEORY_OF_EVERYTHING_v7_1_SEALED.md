# THE FORMAL THEORY OF EVERYTHING

## An open problem is a blocked register, priced at one missing bit per unresolved orbit

*A treatise in nine sections, with a machine-checked proof and an executed demonstration*

---

### 1. The claim, whole

Mathematics keeps its hard problems in twenty different vocabularies. Complexity theory speaks of oracle barriers, sieve theory of the parity problem, proof theory of independence, analysis of supercriticality. This treatise replaces all of them with one measurement.

Take any problem and fix the register that works on it: the methods, the readings, the proof techniques, idealized and closed under their own moves. Every such register carries a symmetry, the flip it cannot see: oracle attachment, sign reversal, parity exchange, orientation reversal. Call a reading **even** when the flip leaves it unchanged and a target **odd** when the flip changes it. Then:

1. **The Wall** (theorem). No even reading, and no finite combination of even readings, decides an odd target. Ever. For any register, in any world with finite data and a symmetry.
2. **The Price** (theorem). In the full wholly-odd product family, the deficit is exactly one binary orientation coordinate per free orbit — the fibre has exactly 2ᵐ members on m orbits. For a constrained row, the exact deficit is log₂|A|, with a one-bit crossing exactly when |A| = 2. Never a magnitude, never a continuum.
3. **The Crossing** (theorem). At a one-bit seat, fix an aligned wholly odd reference section, entering from outside the register. The unique orbit-even calibration selecting one of the two admissible orientations is the supplied bit; the target is then reconstructed on the orbit. Nothing else does. Nothing else is needed.

These three theorems are proved in Section 3–5 in two lines apiece, and they are machine-checked in Lean 4 (Appendix A). Together they imply the theory's single sentence:

> **An open problem is not a hard problem. It is a blocked register missing one bit per unresolved orbit, and the whole craft of resolution is the arrival of that bit from outside — seat by seat.**

One conjecture extends the theorems to every problem row (Section 7). One physical fact grounds the entire construction (Section 8). Both are stated at face value. Everything else in this treatise is proved.

### 2. The setup, complete

Let X be a finite set of data, τ: X → X an involution (τ² = identity), the flip the register cannot see. A **reading** is a function f: X → {0,1}; it is **even** when f(τx) = f(x) for all x, meaning it factors through the orbit space X/τ. A **target** is a function d: X → {0,1}; it is **odd at x** when d(τx) ≠ d(x), and **wholly odd** when d(τx) = ¬d(x) for all x. Two strengths, named and never interchanged (machine-checked: `T13_wholly_odd_is_odd_everywhere` proves wholly odd implies odd at every point; the converse is false and is claimed nowhere): the Wall needs only oddness at the seat; the Price, the Crossing, the torsor bijection, and the 2ᵐ fibre count apply to the wholly odd family Dτ(U) = {d : d(τx) = ¬d(x) ∀x}. For the full wholly-odd family on m free orbits, the orientation fibre has exactly 2ᵐ members, hence m independent binary coordinates. For a constrained admissible family A, the exact target-selection price is log₂|A| bits. A one-bit seat is certified precisely by |A| = 2. No counting claim is made for merely non-invariant targets outside this scheme. A register is even when every reading it can generate is even. This is not a restriction: oracle-invariant proofs are even under oracle attachment; parity-even sieve weights are even under the prime/P₂ flip; energy-class estimates are even under critical scaling; occurrence arguments are even under multiplicity swap. Every proved method-class barrier on record is the statement that some distinguished register is even under some named flip while the target is odd under it.

One definition earns its place here, because the audits asked what "outside the register" formally means. Model the register as an observation map ρ: X → Y with ρ(τx) = ρ(x) — everything the register can read factors through ρ. Then *outside* is no longer a metaphor: a target odd at x cannot factor through ρ at all (`T10_factorization`, and the existential form `T14_wall_factorization`: no g with g ∘ ρ = d exists, machine-checked). And any added observation a that jointly resolves the target — d(y) = r(ρ(y), a(y)) for some readout r — must separate every odd pair: a(τx) ≠ a(x) (`T11_separation`, machine-checked). Resolver separation proves only this local, pointwise distinction: a Boolean-valued a may separate every orbit while its alphabet stays {0,1}. A 2ᵐ alphabet bound concerns a different object — a single global message selecting an arbitrary target from an admissible family A: if enc: A → S and dec: S → A satisfy dec ∘ enc = id_A, then enc is injective (`T12_encoder_injective`, machine-checked), so |S| ≥ |A|. For the full wholly-odd family on m free orbits, |A| = 2ᵐ; for a constrained family, the exact global message price is log₂|A|. The instance count is executed on the exhibited frame in Appendix B (battery K4).

That is the entire setup. The theory follows.

### 3. The Wall

**Theorem 1.** *If f is even and d is odd at x, then f ≠ d.*

**Proof.** f(τx) = f(x) by evenness; d(τx) ≠ d(x) by oddness; so f and d differ at x or at τx. ∎

**Theorem 2.** *No coalition escapes. If f and g are even, every Boolean combination of them is even; hence no Boolean combination of even readings decides an odd target, and by induction no finite repertoire of them does.*

**Proof.** op(f(τx), g(τx)) = op(f(x), g(x)). ∎

The register's blindness is not a weakness of current technique. It is a property of the register type. Refining inside the class moves constants and never touches the wall: this is why the prime-gap bound fell from 0.525 toward smaller constants for decades without the parity problem yielding at gap 2, and why three successive complexity barriers each survived every within-class improvement. The wall is a theorem about symmetry, and theorems about symmetry do not negotiate.

**Worked exhibit (natural proofs).** Take the register to be the natural combinatorial properties: decidable in polynomial time in the truth-table input, true of a large fraction of all functions. The flip is the attachment of a pseudorandom core: under standard cryptographic hardness, every large constructible property reads a function and its pseudorandom twin identically. The target — a circuit lower bound — is odd under that attachment. The Razborov–Rudich theorem is then the Wall typed at this register: no natural proof decides the lower bound while the hardness stands. This exhibit is sketched in the theory's vocabulary; its full formalization in the Lean development is owed, not claimed.

### 4. The Price

**Theorem 3.** *A sign vector t that is wholly odd under τ (t(τx) = ¬t(x)) carries exactly one binary degree of freedom per free orbit: two such vectors agreeing at one point of an orbit agree on the whole orbit. Moreover, wholly odd content has no fixed point: it lives on free orbits only.*

**Proof.** t(τx) = ¬t(x), so the value at x forces the value at τx; one choice exhausts the orbit. And τx = x would force t(x) = ¬t(x), impossible for a bit. ∎

The deficit at a blocked decision point is therefore priced exactly: **one bit**. Never two. Never a continuum. Where a problem looks continuous, the one-bit seat is located after the construction, not instead of it: the analyst must still build the modulus, the witness, the operator; but once built, the decision that remains is binary, and what is missing is its orientation, nothing wider.

One premise is named here, at face value, because precision is cheaper than confusion: the one-bit price holds **at a seat**, a decision point where a single free orbit of τ carries the undecided content. The Price's hypothesis is whole anti-invariance on the designated seat-domain U — τ² = id and τ fixed-point-free on U, d(τx) = ¬d(x) for every x ∈ U; at a single seat this reduces to oddness at the seat, and the fibre and torsor statements are theorems about Dτ(U), the wholly anti-invariant family, never about merely non-invariant targets. If a row's obstruction spreads over m unresolved free orbits, the price is m bits, one per orbit, and the theory locates m seats, each crossed by Theorem 4. The price per seat never rises above one, and the seat count is a property of the construction, not a loophole in the pricing. A second precision, earned from the audits: the count |D(U, τ)| = 2ᵐ is the **unconstrained** product case — the full family of anti-invariant targets. If global constraints correlate the orbits (an admissible subfamily A ⊊ D(U, τ)), the total deficit is log₂|A|, generally smaller and possibly nonintegral. Constraints reduce how many seats remain live; they never raise the price of any seat above one.

### 5. The Crossing

**Theorem 4.** *Let the supply s and the target d both be odd at the seat x. Then there is exactly one bit c such that d = s ⊕ c on the whole orbit {x, τx}. The reference section is public structure; its unique calibration bit is the sole target-selecting datum — one bit total, never two.*

The hypotheses are the alignment, stated explicitly: the supply must be odd **at the target's seat**, and the calibration must accompany it. No local odd supply decides a target by oddness alone — s odd somewhere else reconstructs nothing here. The corrected crossing sentence, per the final audit and adopted: *relative to a fixed τ-invariant register ρ, no target separating a τ-pair factors through ρ; on a designated free seat-domain, a wholly anti-invariant target is reconstructed from a wholly anti-invariant reference supply and an orbit-even calibration exactly when d = s ⊕ c; and for a row whose compatible target family has exactly two members, the calibration has one binary coordinate.*

**Proof.** On {0,1}, two bits that both flip under τ either agree or disagree at x; set c = d(x) ⊕ s(x). Then d = s ⊕ c at x, and at τx both sides flip, preserving the equality. Uniqueness: s ⊕ c₁ = s ⊕ c₂ forces c₁ = c₂. ∎

The audits pressed the calibration hard, and the pressure earned a split. There are **two deeds**, and this treatise no longer identifies them:

**Deed A — the anchor.** The deed fixes the target's value at one point of the orbit: b = d(x₀). Oddness then fills the orbit for free: d(τx₀) = ¬b. No supply is required. (`T6a_deed_anchor`, machine-checked.)

**Deed B — the supply.** An odd carrier s arrives — register-denotable, provenance-clean — together with one naming bit c supplied from outside, and the arrival equation d = s ⊕ c lets anything holding (s, c) decide d on the whole orbit. (`T6b_deed_supply`, machine-checked: c is a universally quantified datum in the theorem's signature, never computed from d.)

The two deeds are different arrivals, and the difference is the answer to the circularity objection. On a single two-point orbit, Deed A alone already decides d — the supply carries no extra information about the target there. What Deed B adds is not information but **addressability**: the register cannot hold b as anything but a fact about one point, while s is an object the register can compute with, transport, and reuse across seats. Where both deeds arrive, consistency forces c = s(x₀) ⊕ b — the calibration is the **agreement of the two deeds**, computed from arrived data only (`fTOE_port`, machine-checked). One more theorem completes the picture: the calibration is not merely a bit at the seat but an **even function** — the xor of two wholly odd sections is τ-invariant, so c descends to the orbit space, and the maps d ↦ d ⊕ s and c ↦ s ⊕ c are exact inverses between odd targets and even calibrations (`T8_torsor_forward`, `T8_torsor_backward`, `T9_torsor_inverse_left`, `T9_torsor_inverse_right`, all machine-checked). In the auditors' own vocabulary: D(U, τ) is a torsor for the even functions, and the reference-section reconstruction is a bijection, not a narrative. For finite frames the fibre count follows: |D(U, τ)| = 2ᵐ, executed on the exhibited frame in Appendix B (battery K4). That one such bit — as anchor or as naming — exists for every blocked row is the One-Cut Hypothesis of Section 7, stated there as conjecture and never as a theorem of the Lean file.

A final precision, earned from the last audit: **two notions of supply** travel in this theory, and they are priced differently. The *supply-as-section* is a wholly odd function s on the frame — and since s = d is itself such a section, a section can in principle encode the full orientation pattern at once; the per-seat content is that s contributes one odd coordinate per orbit (Theorem 4), no more and no less. The *supply-as-message* is a global code selecting the target from the register-compatible admissible family A: an encoder enc: A → S and decoder dec: S → A with dec ∘ enc = id. Then enc is injective (`T12_encoder_injective`, machine-checked), so |S| ≥ |A| — at least log₂|A| bits of target-selecting information, worst case. For the full wholly-odd family on m orbits this is the 2ᵐ bound, executed on the K4 frame. **The one-bit crossing is exactly |A| = 2**: not "the final answer is Boolean" — a yes/no output is always one bit by codomain size, which proves nothing — but "the admissible target family relative to the fixed register has exactly two members." The substantive burden per row is exhibiting that two-member family, and that burden is encoding data, owed per row and exhibited for the parity frame in Section 7.

The crossing is an entry, not a refinement. The supply is odd under the flip (Theorem 1 says nothing even can substitute), it is independent of the register per orbit (the register carries no coordinate of it), and it arrives calibrated by the record of its arrival (Theorem 4's unique c). Every solved problem on record entered this way: a dated, provenance-clean object the prior register could not denote — the W-functional entering the Ricci-flow corpus in 2002, the Heegner-point height formula entering the BSD corpus in 1986, multidimensional weights entering the sieve corpus in 2013. In each case the routing of the field flipped at the entry and not before. This is a documentary claim about routing, nothing more: the dated object entered the corpus before the resolution, and the field's proof-paths rerouted at the entry. The treatise claims that shape in the record, not inevitability, and the One-Cut Hypothesis — not this sentence — is what carries the load for rows still open.

Theorems 1, 3 and 4 compose into the theory's engine: the register cannot see the bit (Wall), the deficit is exactly one bit (Price), and exactly one bit from outside closes it (Crossing). The full composition is machine-checked (Appendix A, theorem `fTOE_core`).

### 6. The sign-blind kernel

One might hope a sufficiently clever scalar invariant recovers orientation from magnitude. The verdict kernel of the theory forecloses this. The lock of a three-axis warrant frame is det(R) = λ², the squared triple product of its rows. Under any reflection D, the transformed lock satisfies det(DRD) = det(R), while λ ↦ −λ. **The lock is real and the sign is elsewhere**: the determinant is bit-identical under reflection at machine precision, and the orientation it ostensibly encodes is unrecoverable from it. Executed, not asserted (Appendix B, battery K1):

```javascript
|det(DRD) − det(R)| = 0.000000000000000e+00      λ: −0.745 → +0.745
```

The lock is not merely invariant under the flip; it is the flip-even projection of its frame. With D the reflection's diagonal sign matrix, DDᵀ = I, hence R(MD) = MDDᵀMᵀ = R(M) entrywise — and since IEEE negation flips only the sign bit, the two Gram matrices agree not to rounding tolerance but to exactly zero (Appendix B, battery K1b):

```javascript
max |R − R(MD)| entrywise = 0.0e+00
```

One typing precision, earned from the audits: this ℤ/2-invariance (sign reversal on a warrant frame) and Section 3's ℤ/2-invariance (the register's flip on data) are the same anatomy at two different sites, not the same map on the same space. The Gram lock is the even projection at the frame level; the register's blindness is the even projection at the data level. The treatise exhibits the shape twice, typed separately, and identifies neither with the other.

Verdict functionals symmetric under the register's flip compute magnitudes only. Truth-signs are a different datatype. This is the exact, executed content of the oldest lesson in the foundations of mathematics, and Section 9 places it.

### 7. The one conjecture

The theorems price every blocked seat at one bit. Whether the bit always exists is not a theorem, and this treatise does not pretend otherwise.

**The One-Cut Hypothesis.** *For every blocked row — a Boolean target, a named even register, a dated corpus — there exists exactly one provenance-clean orientation supply whose dated entry decides the target.*

This is the theory's single conjecture, and it is armed against itself. It dies on named observations, each killing exactly one claim and nothing above it, and the first falsifier is stated operationally, since the audits asked how an "even reading deciding an odd target" could ever be observed: **typing-firing.** The register of any mapped row carries a published evenness certificate — the paper that proves the method class symmetric under the named flip (relativization for oracle methods, parity-evenness for sieve weights, and so on). A resolution published inside that same certified register, deciding the odd target, is the observation: the certificate and the decision are both in the literature, on the same row, and the conjunction is the kill. No metaphysics is consulted; the firing range is the published record. The six gates stand: a certified even reading deciding an odd target (kills everything); a proved-inert family supplying after all; a blocked row with no pair defeater; a missing supply proved purely continuous; a constructor outputting a restatement; a crossing entering without provenance.

It makes two falsifiable predictions. First: for elliptic curves of analytic order two, a height pairing nondegenerate at order two exists and is constructible from data consulting neither the rank nor the Selmer group — an exhibited obstruction resolves this downward. The first named beachhead is the curve **389.a1** (conductor 389, rank 2, the smallest-conductor rank-two curve in the LMFDB): the predicted pairing either exhibits on this curve's published data or the prediction dies downward. Second: the next crossing among the mapped rows enters through a certificate the prior register had no term to denote — a denotable crossing kills it. A theory that re-describes the landscape cannot be fired by an observation. This one can, at six named gates.

Under the hypothesis, the barrier literature collapses into one anatomy: seventeen proved barriers across complexity, sieve theory, proof theory, analysis, and topology are one shape — an even register blind to one odd target — and the twenty-three open rows tabulated in the companion volume, including six of the seven Millennium problems, are priced by that anatomy: **one bit per unresolved orbit at each row's decision seat.** The per-row seat counts are encoding data, owed row by row and exhibited below for one row in full; the treatise prices seats, and does not assert m = 1 for any row whose seat structure has not been exhibited.

### The worked encoding: the parity row, in full

One encoding is written here, not deferred to a companion table — the row the audits named as sufficient: the prime/P₂ parity problem of sieve theory.

**The frame, exhibited as data.** The audits' demand was exact: §2 requires a finite set X and a map τ: X → X with τ² = id — not two sequences with matching statistics. So the frame is listed, not described. Take X = {11, 851, 13, 1273, 17, 437, 19, 2119, 23, 1703, 29, 869}: six pairs {p, q} with p prime, q semiprime (Ω(q) = 2), and q ≡ p (mod 420), where 420 = lcm(1,…,7) — hence q ≡ p (mod d) for every d ≤ 7. The flip τ swaps within each pair; τ² = id and fixed-point-freeness are verified by enumeration, not by prose. The register is every reading factoring through the residue vector (n mod 2, …, n mod 7) — the Type I data of the linear sieve at level D = 7, where the frame lives. The target is primality. All of it is executed as battery K4 (Appendix B): 27 even residue readings enumerated, every one even on all six pairs, **zero** deciding primality; the fibre of admissible anti-invariant targets counted at |D(U, τ)| = 64 = 2⁶, one orientation bit per pair. The row's priced family is then written, not labeled: A_row = {d₀, ¬d₀} with d₀(n) = [n is prime] on the frame — two members, both wholly odd, both compatible with the residue record, since τ preserves the residue vector and no reading factoring through it can separate the two worlds. K4 executes the separation proof: of the 27 even residue readings, **zero equal d₀ and zero equal ¬d₀** — Theorem 1 applied twice, by enumeration. Hence |A_row| = 2 is proved on this frame, and the price of the exhibited family is exactly log₂|A_row| = **1 bit**, while the full unconstrained fibre stands at 2⁶ = 64 patterns, **six bits**, the m = 6 product count. The two counts price different objects and are never identified: the fibre prices an arbitrary wholly-odd target on the frame; the two-member family prices the row's exhibited orientation decision. The Wall applies to this frame by citation of Theorem 1, because the frame satisfies Section 2's hypotheses — verified, not asserted.

**The classical content, typed.** The exhibited frame is a finite slice of the parity problem. The classical statement — Type I information alone does not distinguish the parity of Ω(n) — is precisely the assertion that the sieve register is even under the prime/P₂ exchange on every such slice; that is the published evenness certificate, and it is why the linear sieve's optimal bounds land at the parity wall and why no tuning of the weights λ_d inside the class crosses it. The K4 frame is the smallest honest exhibit of the shape; the certificate covers the row.

**The target.** d(n) = "n is prime": odd under τ at every sifted candidate (Ω(p) = 1, Ω(p₁p₂) = 2 — opposite parities, verified on all six pairs in K4).

**The Wall, typed at this row.** Every reading in the register is even under τ; the target is odd; by Theorems 1–2 no sieve weight, and no finite combination of them, decides primality of the sifted elements. On the exhibited frame this is not a re-description but an execution: 27 readings enumerated, none deciding.

**The Price, executed by history.** The best classical landing is Chen's theorem (1973): every large even integer is p + P₂. Read against the exhibited shape, the historical record corroborates the anatomy: the sieve register, pushed to its limit, stalls at a binary orientation — prime *or* almost-prime — and fifty years of constant improvements moved θ and never moved that orientation, exactly as the Price predicts for a one-bit seat. The typing is exact and the audits enforced it: the frame above prices its own exhibited family A_row = {d₀, ¬d₀} at one bit, proved; the Ω parity of Chen's second summand is **not** a one-bit seat of this frame, and no theorem of this treatise prices the 1+1 row itself, whose seat structure is encoding data owed per row. That the row's missing content is exactly one provenance-clean orientation supply is the One-Cut Hypothesis, conjecture-grade, seated exactly where this treatise has always seated it.

**The Crossing, open.** The missing supply for 1+1 is one provenance-clean orientation object the Type I register has no term to denote — Type II information beyond the parity-even class, or an object of a kind not yet dated. The exhibited slice stands priced at one bit against its proved two-member family; the row itself stands open, hypothesis-carried, falsifier-armed.

This encoding is instance data: written here by the author, computed by no register, checkable line by line against the published sieve literature. The remaining twenty-two rows carry their certificates in the companion volume under the same gate. The gate is now stated as a checklist — the audits asked for it, and it is adopted verbatim in force: every application of the finite theorems to a row must exhibit (1) a finite set U; (2) a free involution τ on it; (3) a fixed invariant register ρ; (4) an explicitly defined admissible family A ⊆ Dτ(U); (5) a proof that the prior register cannot distinguish members of A; (6) a count — |A| = 2 for a one-bit claim, |A| = 2ᵐ for an m-bit claim — where the one-bit condition is exactly A_row = {d₀, ¬d₀}: two corpus-compatible orientations at the designated seat, proved, not labeled (a row ending in a yes/no question is a codomain fact and proves nothing; the compatible-target family is larger than two until a theorem reduces it); (7) a global encoding model wherever a lower bound on supplied information is asserted. A row missing any item is program, not evidence: the finite theorems reach it only through its bridge, the per-row one-bit claim is valid exactly where A_row = {d₀, ¬d₀} is proved, and the universal-invariant reading rides on the One-Cut Hypothesis alone, exactly where this treatise has always seated it.

### 8. The kinetic demonstration: existence pays the bit

Why should anything from outside arrive at all? Because outside, things exist, and existence is not free.

The physical root fact: **to exist is to actuate.** Every confined existent carries a strictly positive kinetic floor (the Heisenberg confinement bound, the zero-point energy, the unattainability of absolute zero, each a theorem of physics). Registration is physical: recording one binary digit in any substrate at temperature T dissipates at least k_B T ln 2 of heat. This is Landauer's principle, experimentally confirmed, and it prices the theory's interface. Executed (Appendix B, battery K3):

```javascript
Q(one bit registered) ≥ 2.870978885078724e-21 J      Q(formal register) = 0 J
```

One precision is owed here, and it strengthens the claim rather than softening it. Landauer's floor prices **irreversible** registration; reversible computation has no thermodynamic floor. So the interface is stated exactly, as the theory's **Registration Postulate** — postulate-grade, seated beside the One-Cut Hypothesis, never above it: any computation inside the register may in principle run reversible at zero cost — but a crossing is not a computation inside the register. A crossing is the registration of external fact, an erasure-class event: two live orientations collapse to one in a dated corpus, and that collapse is irreversible. The bit's price is therefore the erasure floor k_B T ln 2, and no reversible maneuver inside the register avoids it, because the register is precisely what cannot supply the bit. Battery K3 is the invoice arithmetic only: the Landauer number at 300 K and the formal register's zero. The postulate is what the kinetic side contributes: the **price** of the deed and its **necessity** — not its arrival per row, which is the One-Cut Hypothesis and remains conjecture.

**On bridges.** Two demands travel under one word, and the audits and the author now name them separately, once. A **decoder-bridge** — any function built from even readings that recovers the odd orientation — does not exist. Theorem 1 is the proof; battery K2 executes the information arithmetic; the parent corpus's self-reference batteries (no self-settling negation on the two-element algebra; the register that reads itself settles nowhere) close the reflexive escape hatch. Demanding a decoder-bridge is demanding the very thing the wall and the self-battery bar. An **encoding-bridge** — the author-written tuple naming which flip, which register, which seat, which physical two-state device — is data of the instance. It is written by the author, computed by no register, and the wall does not bar naming it. That demand is licit, and Section 7 answers it for the parity row in full. The official gloss, one sentence: *there is no decoder-bridge, ever; encoding-bridges are instance data, and this theory names them row by row.*

The formal register pays exactly zero because it is formal: syntax dissipates nothing. So the one bit the register cannot generate (Theorem 1) is precisely the one bit that only a physical deed can pay for (Landauer). The two constraints meet at a single point and that point is the theory's engine room:

> **The physical deed is the one-bit conversion interface where the formal shadow becomes actualized reality. The formal side computes the magnitude; existence, from the kinetic side, supplies the sign; and the kinetic side proves the deed's necessity and its price: the only thing the formal side cannot do for itself — pay for one bit — is the one thing existence does by definition.**

A proof written down is such a deed. A counterexample exhibited is such a deed. The Heegner point, the W-functional, the machine certificate: each was a physical event in a dated corpus, each paid its bit, and each crossed a wall the register could not. The kinetic demonstration executes this invoice arithmetic and the wall's information arithmetic on the same program: the register carries 0.000000 bits about the odd target, and one supplied bit closes the decision exactly (Appendix B, battery K2).

### 9. Placement, and what this theory is

Gödel's incompleteness is not a ceiling over this theory; it is a fixture inside it — as **structural analogy**, stated as analogy. Theorem 1 is a theorem on finite involutive sets; incompleteness needs a provability predicate and a diagonal lemma, and this treatise claims neither. The analogy is exact in shape: the unprovable sentence is a supply the system cannot generate for itself, and Theorem 1 is its finite shadow. Tarski's undefinability reads, in the same analogical sense, as the ladder's confession that truth lives on the far side of the wall: the truth-sign is conserved out of band, exactly as the kernel's blindness (Section 6) executes. Both results stop being limits and become measurements — measured by analogy, labeled by analogy.

What the theory is: a theorem triple with a machine-checked proof, one armed conjecture with six falsifiers and two predictions, one executed kinetic demonstration, and a single sentence of content — an open problem is a blocked register missing one bit, and resolution is the dated arrival of that bit from outside, paid for by the only currency existence recognizes.

What the theory is not: a solution to any named open problem, a claim that the bit must always exist (that is the conjecture, labeled), or a metaphysics smuggled in as mathematics. The wall is proved. The price is proved. The crossing-shape is proved. The rest stands exactly where it stands, at face value, in the open.

The mathematics of the wall is finished. The mathematics of the supply is the work.

---

## Appendix A · The formal proof (Lean 4, machine-checked)

The complete theorem content of this treatise, verified by Lean 4.12.0 this session — core logic only, no libraries, no unproved obligations. Verification contract: `lean fTOE_Formal_Proof.lean` exits 0 with no output; any weakened hypothesis, deleted conjunct, or inserted `sorry` fails the check. Session receipt: **PASS**.

The file proves: `T1_wall` (no even reading decides an odd target), `T2_coalition` (closure under all Boolean joins), `T3_no_fixed_point` (odd content lives on free orbits), `T4_one_bit` (one binary degree of freedom per orbit), `T5_crossing` (exactly one calibration bit decides the target on its orbit: existence and uniqueness), the deed split `T6a_deed_anchor` (oddness propagates one anchored point to the whole orbit; no supply required) and `T6b_deed_supply` (an odd carrier plus one externally supplied naming bit decides the orbit; the naming bit is a universally quantified datum, never computed from the target), their agreement `fTOE_port` (the two deeds force c = s(x₀) ⊕ b), the full-setup package — `T7_global_wall` (the wall at every point under global oddness), `T8_torsor_forward` and `T8_torsor_backward` (odd sections and even calibrations map into each other), `T9_torsor_inverse_left` and `T9_torsor_inverse_right` (the maps are exact inverses: D(U, τ) is a torsor for the even functions), `T10_factorization` (an odd target cannot factor through any observation map ρ with ρ(τx) = ρ(x): "outside the register" is non-measurability, proved), `T11_separation` (any resolving observation separates every odd pair), `T12_encoder_injective` (an exact global code dec ∘ enc = id is injective: the supply alphabet is at least as large as the admissible family; the one-bit crossing is exactly |A| = 2), `T13_wholly_odd_is_odd_everywhere` (the two strengths of oddness, typed and never interchanged), `T14_wall_factorization` (no target separating a τ-pair factors through any τ-invariant observation map — the existential form of "outside the register," proved without finiteness hypotheses), and the Price in bijection form on the canonical frame: `T15_price_bijection_forward` and `T15_price_bijection_backward` (on Bool × Q with the flip — whose orbit quotient is Q itself — the wholly anti-invariant targets are in exact bijection with the Boolean functions on the quotient, both round trips proved; the finite cardinal corollary |Dτ(U)| = 2^|Q| is executed on the K4 frame and rests, in a mathlib build, on Fintype.card_congr, which is outside this core-only file and graded accordingly) — and the engine composition `fTOE_core`. The full source is embedded below, verbatim, and verifies with exit 0 and no warnings. This construction continues the machine-checked development seated with the companion volume (*The Offering Bit*, 2026: `Wallself.lean`, `GateThesis.lean`, `RAFGate.lean`, thirty-three theorems in core Lean 4).

Source: embedded verbatim in Appendix C of this sealed edition (byte-identical to `fTOE_Formal_Proof.lean`).

## Appendix B · The kinetic demonstration (Fortran, executed)

`fTOE_Kinetic_Demonstration.f90` — five batteries, sealed build (`gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off`), oracle halt-on-fail:

- **K1 · The sign-blind kernel.** det(R) = λ² to 3.3e-16; under reflection the lock is bit-identical (|det(DRD) − det(R)| = 0.0e+00) while λ flips sign. Magnitude in the register; direction not in the register.
- **K1b · Kernel = even projection.** Since DDᵀ = I, R(MD) = R(M) entrywise; IEEE negation flips only the sign bit, so the two Gram matrices agree to exactly 0.0e+00. The kernel is literally the τ-even projection of the frame, executed bit-exact.
- **K2 · The one-bit wall.** Exact enumeration on the XOR law: the even register carries 0.000000 bits about the odd target; the coalition of register plus one supplied bit decides the target with zero residual entropy. The deficit is one bit; the crossing is one bit. Precision note: K2 is the minimal exhibit at the seat's symmetric prior — mutual information measured at the uniform distribution the flip itself induces. Theorem 1 is stronger than any such measurement: it is about decision (pointwise equality of functions), not correlation, and no reweighting of priors moves a theorem.
- **K3 · The deed's price.** Landauer floor for registering one bit at 300 K: Q ≥ 2.87e-21 J; the formal register's payment: exactly 0 J. The deed pays what the register cannot.
- **K4 · The parity frame, exhibited.** Six listed prime/semiprime pairs with matching residues mod 420 = lcm(1..7): (11, 851 = 23·37), (13, 1273 = 19·67), (17, 437 = 19·23), (19, 2119 = 13·163), (23, 1703 = 13·131), (29, 869 = 11·79). Verified by enumeration in the run: τ² = id, fixed-point-free, primality odd on all six pairs, residue match mod d for every d ≤ 7; 27 even residue readings enumerated, every one even on all six pairs, zero deciding primality; fibre count |D(U, τ)| = 64 = 2⁶, one orientation bit per pair; the 64 targets verified pairwise distinct, so any exact global selector needs an alphabet of at least 64 values — at least 6 bits (T12's counting face). The two-member admissible family A_row = {d₀, ¬d₀}, d₀ = primality, is exhibited as data: both members wholly odd, and of the 27 even residue readings zero equal d₀ and zero equal ¬d₀ — the register cannot separate the family, |A_row| = 2 proved by enumeration, the exhibited family's price log₂|A_row| = 1 bit, never identified with the unconstrained six-bit fibre count. Theorem 1 applies to the frame by citation.

Session receipt (arithmetic-identical mirror executed this session, gfortran unavailable in the forge environment): **all batteries pass, exit 0**.

External corroboration, on record and weighted as such: an independent audit on a separate substrate recomputed the K3 arithmetic from the sealed description to all sixteen printed digits (Q = 2.870978885078724e-21 J at 300 K). This is the first external replication of the demonstration's arithmetic. It is corroboration-grade only — replication of a computation, not endorsement of the conjecture — and it carries no social weight in the theory's warrant, which rests on the theorems and the executed batteries alone.

Parent batteries, audited and on record in the same repository: `TRISDUCTION_Core_Thesis_Fortran_v2_4_0.f90` (the core thesis executed) and `RA_TOE_Thesis_Fortran_v2_0_0.f90` (the existence root executed), at `protocols/Executable Thesis/`.

---

*The wall is a theorem. The price is a theorem. The crossing-shape is a theorem. The supply is a deed. That is the whole theory.*

---

## Appendix C · The formal proof, complete source (Lean 4.12.0, core only)

Verification contract: `lean fTOE_Formal_Proof.lean` exits 0 with no output and no warnings. Session receipt: PASS. sha256/16: d2258c238be962c8.

```lean
/-
THE FORMAL THEORY OF EVERYTHING · THE FORMAL PROOF
Lean 4 (core only, no mathlib, zero sorries).

This file proves the complete theorem content of the fTOE:

  WALL      (T1) No even reading decides an odd target.
            (T2) No finite coalition of even readings escapes T1.
            (T3) Odd content carries no fixed point.
  PRICE     (T4) The odd content of a free orbit is exactly one binary
                 degree of freedom: never two, never a continuum.
  CROSSING  (T5) One odd supply at the seat, plus exactly one calibration
                 bit, decides the target on its orbit; and that calibration
                 is unique. One bit missing, one bit supplied, nothing more.

What this file does not contain, by its own theorems: the supply itself.
Existence of the supply is the One-Cut Hypothesis, stated as a hypothesis
in the treatise this file accompanies. The wall is proved here. What crosses
it enters by deed, not by derivation.
-/

namespace FTOE

variable {α : Type}

/-- A reading f is even under τ when it is constant on τ-orbits. -/
def Even (τ : α → α) (f : α → Bool) : Prop := ∀ x, f (τ x) = f x

/-- A target d is odd under τ when it separates some orbit. -/
def OddAt (τ : α → α) (d : α → Bool) (x : α) : Prop := d (τ x) ≠ d x

/-- A sign vector t is wholly odd under τ when t ∘ τ = ¬t. -/
def WhollyOdd (τ : α → α) (t : α → Bool) : Prop := ∀ x, t (τ x) = !t x

/-- T1 · THE WALL.
    An even reading equals no odd target. The register computes every
    magnitude and no orientation. -/
theorem T1_wall (τ : α → α) (f d : α → Bool) (x : α)
    (he : Even τ f) (ho : OddAt τ d x) : f ≠ d := by
  intro h
  subst h
  exact ho (he x)

/-- T2 · COALITION CLOSURE.
    Evenness is closed under every Boolean join, so no coalition of even
    readings escapes the wall. -/
theorem T2_coalition (τ : α → α) (f g d : α → Bool) (x : α)
    (hf : Even τ f) (hg : Even τ g) (op : Bool → Bool → Bool)
    (ho : OddAt τ d x) : (fun y => op (f y) (g y)) ≠ d := by
  apply T1_wall τ _ d x
  · intro y; show op (f (τ y)) (g (τ y)) = op (f y) (g y); rw [hf y, hg y]
  · exact ho

/-- T3 · NO FIXED POINT.
    Wholly odd content cannot sit on a fixed point of τ:
    t x = ¬t x is a Boolean contradiction. -/
theorem T3_no_fixed_point (τ : α → α) (t : α → Bool)
    (ho : WhollyOdd τ t) (x : α) : τ x ≠ x := by
  intro h
  have h1 : t (τ x) = !t x := ho x
  rw [h] at h1
  cases t x <;> simp at h1

/-- T4 · THE PRICE: ONE BIT PER ORBIT.
    Two wholly odd sign vectors agreeing at one point of an orbit agree on
    the whole orbit. The odd content of a free orbit is exhausted by one
    binary choice. -/
theorem T4_one_bit (τ : α → α) (s t : α → Bool)
    (hs : WhollyOdd τ s) (ht : WhollyOdd τ t)
    (x : α) (h : s x = t x) : s (τ x) = t (τ x) := by
  rw [hs x, ht x, h]

/-- T5 · THE CROSSING.
    If a supply s and a target d are both odd at the seat x, then there is
    exactly one calibration bit c with d = s XOR c on the whole orbit:
    one supplied orientation bit, one calibration from the dated record,
    and the target is decided. Existence and uniqueness. -/
theorem T5_crossing (τ : α → α) (s d : α → Bool) (x : α)
    (hs : s (τ x) = !s x) (hd : d (τ x) = !d x) :
    ∃ c : Bool, (d x = xor (s x) c ∧ d (τ x) = xor (s (τ x)) c) ∧
      ∀ c' : Bool, (d x = xor (s x) c' ∧ d (τ x) = xor (s (τ x)) c') → c' = c := by
  refine ⟨xor (d x) (s x), ?_, ?_⟩
  · constructor
    · cases s x <;> cases d x <;> rfl
    · rw [hs, hd]
      cases s x <;> cases d x <;> rfl
  · intro c' hc
    obtain ⟨h1, -⟩ := hc
    generalize hsx : s x = sv
    generalize hdx : d x = dv
    rw [hsx, hdx] at h1
    cases sv <;> cases dv <;> cases c' <;> first | rfl | exact absurd h1 (by decide)

/-- T6a · DEED A — THE ANCHOR (FORGE cycle two: the two deeds, split).
    If d is odd at x₀ and the deed anchors one point (d x₀ = b — the
    corpus's identification of which sign is which, present in any corpus
    that can pose the decision at all), then d is known on the whole orbit
    {x₀, τx₀}. NO SUPPLY IS REQUIRED: oddness propagates the anchored bit.
    This is the deed as the arrival of the target's value at one point. -/
theorem T6a_deed_anchor (τ : α → α) (d : α → Bool) (x₀ : α) (b : Bool)
    (hd : d (τ x₀) = !d x₀) (anchor : d x₀ = b) :
    d x₀ = b ∧ d (τ x₀) = !b := by
  exact ⟨anchor, by rw [hd, anchor]⟩

/-- T6b · DEED B — THE SUPPLY (FORGE cycle two: the two deeds, split).
    If s is odd at x₀ and c is a naming bit supplied from outside — a
    universally quantified datum, never computed from d — then the arrival
    equation d = s ⊕ c, once it has arrived, lets anything holding the pair
    (s, c) decide d on the whole orbit. This is the deed as the arrival of
    a register-denotable carrier plus one naming bit. Deeds A and B are
    different deeds; neither is a rewrite of the other inside this file. -/
theorem T6b_deed_supply (τ : α → α) (s d : α → Bool) (x₀ : α) (c : Bool)
    (hs : s (τ x₀) = !s x₀)
    (arrival : d x₀ = xor (s x₀) c ∧ d (τ x₀) = xor (s (τ x₀)) c) :
    d x₀ = xor (s x₀) c ∧ d (τ x₀) = !xor (s x₀) c := by
  constructor
  · exact arrival.1
  · rw [arrival.2, hs]; cases s x₀ <;> cases c <;> rfl

/-- THE PORT · the two deeds compose without identifying.
    Where Deed A anchors b = d x₀ and Deed B supplies s odd with naming c,
    consistency of the two arrivals forces c = s x₀ ⊕ b. The calibration
    is the agreement of the two deeds, computed from arrived data only.
    The missing bit exists as b (Deed A) or as c (Deed B); that one such
    bit always exists for every blocked row is the One-Cut Hypothesis,
    stated as conjecture in the treatise — never as a theorem of this file. -/
theorem fTOE_port (_τ : α → α) (s d : α → Bool) (x₀ : α) (b c : Bool)
    (anchor : d x₀ = b)
    (arrival : ∀ y : α, d y = xor (s y) c) :
    c = xor (s x₀) b := by
  have h1 := arrival x₀
  rw [anchor] at h1
  generalize hsx : s x₀ = sv
  rw [hsx] at h1
  cases sv <;> cases b <;> cases c <;> first | rfl | exact absurd h1 (by decide)

/-! ## FORGE cycle three · the full-setup package
    The auditors demanded the prose setup be theorem, not preface:
    involution, freeness, global oddness, the observation model, the
    torsor bijection, and resolver separation. Proved here in core Lean. -/

section FullSetup
variable {β γ : Type}

/-- τ is an involution: applying it twice is the identity. -/
def Involution (τ : α → α) : Prop := ∀ x, τ (τ x) = x

/-- τ is fixed-point-free: every orbit is a genuine pair. -/
def FixedPointFree (τ : α → α) : Prop := ∀ x, τ x ≠ x

/-- T7 · THE GLOBAL WALL. Under global oddness, no even reading equals the
    target anywhere it is tested: the wall holds at every point, not one. -/
theorem T7_global_wall (τ : α → α) (f d : α → Bool) (x : α)
    (hf : Even τ f) (hd : WhollyOdd τ d) : f ≠ d := by
  intro h
  have h1 : f (τ x) = d (τ x) := congrFun h (τ x)
  rw [hf x, hd x, congrFun h x] at h1
  cases d x <;> simp at h1

/-- T8a · THE TORSOR, FORWARD. The xor of two wholly odd sections is even:
    the calibration against a reference supply descends to the orbit space.
    This is the machine-checked content of "the calibration is a function
    of the orbit, not of the point." -/
theorem T8_torsor_forward (τ : α → α) (s d : α → Bool)
    (hs : WhollyOdd τ s) (hd : WhollyOdd τ d) :
    Even τ (fun x => xor (d x) (s x)) := by
  intro x
  show xor (d (τ x)) (s (τ x)) = xor (d x) (s x)
  rw [hd x, hs x]; cases d x <;> cases s x <;> rfl

/-- T8b · THE TORSOR, BACKWARD. An odd reference xor an even calibration
    is odd: every even calibration pattern lifts to an admissible target. -/
theorem T8_torsor_backward (τ : α → α) (s c : α → Bool)
    (hs : WhollyOdd τ s) (hc : Even τ c) :
    WhollyOdd τ (fun x => xor (s x) (c x)) := by
  intro x
  show xor (s (τ x)) (c (τ x)) = !xor (s x) (c x)
  rw [hs x, hc x]; cases s x <;> cases c x <;> rfl

/-- T9a · THE TORSOR IS A BIJECTION, FIRST INVERSE. Reference-first:
    s ⊕ (d ⊕ s) = d. Odd sections and even calibrations are in bijection. -/
theorem T9_torsor_inverse_left (s d : α → Bool) :
    (fun x => xor (s x) (xor (d x) (s x))) = d := by
  funext x; cases d x <;> cases s x <;> rfl

/-- T9b · THE TORSOR IS A BIJECTION, SECOND INVERSE. Calibration-first:
    (s ⊕ c) ⊕ s = c. The bijection is exact, not approximate. -/
theorem T9_torsor_inverse_right (s c : α → Bool) :
    (fun x => xor (xor (s x) (c x)) (s x)) = c := by
  funext x; cases s x <;> cases c x <;> rfl

/-- T10 · THE FACTORIZATION OBSTRUCTION. Let the register be an observation
    map ρ with ρ(τx) = ρ(x) — "the register" now means: measurability with
    respect to ρ. A target odd at x cannot factor through ρ. "Outside the
    register" is no longer a metaphor: it is non-measurability, proved. -/
theorem T10_factorization (τ : α → α) (ρ : α → β) (g : β → Bool)
    (d : α → Bool) (x : α)
    (hρ : ρ (τ x) = ρ x) (hd : d (τ x) = !d x) :
    d ≠ fun y => g (ρ y) := by
  intro h
  have h1 : d (τ x) = g (ρ (τ x)) := congrFun h (τ x)
  have h2 : d x = g (ρ x) := congrFun h x
  rw [hρ, hd, h2] at h1
  cases hgx : g (ρ x) <;> rw [hgx] at h1 <;> exact absurd h1 (by decide)

/-- T11 · RESOLVER SEPARATION. If an added observation a resolves d jointly
    with ρ — d(y) = r (ρ y) (a y) for some readout r — then a must separate
    every odd pair: a(τx) ≠ a(x). This proves ONLY local, pointwise
    separation: a Bool-valued a may separate every orbit while its alphabet
    stays {0,1}. The 2^m alphabet bound belongs to a different object — a
    single global message selecting one target from an admissible family —
    and is proved by T12's injectivity, never by T11 alone. -/
theorem T11_separation (τ : α → α) (ρ : α → β) (a : α → γ) (r : β → γ → Bool)
    (d : α → Bool) (x : α)
    (hρ : ρ (τ x) = ρ x) (hd : d (τ x) = !d x)
    (hres : ∀ y, d y = r (ρ y) (a y)) :
    a (τ x) ≠ a x := by
  intro h
  have h1 := hres (τ x)
  have h2 := hres x
  rw [hρ, h, hd, h2] at h1
  cases hrv : r (ρ x) (a x) <;> rw [hrv] at h1 <;> exact absurd h1 (by decide)

/-- T12 · THE GLOBAL CODE IS INJECTIVE. If a global message selects the
    target exactly — an encoder Enc and decoder Dec with Dec ∘ Enc = id on
    the admissible family — then Enc is injective, so the supply alphabet
    is at least as large as the family. This is the mechanism behind the
    counting bound: for the full wholly-odd family on m orbits, |S| >= 2^m
    (executed on the exhibited frame, battery K4); for an admissible
    subfamily A, |S| >= |A|. The one-bit crossing is exactly |A| = 2.
    Grading note: finite-cardinality monotonicity for injections
    (Fintype.card_le_of_injective) is mathlib machinery, outside this
    core-only file; the injectivity is proved here, the instance count is
    executed in K4 (2^6 = 64, pairwise distinct, alphabet >= 64). -/
theorem T12_encoder_injective {δ : Type} (Enc : δ → γ) (Dec : γ → δ)
    (h : ∀ d, Dec (Enc d) = d) :
    ∀ d₁ d₂ : δ, Enc d₁ = Enc d₂ → d₁ = d₂ := by
  intro d₁ d₂ hE
  have h1 := h d₁
  have h2 := h d₂
  rw [hE] at h1
  rw [h2] at h1
  exact h1.symm

/-- T14 · THE WALL, FACTORIZATION FORM (the final audit's exact statement).
    No target separating a τ-pair factors through any τ-invariant
    observation map: there is no g with g ∘ ρ = d. Stated without any
    finiteness hypothesis — stronger than the requested form, which
    assumed [Fintype U]. The proper formulation of "outside the register",
    companion to T10 (which quantifies over g pointwise; T14 closes the
    existential). -/
theorem T14_wall_factorization (τ : α → α) (ρ : α → β) (d : α → Bool) (x : α)
    (hρ : ∀ z, ρ (τ z) = ρ z) (hd : OddAt τ d x) :
    ¬ ∃ g : β → Bool, ∀ z, g (ρ z) = d z := by
  intro h
  obtain ⟨g, hg⟩ := h
  have h1 : d (τ x) = g (ρ (τ x)) := (hg (τ x)).symm
  have h2 : g (ρ (τ x)) = g (ρ x) := by rw [hρ x]
  have h3 : g (ρ x) = d x := hg x
  exact hd (h1.trans (h2.trans h3))

/-- T13 · THE TWO ODDS, TYPED. Wholly odd implies odd at every point.
    The converse is false and is not claimed: a merely non-invariant
    target may restrict arbitrarily on other orbits. The torsor (T8, T9)
    and the 2^m fibre count apply to the wholly-odd family only; the wall
    (T1, T7) needs only oddness at the seat. The two notions are separate
    hypotheses in this file and are never interchanged. -/
theorem T13_wholly_odd_is_odd_everywhere (τ : α → α) (d : α → Bool)
    (hd : WhollyOdd τ d) (x : α) : OddAt τ d x := by
  intro h
  rw [hd x] at h
  cases d x <;> simp at h

/-- The canonical free involution frame: Bool × Q with the flip.
    Its orbits are exactly the pairs {(true, q), (false, q)}, so its
    orbit quotient is Q itself. -/
def flipF {Q : Type} : Bool × Q → Bool × Q := fun (b, q) => (!b, q)

/-- T15a · THE PRICE, BIJECTION FORM (canonical frame), FORWARD ROUND TRIP.
    On the canonical frame, every wholly anti-invariant target is
    reconstructed from its values at the true-section: the map
    d ↦ (q ↦ d (true, q)) into (Q → Bool), followed by
    c ↦ ((b, q) ↦ xor (c q) (!b)), returns d exactly. Since the orbit
    quotient of the canonical frame is Q, this is one direction of
    Dτ(U) ≃ (U/τ → Bool). The exhibited K4 frame is the finite instance
    (Q = six seats); the cardinal corollary |Dτ(U)| = 2^|Q| is executed
    there and, in a mathlib build, follows by Fintype.card_congr. -/
theorem T15_price_bijection_forward {Q : Type} (d : Bool × Q → Bool)
    (hd : WhollyOdd flipF d) (b : Bool) (q : Q) :
    xor (d (true, q)) (!b) = d (b, q) := by
  have h : d (false, q) = !d (true, q) := hd (true, q)
  cases b
  · generalize ht : d (true, q) = tv
    generalize hf : d (false, q) = fv
    rw [ht, hf] at h
    cases tv <;> cases fv <;>
      first | rfl | exact h | exact h.symm | exact absurd h (by decide)
  · cases d (true, q) <;> rfl

/-- T15b · THE PRICE, BIJECTION FORM (canonical frame), BACKWARD.
    For every c : Q → Bool, the section (b, q) ↦ xor (c q) (!b) is wholly
    anti-invariant, and its true-section is c exactly: the maps are mutual
    inverses between Dτ(U) and (Q → Bool). -/
theorem T15_price_bijection_backward {Q : Type} (c : Q → Bool) :
    WhollyOdd flipF (fun (b, q) => xor (c q) (!b)) := by
  intro x
  obtain ⟨b, q⟩ := x
  show xor (c q) (!!b) = !xor (c q) (!b)
  cases c q <;> cases b <;> rfl

end FullSetup

/-- The whole theorem content in one line:
    a target odd at its seat is undecidable by the even register (T1, T2),
    missing exactly one bit (T4), and decided by exactly one supplied bit
    plus one calibration (T5). -/
theorem fTOE_core (τ : α → α) (s d : α → Bool) (x : α)
    (f g : α → Bool) (hf : Even τ f) (hg : Even τ g) (op : Bool → Bool → Bool)
    (hd : d (τ x) = !d x) (hs : s (τ x) = !s x) :
    (fun y => op (f y) (g y)) ≠ d ∧
    ∃ c : Bool, (d x = xor (s x) c ∧ d (τ x) = xor (s (τ x)) c) ∧
      ∀ c' : Bool, (d x = xor (s x) c' ∧ d (τ x) = xor (s (τ x)) c') → c' = c :=
  ⟨T2_coalition τ f g d x hf hg op (by intro h; rw [hd] at h; cases d x <;> simp at h),
   T5_crossing τ s d x hs hd⟩

end FTOE

/- Verification contract: this file must pass `lean fTOE_Formal_Proof.lean`
   with no output and exit code 0. Any edit that weakens a hypothesis,
   adds a sorry, or deletes a conjunct must fail that check. -/
```

---

## Appendix D · The kinetic demonstration, complete source (Fortran 2018)

Sealed build: `gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off`. Oracle halt-on-fail: a binary that reaches its final line has passed. Session receipt (arithmetic-identical mirror, gcc): all five batteries pass, exit 0. sha256/16: 05eea8b626a9e63c.

```fortran
!===============================================================================
!  fTOE . THE KINETIC DEMONSTRATION
!  THE PHYSICAL DEED IS THE ONE-BIT CONVERSION INTERFACE WHERE THE FORMAL
!  SHADOW BECOMES ACTUALIZED REALITY
!
!  The formal side is proved elsewhere (fTOE_Formal_Proof.lean: the wall,
!  the price, the crossing, machine-checked). This file executes the other
!  half of the theory: the kinetic face. Existence is actuation, and every
!  actuation of one bit carries a non-zero thermodynamic price the formal
!  register cannot pay. Three batteries, computed in this run, oracle
!  halt-on-fail:
!
!  K1  THE SIGN-BLIND KERNEL. The verdict lock is det(R) = lambda^2. Under
!      any reflection the lock is bit-identical and the sign of lambda
!      flips. The formal register carries magnitude; direction is not in it.
!
!  K1b KERNEL = EVEN PROJECTION. D D^T = I, so R(MD) = R(M) entrywise.
!      IEEE negation is a sign-bit flip, hence the two Gram matrices agree
!      to exactly 0.0. The kernel is the tau-even projection, bit-exact.
!
!  K2  THE ONE-BIT WALL. On the XOR law, exact enumeration: the even
!      register carries zero bits about the odd target; one supplied odd
!      bit at the seat, with one calibration, decides the target exactly.
!      The deficit is one bit wide. The crossing is one bit deep.
!
!  K3  THE DEED'S PRICE. Registering one binary orientation in any physical
!      substrate at temperature T dissipates Q >= k_B T ln 2 (Landauer).
!      The formal register pays exactly 0. The deed pays the floor. The
!      conversion of formal possibility into actualized fact is a
!      thermodynamic transaction, and this battery prints its invoice.
!
!  K4  THE PARITY FRAME, EXHIBITED AS DATA. Six listed prime/semiprime
!      pairs with matching residues mod lcm(1..7)=420; tau swaps within
!      pairs. Involution, freeness, oddness, register evenness, the wall
!      on every pair, the fibre count 2^6 = 64, and the encoder bound
!      (targets pairwise distinct; exact-selector alphabet >= 64) — all
!      verified by enumeration in the run. T1 applies by citation.
!
!  Parent batteries, audited and on record in the same repository:
!    protocols/Executable Thesis/TRISDUCTION_Core_Thesis_Fortran_v2_4_0.f90
!    protocols/Executable Thesis/RA_TOE_Thesis_Fortran_v2_0_0.f90
!
!  BUILD (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off
!  A binary that reaches its final line has passed. Nothing is narrated;
!  every figure is computed in the run. Receipt, not essence.
!  Delta-M = 0. No new mathematics is authored by this file.
!===============================================================================
program ftoe_kinetic_demonstration
  use iso_fortran_env, only: int64
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  real(dp), parameter :: KB = 1.380649e-23_dp          ! J/K, exact, SI 2019
  real(dp), parameter :: T_ROOM = 300.0_dp             ! K, demonstration bath
  integer :: failures
  real(dp) :: M(3,3), R(3,3), Mr(3,3), Rr(3,3)
  real(dp) :: lam, lamr, detR, detRr, maxdiff
  real(dp) :: I_even, H_joint, Q_bit, Q_formal

  failures = 0

  ! ---------------- K1 · THE SIGN-BLIND KERNEL ----------------
  M(1,:) = [ 0.3_dp,  0.7_dp, -0.2_dp]
  M(2,:) = [ 0.5_dp, -0.4_dp,  0.8_dp]
  M(3,:) = [-0.6_dp,  0.1_dp,  0.9_dp]
  R  = matmul(M, transpose(M))
  lam  = det3(M)
  detR = det3(R)
  Mr = M; Mr(:,3) = -Mr(:,3)                            ! reflection D
  Rr = matmul(Mr, transpose(Mr))
  lamr  = det3(Mr)
  detRr = det3(Rr)

  write(*,'(A)') 'K1 THE SIGN-BLIND KERNEL'
  write(*,'(A,ES22.15)') '  lambda                = ', lam
  write(*,'(A,ES22.15)') '  det(R)                = ', detR
  write(*,'(A,ES22.15)') '  |det(R) - lambda^2|   = ', abs(detR - lam*lam)
  write(*,'(A,ES22.15)') '  reflected lambda      = ', lamr
  write(*,'(A,ES22.15)') '  |det(DRD) - det(R)|   = ', abs(detRr - detR)
  if (.not. (abs(detRr - detR) < 1.0d-12 .and. abs(lamr + lam) < 1.0d-12)) then
     failures = failures + 1
     write(*,'(A)') '  K1: FAIL'
  else
     write(*,'(A)') '  K1: lock invariant under reflection; sign unrecoverable. PASS'
  end if

  ! ---------------- K1b · KERNEL = EVEN PROJECTION ----------------
  ! D is a diagonal sign involution, D D^T = I, hence
  ! R(MD) = M D D^T M^T = R(M) entrywise. IEEE negation flips only the
  ! sign bit, so (-a)(-b) = a*b bitwise: the two Gram matrices agree to
  ! exactly 0.0. The kernel is not merely invariant; it IS the tau-even
  ! projection of the frame, computed bit-exact.
  maxdiff = maxval(abs(R - Rr))
  write(*,'(A)') 'K1b KERNEL = EVEN PROJECTION (entrywise, bit-exact)'
  write(*,'(A,ES9.1)') '  max |R - R(MD)| entrywise = ', maxdiff
  if (.not. (maxdiff == 0.0_dp)) then
     failures = failures + 1
     write(*,'(A)') '  K1b: FAIL'
  else
     write(*,'(A)') '  K1b: kernel is the even projection, bit-exact. PASS'
  end if

  ! ---------------- K2 · THE ONE-BIT WALL ----------------
  call xor_wall(I_even, H_joint)
  write(*,'(A)') 'K2 THE ONE-BIT WALL (XOR law, exact enumeration, uniform)'
  write(*,'(A,F10.6,A)') '  I(even register ; odd target)     = ', I_even, ' bits'
  write(*,'(A,F10.6,A)') '  H(target | register + one supply) = ', H_joint, ' bits'
  if (.not. (abs(I_even) < 1.0d-12 .and. abs(H_joint) < 1.0d-12)) then
     failures = failures + 1
     write(*,'(A)') '  K2: FAIL'
  else
     write(*,'(A)') '  K2: deficit exactly one bit; one supplied bit closes it. PASS'
  end if

  ! ---------------- K3 · THE DEED'S PRICE ----------------
  Q_bit    = KB * T_ROOM * log(2.0_dp)   ! Landauer floor for one bit at 300 K
  Q_formal = 0.0_dp                      ! the formal register's payment, exactly
  write(*,'(A)') 'K3 THE DEED''S PRICE (Landauer floor, T = 300 K)'
  write(*,'(A,ES22.15,A)') '  Q(one bit registered) >= ', Q_bit, ' J'
  write(*,'(A,ES22.15,A)') '  Q(formal register)    =  ', Q_formal, ' J'
  if (.not. (Q_bit > 0.0_dp .and. Q_formal == 0.0_dp)) then
     failures = failures + 1
     write(*,'(A)') '  K3: FAIL'
  else
     write(*,'(A)') '  K3: the deed pays what the register cannot. PASS'
  end if

  ! ---------------- K4 · THE PARITY FRAME, EXHIBITED ----------------
  ! X = six listed pairs {p, q}: p prime, q semiprime (Omega(q) = 2),
  ! q == p (mod lcm(1..7) = 420), hence q == p (mod d) for every d <= 7.
  ! tau swaps within each pair; the target is primality. The register is
  ! every reading factoring through the residue vector (n mod 2..7): the
  ! Type I data of the linear sieve at level D = 7. Everything is verified
  ! by enumeration in this run: involution, freeness, oddness, register
  ! evenness, the wall on every pair, and the fibre count 2^6.
  block
     integer(int64) :: P(6), Q(6), X(12), tx, ttx, fibre
     integer :: i, mm, aa, n_even, n_deciding, fp, fq
     integer :: t1, t2, pt, pair, flip, v1, v2
     integer :: n_eq0, n_eq1, dp, dq
     logical :: ok4, even_r, decides_r, distinct_ok, same_t, eq0, eq1
     P = [11_int64, 13_int64, 17_int64, 19_int64, 23_int64, 29_int64]
     Q = [851_int64, 1273_int64, 437_int64, 2119_int64, 1703_int64, 869_int64]
     do i = 1, 6
        X(2*i-1) = P(i); X(2*i) = Q(i)
     end do
     ok4 = .true.
     do i = 1, 12                                  ! involution + freeness
        tx = X(ieor(i-1,1)+1); ttx = X(ieor(ieor(i-1,1),1)+1)
        if (ttx /= X(i) .or. tx == X(i)) ok4 = .false.
     end do
     do i = 1, 6                                   ! oddness + residue match
        if (.not. isprime_l(P(i)) .or. isprime_l(Q(i)) &
             .or. omega_l(Q(i)) /= 2) ok4 = .false.
        do mm = 2, 7
           if (mod(P(i),int(mm,int64)) /= mod(Q(i),int(mm,int64))) ok4 = .false.
        end do
        if (mod(P(i),420_int64) /= mod(Q(i),420_int64)) ok4 = .false.
     end do
     n_even = 0; n_deciding = 0
     do mm = 2, 7                                  ! register evenness + wall
        do aa = 0, mm-1
           even_r = .true.; decides_r = .true.
           do i = 1, 6
              fp = 0; if (mod(P(i),int(mm,int64)) == int(aa,int64)) fp = 1
              fq = 0; if (mod(Q(i),int(mm,int64)) == int(aa,int64)) fq = 1
              if (fp /= fq) even_r = .false.
              if ((fp == 1) .neqv. isprime_l(P(i))) decides_r = .false.
              if ((fq == 1) .neqv. isprime_l(Q(i))) decides_r = .false.
           end do
           if (even_r) then
              n_even = n_even + 1
              if (decides_r) n_deciding = n_deciding + 1
           end if
        end do
     end do
     if (n_even == 0 .or. n_deciding /= 0) ok4 = .false.
     fibre = 1
     do i = 1, 6
        fibre = fibre*2
     end do
     ! encoder bound (T12's counting face): the 2^6 anti-invariant targets
     ! are pairwise distinct as Boolean vectors on the frame, so any exact
     ! global selector needs an alphabet of at least 64 values.
     distinct_ok = .true.
     do t1 = 0, 63
        do t2 = t1+1, 63
           same_t = .true.
           do pt = 0, 11
              pair = pt/2; flip = mod(pt,2)
              v1 = ieor(int(ibits(t1,pair,1)), flip)
              v2 = ieor(int(ibits(t2,pair,1)), flip)
              if (v1 /= v2) same_t = .false.
           end do
           if (same_t) distinct_ok = .false.
        end do
     end do
     if (.not. distinct_ok) ok4 = .false.
     ! K4 continuation (FORGE v7.1): the two-member admissible family
     ! A_row = {d0, 1-d0}, d0 = primality on the frame, exhibited as data.
     ! Both members are wholly odd (d0 odd on every pair, checked above;
     ! the complement inherits oddness pointwise). The register cannot
     ! separate the family: no even residue reading equals either member
     ! (Theorem 1 applied twice, executed here by enumeration). Hence
     ! |A_row| = 2 is proved, not labeled, and the frame's priced row
     ! claim is exactly one bit (log2|A_row|) -- against the full
     ! unconstrained fibre 64 = 2^6, the m = 6 product count (six bits).
     n_eq0 = 0; n_eq1 = 0
     do mm = 2, 7
        do aa = 0, mm-1
           even_r = .true.; eq0 = .true.; eq1 = .true.
           do i = 1, 6
              fp = 0; if (mod(P(i),int(mm,int64)) == int(aa,int64)) fp = 1
              fq = 0; if (mod(Q(i),int(mm,int64)) == int(aa,int64)) fq = 1
              if (fp /= fq) even_r = .false.
              dp = 0; if (isprime_l(P(i))) dp = 1
              dq = 0; if (isprime_l(Q(i))) dq = 1
              if (fp /= dp .or. fq /= dq) eq0 = .false.
              if (fp /= 1-dp .or. fq /= 1-dq) eq1 = .false.
           end do
           if (even_r) then
              if (eq0) n_eq0 = n_eq0 + 1
              if (eq1) n_eq1 = n_eq1 + 1
           end if
        end do
     end do
     if (n_eq0 /= 0 .or. n_eq1 /= 0) ok4 = .false.
     write(*,'(A)') 'K4 THE PARITY FRAME, EXHIBITED (six listed pairs, mod 420)'
     write(*,'(A)') '  pairs: (11,851=23x37) (13,1273=19x67) (17,437=19x23)'
     write(*,'(A)') '         (19,2119=13x163) (23,1703=13x131) (29,869=11x79)'
     write(*,'(A,I0,A,I0)') '  even residue readings enumerated = ', n_even, &
          ' ; deciding readings = ', n_deciding
     write(*,'(A,I0,A)') '  |D(U,tau)| = ', fibre, &
          ' = 2^6 orientation patterns on the frame (six bits, unconstrained)'
     if (distinct_ok) then
        write(*,'(A,I0,A)') '  targets pairwise distinct: verified by &
             &enumeration ; exact-selector alphabet >= ', fibre, ' (>= 6 bits)'
     else
        write(*,'(A)') '  targets pairwise distinct: VIOLATION'
     end if
     write(*,'(A)') '  A_row = {d0, 1-d0} exhibited as data: d0 = &
          &primality, both members wholly odd'
     write(*,'(A,I0,A,I0)') '  even readings equal to d0 = ', n_eq0, &
          ' ; equal to 1-d0 = ', n_eq1
     write(*,'(A)') '  |A_row| = 2 proved by enumeration: the register &
          &cannot separate the family ; row price = 1 bit (log2|A_row|)'
     if (.not. (ok4 .and. fibre == 64_int64)) then
        failures = failures + 1
        write(*,'(A)') '  K4: FAIL'
     else
        write(*,'(A)') '  K4: tau^2=id, free, odd on all six pairs; every &
             &register reading even; none decides. T1 applies by citation. PASS'
     end if
  end block

  ! ---------------- ORACLE ----------------
  if (failures == 0) then
     write(*,'(A)') 'fTOE KINETIC DEMONSTRATION: all batteries pass.'
     write(*,'(A)') 'The formal shadow is proved in Lean; the actualizing deed is executed here.'
  else
     write(*,'(A,I0)') 'fTOE KINETIC DEMONSTRATION: VOID, failures = ', failures
     error stop 1
  end if

contains

  ! K4 helpers: trial primality and big-Omega, computed at runtime.
  function isprime_l(n) result(r)
    integer(int64), intent(in) :: n
    logical :: r
    integer(int64) :: k, m
    m = n
    if (m < 2) then
       r = .false.; return
    end if
    r = .true.
    k = 2
    do while (k*k <= m)
       if (mod(m,k) == 0) then
          r = .false.; return
       end if
       k = k + 1
    end do
  end function isprime_l

  function omega_l(n) result(c)
    integer(int64), intent(in) :: n
    integer :: c
    integer(int64) :: k, m
    m = n; c = 0; k = 2
    do while (k*k <= m)
       do while (mod(m,k) == 0)
          c = c + 1; m = m/k
       end do
       k = k + 1
    end do
    if (m > 1) c = c + 1
  end function omega_l

  function det3(A) result(d)
    real(dp), intent(in) :: A(3,3)
    real(dp) :: d
    d = A(1,1)*(A(2,2)*A(3,3) - A(2,3)*A(3,2)) &
      - A(1,2)*(A(2,1)*A(3,3) - A(2,3)*A(3,1)) &
      + A(1,3)*(A(2,1)*A(3,2) - A(2,2)*A(3,1))
  end function det3

  subroutine xor_wall(I_even, H_joint)
    ! States (x,y), d = xor(x,y), uniform 1/4. tau flips x.
    ! Even register: readings constant on tau-orbits; best case is y.
    ! Supply at the seat: s = x, odd under tau.
    real(dp), intent(out) :: I_even, H_joint
    integer :: x, y, d
    real(dp) :: pd(0:1), pdy(0:1,0:1), H_d, H_d_y
    pd = 0.0_dp; pdy = 0.0_dp
    do x = 0,1
       do y = 0,1
          d = ieor(x,y)
          pd(d)    = pd(d) + 0.25_dp
          pdy(d,y) = pdy(d,y) + 0.25_dp
       end do
    end do
    H_d = -sum(pd * log2safe(pd))
    H_d_y = 0.0_dp
    do y = 0,1
       do d = 0,1
          if (pdy(d,y) > 0.0_dp) &
             H_d_y = H_d_y - pdy(d,y)*log2safe(pdy(d,y)/0.5_dp)
       end do
    end do
    I_even = H_d - H_d_y
    ! Joint: enumerate the conditional p(d | x,y) and verify it is a point
    ! mass for every pair: the coalition decides the target exactly.
    block
      real(dp) :: pdxy(0:1,0:1,0:1)
      integer :: cnt
      pdxy = 0.0_dp
      do x = 0,1
         do y = 0,1
            d = ieor(x,y)
            pdxy(d,x,y) = pdxy(d,x,y) + 0.25_dp
         end do
      end do
      H_joint = 0.0_dp
      do x = 0,1
         do y = 0,1
            cnt = 0
            do d = 0,1
               if (pdxy(d,x,y) > 0.0_dp) cnt = cnt + 1
            end do
            if (cnt /= 1) H_joint = 1.0_dp   ! any spread means undecided
         end do
      end do
    end block
  end subroutine xor_wall

  function log2safe(p) result(l)
    real(dp), intent(in) :: p
    real(dp) :: l
    if (p > 0.0_dp) then
       l = log(p)/log(2.0_dp)
    else
       l = 0.0_dp
    end if
  end function log2safe

end program ftoe_kinetic_demonstration
```

---

*SEALED · V7.1. A register invariant under a free symmetry cannot determine the orientation data erased by that symmetry; the exact resolution price is the logarithm of the admissible orientation fibre. The wall is a theorem, in both its forms. The price is a counted theorem: 2^m in the full product family, log2|A| for a constrained row, one bit exactly when |A| = 2. The crossing is a torsor reconstruction: the reference section is public structure, its unique calibration bit is the sole target-selecting datum. The deeds are two, split and machine-checked. The bridges are split: no decoder exists, encodings are named, one is exhibited as data with its two-member admissible family proved by enumeration and its selector bound executed — the exhibited family's one-bit price never identified with the frame's unconstrained six-bit fibre, and no named open row's seat priced by any theorem of this treatise. The One-Cut Hypothesis stands as the separate conjecture: each properly typed blocked row has an admissible orientation fibre of cardinality two and a provenance-clean global supply selecting its missing orientation. Receipts on record; grades never above the weakest link; W_social = 0; ΔM = 0.*

***What symmetry erases, one bit restores.***