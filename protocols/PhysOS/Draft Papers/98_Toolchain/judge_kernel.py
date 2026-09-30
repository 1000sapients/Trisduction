# Usage: LEAN=/path/to/lean python3 judge_kernel.py <Kernel.lean> <Namespace>
# e.g.   python3 judge_kernel.py SPHYS_Weak.lean SPHYS.Weak   (run from the kernel's folder)
import sys, re, os, subprocess, shutil, tempfile
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import os_check as oc
LEAN = os.environ.get("LEAN", shutil.which("lean") or "lean")
K = sys.argv[1] if len(sys.argv) > 1 else "SPHYS_One_Substrate.lean"
src = open(K, encoding="utf-8").read()
code = oc.strip_lean(src)
hits = [lab for lab, pat in oc.FORBIDDEN if re.search(pat, code)]
imports = re.findall(r"(?m)^\s*import\b", code)
axioms = re.findall(r"(?m)^\s*axiom\b", code)
print("SCREEN forbidden:", hits or "none", "| imports:", len(imports), "| axioms declared:", len(axioms))
names = re.findall(r"(?m)^theorem ([A-Za-z_][A-Za-z0-9_']*)", src)
print("laws:", len(names))
def compiles(text):
    d = tempfile.mkdtemp(); f = os.path.join(d, "K.lean"); open(f, "w", encoding="utf-8").write(text)
    r = subprocess.run([LEAN, f], capture_output=True, text=True, timeout=600)
    shutil.rmtree(d); return r.returncode == 0, r.stdout
refused, survived, parse = 0, [], []
for n in names:
    neg, ok = oc.negate(src, n)
    if not ok: parse.append(n); continue
    good, out = compiles(neg)
    if good: survived.append(n)
    else:
        if "unexpected token" in out or "expected term" in out: parse.append(n)
        else: refused += 1
# planted vacuous control: a law whose hypotheses contradict one another must survive negation
NS = sys.argv[2] if len(sys.argv) > 2 else "SPHYS.OneSubstrate"
planted = src.replace("end " + NS, "theorem planted_vacuous (h : (1 : Int) = 2) : (3 : Int) = 4 := by omega\nend " + NS, 1)
pv, _ = compiles(oc.negate(planted, "planted_vacuous")[0])
print("JUDGMENT refused %d of %d as proof failures | survived %s | parse failures %s | planted vacuous law survives its negation: %s"
      % (refused, len(names), survived or "none", parse or "none", pv))
