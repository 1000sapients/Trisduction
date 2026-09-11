# A Proof of the Hodge Conjecture Derived from One Semiregular Witness Axiom

*A Conditional Proof, the Deletion Test of Its Clauses, and the Open Fermat Orbit at Degree Seventy Outside Aoki's Lattice*

**Mohammad F. Islam, PhD** · September 2026

*Blog edition of the prelude edition of the master: audit cycle hsw2 closed at SEALED-ROUND under SELF-grade controls on the text of the first edition, and this edition adds, after that seal, the framing of the pair, passages that point to the companion paper, whose claims are proved and audited there under cycle hterm1.*

**Abstract.** The Hodge conjecture asserts that every rational class of type (p,p) on a smooth complex projective variety is a rational combination of classes of algebraic cycles; it is known for p≤ 1 and p≥ n-1 and open in the middle degrees of every dimension n≥ 4. Reductions of the conjecture typically restate it or split it into further open hypotheses, such as the existence of an algebraic representative at one point of a Hodge locus and the propagation of algebraicity along that locus. We state a single hypothesis that carries both: a semiregular witness, namely a local complete intersection or a coherent sheaf with injective semiregularity map representing a nonzero multiple of the class at some point of some component of its Hodge locus. We prove that this witness axiom implies the Hodge conjecture for all smooth projective varieties and all p, using the algebraicity of Hodge loci, the deformation theorems of Bloch and of Buchweitz and Flenner with Grothendieck existence and Artin approximation, GAGA, the countability of Hilbert schemes and a Baire argument along a very general curve, and we show that each clause of the axiom is load-bearing. At special points the existence half becomes computable. An exhaustive census of the 47,695 Galois orbits of Hodge (2,2) characters on Fermat fourfolds of degree 3≤ m≤ 100, closed by joins, curve pairs, pair descents, Aoki's standard cycles and level changes and re-verified by a second implementation with its own enumeration and arithmetic, leaves nine orbits open, eight of which close under Aoki's lattice criterion. The remaining orbit, (1,20,24,42,61,62) at m=70, is where every construction considered here stops, the lattice criterion included. The conditional theorem reduces the conjecture to a single existence problem for semiregular witnesses; whether the conjecture conversely implies that existence is open. This paper is the first of a pair: its companion proves that no procedure which reads formal data and constructs nothing supplies such a witness at the classes where every relocation of the conjecture ends, so the two papers form one proof, universal exactly when every instance of the axiom is witnessed, each witness supplied by a construction and none by a reading.

# Background and the barrier

**A pair.** This paper is the first of two that form one proof. It derives the Hodge conjecture from a single axiom, Axiom W of Section 4, and shows that each clause of the axiom is load-bearing. Its companion [34] proves that at the classes where every known relocation of the conjecture ends, no procedure that reads formal data and constructs nothing can supply the witness the axiom asserts. Read together, the derivation here grounds the conjecture for every variety if and only if every instance of Axiom W is witnessed, which the companion calls the truth of the axiom in the kinetic register, and every such witness is supplied by a construction and none by a reading. This paper stands alone as a conditional theorem; the pair completes it as one proof whose single open condition is that witnessing.

**Setting.** Let X be a smooth complex projective variety of dimension n and 0≤ p≤ n. Write Hdgᵖ(X)=H²ᵖ(X,ℚ)∩ H^(p,p)(X) for the rational Hodge classes of degree 2p, and Algᵖ(X)⊆Hdgᵖ(X) for the ℚ-span of classes of algebraic cycles of codimension p. The Hodge conjecture asserts Algᵖ(X)=Hdgᵖ(X) [1, 2]. The cases p=0 and p=n are trivial, p=1 is the Lefschetz theorem on (1,1)-classes [3], and p=n-1 follows from it through the hard Lefschetz isomorphism. The conjecture is therefore open exactly in the range 2≤ p≤ n-2 with n≥ 4.

**Load-bearing hypotheses.** Two classical failures locate the hypotheses a proof must use. With integral coefficients the statement is false, for torsion classes [4] and for non-torsion integral classes on very general hypersurfaces [5]. For compact Kähler manifolds it is false even when cycles are replaced by Chern classes of coherent sheaves [6]. A proof must therefore use rational coefficients and projectivity at identifiable steps, and a mechanism that does not name those steps proves too much.

**Restatements.** The literature holds many equivalent forms. The Grothendieck-Riemann-Roch theorem identifies Algᵖ(X) with the image of the Chern character on K₀(X)⊗ℚ, so the conjecture is the surjectivity of that map onto Hodge classes. Products with projective spaces reduce it to middle-degree classes on even-dimensional varieties. Thomas showed it equivalent to a statement about nodal hypersurface sections [22]. André's motivated cycles, with Kleiman's observation that the conjecture implies the Lefschetz standard conjecture in characteristic zero, make it equivalent to the conjunction of that standard conjecture with the assertion that every Hodge class is motivated [19, 20]. Each reformulation is valuable and none supplies anything: an equivalent statement moves the difficulty without reducing it.

**Two halves.** A second family of arguments separates the conjecture into two halves. Given a smooth projective family containing X and a Hodge class α on X, the classes that remain of Hodge type form a locus that is algebraic by the theorem of Cattani, Deligne and Kaplan [8]. The conjecture for α follows from two statements: that α is algebraic at some point of a component of this locus, and that algebraicity propagates along the component, which is Grothendieck's variational Hodge conjecture [9]. Conversely the conjecture implies both, the variational statement trivially, and Lemma 1 records the equivalence for a single class. The existence half is accessible at special points, where symmetry produces cycles; the propagation half is open in general.

**The barrier.** A single hypothesis from which the conjecture follows in one step either contains the conjecture, and is then a restatement, or supplies both halves at once. A hypothesis supplying existence alone needs the variational conjecture as a second hypothesis, and one supplying propagation alone needs existence. The barrier is structural rather than computational: computation at special points enlarges the supply of the existence half without touching propagation, and no amount of propagation manufactures a first cycle.

**Where propagation is a theorem.** There is one classical situation in which propagation is proved. Bloch showed that a local complete intersection subvariety with injective semiregularity map deforms to every order with the ambient variety along deformations over which its class stays of Hodge type [12], Buchweitz and Flenner constructed a semiregularity map for coherent sheaves with the corresponding deformation theorem [13], and existence and approximation theorems turn such formal deformations into actual ones (Section 4). Semiregular subvarieties therefore satisfy the variational conjecture [17], and for them Bloch's theorem gives more than the variational statement [18]. A representative with injective semiregularity map carries its own propagation.

**The candidate.** The natural single hypothesis is an existence statement whose witnesses are semiregular. It is not known to be a restatement: the conjecture produces algebraic representatives but gives no control of their semiregularity maps, which are injectivity conditions on second Ext groups that algebraicity does not impose. It is not idle either: Markman proves that Weil classes on abelian sixfolds of Weil type of discriminant -1 are algebraic by constructing semiregular sheaves and deforming them along the Weil-type locus with the Buchweitz-Flenner theorem, and the Hodge conjecture for abelian fourfolds follows from that result [23]; this is the mechanism in its known form. For Weil classes with multiplication by a CM field, Markman's secant-sheaf program states the mechanism conditionally: the algebraicity of the Weil classes along the whole Weil-type family would follow if the associated secant object is semiregular [24]. Axiom W asks for a condition of this kind for every class on every smooth projective variety.

