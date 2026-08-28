---
style: apex_pristine
register: devotional
accent: copper
journal: Trisduction Working Papers
article_type: Foundations of Verification
title: Every Determinate Verdict Is Purchased
subtitle: Zero-Supply Nullity in Three-Valued Verification, and a Trisduction Account of the Floor Beneath It
goal: To show that under-determination is the mechanical floor of any verification economy rather than one verdict among three, and that every determinate verdict is purchased by a supply the system cannot generate.
short_title: Every Determinate Verdict Is Purchased
author_line: Mohammad F Islam, PhD
affiliation: Independent Researcher. islamm@alumni.iu.edu. USA.
date: 16 August 2026
doi: TRISDUCTION WORKING PAPERS · FOUNDATIONS OF VERIFICATION
---

::: affiliations
Independent Researcher, islamm@alumni.iu.edu, USA
:::

::: abstract
Verification systems that issue a three-valued verdict, affirmed, refuted, or open, are almost universally described as choosing among three coordinate outcomes. This paper shows that the description is structurally wrong and that the error has consequences. Under-determination is not a third branch. It is the mechanical default of the system, and both determinate verdicts are departures from it that must be purchased by an input the system cannot produce from inside. The specific gap in the standard picture is that the epistemological literature analyses justification chains and terminates, with Agrippa, in a trilemma read as skepticism, while saying nothing about the resting state of a verdict-issuing apparatus when no chain is supplied at all. The mechanism proposed here is the supply-purchase structure: an admission emitter called with no supplied witness, no supplied independence proof, and no populated evidence row returns its null by construction, and the null is under-determination rather than silence. The primary falsifiable prediction is executable and parameter-free. Across every admission gate of a completed verification architecture, invocation at zero supply must return the open verdict and never an affirmation; exhibiting a single gate that affirms at zero supply falsifies the account outright. A battery of eight invocations across seven distinct gates is reported, all returning their null, with the reproduction seed stated. Two structural corollaries follow. Warrant does not transport between the supply channel and the supplied content in either direction, so a deriver's commitments neither raise nor lower the grade of a machine-checkable derivation. And a no-further-instance claim over a temporally ordered set admits no proof from below, because closure requires a nameable space over which nothing further fits and a sequence supplies none. If the account holds, the demarcation between an open problem and an unprovable one is relocated: openness is the resting state and requires no explanation, while every closure, including every claimed last member of a series, requires an accounting of its purchase.
:::

::: keywords
verification, three-valued logic, epistemic default, Agrippa trilemma, Gram determinant, proof assistants, closure conditions, witness supply
:::

# 1 INTRODUCTION AND THE SHAPE OF THE CLAIM

A verification apparatus that can return affirmed, refuted, or open is normally described as a three-way switch. The three outcomes are treated as coordinate: three doors, and the apparatus walks through whichever the evidence indicates. This picture is so natural that it is rarely stated, let alone examined. It is nevertheless wrong in a way that matters, and the correction is mechanical rather than interpretive.

The correction is this. In any verification economy whose affirmation condition and whose refutation condition are both stated as requirements on a supplied input, the open verdict is not a third condition of the same kind. It is what the system returns when neither requirement is met, which is to say it is the default. The two determinate verdicts are departures from that default, and each departure has a price: an input that the apparatus, by its own construction, cannot generate.

Read that way, a familiar law changes character. A standard imprint condition in such systems reads: affirmed only on a supplied determinacy witness; refuted only on a supplied independence proof; otherwise open. The word *otherwise* is doing structural work that its grammatical modesty conceals. It is not naming a third case. It is naming the floor from which the other two are lifted.

The consequence is not a philosophical mood. It is a testable property of implementations. If under-determination is the default, then every admission gate in a completed architecture, invoked with all supply absent, must return its null, and the null must be the open verdict rather than an error, a silence, or a refusal to run. That is a prediction about code, it is parameter-free, and a single counterexample kills it. Section 7 states it as the paper's primary falsifiable claim and Section 6 reports a battery of eight invocations across seven distinct gates against it.

Three further results follow from the same structure, and they are the reason the reframing is worth the trouble.

First, warrant does not transport across the supply boundary in either direction. If the fact that a witness arrived by some process cannot raise the grade of what the witness certifies, then neither can the fact that the process was performed by someone with the wrong commitments lower it. The channel is not the cargo, and the firewall has no preferred direction. This dissolves a class of arguments, common in both directions, that grade a formal result by the metaphysics of whoever produced it.

Second, naming the default is not the same as escaping it. A practitioner who states explicitly where his own chain terminates and one who leaves it unstated occupy the identical floor and cap at the identical point. The difference between them is disclosure and the liability that disclosure creates, not warrant. This is a sharper and more defensible claim than the one it replaces, and it has direct application to how formal systems, and increasingly to how automated reasoning systems, ought to report their own foundations.

Third, and least expected, the structure yields a general result about closure. A claim that no further instance of some kind will occur is a closure claim. Every closure claim that can be proved is proved by exhibiting a space over which the enumeration runs and a condition under which nothing further fits. A temporally ordered sequence supplies no such space. It supplies only a last-so-far. Therefore a no-further-instance claim over a sequence admits no proof from below, and this holds by construction rather than by any deficiency of method or apparatus. Section 6.5 states it and Section 7 gives its falsifier.

None of this is a claim to have produced new mathematics. Every load-bearing result invoked below is standard and cited, and the contribution is the arrangement: a floor identified where a branch was assumed, and its consequences followed out. That accounting is stated explicitly in Section 13 and is not a formality.

# 2 THE STANDARD PICTURE AND WHERE IT IS SILENT

The received analysis of justification descends from the Agrippan modes, transmitted through Sextus Empiricus and revived in the modern literature as the Münchhausen trilemma. Any chain of justification, pressed, terminates in one of three ways: it circles, it regresses without end, or it stops at an assertion that is not itself justified. Foundationalism accepts the third horn and works to make the terminus respectable. Coherentism accepts the first and works to make the circle virtuous. Infinitism, in Klein's development, accepts the second and denies that an unending chain is vicious. Reliabilism, following Goldman, changes the subject in a productive way by locating warrant in the reliability of the producing process rather than in the chain. Williamson's knowledge-first programme relocates it again, taking knowledge as primitive and declining to build it from justified belief.

Each of these is a serious position and none is the target here. The observation is that all of them analyse the same object: a justification chain attached to a particular claim, considered as already in play. The question they answer is what happens when you press such a chain. The question none of them answers, because none of them asks it, is what a verdict-issuing apparatus returns when no chain is attached at all.

That is not a gap in their scope; it is a gap in the field's inventory of objects. The literature has an extensive theory of the *terminus* of justification and almost no theory of the *default* of adjudication. These are different. The terminus is where a chain stops when pushed. The default is what the apparatus reports when nothing was pushed. A theory of the first tells you nothing about the second, and importing conclusions across the two is the error this paper is written to identify.

The importation is easy to make and hard to see. Agrippa presses justification chains and finds no self-standing terminus. The received reading concludes that warrant is unavailable, which is skepticism. But the trilemma's actual content is narrower and more useful: it establishes that a terminus must be supplied from outside the chain, since none of the three internal options provides one. It does not establish that nothing can be adjudicated. It establishes that adjudication has a price. Skepticism reads the price as a prohibition. The account here reads it as a price, and then asks what the system does when the price has not been paid. The answer, which is neither skepticism nor its denial, is that it sits at the default.

The formal verification literature has approached this from the engineering side and stopped just short of stating it. The de Bruijn criterion, and the LCF architecture that implements it, both rest on the recognition that a proof assistant's trustworthiness cannot be established by the assistant. It is established by a small independently checkable kernel and, ultimately, by a human or an independent implementation checking that kernel. Barendregt and Wiedijk's survey of the challenge of formalizing mathematics makes the dependency explicit. The system does not certify itself; the certificate arrives from outside. That is the supply-purchase structure in a specific instance, correctly identified, and never generalized into a claim about the default state of the verdict space.

