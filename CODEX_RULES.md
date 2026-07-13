# CODEX RULES · Corpus Integrity

Binds every add, edit, and rebuild. Runs before formatting.

## Prime Rule
No identified entry is ever hard-deleted unless you name that exact identifier and ask for its deletion in the same instruction. Consolidate, clean up, merge, tidy: all mean reorganize, never destroy. Default on any removal is supersede-with-pointer.

## Ghosts
Every merge, supersession, or move leaves a two-line ghost:

    IDENTIFIER · TITLE · [SUPERSEDED BY id] or [MERGED INTO id] or [MOVED TO location]
    recover-from: session or file or blog reference where the full body lives

No ghost means a hard delete, which violates the Prime Rule unless it was a named override.

## Census on every build
Before any change take a census: the sorted list of every identifier in psp/ and protocols/. After, take it again and reconcile. entries_out = entries_in + adds − named-override deletions. Any identifier present before and absent after with no ghost and no logged override is a FAULT. The build halts and nothing is pushed. codex_add.py enforces this and refuses to push on a fault.

## Deletion manifest
Every removal appends one line to CODEX_DELETIONS.log: date, identifier, disposition, survivor or recovery pointer, and for a named override your instruction quoted. Append-only. Never rewritten.

## Named override
A hard delete happens only when you name the identifier. The assistant confirms it back, scans for dependents and holds if one exists, logs the deletion with your instruction quoted, then removes that one identifier and no neighbour.
