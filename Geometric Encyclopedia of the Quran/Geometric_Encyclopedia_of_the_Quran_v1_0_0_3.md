---
edition: encyclopedia
title: Geometric Encyclopaedia of the Qurʾān
subtitle: Seed Corpus
volume: 1.0.0.3
range: A-T
accent: copper
---

<!--
GEOMETRIC ENCYCLOPAEDIA OF THE QURʾĀN · Seed corpus · Version 1.0.0.3

Version scheme: an odometer. The three digits after the major version are the
entry census and nothing else may move them. 1.0.0.1 is one entry, 1.0.0.9 is
nine, 1.0.1.0 is ten, 1.9.9.9 is nine hundred and ninety-nine, and 2.0.0.0 is
one thousand, which is why the second major version arrives exactly at a
thousand entries. A fifth component, where present, is the revision at that
census: 1.0.0.2.1 is the second entry's corpus, first revision. It never
disturbs the odometer.

Resolution: highest numeric tuple within the stem, EXCLUDING any file listed in
GHOSTS.md. Ghosted files are retained in place, never deleted, and never
resolved to.

Filing key: strip a leading article and any bracket, decompose NFKD, drop
combining marks, drop hamza and modifier letters, drop non-alphanumerics,
lowercase. Entries are stored sorted, because a letter opener out of sequence
breaks multi-column flow at render and silently discards the remainder.

Spines: Abrogation reads from CN-PSP-ABROGATION-RELOCK-01 at SC-089, Taḥrīf from
CN-PSP-TAHRIF-GRANT-01 at SC-088, and Maʿiyya from CN-PSP-PLUS-ONE-MASTER-01 at
SC-093, all in the theological register. Cite identifiers only; SPINE_INDEX.md
resolves them to the current codex source.

Census: 3 entries, 3 major, 0 standard, 0 redirect stubs.

Commissioned heads, sixteen, are listed in COMMISSIONED.md and are not entries. A
commissioned head is not a redirect stub: a redirect stub is a real head pointing a
variant at an entry that treats the matter, while a commissioned head names a
headword the work owes. Conflating them would put forthcoming lines in the corpus
and send a reader nowhere. The absolute-stubbing rule at section 2 of the skill
should read "stubbed or commissioned in the same pass" and does not yet; this was
found by executing that rule for the first time.
-->

<!-- ═════════════════════════════════════════════════════════════════════
     ENTRY LEDGER · INTERNAL · MUST NOT RENDER
     Scribe-facing footprints. An entry listed PASS here has already been
     audited; re-auditing it is low priority. This block is an HTML comment
     and the renderer must never surface it. Verified non-rendering by text
     extraction on every build; see the skill, hard rule R.
     ─────────────────────────────────────────────────────────────────────
     entry        tier   spine   spine-audit    entry-audit    apertures
     Abrogation   major  SC-089  PASS TA3 r7    PASS EQG1 r5   3 spine, 2 entry
     Maiyya       major  SC-093  NONE           PASS x2        1 entry (extent)
     Tahrif       major  SC-088  PASS TA3 r7    PASS EQG1 r5   3 spine, 2 entry
     ─────────────────────────────────────────────────────────────────────
     CYCLE LOG
     TA3   spines SC-088 SC-089 · 7 rounds · 6/6 registers · controls 3/3 SELF
           SEALED-ROUND r7 · E3 S6 RS2 A3 · 1 tier demoted, none raised
           scoped: inevitability split class from instance; three-type map not
           exhaustive; ABR-CHK demoted from evidence to illustration
           errata: ERR-1 attestation before sweep PASS; ERR-2 tier rise logged
     EQG1  entries · 5 rounds · 6/6 registers · controls 3/3 SELF
           SEALED-ROUND r5 · E3 S2 RS0 A2 · no tier raised
           earned: Zayd citation marked unverified; Tahrif entry realigned to its
           hardened spine; q.v. pointers introduced against the delegation collapse
           scoped: independence narrowed to argument and analysis
           errata: ERR-1 sweep spec banned a phrase the repair kept, a repeat of
           the same mechanism as TA3 ERR-1
     MAIYYA  cycle maiyya  · 6 rounds · 6/6 registers · controls 3/3 SELF
             SEALED-ROUND r6 · E7 S1 RS2 A0 · no tier raised
             earned: count contradiction; AH/CE collision; fixed point and eigenvalue
             demoted on a membership error; bridge map; falsifiers; Fidelity Lock on a
             recalled year
             errata: ERR-1 prosecuted the clean copy not the seeded one; ERR-2 attested
             a detection on an unplanted copy, round 5 void
     MAIYYA2 cycle maiyya2 · 5 rounds · 6/6 registers · controls 3/3 SELF
             SEALED-ROUND r5 · E4 S0 RS2 A1 · no tier raised
             earned: unexecuted Hebrew; a recalled metathesis mechanism withdrawn; the
             barred scoring direction caught in the entry's own new prose; a falsifier
             for the comparative claim
             errata: ERR-1 a filing loop failed silently and closed a round at zero;
             ERR-2 a second unplanted-copy attestation, round 3 void, repaired at the
             tool with plant.py rather than at the round
     ─────────────────────────────────────────────────────────────────────
     OPEN APERTURES, each awaiting a supplied external witness
     spine  membership conditions for chart-substitution
     spine  deletion test executed by the seat that authored the claim
     spine  bridge map for the register distinction the pair asserts
     entry  classical death dates conventional but unattributed
     entry  bivalence check: Maiyya supplies the negative case, a particle has no
            bivalent field, so the check no longer stands unfalsified
     entry  MAIYYA extent 3532 words against a 3250 ceiling; three governing rules
            collide and the architect's ruling is the witness
     ─────────────────────────────────────────────────────────────────────
     DEBT
     see-delegations dangle; the count must trend down
     SC-093 has never been through the adversarial cycle; Maiyya carries the entry
       audit and not the spine audit, so the two-audit gate is not satisfied
     Abrogation 4119 words and Tahrif 3139 against the 3250 ceiling seated at v1.5.0
     Abrogation and Tahrif predate the cross-scriptural mandate and carry no stated
       result, positive or negative; the auditor FAILs an entry carrying none
     16 commissioned heads owed
     bivalence negative case owed before the finding carries weight
     ═════════════════════════════════════════════════════════════════════ -->

:::corpus

:::letter A

# Abrogation (naskh, نسخ)

<!-- ADMISSION: date=2026-08-19; spine=SC-089; spine-audit=PASS-TA3-r7; entry-check=PASS; entry-audit=PASS-EQG1-r5; rounds=5 -->


The replacement, withdrawal or supersession of a revealed ruling by a later one. The Arabic term is *naskh*, from the root *n-s-kh*, and the derived pair *nāsikh* and *mansūkh*, the abrogating and the abrogated, names the relation between the two rulings. The doctrine is the principal instrument by which the interpretive tradition reconciled rulings that appear to conflict, and the largest single question it raises is not which verses abrogate which, but what kind of relation abrogation is. It is not a verdict relation, in which a later ruling corrects or outranks an earlier one, but a re-lock relation, in which one architecture closes twice on two different states of the world. The distinction is not a refinement of terms. It decides whether the doctrine implies development in the source, and it decides which of the tradition's three recognised types the corpus can actually carry.

## The literature

The scholarship on *naskh* is large, old and unusually revealing, because the doctrine's own history is the best evidence about what kind of thing it is. Five registers carry it and they do not agree.

### The indigenous genre and its count curve

*Nāsikh wa-mansūkh* became a literary genre early, and the works are lists: this verse abrogates that one. A treatise is attributed to al-Zuhrī (d. 124 ⁄ 742); the earliest surviving major work is that of Abū ʿUbayd al-Qāsim b. Sallām (d. 224 ⁄ 838); al-Naḥḥās (d. 338 ⁄ 950), Ibn Salāma (d. 410 ⁄ 1019), Makkī b. Abī Ṭālib al-Qaysī (d. 437 ⁄ 1045) and Ibn al-Jawzī (d. 597 ⁄ 1201) each produced one, and al-Suyūṭī (d. 911 ⁄ 1505) devoted a chapter of ~al-Itqān~ to it.

