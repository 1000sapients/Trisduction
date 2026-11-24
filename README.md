# Trisduction

A public register of formal work: machine-checked proofs, papers, and the
verification framework that produced them.

Every formal claim in this repository is a Lean file that compiles, or it is
labelled with the grade it actually carries. Nothing here asks to be believed
on authority; each result can be re-checked from the files themselves.

## Contents

- `Publication Library/` — finished papers and essays, by subject, with the
  Journal PDFs. Deposits of record carry DOIs (Zenodo).
- `master/` — the framework codex, every version retained.
- The formal masters — Lean files whose papers state the compiler version,
  the theorem statements, and the axioms the main theorems depend on.

## Verification

Each formal paper names its Lean and Mathlib versions and prints the axiom
census of its main theorems. To check a result: take the .lean file, compile
it at the named versions, and compare the axiom print. Deposits of record:
Zenodo, SSRN, Internet Archive, PhilArchive, Academia.edu. This repository
is the working register; the DOI is the version of record.

## Method

Trisduction is a verification discipline. A claim is separated into
components that stand independently; each component is checked on its own;
and the claim is then stated only at the grade its checks support — theorem,
conditional, or premise, named as such. A premise a proof depends on is
disclosed in its statement, never hidden inside a definition.

## Authorship

The framework, the arguments, and the proof designs are by Mohammad F.
Islam, developed from first principles. AI systems were used as adversarial
reviewers — free to argue against every claim and to stress-test it — and
as scribes and compilers, entering and checking the formal text under his
direction. The commit history and the dated deposits are the record of that
process.

## About the author

Mohammad F. Islam is an independent researcher. He designed Trisduction, a
verification framework for formal claims, and is the author of the papers
and Lean formalizations in this repository. His work applies the framework
to open problems in mathematics and to the audit of claimed proofs,
including his own. ORCID: 0009-0003-1671-0664.

## Provenance and development record

Provenance, in the author's own account: [PREFACE.md](PREFACE.md).

| Record | Address |
|---|---|
| Trisduction, the general development record | https://trisduction.blogspot.com |
| Tractatus Veritatis Trisductivus, the master developmental record | https://tractatus-veritatis-trisductivus.blogspot.com |
| Esoteric Trisduction, the esoteric-register development | https://esoterictrisduction.blogspot.com |
| Study All Scriptures, the theological development record | https://studyallscriptures.blogspot.com |

The personal blog, precursor essays from August 2012:
https://this-is-what-you-ve-been-looking-for.blogspot.com

The mirrors: Medium at https://trisduction.medium.com and Substack at
https://trisduction.substack.com

| Venue | Address |
|---|---|
| PhilPeople and PhilArchive, profile and publications | https://philpeople.org/profiles/mohammad-islam/publications?order=added |
| Zenodo, search over the published record | https://zenodo.org/search?q=metadata.creators.person_or_org.name%3A%22Islam%2C%20Mohammad%22&l=list&p=1&s=10&sort=bestmatch |
| SSRN, author page | https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=10956828 |

## Citation

Cite the Zenodo DOI given in each paper.
