# TRISDUCTION CODEX

GitHub-hosted register for the Trisduction. Two classes of content.

Ledger entries, census-tracked. Every identifier is watched; no add may drop one.

    psp/          one file per PSP coordinate, filename = identifier
    protocols/    one file per protocol rule-module, filename = identifier
    INDEX.md      auto-generated index of live entries
    CODEX_RULES.md, CODEX_DELETIONS.log   the hygiene contract and append-only removal manifest

Documents, append-only. A new version is a new filename; old versions are never deleted or overwritten.

    master/       versioned master codex, the register of record, plus CURRENT.txt pointer
    preprints/    essays and papers for PhilArchive and similar

## How entries arrive

Two routes. Hands-off: open an Issue from the "Codex entry" template; the codex-add workflow parses it, runs the deletion-proof census, commits, comments, and closes. In session: instruct the assistant, which runs the git cycle directly. Master upgrades and preprints are file uploads and go through the session route.

## Task vocabulary

    Publish PSP        publish/add/push PSP, log PSP, new coordinate     -> psp/<id>.md
    Publish protocol   push protocol, protocol update, new rule-module   -> protocols/<id>.md
    Update master      update main/master codex, new master, upgrade     -> master/<file> + CURRENT.txt
    Publish preprint   publish essay/preprint, add paper, philarchive    -> preprints/<file>

The master is the single source. PSP coordinates accumulate as individual entries between the occasional master upgrades and never rewrite it.