The single most instructive fact in the whole field is what happened to the count. Powers assembled the figures and the curve is steep in both directions: roughly 42 abrogated verses in the treatise attributed to al-Zuhrī, 138 in al-Naḥḥās, 238 in Ibn Salāma, and an apparent ceiling near 231 to 248 in Ibn al-ʿAtāʾiqī and al-Fārsī. Then it collapses. Al-Suyūṭī, following the Mālikī jurist Ibn al-ʿArabī (d. 543 ⁄ 1148), recognised about twenty. Shāh Walī Allāh al-Dihlawī (d. 1176 ⁄ 1762) in ~al-Fawz al-kabīr~ accepted five, and gave reasons for rejecting the other fifteen.

A count that rises sixfold across three centuries and then falls by a factor of fifty is not a doctrine converging on its object. It is a category whose admission criteria were never fixed, expanding while the criterion was loose and contracting whenever someone tightened it. Every later contraction was achieved the same way, by asking whether the two verses in question were really addressed to the same matter, which is the question this entry formalises below.

### Legal theory, and the narrowing vocabulary

The disciplining move belongs to al-Shāfiʿī (d. 204 ⁄ 820), whose ~al-Risāla~ made abrogation a claim requiring evidence rather than an assertion available to any disputant, and demanded that the chronological order of the two rulings be shown. He restricted abrogation within kind, a verse by a verse and a practice by a practice, and the schools then divided over whether the Prophetic practice and the Qurʾān could abrogate one another, the Ḥanafīs generally permitting what the Shāfiʿīs did not.

More important for the present entry is a vocabulary the jurists developed alongside *naskh* and largely at its expense. Where an apparent conflict could be resolved by narrowing rather than cancelling, they named the operation *takhṣīṣ*, specification, or *taqyīd*, restriction, or *tabyīn*, clarification, with *istithnāʾ* and *sharṭ* for exception and condition. Each of these describes a later text that limits an earlier one without voiding it, and each removes a case from the abrogation ledger. Al-Shāṭibī (d. 790 ⁄ 1388) pressed the tendency furthest in ~al-Muwāfaqāt~, treating most of what earlier scholars called *naskh* as *bayān*, clarification, and thereby reducing genuine abrogation to a remainder. The tradition, in other words, generated its own instrument for distinguishing replacement from restriction and used it to shrink the doctrine from within.

### Theology and the polemical setting

The theological objection was never internal in origin. Jewish and Christian interlocutors argued that a God who replaces His own law has changed His mind, and Jewish thinkers, Saadia Gaon among them, defended the Torah's perpetuity against exactly this. Muslim theologians answered by locating the change in the addressee's circumstance rather than the sender's knowledge, and by denying *badāʾ*, the emergence of a new consideration, of the divine. Imāmī Shīʿī theology is the notable divergence, admitting a form of *badāʾ* rather than refusing it outright, which means the term does not carry the same load across the tradition and citations to it need their school attached (see [[see:SHIʿISM AND THE QURʾAN]]; [[see:THEOLOGY AND THE QURʾAN]]).

### Modern Muslim scholarship

The modern current runs almost uniformly toward restriction. ʿAbduh and Rashīd Riḍā in ~al-Manār~ treated most claimed instances as specification. Muḥammad al-Ghazālī and, in the Indian subcontinent, the line descending from Shāh Walī Allāh pressed the count toward zero. The sharpest departure is Maḥmūd Muḥammad Ṭāhā's ~The second message of Islam~, which inverts the received direction entirely, holding the universal Meccan revelation to be the abiding message and the Medinan legislation the time-bound one, a position carried into English and into constitutional argument by Abdullahi Ahmed An-Naʿim in ~Toward an Islamic reformation~. Fazlur Rahman's double-movement hermeneutic reaches a similar restriction by a different road, reading the particular ruling as the historical instantiation of a general principle rather than as a candidate for cancellation.

### Western scholarship

Nöldeke and Schwally treated abrogation as a secondary harmonising device. Goldziher and Schacht read the doctrine chiefly as an instrument of legal development, which led Schacht to underweight the qurʾānic material. John Burton inverted the standard inference in ~The collection of the Qurʾān~ and ~The sources of Islamic law~: a theory that some verses were removed from the text presupposes a text closed enough to be removed from, so the abrogation literature is evidence about canonisation rather than against it. Wansbrough read the same material toward the opposite conclusion, a later and more gradual stabilisation. Powers' study of the genre remains the indispensable account of the literature as literature rather than as doctrine. Louay Fatoohi's ~Abrogation in the Qurʾān and Islamic law~ is the only monograph in English devoted to the subject, and argues that the doctrine is not derivable from the corpus and conflicts with its principles.

### The contemporary political register

One claim dominates public argument and it deserves exactness. Al-Suyūṭī reports Ibn al-ʿArabī holding that the qurʾānic verses counselling forbearance are abrogated by Q 9:5, on some countings 124 verses cancelled by one. The claim is now made by polemicists against the corpus and by militants within it, in each case to the same end, and it is a maximal reading of a doctrine whose own tradition had been shrinking for eight centuries. It also fails the tradition's own test, since Q 9:5 sits in a passage addressed to treaty-breaking parties, and its immediate neighbours grant safe conduct and require it to be honoured. Firestone, Afsaruddin and Cook have each traced how the sword-verse reading was built, and Fatoohi devotes a chapter to dismantling it (see [[see:JIHAD]]; [[see:WAR]]; [[see:TOLERANCE AND COMPULSION]]).

### The manuscript register

Physical evidence entered the question only recently. The Ṣanʿāʾ palimpsest carries a lower text of a non-standard type, published and analysed by Sadeghi with Bergmann and with Goudarzi, and it bears on the claims about withdrawn wording, though not in the direction usually assumed. It attests variation among early codices in ordering and wording. It does not attest a verse withdrawn from the corpus whose ruling remained in force, which is a different claim and the one that would need physical support (see [[see:CODICES OF THE QURʾAN]]; [[see:MANUSCRIPTS OF THE QURʾAN]]).

### What the literature has not asked

Topic and primary sources overlap with the standard reference literature, which is expected of any entry on this term and is declared here rather than left implicit; what is built independently is the argument and the analysis. The field divides between histories of the doctrine, counts of its instances and arguments about its extent. Almost none of it asks what kind of relation abrogation is. The count curve above is treated as a fact about scholarly disagreement rather than as a symptom, and the narrowing vocabulary of *takhṣīṣ* and *bayān* is treated as a set of legal categories rather than as an unfinished attempt at the same distinction. That question is taken up below.

## The root and its bivalence

The root *n-s-kh* enters the Qurʾān carrying two senses that are opposite in what they do to the original, and the whole later difficulty descends from that fact.

The first sense is copying. At Q 7:154 the tablets given to Moses AS are described with *nuskha*, a written copy or transcript, and at Q 45:29 the record of deeds speaks with {{ar:إنا كنا نستنسخ}}, *innā kunnā nastansikhu*, we were having transcribed. The ordinary Arabic idiom is the same, *nasakha l-kitāb*, he copied the book. The essential feature of this sense is a plurality of texts in which both members survive. Copying adds; it removes nothing.

The second sense is effacement. At Q 22:52 what the adversary casts is nullified, {{ar:فينسخ الله ما يلقي الشيطان}}, *fa-yansakhu llāhu mā yulqī l-shayṭān*, then God ﷻ effaces what Satan casts, and then, in the same breath, {{ar:ثم يحكم الله آياته}}, *thumma yuḥkimu llāhu āyātihi*, then God ﷻ makes His signs firm. The ordinary idiom again matches: *nasakhat al-shams al-ẓill*, the sun replaced the shade, and *nasakhat al-rīḥ al-āthār*, the wind effaced the traces of an encampment. The essential feature here is that one thing takes the place of another, and the displaced member does not survive alongside it.

Duplication preserves the original and effacement destroys it. A term that carries both, at the same register, cannot be closed by definition, and this is the correct explanation for a fact the tradition itself records without quite naming: no single account of *naskh* ever became standard, and the exegetes handled the qurʾānic occurrences as unrelated contexts rather than as instances of one operation. The word is not one operation with a disputed definition. It is a field of two, and every later theory is a choice of horn. Note that the second sense at Q 22:52 already carries the resolution in its own second clause. What follows effacement is not a gap but a firming, *yuḥkimu*, from the same root that gives *muḥkam*, the firmly established, so that the motion described is removal and establishment as one act rather than removal alone.

## The qurʾānic base

Four passages carry the doctrine, and read on their own terms they say less than the doctrine built on them and something more interesting.

