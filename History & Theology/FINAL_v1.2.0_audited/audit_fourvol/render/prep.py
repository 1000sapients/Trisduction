import re,sys,json
FM={
'IV':dict(title="The Office of the Messiah",subtitle="A History of the Position Across the Hebrew, Gospel, and Qurʾānic Records · Volume IV of Four · Audited Edition",
  article_type="History of Religion",goal="Position stable, occupant variable.",doi="Comparative Scripture · Audited",
  abstract="This study reads the messianic material of the Hebrew scriptures, the Second Temple literature, the Gospels, and the Qurʾān as the history of a position rather than the biography of a person, on the ground that a continuous biography is not what the material supports. The position is described with precision and filled repeatedly, by different people, in different centuries, under different corpora, and to different outcomes, and almost everything that reads as contradiction between the corpora is a difference in occupancy read as a difference in the office. Twelve books and one hundred and four chapters are organised on the office's own coordinates rather than on chronology: the position, the terminus, the concession, the felled stump, the ladder, the Human One, the forerunner, the Galilean occupant, the passion and the withdrawal, the counterfeit seat, the Servant and the seal, and the vacancy after. The scriptural spine is read first and is the only seal-eligible register; interpretive traditions enter as witnesses and never as authorities; every claim carries its grade; and seven falsification conditions are stated, one per load-bearing finding. The verdict on the occupancy is held open, and holding open is a verdict rather than the absence of one. This is Volume IV of a four-volume set that reads one position through three corpora over a geopolitical and archaeological ground floor; this edition carries the companion block naming the set and has passed an eight-round adversarial audit whose ledger is published beside it."),
'III':dict(title="History of the Messianic Position in the Jewish, Christian, and Qurʾānic Records",subtitle="The Figure Grows. The Deficit Does Not Move. · Volume III of Four · Audited Edition",
  article_type="History of Religion",goal="The figure grows. The deficit does not move.",doi="Comparative Scripture · Audited",
  abstract="This study reads the messianic material of the Hebrew scriptures, the Second Temple literature, the Gospels, the rabbinic and medieval Jewish record, and the Qurʾān as the history of a position rather than the biography of a person. The position is described in the Hebrew scriptures with unusual precision, offered repeatedly, and, by the testimony of those same scriptures, never entered; everything written afterwards, across a millennium of Jewish literature, four centuries of Christian formation, and fourteen centuries of claimants in three religions, is read as the record of what a community does with an unoccupied position it cannot abandon. Read chronologically across six books and ninety-seven chapters, every source is treated as a measurement of its own period rather than a window onto the figure, and the resulting curve is the argument: the figure offered against the deficit grows at every stage, from a man anointed with oil to a being through whom the world was made, while the deficit, located by the texts at reception and not in the agent, does not move. Every claim carries one of six evidence labels under a strength rule that never lets a conclusion exceed its weakest source; three falsifiers are stated in Book I and returned; and the book names no man at the end, because the record does not. This is Volume III of a four-volume set; this edition carries the companion block naming the set and has passed an eight-round adversarial audit whose ledger is published beside it."),
'II':dict(title="The Conceded Throne",subtitle="The Unentered Rest, the Requested King, and the Escalation That Answered the Wrong Question · Volume II of Four · Audited Edition",
  article_type="History of Religion",goal="The rest was given. It was not entered.",doi="Hebrew Bible Series · Audited",
  abstract="This study reads the royal and future-royal material of the Hebrew Bible as the history of a position rather than the biography of a person, and it reads nothing else: every load-bearing claim rests on the Hebrew Bible alone, and a verification gate enforces the constraint against the finished text. The corpus names the terminus of its promise in a specific word whose sense is settlement rather than recuperation, states that terminus as given, twice, in the perfect, under non-royal agents, and as not entered, locates the failure of entry in the same three organs at every stage in identical language, and, when its kings fail, re-issues the concession of monarchy at higher intensity, eight times, while the deficit stands where it stood. A second finding runs beneath the first: however large the figure becomes, the grammar by which he receives what he holds never changes, the verb passive or the subject God, across six books and two languages. Nineteen books and one hundred and sixty-six chapters carry the argument from the four rest-roots through the terminus, the deficit, the concession, the seat, the occupants, the escalation, the tree, the shepherd, the Psalter, the prophets, the Torah's own figures, the silences, the Servant, the exile, and the dwelling, to three falsifiers stated in Chapter 6 and returned in Chapter 163. What would fall if a royal figure of the expected kind arrived tomorrow is nothing, and Chapter 164 states why. This is Volume II of a four-volume set; this edition carries the companion block naming the set and has passed an eight-round adversarial audit whose ledger is published beside it."),
'I':dict(title="A Critical History of Israel, Judah, and Their Successors",subtitle="A Geopolitical and Archaeological Audit from the Amorite Migrations to the Founding of Baghdad · In One Hundred and Six Volumes · Volume I of Four · Audited Edition",
  article_type="Historical Audit",goal="Text, external record, physical constraint.",doi="Israel and Judah · Vol I · Audited",
  abstract="This is a historical audit, not a devotional history and not a debunking. It takes the canonical narratives of Israel, Judah, and their successor communities from roughly 2000 BCE to 762 CE and asks of each episode the questions theology does not ask: what it cost, who paid, who benefited, what the ground shows, what the enemy's archive says, and what happened to the account in transmission. The method is triangulation. Three independent streams of evidence are brought against every episode: the canonical text read closely in its original language, with attention to what its words meant before they acquired theological weight; the external record of royal annals, administrative archives, diplomatic correspondence, inscriptions, coins, and excavated stratigraphy; and the physical constraint of terrain, march rates, water, grain, carrying capacity, and the metallurgy and engineering actually available in the period. Where the three converge the work says so and states its confidence; where they diverge, the divergence is the finding and is reported rather than harmonised. One hundred and six volumes run from the Amorite migrations through the patriarchal, Egyptian, conquest, monarchic, exilic, Persian, Hellenistic, Roman, and late-antique periods to the founding of Baghdad. This is Volume I of a four-volume set, the ground floor on which three scripture-internal readings of one position stand; this edition is the audited master supplied by its own audit cycle, carried byte-for-byte from the Preface onward beneath a fenced front-matter block that names the set and says which of the four volumes is for which reader."),
}
AFF="^1^Independent Researcher. ORCID 0009-0003-1671-0664. Correspondence: islamm@alumni.iu.edu"
def build(vol,src,out):
    t=open(src,encoding='utf-8').read().replace('\r\n','\n')
    lines=t.split('\n')
    # strip the leading title/subtitle head lines (the title block carries them) up to the first '---' or first '## '
    k=0
    while k<len(lines) and (lines[k].startswith('#') or not lines[k].strip() or lines[k].startswith('**c. ') or lines[k].startswith('*Twelve')): k+=1
    body=lines[k:]
    body=[l for l in body if l.strip()!='---']
    fm=FM[vol]
    for key,cap in [('article_type',30),('goal',44),('doi',36)]:
        assert len(fm[key])<=cap,(vol,key,len(fm[key]))
    head=("---\n"
          f"edition: journal\ntitle: {fm['title']}\nsubtitle: {fm['subtitle']}\nauthor_line: Mohammad F. Islam, PhD^1^\njournal: Tractatus Historicus\n"
          f"article_type: {fm['article_type']}\ngoal: {fm['goal']}\ndoi: {fm['doi']}\nvolume: Volume {vol} of Four\npages: Audited Edition\ndate: 2 September 2026\naccent: copper\n---\n"
          f":::affiliations\n{AFF}\n:::\n\n:::abstract\n{fm['abstract']}\n:::\n\n")
    open(out,'w',encoding='utf-8').write(head+"\n".join(body))
    print(vol,"prepared:",len(body),"lines")
