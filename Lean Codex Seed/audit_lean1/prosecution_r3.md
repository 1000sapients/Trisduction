# Prosecution · round 3 · registers: parameter, provenance
Artifact: lean_r3_seeded.lean (read alone). Named target: the three-gate verification contract added in the prior round. Scope: internal contradiction and the artifact's own provenance claims only.

## Findings

P-1 [provenance] The provenance note under the source manifest records that the appendix A.1 fence recomputes to 438c033853b47aab while the treatise's printed receipt reads d2258c238be962c8, and attributes the gap to "line-ending or framing convention". Executed against the resident editions: d2258c238be962c8 is the 330-line fence of the v7 and v7.1 editions of the treatise, 438c033853b47aab is the 334-line fence of the v1.3 and v1.4 editions, and the four-line delta is docstring text only, under the deed-B paragraph and the T13 docstring, with no theorem statement or proof changed. The note's stated cause is wrong and its debt D3 is mis-typed: not a convention gap, two editions under one receipt. Falsifier: hash the fences of each edition.

P-2 [provenance] The new contract's mutation table cites "error at 900:25" for the deleted-hypothesis mutant. That line number was read against the prior file, and the contract now sits in a file whose earlier sections grew; the number no longer names the site it claims to. A receipt that cites a coordinate that has moved is a receipt that will be read as false by the first reader who checks it. Falsifier: open the candidate at line 900.

P-3 [provenance] Every receipt the file carries — the compile, the axiom audit, the four Fortran batteries, the mutation battery — was executed by the same substrate that authored the repairs the receipts certify, in one session, and the file's own audit engine types exactly that configuration as "self-check is not a witness: the verifier is never the claimant; token withheld". The file's doctrine and its receipts disagree about what the receipts are worth. Minimal falsifier: an independent execution on a second machine reproducing exit 0, the axiom list, and the battery counts; until then the receipts are interior by the file's own law.

P-4 [parameter] The recursion budget is set to 4,000,000 with the justification that the default of 512 is "a limit on the elaborator and never a limit on what is proved". No derivation of the figure is given; a smaller figure fails some census and a larger passes it, which is the signature of a fitted parameter. Falsifier: lower it until a census fails and state which.

P-5 [parameter] The exact rational's Euclid fuel is 1024 with the claim that it "bounds Euclid on any pair below 2^700". Recomputed: the worst case is consecutive Fibonacci numbers, F_k < 2^700 gives k ≤ 1008, hence at most 1007 division steps, under 1024 by sixteen. The claim holds; it is recorded here as verified because the margin is thin and was not printed.

P-6 [kinematic] The appendix receipt block prints the one-bit Landauer invoice at 300 K as 2.870978885078724E-20 J. From the constants the same file defines, k_B = 1.380649e-23 and ln 2 = 0.6931471805599453, the product with T = 300 is 2.87e-21 J, one order of magnitude below the printed figure. Falsifier: multiply the three printed inputs.

P-7 [definitional] The wholly-odd family is defined in section 2 by d(τx) = ¬d(x) for all x, and its docstring later describes the same type as "every target odd at the seat x₀, whatever it does elsewhere", which is oddness at one point. The file itself insists the two strengths are "named and never interchanged". Falsifier: compare the type's predicate with the docstring.

P-8 [provenance/scope] The adjugate identity is carried as a typed open obligation "discharged per-instance", and its sample list is then introduced as "the identity, verified for every rational matrix". Six matrices are not every matrix; the docstring promotes a per-instance discharge to the universal closure the same section says awaits a ring proof. Falsifier: count the matrices.