Q 2:106 is the locus classicus: {{ar:ما ننسخ من آية أو ننسها نأت بخير منها أو مثلها}}, *mā nansakh min āyatin aw nunsihā naʾti bi-khayrin minhā aw mithlihā*, whatever sign We efface or cause to be forgotten, We bring one better than it or its like. Two features are load-bearing and both are routinely passed over. First, *āya* means sign, and its restriction to verse of scripture is a reading and not a given; the same word carries natural signs, dispensations and miracles across the corpus, so the verse may be speaking of the succession of prophetic dispensations (q.v.) rather than of verses inside one book (see [[see:SIGNS]]; [[see:REVELATION AND INSPIRATION]]). Second, and decisively, the promise is disjunctive. *Better than it or its like.* A replacement that is merely equivalent satisfies the verse. Any reading that makes abrogation a mechanism of improvement has silently deleted the second branch, and the second branch is the one that tells you what kind of relation this is.

Q 16:101 supplies the vocabulary of substitution: {{ar:وإذا بدلنا آية مكان آية}}, *wa-idhā baddalnā āyatan makāna āyatin*, and when We substitute one sign in the place of another. The context is the answer to an accusation, that the Prophet Muhammad ﷺ is merely a forger, *innamā anta muftarin*. The verse is therefore not a technical description of an exegetical operation. It is a reply to the charge that change in the message betrays a human author, and its answer is that the substitution is the sender's act (see [[see:FORGERY]]; [[see:INIMITABILITY]]).

Q 87:6-7 concerns retention rather than rulings: {{ar:سنقرئك فلا تنسى إلا ما شاء الله}}, *sanuqriʾuka fa-lā tansā illā mā shāʾa llāh*, We shall make you recite, and you will not forget, save what God ﷻ wills. It supplies the exception clause that Q 2:106 uses, and nothing beyond it.

Q 13:39 is the passage on which this entry turns, and it is the one the doctrine leans on least: {{ar:يمحو الله ما يشاء ويثبت وعنده أم الكتاب}}, *yamḥū llāhu mā yashāʾu wa-yuthbitu wa-ʿindahu ummu l-kitāb*, God ﷻ effaces what He wills and establishes, and with Him is the Mother of the Book (q.v.). The verse gives two registers in one sentence. There is a register in which effacing and establishing occur, and there is the Mother of the Book, which is with Him and is not said to change (see [[see:PRESERVED TABLET]]; [[see:HEAVENLY BOOK]]). Everything the doctrine of abrogation describes belongs to the first register. Nothing it describes reaches the second.

## What the two registers settle

The gravest objection to abrogation was always theological rather than exegetical. If a later ruling replaces an earlier one, does the sender not appear to have revised, and does revision not imply that something was learned in the interval? The tradition met this by insisting that the divine will does not alter and the divine knowledge does not develop, that each ruling was proper to its own time, and that what changes is the addressee's circumstance and not the sender's mind. That answer is correct, and Q 13:39 supplies it directly rather than by inference. The effaceable is one register; the Mother of the Book is another. A change confined to the first is not evidence about the second, and the corpus states the partition itself rather than leaving it to be constructed.

Two further passages fence the same boundary from the other side. Q 6:115 closes with {{ar:لا مبدل لكلماته}}, *lā mubaddila li-kalimātihi*, none can change His words, and Q 18:27 repeats it. The corpus therefore both affirms substitution, at Q 16:101 with *baddalnā*, and denies it, at Q 6:115 with *mubaddil*, using the same root. This is not a contradiction to be smoothed. It is the partition again, marked lexically: substitution is the sender's own act at the manifest register, and is unavailable to anyone else at any register.

## The geometric reading

Read structurally, a ruling stands on three things that are genuinely distinct, and the entry's thesis is a statement about which of the three moves.

There is what stands: the revealed wording, the text as it is given. There is what moves: the state of the community the ruling addresses, its strength and weakness, its circumstances and its capacity, and every actuation there has a real cost. And there is how the two bind: the ruling itself, the registration of that wording upon that state. The three are separable, and the test is that removing any one leaves the other two unable to produce a ruling at all. A wording with no addressee registers nothing. A community with no wording has no ruling to receive. And a binding with neither term is empty.

Abrogation, on this reading, is what happens when the second of the three changes while the first is preserved. The community at Mecca and the community at Medina are not the same state, and a ruling addressed to the first is not thereby defective when a different ruling is issued to the second. The reading closes twice, on two states, and the two closures are two readings of one architecture rather than two competitors for one truth. Nothing in the first is corrected by the second. This is why the disjunction at Q 2:106 is exactly right and not a concession: where the state changes but the quality of what is given does not, a replacement that is merely *mithlihā*, its like, is precisely what one should expect.

The change of the direction of prayer is the clean case, and the corpus glosses it itself. At Q 2:143, of the former direction: {{ar:وما جعلنا القبلة التي كنت عليها إلا لنعلم من يتبع الرسول ممن ينقلب على عقبيه}}, *wa-mā jaʿalnā l-qiblata llatī kunta ʿalayhā illā li-naʿlama man yattabiʿu l-rasūla mimman yanqalibu ʿalā ʿaqibayhi*, and We appointed the direction you were formerly facing only that We might know who follows the Messenger from who turns on his heels. The earlier direction is given a function, and the function is to discriminate at a moment. A ruling whose stated purpose is indexed to a moment is not improved upon when the moment passes (see [[see:QIBLA]]; [[see:PRAYER]]).

!seal ⟀ GOL

## Substitution and begetting

Two rulings can stand in either of two relations, and the received term covers both without distinguishing them. The distinguishing quantity is not which came first.

In the first relation the later ruling occupies the seat the earlier held. Both bear on the same matter, and to face Mecca is to occupy the position that facing Jerusalem occupied. Two points on one axis. Nothing new is opened, and the correct name is substitution.

In the second relation the later ruling opens a matter the earlier did not address. The two do not compete for a seat, because they do not share one. Here the earlier is not replaced at all, and the pair encloses more than either alone.

The graduated treatment of intoxicants is best read in the second relation rather than the first, though the tradition often files it in the first. Q 16:67 notes intoxicant and wholesome provision together without ruling. Q 2:219 weighs benefit against sin and finds the sin greater. Q 4:43 bars approach to prayer while intoxicated, which is a ruling about prayer and not about the substance. Q 5:90-91 gives the prohibition with its stated ground, enmity and hatred and the barring from remembrance and prayer. Each step registers on something the previous had not touched, so the series is cumulative rather than corrective, and the earlier verses are not voided by the last but retained as its grounds (see [[see:INTOXICANTS]]; [[see:PROHIBITED DEGREES]]). Where the tradition read a chain of abrogations, the structure supports a chain of additions.

The practical consequence is that a claim of abrogation carries a burden the doctrine rarely enforced: to show that the two rulings occupy one seat. Where they do not, no abrogation has occurred, however clear the chronology.

## The three types, and the one the corpus does not carry

The tradition recognised three types, and taking them as a report of what was claimed rather than as a settled taxonomy, each maps onto the reading above with a different result.

### Ruling withdrawn, wording retained

The ordinary case, and the one the corpus visibly supports. The wording stands on the page and the registration moves. Q 2:180, enjoining testamentary provision for parents and near kin, and Q 2:240, granting a widow a year's maintenance, both remain in the text while the fixed shares of Q 4:11-12 govern (see [[see:INHERITANCE]]; [[see:WIDOW]]). Nothing here requires that anything left the corpus.

### Wording and ruling both withdrawn

A claim about what is absent. Since the evidence for it is necessarily a report that something once stood which no longer stands, it cannot be tested against the text, and the corpus supplies nothing in its own voice on the matter. It is admissible as a report and it is not a reading of the Qurʾān.

### Wording withdrawn, ruling retained

This is the type that fails structurally, and the failure is worth stating plainly. Such a ruling has force but no surviving wording to direct it. It has weight and no text. The corpus is the only seal-eligible register, and a ruling with no verse in it cannot be read out of it by any procedure, since there is nothing to read. The standing case is the penalty for adultery, where the corpus carries the hundred lashes of Q 24:2 and carries nothing else, and the claim that a further verse once stood rests wholly on post-canonical report (see [[see:ADULTERY AND FORNICATION]]; [[see:CHASTITY]]). The tradition's own discomfort here is notable: this third type was the most disputed of the three and was admitted by its proponents on the narrowest grounds. The reading offered here explains that discomfort rather than merely sharing it. A verdict of this shape cannot be certified, not because the evidence for it is thin, but because the thing it would have to be read from is by hypothesis not there.

## What the term will not carry

Four inflations attach to *naskh* and none of them survives the corpus.

