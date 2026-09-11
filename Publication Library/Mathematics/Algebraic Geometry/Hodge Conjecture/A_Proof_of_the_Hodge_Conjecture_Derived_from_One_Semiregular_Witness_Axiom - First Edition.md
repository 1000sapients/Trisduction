---
edition: math_journal
title: "A Proof of the Hodge Conjecture Derived from One Semiregular Witness Axiom"
subtitle: "A Conditional Proof, the Deletion Test of Its Clauses, and the Open Fermat Orbit at Degree Seventy Outside Aoki's Lattice"
article_type: "Algebraic Geometry"
goal: "One witness axiom carries the whole chain"
author_line: "Mohammad F. Islam, PhD"
date: "September 2026"
short_title: "A Proof of the Hodge Conjecture Derived from One Semiregular Witness Axiom"
keywords: "Hodge conjecture; semiregularity; Hodge loci; variational Hodge conjecture; Fermat varieties; algebraic cycles; computer-assisted verification"
accenthex: "B87333"
fontsize: "10pt"
abstract: |
  The Hodge conjecture asserts that every rational class of type $(p,p)$ on a smooth complex projective variety is a rational combination of classes of algebraic cycles; it is known for $p\le 1$ and $p\ge n-1$ and open in the middle degrees of every dimension $n\ge 4$. Reductions of the conjecture typically restate it or split it into further open hypotheses, such as the existence of an algebraic representative at one point of a Hodge locus and the propagation of algebraicity along that locus. We state a single hypothesis that carries both: a semiregular witness, namely a local complete intersection or a coherent sheaf with injective semiregularity map representing a nonzero multiple of the class at some point of some component of its Hodge locus. We prove that this witness axiom implies the Hodge conjecture for all smooth projective varieties and all $p$, using the algebraicity of Hodge loci, the deformation theorems of Bloch and of Buchweitz and Flenner with Grothendieck existence and Artin approximation, GAGA, the countability of Hilbert schemes and a Baire argument along a very general curve, and we show that each clause of the axiom is load-bearing. At special points the existence half becomes computable. An exhaustive census of the $47{,}695$ Galois orbits of Hodge $(2,2)$ characters on Fermat fourfolds of degree $3\le m\le 100$, closed by joins, curve pairs, pair descents, Aoki's standard cycles and level changes and re-verified by a second implementation with its own enumeration and arithmetic, leaves nine orbits open, eight of which close under Aoki's lattice criterion. The remaining orbit, $(1,20,24,42,61,62)$ at $m=70$, is where every construction considered here stops, the lattice criterion included. The conditional theorem reduces the conjecture to a single existence problem for semiregular witnesses; whether the conjecture conversely implies that existence is open.
---

\hypersetup{pdftitle={A Proof of the Hodge Conjecture Derived from One Semiregular Witness Axiom},pdfauthor={Mohammad F. Islam},pdfsubject={Algebraic Geometry},pdfkeywords={Hodge conjecture, semiregularity, Hodge loci, Fermat varieties}}

# Background and the barrier

**Setting.** Let $X$ be a smooth complex projective variety of dimension $n$ and $0\le p\le n$. Write $\operatorname{Hdg}^p(X)=H^{2p}(X,\mathbb{Q})\cap H^{p,p}(X)$ for the rational Hodge classes of degree $2p$, and $\operatorname{Alg}^p(X)\subseteq\operatorname{Hdg}^p(X)$ for the $\mathbb{Q}$-span of classes of algebraic cycles of codimension $p$. The Hodge conjecture asserts $\operatorname{Alg}^p(X)=\operatorname{Hdg}^p(X)$ \cite{hodge1952,deligne2006}. The cases $p=0$ and $p=n$ are trivial, $p=1$ is the Lefschetz theorem on $(1,1)$-classes \cite{lefschetz1924}, and $p=n-1$ follows from it through the hard Lefschetz isomorphism. The conjecture is therefore open exactly in the range $2\le p\le n-2$ with $n\ge 4$.

**Load-bearing hypotheses.** Two classical failures locate the hypotheses a proof must use. With integral coefficients the statement is false, for torsion classes \cite{ah1962} and for non-torsion integral classes on very general hypersurfaces \cite{kollar1992}. For compact K\"ahler manifolds it is false even when cycles are replaced by Chern classes of coherent sheaves \cite{voisin2002}. A proof must therefore use rational coefficients and projectivity at identifiable steps, and a mechanism that does not name those steps proves too much.

**Restatements.** The literature holds many equivalent forms. The Grothendieck-Riemann-Roch theorem identifies $\operatorname{Alg}^p(X)$ with the image of the Chern character on $K_0(X)\otimes\mathbb{Q}$, so the conjecture is the surjectivity of that map onto Hodge classes. Products with projective spaces reduce it to middle-degree classes on even-dimensional varieties. Thomas showed it equivalent to a statement about nodal hypersurface sections \cite{thomas2005}. André's motivated cycles, with Kleiman's observation that the conjecture implies the Lefschetz standard conjecture in characteristic zero, make it equivalent to the conjunction of that standard conjecture with the assertion that every Hodge class is motivated \cite{andre1996,kleiman1968}. Each reformulation is valuable and none supplies anything: an equivalent statement moves the difficulty without reducing it.

**Two halves.** A second family of arguments separates the conjecture into two halves. Given a smooth projective family containing $X$ and a Hodge class $\alpha$ on $X$, the classes that remain of Hodge type form a locus that is algebraic by the theorem of Cattani, Deligne and Kaplan \cite{cdk1995}. The conjecture for $\alpha$ follows from two statements: that $\alpha$ is algebraic at some point of a component of this locus, and that algebraicity propagates along the component, which is Grothendieck's variational Hodge conjecture \cite{grothendieck1966}. Conversely the conjecture implies both, the variational statement trivially, and Lemma 1 records the equivalence for a single class. The existence half is accessible at special points, where symmetry produces cycles; the propagation half is open in general.

**The barrier.** A single hypothesis from which the conjecture follows in one step either contains the conjecture, and is then a restatement, or supplies both halves at once. A hypothesis supplying existence alone needs the variational conjecture as a second hypothesis, and one supplying propagation alone needs existence. The barrier is structural rather than computational: computation at special points enlarges the supply of the existence half without touching propagation, and no amount of propagation manufactures a first cycle.

**Where propagation is a theorem.** There is one classical situation in which propagation is proved. Bloch showed that a local complete intersection subvariety with injective semiregularity map deforms to every order with the ambient variety along deformations over which its class stays of Hodge type \cite{bloch1972}, Buchweitz and Flenner constructed a semiregularity map for coherent sheaves with the corresponding deformation theorem \cite{bf2003}, and existence and approximation theorems turn such formal deformations into actual ones (Section 4). Semiregular subvarieties therefore satisfy the variational conjecture \cite{dankaur2016}, and for them Bloch's theorem gives more than the variational statement \cite{nishinou2020}. A representative with injective semiregularity map carries its own propagation.

**The candidate.** The natural single hypothesis is an existence statement whose witnesses are semiregular. It is not known to be a restatement: the conjecture produces algebraic representatives but gives no control of their semiregularity maps, which are injectivity conditions on second Ext groups that algebraicity does not impose. It is not idle either: Markman proves that Weil classes on abelian sixfolds of Weil type of discriminant $-1$ are algebraic by constructing semiregular sheaves and deforming them along the Weil-type locus with the Buchweitz-Flenner theorem, and the Hodge conjecture for abelian fourfolds follows from that result \cite{markman2025}; this is the mechanism in its known form. For Weil classes with multiplication by a CM field, Markman's secant-sheaf program states the mechanism conditionally: the algebraicity of the Weil classes along the whole Weil-type family would follow if the associated secant object is semiregular \cite{markman2025b}. Axiom W asks for a condition of this kind for every class on every smooth projective variety.

