# Prosecution · round 4 · registers: limit, symmetry
Artifact: lean_r4_seeded.lean (read alone). Named target: the three-gate contract and the resolved provenance note from the prior rounds. Scope: internal contradiction, limit behaviour, and coordinate discipline only.

## Findings

P-1 [symmetry] The exact rational's docstring says every operation "routes through" the normalizing constructor "so the invariant cannot be broken from outside". The structure's own default constructor is public, and the file itself uses it twice, in the numeral instance and in negation. Both uses happen to preserve the invariant, but a reader can write a raw pair with a zero or non-coprime denominator, and structural equality will then separate two representations of one value. The claim is stated at the type and holds only at the file's discipline. Falsifier: construct a raw pair and decide its equality with its normal form.

P-2 [limit] The Euclid helper returns its first argument when the fuel is exhausted. A pair beyond the fuel's reach is then normalized by a false divisor: the numerator collapses toward a unit and the denominator is divided by the wrong number, producing a rational that is not the value entered. The file names the bound and prints no behaviour at it, so beyond the bound structural equality can decide a true equation false or a false one true with no diagnostic. Falsifier: trace the exhausted branch symbolically; it divides both fields by |num|.

P-3 [limit] The Euclid docstring now says the fuel bounds Euclid "on any pair below 2^1400, twice the stated width, and on any pair below 2^700". Recomputed by the Fibonacci worst case, 1024 steps reach only about 2^710; the 2^1400 figure would need roughly 2016 steps. The docstring doubles the reach the fuel actually has. Falsifier: log-phi of 2^1400.

P-4 [definitional] The core-only bijection record is introduced as "the surjection as a four-field record" while carrying both a left inverse and a right inverse, which together state a bijection, and the theorem that instantiates it is named as a bijection. The term is narrowed in the docstring against the structure it describes. Falsifier: read the two inverse fields.

P-5 [symmetry] T17 is titled "closed for every codomain" while its statement fixes the target's codomain to Bool and its proof is a two-value case analysis; the treatise the file quotes says the converse fails for non-Boolean codomains. The title widens the theorem beyond its type. Falsifier: read the binder d : α → Bool.

P-6 [limit] The file's compatibility claim with the treatise appendix was checked: all twenty-seven declarations of the compiled appendix fence appear in the codex's section 2 and its full-setup subsection, none is missing and none is added. No finding; recorded as verified because the claim is load-bearing and had not been mechanically checked in the file.
