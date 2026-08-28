---
edition: encyclopedia
title: Geometric Encyclopaedia of the Qurʾān
subtitle: Seed Corpus
volume: 1.0.0.2.1
range: A-T
accent: copper
---

<!--
GEOMETRIC ENCYCLOPAEDIA OF THE QURʾĀN · Seed corpus · Version 1.0.0.2.1

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

Spines: Abrogation reads from CN-PSP-ABROGATION-RELOCK-01 at SC-089 and Taḥrīf
from CN-PSP-TAHRIF-GRANT-01 at SC-088, both in the theological register. Cite
identifiers only; SPINE_INDEX.md resolves them to the current codex source.

Census: 2 entries, 2 major, 0 standard, 0 stubs. Both fully gated.
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
     ─────────────────────────────────────────────────────────────────────
     OPEN APERTURES, each awaiting a supplied external witness
     spine  membership conditions for chart-substitution
     spine  deletion test executed by the seat that authored the claim
     spine  bridge map for the register distinction the pair asserts
     entry  classical death dates conventional but unattributed
     entry  bivalence check stands 2 of 2 with no negative case run
     ─────────────────────────────────────────────────────────────────────
     DEBT
     29 of 32 see-delegations dangle; the count must trend down
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

@ M. F. Islam

Bibliography
Primary: Q 2:106, 2:143, 2:180, 2:219, 2:240, 4:11-12, 4:43, 4:82, 5:90-91, 6:115, 7:154, 13:39, 16:67, 16:101, 18:27, 22:52, 24:2, 45:29, 87:6-7; Ṭabarī, ~Tafsīr~, ad Q 2:106 and 13:39; Qurṭubī, ~Jāmiʿ~, ad Q 2:106; al-Naḥḥās (d. 338 ⁄ 950), ~Kitāb al-Nāsikh wa-l-mansūkh~; Hibat Allāh Ibn Salāma (d. 410 ⁄ 1019), ~Kitāb al-Nāsikh wa-l-mansūkh~; al-Shāfiʿī (d. 204 ⁄ 820), ~al-Risāla~; al-Ghazālī (d. 505 ⁄ 1111), ~al-Mustaṣfā~; al-Sarakhsī, ~al-Uṣūl~; al-Shāṭibī (d. 790 ⁄ 1388), ~al-Muwāfaqāt~; Abū ʿUbayd al-Qāsim b. Sallām (d. 224 ⁄ 838), ~Kitāb al-nāsikh wa-l-mansūkh~; Makkī b. Abī Ṭālib al-Qaysī (d. 437 ⁄ 1045), ~al-Īḍāḥ~; Ibn al-Jawzī (d. 597 ⁄ 1201), ~Nawāsikh al-Qurʾān~; al-Suyūṭī, ~al-Itqān~; Shāh Walī Allāh al-Dihlawī (d. 1176 ⁄ 1762), ~al-Fawz al-kabīr~; Zamakhsharī, ~Kashshāf~, ad Q 2:106.
Secondary: A. Afsaruddin, ~Striving in the path of God. Jihad and martyrdom in Islamic thought~, Oxford 2013; A.A. An-Naʿim, ~Toward an Islamic reformation~, Syracuse 1990; J. Burton, ~The collection of the Qurʾān~, Cambridge 1977; id., ~The sources of Islamic law. Islamic theories of abrogation~, Edinburgh 1990; D. Cook, ~Understanding jihad~, Berkeley 2015²; L. Fatoohi, ~Abrogation in the Qurʾān and Islamic law. A critical study of the concept of naskh and its impact~, London 2013; R. Firestone, ~Jihad. The origin of holy war in Islam~, Oxford 1999; I. Goldziher, ~Muhammedanische Studien~; T. Nöldeke and F. Schwally, ~Geschichte des Qorāns~; D. Powers, The exegetical genre nāsikh al-Qurʾān wa mansūkhuhu, in A. Rippin (ed.), ~Approaches to the history of the interpretation of the Qurʾān~, Oxford 1988; F. Rahman, ~Islam and modernity~, Chicago 1982; B. Sadeghi and U. Bergmann, The codex of a companion of the Prophet and the Qurʾān of the Prophet, in ~Arabica~ 57 (2010); B. Sadeghi and M. Goudarzi, Ṣanʿāʾ 1 and the origins of the Qurʾān, in ~Der Islam~ 87 (2012); J. Schacht, ~The origins of Muhammadan jurisprudence~, Oxford 1950; M.M. Ṭāhā, ~The second message of Islam~, trans. A.A. An-Naʿim, Syracuse 1987; J. Wansbrough, ~Quranic studies~, Oxford 1977; M. Zayd, ~al-Naskh fī l-Qurʾān al-karīm~, 2 vols., Cairo 1383 ⁄ 1963 [unverified in this pass].

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

@ M. F. Islam

Bibliography
Primary: Q 2:42, 2:75, 2:79, 2:146, 3:71, 3:78, 4:46, 5:13, 5:41, 5:43-47, 7:157, 8:16, 8:29, 22:11, 55:1-4, 61:6; Muqātil b. Sulaymān (d. 150 ⁄ 767), ~Tafsīr~; Ṭabarī, ~Tafsīr~, ad Q 2:75 and 4:46; Ibn Ḥazm (d. 456 ⁄ 1064), ~al-Fiṣal fī l-milal wa-l-ahwāʾ wa-l-niḥal~; Ibn Taymiyya (d. 728 ⁄ 1328), ~al-Jawāb al-ṣaḥīḥ li-man baddala dīn al-Masīḥ~; Ibn Khaldūn (d. 808 ⁄ 1406), ~al-Muqaddima~; Raḥmat Allāh al-Kayrānawī (1818-91), ~Iẓhār al-ḥaqq~, 1864; Rashīd Riḍā, ~Tafsīr al-Manār~.
Secondary: M. Accad, on the shift from the qurʾānic to the classical sense, 2003; C. Adang, ~Muslim writers on Judaism and the Hebrew Bible. From Ibn Rabban to Ibn Ḥazm~, Leiden 1996; M. Ayoub, on the qurʾānic accusation as concerning truths rather than texts, 1986; I. Goldziher, on Muslim polemic against the people of the book, in ~ZDMG~ 32 (1878); S. Griffith, ~The Bible in Arabic~, Princeton 2013; H. Lazarus-Yafeh, ~Intertwined worlds. Medieval Islam and Bible criticism~, Princeton 1992; ead., Taḥrīf, in ~EI2~; ead., Taḥrīf and thirteen Torah scrolls, in ~JSAI~ 19 (1995); G. Nickel, ~Narratives of tampering in the earliest commentaries on the Qurʾān~, Leiden 2011; W.M. Watt, The early development of the Muslim attitude to the Bible, in ~Transactions of the Glasgow University Oriental Society~ 16 (1955-56); M. Whittingham, The value of taḥrīf maʿnawī as a category for analysing Muslim views of the Bible, in ~Islam and Christian-Muslim Relations~ 22 (2011); id., ~A history of Muslim views of the Bible~, Berlin 2020.