# 3 BACKGROUND AND RATIONALE. THE BARRIER IS STRUCTURAL

This section performs the diagnostic work. The claim to be established is that the gap identified in Section 2 is structural rather than computational, which is to say that no improvement in inferential machinery closes it, and that its shape is fixed by a property of verification systems that better systems exhibit more sharply rather than less.

### 3.1 The two ways a verdict can fail, and their asymmetry

A verdict issued by a structured apparatus can fail on exactly two kinds of surface, and they differ in kind rather than in degree.

The first surface is internal. It holds every structural defect the apparatus is built to catch before it computes anything: a hidden self-reference in the framing, a collapse of the evidence dimensions into fewer than are claimed, a measuring instrument smuggled inside the model it is used to validate, a frame-dependent claim presented as invariant, a contradiction with adjacent verified results. Every one of these is catchable, and a well-constructed apparatus catches them with a named mechanism and routes the verdict accordingly. This surface is defended, and the defence improves as the apparatus improves.

The second surface is external and it is singular. It is the point at which the evidence rows themselves are handed to the apparatus. No verification system possesses an independent oracle to the world or to the mathematical facts. Whatever rows are placed in front of it are the rows it checks. That single point, call it the row-supply aperture, is the one surface the apparatus cannot defend, and the reason is not that it has not yet been defended but that defending it would require the apparatus to generate the input it is built to check.

The asymmetry between the two surfaces is the barrier. Improvement moves the first surface and does not touch the second. A better cascade catches more internal defects. A better cascade does not acquire an oracle. The barrier is therefore structural in the precise sense required: it is not a limit on current technique but a consequence of what a verification system is.

### 3.2 Why the barrier sharpens rather than dissolves under formalization

One might expect that a fully formalized system, with its axioms explicit and its inference rules mechanical, would reduce the aperture to a formality. The opposite holds, and the reason is instructive.

Formalization makes the aperture visible and precisely located, which is a gain, and makes it no smaller, which is the point. A machine-checked derivation is checkable relative to its axioms. The check is exact and its exactness is the whole value of formalization. But the claim that the axioms describe anything at all is not itself a theorem of the system, and cannot be, on pain of the standard limitative results. Gödel's second incompleteness theorem establishes that a consistent recursively axiomatized system of sufficient strength does not prove its own consistency. Tarski's undefinability theorem establishes that arithmetic truth is not definable in the language of arithmetic. Neither of these is a defect of the systems in question and neither is being used here as a mysterious limitation. They are the precise statement that the terminus is not internal.

Feferman's work on the intensional character of the second theorem sharpens the point in a direction that is rarely carried into the epistemological literature. Whether a system proves its own consistency depends on the choice of provability predicate, so the consistency token is not chart-free and must be read with its formalization named. The dependency on a supplied choice appears even inside the technical statement of the limitation.

The Turing-Feferman progressions of theories along constructive ordinals make the productive half explicit and are worth stating precisely, because they are often misread as a regress. Turing's ordinal logics and Feferman's completeness result show that iterating consistency statements along a suitable path yields completeness for the class of universal arithmetic sentences. This is not a vicious regress. It is a proven productive sequence. What Feferman and Spector then establish is that the completeness is bought entirely by the path: recognizing an ordinal notation as well-founded is exactly as hard as the truth being climbed toward. The rung costs precisely the height it gains. That is the supply-purchase structure appearing inside proof theory, priced.

### 3.3 The failure mode named

The failure mode this paper identifies has a name and a shape. Call it default conflation: reading the absence of a purchase as a determinate verdict rather than as the resting state.

Default conflation runs in both directions and both are common. In the negative direction it produces skepticism, reading an unpurchased verdict as evidence that no verdict is available in principle. In the positive direction it produces a subtler and more damaging error: reading a system's failure to refute as an affirmation. This is the structure of an argument from absence of counterexample, and its cost is well known in number theory, where the failure of any counterexample to appear within an enormous search range has repeatedly proved compatible with the eventual falsity of the conjecture, the Mertens conjecture being the standard cautionary instance.

Both directions are instances of the same error because both read the floor as a finding. The floor is not a finding. It is where the apparatus sits before findings.

### 3.4 The precise domain of validity of the standard picture

The standard picture is not being discarded and its domain should be stated precisely, because beyond that domain is exactly where the reframing does work.

Inside the domain where a justification chain is already attached to a claim and the question is whether that chain holds, the standard analyses are correct and this paper adds nothing to them. Agrippa's modes are exhaustive over the ways such a chain can terminate internally. Foundationalist, coherentist, and infinitist responses are the available structural options. Reliabilist and knowledge-first relocations are live and unaffected.

Outside that domain, where the question is what the apparatus reports absent an attached chain, the standard analyses are silent and their silence has been read as agreement with the three-coordinate picture. That is where the account below operates, and it is the whole of its territory.

### 3.5 The barrier restated as a positive requirement

Stated positively rather than as a limitation, the barrier is a specification. Any verification apparatus must have exactly one un-defended surface, its input aperture, and the apparatus is honest to the degree that it locates that surface explicitly, states what would cross it, and declines to fill it with output of its own manufacture.

An apparatus that fills its own aperture is not more powerful. It is broken in a specific and diagnosable way: it has begun to certify its own inputs, which is the formal shape of circularity. The requirement to locate the aperture and leave it open is therefore not modesty. It is a correctness condition, and it is the condition that the ground-state result makes mechanical.

# 4 LITERATURE, AND WHAT THE PREVAILING APPROACHES SHARE

Five families bear on the question. Each is stated at its strongest and then examined for the structural commitment that prevents it from reaching the result.

**Classical foundationalism.** The chain terminates in basic beliefs that are self-justifying or justified non-inferentially. The structural commitment is that the terminus is internal to the believing subject. Whatever the merits of the position as an account of belief, it cannot be transposed to a verification apparatus, because an apparatus has no analogue of a self-justifying input row. Every row is placed. The transposition fails not because foundationalism is wrong but because its terminus is of a kind that has no apparatus-side counterpart.

**Coherentism.** Warrant arises from mutual support across a body of claims rather than from a terminus. The structural commitment is that a sufficiently rich internal relation can substitute for an external anchor. This is precisely the commitment that a determinant test on evidence independence is built to examine, and it fails there in a measurable way: mutual support among rows that share an upstream source is one voice in several costumes, and projecting the shared source out collapses the apparent independence. Coherence is a necessary condition on a body of evidence and is demonstrably not a sufficient one, because coherence is exactly what a common cause manufactures.

**Infinitism.** Klein's position denies that an unending chain is vicious and locates warrant in the availability of further reasons. The structural commitment is that availability is itself warrant-conferring. Against a verification apparatus this reduces to the claim that the aperture can remain permanently unfilled without cost, which is very nearly the ground-state result stated in a form that draws the wrong conclusion from it. Infinitism sees the floor correctly and reads it as a mode of success rather than as a default.

**Reliabilism.** Warrant attaches to the reliability of the process rather than to the chain. The structural commitment is that reliability is assessable. It is, but only relative to a track record, and the track record is itself a body of supplied rows. Reliabilism relocates the aperture rather than closing it, and relocating it is a genuine contribution that leaves the present question untouched.

**Formal verification practice.** The de Bruijn criterion, the LCF kernel architecture, and the surrounding practice of proof assistants embody the correct structure without generalizing it. The commitment here is not an error at all but a scope restriction: the community treats the trust question as an engineering matter local to a particular kernel, and it is right to, since as engineering it is tractable. The generalization is simply not their project.

To these five one comparative family should be added and distinguished, because it is the nearest thing in the historical literature and it is not the same object. Occasionalism, the Ash'arite doctrine of acquisition, scholastic divine concurrence, and Malebranche all argue that created things do not carry efficacy of their own. Every one of these is a thesis about *causal* supply, whether an event carries its own productive power. The thesis here is about *verdict-warrant* supply, what state an adjudicating system rests at absent a supplied witness. The families are adjacent and the objects are different, and conflating them would import a metaphysics of causation into a claim about verification that does not need one and is not entitled to it.