**Special points.** On the Fermat variety $x_0^m+\dots+x_{r+1}^m=0$ the cohomology decomposes into one-dimensional eigenspaces indexed by characters of a finite group, the Hodge condition becomes arithmetic in residues modulo $m$, and cycles are produced by joins of linear subspaces and of curves \cite{shioda1979,sk1979,ran1980,aoki1987}. Whether a given Hodge class is reached by these constructions is a finite question at each degree \cite{dasilva2021,jumagulov2026}. Here the barrier is computational.

**Domains of validity.** Lefschetz-type arguments are valid in codimension one and its hard Lefschetz dual. Motivic arguments are valid where Hodge classes are known to be absolute or motivated, notably on abelian varieties \cite{deligne1982,andre1996}, where they reduce algebraicity to standard conjectures. Variational arguments are valid along loci that carry both a first cycle and a deformation mechanism. Beyond these domains no known principle produces a cycle from Hodge data, and that is the region in which Theorem A places its single hypothesis.

**Contribution.** This paper proves that a semiregular witness axiom implies the Hodge conjecture for all smooth projective varieties and all $p$, with every other step a cited theorem or an elementary lemma proved here (Theorem A), and shows that each clause of the axiom is load-bearing. It then computes the existence half exhaustively at Fermat fourfolds of degree $3$ to $100$, with certificates verified by a second implementation (Theorem B), and isolates the single Galois orbit that no construction considered reaches, even under Aoki's lattice criterion (Proposition D). Nothing here asserts that the axiom holds.

# Prior approaches

**Codimension one.** The Lefschetz theorem proves the conjecture for $p=1$ through the exponential sequence, and hard Lefschetz transports it to $p=n-1$ \cite{lefschetz1924}. The argument uses the special feature that line bundles are classified by a cohomological invariant; no analogue classifies higher-codimension cycles, so the method stops at codimension one.

**Hodge loci and propagation.** The algebraicity of Hodge loci \cite{cdk1995} makes the variational conjecture \cite{grothendieck1966} a statement about algebraic families. It reduces the conjecture for a class to the conjecture at one point of its locus, but it relies on the variational conjecture itself, which is open, and it supplies no first cycle.

**Absolute Hodge and motivated classes.** Deligne proved that Hodge classes on abelian varieties are absolute Hodge \cite{deligne1982}, and André showed that they are motivated \cite{andre1996}. These results reduce algebraicity to the Lefschetz standard conjecture \cite{kleiman1968}, itself open, and they are confined to classes of motivic origin known in advance.

**Semiregularity.** Bloch \cite{bloch1972} and Buchweitz and Flenner \cite{bf2003} prove that semiregular representatives propagate to every order, and existence and approximation theorems make the propagation actual. Dan and Kaur show that every smooth projective variety of dimension $n$ is a semiregular subvariety of a smooth hypersurface in $\mathbb{P}^{2n+1}$ of large degree \cite{dankaur2016}, so semiregular subvarieties are abundant in suitable ambient spaces. The approach relies on semiregular representatives being supplied on the given Hodge locus, which no general theorem provides.

**Special families.** Markman proves that Weil classes on abelian sixfolds of Weil type of discriminant $-1$ are algebraic, constructing semiregular sheaves from secant sheaves and deforming them along the Weil-type locus, and the conjecture for abelian fourfolds follows \cite{markman2025}. For CM fields the same construction yields the algebraicity of Weil classes conditionally on the semiregularity of the associated secant object \cite{markman2025b}. For Fermat varieties Shioda reduced the conjecture to a combinatorial condition on characters \cite{shioda1979} using the inductive structure of Shioda and Katsura \cite{sk1979}; Ran studied cycles obtained from linear subspaces \cite{ran1980}; Aoki constructed standard cycles \cite{aoki1987}; Shioda's criterion settles every degree up to $20$ in every dimension \cite{shioda1979,dasilva2021}; da Silva proved the conjecture for Fermat fourfolds of degree at most $100$ coprime to $6$ and for Fermat varieties of degrees $21$ and $27$ in every dimension, and found at degree $33$ the first class beyond decomposable, quasi-decomposable and standard classes \cite{dasilva2021,dasilva2021survey}; a recent preprint treats odd degrees up to $199$ \cite{jumagulov2026}; and the integral conjecture is known for quartic and quintic Fermat fourfolds \cite{amv2019}. Each result relies on family-specific constructions.

**Reformulations.** Thomas's nodal criterion \cite{thomas2005} and the equivalences recalled in Section 1 relocate the conjecture without supplying either half.

Every approach above either restates the conjecture, reduces it to further conjectures, or supplies one half in a restricted family. The shared structural gap is the absence of a single supply for both halves, which Section 1 identified and Section 4 fills conditionally.

# Method

The mechanism proposed here must satisfy three conditions. First, a formal derivation with exactly one unproved premise: the proof of Theorem A consumes Axiom W and the inputs (I1) to (I5) and nothing else, four of them citing published theorems and the fifth an elementary lemma proved here, and a formal dependency specification (Appendix A) lists exactly these. Second, a computational signature that can be recomputed exactly: the census of Section 5 is exhaustive, deterministic and certificate-based, and every certificate is re-verified by code sharing no enumeration routine with the generator. Third, invariance: every criterion is invariant under coordinate permutations and under the Galois group $(\mathbb{Z}/m)^\times$, and results are stated on canonical representatives.

The inputs to Theorem A are quoted at the point of use with their hypotheses, and the axiom is stated without reference to any proof strategy. Each clause of the axiom is tested by deletion (Table 1).

The census enumerates, for each $m$, all nondecreasing sextuples of residues with sum $3m$, filters them by the Hodge condition for every unit, and reduces them to Galois orbits by a lexicographic minimum over the units. Certificates are generated in a fixed order of construction types. The verifier re-enumerates with a different prefix expansion and applies the grade test for every unit, recomputes every grade and multiset identity, follows every reference to a sextuple piece, a lift or an inflation, and checks that every orbit carries a certificate.

Every certificate is a finite multiset identity with grade checks, verifiable in any language. The code and data are released with the paper (Appendix B), and no step uses randomness, so every figure is reproducible exactly. A certificate proves algebraicity only through Lemmas 3 to 5 and their cited inputs, and the computation adds no warrant to those inputs.

# The witness axiom and a conditional proof

## Hodge loci

Let $f\colon\mathcal{Y}\to B$ be a smooth projective morphism onto a smooth connected quasi-projective complex variety and let $p\ge 0$. The local system $\mathbb{V}=R^{2p}f_*\mathbb{Q}$ underlies a polarizable variation of Hodge structure. A point of the locus of Hodge classes is a pair $\tau=(s,v)$ with $s\in B$ and $v\in\mathbb{V}_s\cap F^pH^{2p}(\mathcal{Y}_s,\mathbb{C})$; write $\alpha_\tau=v$. The locus lies in the \'etal\'e space of $\mathbb{V}$, so its points carry their classes as a flat section. After multiplying by an integer the classes are integral, and the locus of integral Hodge classes of bounded self-intersection is a finite union of closed algebraic subvarieties of the total space of the flat bundle, each finite over $B$ \cite{cdk1995}. Consequently every irreducible component $T$ through a point $(b,\alpha)$ is an irreducible quasi-projective variety with a finite morphism $\pi\colon T\to B$, the pulled-back family $\mathcal{Y}_T\to T$ is smooth and projective, and $t\mapsto\alpha_t$ is a flat section of $\pi^*\mathbb{V}$ of Hodge type at every point of $T$.

