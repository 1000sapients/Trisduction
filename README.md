# CODEX

Living store for PSP coordinates and protocol rule-modules. Every entry carries a stable identifier and is never silently lost. Entries arrive by instruction in chat and are pushed here by the assistant during a session, using the codex-git-sync skill.

## Layout

    psp/          One file per PSP coordinate. Filename is the identifier, e.g. SE-301.md
    protocols/    One file per protocol rule-module or update. Filename is the identifier.
    INDEX.md      Auto-generated. Every live entry. Do not hand-edit.
    CODEX_RULES.md        The hygiene contract.
    CODEX_DELETIONS.log   Append-only removal manifest. Never rewritten.

The tooling lives in the skill, not in this repo. This repo holds data only.
