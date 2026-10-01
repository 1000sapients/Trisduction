import os, re, json, subprocess, glob, hashlib, shutil
L="/home/claude/boot/.toolchain/lean-4.19.0-linux/bin/lean"
B="/home/claude/bundle/Trisduction_Physics_Series_2026-09-30"
C="/home/claude/sync/census2"
rows=[]
def lean_run(path):
    r=subprocess.run([L,path],capture_output=True,text=True,timeout=1200)
    out=r.stdout+r.stderr
    return r.returncode,out
def twin_run(f90, wd):
    exe=os.path.join(wd,"twin.x")
    b=subprocess.run(["gfortran","-std=f2018","-O2","-fno-fast-math","-ffp-contract=off","-o",exe,f90],capture_output=True,text=True,cwd=wd)
    if b.returncode!=0: return None,b.stdout+b.stderr
    r=subprocess.run([exe],capture_output=True,text=True,cwd=wd,timeout=900)
    return r.returncode,r.stdout+r.stderr
def judged(folder, lean, laws):
    # each engine's judgment from its own record: a judgment file named for the engine,
    # else the judgment line in the folder's records whose count equals the engine's law count
    stem=lean[:-5]
    own=[f for f in glob.glob(folder+"/*") if os.path.basename(f) in (stem+".judge.txt",)]
    own+= [f for f in glob.glob(folder+"/*_judge.txt")]
    for f in own:
        for m in re.finditer(r"refused (\d+) of (\d+)",open(f).read()):
            if int(m.group(2))==laws and (f.endswith(stem+".judge.txt") or not f.endswith(".judge.txt")):
                return "%s/%s"%(m.group(1),m.group(2))
    for f in glob.glob(folder+"/RECEIPT*.txt"):
        for m in re.finditer(r"refused (\d+) of (\d+)",open(f).read()):
            if int(m.group(2))==laws: return "%s/%s"%(m.group(1),m.group(2))
    return "?"
def record(name, folder, lean, f90, extra=None):
    wd=os.path.join(C,re.sub(r"\W","_",name)); os.makedirs(wd,exist_ok=True)
    for x in [lean]+([f90] if f90 else []): shutil.copy(os.path.join(folder,x),wd)
    if extra:
        for src,dst in extra: 
            if os.path.isdir(src): shutil.copytree(src,os.path.join(wd,dst),dirs_exist_ok=True)
            else: shutil.copy(src,os.path.join(wd,dst))
    code,out=lean_run(os.path.join(wd,lean))
    laws=len(re.findall(r"(?m)^theorem ",open(os.path.join(wd,lean)).read()))
    rec={"name":name,"lean":lean,"lean_sha":hashlib.sha256(open(os.path.join(wd,lean),"rb").read()).hexdigest()[:16],
         "lean_exit":code,"laws":laws,"free":out.count("does not depend on any axioms"),
         "propext_only":len(re.findall(r"axioms: \[propext\]\n",out+"\n")),
         "pq":out.count("[propext, Quot.sound]"),"choice":out.count("Classical.choice"),
         "declared_axioms":len(re.findall(r"(?m)^axiom ",open(os.path.join(wd,lean)).read())),
         "judged":judged(folder,lean,laws)}
    if f90:
        tc,tout=twin_run(os.path.join(wd,f90),wd)
        m=re.findall(r'"checks":(\d+),"failures":(\d+)',tout)
        rec.update({"twin":f90,"twin_exit":tc,"checks":int(m[-1][0]) if m else None,"failures":int(m[-1][1]) if m else None,
                    "twin_sha":hashlib.sha256(open(os.path.join(wd,f90),"rb").read()).hexdigest()[:16]})
    rows.append(rec); json.dump(rows,open(os.path.join(C,"census.json"),"w"),indent=1)
    print(name, {k:rec[k] for k in rec if k not in("name","lean","twin")}, flush=True)
W="/home/claude/sync/w150"
for n in ["The_Electron_Is_The_Seat","The_Neutrino_Is_The_Witness","The_Arrow_Has_Two_Branches","The_Proton_Is_The_Lock","The_Magnet_Is_The_Witness_Of_The_Pair_Correlation","The_Fluid_Is_The_Witness"]:
    record(n.replace("_"," ")+" 1.5.0", W, n+".lean", n+".f90")
inc="/home/claude/w3/twin_common.inc"
for d in sorted(os.listdir(B)):
    if not re.match(r"^(0|1)\d_",d): continue
    folder=os.path.join(B,d)
    leans=[x for x in os.listdir(folder) if x.endswith(".lean")]
    f90s=[x for x in os.listdir(folder) if x.endswith(".f90")]
    extra=[(inc,"twin_common.inc")]
    if d.startswith("18_"):
        extra+= [("/home/claude/w3/ledger.dat","ledger.dat"),("/home/claude/w3/engines","engines")]
    record(d, folder, leans[0], f90s[0] if f90s else None, extra)
print("CENSUS DONE", len(rows))
