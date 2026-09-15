# Prosecution · round 6 · registers: kinematic, definitional (restated)
Artifact: lean_r6_seeded.lean (read alone). Named target: the round-five prelude sentence.

## Findings

P-1 [definitional] The prelude sentence repaired last round now reads "built here from `Init` alone, in" at the end of one line and "in one short section" at the start of the next: the word is doubled at the joint of the repair, which is the joint the end-to-end read exists to catch. Falsifier: read the two lines together.

P-2 [kinematic] The appendix receipt block prints the one-bit Landauer invoice at 300 K as 2.870978885078724E-22 J. The same file defines k_B = 1.380649e-23 and ln 2 = 0.6931471805599453; their product with 300 is 2.87e-21, ten times the printed figure. Falsifier: multiply the three constants.

P-3 [definitional] The core-only right inverse is glossed as "g undoes f on the left, g (f a) = a", which is the definition the file gives its LEFT inverse one line above; the right inverse is defined as the left inverse with the roles swapped, f (g b) = b. The gloss names the other object. Falsifier: read the two definitions.

P-4 [definitional] T16 is titled "closed for every τ, involution or not" while its statement binds `hinv : Involution τ` as an explicit hypothesis, threaded through the backward map because the orbit collapse needs it. The title contradicts the binder. Falsifier: read the theorem's signature.