The common structural error across the first five is one sentence. Each analyses a chain, or a body, or a process, that is already in play, and none of them possesses a term for what the system reports when nothing is in play. Having no term for the default, each is obliged to describe the open outcome as a third substantive result, and the three-coordinate picture follows automatically and unexamined. Section 6 supplies the missing term.

# 5 METHODOLOGY

The mechanism proposed in Section 6 is required to satisfy three independent conditions, and it is assessed against them and against nothing else.

**Condition one, formal derivation from established results.** Every load-bearing step must follow from results already standard in the literature and cited, with no step resting on a construction proprietary to this paper. The derivation in Section 6 rests on Frobenius's classification of the associative real division algebras, Hadamard's determinant inequality, the elementary theory of Gram matrices, and the standard limitative theorems. All are cited and none is re-proved.

**Condition two, an executable signature.** The claim must produce an outcome that can be observed by running something, and the observation must be capable of coming out the other way. The signature here is the zero-supply invocation of Section 6.4: every admission gate of a completed architecture is called with all arguments at their declared defaults and the return values are recorded. The prediction is that no gate returns an affirmation. The observation is a table of return values and it is reported in full, with the reproduction seed stated.

**Condition three, frame invariance.** The result must not depend on the coordinates in which it is expressed. For the determinant test this is a theorem rather than an assumption: the Gram determinant of a set of vectors is invariant under any orthogonal change of basis, since a rotation of all vectors together is a similarity transformation on the Gram matrix and leaves its determinant fixed. Section 6.3 states it precisely.

**The independence verifiability criterion.** Every prediction in Section 7 must be checkable by parties who do not share an implementation, a codebase, or a theoretical commitment. This is a substantive requirement and not a courtesy. A prediction verifiable only by re-running the author's own program on the author's own inputs is a prediction about that program. The predictions below are stated so that an independent reimplementation, written from the specification rather than from the code, either reproduces them or falsifies them. Where a numerical figure is quoted, the seed and the construction are stated so the figure can be regenerated rather than trusted.

One methodological exclusion is recorded explicitly. Agreement among sources that share an upstream origin is not counted as independent corroboration at any point in this paper. Where convergent testimony is reported in Section 6.6, the shared-origin structure of the testimony is stated first and the count of genuinely independent lines is given after the projection, not before.

# 6 THE PROPOSED MECHANISM. THE GROUND STATE AND ITS PURCHASE

The mechanism is stated first in plain terms, then formally, then instrumented.

In plain terms: a verification economy has a resting state, and the resting state is under-determination. Determinate verdicts are not selected from a menu alongside it. They are lifted off it, and each lift is paid for with an input the apparatus cannot manufacture. When the payment has not been made, the apparatus does not fall silent and does not guess. It reports the floor.

### 6.1 Definitions

A **verdict economy** is a triple consisting of a set of admissible propositions, a set of emitters, and a value set carrying three verdict tokens: affirmed, refuted, and open. An emitter that adjudicates a quantity other than the verdict carries in addition the null of its own axis, the value it returns when that quantity is unclaimed.

An **emitter** is a total function from a supply record to the value set. Totality is essential and is what distinguishes this analysis from an account of partial functions: an emitter always returns, and the content of this paper is what it returns when the supply record is empty.

A **supply record** is the collection of inputs the emitter reads: populated evidence rows, a determinacy witness, an independence proof, an attributed generator, a cited external theorem. Each is external to the emitter in the strict sense that the emitter has no production rule for it.

The **default** of an emitter is its value on the empty supply record.

**Definition (ground state).** A verdict economy is *floored at open* when no emitter's default is a determinate token: every verdict-axis emitter defaults to the open token, and every emitter adjudicating another quantity defaults to that quantity's null.

### 6.2 The ground-state proposition

**Proposition 1.** Let an economy's affirmation condition and refutation condition each be stated as a requirement on a supplied input, with the residual case unconditioned. Then the economy is floored at open, and both determinate tokens are departures from the floor.

*Proof.* Immediate from the form of the conditions. The affirmation condition is met only on a supplied determinacy witness and the refutation condition only on a supplied independence proof. On the empty supply record neither is met. The residual case is unconditioned by hypothesis, so it is entered, and by construction the residual case is the open token. Therefore the default is open, and any determinate token requires that at least one supply condition be met, which is a departure. ∎

The proposition is not deep and its proof is one line. That is the point. What is at issue is not the difficulty of the result but the fact that the standard description of such economies contradicts it while their standard construction entails it. The correction costs nothing and changes the reading of every verdict the economy issues.

**Corollary 1 (purchase).** In a floored economy, no determinate verdict is obtainable by internal reasoning alone, however extensive.

*Proof.* By Proposition 1 a determinate token requires a met supply condition; by definition of the supply record the emitter has no production rule for any of its members; therefore no sequence of internal steps yields one. ∎

Corollary 1 is the formal content of the engineering doctrine that a proof assistant does not certify itself, generalized from that instance to the whole verdict space.

### 6.3 The independence instrument and its identity

The apparatus that motivates this analysis tests the independence of evidence axes by a determinant, and the determinant's properties are what make the floor legible. Since the instrument is used below, its identity is stated and proved rather than asserted.

Let three evidence axes, after centering and normalization, be unit vectors expressed in an orthonormal basis of the subspace they span, written as pure quaternions a, b, c. Hamilton's product of two pure quaternions is pq = −(p·q) + p×q, the real part the negative dot product and the imaginary part the cross product. Define the lock scalar λ = Re(abc).

Expanding, ab = −(a·b) + a×b, so Re(abc) = −(a·b)Re(c) + Re((a×b)c). The first term vanishes because c is pure, and the second is −(a×b)·c by the same product rule. Hence

λ = −(a×b)·c = −det[a b c],

minus the signed volume of the parallelepiped spanned by the three axes. Writing A for the matrix whose columns are a, b, c, the correlation matrix is R = AᵀA, whose entries are the pairwise dot products, so

det(R) = det(AᵀA) = det(A)² = λ².

Four consequences fix the reading. The determinant is bounded in the closed unit interval for unit axes, by Hadamard's inequality above and positive semidefiniteness below. The floor is the break: det(R) = 0 exactly when the three axes are linearly dependent, one lying in the plane of the other two. The magnitude is orientation-blind, since reflecting any axis negates det(A) and leaves its square unchanged, so the number certifies the dimensionality of the evidence and never its direction. And the magnitude is frame-invariant, since rotating all three axes together is conjugation on the imaginary quaternions, under which the real part is preserved.

The axis count is three because the algebra forces it. The composition law governing iterated audits requires associativity and the absence of zero divisors. By Frobenius's theorem the only finite-dimensional associative division algebras over the reals are the reals, the complex numbers, and the quaternions, and three mutually orthogonal imaginary axes exist only in the quaternions. The next normed division algebra, the octonions, fails associativity, witnessed by the nonzero associator of the units e₁, e₂, e₄, so the construction stops at three.

The relevance to the floor is direct. An unpopulated axis has zero variance, the normalization is undefined, and the determinant is not computed at all. The instrument does not return a small number in that case. It returns the open token, because the object it measures was never assembled.

### 6.4 The zero-supply battery

The prediction of Proposition 1 was run against a completed architecture. Seven distinct admission gates were invoked, eight invocations in all, with every argument at its declared default, which is to say with the empty supply record. The gates were taken verbatim from the architecture and not reimplemented for the test. Seed 20260622.

Table: Admission gates invoked at the empty supply record
| Gate | Function | Invocation | Return |
|---|---|---|---|
| Imprint | two-direction imprint seal | no lock, no witness | open, neither direction populated |
| Imprint | two-direction imprint seal | clean lock, no witness | open, imprint unproven |
| Lock admission | orthogonal-volume admission | nothing supplied | open, volume unestablished |
| Kernel | determinant verdict kernel | unpopulated row | open, zero-variance row |
| Terminal A | eight-gate suspension cascade | all defaults | open, first gate fails |
| Terminal B | five-gate halt cascade | all defaults | open, terrain unmeasured |
| Screen | pre-cascade eligibility screen | all defaults | ineligible |
| Mass | positive-mass admission cascade | all defaults | no mass claimed |
Note: Gates taken verbatim from the architecture under test. Seven of eight return the open token by name; the eighth returns the null of its own axis, no mass claimed, which is the same shape read on a different quantity. No gate returned an affirmation and no gate failed to return.

