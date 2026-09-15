# Prosecution · round 5 · registers: kinematic, definitional (restated, highest yield)
Artifact: lean_r5_seeded.lean (read alone). Named targets: the round-four docstrings on the rational's constructor and on the fuel-bounded Euclid, the round-three provenance note and three-gate contract.

## Findings

P-1 [kinematic] The prelude's own description says it does its work "in 134 lines". The section now spans lines 305 to 451, which is 147, because the round-four docstrings were added inside it. A count that was corrected once has rotted once. Falsifier: subtract the section's line numbers.

P-2 [kinematic] The theorem census was recomputed by two channels: a loose match on the keyword gives 175 lines of which two are prose, and a tight match on identifier grammar gives 172 because three names carry a namespace dot. Both channels agree on 173 real declarations, the banner's figure. The banner's axiom breakdown was re-executed on this candidate rather than carried: 126 axiom-free, 29 propext, 7 Quot.sound, 5 both, 6 on declared posits, 173 in all. No finding; recorded because the number was in play.

P-3 [kinematic] The recursion-budget note counts "2^11 first-failure patterns" among the censuses it covers, while the first-failure theorems beneath it are stated at widths 7, 8 and 12 and the widest enumerates 2^12 patterns. Falsifier: read the theorem's argument.

P-4 [definitional] The calibration of two wholly-odd sections is described in one docstring as "odd", while the theorem it restates, T8, proves the xor of two wholly-odd sections is even and the quotient descent three lines later depends on exactly that evenness. Falsifier: read the theorem's conclusion.

P-5 [definitional] The grade ladder's docstring now calls itself "complete: every claim in the corpus, past and future, ranks on it", which is a claim about a corpus the file does not contain and a future it cannot inspect; the type beneath it is nine constructors and a rank function, and completeness over an external corpus is neither stated nor provable there. Falsifier: name one claim outside the file that the type mentions.