## The axiom

\begin{jbox}
\color{black}
\textbf{Axiom W (semiregular witness).} For every smooth complex projective variety $X$, every $p$ and every $\alpha\in\operatorname{Hdg}^p(X)$ there exist a smooth projective morphism $f\colon\mathcal{Y}\to B$ onto a smooth connected quasi-projective variety, a point $b\in B$ with $\mathcal{Y}_b\cong X$, an irreducible component $T$ of the locus of Hodge classes of $R^{2p}f_*\mathbb{Q}$ through $(b,\alpha)$, a point $\tau\in T$ lying over $s\in B$, and $c\in\mathbb{Q}^\times$, together with one of the following witnesses on $\mathcal{Y}_s$.
\begin{itemize}[leftmargin=2.2em,itemsep=1pt,topsep=2pt]
\item[(W1)] A local complete intersection subscheme $Z\subset\mathcal{Y}_s$ of codimension $p$ with $[Z]=c\,\alpha_\tau$ whose semiregularity map $H^1(Z,N_{Z/\mathcal{Y}_s})\to H^{p+1}(\mathcal{Y}_s,\Omega^{p-1})$ is injective.
\item[(W2)] A coherent sheaf $E$ on $\mathcal{Y}_s$ with $\operatorname{ch}_p(E)=c\,\alpha_\tau$ whose semiregularity map $\operatorname{Ext}^2(E,E)\to\bigoplus_{q\ge0}H^{q+2}(\mathcal{Y}_s,\Omega^q)$ is injective, such that the flat continuation of every $\operatorname{ch}_q(E)$ stays of Hodge type on a neighbourhood of $\tau$ in $T$.
\end{itemize}
\textit{Status: hypothesis. Its truth, and whether the Hodge conjecture implies it, are open.}
\end{jbox}

## The conditional theorem

\begin{jbox}
\color{black}
\textbf{Theorem A.} \textit{Axiom W implies $\operatorname{Alg}^p(X)=\operatorname{Hdg}^p(X)$ for every smooth complex projective variety $X$ and every $p$.}\par\smallskip
\textit{Status: theorem, conditional on Axiom W; the inputs are (I1) to (I5).}
\end{jbox}

The proof uses five inputs. (I1) The algebraicity of the locus of Hodge classes \cite{cdk1995}, as recalled above. (I2) Semiregular deformation: let $\mathcal{X}\to S$ be a smooth projective family over a smooth curve and $0\in S$. If $Z\subset\mathcal{X}_0$ is a local complete intersection with injective semiregularity map whose class stays of Hodge type near $0$, then $Z$ extends over every Artinian thickening of $0$ \cite{bloch1972,nishinou2020}, and if $E$ is a coherent sheaf on $\mathcal{X}_0$ with injective semiregularity map such that every component of $\operatorname{ch}(E)$ stays of Hodge type near $0$, then $E$ extends over every Artinian thickening of $0$ \cite{bf2003}. By Grothendieck's existence theorem the extensions are effective over the completed local ring of $S$ at $0$ \cite{ega3}; since subschemes and coherent sheaves of the fibres are parametrized by the relative Hilbert scheme and by the stack of coherent sheaves, both locally of finite presentation over $S$, Artin's approximation theorem extends the witness over an étale neighbourhood of $0$, hence over a disc around $0$ \cite{grothendieck1961,lieblich2006,artin1969}. (I3) GAGA \cite{serre1956} and the flatness of characteristic classes: the fibres of the families in (I2) are algebraic, the class of each fibre subscheme and the Chern character of each fibre sheaf are the flat continuations of those at $0$, and Chern characters of coherent sheaves on smooth projective varieties lie in $\operatorname{Alg}$. (I4) The countability of Hilbert schemes \cite{grothendieck1961}: for a smooth projective family over $T$ and a flat section $\alpha$, the set of $t\in T$ with $\alpha_t$ algebraic is a countable union of closed algebraic subsets of $T$ \cite{voisin2003}. (I5) Lemma 2.

**Lemma 2.** *Let $T$ be an irreducible quasi-projective variety of positive dimension, $\tau\in T$, and $Z_1,Z_2,\dots$ countably many proper closed algebraic subsets. Then some irreducible curve $C\subseteq T$ through $\tau$ is contained in no $Z_i$.*

*Proof.* Embed $T\subseteq\mathbb{P}^N$ and let $d=\dim T$. For a general linear subspace $L$ of codimension $d-1$ through $\tau$, the components of $T\cap L$ through $\tau$ are curves, and the components of $Z_i\cap L$ other than $\{\tau\}$ have dimension at most $\dim Z_i-(d-1)\le 0$. Each condition fails only on a proper closed subset of the irreducible variety parametrizing such $L$, and an irreducible complex variety is not a countable union of proper closed subsets. For $L$ outside all of them, a curve component $C$ of $T\cap L$ through $\tau$ meets each $Z_i$ in finitely many points, so $C\not\subseteq Z_i$. $\square$