That abrogation implies revision in the sender. Refused by Q 13:39, which places the effacing at the manifest register and the Mother of the Book elsewhere, and by Q 6:115.

That the sequence is an ascent, each ruling better than the last. Refused by the disjunction at Q 2:106, which licenses parity in as many words.

That a verse may be retired by asserting that it was abrogated. This was the doctrine's commonest abuse, and its own jurists moved against it by demanding evidence of chronological order before a claim of abrogation could stand. A claim of abrogation with no dated evidence is a preference wearing a doctrine's clothes.

That abrogation shows the corpus to be internally inconsistent. Refused by Q 4:82, {{ar:ولو كان من عند غير الله لوجدوا فيه اختلافا كثيرا}}, *wa-law kāna min ʿindi ghayri llāhi la-wajadū fīhi khtilāfan kathīran*, had it been from other than God ﷻ, they would have found in it much discrepancy. It is worth noticing that the abrogation apparatus was constructed largely to defend this claim. The reading offered here defends it more cheaply, since two rulings addressed to two states of a community were never in discrepancy to begin with.

## Scope

Abrogation is a relation between rulings, and it is not a relation between the Qurʾān and the earlier scriptures, although one Arabic term has served for both. That the later dispensation supersedes the earlier is a claim about the succession of prophetic missions and is argued from different verses on different grounds (see [[see:PEOPLE OF THE BOOK]]; [[see:TORAH]]; [[see:GOSPEL]]). Carrying conclusions from either question to the other is the commonest source of confusion in the literature, and the two should be kept apart even where a single word covers them.

!seealso Q 2:106 · Substitution (tabdīl) · Occasions of Revelation (asbāb al-nuzūl) · Distortion (taḥrīf) · Established and Ambiguous (muḥkam wa-mutashābih) · Legal Theory (uṣūl al-fiqh)

@ M. F. Islam

Bibliography
Primary: Q 2:106, 2:143, 2:180, 2:219, 2:240, 4:11-12, 4:43, 4:82, 5:90-91, 6:115, 7:154, 13:39, 16:67, 16:101, 18:27, 22:52, 24:2, 45:29, 87:6-7; Ṭabarī, ~Tafsīr~, ad Q 2:106 and 13:39; Qurṭubī, ~Jāmiʿ~, ad Q 2:106; al-Naḥḥās (d. 338 ⁄ 950), ~Kitāb al-Nāsikh wa-l-mansūkh~; Hibat Allāh Ibn Salāma (d. 410 ⁄ 1019), ~Kitāb al-Nāsikh wa-l-mansūkh~; al-Shāfiʿī (d. 204 ⁄ 820), ~al-Risāla~; al-Ghazālī (d. 505 ⁄ 1111), ~al-Mustaṣfā~; al-Sarakhsī, ~al-Uṣūl~; al-Shāṭibī (d. 790 ⁄ 1388), ~al-Muwāfaqāt~; Abū ʿUbayd al-Qāsim b. Sallām (d. 224 ⁄ 838), ~Kitāb al-nāsikh wa-l-mansūkh~; Makkī b. Abī Ṭālib al-Qaysī (d. 437 ⁄ 1045), ~al-Īḍāḥ~; Ibn al-Jawzī (d. 597 ⁄ 1201), ~Nawāsikh al-Qurʾān~; al-Suyūṭī, ~al-Itqān~; Shāh Walī Allāh al-Dihlawī (d. 1176 ⁄ 1762), ~al-Fawz al-kabīr~; Zamakhsharī, ~Kashshāf~, ad Q 2:106.
Secondary: A. Afsaruddin, ~Striving in the path of God. Jihad and martyrdom in Islamic thought~, Oxford 2013; A.A. An-Naʿim, ~Toward an Islamic reformation~, Syracuse 1990; J. Burton, ~The collection of the Qurʾān~, Cambridge 1977; id., ~The sources of Islamic law. Islamic theories of abrogation~, Edinburgh 1990; D. Cook, ~Understanding jihad~, Berkeley 2015²; L. Fatoohi, ~Abrogation in the Qurʾān and Islamic law. A critical study of the concept of naskh and its impact~, London 2013; R. Firestone, ~Jihad. The origin of holy war in Islam~, Oxford 1999; I. Goldziher, ~Muhammedanische Studien~; T. Nöldeke and F. Schwally, ~Geschichte des Qorāns~; D. Powers, The exegetical genre nāsikh al-Qurʾān wa mansūkhuhu, in A. Rippin (ed.), ~Approaches to the history of the interpretation of the Qurʾān~, Oxford 1988; F. Rahman, ~Islam and modernity~, Chicago 1982; B. Sadeghi and U. Bergmann, The codex of a companion of the Prophet and the Qurʾān of the Prophet, in ~Arabica~ 57 (2010); B. Sadeghi and M. Goudarzi, Ṣanʿāʾ 1 and the origins of the Qurʾān, in ~Der Islam~ 87 (2012); J. Schacht, ~The origins of Muhammadan jurisprudence~, Oxford 1950; M.M. Ṭāhā, ~The second message of Islam~, trans. A.A. An-Naʿim, Syracuse 1987; J. Wansbrough, ~Quranic studies~, Oxford 1977; M. Zayd, ~al-Naskh fī l-Qurʾān al-karīm~, 2 vols., Cairo 1383 ⁄ 1963 [unverified in this pass].

:::letter M

# Maʿiyya (maʿiyya, معية)

<!-- ADMISSION: date=2026-08-24; spine=SC-093; spine-audit=NONE;
     entry-check=PASS; entry-audit=PASS-maiyya-r6+PASS-maiyya2-r5; rounds=11; tier=major -->


The divine withness, the relation predicated of Allah ﷻ by the particle *maʿa* and its pronominal forms. The abstract noun is not qurʾānic: the corpus carries the particle and its pronominal forms alone, {{ar:معهم، معكم، معنا، معي، معكما}}, and the doctrine was argued for a millennium under a substantive the source never uses. Two verses state the relation without condition; a further class of verses predicates it of a named class and thereby withholds it from that class's complement. The whole of the received discussion concerns the mode of the first, whether by essence or by knowledge, and takes the matter closed once the mode is fixed, which reads both statements as reports of a fact. One of them is not. Q 58:7 introduces an ordinal, moves it, and then abandons it at the point where the pattern it has established would require it to be supplied, and a sentence built that way is not reporting a position but demonstrating that there is none to report.

## The literature

The discussion is old, continuous and unusually narrow. Almost none of it concerns the verses as sentences; nearly all concerns what kind of presence the relation names, a shape acquired in a polemical setting it has never left.

The verses entered controversy attached to their opposites, Q 20:5 and Q 67:16 placing Allah ﷻ above His creation where Q 57:4 and Q 58:7 place Him with it. The Jahmiyya after Jahm b. Ṣafwān (d. 128 ⁄ 745-6), and the Muʿtazila after them, are reported by their opponents to have argued omnipresence from the withness verses and read the Throne verses figuratively. The traditionist reply affirmed both, above in essence and with the creation in knowledge, and its argument is grammatical rather than assertive: each unconditioned verse opens and closes on knowledge, and a statement so enclosed is taken to be a statement about knowledge. That is a good argument on its own terms, and it is the strongest thing the received discussion contains; what is said below does not withdraw it but narrows its reach, since an argument may be sound about the register of a statement and still be answering a question the statement did not raise.

Kalām reached a compatible result from the other side, the Ashʿarī tradition declining the plain sense of the spatial texts by consigning the meaning to Allah ﷻ (*tafwīḍ*) or construing it figuratively (*taʾwīl*), while al-Ghazālī (d. 505 ⁄ 1111) in ~al-Iqtiṣād~ denies corporeality outright and removes the question of location before the withness verses are reached. There the verses are instances of a general theory of the attributes, and the reading they receive is the one the theory requires. Ibn Taymiyya (d. 728 ⁄ 1328) made them the centre of an attack on that settlement, in ~al-ʿAqīda al-Ḥamawiyya~ (698 ⁄ 1298-9), which drew a charge of corporealism in the same year and contributed to his trials from 1306, and more compactly in ~al-ʿAqīda al-Wāsiṭiyya~ (698 ⁄ 1298-9). The distinction between a general withness of all creatures and a particular withness of the believers by aid was worked out here and is the framework of everything after it, transmitted as settled taxonomy by Ibn Bāz (d. 1420 ⁄ 1999) and Ibn ʿUthaymīn (d. 1421 ⁄ 2001) on that same knowledge-frame.

