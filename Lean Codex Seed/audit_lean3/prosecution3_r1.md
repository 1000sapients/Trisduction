# Prosecution · cycle lean3 · round 1 · registers: kinematic, definitional
Artifact: lean3_r1_seeded.lean. Targets: the certified rational, the one router, the aperture, the record type, the omega token, the pair, the pins, the declaration typing, the rebuilt audit block.

P-1 [kinematic] The version record and the SECTION 0 header both say the invariant is proved "from two core lemmas over Nat.gcd". The CoreRat namespace declares three theorems: a constructive div_pos, the positivity of a gcd quotient, and the coprimality of a gcd quotient pair. Three, not two. Falsifier: count the theorems in the namespace.
P-2 [definitional] The certified rational totalizes inversion, 0⁻¹ = 0, and states it nowhere; a reader of `inv` who expects a partial inverse will read `a * a⁻¹ = 1` as unconditional, which it is not. The convention should be printed and the cancellation law's hypothesis named. Falsifier: evaluate (0:Rat)⁻¹.
P-3 [kinematic] A planted line says the two lemmas are over Nat.lcm; the code uses Nat.gcd throughout and no lcm appears in the file. Falsifier: grep.
P-4 [definitional] A planted comment beside route_is_routeHalt says the routers agree on "every dimension, unmeasured included", while the theorem checks dimensions 0, 1, 2 and 7 and the header says exactly that. Falsifier: read the theorem's four conjuncts.
P-5 [definitional] A planted docstring says the terminal claim's grade is pinned at analytic, while the pin beneath it reads .theorem and the claim's own grade field reads .theorem. Falsifier: read the pin.
P-6 [kinematic] Recount of the audit block against the file: 205 theorem declarations, 335 roster guards, 391 names in the cone, the census figures summing to 205, the claim table's six rows each matching a live guard line. No finding.
