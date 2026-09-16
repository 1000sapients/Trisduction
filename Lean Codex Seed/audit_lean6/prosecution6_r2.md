# Prosecution · cycle lean6 · round 2 · registers: parameter, provenance
Artifact: lean6_r2_seeded.lean.
P-1 [parameter] route_is_routeHalt now carries a bound n < 8, a fitted parameter the universal proof beneath it does not use; the four sample points become the only content. Falsifier: remove the bound and the proof still closes.
P-2 [provenance] gate_counts_forced cites reflection_eight_is_two_cubed, whose statement is allSigns.length = 2^3, for a conjunct stated as = 8; the term would not typecheck against the stated conjunct without a rewrite the theorem does not perform. Falsifier: read the two statements.
P-3 [provenance] The exemption list adds ToString to the deriving-generated instances; ToString Rat is written by hand in this file, was the site of M9b, and is now named and guarded. Falsifier: read instToStringRat.
P-4 [provenance] Every finding of the third-round documents is named in the version record as landed, refused or owed, in the order the second substrate set; M9b and ML5 are in the receipt as exit 1. No finding.
