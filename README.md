# TRISDUCTION CODEX

GitHub-hosted register for the Trisduction. Two classes of content, plus its own tooling and a plain capability statement.

Read CAPABILITIES.md first. It is the authoritative account of what the tooling can and cannot do. tools/ holds the source of truth: codex_add.py for text ledger entries, codex_put.py for binaries and any-folder files including PDFs, build_index.py for the index and census.

## Content

Ledger entries, census-tracked. Every identifier is watched; no add may drop one.

    psp/          one file per PSP coordinate, filename = identifier
    protocols/    one file per protocol rule-module, filename = identifier
    INDEX.md      auto-generated index of live entries
    CODEX_RULES.md, CODEX_DELETIONS.log   hygiene contract and append-only removal manifest

Documents, append-only. A new version is a new filename; old versions are never deleted or overwritten.

    master/       versioned master codex, register of record, plus CURRENT.txt pointer
    preprints/    essays and papers for PhilArchive and similar

## How things arrive

Hands-off: open an Issue from the "Codex entry" template; the codex-add workflow parses it, runs the census, commits, comments, and closes. In session: instruct the assistant, which runs the git cycle. Master upgrades and preprints are file uploads and go through the session route via codex_put.py.

## Task vocabulary

    Publish PSP        publish/add/push PSP, log PSP, new coordinate     -> psp/<id>.md            (codex_add)
    Publish protocol   push protocol, protocol update, new rule-module   -> protocols/<id>.md      (codex_add)
    Update master      update main/master codex, new master, upgrade     -> master/<file>          (codex_put)
    Publish preprint   publish essay/preprint, add paper, philarchive    -> preprints/<file>       (codex_put)
    Any binary/doc     upload + name a path                              -> <any path>             (codex_put)
