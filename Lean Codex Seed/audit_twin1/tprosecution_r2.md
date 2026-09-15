# Prosecution · cycle twin1 · round 2 · registers: parameter, provenance
Artifact: twin_r2_seeded.f90. Named targets: the round-one counter, the ceiling lines, the corrected receipt.

P-1 [provenance] The NOMOS decoder rows claim identity with the source's compressible-bound instances, and the port reads a different statement. The source quantifies over every description SHORTER than n - c, decodes each, and counts the outputs of length exactly n against 2^(n-c) - 1. The twin instead takes descriptions of length exactly n - c, requires the padded length to fit in n, and counts distinct outputs; under that guard two of the four rows, the pad-3 and pad-4 rows, execute no iteration at all and pass with an image of zero. Two of four checks are vacuous and all four check the wrong statement. Falsifier: run the pad-4 row and print its iteration count.

P-2 [provenance] The posits section labels a check "every check above executed without consuming a posit: the batteries are arithmetic" and the condition it evaluates is that the check counter is positive. The label asserts a property of the code the check cannot see. Falsifier: read the condition.

P-3 [parameter] Frame ceilings: NMAX = 4 for the spine, 3 for T2 and T14, |Q| <= 4 on the canonical and execution frames, fuel 1024, 19683 grid maps, 561 rows. Each is printed where it binds and none is fitted to a verdict; a smaller ceiling shrinks the receipt and changes no check's truth. No finding.

P-4 [provenance] The four witnesses are carried with two lines changed each and the hashes of the untouched anchors cited in the appendix header; the twin's own receipt names the flags, the compiler version, and the run. Second channel on the receipt figures after the round-one repair: T6a 6368 and T13 520 recomputed by the binary and read from its output. No finding.
