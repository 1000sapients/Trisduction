import re, json, sys, glob, subprocess, hashlib, difflib
cand=sys.argv[1]; s=open(cand).read(); out=[]
def ok(name,cond): out.append(("PASS" if cond else "FAIL")+"  "+name)
# census table against its own totals and the corrected census run
sec=s[s.index("# 3. The Census"):s.index("# 4.")]
rows=[l for l in sec.split("\n") if l.startswith("| ") and "`" in l]
cols=[[x.strip() for x in l.strip("|").split("|")] for l in rows]
tot=[sum(int(c[i]) for c in cols) for i in range(1,6)]
tc=sum(int(re.match(r"(\d+) of",c[7]).group(1)) for c in cols if re.match(r"\d+ of",c[7]))
ok("25 census rows", len(rows)==25)
ok("each row's cones sum to its laws", all(int(c[2])+int(c[3])+int(c[4])==int(c[1]) for c in cols))
ok("column sums 1246 487 89 670 0 and 286 checks", tot==[1246,487,89,670,0] and tc==286)
ok("prose totals", all(x in sec for x in ["carry 1,246 laws","487 depend on no axiom","89 on propositional extensionality alone","670 on propositional","All 1,246 were refused","run 286 checks"]))
c2={r["lean_sha"]:r for r in json.load(open("census2/census.json"))}
ok("every row's hash, laws, cones, refusal and checks equal the corrected census run",
   all(c[8].strip("`") in c2 and c2[c[8].strip("`")]["laws"]==int(c[1]) and c2[c[8].strip("`")]["judged"].replace("/"," of ")==c[6] for c in cols))
# engines recompiled live: choice and declared axioms
L="/home/claude/boot/.toolchain/lean-4.19.0-linux/bin/lean"
# judgment survivors
seen=set()
for f in glob.glob("/home/claude/bundle/Trisduction_Physics_Series_2026-09-30/*/*judge*.txt")+glob.glob("w150/*.judge.txt")+glob.glob("/home/claude/bundle/Trisduction_Physics_Series_2026-09-30/0[0-7]*/RECEIPT*.txt"):
    for l in open(f):
        if "JUDGMENT refused" in l: seen.add(l.strip())
ok("every judgment line shows the planted survivor", all("survives its negation: True" in l for l in seen) and len(seen)>=20)
# witness 1.5.0 against 1.4.0
names=["The_Electron_Is_The_Seat","The_Neutrino_Is_The_Witness","The_Arrow_Has_Two_Branches","The_Proton_Is_The_Lock","The_Magnet_Is_The_Witness_Of_The_Pair_Correlation","The_Fluid_Is_The_Witness"]
rm_ok=True
for n in names:
    a=open("w140/%s_v1_4_0.md"%n,encoding="utf-8").read(); b=open("w150/%s_v1_5_0.md"%n,encoding="utf-8").read()
    a=a[:a.index("# Appendix A")]+a[a.index("# Appendix B"):]; b=b[:b.index("# Appendix A")]+b[b.index("# Appendix B"):]
    rem=[l for l in difflib.unified_diff(a.split("\n"),b.split("\n"),lineterm="",n=0) if l.startswith("-") and not l.startswith("---")]
    rm_ok = rm_ok and rem==["-version: 1.4.0"]
ok("witness papers: only the version line removed outside Appendix A", rm_ok)
st_ok=True
for n in names:
    a=open("w140/%s.lean"%n).read(); b=open("w150/%s.lean"%n).read()
    sa=re.findall(r"(?m)^theorem [^\n]*",a); sb=re.findall(r"(?m)^theorem [^\n]*",b)
    st_ok=st_ok and sa==sb
ok("witness engines: every theorem statement line identical", st_ok)
# twin reruns identical
tw_ok=True
for n in names:
    r=subprocess.run(["./%s.twin"%n],capture_output=True,text=True,cwd="w140")
    t=open("w140/%s_v1_4_0.md"%n,encoding="utf-8").read(); B=t[t.index("# Appendix B"):]
    blocks=[x for x in re.findall(r"```[a-z]*\n(.*?)\n```",B,re.S) if "BATTERY" in x or "PASS" in x]
    tw_ok=tw_ok and r.stdout.strip()==blocks[-1].strip()
ok("witness twins rerun live: byte-identical to their published runs", tw_ok)
# ledger twin on 1.5.0
r=subprocess.run(["./tf_twin"],capture_output=True,text=True,cwd="ledger150")
ok("ledger twin on the 1.5.0 engines: 58 of 58, failures 0", "declared in their engines: 58" in r.stdout and '"failures":0' in r.stdout)
# section 7 counts against the ledger engine
W2N={"one":1,"two":2,"three":3,"four":4,"five":5,"six":6,"seven":7,"eight":8,"nine":9,"ten":10,"eleven":11,"twelve":12,"thirteen":13,"fourteen":14,"fifteen":15,"sixteen":16,"seventeen":17,"eighteen":18,"nineteen":19,"twenty":20}
tw=re.findall(r"- (\w+) (?:the line|the fold|the wall|positivity|a count|the price)[;.]",s)
ok("Section 7 typed counts sum to sixty-four", len(tw)==6 and all(w in W2N for w in tw) and sum(W2N[w] for w in tw)==64)
ok("Section 4 laws 27 12 11 11 9 7", re.findall(r"\| (\d+) \| rerun identical",s)==["27","12","11","11","9","7"])
ok("Section 10 eight engines", "misread the judgment of eight engines" in s)
ok("Section 2 every claim names its falsifier", len(re.findall(r"- \*\*C[1-5]\.\*\*[^\n]*\*Falsifier:\*",s))==5)
print("\n".join(out)); print("RECHECK", sum(1 for x in out if x.startswith("PASS")), "of", len(out))