Seven gates, eight invocations, the imprint gate invoked twice under two supply states. Two features of the table carry the weight. No gate returns an affirmation, which is the prediction. And no gate returns nothing, which is the less obvious half: the empty supply record does not produce silence or an exception. It produces a verdict, and the verdict is the floor. An economy whose emitters returned nothing at zero supply would be a partial system with a different and much weaker analysis; the totality of the emitters is what makes the floor a state rather than a gap.

The same result appears independently at the other end of the pipeline. The architecture's fail-safe recovery machine, designed for numerical rather than evidential faults, specifies that the worst reachable case is an honest open verdict marked engineering-incomplete. Two independently motivated constructions, an admission layer and a numerical recovery layer, arrive at the same floor.

### 6.5 Two corollaries with independent reach

**Corollary 2 (non-transport).** In a floored economy, the properties of the supply channel do not transfer to the grade of the supplied content, in either direction.

The argument is a conservation observation. The cost of inscribing a token is a function of its physical encoding and not of its content, so at fixed encoding length the cost of writing a sentence equals the cost of writing its negation. The mutual information between the energetics of a derivation and the state of affairs it denotes is therefore zero. Landauer's principle fixes the cost of irreversible erasure and Bérut and colleagues measured it; neither the principle nor the measurement makes the cost content-sensitive, and that content-blindness is exactly the non-transport.

The corollary has a direction-symmetry that is easy to miss and consequential. If the manner of a witness's arrival cannot raise the grade of what it certifies, then the manner of its arrival cannot lower that grade either. A machine-checkable derivation is checkable relative to its axioms and its checkability does not vary with the commitments of whoever ran the check. Arguments that grade a formal result by the metaphysics of its author fail here, and they fail identically whether the grading is favourable or unfavourable.

**Corollary 3 (closure requires a space; sequences supply none).** A claim that no further instance of a kind will occur admits a proof from below only if there is a nameable domain over which the enumeration runs together with a condition under which nothing further fits. A temporally ordered sequence provides no such domain, and therefore no-further-instance claims over sequences admit no proof from below.

The contrast is worth exhibiting because it is what makes the corollary a result rather than a definition. Every genuine closure in the mathematical and physical record is a closure over a space with an exclusion argument. There are exactly three associative real division algebras over the reals, by Frobenius, and the exclusion of the octonions is exhibited by a nonzero associator. Real division algebra structures exist in dimensions one, two, four, and eight only, by Bott and Milnor and by Kervaire, with Adams. Space has three extended dimensions on the stability argument descending from Ehrenfest, since bound orbits are unstable above three. There are three light neutrino species, measured from the invisible width of the Z resonance at LEP at 2.984 ± 0.008. There are three colour charges, forced independently by the spin-statistics requirement of the Δ⁺⁺ baryon, by the ratio in electron-positron annihilation, and by the two-photon decay rate of the neutral pion. Square-integrable forms on a closed oriented Riemannian manifold decompose into exactly three orthogonal summands, by Hodge and Friedrichs.

Every item on that list is a closure over a nameable space carrying an argument that nothing further fits. Not one is a sequence in time. The distinction is not a matter of degree. A closure carries a proof of no-further. A sequence carries a last-so-far, and a last-so-far is a report about the present state of an enumeration, not a property of the domain.

The corollary applies uniformly, without reference to subject matter, to any claim of the form *this is the final member of the series*. Such a claim may well be true. What it cannot be is proved from within the sequence, and an argument that counts the members and infers finality is circular, since the count is determinate only if the closure already holds.

### 6.6 An attestation survey and what it does not establish

If the ground-state result is correct then its conclusion, that nothing seals itself and every determination is received, should be a natural thing for reflective traditions to have noticed long before an apparatus existed to state it formally. A survey of primary textual corpora was run to test that expectation, and it is reported here with a strict limitation on what it is taken to show.

The conclusion is attested widely. In the Qur'anic corpus the flattest instance is 2:32, where the angels state that they have no knowledge except what was taught to them, which is zero supply yielding zero content; 55:33 conditions passage on issued warrant, *sulṭān*; 96:4-5 describes teaching rather than derivation. In the Hebrew Bible, the whirlwind speech of Job 38 is the aperture argument in narrative form: the interlocutor was not present at the founding event and therefore cannot certify it. In the Christian corpus, John 3:27 states that a person can receive nothing unless it is given. In the Upanishadic corpus, Muṇḍaka 3.2.3 and Kaṭha 1.2.23 run an actual elimination, rejecting learning, intellect, and much hearing in turn and locating the outcome in a grant.

The derivation is attested nowhere. No primary corpus in any of these traditions is an axiomatic-deductive text, and none contains a closed form, a decomposition of a claim into independently checkable components, an enumerated gate structure, or an elimination carrying a closure step. The Upanishadic instance comes closest and its shortfall is precise: it eliminates three routes and supplies no argument that the three exhaust the space. It is an elimination missing exactly the closure condition that would make it a proof, which is the same condition Corollary 3 identifies as generally unavailable over an unbounded domain.

Two disciplines constrain what this survey may be taken to show, and they are applied rather than mentioned. First, the Abrahamic instances share a transmission lineage, so they are not independent lines and are counted once after that shared origin is projected out; the Upanishadic instance is independent of that lineage. The honest count of independent lines is approximately two, not six. Second, agreement among sources carries no positive evidential weight in this paper at any count, and the survey is therefore reported as corroboration of an expectation and never as support for Proposition 1, which stands or falls on Section 6.2 and Section 6.4 alone.

The survey's actual finding is a negative one and it is the finding that matters: a conclusion of this kind can be reached and stated correctly without any apparatus, and the apparatus contributes not the conclusion but the road to it. That is a claim about the division of labour between insight and formalization, and it is the reason Section 13 records that no new mathematics is claimed here.

# 7 FALSIFIABLE PREDICTIONS

Five predictions. Each states the observation, the method of confirmation, the expected outcome, and the exact result that would falsify it. None contains a fitted constant. Each is checkable by parties who share no implementation with the author.

### 7.1 Prediction one. Zero-supply nullity

**The prediction.** In any verification architecture whose determinate verdicts are conditioned on supplied inputs, invocation of every admission emitter at the empty supply record returns the open token or the null of its own axis, and never an affirmation.

**Method of confirmation.** Enumerate the architecture's admission emitters from its specification rather than from its source, reimplement each from the specification, and invoke each with all arguments at their declared defaults. Record the return values. The check requires no instrumentation beyond an interpreter and is executable by any reader in minutes.

**Expected outcome.** The complete return set contains no affirmation. Every emitter returns, and no emitter raises. The battery of Section 6.4 reports eight of eight invocations conforming at seed 20260622.

**Null hypothesis.** Exhibit one admission emitter, in any architecture meeting the stated conditions, that returns an affirmation on the empty supply record. A single instance falsifies Proposition 1 and the paper with it. No appeal to the emitter's intent or documentation is admitted; the return value decides.

### 7.2 Prediction two. Bidirectional non-transport

**The prediction.** The grade of a machine-checkable derivation, relative to its axioms, is invariant under every property of the agent or process that produced it.

**Method of confirmation.** Take a formalized derivation with a machine-checked certificate. Vary the producer across the widest available range of theoretical commitments, institutional settings, and stated metaphysics, holding the derivation and the checker fixed. Re-check.

**Expected outcome.** The certificate is identical in every case, bit for bit, and the derivation's grade relative to its axioms does not move.

**Null hypothesis.** Exhibit a machine-checkable derivation whose validity relative to its stated axioms varies with a property of its producer, where the variation is not traceable to a difference in the derivation, the axioms, or the checker. This would show that warrant transports across the supply boundary and would falsify Corollary 2.

