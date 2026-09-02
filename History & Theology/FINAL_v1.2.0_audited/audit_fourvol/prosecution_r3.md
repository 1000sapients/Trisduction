L1 Vol II: {'unentered terminus': 27, 'receiver-located deficit': 13, 'escalation of the figure': 46, 'passive grammar of receipt': 173}
L1 Vol III: {'unentered terminus': 12, 'receiver-located deficit': 47, 'escalation of the figure': 89, 'passive grammar of receipt': 126}
L1 Vol IV: {'unentered terminus': 19, 'receiver-located deficit': 12, 'escalation of the figure': 35, 'passive grammar of receipt': 85}
L3 unlicensed non-Hebrew-corpus lines in Vol II: 4 [(19, '**The single-corpus constraint.** Every load-bearing claim rests on the Hebrew Bible. Seco'), (436, '**The text.** BHS, which is to say the Leningrad Codex with its apparatus. Where a reading'), (444, '**What is outside.** Everything else, without exception. The deuterocanonical books. The p'), (5411, '*A scope claim about the source corpus.* Books II and III of a companion study were descri')]
L4 overlap II/III: 1.023%
L4 overlap II/IV: 0.266%
L4 overlap III/IV: 0.276%

FINDINGS: 13
  P-1 [limit] [COSMETIC] Vol II ch.34: Vol II: "Six designations" after an italic enumeration of 3 items || falsifier: count the italic items
  P-2 [symmetry] [STRUCTURAL] Vol III ch.10: Vol III: one sentence uses "instrument" for the corpus's own remedy (the act of memory) and for this book's evidentiary apparatus; the two are different objects and the sentence identifies them || falsifier: read the Reading Conventions' definition of the evidence labels agains
  P-3 [limit] [LOAD-BEARING] Vol II ch.103: Vol II: "That is the whole of the Hebrew Bible's royal theology in the first verse" states as the whole corpus's royal theology what the chapter had scoped to Book VI's finding; Psalm 72:1 cannot carry the corpus || falsifier: the chapter's own scope sentence one paragraph up
  P-4 [limit] [STRUCTURAL] Vol IV: Vol IV: block says the closing movement states the no-name/no-arrival clause; not found in the last 60k chars || falsifier: read the closing movement
  P-5 [limit] [LOAD-BEARING] Vol II: Vol II line 19: non-Hebrew corpus reference outside the licensed zones: **The single-corpus constraint.** Every load-bearing claim rests on the Hebrew Bible. Seco || falsifier: open the line
  P-6 [limit] [LOAD-BEARING] Vol II: Vol II line 436: non-Hebrew corpus reference outside the licensed zones: **The text.** BHS, which is to say the Leningrad Codex with its apparatus. Where a reading || falsifier: open the line
  P-7 [limit] [LOAD-BEARING] Vol II: Vol II line 444: non-Hebrew corpus reference outside the licensed zones: **What is outside.** Everything else, without exception. The deuterocanonical books. The p || falsifier: open the line
  P-8 [limit] [LOAD-BEARING] Vol II: Vol II line 5411: non-Hebrew corpus reference outside the licensed zones: *A scope claim about the source corpus.* Books II and III of a companion study were descri || falsifier: open the line
  P-9 [limit] [LOAD-BEARING] set: II/III shingle overlap 1.02% at or above 0.2% || falsifier: shingle
  P-10 [limit] [LOAD-BEARING] set: II/IV shingle overlap 0.27% at or above 0.2% || falsifier: shingle
  P-11 [limit] [LOAD-BEARING] set: III/IV shingle overlap 0.28% at or above 0.2% || falsifier: shingle
  P-12 [symmetry] [STRUCTURAL] companion block, all three volumes: the block says "The geometry stands on its own ground"; Vol II and Vol III never use the term in their bodies, and Vol IV uses it once to name its structural apparatus while stating that Chapters 9 to 13 rest "on lexical distribution and citation rat || falsifier: grep "geometr" in each body
  P-13 [symmetry] [STRUCTURAL] companion block, all three volumes: the block says the three readings are made "by the same instrument"; the removability criterion that is Vol II's and Vol IV's instrument does not appear in Vol III (removability present: {'II': True, 'III': False, 'IV': True}), whose instrument is th || falsifier: grep removability / strength rule per volume