**Special points.** On the Fermat variety x₀ᵐ+…+xᵣ₊₁ᵐ=0 the cohomology decomposes into one-dimensional eigenspaces indexed by characters of a finite group, the Hodge condition becomes arithmetic in residues modulo m, and cycles are produced by joins of linear subspaces and of curves [25, 26, 27, 28]. Whether a given Hodge class is reached by these constructions is a finite question at each degree [29, 31]. Here the barrier is computational.

**Domains of validity.** Lefschetz-type arguments are valid in codimension one and its hard Lefschetz dual. Motivic arguments are valid where Hodge classes are known to be absolute or motivated, notably on abelian varieties [21, 19], where they reduce algebraicity to standard conjectures. Variational arguments are valid along loci that carry both a first cycle and a deformation mechanism. Beyond these domains no known principle produces a cycle from Hodge data, and that is the region in which Theorem A places its single hypothesis.

**Contribution.** This paper proves that a semiregular witness axiom implies the Hodge conjecture for all smooth projective varieties and all p, with every other step a cited theorem or an elementary lemma proved here (Theorem A), and shows that each clause of the axiom is load-bearing. It then computes the existence half exhaustively at Fermat fourfolds of degree 3 to 100, with certificates verified by a second implementation (Theorem B), and isolates the single Galois orbit that no construction considered reaches, even under Aoki's lattice criterion (Proposition D). Nothing here asserts that the axiom holds.

# Prior approaches

**Codimension one.** The Lefschetz theorem proves the conjecture for p=1 through the exponential sequence, and hard Lefschetz transports it to p=n-1 [3]. The argument uses the special feature that line bundles are classified by a cohomological invariant; no analogue classifies higher-codimension cycles, so the method stops at codimension one.

**Hodge loci and propagation.** The algebraicity of Hodge loci [8] makes the variational conjecture [9] a statement about algebraic families. It reduces the conjecture for a class to the conjecture at one point of its locus, but it relies on the variational conjecture itself, which is open, and it supplies no first cycle.

**Absolute Hodge and motivated classes.** Deligne proved that Hodge classes on abelian varieties are absolute Hodge [21], and André showed that they are motivated [19]. These results reduce algebraicity to the Lefschetz standard conjecture [20], itself open, and they are confined to classes of motivic origin known in advance.

**Semiregularity.** Bloch [12] and Buchweitz and Flenner [13] prove that semiregular representatives propagate to every order, and existence and approximation theorems make the propagation actual. Dan and Kaur show that every smooth projective variety of dimension n is a semiregular subvariety of a smooth hypersurface in ℙ²ⁿ⁺¹ of large degree [17], so semiregular subvarieties are abundant in suitable ambient spaces. The approach relies on semiregular representatives being supplied on the given Hodge locus, which no general theorem provides.

**Special families.** Markman proves that Weil classes on abelian sixfolds of Weil type of discriminant -1 are algebraic, constructing semiregular sheaves from secant sheaves and deforming them along the Weil-type locus, and the conjecture for abelian fourfolds follows [23]. For CM fields the same construction yields the algebraicity of Weil classes conditionally on the semiregularity of the associated secant object [24]. For Fermat varieties Shioda reduced the conjecture to a combinatorial condition on characters [25] using the inductive structure of Shioda and Katsura [26]; Ran studied cycles obtained from linear subspaces [27]; Aoki constructed standard cycles [28]; Shioda's criterion settles every degree up to 20 in every dimension [25, 29]; da Silva proved the conjecture for Fermat fourfolds of degree at most 100 coprime to 6 and for Fermat varieties of degrees 21 and 27 in every dimension, and found at degree 33 the first class beyond decomposable, quasi-decomposable and standard classes [29, 30]; a recent preprint treats odd degrees up to 199 [31]; and the integral conjecture is known for quartic and quintic Fermat fourfolds [32]. Each result relies on family-specific constructions.

**Reformulations.** Thomas's nodal criterion [22] and the equivalences recalled in Section 1 relocate the conjecture without supplying either half.

Every approach above either restates the conjecture, reduces it to further conjectures, or supplies one half in a restricted family. The shared structural gap is the absence of a single supply for both halves, which Section 1 identified and Section 4 fills conditionally.

# Method

The mechanism proposed here must satisfy three conditions. First, a formal derivation with exactly one unproved premise: the proof of Theorem A consumes Axiom W and the inputs (I1) to (I5) and nothing else, four of them citing published theorems and the fifth an elementary lemma proved here, and a formal dependency specification (Appendix A) lists exactly these. Second, a computational signature that can be recomputed exactly: the census of Section 5 is exhaustive, deterministic and certificate-based, and every certificate is re-verified by code sharing no enumeration routine with the generator. Third, invariance: every criterion is invariant under coordinate permutations and under the Galois group (ℤ/m)^×, and results are stated on canonical representatives.

The inputs to Theorem A are quoted at the point of use with their hypotheses, and the axiom is stated without reference to any proof strategy. Each clause of the axiom is tested by deletion (Table 1).

The census enumerates, for each m, all nondecreasing sextuples of residues with sum 3m, filters them by the Hodge condition for every unit, and reduces them to Galois orbits by a lexicographic minimum over the units. Certificates are generated in a fixed order of construction types. The verifier re-enumerates with a different prefix expansion and applies the grade test for every unit, recomputes every grade and multiset identity, follows every reference to a sextuple piece, a lift or an inflation, and checks that every orbit carries a certificate.

Every certificate is a finite multiset identity with grade checks, verifiable in any language. The code and data are released with the paper (Appendix B), and no step uses randomness, so every figure is reproducible exactly. A certificate proves algebraicity only through Lemmas 3 to 5 and their cited inputs, and the computation adds no warrant to those inputs.

# The witness axiom and a conditional proof

## Hodge loci

Let f:𝒴→ B be a smooth projective morphism onto a smooth connected quasi-projective complex variety and let p≥ 0. The local system V=R²ᵖf_*ℚ underlies a polarizable variation of Hodge structure. A point of the locus of Hodge classes is a pair τ=(s,v) with s∈ B and v∈Vₛ∩ FᵖH²ᵖ(𝒴ₛ,ℂ); write α_τ=v. The locus lies in the étalé space of V, so its points carry their classes as a flat section. After multiplying by an integer the classes are integral, and the locus of integral Hodge classes of bounded self-intersection is a finite union of closed algebraic subvarieties of the total space of the flat bundle, each finite over B [8]. Consequently every irreducible component T through a point (b,α) is an irreducible quasi-projective variety with a finite morphism π: T→ B, the pulled-back family 𝒴_T→ T is smooth and projective, and t↦αₜ is a flat section of π^*V of Hodge type at every point of T.