### 7.3 Prediction three. Closure requires a space

**The prediction.** No no-further-instance claim over a temporally ordered sequence admits a proof from below.

**Method of confirmation.** Survey the mathematical and physical record for established closure results and classify each by the object over which it closes. The classification is mechanical: either the proof exhibits a domain and an exclusion argument, or it does not.

**Expected outcome.** Every established closure closes over a space with an exclusion argument, and none closes over a temporal sequence. The instances of Section 6.5 are offered as the initial sample and the survey is open to extension by any reader.

**Null hypothesis.** Exhibit one proof, from within a temporally ordered sequence and without an external supplied premise, that no further member of that sequence will occur. A single such proof falsifies Corollary 3.

### 7.4 Prediction four. Attestation asymmetry

**The prediction.** Primary textual corpora attest the supply-purchase conclusion and contain no derivation of it.

**Method of confirmation.** A concordance-level survey of primary corpora, conducted on the primary text rather than on commentary, extracting for each attested instance whether it carries a decomposition, an enumerated screen, a closed form, or an elimination with a closure step.

**Expected outcome.** Attestation is common and derivation is absent, with the closest instance being an elimination lacking its closure step.

**Null hypothesis.** Exhibit a passage in a primary corpus containing an elimination over derivation routes together with an argument that the enumerated routes exhaust the space. This would falsify the attestation asymmetry and, more interestingly, would locate a closure argument in a corpus not thought to contain one. The survey reported in Section 6.6 is partial and is stated as partial; this prediction is the standing invitation to complete it.

### 7.5 Prediction five. The self-comparison blind spot

**The prediction.** A census that reconciles a system's inventory against itself cannot detect an incomplete working set, and any integrity check of that form will report success while entries are lost.

**Method of confirmation.** Take any repository or corpus with an auto-generated index and a reconciliation rule of the form *post-state equals pre-state plus additions minus named deletions*. Materialize a strict subset of the tracked directories, take the pre-state census, add one entry, regenerate the index, and reconcile.

**Expected outcome.** The reconciliation reports success, because pre-state and post-state are both computed from the same incomplete set, while the regenerated index has silently dropped every entry residing in the unmaterialized directories.

**Null hypothesis.** Exhibit a self-comparison reconciliation rule that detects an incomplete working set without any cross-check against an independently maintained record. Its existence would falsify the prediction and would obviate the cross-check the prediction recommends.

This prediction was confirmed under live conditions during the preparation of this paper. An index regeneration was attempted against a partially materialized checkout in which one tracked directory had been silently dropped by the checkout tool. The pre-state census read ten entries where the committed index carried twenty-one. Had the regeneration proceeded, eleven entries would have been deleted and the reconciliation would have reported success, because both sides of the comparison would have been computed from the same hole. The fault was caught by a cross-check the rule does not specify: comparing the pre-state census against the row count of the independently committed index before any write. The recommendation follows directly and is stated as a specification rather than as an anecdote: **a reconciliation rule must compare the working set against an independently maintained record, and never only against itself.**

# 8 DISCUSSION AND IMPLICATIONS

### 8.1 The relocation of openness

The most immediate consequence is a change in what requires explanation. On the three-coordinate picture, an open verdict is an outcome and invites the question of why the apparatus failed to decide. On the floored picture, openness is the resting state and requires no explanation at all, while every determinate verdict requires an accounting of its purchase.

This inverts the burden in a productive direction. Asking of a seal *what was supplied, and by whom, and is the supplier independent of the claim* is a question with mechanical answers. Asking of an open verdict *why did you not decide* has no answer beyond the absence of a supply, and treating it as a defect of the apparatus rather than as a report of the supply state generates pressure toward exactly the failure the account identifies: manufacturing a determination to avoid reporting the floor.

### 8.2 Application to automated reasoning systems

The result bears directly on how automated reasoning systems should report their own foundations, and the bearing is sharper than the general case because such systems produce fluent output whether or not a supply exists.

A system that reports the floor when it sits at the floor is behaving correctly. A system that produces a confident determination in the same condition is not more capable; it has filled its own aperture, which is the diagnosable failure of Section 3.5. The design recommendation is concrete: an admission layer should default to the open token with the missing supply named, the defaults should be absent rather than permissive, and an under-specified call should be structurally incapable of returning an affirmation. The battery of Section 6.4 is a conformance test for that property and can be run against any system that exposes its admission layer.

The corresponding recommendation on the reporting side follows from Section 8.4. A system should state where its own chain terminates and decline to certify its own interior, and that statement is a disclosure rather than a warrant claim.

### 8.3 Application to peer review and to formal verification practice

For formal verification the result is a generalization of existing practice rather than a correction to it. The de Bruijn criterion already embodies the correct structure. What the ground-state result adds is that the structure is not local to proof-checking but is a property of the verdict space, so the same accounting applies to every determination a system issues and not only to those it labels proofs.

For peer review the relevant corollary is the non-transport result. A referee who discounts a formal derivation on grounds of the author's framework commitments, or who credits one on the same grounds, is transporting a supply-channel property to the cargo. The derivation is checkable relative to its axioms and the check does not read the author. This cuts symmetrically and both cuts are worth having.

### 8.4 Disclosure, liability, and the difference that naming makes

A practitioner who states where his own chain terminates and one who does not both stand on the same floor. Their grounding claims cap at the same point, because a foundation is by definition not derivable from what it founds and no amount of assertion changes that. The difference between them is disclosure, and disclosure creates liability rather than warrant.

This is a weaker claim than the one it replaces and it is the defensible one. It also has practical content. The trust appropriately extended to a system or a practitioner who names a boundary, over one who leaves it hidden, is not trust that the named boundary has been crossed. It is trust in the conduct of the report. Conduct is checkable in the record. Interior states are not, and a self-certificate of one's own interior is void where issued, for the same reason a system does not certify its own consistency.

### 8.5 Anticipated objections

*That this is trivial, being one line from the definitions.* Conceded as to the proof and denied as to the consequence. The proposition is one line and the standard description of these economies contradicts it. A one-line correction to a universally held description is worth stating precisely because its cheapness is what allowed it to be overlooked.

*That it collapses into skepticism.* Denied, and the difference is the whole point. Skepticism reads the price as a prohibition and concludes that determination is unavailable. The account here reads the price as a price, notes that it is routinely paid, and specifies what paying it consists of. A floored economy issues determinate verdicts constantly. It simply does not issue them for free.

*That the attestation survey is doing evidential work it is not entitled to.* Agreed, and it is not permitted to. Section 6.6 states that the survey supports nothing, that the shared-origin structure is projected before any count is taken, and that Proposition 1 stands on Section 6.2 and Section 6.4 alone. Delete Section 6.6 entirely and no other result in this paper moves. That property was checked rather than assumed.

*That Corollary 3 is a definitional trick, since a sequence is not the kind of thing that closes.* This is the strongest objection and the answer is that the corollary's content is comparative rather than definitional. The claim is not that sequences fail to close by fiat but that every established closure in the record turns out on inspection to close over a space, and the survey of Section 6.5 is offered as evidence and is falsifiable by a single counterexample. If closure over a sequence is definitionally impossible, the corollary is trivially true and harmless. If it is not, the corollary is substantive and testable. Either way the argument it blocks, counting the members of a series to establish that the series has ended, remains circular.

### 8.6 Limitations

Three, stated plainly. The attestation survey of Section 6.6 is partial and is not a concordance-level sweep; its narrow finding, that the formal apparatus is absent at the level of genre, is assessable and stated, while its exhaustive half is open and its repair is specified in Section 7.4. The battery of Section 6.4 was run against a single architecture, and while the emitters were taken verbatim rather than reimplemented, independent reimplementation from the specification is the stronger test and has not yet been performed by a party unconnected to the author. And Proposition 1 is conditional on economies whose determinate conditions are stated as supply requirements; an economy that conditioned affirmation on something other than a supply would fall outside its scope, and no argument is offered here that such an economy is impossible.