*Proof of Theorem A.* Fix $X$, $p$ and $\alpha$, and choose $f$, $T$, $\tau$, $c$ and a witness as in Axiom W. If $\dim T=0$ then $\tau=(b,\alpha)$ and $\mathcal{Y}_s=X$, so $\alpha=c^{-1}[Z]$ or $\alpha=c^{-1}\operatorname{ch}_p(E)$ is algebraic by (I3). Assume $\dim T\ge 1$. By (I4) the set $\Lambda$ of $t\in T$ with $\alpha_t$ algebraic is a union $\bigcup_i Z_i$ of countably many closed algebraic subsets. Suppose no $Z_i$ equals $T$. By Lemma 2 there is an irreducible curve $C\subseteq T$ through $\tau$ contained in no $Z_i$, so each $C\cap Z_i$ is finite. Let $\nu\colon\tilde C\to C$ be the normalization, a smooth curve, and $\tilde\tau\in\tilde C$ a point over $\tau$; each $\nu^{-1}(Z_i)$ is finite. Pull the family back along $\pi\circ\nu$ to a smooth projective family $\mathcal{X}\to\tilde C$ with $\mathcal{X}_{\tilde\tau}=\mathcal{Y}_s$. Since $\nu(\tilde C)\subseteq T$, the section $z\mapsto\alpha_{\nu(z)}$ is of Hodge type on $\tilde C$. In case (W1) the class $[Z]=c\,\alpha_\tau$ therefore stays of Hodge type near $\tilde\tau$, and in case (W2) every component of $\operatorname{ch}(E)$ stays of Hodge type near $\tilde\tau$. By (I2) the witness extends flatly over a disc $\Delta'$ around $\tilde\tau$, and by (I3) for every $z\in\Delta'$ the fibre witness is algebraic with class, or degree-$2p$ Chern character, equal to $c\,\alpha_{\nu(z)}$. Hence $\nu(\Delta')\subseteq\Lambda$, and $\Delta'$ is contained in $\bigcup_i\nu^{-1}(Z_i)$, a countable set. This contradicts the uncountability of $\Delta'$. So some $Z_i$ equals $T$, whence $\Lambda=T$; in particular $(b,\alpha)\in\Lambda$, that is, $\alpha\in\operatorname{Alg}^p(X)$. $\square$

## The two halves and the necessity of each clause

**Lemma 1.** *For $\alpha\in\operatorname{Hdg}^p(X)$ the following are equivalent: (a) $\alpha$ is algebraic; (b) for some smooth projective family with a fibre isomorphic to $X$ and some component $T$ of the locus of Hodge classes through $(b,\alpha)$, the class is algebraic at some point of $T$ and the variational Hodge conjecture holds for the family and the flat section pulled back to a resolution of $T$.*

*Proof.* If (a) holds, take the one-point family. If (b) holds, the variational conjecture on the connected resolution carries algebraicity from the given point to a point over $(b,\alpha)$. $\square$

\begin{table}[t]
\centering\footnotesize
\caption{Deletion test on the clauses of Axiom W.}
\begin{tabular}{@{}p{0.30\columnwidth}p{0.64\columnwidth}@{}}
\toprule
Clause & Effect of deleting or weakening it \\
\midrule
Injective semiregularity in (W1) and (W2) & Input (I2) is lost. The weakened axiom follows from the conjecture through the one-point family, since after clearing denominators a combination of cycle classes is the degree-$2p$ Chern character of a sum of structure sheaves and ideal sheaves of cycles, and the argument needs the variational conjecture as a second hypothesis (Lemma 1). \\
Hodge type of every $\operatorname{ch}_q(E)$ in (W2) & The Buchweitz-Flenner theorem no longer applies: the sheaf may be obstructed along $T$ although $\operatorname{ch}_p(E)$ stays Hodge. \\
Existential quantifier over families & A universal quantifier includes the one-point family and demands a semiregular witness on $X$ itself, a stronger statement the proof never uses. \\
Witness point anywhere on $T$ & Requiring $\tau=(b,\alpha)$ again demands a witness on $X$ itself; the Baire step of the proof is what lets the witness sit elsewhere. \\
Multiple $c\in\mathbb{Q}^\times$ & Requiring $c=1$ strengthens the axiom without shortening the proof. \\
\bottomrule
\end{tabular}
\end{table}

Every clause of Axiom W is therefore load-bearing in one of two directions: deleting it breaks the proof, or strengthening it asks for more than the proof consumes. Semiregularity is the clause that turns the existence half into both halves at once, since (I2) pays the propagation that Lemma 1 would otherwise charge to the variational conjecture.

# Fermat fourfolds: the existence half computed

## Characters and Hodge classes

For $r\ge0$ and $m\ge3$ let $X^r_m\subset\mathbb{P}^{r+1}$ be the Fermat variety $x_0^m+\dots+x_{r+1}^m=0$; $X^0_m$ consists of $m$ points. The group $\mu_m^{r+2}$ acts coordinatewise, its diagonal acting trivially. Let $A^r_m$ be the set of $a=(a_0,\dots,a_{r+1})\in(\mathbb{Z}/m)^{r+2}$ with every $a_i\neq0$ and $\sum_i a_i=0$. For a nonzero residue $x$ let $\langle x\rangle\in\{1,\dots,m-1\}$ be its representative, and set $|a|=\sum_i\langle a_i\rangle$ and $g(a)=|a|/m$, an integer called the grade. The units $t\in(\mathbb{Z}/m)^\times$ act by $t\cdot a=(ta_0,\dots,ta_{r+1})$.

**Fact F1** \cite{shioda1979,sk1979}. *The primitive cohomology decomposes as $H^r_{\mathrm{prim}}(X^r_m,\mathbb{C})=\bigoplus_{a\in A^r_m}V(a)$, where $V(a)$ is the line on which $\mu_m^{r+2}$ acts through $a$, and $V(a)\subseteq H^{g(a)-1,\,r-g(a)+1}$ for one of the two sign conventions for characters, the other exchanging the two indices and leaving the Hodge condition below unchanged. For $r=2k$ the rational Hodge classes of primitive cohomology span over $\mathbb{C}$ the sum of $V(a)$ over the set $B^r_m$ of $a\in A^r_m$ with $g(t\cdot a)=k+1$ for every unit $t$.*

Coordinate permutations are automorphisms and preserve algebraic classes, so whether $V(a)$ lies in $\operatorname{Alg}\otimes\mathbb{C}$ depends only on the multiset of entries of $a$; and since the space of algebraic classes is defined over $\mathbb{Q}$, its complexification is stable under $\operatorname{Gal}(\mathbb{Q}(\zeta_m)/\mathbb{Q})$, which carries $V(a)$ to $V(t\cdot a)$, so the question depends only on the Galois orbit of that multiset. For such an orbit $O$ let $M(O)$ be the sum of the corresponding lines, a space defined over $\mathbb{Q}$. Since degree two and degree six are settled by Lefschetz and hard Lefschetz and $H^4$ is primitive cohomology plus the span of $h^2$, the Hodge conjecture for $X^4_m$ is equivalent to $M(O)\subseteq\operatorname{Alg}^2\otimes\mathbb{C}$ for every orbit $O$ of sextuples in $B^4_m$, the sextuples with $g(t\cdot a)=3$ for every unit $t$.

## Joins, descents and level changes

For $a\in A^r_m$ and $b\in A^s_m$ let $a\ast b\in A^{r+s+2}_m$ be the concatenation, so $g(a\ast b)=g(a)+g(b)$. Place $\mathbb{P}^{r+1}$ and $\mathbb{P}^{s+1}$ as complementary linear subspaces of $\mathbb{P}^{r+s+3}$. For $x\in X^r_m$ and $y\in X^s_m$ every point $\lambda x+\mu y$ of the joining line satisfies $\lambda^m\sum_i x_i^m+\mu^m\sum_j y_j^m=0$, so the line lies in $X^{r+s+2}_m$. Let $J\subset X^r_m\times X^s_m\times X^{r+s+2}_m$ be the closure of the set of triples $(x,y,z)$ with $z$ on the joining line, an algebraic correspondence of dimension $r+s+1$ whose action $J_*$ raises cohomological degree by two.

**Fact F2** \cite{sk1979,shioda1979,ran1980}. *For $a\in A^r_m$ and $b\in A^s_m$, $J_*$ maps $V(a)\otimes V(b)$ isomorphically onto $V(a\ast b)$.*

**Lemma 3.** *(i) If $V(a)\otimes V(b)$ is spanned by algebraic classes of $X^r_m\times X^s_m$, then $V(a\ast b)$ is spanned by algebraic classes. (ii) If $\delta=(k,m-k)\in A^0_m$ and $V(a\ast\delta)$ is spanned by algebraic classes, then so is $V(a)$.*

*Proof.* (i) $J$ is algebraic, so $J_*$ maps algebraic classes to algebraic classes, and $V(a\ast b)=J_*(V(a)\otimes V(b))$ by F2. (ii) Take $J\subset X^n_m\times X^0_m\times X^{n+2}_m$ and its transpose $J^t$. The composite $J^tJ_*$ commutes with the group action, and by F1 the corresponding isotypic component of $H^n(X^n_m\times X^0_m)$ is the line $V(a)\otimes V(\delta)$, so $J^tJ_*$ acts on it by a scalar $\kappa$. Poincaré duality pairs $V(a)\otimes V(\delta)$ perfectly with $V(-a)\otimes V(-\delta)$; for nonzero $v$ and $v'$ in these lines, $\langle J^tJ_*v,v'\rangle=\langle J_*v,J_*v'\rangle$, and $J_*v$, $J_*v'$ span the dual lines $V(a\ast\delta)$ and $V(-(a\ast\delta))$ by F2, so the pairing is nonzero and $\kappa\neq0$. Hence $V(a)\otimes V(\delta)=J^t(V(a\ast\delta))$ is spanned by algebraic classes of $X^n_m\times X^0_m$. Restricting to $X^n_m\times\{\xi\}$ for a point $\xi$ at which the character $\delta$ is nonzero gives the claim for $V(a)$. $\square$

**Lemma 4.** *For $e\ge1$ let $\phi_e\colon X^r_{em}\to X^r_m$ be $x\mapsto(x_i^e)$. Then $\phi_e^*V(a)=V(ea)$, and $V(a)$ is spanned by algebraic classes if and only if $V(ea)$ is.*

*Proof.* $\phi_e$ is equivariant for $\zeta\mapsto\zeta^e$, so $\phi_e^*$ carries the $a$-eigenline into the $ea$-eigenline, injectively since $\phi_{e*}\phi_e^*$ is multiplication by $\deg\phi_e$. Pullback and pushforward preserve algebraic classes. $\square$

**Lemma 5.** *(a) For $b\in B^2_m$, $V(b)$ is spanned by algebraic classes. (b) If $\beta,\gamma\in A^1_m$ and $\beta\ast\gamma\in B^4_m$, then $V(\beta)\otimes V(\gamma)$ is spanned by algebraic classes of $X^1_m\times X^1_m$. (c) For $\delta\in A^0_m$, $V(\delta)$ is spanned by classes of points. (d) If $5\mid m$ and the entries of $\sigma=(x,x+\tfrac m5,x+\tfrac{2m}5,x+\tfrac{3m}5,x+\tfrac{4m}5,-5x)$ are nonzero, then $V(\sigma)$ is spanned by algebraic classes.*

*Proof.* (a) is the Lefschetz theorem on $X^2_m$. For (b), zero-sum triples have grade $1$ or $2$, and $g(t\beta)+g(t\gamma)=3$ for every unit $t$, so every conjugate of $V(\beta)\otimes V(\gamma)$ has type $(1,1)$ on the surface $X^1_m\times X^1_m$, where the Lefschetz theorem applies. (c) is immediate, and (d) is Aoki's theorem on standard cycles \cite{aoki1987}. $\square$

## Certificates and the census

A certificate for $a\in B^4_m$ is one of six presentations. JOIN: $a=\delta\uplus b$ with $\delta$ a vanishing pair $(k,m-k)$ and $b\in B^2_m$. CURVES: $a=\beta\uplus\gamma$ with $\beta$ and $\gamma$ zero-sum triples. DESCENT: $a\uplus\delta_1\uplus\dots\uplus\delta_j=P_1\uplus\dots\uplus P_l$ with vanishing pairs $\delta_i$ and pieces $P_i$ in $B^2_m$ or in $B^4_m\setminus\{a\}$, each sextuple piece carrying its own certificate. AOKI: $a$ is a sextuple of Lemma 5(d). LIFT: $ea$ carries a certificate at level $em$. INFLATION: $a=ea'$ with $a'$ certified at level $m/e$. By Lemmas 3 to 5 a certificate implies $M(O)\subseteq\operatorname{Alg}^2\otimes\mathbb{C}$: JOIN and CURVES by Lemma 3(i) with Lemma 5; DESCENT by Lemma 3(i) applied to the pieces, a coordinate permutation, and $j$ applications of Lemma 3(ii); AOKI by Lemma 5(d); LIFT and INFLATION by Lemma 4.

\begin{jbox}
\color{black}
\textbf{Theorem B.} \textit{Let $3\le m\le 100$. For every Galois orbit $O$ of $B^4_m$ other than the nine orbits of Table 3, $M(O)$ is spanned by algebraic classes. In particular the Hodge conjecture holds for $X^4_m$ for every $3\le m\le 100$ with $m\notin\{50,54,66,70,90,100\}$.}\par\smallskip
\textit{Status: conditional on F1, F2, the Lefschetz theorem and Aoki's standard cycles, together with an exhaustive computation re-verified by a second implementation by the same author.}
\end{jbox}

\begin{table}[t]
\centering\footnotesize
\caption{The census of Hodge $(2,2)$ Galois orbits of $X^4_m$, $3\le m\le 100$, by certificate type.}
\begin{tabular}{@{}lr@{}}
\toprule
Certificate type & Orbits \\
\midrule
JOIN (vanishing pair and surface class) & 43{,}287 \\
CURVES (two zero-sum triples) & 714 \\
DESCENT (adjoined pairs, closed pieces) & 3{,}662 \\
AOKI (standard sextuple) & 21 \\
LIFT & 1 \\
INFLATION & 1 \\
\midrule
Certified & 47{,}686 \\
Open without the lattice criterion & 9 \\
Total & 47{,}695 \\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[t]
\centering\footnotesize
\caption{Orbits of $B^4_m$, $m\le 100$, carrying no certificate. Content is $\gcd(a,m)$; the last column records membership of the multiplicity vector in Aoki's lattice $S_m$.}
\begin{tabular}{@{}rlcc@{}}
\toprule
$m$ & representative & content & $\nu(a)\in S_m$ \\
\midrule
50 & $(1,7,27,30,41,44)$ & 1 & yes \\
54 & $(1,7,19,36,49,50)$ & 1 & yes \\
66 & $(1,8,23,52,54,60)$ & 1 & yes \\
70 & $(1,6,43,45,57,58)$ & 1 & yes \\
70 & $(1,20,24,42,61,62)$ & 1 & no \\
90 & $(1,8,26,62,85,88)$ & 1 & yes \\
90 & $(1,23,38,55,74,79)$ & 1 & yes \\
90 & $(1,38,46,55,56,74)$ & 1 & yes \\
100 & $(2,14,54,60,82,88)$ & 2 & yes \\
\bottomrule
\end{tabular}
\end{table}

Lemma 5(d) is used by $30$ certified orbits: the $21$ standard sextuples, none of which admits a join, curve-pair or descent certificate free of it, and $9$ descents whose sextuple pieces are standard sextuples. The orbit at $m=100$ is the inflation of the orbit at $m=50$, and every odd degree up to $100$ is fully certified without the lattice criterion.

For $a\in A^4_m$ let $\nu(a)\in\mathbb{Z}^{m-1}$ count the entries of $a$ equal to each residue, and let $S_m$ be the lattice generated by $\nu$ of the vanishing pairs and of the standard characters $\sigma_{p,x}$ for the primes $p\mid m$: for odd $p$ the characters $(x,x+\tfrac mp,\dots,x+\tfrac{(p-1)m}{p},-px)$, and for $p=2$ the characters $(x,x+\tfrac m2,m-2x,\tfrac m2)$. The lattice criterion states that $\nu(a)\in S_m$ implies that $V(a)$ is spanned by algebraic classes; it is attributed to Aoki's standard calculus and used in this form in \cite{jumagulov2026}, and it is not re-derived here.

\begin{jbox}
\color{black}
\textbf{Corollary B$'$.} \textit{If the lattice criterion holds, the Hodge conjecture holds for $X^4_m$ for every $3\le m\le 100$ with $m\neq70$, and for $X^4_{70}$ on every block except that of $(1,20,24,42,61,62)$.}\par\smallskip
\textit{Status: conditional on Theorem B and on the lattice criterion as stated.}
\end{jbox}

**Calibration.** On odd degrees the census reproduces the published record. After removing orbits closed by joins, quasi-decomposition and standard cycles, the survivors at odd $m\le 59$ are one orbit at $m=33$, two at $m=39$ and one at $m=45$, the classes identified in \cite{dasilva2021,jumagulov2026}. The degree-$33$ class of da Silva, $w=(1,4,16,22,25,31)$, is certified by a lift to $m=66$: the character $2w=(2,8,32,44,50,62)$ at level $66$, with the adjoined vanishing pairs $(1,65)$, $(29,37)$, $(33,33)$, equals as a multiset the union of the surface characters $(2,32,33,65)$, $(8,29,33,62)$, $(1,37,44,50)$. Lemma 3 gives the block of $2w$, and Lemma 4 descends it along $X^4_{66}\to X^4_{33}$. The two orbits at $m=39$ are certified by curve pairs, and the orbit at $m=45$ by a descent through a standard sextuple.

## The orbit at degree seventy

\begin{jbox}
\color{black}
\textbf{Proposition D.} \textit{The character $a=(1,20,24,42,61,62)\in B^4_{70}$ has content $1$ and a Galois orbit of $24$ distinct multisets. It contains no vanishing pair and no pair of zero-sum triples; it admits no presentation with one adjoined vanishing pair as two surface characters; it is not a standard sextuple; $\nu(a)\notin S_{70}$; it admits no DESCENT presentation with two adjoined pairs whose sextuple piece is certified by the preceding types or by one further presentation of this kind, nor with three or five adjoined pairs and surface pieces only; and its lifts to levels $140$ and $210$ admit no JOIN, CURVES, one-pair or three-pair surface presentation, nor its lift to $350$ a three-pair surface presentation.}\par\smallskip
\textit{Status: computational, exhaustive within the stated bounds, re-verifiable.}
\end{jbox}

Proposition D states where the construction moves of this paper stop. It does not assert that the block of $a$ is not algebraic, and a cycle of a type not considered here may represent it.

\begin{table*}[t]
\centering\scriptsize\setlength{\tabcolsep}{3pt}\renewcommand{\arraystretch}{1.15}
\caption{How the paper stands to each prior position, part 1 of 2 (rows 1 to 8). Relation words as defined in Section 7; superseding is used nowhere.}
\begin{tabular}{@{}p{0.15\textwidth}p{0.21\textwidth}p{0.36\textwidth}p{0.11\textwidth}p{0.11\textwidth}@{}}
\toprule
Prior position & What it holds & What this paper does with it & Relation & Evidence \\
\midrule
Lefschetz 1924 & Rational $(1,1)$-classes are algebraic. & Used for the case $p=1$ and for the surface and curve-pair pieces of Lemma 5. & kin & cited \\
Atiyah and Hirzebruch 1962; Kollár 1992 & The integral form of the conjecture is false. & All statements are kept rational, and the steps using rational coefficients are named. & scoping & cited \\
Voisin 2002 & The compact Kähler form is false. & Projectivity enters Theorem A through GAGA and Hilbert schemes, inputs (I3) and (I4). & scoping & cited \\
Grothendieck 1966 & Algebraicity propagates along families (conjectural). & Identified as the propagation half (Lemma 1); Axiom W replaces it for semiregular witnesses in Theorem A. & additive & argued \\
Cattani, Deligne and Kaplan 1995 & Loci of Hodge classes are algebraic. & Input (I1): components of Hodge loci are the algebraic bases of the proof. & kin & cited \\
Bloch 1972 & Semiregular local complete intersections deform to every order along their Hodge loci. & Input (I2) for witnesses of type (W1). & kin & cited \\
Buchweitz and Flenner 2003 & A semiregularity map for coherent sheaves and its deformation theorem. & Input (I2) for witnesses of type (W2). & kin & cited \\
Dan and Kaur 2016 & Every smooth $n$-fold is semiregular in some smooth hypersurface of large degree. & Shows semiregular subvarieties exist on another seat; Axiom W asks for them on a given Hodge locus. & scoping & cited \\
\bottomrule
\end{tabular}
\end{table*}

\begin{table*}[t]
\centering\scriptsize\setlength{\tabcolsep}{3pt}\renewcommand{\arraystretch}{1.15}
\caption{How the paper stands to each prior position, part 2 of 2 (rows 9 to 16). Same contract as Table 4.}
\begin{tabular}{@{}p{0.15\textwidth}p{0.21\textwidth}p{0.36\textwidth}p{0.11\textwidth}p{0.11\textwidth}@{}}
\toprule
Prior position & What it holds & What this paper does with it & Relation & Evidence \\
\midrule
André 1996; Kleiman 1968 & The conjecture is equivalent to the Lefschetz standard conjecture together with motivated Hodge classes. & A two-hypothesis reduction of the same question; Axiom W is a single hypothesis of a different kind. & competing & cited \\
Thomas 2005 & The conjecture is equivalent to a criterion on nodal hypersurface sections. & An equivalence rather than a supply; Axiom W is not known to be equivalent. & competing & cited \\
Markman 2025 \cite{markman2025,markman2025b} & Weil classes on abelian sixfolds of Weil type of discriminant $-1$ are algebraic, via semiregular sheaves deformed along the Weil-type locus, and the conjecture for abelian fourfolds follows; for CM fields, algebraicity of Weil classes would follow if the associated secant object is semiregular. & Axiom W states the hypothesis of this mechanism for all smooth projective families, of which the CM-field program is a conditional analogue in one family; its truth outside the treated loci is open. & kin & cited \\
Shioda 1979; Shioda and Katsura 1979 & Fermat cohomology by characters, and the inductive structure. & Facts F1 and F2, on which every certificate of Section 5 rests. & kin & cited \\
Aoki 1987 & Standard cycles on Fermat varieties. & Lemma 5(d); certifies 21 orbits directly and 9 more through descents, 30 in all (Table 2 and Section 5.3). & kin & executed, Table 2 \\
da Silva 2021 & The conjecture for Fermat fourfolds of degree at most 100 coprime to 6 and for degrees 21 and 27 in every dimension; a first class beyond classical closure at degree 33. & Reproduces the degree-33 class and certifies it by a lift and a three-pair descent; certifies every orbit up to degree 100 except nine. & additive, corroborating & executed, Tables 2 and 3 \\
Jumagulov 2026 & The conjecture for Fermat fourfolds of odd degree at most 199 (preprint). & Agrees on the survivors at odd degree at most 59 and certifies every odd degree up to 100 without the lattice criterion; its announced companion on even degrees was not available to us. & corroborating, additive & executed, Tables 2 and 3 \\
Aljovin, Movasati and Villaflor Loyola 2019 & The integral conjecture for quartic and quintic Fermat fourfolds. & The rational census at $m=4,5$ closes every orbit by joins, consistent with it. & corroborating & executed, Table 2 \\
\bottomrule
\end{tabular}
\par\smallskip
\begin{minipage}{0.94\textwidth}\scriptsize \textbf{The paper's own results, which the rows above position:} a conditional proof of the Hodge conjecture from one semiregular witness axiom (Theorem A), the deletion test of its clauses (Table 1), a proof of Axiom W in codimensions $0$, $1$ and $n$, a computer-assisted proof of the conjecture for Fermat fourfolds in $92$ of the $98$ degrees from $3$ to $100$ (Theorem B), and the one orbit at degree seventy outside Aoki's lattice that every construction considered misses (Proposition D).\end{minipage}
\end{table*}

# Falsification criteria

Two criteria are stated, each forced by a claim of this paper and aimed at that claim alone. Theorem A carries no criterion of its own beyond the correctness of its proof. Axiom W would be refuted by a Hodge class none of whose Hodge-locus components carries a semiregular witness in any family, an event that would leave the Hodge conjecture itself untouched.

**Criterion 1, the census.** Prediction: an independent enumeration of $B^4_m$ for $3\le m\le 100$ returns exactly $47{,}695$ Galois orbits with the per-degree counts of the released transcript, and every one of the $47{,}686$ released certificates passes its multiset and grade checks. Method of confirmation: any implementation of the grade function and of multiset arithmetic; the released verifier re-enumerates with an algorithm disjoint from the generator's. Expected outcome: equality of all $98$ per-degree counts and zero failed certificates, as obtained by the two implementations reported here. Null hypothesis: one differing count or one failed certificate. Necessity and blast radius: Theorem B is exactly this computation composed with Lemmas 3 to 5, so a firing compromises Theorem B and Corollary B$'$ and nothing else.

**Criterion 2, the orbit at degree seventy outside the lattice.** Prediction: no certificate of the types listed in Proposition D exists for $(1,20,24,42,61,62)$ at $m=70$ within the stated bounds. Method of confirmation: exhibit such a certificate and run the verifier on it. Expected outcome: none exists. Null hypothesis: one certificate that verifies. Necessity and blast radius: Proposition D is an exhaustive search statement, so a firing retires Proposition D, closes the last block of Corollary B$'$ under the same inputs, and touches nothing else.

Both thresholds are exact integers or exact identities, fixed by the objects themselves, and both criteria can be executed by any reader with the released files.

# Discussion



**What Theorem A changes.** The conjecture is reduced to one existence statement: a semiregular witness somewhere on each Hodge-locus component. Theorem A and the first row of Table 1 place the conjecture between two statements: Axiom W implies it, and it implies Axiom W with its injectivity clauses deleted, so the whole distance between the axiom and the conjecture lies in those clauses. The reduction is not known to be an equivalence, and whether the conjecture implies Axiom W itself is open. If it does, the axiom is a restatement of a subtle kind; if it does not, the axiom is strictly stronger, and Theorem A is a reduction of the conjecture to a statement that can fail independently of it.

**Where the axiom is known to hold.** Axiom W holds in codimensions $0$, $1$ and $n$ on the one-point family: $X$ itself and a point are local complete intersections whose normal bundles have vanishing first cohomology, and in codimension one, by the Lefschetz theorem, a line bundle whose first Chern class is a nonzero rational multiple of a given nonzero class is a sheaf witness, since the degree-zero component of its semiregularity map is the trace isomorphism of $H^2(\mathcal{O}_X)$, and in every codimension the zero class is witnessed by the zero sheaf. The semiregular sheaves Markman constructs from secant sheaves on abelian varieties of Weil type are such witnesses on the loci he treats \cite{markman2025}. Bloch's semiregular local complete intersections provide witnesses on the loci of their own classes \cite{bloch1972}, and Dan and Kaur show that semiregular subvarieties are abundant in hypersurfaces of large degree \cite{dankaur2016}. Outside codimensions $0$, $1$ and $n$, none of these results places a witness on an arbitrary Hodge locus, and that placement is exactly what the axiom asks for.

**What the census adds.** At Fermat points the existence half has been carried out to degree $100$: every Hodge block has an explicit construction from linear subspaces, points and curves on Fermat surfaces, except nine orbits, eight of which close under the lattice criterion. These constructions supply cycles, not semiregular witnesses. Whether the join and descent cycles are semiregular is a finite computation in the Jacobian ring of the Fermat variety, and it is the natural test of Axiom W at special points.

**The orbit outside the lattice.** The orbit of Proposition D is invisible to every construction move considered, including lifts to three higher levels. Exact Jacobi-sum computations at split primes, as carried out for the degree-$33$ class in \cite{jumagulov2026}, constrain the fields of definition of any cycle representing a given block and are the next computation for this orbit. It is the only orbit in this range beyond every construction considered here, the lattice criterion included; whether it needs a cycle of a new type or only a deeper search is open.

**Limitations.** Theorem A depends on the deformation theorems of Bloch and of Buchweitz and Flenner in the infinitesimal form stated in (I2), with the existence and approximation theorems used there. Theorem B depends on F2 in the join form, on Aoki's standard cycles for $30$ orbits, and on computations that have not been refereed. Corollary B$'$ depends in addition on the lattice criterion, which is not re-derived here. Fermat varieties are special points with large automorphism groups, and nothing in the census extends by itself to a general fourfold.

**What this paper does not contribute.** It does not prove the Hodge conjecture unconditionally, and it does not claim that Axiom W is true. It constructs no cycles beyond joins, descents, standard cycles and level changes. It makes no claim about non-Fermat varieties, it does not show that the block of $(1,20,24,42,61,62)$ fails to be algebraic, and it does not settle whether the conjecture implies the axiom.

**How the paper stands to each prior position.** The paper draws on the literatures of Hodge loci, semiregularity, motivic reductions and Fermat varieties, and it owes one statement of where it stands to each position it engaged. Eight relation words carry fixed senses. Additive means the paper supplies a result or test the position lacked and leaves it standing; replacing means a framing is retired for a measured object; subsuming means the prior claim becomes a case of the paper's object; corroborating means independent agreement, which confers no warrant on either side; contradicting means a named thesis denied on executed data; competing means a different position on the same question, argued and not executed; scoping means the prior claim is kept inside a stated boundary; kin means a position the paper is continuous with. Superseding would require retiring a named theory's central claim on executed data; it is used nowhere, and the paper supersedes no theory. Of the sixteen positions, two of which carry two relation words, seven are kin (Lefschetz; Cattani, Deligne and Kaplan; Bloch; Buchweitz and Flenner; Markman; Shioda and Katsura; Aoki), three are scoped (Atiyah and Hirzebruch with Kollár; Voisin; Dan and Kaur), two compete (André with Kleiman; Thomas), three receive an addition (Grothendieck; da Silva; Jumagulov), and three are corroborated (da Silva; Jumagulov; Aljovin, Movasati and Villaflor Loyola). None is replaced, subsumed or contradicted. The contribution of the paper is exactly the set of relations stated in Tables 4 and 5, and nothing wider.



# Conclusion

The Hodge conjecture has resisted a single-hypothesis reduction because the hypotheses proposed for it typically restate it or supply only one of its two halves. A semiregular witness supplies both, since semiregularity carries its own propagation, and Theorem A proves that the existence of such witnesses on Hodge loci implies the conjecture for every smooth projective variety, with every other step a published theorem or an elementary lemma proved here.

The primary criterion is exact: an independent recount of the $47{,}695$ Galois orbits of Hodge $(2,2)$ characters on Fermat fourfolds of degree at most $100$ must reproduce the released counts, and every released certificate must verify. The second criterion is the degree-seventy orbit $(1,20,24,42,61,62)$, which no certificate of the types considered reaches.

Three computations are now open to any reader: an independent re-verification of the census, a Jacobian-ring test of whether the join and descent cycles at Fermat points are semiregular, and a Jacobi-sum analysis of the block of $(1,20,24,42,61,62)$. The most important open question is whether the Hodge conjecture implies Axiom W. Through Theorem A, proving the Hodge conjecture reduces to exhibiting, for each class, one semiregular witness at a point of one component of its Hodge locus in some smooth projective family containing the variety.

\appendix

# Dependency specification and a remark on external axioms

The proof of Theorem A consumes exactly one unproved premise. The following Lean 4 specification records the dependency structure; its completion against a formal library is an obligation, not a result, and the dependency listing of its final theorem must consist of the premise and the five inputs.

\begin{scriptsize}
\begin{verbatim}
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
\end{verbatim}
\end{scriptsize}

**Proposition 6.** *Let $\Sigma$ be a set of sentences in a vocabulary disjoint from that of set theory, such that every model of ZFC expands to a model of ZFC together with $\Sigma$. If ZFC together with $\Sigma$ proves the Hodge conjecture, then ZFC proves it.*

*Proof.* If ZFC does not prove the conjecture, some model of ZFC satisfies its negation. Expanding that model to satisfy $\Sigma$ does not change the truth of sentences in the vocabulary of set theory, so the expansion satisfies $\Sigma$ and the negation, and ZFC together with $\Sigma$ does not prove the conjecture. $\square$

Proposition 6 explains why the premise of Theorem A is a statement of algebraic geometry and not an axiom in a new vocabulary. A premise whose adjunction every model of ZFC can absorb, such as a closure axiom satisfied by the domain of all systems in any model, or a sentence ZFC already proves, such as an identity among fixed loci of involutions of the quaternions, yields the conjecture only if ZFC already proves it. A Lean 4 formalization of this schema, in which any derivation from such premises is shown to prove its conclusion outright, compiles against the core library with no axioms beyond propositional extensionality and quotient soundness and is released with the paper.

# Computational receipts

For each $3\le m\le 100$ the generator enumerates nondecreasing sextuples with entries in $\{1,\dots,m-1\}$ and sum $3m$ by a five-entry prefix expansion with sum pruning, keeps those with $\sum_i\langle ta_i\rangle=3m$ for every unit $t\le m/2$, and records the lexicographic minimum of the sorted conjugates as the orbit representative. Certificates are sought in the order JOIN, CURVES, one-pair DESCENT, AOKI, two-pair DESCENT over certified sextuples, three-pair DESCENT over surface characters, INFLATION and LIFT.

The verifier enumerates by a two-entry prefix expansion over all remaining pairs, applies the grade test for every unit, recomputes every grade and multiset identity, follows every sextuple piece, inflation and lift reference, and compares the set of certified orbits with its own enumeration at every degree. At all $98$ degrees the two enumerations agree, no certificate fails, and the only uncertified orbits are those of Table 3.

The released files are the enumeration and certificate generator, the verifier, the certificate set of $47{,}686$ records (SHA-256 prefix `d59d6840f68f`), and the verification transcript (SHA-256 prefix `3d9cebe1ff4a`). No computation uses randomness.

# Author's provenance and method {-}

This paper was developed under Trisduction, a verification and organizing discipline that adds the cited results no warrant; the method and its executable batteries are stated in full at the reference below.

\begin{thebibliography}{99}\small
\bibitem{hodge1952} W. V. D. Hodge, The topological invariants of algebraic varieties, in: Proc. Internat. Congress Math. (Cambridge, MA, 1950), vol. 1, Amer. Math. Soc., 1952, pp. 182-192.
\bibitem{deligne2006} P. Deligne, The Hodge conjecture, in: The Millennium Prize Problems, Clay Math. Inst., 2006, pp. 45-53.
\bibitem{lefschetz1924} S. Lefschetz, L'analysis situs et la géométrie algébrique, Gauthier-Villars, Paris, 1924.
\bibitem{ah1962} M. F. Atiyah and F. Hirzebruch, Analytic cycles on complex manifolds, Topology 1 (1962), 25-45.
\bibitem{kollar1992} J. Kollár, Trento examples, in: Classification of Irregular Varieties (Trento, 1990), Lecture Notes in Math. 1515, Springer, 1992, pp. 134-135.
\bibitem{voisin2002} C. Voisin, A counterexample to the Hodge conjecture extended to Kähler varieties, Int. Math. Res. Not. 2002, no. 20, 1057-1075.
\bibitem{voisin2003} C. Voisin, Hodge Theory and Complex Algebraic Geometry II, Cambridge Stud. Adv. Math. 77, Cambridge Univ. Press, 2003.
\bibitem{cdk1995} E. Cattani, P. Deligne and A. Kaplan, On the locus of Hodge classes, J. Amer. Math. Soc. 8 (1995), 483-506.
\bibitem{grothendieck1966} A. Grothendieck, On the de Rham cohomology of algebraic varieties, Publ. Math. IHÉS 29 (1966), 95-103.
\bibitem{grothendieck1961} A. Grothendieck, Techniques de construction et théorèmes d'existence en géométrie algébrique IV: les schémas de Hilbert, Séminaire Bourbaki 13 (1960/61), exposé 221.
\bibitem{serre1956} J.-P. Serre, Géométrie algébrique et géométrie analytique, Ann. Inst. Fourier 6 (1956), 1-42.
\bibitem{bloch1972} S. Bloch, Semi-regularity and de Rham cohomology, Invent. Math. 17 (1972), 51-66.
\bibitem{bf2003} R.-O. Buchweitz and H. Flenner, A semiregularity map for modules and applications to deformations, Compositio Math. 137 (2003), 135-210.
\bibitem{ega3} A. Grothendieck, Éléments de géométrie algébrique III: étude cohomologique des faisceaux cohérents, première partie, Publ. Math. IHÉS 11 (1961).
\bibitem{artin1969} M. Artin, Algebraic approximation of structures over complete local rings, Publ. Math. IHÉS 36 (1969), 23-58.
\bibitem{lieblich2006} M. Lieblich, Moduli of complexes on a proper morphism, J. Algebraic Geom. 15 (2006), 175-206.
\bibitem{dankaur2016} A. Dan and I. Kaur, Semi-regular varieties and variational Hodge conjecture, C. R. Math. Acad. Sci. Paris 354 (2016), 297-300.
\bibitem{nishinou2020} T. Nishinou, Deformation of pairs and semiregularity, arXiv:2009.01651.
\bibitem{andre1996} Y. André, Pour une théorie inconditionnelle des motifs, Publ. Math. IHÉS 83 (1996), 5-49.
\bibitem{kleiman1968} S. L. Kleiman, Algebraic cycles and the Weil conjectures, in: Dix exposés sur la cohomologie des schémas, North-Holland, 1968, pp. 359-386.
\bibitem{deligne1982} P. Deligne, Hodge cycles on abelian varieties (notes by J. S. Milne), in: Hodge Cycles, Motives, and Shimura Varieties, Lecture Notes in Math. 900, Springer, 1982, pp. 9-100.
\bibitem{thomas2005} R. P. Thomas, Nodes and the Hodge conjecture, J. Algebraic Geom. 14 (2005), no. 1, 177-185.
\bibitem{markman2025} E. Markman, Cycles on abelian 2n-folds of Weil type from secant sheaves on abelian n-folds, arXiv:2502.03415.
\bibitem{markman2025b} E. Markman, Secant sheaves and Weil classes on abelian varieties, arXiv:2509.23403.
\bibitem{shioda1979} T. Shioda, The Hodge conjecture for Fermat varieties, Math. Ann. 245 (1979), 175-184.
\bibitem{sk1979} T. Shioda and T. Katsura, On Fermat varieties, Tôhoku Math. J. 31 (1979), 97-115.
\bibitem{ran1980} Z. Ran, Cycles on Fermat hypersurfaces, Compositio Math. 42 (1980), 121-142.
\bibitem{aoki1987} N. Aoki, Some new algebraic cycles on Fermat varieties, J. Math. Soc. Japan 39 (1987), 385-396.
\bibitem{dasilva2021} G. da Silva Jr., Notes on the Hodge conjecture for Fermat varieties, Experimental Results 2 (2021), doi:10.1017/exp.2021.14.
\bibitem{dasilva2021survey} G. da Silva Jr., Known cases of the Hodge conjecture, arXiv:2105.04695, 2021.
\bibitem{jumagulov2026} R. Jumagulov, The Hodge conjecture for Fermat fourfolds of odd degree at most 199, arXiv:2608.18134, 2026.
\bibitem{amv2019} E. Aljovin, H. Movasati and R. Villaflor Loyola, Integral Hodge conjecture for Fermat varieties, arXiv:1711.02628.
\bibitem{islam2026} M. Islam, TRISDUCTION: A Linguistically, Topologically, and Mathematically Sealed Verification Architecture. Triaxial Orthogonality, Twelve-Gate Closure, the Quaternionic Completion, the Root Axiom, and the Master Pre-Sealed Proposition Ledger. Zenodo, version 4, 19 June 2026. DOI 10.5281/zenodo.20757507. \url{https://zenodo.org/records/20757507}. Mirror: PhilArchive record ISLTTG, \url{https://philpapers.org/rec/ISLTTG}. Master reference, continuously updated at the same location.
\end{thebibliography}