## The axiom

> **Axiom W (semiregular witness).** For every smooth complex projective variety X, every p and every α∈Hdgᵖ(X) there exist a smooth projective morphism f:𝒴→ B onto a smooth connected quasi-projective variety, a point b∈ B with 𝒴_b≅ X, an irreducible component T of the locus of Hodge classes of R²ᵖf_*ℚ through (b,α), a point τ∈ T lying over s∈ B, and c∈ℚ^×, together with one of the following witnesses on 𝒴ₛ.
>
>
> (W1) A local complete intersection subscheme Z⊂𝒴ₛ of codimension p with [Z]=c α_τ whose semiregularity map H¹(Z,N_(Z/𝒴ₛ))→ Hᵖ⁺¹(𝒴ₛ,Ωᵖ⁻¹) is injective.
>
> (W2) A coherent sheaf E on 𝒴ₛ with chₚ(E)=c α_τ whose semiregularity map Ext²(E,E)→⨁_(q≥0)H^(q+2)(𝒴ₛ,Ω^q) is injective, such that the flat continuation of every ch_q(E) stays of Hodge type on a neighbourhood of τ in T.
>
> *Status: hypothesis. Its truth, and whether the Hodge conjecture implies it, are open.*

## The conditional theorem

> **Theorem A.** *Axiom W implies Algᵖ(X)=Hdgᵖ(X) for every smooth complex projective variety X and every p.*
> *Status: theorem, conditional on Axiom W; the inputs are (I1) to (I5).*

The proof uses five inputs. (I1) The algebraicity of the locus of Hodge classes [8], as recalled above. (I2) Semiregular deformation: let 𝒳→ S be a smooth projective family over a smooth curve and 0∈ S. If Z⊂𝒳₀ is a local complete intersection with injective semiregularity map whose class stays of Hodge type near 0, then Z extends over every Artinian thickening of 0 [12, 18], and if E is a coherent sheaf on 𝒳₀ with injective semiregularity map such that every component of ch(E) stays of Hodge type near 0, then E extends over every Artinian thickening of 0 [13]. By Grothendieck's existence theorem the extensions are effective over the completed local ring of S at 0 [14]; since subschemes and coherent sheaves of the fibres are parametrized by the relative Hilbert scheme and by the stack of coherent sheaves, both locally of finite presentation over S, Artin's approximation theorem extends the witness over an étale neighbourhood of 0, hence over a disc around 0 [10, 16, 15]. (I3) GAGA [11] and the flatness of characteristic classes: the fibres of the families in (I2) are algebraic, the class of each fibre subscheme and the Chern character of each fibre sheaf are the flat continuations of those at 0, and Chern characters of coherent sheaves on smooth projective varieties lie in Alg. (I4) The countability of Hilbert schemes [10]: for a smooth projective family over T and a flat section α, the set of t∈ T with αₜ algebraic is a countable union of closed algebraic subsets of T [7]. (I5) Lemma 2.

**Lemma 2.** *Let T be an irreducible quasi-projective variety of positive dimension, τ∈ T, and Z₁,Z₂,… countably many proper closed algebraic subsets. Then some irreducible curve C⊆ T through τ is contained in no Zᵢ.*

*Proof.* Embed T⊆ℙᴺ and let d=dim T. For a general linear subspace L of codimension d-1 through τ, the components of T∩ L through τ are curves, and the components of Zᵢ∩ L other than τ have dimension at most dim Zᵢ-(d-1)≤ 0. Each condition fails only on a proper closed subset of the irreducible variety parametrizing such L, and an irreducible complex variety is not a countable union of proper closed subsets. For L outside all of them, a curve component C of T∩ L through τ meets each Zᵢ in finitely many points, so C⊈ Zᵢ. □