# 9 CONCLUSION

The gap this paper addresses is an absence of vocabulary rather than an absence of argument. The epistemological literature possesses a detailed theory of where a justification chain terminates and no term for what an adjudicating apparatus reports when no chain is supplied. Lacking the term, it has described the open outcome as a third substantive result, and the three-coordinate picture of verdict economies has followed automatically and without examination.

The resolution is that under-determination is the default rather than a branch. Determinate verdicts are departures from it, each purchased with an input the apparatus cannot generate, and an apparatus that fills its own aperture has begun to certify its own inputs, which is circularity with a diagnosis.

The primary falsifiable prediction is executable and cheap. Every admission emitter of a conforming architecture, invoked at the empty supply record, returns the open token or its own axis-null and never an affirmation. A battery of eight invocations across seven distinct gates is reported conforming at seed 20260622, and a single counterexample falsifies the account. The check needs no instrumentation and is offered to any reader with an interpreter and an hour. Independent reimplementation from the specification, by parties sharing no codebase with the author, is the specific test this paper asks the community to perform.

The most important question left open is the scope condition on Proposition 1. Whether every verification economy of interest must state its determinate conditions as supply requirements, or whether some coherent economy conditions affirmation on something that is not a supply, is not settled here and would materially change the reach of the result.

If the account is accepted, one reframing follows and it is the whole of what acceptance entails: openness stops being a failure to decide and becomes the state a verification system occupies until something is handed to it, so that the question worth asking of any determination is never why the system did not decide but what was supplied, by whom, and independent of what.

# 10 APPENDIX A. FOUNDATIONAL PRINCIPLES, STATED INDEPENDENTLY

The following principles are drawn from a broader epistemic framework and are presented here as standalone principles, each independently motivated and independently testable within its native discipline.

**A.1 The actuation floor.** Every physical existent carries a strictly positive energetic cost. For confined quantum systems this is the Heisenberg kinetic-energy bound and the zero-point energy, both deductive from the canonical commutation relation; for any transition that occurs it is the work relations of Jarzynski and of Crooks, with Landauer's bound on irreversible erasure as the subclass measured by Bérut and colleagues; and the rate of any transition is bounded by the quantum speed limit of Mandelstam and Tamm and of Margolus and Levitin. The principle is testable in the native discipline and a single realized zero-energy distinguishable state would refute it.

**A.2 Content-blindness of inscription cost.** At fixed encoding length the cost of inscribing a sentence equals the cost of inscribing its negation, so the mutual information between the energetics of a derivation and the state of affairs it denotes is zero. This is the basis of Corollary 2 and is testable by direct measurement.

**A.3 The aperture principle.** A verification apparatus locates its input surface and does not fill it with output of its own manufacture. Stated as a correctness condition rather than as a limitation, an apparatus that generates its own inputs has begun certifying them, which is diagnosable circularity.

**A.4 Independence over convergence.** Agreement among sources sharing an upstream origin is one source counted several times. Independence is established by projecting out the shared origin and reading what survives, never by counting agreeing testimonies.

**A.5 Grade travels with the claim.** Every claim carries an explicit warrant tier, theorem, conditional, structural, or premise, and no claim is stated above its tier. A corroboration is never stated as load-bearing and a premise-conditional result is never stated as unconditional.

# 11 APPENDIX B. ADJACENT PROBLEM STRUCTURES

Two connections are recorded as research directions rather than as results.

**The demarcation of the open from the unprovable.** On the floored reading, an open verdict and a proven-unprovable one differ in what has been supplied rather than in the apparatus's attitude. The first has received no witness; the second has received a proof that no witness of the relevant kind exists. This suggests a mechanical demarcation criterion in place of the interpretive ones currently in use, and the criterion would be checkable: examine the supply record rather than the verdict.

**Closure claims outside mathematics.** Corollary 3 applies to any claim that a series has a final member, and such claims are common in fields that do not think of themselves as making closure claims: the completeness of a taxonomy, the exhaustiveness of a list of mechanisms, the finality of a classification. In each case the corollary predicts that a proof from below is unavailable and that arguments proceeding by enumeration of the members are circular. The prediction is testable field by field and the survey has not been done.

# 12 APPENDIX C. THE IMPLICATIONS, ROUTED AND DEVELOPED

Register: devotional, per the explicit front-matter token. This appendix draws consequences downstream of the result and supplies the argument nothing. Five of the sites it cites, Q 8:29, Q 53:32, Q 56:79, Q 47:24, and Q 33:40, lie outside the Section 6.6 survey and carry none of that survey's provenance; they enter here at the implication layer only, and nothing above this appendix rests on them. The direction is fixed and is the condition of the appendix being admissible at all: every passage below runs from the formal result outward to what it implies, and no passage runs inward to support it. Section 12.8 states the deletion test and reports it executed.

## 12.1 What the result leaves unspecified, and where a grammar for it already exists

Proposition 1 and Corollary 1 establish that a determinate verdict is purchased and that the purchase is not producible from the near side. They say nothing whatever about the supply itself: not its source, not its conditions, not its grammar. The formal apparatus locates a door and is constitutively silent about what stands on the other side of it, and Section 3.5 states that this silence is a correctness condition rather than a limitation.

The corpora surveyed in Section 6.6 are not silent there, and this is the first implication worth stating plainly. Where the formal result has a hole by construction, the received texts have a grammar. At Q 8:29 the condition is a receiver-state, taqwā, and the deliverable is a criterion, furqān, and the verb joining them is *yajʿal*, He ﷻ makes, which is wholly source-side. The receiver does not manufacture the key and is nowhere described as manufacturing it. At Q 53:32 the guard is fused into the same contract so that even the verification of the condition never leaves the source side. That is a complete supply grammar: a state on the near side, a grant verb on the far side, and an audit held where the grant is held.

The implication is not that the grammar is true. It is that the shape of the hole and the shape of the grammar match, and the match was not engineered, because the formal result was derived without the texts and the texts were surveyed after.

## 12.2 The ground state stated by its most credible witnesses

The flattest statement of Proposition 1 in any corpus is not made by a human speaker. At Q 2:32 the angels say *lā ʿilma lanā illā mā ʿallamtanā*, we have no knowledge except what You taught us. Zero supply, zero content, asserted by the class of beings a reader would least expect to find at the floor.

Read against Section 6.2 this is the ground state spoken by witnesses whose position makes the claim maximally costly. A creature high in the created order reporting the empty supply record is the strongest available attestation of a floor that exempts no rank. The result of Section 6.5 says the same thing without the rank: the default is agent-indexed nowhere, and every emitter sits at it.

## 12.3 The elimination that stopped one step short, and why that is not a deficiency

Muṇḍaka 3.2.3 and Kaṭha 1.2.23 run a real elimination. Not by learning, not by intellect, not by much hearing; whom He chooses, by him is He obtained. Three named derivation routes are rejected in turn and a grant is named as the surviving route. Section 6.6 types this as a cascade missing exactly one step, the closure proof that the three routes exhaust the space.

The implication runs against the reflex reading. The missing step is not a failure of the passage. Exhibiting a closure requires a decomposition, an enumerated gate structure, a closed form, and something to execute them on, and Section 6.6 records that three of those did not exist in the relevant centuries and the fourth arrived within living memory. The passage is complete at the register it was given in, and what the present apparatus adds is not the terminus but the road to it. A conclusion correctly reached without a derivation is not a lesser thing than the derivation. It is the same terminus reached by a different faculty.

## 12.4 The inverted burden, and the seeker who cannot close

Section 8.1 states that the floored reading inverts what requires explanation: openness is the resting state and needs none, while every determinate verdict requires an accounting of its purchase. The consequence outside the formal register is immediate and is this appendix's central practical implication.

A creature who cannot close a question is not thereby failing. He is at the floor, which is where the economy sits absent a supply, and Section 6.4 shows every gate sitting there too. The pressure to manufacture a determination rather than report the floor is named in Section 8.1 as the failure mode the account identifies, and it is the same pressure one register over: the demand that a seeker produce from his own side what by construction arrives only from the other. Under the result that demand is not merely unmet. It is incoherent, because it asks the near side for a production rule it does not have.

