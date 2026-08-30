#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""MAIDAH-CHK · executed census for CN-PSP-MAIDAH-TRANSMISSION-01.
Corpus: quran-uthmani.txt, Tanzil Uthmani plain text, 6236 numbered verses,
retrieved from the Internet Archive item quran-uthmani_202407, sha256 printed below.
Every claim the card makes about distribution is computed here and nowhere recalled."""
import re, sys, hashlib, unicodedata

RAW = open('/home/claude/quran.txt', encoding='utf-8').read()
print("corpus sha256", hashlib.sha256(RAW.encode()).hexdigest()[:16])

V = {}
for line in RAW.split('\n'):
    m = re.match(r'^(\d+)\|(\d+)\|(.*)$', line.strip())
    if m:
        V[(int(m.group(1)), int(m.group(2)))] = m.group(3)
print("verses parsed", len(V), "| surahs", len({s for s, _ in V}))
assert len(V) == 6236, "verse count integrity"

AR_DIAC = ''.join(chr(c) for c in list(range(0x064B, 0x0660)) + [0x0670, 0x0653, 0x0654, 0x0655, 0x06DF, 0x06E1, 0x06E2, 0x06E5, 0x06E6, 0x06E8, 0x06EA, 0x06EB, 0x06EC, 0x06ED])
def norm(s):
    s = ''.join(ch for ch in s if ch not in AR_DIAC)
    s = s.replace('\u0671', '\u0627').replace('\u0622', '\u0627').replace('\u0623', '\u0627').replace('\u0625', '\u0627')
    s = s.replace('\u0624', '\u0648').replace('\u0626', '\u064A').replace('\u0649', '\u064A').replace('\u0629', '\u0647')
    return re.sub(r'\s+', ' ', s).strip()

N = {k: norm(v) for k, v in V.items()}
BAR = "=" * 74

# --- CHK.1 · the anchor verse, printed whole
print(BAR); print("CHK.1  the anchor, Q 5:114 and its answer Q 5:115")
for ref in [(5, 112), (5, 113), (5, 114), (5, 115)]:
    print(f"  {ref[0]}:{ref[1]}  {V[ref]}")

# --- CHK.2 · the eid census: sole-occurrence test on the consonantal skeleton
print(BAR); print("CHK.2  the sole-occurrence test on عيد")
eid = [k for k, s in N.items() if re.search(r'(?<![\u0621-\u064A])عيد(?![\u0621-\u064A])', s)]
print("  sites carrying the free-standing form:", [f"{a}:{b}" for a, b in sorted(eid)], "| count", len(eid))
root_ayd = [k for k, s in N.items() if re.search(r'عيد', s)]
print("  sites carrying the string anywhere in a word:", [f"{a}:{b}" for a, b in sorted(root_ayd)], "| count", len(root_ayd))

# --- CHK.3 · the r-z-q sites inside the anchor
print(BAR); print("CHK.3  r-z-q inside the anchor")
anchor = N[(5, 114)]
for form, gloss in [('وارزقنا', 'wa-rzuqnā, the request'), ('الرزقين', 'al-rāziqīn, the attribute'), ('الرازقين', 'al-rāziqīn, plene')]:
    print(f"  {form:12s} present in 5:114: {form in anchor}   ({gloss})")
rzq_5 = [k for k, s in N.items() if k[0] == 5 and re.search(r'رزق|رزق|رازق', s)]
print("  r-z-q sites in surah 5:", [f"{a}:{b}" for a, b in sorted(rzq_5)])
rzq_all = [k for k, s in N.items() if re.search(r'رزق|رازق', s)]
print("  r-z-q sites corpus-wide:", len(rzq_all))
khayr_raziqin = [k for k, s in N.items() if re.search(r'خير الرزقين|خير الرازقين', s)]
print("  khayr al-rāziqīn sites:", [f"{a}:{b}" for a, b in sorted(khayr_raziqin)], "| count", len(khayr_raziqin))

# --- CHK.4 · the superlative-punishment construction, corpus-wide
print(BAR); print("CHK.4  the punishment superlative, corpus-wide")
pat_uadh = re.compile(r'لا يعذب عذابه احد|لا اعذبه احدا|لا يوثق وثاقه احد')
hits = [k for k, s in N.items() if pat_uadh.search(s)]
print("  'punishes/binds as none is punished/bound' construction:", [f"{a}:{b}" for a, b in sorted(hits)])
for k in sorted(hits): print(f"    {k[0]}:{k[1]}  {V[k]}")
# the specific first-person form of 5:115
first_person = [k for k, s in N.items() if 'اعذبه احدا' in s]
print("  first-person form 'uʿadhdhibuhu aḥadan':", [f"{a}:{b}" for a, b in sorted(first_person)], "| count", len(first_person))
alamin = [k for k in first_person if 'العلمين' in N[k] or 'العالمين' in N[k]]
print("  ... of which qualified by al-ʿālamīn:", [f"{a}:{b}" for a, b in sorted(alamin)], "| count", len(alamin))

# --- CHK.5 · kufr-after-receipt: the baʿdu structure
print(BAR); print("CHK.5  the after-receipt structure in the anchor's answer")
a115 = N[(5, 115)]
for token, gloss in [('منزلها', 'munazziluhā, I am sending it down'), ('يكفر', 'yakfur, covers'), ('بعد', 'baʿdu, after'), ('احدا', 'aḥadan, anyone'), ('العلمين', 'al-ʿālamīn, the worlds')]:
    print(f"  {token:10s} present in 5:115: {token in a115}   ({gloss})")

# --- CHK.6 · the transmission clause of the request
print(BAR); print("CHK.6  the transmission clause inside the request")
for token, gloss in [('عيدا', 'ʿīdan, a festival'), ('لاولنا', 'li-awwalinā, for the first of us'), ('واخرنا', 'wa-ākhirinā, and the last of us'), ('واية', 'wa-āyatan, and a sign'), ('منك', 'minka, from You')]:
    print(f"  {token:10s} present in 5:114: {token in anchor}   ({gloss})")

# --- CHK.7 · the control: does the corpus use the superlative elsewhere for a lesser cause
print(BAR); print("CHK.7  control, the ʿālamīn-superlative outside the punishment context")
faddal = [k for k, s in N.items() if 'على العلمين' in s]
print("  'ʿalā l-ʿālamīn' preference sites:", len(faddal), [f"{a}:{b}" for a, b in sorted(faddal)][:8])
print(BAR)
