# Prosecution · round 1 · registers: kinematic, definitional
Artifact: lean_r1_seeded.lean (read alone). Scope: internal arithmetic and internal contradiction only.

## Findings

P-1 [kinematic] The banner and the closing contract both print "175 theorems" audited. Counting `theorem` declarations in the file, including those indented inside namespaces, and discarding the two prose lines that merely begin with the word, gives 173. The banner's own breakdown, 126 + 29 + 7 + 5 axiom classes plus 6 posit-dependent, sums to 173, so the file contradicts its own arithmetic at two sites. Falsifier: count the declarations.

P-2 [kinematic] The prelude section calls itself "ninety lines". It spans lines 295 to 428, which is 134 lines. Falsifier: subtract the line numbers.

P-3 [kinematic] The appendix block list prints line counts for its four embedded programs: 1346, 3375, 366, 102. Measured against the comment bodies as carried, the first two hold, the third is 371 after the repair the same appendix records as adding five lines, and the fourth is 126, of which 102 is the program unit alone with its banner excluded. Two of four printed counts are wrong by the file's own account. Falsifier: count the lines between each block's comment delimiters.

P-4 [definitional] The appendix says each extracted block "must reproduce the printed sha256 or the appendix is void", then prints an extraction rule that starts at the first compilation unit and therefore drops the banner comment that precedes it. Extracted by the printed rule, the first block is 1310 lines and cannot reproduce a hash printed for a 1346-line file. The rule and the contract name different objects. Falsifier: run the printed rule and hash the result.

P-5 [definitional] The identifier "D1" carries two incompatible meanings in one file: in the debt ledger it names the compile-receipt debt, and in the audit engine section it names the first of six drills, appearing in the strings "D1/D2 fail". A reader of "debt D1 discharged" and "D1/D2 are Seal L itself" is handed one token for two objects with no redefinition announced. Falsifier: grep the token.

P-6 [kinematic] A docstring in the geometry section reports the exhaustive split of 4096 three-row systems as "1344 locked systems, 2652 degenerate systems". 1344 + 2652 = 3996, not 4096, and the two theorems directly beneath it decide the counts as 1344 and 2752. The prose contradicts the theorems it introduces. Falsifier: add the two numbers.

P-7 [definitional] The compartment-grade docstring calls "premise" the highest rung of the grade ladder. The ladder is declared in section 1 with premise first and lowest, and its rank function is decided on that order throughout. The later use inverts the defined order without announcing a redefinition. Falsifier: compare the rank function with the sentence.

P-8 [definitional] The gathering of the three forced counts closes with "Theorem grade: each conjunct proved above; the gathering is an arrangement." An arrangement of proved conjuncts is, by the file's own grade discipline, a structural claim; the sentence assigns the top rung to a result whose own description says it adds only arrangement. The tier is widened without warrant. Falsifier: check the grade the file assigns to arrangements elsewhere.