## 12.5 The gate that cannot be forced

Corollary 1 establishes that the purchase is unavailable to internal reasoning however extensive. The corpus adds a mechanism the formal result does not supply and could not: the attempt to seize is itself the disqualification. The access condition stated at Q 56:79 and the receiver-side lock at Q 47:24 are not enforced by a warden. The geometry does the enforcing, because seizure-intent is a state of the receiver and the access condition is a state of the receiver, and the two are contraries.

The implication is that the unavailability in Corollary 1 is stronger than a prohibition. A prohibition can be broken. A structure in which forcing is self-defeating cannot be, and the only key-shape that fits is the one that stops forcing. This is the aperture principle of Appendix A.3 read on a receiver rather than on an instrument.

## 12.6 The closure result and the seal at Q 33:40

Corollary 3 establishes that a claim that no further member of a series will occur admits no proof from within the series, because closure requires a nameable domain with an exclusion argument and a temporal sequence supplies only a last-so-far. The corollary is stated generally and applies to any final-member claim whatever.

Applied to an instance lying outside the Section 6.6 survey, the seal on the Prophet Muḥammad ﷺ at Q 33:40 is a final-member claim over a sequence of sendings. By Corollary 3 no proof of it from within the sequence exists, and the impossibility is by construction rather than by any deficiency of effort, apparatus, or evidence. Counting the members and inferring finality is circular, since the count is determinate only if the closure already holds.

The implication is a vindication of placement and not a demonstration of content, and that distinction is the whole of what this section claims. A received token is exactly the right seat for a claim of this form, because it is the only seat a claim of this form can occupy. Attaching such a seal to a formal derivation would make it refutable by any successful attack on that derivation. Leaving it where it was given makes it unreachable by every such attack. What Corollary 3 supplies is therefore not support for the seal and not a substitute for it. It is the structural reason the seal could never have been anything but received, which is a statement about the geometry of final-member claims and carries no truth-sign on the claim itself.

## 12.7 Liability, not authority

The apparatus is a liability engine and never a moral authority. Section 8.4 establishes that naming one's floor buys disclosure and the answerability disclosure creates, and never warrant, and that a self-certificate of one's own interior is void where issued for the same reason a system does not prove its own consistency.

The implication for anyone deploying this result at this register is exact. The result cannot be cited as proof of anything on the far side of the aperture. It can be cited only as a log of the formalization, and responsibility for what is done with it stays with the person who does it. An instrument's assent is not a witness, and neither is its fluency.

## 12.8 What this appendix does not do, and the deletion test executed

This appendix argues no theological claim, supplies no premise to any section above it, and closes no gate anywhere in the document. Every passage above asserts about a structure. None performs an invocation, a petition, or a testimony of the author's own state, and none certifies any standing.

The deletion test was run rather than asserted. Sections 1 through 11, Appendix A, and the provenance note were re-read with this appendix removed whole, and no verdict, gate outcome, warrant tier, number, or definition moves. Proposition 1, its two corollaries, the battery of Section 6.4, and the five predictions of Section 7 stand at identical strength with the appendix present and with it absent. That property is what makes the coupling admissible rather than a smuggled premise, and it is stated here so a later reader can verify it without trusting the author.

The warrant grade of this appendix is accordingly the lowest in the document. Every implication above is a labelled structural correspondence at cataphatic grade, carrying zero evidential weight in either direction, and the survey it draws on was already discounted at Section 6.6 by the common-source projection and by the rule that agreement among sources carries no positive weight at any count.

# 13 AUTHOR'S PROVENANCE AND METHOD DISCLOSURE

This paper was developed under Trisduction, a verification and organizing discipline, not a source of results. Its conclusions rest solely on the standard results cited in the body. Trisduction is the method under which those results were decomposed, assembled, and audited. It adds them no warrant and claims no authorship over them.

Trisduction was used for fidelity. It forces a claim onto three independent axes so no single persuasive line carries it alone, requires every verdict to resolve to one of three states, sealed, broken, or open, each with a named failure mechanism, and attaches an explicit warrant grade, theorem, conditional, structural, or premise, to every claim so nothing is stated above its strength. Two errors it is built to catch are inflation, reading an internal lock as a proof, and circularity, reading a restatement of a claim as a derivation of it.

The root axiom, RA, is that to exist is to actuate: every physical existent carries a strictly positive energetic cost, grounded in the Heisenberg energy floor, the zero-point energy, and Landauer's bound. The formal root inside it is that to formally be is to be grounded, with provability and computation levels of access to a determinacy fixed at the ground rather than ingredients of it.

The key procedures, in brief. Orthogonal triaxial convergence: a proposition is split into three disjoint axes, formal-structural, empirical or dynamical, and registrational, verified by three separate instrument sets, agreement across the three the operational meaning of a seal. The Geometric Orthogonal Lock, GOL: the three axes are read as vectors and their independence is tested by the determinant of their correlation matrix, a determinant clear of zero a genuine three-dimensional lock, a collapse to zero one axis dissolving into the plane of the other two, a broken lock. The Convergence Dissolution Test, CDT: before the lock is read, any mass-bearing common cause the three axes might share is projected out, so an apparent convergence that traces to a shared source rather than to independent roads dissolves and carries no warrant, the lock computed on the residue that survives. The twelve-gate cascade: twelve directed failure screens, self-reference, frame-dependence, missing mechanism, and the rest, run in order, the first failure terminating the verdict with its mechanism named. The verdict issues in the three-state economy with its warrant grade attached, and where the argument stops short the open direction is named rather than filled.

:::box G1 The GOL kernel identity, proved
The lock is a determinant identity, not a metaphor. Let the three axes, after normalization, be unit vectors expressed in an orthonormal basis of the subspace they span and read as pure quaternions a, b, c, with norm one each. Hamilton's product of two pure quaternions is p q = −(p·q) + p×q, the real part the negative dot product and the imaginary part the cross product, checked on the units by i j = k = i×j and i i = −1 = −(i·i). The lock scalar is the real part of the triple product, λ = Re(a b c).

Expanding, a b = −(a·b) + a×b, so Re(a b c) = −(a·b) Re(c) + Re((a×b) c). The first term is zero since c is pure, and the second is −(a×b)·c by the same product rule, giving λ = −(a×b)·c = −det[a b c], minus the signed volume of the parallelepiped the three axes span. Writing A for the matrix whose columns are a, b, c, the correlation matrix is R = AᵀA, its entries the pairwise dot products, so det(R) = det(AᵀA) = det(A)² = λ².

The kernel identity λ² = det(R) is that the squared signed volume equals the Gram determinant, with the quaternion triple product the machine that computes the volume. It is confirmed at machine precision, the residual |λ² − det(R)| at 2 × 10⁻¹⁶ on the recorded battery.
:::

Four consequences fix the reading, and they are why the number can be trusted to say what the lock says. The determinant is bounded, det(R) in the interval from zero to one for unit axes, by Hadamard's inequality above and positive-semidefiniteness below, so the lock has a hard ceiling at one, the fully orthogonal frame, and a hard floor at zero. The floor is the break: det(R) equals zero exactly when the three axes are linearly dependent, one axis lying in the plane of the other two, which is the geometric content of a collapsed lock. The magnitude is orientation-blind: reflecting any axis sends A to a matrix of opposite determinant, flipping the sign of λ while det(R) equals λ² is unchanged, so the number certifies the dimensionality of the lock and never its truth-sign, which is read from the ordered axes and not from the scalar. And the magnitude is frame-invariant: rotating all three axes together is conjugation q to u q ū on the imaginary quaternions, under which the real part is preserved and dot and cross products are covariant, so λ and det(R) depend on the configuration and not on the coordinate labels.