The devotional register runs on Q 57:4, which opens the chapter on watchfulness (*murāqaba*) in the ascetic compilations, where the relation is a fact to live under rather than a doctrine to construe; the speculative wing of Sufism took the withness toward the unity of being and was answered from inside the tradition by a reformulation as unity of witnessing, an internal correction measuring how much weight the verses were made to carry. The contemporary dispute is South Asian, on whether Allah ﷻ may be said to be everywhere, Ashraf ʿAlī Thānawī (d. 1362 ⁄ 1943) distinguishing a corporeal withness of the essence, which the scholars nullified, from a withness without modality, which he held may be affirmed alongside establishment on the Throne.

Western scholarship has no dedicated treatment. The withness is absorbed into the study of the divine names and of anthropomorphism (Gimaret 1988, 1997) and reached through the attributes controversy rather than through the verses (Hoover; El-Tobgui 2020). The absence is structural: the ~Encyclopaedia of the Qurʾān~ carries 669 headwords, among them Anthropomorphism, God and his Attributes, Throne of God and Seeing and Hearing, and none for withness, nearness or presence under any name. The apparatus built for divine-predication verses is one for members and for location, and the withness is neither.

What has not been asked is the logical form, which both camps take for granted where they agree on nothing else: each reads the verses as reporting a fact of presence and disputes only its mode. That agreement is unexamined and unequal to its object, because the two unconditioned verses do not share a form. Q 57:4 is a flat declarative and the entire dispute is conducted on it. Q 58:7 is not flat. It is an argument in three moves, and Q 57:4 is its conclusion. Nor has anything been made of Q 4:108, where the unconditioned withness is predicated of a party engaged in nocturnal conspiracy, in the clause that condemns them, and which is decisive against reading the two withnesses as grades of one relation.

## The root and the particle

*Maʿa* is a particle of accompaniment and not a triliteral verb, so the ordinary instruments of root excavation have no purchase on it: no somatic image beneath it, no kinetic sense underlying an abstract one, no pair of senses in opposition. Where a contested term commonly shows its later instability prefigured in a divided lexicon, here the lexicon offers nothing, and the instability, which is real, is produced entirely at the level of the sentence and of the company each occurrence keeps. The negative result is worth recording because it is unusual: a doctrinally weighty term with no philological substrate whatever.

The cognate check returns the same shape and a more useful residue. Hebrew and Aramaic carry the accompaniment relation on *ʿim*, not on a counterpart of *maʿa*, and no regular correspondence between the two prepositions is claimed here. What they carry is the same move made with their own word and made as a name: *ʿimmānū ʾēl* at Isaiah 7:14, with-us God, which Matthew 1:23 renders with the ordinary Greek preposition of accompaniment, *meth' hēmōn ho theos*. A shared move carried by unrelated vocabulary is the stronger comparative result, since it cannot be explained by borrowing.

What the philology does yield is the formation of the headword. *Maʿiyya* is an abstract noun built on the particle by the *nisba* pattern, and it is post-canonical: the corpus predicates the relation and never names it. A doctrine argued under a noun its source does not use stands at one remove from its evidence, and the remove is where the two relations described below were fused and then graded. The corpus also uses the particle of creatures, {{ar:كونوا مع الصادقين}}, be with the truthful, at Q 9:119, which shows on its own that *maʿa* is no technical term of the attributes and takes its register from its subject and its frame.

## The qurʾānic base

Two verses state the relation without qualification. Q 58:7 gives {{ar:ما يكون من نجوى ثلاثة إلا هو رابعهم ولا خمسة إلا هو سادسهم ولا أدنى من ذلك ولا أكثر إلا هو معهم أين ما كانوا}}, *mā yakūnu min najwā thalāthatin illā huwa rābiʿuhum wa-lā khamsatin illā huwa sādisuhum wa-lā adnā min dhālika wa-lā akthara illā huwa maʿahum ayna mā kānū*, there is no private conference of three but He is their fourth, nor of five but He is their sixth, nor fewer than that nor more but He is with them wherever they are. Q 57:4 gives {{ar:وهو معكم أين ما كنتم}}, *wa-huwa maʿakum ayna mā kuntum*, and He is with you wherever you are. Both are enclosed by knowledge, as the traditionists observed.

Q 4:108 belongs to the same class and is regularly passed over. Of those who conceal themselves from people and not from Allah ﷻ, {{ar:وهو معهم إذ يبيتون ما لا يرضى من القول}}, *wa-huwa maʿahum idh yubayyitūna mā lā yarḍā mina l-qawl*, and He is with them while they plot by night what He does not approve. The corpus predicates the relation of a party in the act of conspiring, in the clause that condemns the conspiracy.

The second class is always qualified and is the larger of the two, and one exemplar carries its form: {{ar:إن الله مع الصابرين}}, *inna llāha maʿa l-ṣābirīn*, indeed Allah ﷻ is with the steadfast, at Q 2:153 and Q 8:46, with the same construction predicated of the godfearing and the doers of good at Q 16:128 and Q 29:69, of the believers at Q 8:19, and of the addressees at Q 47:35. Between them stand the occasional addresses, conditioned by situation rather than by class: {{ar:لا تخافا إنني معكما أسمع وأرى}} to Mūsā AS and Hārūn AS at Q 20:46, and {{ar:لا تحزن إن الله معنا}} in the cave at Q 9:40, addressed to Abū Bakr RA, with Q 26:62 the same in Mūsā's AS own mouth. No concordance of the particle with a divine subject has been established here.

## The structural reading of Q 58:7

The verse proceeds in three steps and the steps are not ornamental.

*Thalāthatin illā huwa rābiʿuhum*, three, and He their fourth. Taken alone this assigns a position within a count, which is the reading the received discussion presupposes when it asks where that position is.

*Wa-lā khamsatin illā huwa sādisuhum*, nor five but He their sixth. The second clause destroys the first taken alone. An ordinal that changes when the members change is not a property of the one it is predicated of but a function of theirs, and this is why a second case is stated rather than one. A verse wishing to report a position would report it once.

*Wa-lā adnā min dhālika wa-lā akthara illā huwa maʿahum ayna mā kānū*, nor fewer than that nor more but He is with them wherever they are. Here the verse abandons the ordinal at exactly the place where a rule of one more than the count would supply it, and says instead only that He is with them. Such a rule would have continued: and if four, He is their fifth. The pattern is established across two cases and then dropped rather than generalised.

The increment survives and the index does not. Two invariances are asserted in one sentence, under the number of the party and under its location, and what does not vary when the members vary is not one of them. The verse does not assert non-membership as a doctrine; it exhibits it, by running the count twice and withdrawing the position. On this reading the traditionist and the Ashʿarī are answered together and before their dispute begins, since the question of where a thing is arises only for a thing that is a term in the arrangement, and the verse's own procedure is built to show that it is not.

What the verse does across those clauses is a procedure with a standard name, and naming it imports nothing, since the verse performs it before anyone describes it. To show that a quantity does not belong to a system one does not assert it; one varies the system and shows the quantity unchanged. Three and He their fourth; five and He their sixth; any size and any place, and He is with them. A quantity surviving every variation of the members is not one of them, since membership is precisely what would make it vary along with them.

Mathematics has a family of names for a quantity that survives a variation, and two of them presuppose exactly what this verse denies. A *fixed point* is a point of a space that a map sends to itself, and an *eigenvalue of one* a direction a map leaves unscaled; both require the surviving object to lie inside the space acted on, which the verse's conclusion refuses. They name the survival and get the membership wrong. The *identity element* does not: it is the 1 in 1 × 3 = 3 and in 1 × 5 = 5, which is present in every product and is none of the things it multiplies. It belongs to the operation and not to the set the operation ranges over, and that is the distinction the verse is drawing. The bridge is stated rather than assumed: the set is the party, whose members the verse varies at three, five, fewer and more; the operation is the accompanying, which the verse holds constant across every one of those variations; and the identity is what the operation contributes to each without entering the set. Nothing further is carried across, and the arithmetic is an illustration of that one relation and not a model of the verse.

This is why the third name fits and the first two are only near it: the identity makes accompaniment without membership something a reader can check rather than something a doctrine must assert. The 1 accompanies the 3 and the 5 alike, leaves each as it was, and belongs to neither. Nothing requires it to be a fourth or a sixth thing, and asking where the 1 sits in the count is not a hard question but a malformed one. This is why the second clause is load-bearing rather than rhetorical: one case exhibits a position, two exhibit an invariance, and the third generalises without a further ordinal, which is the step at which a rule of one-more-than-the-count would have been stated and was not. Such a rule would make the term a function of the count, and a function of the count is determined by it and therefore stands inside the system it was meant to stand outside of.

