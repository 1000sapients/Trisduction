# Publication Library — Taxonomy Manifest

Machine-readable filing map for the Publication Library. Human-readable rule
lives in `Publication Library/README.md`; this file is the parseable twin.
Tools: read the `yaml` block below.

```yaml
version: 1
updated: 2026-07-22
repo: 1000sapients/Trisduction
branch: main
root: "Publication Library"

# Codex machinery. Never filed under the library, never moved here.
excluded_paths:
  - "psp/"
  - "protocols/"
  - "master/"
  - "Theological PSP Codex/"
  - "tools/"
  - "INDEX.md"
  - "CODEX_DELETIONS.log"

path_shape: "Publication Library/<Category>/<Sub-area>/<Topic>/<file>"
depth:
  target_folder_levels: 4   # library + category + sub-area + topic, then the file
  rule: "guideline"         # collapse to one subject level for a thin shelf; never file directly inside a category
file_types: ["pdf", "docx", "md"]
naming:
  spaces_allowed: true
  avoid_chars: ["?", "#", "%"]

categories:
  - name: "Science"
    desc: "physics, cosmology, empirical natural-science work"
  - name: "Mathematics"
    desc: "foundations, complexity theory, algebra, analysis"
  - name: "Philosophy"
    desc: "logic, epistemology, philosophy of mathematics and science"
  - name: "Metaphysics"
    desc: "ontology, first-principles work, Trisduction architecture"
  - name: "Scripture"
    desc: "Qur'anic and cross-scripture exegesis, root-linguistic (REX) and geometric readings"

category_rule:
  flexible: true
  working_range: [4, 5]
  add_new: "new top-level folder + one line in Publication Library/README.md; no migration of existing files"

# Active sub-structure. Extend the same corpus/study-type pattern to Torah, Gospel, Veda, etc.
subtrees:
  Scripture:
    Quran:
      - "Lexical Studies"    # root and concept studies
      - "Surah Studies"      # verse-by-verse readings
      - "Thematic Studies"   # cross-verse themes

moves:
  allowed_on: "owner explicit instruction"
  log_file: "CODEX_DELETIONS.log"
  log_format: "DATE | old/path | MOVED|RETIRED | new/path or superseded-by | note"
  note: "move = delete-old + add-new; git history preserves every prior path"

filed:
  - category: "Science"
    path: "Publication Library/Science/Physics/Emergent Gravity/Emergent_Substrate_Gravity_Journal.pdf"
  - category: "Mathematics"
    path: "Publication Library/Mathematics/Complexity Theory/P versus NP/Why the Structural Verdict on P versus NP Is the Only One Left Standing - Mathematics Proves That Mathematics Cannot Rule Here.pdf"
  - category: "Scripture"
    path: "Publication Library/Scripture/Quran/Lexical Studies/Quranic_Stations_REX_Geometric.md"

inherited_guardrails:
  - "Git Automation: push only on explicit yes/no confirmation"
  - "Credential Containment: token used operationally once, never rendered, never committed"
  - "Codex-First and source-of-truth pointers"
```