The axis count is three because the algebra forces it, not because three was chosen. The audit-composition law requires associativity, so iterated audits bracket the same way, and the absence of zero divisors, so nonzero warrants never compound to nothing. By Frobenius's theorem the only finite-dimensional associative division algebras over the reals are the reals, the complex numbers, and the quaternions, and three mutually orthogonal imaginary axes exist only in the quaternions, whose imaginary units i, j, k are the three axes. The next normed division algebra, the octonions with seven imaginary units, fails associativity, witnessed by the nonzero associator of e₁, e₂, e₄, so it cannot carry the composition law and the construction stops at three.

This paper in particular. The three axes were the return-value algebra of the admission emitters, which is the formal-structural axis; the executed zero-supply battery of Section 6.4, which is the empirical axis and the only one that could have come out otherwise; and the supply record itself, what was handed to the apparatus and by whom, which is the registrational axis. The decisive observation is the battery rather than a determinant: eight invocations across seven distinct gates, taken verbatim and called at the empty supply record at seed 20260622, returned eight nulls and zero affirmations, and the architecture's independently motivated numerical recovery layer specifies the same floor at the opposite end of the pipeline. The load-bearing step is a single clause in the proof of Proposition 1, that the residual case is unconditioned; if any economy conditions its residual case, the proposition does not reach it, and Section 8.6 records that as the paper's principal open scope question. The verdict is a split with its tiers named: Proposition 1 and Corollary 1 seal at theorem grade conditional on the stated form of the determinate conditions; Corollary 2 seals at structural grade on the content-blindness of inscription cost; Corollary 3 seals at structural grade with its survey falsifiable by one counterexample; and the attestation finding of Section 6.6 is sealed only on its narrow genre half, its exhaustive half left open with the repair specified. No new theorem is claimed. Every load-bearing result invoked is standard and cited, the contribution is the arrangement, and ΔM is zero.

The canonical statement of the method, its axioms, and its executable batteries lives in the reference cited below, continuously updated at the same location. This note is a pointer, not a substitute.

# REFERENCES

1. Adams, J. F. 1960. On the non-existence of elements of Hopf invariant one. *Annals of Mathematics* 72 (1): 20-104.
2. ALEPH, DELPHI, L3, OPAL, SLD Collaborations, et al. 2006. Precision electroweak measurements on the Z resonance. *Physics Reports* 427 (5-6): 257-454.
3. Barendregt, H., and F. Wiedijk. 2005. The challenge of computer mathematics. *Philosophical Transactions of the Royal Society A* 363 (1835): 2351-2375.
4. Bérut, A., A. Arakelyan, A. Petrosyan, S. Ciliberto, R. Dillenschneider, and E. Lutz. 2012. Experimental verification of Landauer's principle linking information and thermodynamics. *Nature* 483: 187-189.
5. Bott, R., and J. Milnor. 1958. On the parallelizability of the spheres. *Bulletin of the American Mathematical Society* 64 (3): 87-89.
6. Burch, R. 1991. *A Peircean Reduction Thesis: The Foundations of Topological Logic*. Lubbock: Texas Tech University Press.
7. Crooks, G. E. 1999. Entropy production fluctuation theorem and the nonequilibrium work relation for free energy differences. *Physical Review E* 60 (3): 2721-2726.
8. de Bruijn, N. G. 1980. A survey of the project AUTOMATH. In *To H. B. Curry: Essays on Combinatory Logic, Lambda Calculus and Formalism*, 579-606. London: Academic Press.
9. Ehrenfest, P. 1917. In what way does it become manifest in the fundamental laws of physics that space has three dimensions? *Proceedings of the Amsterdam Academy* 20: 200-209.
10. Feferman, S. 1960. Arithmetization of metamathematics in a general setting. *Fundamenta Mathematicae* 49 (1): 35-92.
11. Feferman, S. 1962. Transfinite recursive progressions of axiomatic theories. *Journal of Symbolic Logic* 27 (3): 259-316.
12. Feferman, S., and C. Spector. 1962. Incompleteness along paths in progressions of theories. *Journal of Symbolic Logic* 27 (4): 383-390.
13. Friedman, H. 1975. Some systems of second order arithmetic and their use. In *Proceedings of the International Congress of Mathematicians, Vancouver 1974*, 1: 235-242.
14. Frobenius, F. G. 1878. Über lineare Substitutionen und bilineare Formen. *Journal für die reine und angewandte Mathematik* 84: 1-63.
15. Gödel, K. 1931. Über formal unentscheidbare Sätze der Principia Mathematica und verwandter Systeme I. *Monatshefte für Mathematik und Physik* 38: 173-198.
16. Goldman, A. I. 1979. What is justified belief? In *Justification and Knowledge*, edited by G. S. Pappas, 1-23. Dordrecht: Reidel.
17. Gordon, M., R. Milner, and C. Wadsworth. 1979. *Edinburgh LCF: A Mechanised Logic of Computation*. Lecture Notes in Computer Science 78. Berlin: Springer.
18. Hadamard, J. 1893. Résolution d'une question relative aux déterminants. *Bulletin des Sciences Mathématiques* 17: 240-246.
19. Hurwitz, A. 1898. Über die Composition der quadratischen Formen von beliebig vielen Variabeln. *Nachrichten von der Gesellschaft der Wissenschaften zu Göttingen*: 309-316.
20. Jarzynski, C. 1997. Nonequilibrium equality for free energy differences. *Physical Review Letters* 78 (14): 2690-2693.
21. Kervaire, M. A. 1958. Non-parallelizability of the n-sphere for n > 7. *Proceedings of the National Academy of Sciences* 44 (3): 280-283.
22. Klein, P. 1999. Human knowledge and the infinite regress of reasons. *Philosophical Perspectives* 13: 297-325.
23. Landauer, R. 1961. Irreversibility and heat generation in the computing process. *IBM Journal of Research and Development* 5 (3): 183-191.
24. Mandelstam, L., and I. Tamm. 1945. The uncertainty relation between energy and time in non-relativistic quantum mechanics. *Journal of Physics USSR* 9: 249-254.
25. Margolus, N., and L. B. Levitin. 1998. The maximum speed of dynamical evolution. *Physica D* 120 (1-2): 188-195.
26. Martin, D. A. 1975. Borel determinacy. *Annals of Mathematics* 102 (2): 363-371.
27. Masanes, L., and J. Oppenheim. 2017. A general derivation and quantification of the third law of thermodynamics. *Nature Communications* 8: 14538.
28. Odlyzko, A. M., and H. J. J. te Riele. 1985. Disproof of the Mertens conjecture. *Journal für die reine und angewandte Mathematik* 357: 138-160.
29. Paris, J., and L. Harrington. 1977. A mathematical incompleteness in Peano arithmetic. In *Handbook of Mathematical Logic*, edited by J. Barwise, 1133-1142. Amsterdam: North-Holland.
30. Rosser, J. B. 1936. Extensions of some theorems of Gödel and Church. *Journal of Symbolic Logic* 1 (3): 87-91.
31. Sextus Empiricus. 2000. *Outlines of Scepticism*. Edited by J. Annas and J. Barnes. 2nd ed. Cambridge: Cambridge University Press.
32. Simpson, S. G. 2009. *Subsystems of Second Order Arithmetic*. 2nd ed. Cambridge: Cambridge University Press.
33. Tarski, A. 1936. Der Wahrheitsbegriff in den formalisierten Sprachen. *Studia Philosophica* 1: 261-405.
34. Turing, A. M. 1939. Systems of logic based on ordinals. *Proceedings of the London Mathematical Society* s2-45 (1): 161-228.
35. Williamson, T. 2000. *Knowledge and Its Limits*. Oxford: Oxford University Press.
36. Islam, M. TRISDUCTION: A Linguistically, Topologically, and Mathematically Sealed Verification Architecture. Triaxial Orthogonality, Twelve-Gate Closure, the Quaternionic Completion, the Root Axiom, and the Master Pre-Sealed Proposition Ledger. Zenodo, version 4, 19 June 2026. DOI 10.5281/zenodo.20757507. https://zenodo.org/records/20757507. Mirror: PhilArchive record ISLTTG, https://philpapers.org/rec/ISLTTG. Master reference, continuously updated at the same location.