The correspondence is one of shape. The verse is not doing algebra, and the mathematics is not evidence for the reading but the accurate name for the move the reading identifies.

The earlier scriptures make the same move and resolve it differently, which is what makes the comparison worth drawing. Matthew 18:20 takes a small gathering, names its number and places a divine presence with it: *hou gar eisin duo ē treis synēgmenoi eis to emon onoma, ekei eimi en mesō autōn*, where two or three are gathered in my name, there am I in the midst of them. Two or three and a presence; three or five and a fourth or a sixth. But *en mesō autōn*, in the midst of them, is a **position**, and it is the position Q 58:7 introduces at its first clause and withdraws at its third. The Greek states where; the Arabic states where, then states it differently, then declines to state it at all. Exodus 3:12 shows the same near-identity at the other end of the register, {{ar:כי אהיה עמך}}, *kī ehyeh ʿimmāk*, I will be with you, spoken to Mūsā AS, which Q 20:46 addresses to the same prophet in the same situation. The parallels are close enough that the divergence at the ordinal is legible rather than manufactured, and nothing about the standing of either text follows from it. The comparison is refuted by a reading on which *en mesō autōn* is not locative, and by any qurʾānic instance predicating the withness as membership in a count.

!seal ⟀ GOL

## Two relations, and the test that separates them

The received taxonomy is right in what it separates and wrong in how it grades, presenting its two terms as a weaker and a stronger form of one relation. The corpus supplies a test that requires neither.

Take any occurrence and ask whether the withness is predicated of a class from which some are excluded. The qualified verses all exclude a complement, and a relation that can be withheld from a complement is attained, so what is attained can be lost. Q 4:108 has no such complement: the party is conspiring, the conspiracy is named unacceptable, and the withness holds, with no conduct that alters it. The first relation tracks the state of the one it is predicated of. The second tracks nothing, because there is nothing it could track that is not already inside what it accompanies. Two relations sharing a particle, then, rather than two degrees of one, and the difference is not of intensity. The received two-term scheme is reported here and not adopted: it sees that the conditioned occurrences carry aid and the unconditioned ones do not, and fails twice, in construing that difference as one of degree, which Q 4:108 refuses, and in taking the unconditioned occurrences to answer the question of location, which is what makes the dispute over essence and knowledge possible at all. Once the question is not where, two positions that have divided the field for a millennium are answering something the verse declined to raise.

## What the term will not carry

That the withness licenses indwelling or union. Refused by the frame of both unconditioned verses, which state knowledge at each end and nothing else, and by Q 42:11, {{ar:ليس كمثله شيء}}, there is nothing like Him.

That the unconditioned withness is favour. Refused by Q 4:108, where it is predicated of a party in the act of plotting, in the clause that condemns them.

That the conditioned withness carries constitution. A relation withheld from a complement is attained, and constitution admits no qualifier.

That the correspondence with a fixed point, an identity element or an eigenvalue makes Allah ﷻ a number, a quantity, or an element of any system whatever. It carries the opposite force and the direction is the whole of it: the mathematics states what the term is not a member of, and predicates nothing. Refused in any case by Q 42:11.

That the withness is nearness. The corpus has other words for that, {{ar:ونحن أقرب إليه من حبل الوريد}} at Q 50:16 using *aqrab* and not *maʿa*, and the two carry different registers.

That Q 58:7 states a rule of one more than the count. Refused by the verse itself, whose third clause is the place such a rule would be stated and is instead the place the ordinal is dropped.

The reading of the three clauses given above is refuted by any of three findings, and they are named so that it can be: a corpus instance predicating the withness as membership in a count; a reading on which the second clause does no work the first does not already do; or a class-conditioned occurrence that admits no complement from which the relation is withheld.

## Scope

*Maʿiyya* is a relation the corpus predicates, and it is not the question of where Allah ﷻ is; that is argued from other verses on other grammar, by a literature answering it in its own terms (see [[see:ISTIWĀʾ]]). It is not nearness, which the corpus states with *qarīb* and *aqrab* in a register of responsiveness rather than accompaniment, and it is not divine knowledge as such, though the frames of the unconditioned verses make the two adjacent. The setting of Q 58:7 is a private conference (*najwā*), and the regulation of that act is a separate question argued from Q 58:8-13 and Q 4:114. Carrying a conclusion from any of these to the others is the commonest confusion in the literature, and the words themselves keep them apart.

!seealso Q 58:7 · Attributes of God (ṣifāt) · Nearness (qurb) · Hearing and Seeing (al-samīʿ al-baṣīr) · Anthropomorphism (tashbīh) · Throne (ʿarsh) · Manifest and Hidden (al-ẓāhir wa-l-bāṭin) · Watchfulness (murāqaba)

@ M. F. Islam

Bibliography
Primary: Q 2:153, 4:108, 8:19, 8:46, 9:40, 9:119, 16:128, 20:5, 20:46, 26:62, 29:69, 42:11, 47:35, 50:16, 57:4, 58:7, 67:16; Isa 7:14; Ex 3:12; Mt 1:23, 18:20; Ibn Taymiyya (d. 728 ⁄ 1328), ~al-ʿAqīda al-Wāsiṭiyya~, 698 ⁄ 1298-9; id., ~al-ʿAqīda al-Ḥamawiyya~, 698 ⁄ 1298-9; id., ~Darʾ taʿāruḍ al-ʿaql wa-l-naql~; al-Ghazālī (d. 505 ⁄ 1111), ~al-Iqtiṣād fī al-iʿtiqād~; al-Qushayrī (d. 465 ⁄ 1072), ~al-Risāla~, bāb al-murāqaba [unverified in this pass]; al-Bayhaqī (d. 458 ⁄ 1066), ~al-Asmāʾ wa-l-ṣifāt~ [unverified in this pass]; al-Dārimī (d. 280 ⁄ 894), ~al-Radd ʿalā al-Jahmiyya~ [unverified in this pass]; Ibn ʿUthaymīn (d. 1421 ⁄ 2001), ~Sharḥ al-ʿAqīda al-Wāsiṭiyya~; id., ~Sharḥ Riyāḍ al-ṣāliḥīn~, bāb al-murāqaba; Ibn Bāz (d. 1420 ⁄ 1999), ~Fatāwā~, on the two kinds of withness; Ashraf ʿAlī Thānawī (d. 1362 ⁄ 1943), on withness of the essence and withness by attribute.
Secondary: C.S. El-Tobgui, ~Ibn Taymiyya on reason and revelation. A study of Darʾ taʿāruḍ al-ʿaql wa-l-naql~, Leiden 2020; D. Gimaret, ~Dieu à l'image de l'homme. Les anthropomorphismes de la sunna et leur interprétation par les théologiens~, Paris 1997; id., ~Les noms divins en Islam. Exégèse lexicographique et théologique~, Paris 1988; R. Harvey, ~Transcendent God, rational world. A Māturīdī theology~, Edinburgh [year unverified in this pass]; J. Hoover, on Ibn Taymiyya's rejection of divine incorporeality and the Ḥamawiyya trials; R.C. Martin, Anthropomorphism, in J.D. McAuliffe (ed.), ~Encyclopaedia of the Qurʾān~, Leiden 2001-6.

:::letter T

# Taḥrīf (taḥrīf, تحريف)

<!-- ADMISSION: date=2026-08-19; spine=SC-088; spine-audit=PASS-TA3-r7; entry-check=PASS; entry-audit=PASS-EQG1-r5; rounds=5 -->


The charge that the holders of an earlier scripture altered what was given them. The Arabic is *taḥrīf*, the second form of √ḥ-r-f, and the tradition divides it into *taḥrīf al-naṣṣ*, falsification of the text itself, and *taḥrīf al-maʿnā*, distortion of the meaning. The corpus describes neither of these as the tradition frames them, but a third thing that both later categories are attempts at: the over-extension of a granted faculty, performed at the register of placement rather than of substance. The consequence is that taḥrīf is structurally unavoidable rather than a lapse better custodianship would have prevented, and that its possibility is priced into the grant of speech itself.

## The literature

Taḥrīf carries more polemical freight than any other term treated in this work, and the scholarship divides sharply on a question of fact that is, unusually, decidable from the sources.

