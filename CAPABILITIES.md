# CAPABILITIES

Authoritative statement of what the codex tooling can and cannot do. If any skill copy disagrees with this file, this file wins. The tools live in this repo under tools/ and are the source of truth. Any session or agent should read this before assuming a limit.

## Two tools, different jobs

tools/codex_add.py handles text ledger entries only. It accepts --section limited to psp or protocols, prepends a markdown header, and writes {id}.md. It runs the deletion-proof census. It cannot take a binary and must not be used for PDFs. Correct use: a PSP coordinate or a protocol rule-module as markdown.

tools/codex_put.py handles arbitrary files into arbitrary folders. Arguments are --src and --dest, with optional --pointer and --message. It copies bytes with shutil.copy2, so binaries including PDF are preserved exactly. No header is added, no extension is forced, no folder is restricted. Correct use: master codex files, preprints, papers, any binary or document to any path such as paper/ or preprints/.

So: uploading a PDF to a paper/ or preprints/ folder is supported. It goes through codex_put.py, never codex_add.py. A prior claim that "the skill cannot upload a PDF" is true only of codex_add.py read in isolation and false of the tooling as a whole.

## Tasks and routing

    Publish PSP        text entry   -> tools/codex_add.py  -> psp/<id>.md          census-tracked
    Publish protocol   text entry   -> tools/codex_add.py  -> protocols/<id>.md    census-tracked
    Update master      file upload  -> tools/codex_put.py  -> master/<file>        append-only, + CURRENT.txt
    Publish preprint   file upload  -> tools/codex_put.py  -> preprints/<file>     append-only
    Any binary/doc     file upload  -> tools/codex_put.py  -> <any path>           append-only

PSP and protocol text entries can also arrive hands-off through the Issue-to-commit workflow in .github/. File uploads run in session because a browser Issue body cannot carry a binary.

## Invariants

Ledger entries under psp/ and protocols/ are census-guarded: no add may drop an existing identifier. Documents under master/, preprints/, and any other path are append-only: a new version is a new filename, nothing is overwritten or deleted. The token is fine-grained, single-repo, Contents read-and-write, used live and never stored in any file. These hold regardless of which tool runs.
