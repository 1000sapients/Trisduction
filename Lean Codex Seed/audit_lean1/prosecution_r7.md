# Prosecution · round 7 · registers: kinematic, definitional (restated)
Artifact: lean_r7_seeded.lean (read alone). Named target: the round-six two-line reflow in the prelude.

## Findings

P-1 [kinematic] The appendix receipt block prints the first witness's battery as "284 checks, 0 failures", while the file's own extraction-and-run record, the README of the folder it ships in, and the resident anchor's sealed run all print 248. A digit transposition in a receipt is a receipt for a run that never happened. Falsifier: re-run the extracted block and read its last line.

P-2 [definitional] The fixed-point-free predicate is defined as ∀ x, τ x ≠ x, and its docstring immediately adds that τ "therefore has exactly one fixed point, the origin". A predicate stating no fixed points cannot entail one fixed point; the docstring contradicts the definition it decorates. Falsifier: instantiate the predicate at the claimed origin.

P-3 [definitional/scope] The Euler closure is stated for one named tetrahedral complex and decided on its three lists, and its docstring now says it is "proved here for every closed surface". The theorem's statement carries no surface, no genus, and no quantifier; the docstring widens a decided instance to a universal. Falsifier: read the statement.

P-4 [kinematic] The round-six reflow was read whole with its neighbours; the prelude paragraph now reads continuously and the prose-region scan for doubled words across every comment block of the file returns zero. No finding.

P-5 [kinematic] Self-figure scan: no candidate version number, byte count, or line count from the cycle's intermediate versions appears in the file; the version line reads 1.0.1.2 and the contract names the file it sits in. No finding.