*Proof of Theorem A.* Fix X, p and α, and choose f, T, τ, c and a witness as in Axiom W. If dim T=0 then τ=(b,α) and 𝒴ₛ=X, so α=c⁻¹[Z] or α=c⁻¹chₚ(E) is algebraic by (I3). Assume dim T≥ 1. By (I4) the set Λ of t∈ T with αₜ algebraic is a union ⋃ᵢ Zᵢ of countably many closed algebraic subsets. Suppose no Zᵢ equals T. By Lemma 2 there is an irreducible curve C⊆ T through τ contained in no Zᵢ, so each C∩ Zᵢ is finite. Let ν:C̃→ C be the normalization, a smooth curve, and τ̃∈C̃ a point over τ; each ν⁻¹(Zᵢ) is finite. Pull the family back along π∘ν to a smooth projective family 𝒳→C̃ with 𝒳_(τ̃)=𝒴ₛ. Since ν(C̃)⊆ T, the section z↦α_(ν(z)) is of Hodge type on C̃. In case (W1) the class [Z]=c α_τ therefore stays of Hodge type near τ̃, and in case (W2) every component of ch(E) stays of Hodge type near τ̃. By (I2) the witness extends flatly over a disc Δ' around τ̃, and by (I3) for every z∈Δ' the fibre witness is algebraic with class, or degree-2p Chern character, equal to c α_(ν(z)). Hence ν(Δ')⊆Λ, and Δ' is contained in ⋃ᵢν⁻¹(Zᵢ), a countable set. This contradicts the uncountability of Δ'. So some Zᵢ equals T, whence Λ=T; in particular (b,α)∈Λ, that is, α∈Algᵖ(X). □

## The two halves and the necessity of each clause

**Lemma 1.** *For α∈Hdgᵖ(X) the following are equivalent: (a) α is algebraic; (b) for some smooth projective family with a fibre isomorphic to X and some component T of the locus of Hodge classes through (b,α), the class is algebraic at some point of T and the variational Hodge conjecture holds for the family and the flat section pulled back to a resolution of T.*

*Proof.* If (a) holds, take the one-point family. If (b) holds, the variational conjecture on the connected resolution carries algebraicity from the given point to a point over (b,α). □

**Table 1 | Deletion test on the clauses of Axiom W.**

- **Injective semiregularity in (W1) and (W2)** · Effect of deleting or weakening it: Input (I2) is lost. The weakened axiom follows from the conjecture through the one-point family, since after clearing denominators a combination of cycle classes is the degree-2p Chern character of a sum of structure sheaves and ideal sheaves of cycles, and the argument needs the variational conjecture as a second hypothesis (Lemma 1).
- **Hodge type of every ch_q(E) in (W2)** · Effect of deleting or weakening it: The Buchweitz-Flenner theorem no longer applies: the sheaf may be obstructed along T although chₚ(E) stays Hodge.
- **Existential quantifier over families** · Effect of deleting or weakening it: A universal quantifier includes the one-point family and demands a semiregular witness on X itself, a stronger statement the proof never uses.
- **Witness point anywhere on T** · Effect of deleting or weakening it: Requiring τ=(b,α) again demands a witness on X itself; the Baire step of the proof is what lets the witness sit elsewhere.
- **Multiple c∈ℚ^×** · Effect of deleting or weakening it: Requiring c=1 strengthens the axiom without shortening the proof.

Every clause of Axiom W is therefore load-bearing in one of two directions: deleting it breaks the proof, or strengthening it asks for more than the proof consumes. Semiregularity is the clause that turns the existence half into both halves at once, since (I2) pays the propagation that Lemma 1 would otherwise charge to the variational conjecture.

# Fermat fourfolds: the existence half computed

## Characters and Hodge classes

For r≥0 and m≥3 let Xʳₘ⊂ℙʳ⁺¹ be the Fermat variety x₀ᵐ+…+xᵣ₊₁ᵐ=0; X⁰ₘ consists of m points. The group μₘʳ⁺² acts coordinatewise, its diagonal acting trivially. Let Aʳₘ be the set of a=(a₀,…,aᵣ₊₁)∈(ℤ/m)ʳ⁺² with every aᵢ≠0 and ∑ᵢ aᵢ=0. For a nonzero residue x let ⟨ x⟩∈1,…,m-1 be its representative, and set |a|=∑ᵢ⟨ aᵢ⟩ and g(a)=|a|/m, an integer called the grade. The units t∈(ℤ/m)^× act by t· a=(ta₀,…,taᵣ₊₁).

**Fact F1** [25, 26]. *The primitive cohomology decomposes as Hʳₚᵣᵢₘ(Xʳₘ,ℂ)=⨁_(a∈ Aʳₘ)V(a), where V(a) is the line on which μₘʳ⁺² acts through a, and V(a)⊆ H^(g(a)-1, r-g(a)+1) for one of the two sign conventions for characters, the other exchanging the two indices and leaving the Hodge condition below unchanged. For r=2k the rational Hodge classes of primitive cohomology span over ℂ the sum of V(a) over the set Bʳₘ of a∈ Aʳₘ with g(t· a)=k+1 for every unit t.*

Coordinate permutations are automorphisms and preserve algebraic classes, so whether V(a) lies in Alg⊗ℂ depends only on the multiset of entries of a; and since the space of algebraic classes is defined over ℚ, its complexification is stable under Gal(ℚ(ζₘ)/ℚ), which carries V(a) to V(t· a), so the question depends only on the Galois orbit of that multiset. For such an orbit O let M(O) be the sum of the corresponding lines, a space defined over ℚ. Since degree two and degree six are settled by Lefschetz and hard Lefschetz and H⁴ is primitive cohomology plus the span of h², the Hodge conjecture for X⁴ₘ is equivalent to M(O)⊆Alg²⊗ℂ for every orbit O of sextuples in B⁴ₘ, the sextuples with g(t· a)=3 for every unit t.

## Joins, descents and level changes

For a∈ Aʳₘ and b∈ Aˢₘ let a∗ b∈ Aʳ⁺ˢ⁺²ₘ be the concatenation, so g(a∗ b)=g(a)+g(b). Place ℙʳ⁺¹ and ℙˢ⁺¹ as complementary linear subspaces of ℙʳ⁺ˢ⁺³. For x∈ Xʳₘ and y∈ Xˢₘ every point λ x+μ y of the joining line satisfies λᵐ∑ᵢ xᵢᵐ+μᵐ∑ⱼ yⱼᵐ=0, so the line lies in Xʳ⁺ˢ⁺²ₘ. Let J⊂ Xʳₘ× Xˢₘ× Xʳ⁺ˢ⁺²ₘ be the closure of the set of triples (x,y,z) with z on the joining line, an algebraic correspondence of dimension r+s+1 whose action J_* raises cohomological degree by two.

**Fact F2** [26, 25, 27]. *For a∈ Aʳₘ and b∈ Aˢₘ, J_* maps V(a)⊗ V(b) isomorphically onto V(a∗ b).*

**Lemma 3.** *(i) If V(a)⊗ V(b) is spanned by algebraic classes of Xʳₘ× Xˢₘ, then V(a∗ b) is spanned by algebraic classes. (ii) If δ=(k,m-k)∈ A⁰ₘ and V(a∗δ) is spanned by algebraic classes, then so is V(a).*

*Proof.* (i) J is algebraic, so J_* maps algebraic classes to algebraic classes, and V(a∗ b)=J_*(V(a)⊗ V(b)) by F2. (ii) Take J⊂ Xⁿₘ× X⁰ₘ× Xⁿ⁺²ₘ and its transpose Jᵗ. The composite JᵗJ_* commutes with the group action, and by F1 the corresponding isotypic component of Hⁿ(Xⁿₘ× X⁰ₘ) is the line V(a)⊗ V(δ), so JᵗJ_* acts on it by a scalar κ. Poincaré duality pairs V(a)⊗ V(δ) perfectly with V(-a)⊗ V(-δ); for nonzero v and v' in these lines, ⟨ JᵗJ_*v,v'⟩=⟨ J_*v,J_*v'⟩, and J_*v, J_*v' span the dual lines V(a∗δ) and V(-(a∗δ)) by F2, so the pairing is nonzero and κ≠0. Hence V(a)⊗ V(δ)=Jᵗ(V(a∗δ)) is spanned by algebraic classes of Xⁿₘ× X⁰ₘ. Restricting to Xⁿₘ×ξ for a point ξ at which the character δ is nonzero gives the claim for V(a). □

**Lemma 4.** *For e≥1 let φₑ: Xʳₑₘ→ Xʳₘ be x↦(xᵢᵉ). Then φₑ^*V(a)=V(ea), and V(a) is spanned by algebraic classes if and only if V(ea) is.*

*Proof.* φₑ is equivariant for ζ↦ζᵉ, so φₑ^* carries the a-eigenline into the ea-eigenline, injectively since φ_(e*)φₑ^* is multiplication by degφₑ. Pullback and pushforward preserve algebraic classes. □

**Lemma 5.** *(a) For b∈ B²ₘ, V(b) is spanned by algebraic classes. (b) If β,γ∈ A¹ₘ and β∗γ∈ B⁴ₘ, then V(β)⊗ V(γ) is spanned by algebraic classes of X¹ₘ× X¹ₘ. (c) For δ∈ A⁰ₘ, V(δ) is spanned by classes of points. (d) If 5∣ m and the entries of σ=(x,x+m/5,x+2m/5,x+3m/5,x+4m/5,-5x) are nonzero, then V(σ) is spanned by algebraic classes.*

*Proof.* (a) is the Lefschetz theorem on X²ₘ. For (b), zero-sum triples have grade 1 or 2, and g(tβ)+g(tγ)=3 for every unit t, so every conjugate of V(β)⊗ V(γ) has type (1,1) on the surface X¹ₘ× X¹ₘ, where the Lefschetz theorem applies. (c) is immediate, and (d) is Aoki's theorem on standard cycles [28]. □

## Certificates and the census

A certificate for a∈ B⁴ₘ is one of six presentations. JOIN: a=δ⊎ b with δ a vanishing pair (k,m-k) and b∈ B²ₘ. CURVES: a=β⊎γ with β and γ zero-sum triples. DESCENT: a⊎δ₁⊎…⊎δⱼ=P₁⊎…⊎ Pₗ with vanishing pairs δᵢ and pieces Pᵢ in B²ₘ or in B⁴ₘ∖a, each sextuple piece carrying its own certificate. AOKI: a is a sextuple of Lemma 5(d). LIFT: ea carries a certificate at level em. INFLATION: a=ea' with a' certified at level m/e. By Lemmas 3 to 5 a certificate implies M(O)⊆Alg²⊗ℂ: JOIN and CURVES by Lemma 3(i) with Lemma 5; DESCENT by Lemma 3(i) applied to the pieces, a coordinate permutation, and j applications of Lemma 3(ii); AOKI by Lemma 5(d); LIFT and INFLATION by Lemma 4.

> **Theorem B.** *Let 3≤ m≤ 100. For every Galois orbit O of B⁴ₘ other than the nine orbits of Table 3, M(O) is spanned by algebraic classes. In particular the Hodge conjecture holds for X⁴ₘ for every 3≤ m≤ 100 with m∉50,54,66,70,90,100.*
> *Status: conditional on F1, F2, the Lefschetz theorem and Aoki's standard cycles, together with an exhaustive computation re-verified by a second implementation by the same author.*

**Table 2 | The census of Hodge (2,2) Galois orbits of X⁴ₘ, 3≤ m≤ 100, by certificate type.**

- **JOIN (vanishing pair and surface class)** · Orbits: 43{,}287
- **CURVES (two zero-sum triples)** · Orbits: 714
- **DESCENT (adjoined pairs, closed pieces)** · Orbits: 3{,}662
- **AOKI (standard sextuple)** · Orbits: 21
- **LIFT** · Orbits: 1
- **INFLATION** · Orbits: 1
- **Certified** · Orbits: 47{,}686
- **Open without the lattice criterion** · Orbits: 9
- **Total** · Orbits: 47{,}695

**Table 3 | Orbits of B⁴ₘ, m≤ 100, carrying no certificate. Content is gcd(a,m); the last column records membership of the multiplicity vector in Aoki's lattice Sₘ.**

- **50** · representative: (1,7,27,30,41,44); content: 1; ν(a)∈ Sₘ: yes
- **54** · representative: (1,7,19,36,49,50); content: 1; ν(a)∈ Sₘ: yes
- **66** · representative: (1,8,23,52,54,60); content: 1; ν(a)∈ Sₘ: yes
- **70** · representative: (1,6,43,45,57,58); content: 1; ν(a)∈ Sₘ: yes
- **70** · representative: (1,20,24,42,61,62); content: 1; ν(a)∈ Sₘ: no
- **90** · representative: (1,8,26,62,85,88); content: 1; ν(a)∈ Sₘ: yes
- **90** · representative: (1,23,38,55,74,79); content: 1; ν(a)∈ Sₘ: yes
- **90** · representative: (1,38,46,55,56,74); content: 1; ν(a)∈ Sₘ: yes
- **100** · representative: (2,14,54,60,82,88); content: 2; ν(a)∈ Sₘ: yes

Lemma 5(d) is used by 30 certified orbits: the 21 standard sextuples, none of which admits a join, curve-pair or descent certificate free of it, and 9 descents whose sextuple pieces are standard sextuples. The orbit at m=100 is the inflation of the orbit at m=50, and every odd degree up to 100 is fully certified without the lattice criterion.

For a∈ A⁴ₘ let ν(a)∈ℤᵐ⁻¹ count the entries of a equal to each residue, and let Sₘ be the lattice generated by ν of the vanishing pairs and of the standard characters σ_(p,x) for the primes p∣ m: for odd p the characters (x,x+m/p,…,x+((p-1)m)/p,-px), and for p=2 the characters (x,x+m/2,m-2x,m/2). The lattice criterion states that ν(a)∈ Sₘ implies that V(a) is spanned by algebraic classes; it is attributed to Aoki's standard calculus and used in this form in [31], and it is not re-derived here.

> **Corollary B'.** *If the lattice criterion holds, the Hodge conjecture holds for X⁴ₘ for every 3≤ m≤ 100 with m≠70, and for X⁴₇₀ on every block except that of (1,20,24,42,61,62).*
> *Status: conditional on Theorem B and on the lattice criterion as stated.*

**Calibration.** On odd degrees the census reproduces the published record. After removing orbits closed by joins, quasi-decomposition and standard cycles, the survivors at odd m≤ 59 are one orbit at m=33, two at m=39 and one at m=45, the classes identified in [29, 31]. The degree-33 class of da Silva, w=(1,4,16,22,25,31), is certified by a lift to m=66: the character 2w=(2,8,32,44,50,62) at level 66, with the adjoined vanishing pairs (1,65), (29,37), (33,33), equals as a multiset the union of the surface characters (2,32,33,65), (8,29,33,62), (1,37,44,50). Lemma 3 gives the block of 2w, and Lemma 4 descends it along X⁴₆₆→ X⁴₃₃. The two orbits at m=39 are certified by curve pairs, and the orbit at m=45 by a descent through a standard sextuple.

## The orbit at degree seventy

> **Proposition D.** *The character a=(1,20,24,42,61,62)∈ B⁴₇₀ has content 1 and a Galois orbit of 24 distinct multisets. It contains no vanishing pair and no pair of zero-sum triples; it admits no presentation with one adjoined vanishing pair as two surface characters; it is not a standard sextuple; ν(a)∉ S₇₀; it admits no DESCENT presentation with two adjoined pairs whose sextuple piece is certified by the preceding types or by one further presentation of this kind, nor with three or five adjoined pairs and surface pieces only; and its lifts to levels 140 and 210 admit no JOIN, CURVES, one-pair or three-pair surface presentation, nor its lift to 350 a three-pair surface presentation.*
> *Status: computational, exhaustive within the stated bounds, re-verifiable.*

Proposition D states where the construction moves of this paper stop. It does not assert that the block of a is not algebraic, and a cycle of a type not considered here may represent it.

**Table 4 | How the paper stands to each prior position, part 1 of 2 (rows 1 to 8). Relation words as defined in Section 7; superseding is used nowhere.**

- **Lefschetz 1924** · What it holds: Rational (1,1)-classes are algebraic.; What this paper does with it: Used for the case p=1 and for the surface and curve-pair pieces of Lemma 5.; Relation: kin; Evidence: cited
- **Atiyah and Hirzebruch 1962; Kollár 1992** · What it holds: The integral form of the conjecture is false.; What this paper does with it: All statements are kept rational, and the steps using rational coefficients are named.; Relation: scoping; Evidence: cited
- **Voisin 2002** · What it holds: The compact Kähler form is false.; What this paper does with it: Projectivity enters Theorem A through GAGA and Hilbert schemes, inputs (I3) and (I4).; Relation: scoping; Evidence: cited
- **Grothendieck 1966** · What it holds: Algebraicity propagates along families (conjectural).; What this paper does with it: Identified as the propagation half (Lemma 1); Axiom W replaces it for semiregular witnesses in Theorem A.; Relation: additive; Evidence: argued
- **Cattani, Deligne and Kaplan 1995** · What it holds: Loci of Hodge classes are algebraic.; What this paper does with it: Input (I1): components of Hodge loci are the algebraic bases of the proof.; Relation: kin; Evidence: cited
- **Bloch 1972** · What it holds: Semiregular local complete intersections deform to every order along their Hodge loci.; What this paper does with it: Input (I2) for witnesses of type (W1).; Relation: kin; Evidence: cited
- **Buchweitz and Flenner 2003** · What it holds: A semiregularity map for coherent sheaves and its deformation theorem.; What this paper does with it: Input (I2) for witnesses of type (W2).; Relation: kin; Evidence: cited
- **Dan and Kaur 2016** · What it holds: Every smooth n-fold is semiregular in some smooth hypersurface of large degree.; What this paper does with it: Shows semiregular subvarieties exist on another seat; Axiom W asks for them on a given Hodge locus.; Relation: scoping; Evidence: cited

**Table 5 | How the paper stands to each prior position, part 2 of 2 (rows 9 to 16). Same contract as Table 4.**

- **André 1996; Kleiman 1968** · What it holds: The conjecture is equivalent to the Lefschetz standard conjecture together with motivated Hodge classes.; What this paper does with it: A two-hypothesis reduction of the same question; Axiom W is a single hypothesis of a different kind.; Relation: competing; Evidence: cited
- **Thomas 2005** · What it holds: The conjecture is equivalent to a criterion on nodal hypersurface sections.; What this paper does with it: An equivalence rather than a supply; Axiom W is not known to be equivalent.; Relation: competing; Evidence: cited
- **Markman 2025 [23, 24]** · What it holds: Weil classes on abelian sixfolds of Weil type of discriminant -1 are algebraic, via semiregular sheaves deformed along the Weil-type locus, and the conjecture for abelian fourfolds follows; for CM fields, algebraicity of Weil classes would follow if the associated secant object is semiregular.; What this paper does with it: Axiom W states the hypothesis of this mechanism for all smooth projective families, of which the CM-field program is a conditional analogue in one family; its truth outside the treated loci is open.; Relation: kin; Evidence: cited
- **Shioda 1979; Shioda and Katsura 1979** · What it holds: Fermat cohomology by characters, and the inductive structure.; What this paper does with it: Facts F1 and F2, on which every certificate of Section 5 rests.; Relation: kin; Evidence: cited
- **Aoki 1987** · What it holds: Standard cycles on Fermat varieties.; What this paper does with it: Lemma 5(d); certifies 21 orbits directly and 9 more through descents, 30 in all (Table 2 and Section 5.3).; Relation: kin; Evidence: executed, Table 2
- **da Silva 2021** · What it holds: The conjecture for Fermat fourfolds of degree at most 100 coprime to 6 and for degrees 21 and 27 in every dimension; a first class beyond classical closure at degree 33.; What this paper does with it: Reproduces the degree-33 class and certifies it by a lift and a three-pair descent; certifies every orbit up to degree 100 except nine.; Relation: additive, corroborating; Evidence: executed, Tables 2 and 3
- **Jumagulov 2026** · What it holds: The conjecture for Fermat fourfolds of odd degree at most 199 (preprint).; What this paper does with it: Agrees on the survivors at odd degree at most 59 and certifies every odd degree up to 100 without the lattice criterion; its announced companion on even degrees was not available to us.; Relation: corroborating, additive; Evidence: executed, Tables 2 and 3
- **Aljovin, Movasati and Villaflor Loyola 2019** · What it holds: The integral conjecture for quartic and quintic Fermat fourfolds.; What this paper does with it: The rational census at m=4,5 closes every orbit by joins, consistent with it.; Relation: corroborating; Evidence: executed, Table 2

***The paper's own results, which the rows above position:** a conditional proof of the Hodge conjecture from one semiregular witness axiom (Theorem A), the deletion test of its clauses (Table 1), a proof of Axiom W in codimensions 0, 1 and n, a computer-assisted proof of the conjecture for Fermat fourfolds in 92 of the 98 degrees from 3 to 100 (Theorem B), and the one orbit at degree seventy outside Aoki's lattice that every construction considered misses (Proposition D).*

# Falsification criteria

Two criteria are stated, each forced by a claim of this paper and aimed at that claim alone. Theorem A carries no criterion of its own beyond the correctness of its proof. Axiom W would be refuted by a Hodge class none of whose Hodge-locus components carries a semiregular witness in any family, an event that would leave the Hodge conjecture itself untouched.

**Criterion 1, the census.** Prediction: an independent enumeration of B⁴ₘ for 3≤ m≤ 100 returns exactly 47,695 Galois orbits with the per-degree counts of the released transcript, and every one of the 47,686 released certificates passes its multiset and grade checks. Method of confirmation: any implementation of the grade function and of multiset arithmetic; the released verifier re-enumerates with an algorithm disjoint from the generator's. Expected outcome: equality of all 98 per-degree counts and zero failed certificates, as obtained by the two implementations reported here. Null hypothesis: one differing count or one failed certificate. Necessity and blast radius: Theorem B is exactly this computation composed with Lemmas 3 to 5, so a firing compromises Theorem B and Corollary B' and nothing else.

**Criterion 2, the orbit at degree seventy outside the lattice.** Prediction: no certificate of the types listed in Proposition D exists for (1,20,24,42,61,62) at m=70 within the stated bounds. Method of confirmation: exhibit such a certificate and run the verifier on it. Expected outcome: none exists. Null hypothesis: one certificate that verifies. Necessity and blast radius: Proposition D is an exhaustive search statement, so a firing retires Proposition D, closes the last block of Corollary B' under the same inputs, and touches nothing else.

Both thresholds are exact integers or exact identities, fixed by the objects themselves, and both criteria can be executed by any reader with the released files.

# Discussion

**What Theorem A changes.** The conjecture is reduced to one existence statement: a semiregular witness somewhere on each Hodge-locus component. Theorem A and the first row of Table 1 place the conjecture between two statements: Axiom W implies it, and it implies Axiom W with its injectivity clauses deleted, so the whole distance between the axiom and the conjecture lies in those clauses. The reduction is not known to be an equivalence, and whether the conjecture implies Axiom W itself is open. If it does, the axiom is a restatement of a subtle kind; if it does not, the axiom is strictly stronger, and Theorem A is a reduction of the conjecture to a statement that can fail independently of it.

**Where the axiom is known to hold.** Axiom W holds in codimensions 0, 1 and n on the one-point family: X itself and a point are local complete intersections whose normal bundles have vanishing first cohomology, and in codimension one, by the Lefschetz theorem, a line bundle whose first Chern class is a nonzero rational multiple of a given nonzero class is a sheaf witness, since the degree-zero component of its semiregularity map is the trace isomorphism of H²(𝒪_X), and in every codimension the zero class is witnessed by the zero sheaf. The semiregular sheaves Markman constructs from secant sheaves on abelian varieties of Weil type are such witnesses on the loci he treats [23]. Bloch's semiregular local complete intersections provide witnesses on the loci of their own classes [12], and Dan and Kaur show that semiregular subvarieties are abundant in hypersurfaces of large degree [17]. Outside codimensions 0, 1 and n, none of these results places a witness on an arbitrary Hodge locus, and that placement is exactly what the axiom asks for.

**What the census adds.** At Fermat points the existence half has been carried out to degree 100: every Hodge block has an explicit construction from linear subspaces, points and curves on Fermat surfaces, except nine orbits, eight of which close under the lattice criterion. These constructions supply cycles, not semiregular witnesses. Whether the join and descent cycles are semiregular is a finite computation in the Jacobian ring of the Fermat variety, and it is the natural test of Axiom W at special points.

**The orbit outside the lattice.** The orbit of Proposition D is invisible to every construction move considered, including lifts to three higher levels. Exact Jacobi-sum computations at split primes, as carried out for the degree-33 class in [31], constrain the fields of definition of any cycle representing a given block and are the next computation for this orbit. It is the only orbit in this range beyond every construction considered here, the lattice criterion included; whether it needs a cycle of a new type or only a deeper search is open.

**Limitations.** Theorem A depends on the deformation theorems of Bloch and of Buchweitz and Flenner in the infinitesimal form stated in (I2), with the existence and approximation theorems used there. Theorem B depends on F2 in the join form, on Aoki's standard cycles for 30 orbits, and on computations that have not been refereed. Corollary B' depends in addition on the lattice criterion, which is not re-derived here. Fermat varieties are special points with large automorphism groups, and nothing in the census extends by itself to a general fourfold.

**What this paper does not contribute.** It does not prove the Hodge conjecture unconditionally, and it does not claim that Axiom W is true. It constructs no cycles beyond joins, descents, standard cycles and level changes. It makes no claim about non-Fermat varieties, it does not show that the block of (1,20,24,42,61,62) fails to be algebraic, and it does not settle whether the conjecture implies the axiom.

**What the companion adds.** The companion [34] takes up the one question this paper leaves at its last step, whether the existence statement of Axiom W can be settled by reading the formal data of a class. It proves that over ℚ̄ each instance of the conjecture is Σ⁰₁ and the conjecture is Π⁰₂, so that a true instance carries a finite witness, and, at structural grade through its enumeration of reading routes, that at a class on which every route by which a reading could relocate algebraicity is closed, no procedure that constructs nothing grounds algebraicity. The proof of Theorem A fixes one class and consumes only the instance of the axiom at that class, so no such procedure grounds that instance either. The two papers are therefore one proof: this paper carries the derivation, the companion carries the termination of every reading, and the proof grounds the conjecture for every variety if and only if every instance of Axiom W is witnessed, every witness supplied by a construction.

**How the paper stands to each prior position.** The paper draws on the literatures of Hodge loci, semiregularity, motivic reductions and Fermat varieties, and it owes one statement of where it stands to each position it engaged. Eight relation words carry fixed senses. Additive means the paper supplies a result or test the position lacked and leaves it standing; replacing means a framing is retired for a measured object; subsuming means the prior claim becomes a case of the paper's object; corroborating means independent agreement, which confers no warrant on either side; contradicting means a named thesis denied on executed data; competing means a different position on the same question, argued and not executed; scoping means the prior claim is kept inside a stated boundary; kin means a position the paper is continuous with. Superseding would require retiring a named theory's central claim on executed data; it is used nowhere, and the paper supersedes no theory. Of the sixteen positions, two of which carry two relation words, seven are kin (Lefschetz; Cattani, Deligne and Kaplan; Bloch; Buchweitz and Flenner; Markman; Shioda and Katsura; Aoki), three are scoped (Atiyah and Hirzebruch with Kollár; Voisin; Dan and Kaur), two compete (André with Kleiman; Thomas), three receive an addition (Grothendieck; da Silva; Jumagulov), and three are corroborated (da Silva; Jumagulov; Aljovin, Movasati and Villaflor Loyola). None is replaced, subsumed or contradicted. The contribution of the paper is exactly the set of relations stated in Tables 4 and 5, and nothing wider.

# Conclusion

The Hodge conjecture has resisted a single-hypothesis reduction because the hypotheses proposed for it typically restate it or supply only one of its two halves. A semiregular witness supplies both, since semiregularity carries its own propagation, and Theorem A proves that the existence of such witnesses on Hodge loci implies the conjecture for every smooth projective variety, with every other step a published theorem or an elementary lemma proved here.

The primary criterion is exact: an independent recount of the 47,695 Galois orbits of Hodge (2,2) characters on Fermat fourfolds of degree at most 100 must reproduce the released counts, and every released certificate must verify. The second criterion is the degree-seventy orbit (1,20,24,42,61,62), which no certificate of the types considered reaches.

Three computations are now open to any reader: an independent re-verification of the census, a Jacobian-ring test of whether the join and descent cycles at Fermat points are semiregular, and a Jacobi-sum analysis of the block of (1,20,24,42,61,62). The most important open question is whether the Hodge conjecture implies Axiom W. Through Theorem A, proving the Hodge conjecture reduces to exhibiting, for each class, one semiregular witness at a point of one component of its Hodge locus in some smooth projective family containing the variety. Its companion [34] completes the pair: no reading supplies such a witness where the relocations of the conjecture end, so the derivation here is universal exactly when every instance of Axiom W is witnessed.

# Dependency specification and a remark on external axioms

The proof of Theorem A consumes exactly one unproved premise. The following Lean 4 specification records the dependency structure; its completion against a formal library is an obligation, not a result, and the dependency listing of its final theorem must consist of the premise and the five inputs.

```
axiom Target   : Prop  -- HC for all X and p
axiom W        : Prop  -- semiregular witness
axiom Input_I1 : Prop  -- Cattani-Deligne-Kaplan
axiom Input_I2 : Prop  -- Bloch; Buchweitz-Flenner; Artin
axiom Input_I3 : Prop  -- GAGA; flat Chern classes
axiom Input_I4 : Prop  -- Hilbert schemes countable
axiom Input_I5 : Prop  -- very general curve
theorem target_from_W (w : W) (i1 : Input_I1)
    (i2 : Input_I2) (i3 : Input_I3)
    (i4 : Input_I4) (i5 : Input_I5) :
    Target := by sorry
```

**Proposition 6.** *Let Σ be a set of sentences in a vocabulary disjoint from that of set theory, such that every model of ZFC expands to a model of ZFC together with Σ. If ZFC together with Σ proves the Hodge conjecture, then ZFC proves it.*

*Proof.* If ZFC does not prove the conjecture, some model of ZFC satisfies its negation. Expanding that model to satisfy Σ does not change the truth of sentences in the vocabulary of set theory, so the expansion satisfies Σ and the negation, and ZFC together with Σ does not prove the conjecture. □

Proposition 6 explains why the premise of Theorem A is a statement of algebraic geometry and not an axiom in a new vocabulary. A premise whose adjunction every model of ZFC can absorb, such as a closure axiom satisfied by the domain of all systems in any model, or a sentence ZFC already proves, such as an identity among fixed loci of involutions of the quaternions, yields the conjecture only if ZFC already proves it. A Lean 4 formalization of this schema, in which any derivation from such premises is shown to prove its conclusion outright, compiles against the core library with no axioms beyond propositional extensionality and quotient soundness and is released with the paper.

# Computational receipts

For each 3≤ m≤ 100 the generator enumerates nondecreasing sextuples with entries in 1,…,m-1 and sum 3m by a five-entry prefix expansion with sum pruning, keeps those with ∑ᵢ⟨ taᵢ⟩=3m for every unit t≤ m/2, and records the lexicographic minimum of the sorted conjugates as the orbit representative. Certificates are sought in the order JOIN, CURVES, one-pair DESCENT, AOKI, two-pair DESCENT over certified sextuples, three-pair DESCENT over surface characters, INFLATION and LIFT.

The verifier enumerates by a two-entry prefix expansion over all remaining pairs, applies the grade test for every unit, recomputes every grade and multiset identity, follows every sextuple piece, inflation and lift reference, and compares the set of certified orbits with its own enumeration at every degree. At all 98 degrees the two enumerations agree, no certificate fails, and the only uncertified orbits are those of Table 3.

The released files are the enumeration and certificate generator, the verifier, the certificate set of 47,686 records (SHA-256 prefix `d59d6840f68f`), and the verification transcript (SHA-256 prefix `3d9cebe1ff4a`). No computation uses randomness.

# Author's provenance and method

This paper was developed under Trisduction, a verification and organizing discipline that adds the cited results no warrant; the method and its executable batteries are stated in full at the reference below.

# References

1. W. V. D. Hodge, The topological invariants of algebraic varieties, in: Proc. Internat. Congress Math. (Cambridge, MA, 1950), vol. 1, Amer. Math. Soc., 1952, pp. 182-192.
2. P. Deligne, The Hodge conjecture, in: The Millennium Prize Problems, Clay Math. Inst., 2006, pp. 45-53.
3. S. Lefschetz, L'analysis situs et la géométrie algébrique, Gauthier-Villars, Paris, 1924.
4. M. F. Atiyah and F. Hirzebruch, Analytic cycles on complex manifolds, Topology 1 (1962), 25-45.
5. J. Kollár, Trento examples, in: Classification of Irregular Varieties (Trento, 1990), Lecture Notes in Math. 1515, Springer, 1992, pp. 134-135.
6. C. Voisin, A counterexample to the Hodge conjecture extended to Kähler varieties, Int. Math. Res. Not. 2002, no. 20, 1057-1075.
7. C. Voisin, Hodge Theory and Complex Algebraic Geometry II, Cambridge Stud. Adv. Math. 77, Cambridge Univ. Press, 2003.
8. E. Cattani, P. Deligne and A. Kaplan, On the locus of Hodge classes, J. Amer. Math. Soc. 8 (1995), 483-506.
9. A. Grothendieck, On the de Rham cohomology of algebraic varieties, Publ. Math. IHÉS 29 (1966), 95-103.
10. A. Grothendieck, Techniques de construction et théorèmes d'existence en géométrie algébrique IV: les schémas de Hilbert, Séminaire Bourbaki 13 (1960/61), exposé 221.
11. J.-P. Serre, Géométrie algébrique et géométrie analytique, Ann. Inst. Fourier 6 (1956), 1-42.
12. S. Bloch, Semi-regularity and de Rham cohomology, Invent. Math. 17 (1972), 51-66.
13. R.-O. Buchweitz and H. Flenner, A semiregularity map for modules and applications to deformations, Compositio Math. 137 (2003), 135-210.
14. A. Grothendieck, Éléments de géométrie algébrique III: étude cohomologique des faisceaux cohérents, première partie, Publ. Math. IHÉS 11 (1961).
15. M. Artin, Algebraic approximation of structures over complete local rings, Publ. Math. IHÉS 36 (1969), 23-58.
16. M. Lieblich, Moduli of complexes on a proper morphism, J. Algebraic Geom. 15 (2006), 175-206.
17. A. Dan and I. Kaur, Semi-regular varieties and variational Hodge conjecture, C. R. Math. Acad. Sci. Paris 354 (2016), 297-300.
18. T. Nishinou, Deformation of pairs and semiregularity, arXiv:2009.01651.
19. Y. André, Pour une théorie inconditionnelle des motifs, Publ. Math. IHÉS 83 (1996), 5-49.
20. S. L. Kleiman, Algebraic cycles and the Weil conjectures, in: Dix exposés sur la cohomologie des schémas, North-Holland, 1968, pp. 359-386.
21. P. Deligne, Hodge cycles on abelian varieties (notes by J. S. Milne), in: Hodge Cycles, Motives, and Shimura Varieties, Lecture Notes in Math. 900, Springer, 1982, pp. 9-100.
22. R. P. Thomas, Nodes and the Hodge conjecture, J. Algebraic Geom. 14 (2005), no. 1, 177-185.
23. E. Markman, Cycles on abelian 2n-folds of Weil type from secant sheaves on abelian n-folds, arXiv:2502.03415.
24. E. Markman, Secant sheaves and Weil classes on abelian varieties, arXiv:2509.23403.
25. T. Shioda, The Hodge conjecture for Fermat varieties, Math. Ann. 245 (1979), 175-184.
26. T. Shioda and T. Katsura, On Fermat varieties, Tôhoku Math. J. 31 (1979), 97-115.
27. Z. Ran, Cycles on Fermat hypersurfaces, Compositio Math. 42 (1980), 121-142.
28. N. Aoki, Some new algebraic cycles on Fermat varieties, J. Math. Soc. Japan 39 (1987), 385-396.
29. G. da Silva Jr., Notes on the Hodge conjecture for Fermat varieties, Experimental Results 2 (2021), doi:10.1017/exp.2021.14.
30. G. da Silva Jr., Known cases of the Hodge conjecture, arXiv:2105.04695, 2021.
31. R. Jumagulov, The Hodge conjecture for Fermat fourfolds of odd degree at most 199, arXiv:2608.18134, 2026.
32. E. Aljovin, H. Movasati and R. Villaflor Loyola, Integral Hodge conjecture for Fermat varieties, arXiv:1711.02628.
33. M. Islam, TRISDUCTION: A Linguistically, Topologically, and Mathematically Sealed Verification Architecture. Triaxial Orthogonality, Twelve-Gate Closure, the Quaternionic Completion, the Root Axiom, and the Master Pre-Sealed Proposition Ledger. Zenodo, version 4, 19 June 2026. DOI 10.5281/zenodo.20757507. https://zenodo.org/records/20757507. Mirror: PhilArchive record ISLTTG, https://philpapers.org/rec/ISLTTG. Master reference, continuously updated at the same location.
34. M. F. Islam, A formal proof of Hodge conjecture termination at the formal-alone register: the rigid-witness terminus, a theorem-grade cascade specification, and the Trisductive pricing of its two flanks, manuscript, 2026.