G="/home/claude/push/History & Theology/FINAL_v1.2.0_audited/"
import subprocess
def span_tables(vol,lines):
    # every table with three or more columns spans; in Volume I every table in the apparatus spans
    out=[]; i=0; in_app=False
    while i<len(lines):
        ln=lines[i]
        if vol=='I' and re.match(r'^(# PART THREE|## APPENDIX A)',ln): in_app=True
        if ln.lstrip().startswith('|') and (i==0 or not re.match(r'^Table\*?:',lines[i-1])):
            j=i
            while j<len(lines) and lines[j].lstrip().startswith('|'): j+=1
            ncol=len([c for c in lines[i].strip().strip('|').split('|')])
            if ncol>=3 or (vol=='I' and in_app): out.append('Table*:')
            out.extend(lines[i:j]); i=j; continue
        out.append(ln); i+=1
    return out
_orig_build=build
def build(vol,src,out):
    if vol=='I':
        subprocess.run(['python3','/home/claude/render/convert_vol1.py',src,'/home/claude/render/Vol_I_src_render.md'],check=True); src='/home/claude/render/Vol_I_src_render.md'
    _orig_build(vol,src,out)
    t=open(out,encoding='utf-8').read(); fm_end=t.index('\n:::\n\n',t.index(':::abstract'))+5
    head,body=t[:fm_end],t[fm_end:]
    body="\n".join(span_tables(vol,body.split('\n')))
    open(out,'w',encoding='utf-8').write(head+body); print(vol,"spanning tables:",body.count('Table*:'))
for vol,src,out in [('IV',G+'Vol_IV_The_Office_of_the_Messiah_a.md','r_IV.md'),('III',G+'Vol_III_History_of_the_Messianic_Position_a.md','r_III.md'),('II',G+'Vol_II_The_Conceded_Throne_a.md','r_II.md'),('I',G+'Vol_I_Critical_History_Israel_Judah_Successors_a.md','r_I.md')]:
    build(vol,src,out)