### The indigenous record and its trajectory

The term is not treated in a genre of its own. It appears in exegesis of four passages, in refutation literature directed at Jews and Christians, and in legal discussion of whether earlier revelation can serve as a source. What the record shows is a hardening.

The earliest layer is tentative. Nickel's study of Muqātil b. Sulaymān (d. 150 ⁄ 767), al-Ṭabarī and the *Sīra* of Ibn Isḥāq finds that the formative-period exegesis did not read the tampering verses as textual falsification, treating the earlier scriptures (q.v.) as largely authentic while their holders tampered with pronunciation and interpretation, and that accusations approaching textual corruption remain isolated and tentative. Al-Qāsim b. Ibrāhīm (d. 246 ⁄ 860) does not hold textual corruption.

The turn is Ibn Ḥazm (d. 456 ⁄ 1064), whose ~al-Fiṣal~ mounts a systematic textual criticism of the biblical books and establishes *taḥrīf al-naṣṣ* as a developed doctrine. From there it spreads, but never to unanimity. Ibn Taymiyya (d. 728 ⁄ 1328) in ~al-Jawāb al-ṣaḥīḥ~ holds a more restrained position than his reputation suggests, and Ibn Khaldūn (d. 808 ⁄ 1406) records that the majority did not hold wholesale textual corruption. Al-Biqāʿī (d. 885 ⁄ 1480) quoted biblical text extensively in his commentary and drew controversy for it, which is itself evidence that the moderate position remained live and contested rather than extinct.

**The shape of that trajectory is the finding.** A doctrine whose earliest witnesses are tentative and whose confident form arrives four centuries later is not a reading recovered from the text. It is a position that grew, and its growth is datable. The parallel with abrogation is exact and neither is coincidence: in both cases a term's later doctrine hardened far past what its earliest readers took it to mean (see [[see:ABROGATION]]).

### Theology and the polemical setting

Taḥrīf is a response before it is a doctrine, which is why its shape follows the pressure applied to it. Two challenges provoked it. If the coming of the Prophet Muhammad ﷺ is announced in the earlier books, as Q 7:157 and Q 61:6 hold, then produce the passage. And if the earlier books are from God ﷻ, why do they differ from this one.

An internal tension follows and the literature has noticed it. *Taḥrīf al-naṣṣ* answers the second challenge at the cost of the first, because a corpus held textually corrupt cannot then be appealed to for the annunciation (q.v.) it is said to contain. The stronger the corruption claim, the weaker the *bishāra* argument. Ibn Ḥazm had to manage this, and the moderate line never incurred the cost.

### Modern Muslim scholarship

The nineteenth-century encounter with evangelical missionary argument in British India gave the doctrine a new and harder impetus, and Raḥmat Allāh al-Kayrānawī's ~Iẓhār al-ḥaqq~ of 1864 is its monument, marshalling European biblical criticism against the biblical text. Rashīd Riḍā in ~al-Manār~ carried a strong position. The moderate line has continued alongside it, and Mahmoud Ayoub concluded that the corpus accuses its interlocutors of altering the truths their scriptures contain rather than the texts.

### Western scholarship

Goldziher opened the modern study in 1878. W. M. Watt argued in 1955 that the corpus puts forward no general view of textual corruption. Lazarus-Yafeh's ~Intertwined Worlds~ and her article on the term remain the standard orientation, Adang's ~Muslim Writers on Judaism and the Hebrew Bible~ traces the development from Ibn Rabban to Ibn Ḥazm, and Accad proposed reconstructing the shift from the qurʾānic sense to the classical one, a project Nickel then carried out. Whittingham has argued for the analytic value of *taḥrīf maʿnawī* as a category and has since written a history of Muslim views of the Bible. Griffith's ~The Bible in Arabic~ bears on the whole question by establishing what biblical text was actually available in Arabic and when.

### The contemporary register

The strong claim now circulates far outside scholarship, as a popular apologetic commonplace on one side and as evidence of bad faith on the other. Two facts constrain it and neither is theological. Hebrew manuscript evidence from Qumran, third century before the common era onward, shows a textual tradition far more stable than the strong claim requires. And the corpus itself directs the holders of Torah and Gospel to judge by what is in them, which is not a thing one says about a destroyed text (see [[see:PEOPLE OF THE BOOK]]; [[see:TORAH]]; [[see:GOSPEL]]).

### What the literature has not asked

Topic and primary sources overlap with the standard reference literature, which is expected of any entry on this term and is declared here rather than left implicit; what is built independently is the argument and the analysis. The field asks whether taḥrīf is textual or interpretive, and when the doctrine hardened. Both questions are now well answered. What it does not ask is **what kind of faculty taḥrīf is an exercise of**, and therefore why a corpus would grant a capacity whose misuse it goes on to charge. That question is taken up below, and the answer changes the status of the charge.

## The root and its bivalence

√ḥ-r-f yields **ḥarf**, and the noun carries two senses that the later doctrine will split along.

The first is **edge**: rim, border, the sharp margin of a thing. The corpus uses it at Q 22:11, {{ar:يعبد الله على حرف}}, *yaʿbudu llāha ʿalā ḥarf*, one who worships God ﷻ upon an edge, teetering and ready to fall either way. The second form built on this sense means to set on edge, to tilt, to turn aside, and the corpus uses it at Q 8:16 of a fighter {{ar:متحرفا لقتال}}, *mutaḥarrifan li-qitāl*, wheeling aside to fight. The related *munḥarif* is deviating, off-axis.

The second sense is **letter**: ḥarf as an element of the script, a character of the alphabet.

Both senses are ordinary Arabic and both are ancient. **The doctrinal split is the root's own bivalence unfolding.** *Taḥrīf* built on the edge-sense is displacement, a tilting of something off its proper alignment, and this is *taḥrīf al-maʿnā*. *Taḥrīf* read through the letter-sense is the altering of characters, and this is *taḥrīf al-naṣṣ*. The tradition did not import a distinction from outside; it inherited an ambiguity sitting in the noun and resolved it in two directions over four centuries.

What the root does not carry, in either sense, is destruction. **It angles, and it does not annihilate.** A tilted thing remains, and a letter altered remains a letter. This is a constraint on how far the charge can be pushed before it is no longer the charge the word makes.

The Abrogation entry found the same structure in √n-s-kh, whose bivalence between copying and effacing explains why that doctrine never stabilised (see [[see:ABROGATION]]). **Two terms, two contested doctrines, and in each case the instability is already present in the noun.** That is not a coincidence about two words. It is what happens when a doctrine is built on a root whose senses were never disambiguated in the first place.

## The qurʾānic base

Four passages carry the *ḥ-r-f* charge and three specify the mechanism as **placement**.

Q 4:46, Q 5:13 and Q 5:41 all read {{ar:يحرفون الكلم عن مواضعه}}, *yuḥarrifūna l-kalima ʿan mawāḍiʿihi*, they displace the words from their places. *Mawāḍiʿ*, from √w-ḍ-ʿ, is positions, sites, the spots where something is set. The construction is not that they broke the words or replaced them but that they moved them **off station**.

Q 2:75 carries the fourth and adds the decisive qualifier: they alter it {{ar:من بعد ما عقلوه}}, *min baʿdi mā ʿaqalūhu*, after having understood it. The operation is downstream of comprehension, which places it in the act of reading and reporting rather than in the substance received.

Two further passages are regularly folded into these and should not be. Q 2:79 speaks of those who {{ar:يكتبون الكتاب بأيديهم}}, *yaktubūna l-kitāba bi-aydīhim*, write the book with their hands and then ascribe it to God ﷻ. This is the strongest text in the corpus for a substantive claim, **and it does not use √ḥ-r-f**. Q 3:78 has a party who {{ar:يلوون ألسنتهم بالكتاب}}, *yalwūna alsinatahum bi-l-kitāb*, twist their tongues with the book so that you suppose it from the book when it is not. That is tongue and not pen, performance and not manuscript.

Alongside these the corpus holds, without apparent strain, that the earlier books are guidance and light and that their holders are to judge by them, at Q 5:43 through Q 5:47. Whatever the charge means, it means something compatible with that direction.

## The structural reading

The received question is whether taḥrīf touches text or meaning. Both answers assume the interesting thing is what was damaged. The more informative question is what faculty was used.

**The grant.** Q 55:1-4 places the teaching of *bayān*, clear expression, immediately after the teaching of the Qurʾān and the creation of the human. Bayān is given, not achieved. It is the terminal organ by which any reading is articulated at all, and without it there is no reporting of a text, faithful or otherwise.

