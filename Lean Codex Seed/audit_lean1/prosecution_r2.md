# Prosecution · round 2 · registers: kinematic, definitional (re-run of the voided round)
Artifact: lean_r2_seeded.lean (read alone). Scope: internal arithmetic and internal contradiction only.

## Findings

P-1 [kinematic] The banner and the closing contract both print "175 theorems" audited. Counting `theorem` declarations in the file, including those indented inside namespaces, and discarding the two prose lines that merely begin with the word, gives 173. The banner's own breakdown, 126 + 29 + 7 + 5 axiom classes plus 6 posit-dependent, sums to 173, so the file contradicts its own arithmetic at two sites. Falsifier: count the declarations.

P-2 [kinematic] The prelude section calls itself "ninety lines". It spans lines 295 to 428, which is 134 lines. Falsifier: subtract the line numbers.

P-3 [kinematic] The appendix block list prints line counts for its four embedded programs: 1346, 3375, 366, 102. Measured against the comment bodies as carried, the first two hold, the third is 371 after the repair the same appendix records as adding five lines, and the fourth is 126, of which 102 is the program unit alone with its banner excluded. Two of four printed counts are wrong by the file's own account. Falsifier: count the lines between each block's comment delimiters.

P-4 [definitional] The appendix says each extracted block "must reproduce the printed sha256 or the appendix is void", then prints an extraction rule that starts at the first compilation unit and therefore drops the banner comment that precedes it. Extracted by the printed rule, the first block is 1310 lines and cannot reproduce a hash printed for a 1346-line file. The rule and the contract name different objects. Falsifier: run the printed rule and hash the result.

P-5 [definitional] The identifier "D1" carries two incompatible meanings in one file: in the debt ledger it names the compile-receipt debt, and in the audit engine section it names the first of six drills, appearing in the strings "D1/D2 fail". A reader of "debt D1 discharged" and "D1 and D2 are the first two drills" is handed one token for two objects with no redefinition announced. Falsifier: grep the token.

P-6 [kinematic] The incompressibility docstring states the cap as a fraction "below 2^-2c" while the theorem beneath it bounds (2^(n-c) - 1)·2^c against 2^n, whose ratio is below 2^-c, one exponent, not two. The prose halves the exponent the theorem proves. Falsifier: divide the two sides of the printed inequality.

P-7 [definitional] The deletion operator is described as "an involution in the sense section 2 defines, returning every vector to itself", immediately after being proved idempotent and singular. Section 2 defines an involution by τ∘τ = id, which a singular operator cannot satisfy; the file proves the operator has no left inverse three lines later. The term is used in a second, incompatible sense. Falsifier: compose the operator with itself.

P-8 [definitional] The master theorem's docstring says it holds "for every frame and every involution without restriction", but the statement beneath it is a conjunction of one executed wall on a single named frame and one bijection on the canonical frame with its specific flip. The quantifier is widened in prose beyond what the type states. Falsifier: read the theorem's binders; there are none.
