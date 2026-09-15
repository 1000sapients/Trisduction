# Prosecution · round 8 · registers: kinematic, definitional (restated, final round of the cap)
Artifact: lean_r8_seeded.lean (read alone). Named target: none added since round six; every printed receipt figure re-executed through a second channel.

## Findings

P-1 [kinematic] The receipt block prints the second witness's battery as "1132 checks, 0 failures"; the resident sealed-run log and the executed binary both print 1123, and the block's own JSON line beneath it prints 1123. Two figures for one run in adjacent lines. Falsifier: read the JSON line.

P-2 [definitional] The grade ladder's docstring says "eight rungs" and the inductive type beneath it declares nine constructors, which its rank function enumerates zero through eight. Falsifier: count the constructors.

P-3 [definitional/scope] "Every map fixes the origin" is the docstring on a theorem quantified over the file's 3×3 rational matrices acting linearly; a translation is a map and fixes nothing. The docstring drops the word that makes the statement true. Falsifier: read the theorem's binder type.

P-4 [kinematic] Second-channel recomputation of every figure the receipt block prints: the one-bit invoice from the file's own constants, 2.870978885078724e-21 J, equal to the printed value; the GF(2) split 1344 + 2752 = 4096; the two extracted witness binaries re-run, 248/0 and 1123/0; all four block hashes recomputed from the comment bodies, b5d12f7326e196c2, 71b7f40030f0e0a3, baaade085b6b9f30, cce652c6a88e8fd0, each equal to its printed line. No finding.