**The absence of a fence.** Consider what would be needed to bound that faculty from inside. It would require a fixed catalogue of admissible readings, a rule stating in advance which articulations of a text are permitted. No such catalogue is available, and the reason is structural rather than a failure of effort. The operation by which a statement is decomposed for reading is a cut, and a cut cannot be undone: nothing at that level restores what the reading removed. Where an operation has no inverse there is no group of transformations to hold the readings steady, and where there is no such group there is no fixed set of invariants to enumerate. The one candidate that might supply the missing structure, treating synonyms as interchangeable, is barred by the requirement that the slots of a reading stay genuinely distinct.

So the grant of speech admits no total closure at the register that carries it, and whether a partial bound constrains without closing is neither established nor excluded. **Taḥrīf as a class is therefore what a grant admitting no total closure does over time, and the class is unavoidable rather than a lapse better custodianship would have prevented.** The culpability of an individual instance is a separate question, and separating the class from the instance is this architecture's reading rather than a line the corpus draws. This is why the charge never functions in the corpus as surprise, and why it is levelled at communities of learning rather than of ignorance. The faculty that produces faithful transmission is the same faculty, and it comes without a governor.

**Where protection comes from.** If nothing inside the register can bound it, protection is not derivable there and must be supplied. The corpus states the contract rather than leaving it to inference. Q 8:29 makes the discriminating faculty issued rather than earned, conditional on the reader's state, and Q 2:2 conditions the guidance itself on the same state. **The righteous do not fence the tongue by holding it more carefully. They receive a discriminator they could not have derived.** That is a claim about where the protection originates, and it is the corpus's own claim.

**The parent decision.** This is not an isolated arrangement. At Q 2:30 the corruptible knower is preferred over the incorruptible worshipper, by explicit decision, against a stated objection, and the objection is conceded rather than denied. The angels warn of corruption and bloodshed and are answered with a claim of superior knowledge, not with a denial of the warning. Taḥrīf at the tongue is that ruling instanced in language. The cost was accepted at the appointment (see [[see:ADAM AND EVE]]; [[see:KHALIFA]]).

The reading closes. The grant is stated in the corpus, the absence of a fence follows from what reading is, the supplied discriminator is stated in the corpus, and the parent decision is stated in the corpus. Three registers, one architecture, and no borrowed premise.

!seal ⟀ GOL

## Displacement from what

The finding above leaves one thing to settle. If taḥrīf is displacement from a place, everything depends on what kind of place.

A word can be displaced from its **position within a frame of reading**, its address in a chart laid over the text: which passage governs which, what is read as literal and what as figure, which context is supplied. Such an address is a property of the chart and not of the text, and two readers using different charts assign different addresses to the same words without either having touched the words.

A word can also be displaced from a **fixed point that is not chart-relative**, a locus that any correct reading must land on. That displacement would be structural and grave.

The corpus decides between them at Q 2:75. Alteration occurring *after they had understood it* cannot be alteration of what was received, because what was received is what they understood. It is alteration of what was then done with it. **Taḥrīf is chart-substitution: the same words read off a different frame.** And this is why the charge and the direction to judge by those same books can stand in one corpus without contradiction, which on the strong textual reading they cannot.

**Worked case, displacement.** Q 3:78 gives the mechanism in miniature. A party twists the tongue with the book so that the hearer supposes what is recited belongs to it. Nothing in the manuscript has moved. The performance has supplied a frame the text does not carry, and the hearer receives the frame as though it were the text.

**Worked case, not displacement.** Q 2:79 describes writing with the hands and ascribing the product to God ﷻ. That is composition, not displacement, and the corpus marks the difference by not using √ḥ-r-f for it. Merging the two produces one doctrine from two mechanisms and is the point at which the tradition's account began to outrun its texts.

## What the term will not carry

**The corruption maximalism**, that the earlier scriptures are textually destroyed and worthless. Refused by the root, which tilts and does not annihilate, and by Q 5:43-47, which directs judgment by the books it charges. A charge and a commendation of the same corpus are compatible only if the charge is about reading.

**The dismissal**, that the charge licenses setting earlier scripture aside. The corpus calls itself *muṣaddiq*, confirming what is before it, in the same breath as it levels the charge. Both stand or neither does.

**The exemption**, that taḥrīf is a thing other communities do. An unfenced grant is unfenced for every reader of every corpus. Nothing in the structure above is specific to the communities charged, and a reader who takes the charge as an accolade has already performed the operation it names.

**The root merger**, folding Q 2:79 and Q 3:78 into the *ḥ-r-f* passages. Different roots, different mechanisms, and the merger is where the doctrine detached from its base.

**Translation as taḥrīf.** A language crossing widens the aperture through which the granted faculty over-extends, and the crossings are real: the Gospels are Greek compositions while ʿĪsā AS taught in Aramaic, and the Septuagint is a Greek frame laid over a Hebrew text that never ceased to be available. But the corpus puts the mechanism in volition, *yalwūna*, they twist, and *ʿaqalūhu*, having understood. If translation as such were taḥrīf, every rendering of every scripture would be taḥrīf, and the corpus's own confirmation of earlier books would be incoherent. **Crossing is the occasion. Volition is the mechanism.**

## Scope

Taḥrīf and abrogation are the two operations by which the corpus describes a ruling changing, and they are opposite in agent and register. **Abrogation is the sender's act at the manifest register**, a replacement issued from the source, and its verses are stated in the first person plural of divine action. **Taḥrīf is the receiver's act at the reading register**, a displacement performed by those who hold the text, and its verses are stated of a third-person party. Confusing them produces either a doctrine of divine mutability or a doctrine of human authorship of revelation, and the corpus supports neither (see [[see:ABROGATION]]).

Taḥrīf is also distinct from **concealment**, *kitmān*, at Q 2:42 and Q 2:146, which is withholding what one knows rather than displacing it, and from **confusing truth with falsehood**, *labs*, at Q 3:71. The three are named separately and the corpus does not treat them as one offence.

!seealso Q 4:46 · Forgery (iftirāʾ) · Concealment (kitmān) · Confirmation (taṣdīq) · Guardianship of the Text (haymana) · Abrogation (naskh)

@ M. F. Islam

Bibliography
Primary: Q 2:42, 2:75, 2:79, 2:146, 3:71, 3:78, 4:46, 5:13, 5:41, 5:43-47, 7:157, 8:16, 8:29, 22:11, 55:1-4, 61:6; Muqātil b. Sulaymān (d. 150 ⁄ 767), ~Tafsīr~; Ṭabarī, ~Tafsīr~, ad Q 2:75 and 4:46; Ibn Ḥazm (d. 456 ⁄ 1064), ~al-Fiṣal fī l-milal wa-l-ahwāʾ wa-l-niḥal~; Ibn Taymiyya (d. 728 ⁄ 1328), ~al-Jawāb al-ṣaḥīḥ li-man baddala dīn al-Masīḥ~; Ibn Khaldūn (d. 808 ⁄ 1406), ~al-Muqaddima~; Raḥmat Allāh al-Kayrānawī (1818-91), ~Iẓhār al-ḥaqq~, 1864; Rashīd Riḍā, ~Tafsīr al-Manār~.
Secondary: M. Accad, on the shift from the qurʾānic to the classical sense, 2003; C. Adang, ~Muslim writers on Judaism and the Hebrew Bible. From Ibn Rabban to Ibn Ḥazm~, Leiden 1996; M. Ayoub, on the qurʾānic accusation as concerning truths rather than texts, 1986; I. Goldziher, on Muslim polemic against the people of the book, in ~ZDMG~ 32 (1878); S. Griffith, ~The Bible in Arabic~, Princeton 2013; H. Lazarus-Yafeh, ~Intertwined worlds. Medieval Islam and Bible criticism~, Princeton 1992; ead., Taḥrīf, in ~EI2~; ead., Taḥrīf and thirteen Torah scrolls, in ~JSAI~ 19 (1995); G. Nickel, ~Narratives of tampering in the earliest commentaries on the Qurʾān~, Leiden 2011; W.M. Watt, The early development of the Muslim attitude to the Bible, in ~Transactions of the Glasgow University Oriental Society~ 16 (1955-56); M. Whittingham, The value of taḥrīf maʿnawī as a category for analysing Muslim views of the Bible, in ~Islam and Christian-Muslim Relations~ 22 (2011); id., ~A history of Muslim views of the Bible~, Berlin 2020.
