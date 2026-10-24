#!/usr/bin/env python3
"""certify.py · provenance certificates and census of the Millennium Grand Master tree, v1.0.0_CC.

Usage: certify.py TREE_SRC SOURCES_DIR OUT_DIR
  TREE_SRC     the master's src/ (Millennium_Grand_Master_v1_0_0_CC.lean and Millennium/)
  SOURCES_DIR  the published originals, by their published file names
  OUT_DIR      writes census.json and CERTIFICATE.txt

Certifies, each from the bytes:
  1. thirteen modules byte-identical to their published originals (six v1.1.0_CC row masters, four Mathlib bindings,
     the three kernels of Appendix R);
  2. FTOE_Shared: its body after the header is lines 14560 to 14843 of the RH master v3.0.39_CC, verbatim;
  3. RH: the published master with its TOE0 block (lines 125 to 293) and its FTOE block (lines 14560 to 14843)
     removed and two import lines inserted after line 4 is the module, byte for byte;
  4. PNP: the published master with the import of FTOE_Shared as its first line and its 62 shared fTOE declarations
     removed is the module, byte for byte; every removed declaration is text-identical to its copy in FTOE_Shared;
  5. Hunt: the hunt kernel of Supplement S1 with its import lines replaced is the module, byte for byte;
  6. the root's Part S.8 carries Part M of the method's executable form verbatim;
and counts, per file, bytes, sha256, theorem and lemma declarations, and #guard_msgs pins. Exits 1 on any failure."""
import hashlib, json, os, re, sys

SRC, ORIG, OUT = sys.argv[1], sys.argv[2], sys.argv[3]
os.makedirs(OUT, exist_ok=True)
MOD = os.path.join(SRC, "Millennium")
ROOT = "Millennium_Grand_Master_v1_0_0_CC.lean"


def rd(p):
    return open(p, "rb").read()


def sha(b):
    return hashlib.sha256(b).hexdigest()


VERBATIM = {
    "NS": "NS_Normal_Form_Paper_v1_1_0_CC.lean", "YM": "YM_Normal_Form_Paper_v1_1_0_CC.lean",
    "Hodge": "Hodge_Normal_Form_Paper_v1_1_0_CC.lean", "BSD": "BSD_Normal_Form_Paper_v1_1_0_CC.lean",
    "PC": "PC_Normal_Form_Paper_v1_1_0_CC.lean", "GB": "GB_Normal_Form_Paper_v1_1_0_CC.lean",
    "NSBind": "NS_Mathlib_Binding_v1_1_0_CC.lean", "BSDBind": "BSD_Mathlib_Binding_v1_1_0_CC.lean",
    "PCBind": "PC_Mathlib_Binding_v1_1_0_CC.lean", "GBBind": "GB_Mathlib_Binding_v1_1_0_CC.lean",
    "TOE_Zero": "TOE_Zero.lean", "Triaxial_Actuation": "Triaxial_Actuation.lean",
    "Root_Grade_Ledger": "Root_Grade_Ledger.lean",
}
RH_SRC, PNP_SRC = "RH_Both_Sides_Formal_Master_v3_0_39_CC.lean", "PNP_Normal_Form_Paper_v1_13_0_CC.lean"
HUNT_SRC = "One_Bit_Perelmanification_Hunt_v1_0_0_CC.lean"
fails, lines_out = [], []


def check(ok, what):
    lines_out.append(("PASS  " if ok else "FAIL  ") + what)
    if not ok:
        fails.append(what)


# 1 · verbatim
for m, f in VERBATIM.items():
    a, b = rd(os.path.join(MOD, m + ".lean")), rd(os.path.join(ORIG, f))
    check(a == b, f"Millennium.{m} is {f} byte for byte, sha256 {sha(a)}")

# 2 · FTOE_Shared
rh_src = rd(os.path.join(ORIG, RH_SRC)).decode("utf-8")
rh_lines = rh_src.split("\n")
block = "\n".join(rh_lines[14559:14843])
ftoe = rd(os.path.join(MOD, "FTOE_Shared.lean")).decode("utf-8")
check(ftoe.rstrip("\n").endswith(block.rstrip("\n")) and block.strip() != "",
      f"Millennium.FTOE_Shared carries lines 14560-14843 of {RH_SRC} verbatim after its header "
      f"(block sha256 {sha(block.encode())})")

# 3 · RH
kept = rh_lines[:124] + rh_lines[293:14559] + rh_lines[14843:]
rebuilt = kept[:4] + ["import Millennium.TOE_Zero", "import Millennium.FTOE_Shared"] + kept[4:]
rh_mod = rd(os.path.join(MOD, "RH.lean")).decode("utf-8")
check("\n".join(rebuilt) == rh_mod,
      f"Millennium.RH is {RH_SRC} (sha256 {sha(rh_src.encode())}) with lines 125-293 and 14560-14843 removed and two "
      f"import lines inserted after line 4, byte for byte")

# 4 · PNP
pnp_src = rd(os.path.join(ORIG, PNP_SRC)).decode("utf-8")
asm = json.load(open(os.path.join(os.path.dirname(os.path.abspath(__file__)), "cert", "assembly.json")))
spans = asm["PNP"]["removed_spans"]
pl = pnp_src.split("\n")
drop = set()
for a, b, _ in spans:
    drop.update(range(a - 1, b))
rebuilt = ["import Millennium.FTOE_Shared"] + [l for i, l in enumerate(pl) if i not in drop]
pnp_mod = rd(os.path.join(MOD, "PNP.lean")).decode("utf-8")
check("\n".join(rebuilt) == pnp_mod,
      f"Millennium.PNP is {PNP_SRC} (sha256 {sha(pnp_src.encode())}) with the import of FTOE_Shared as its first line "
      f"and {len(spans)} shared declarations removed, byte for byte")
ident = 0
for a, b, name in spans:
    text = "\n".join(pl[a - 1:b]).strip()
    body = re.sub(r"^/--.*?-/\s*", "", text, flags=re.S).strip()
    if body and body in ftoe:
        ident += 1
check(ident == len(spans), f"each of the {len(spans)} removed P ≠ NP declarations is text-identical to its copy in "
                           f"FTOE_Shared ({ident} of {len(spans)})")

# 5 · Hunt
hs = rd(os.path.join(ORIG, HUNT_SRC)).decode("utf-8")
hm = rd(os.path.join(MOD, "Hunt.lean")).decode("utf-8")
strip_imports = lambda s: "\n".join(l for l in s.split("\n") if not l.startswith("import "))
check(strip_imports(hs) == strip_imports(hm),
      f"Millennium.Hunt is {HUNT_SRC} (sha256 {sha(hs.encode())}) with its import lines re-pointed to the tree, every "
      f"other byte verbatim")

# 6 · the root's Part S.8 is the method's Part M, verbatim
METHOD_SRC = "One_Bit_Method_v1_0_0_CC.lean"
ms = rd(os.path.join(ORIG, METHOD_SRC)).decode("utf-8")
part_m = ms[ms.index("/-- WHAT A ROW BUILDS"):ms.index("end OneBitMethod")].rstrip("\n")
root_text = rd(os.path.join(SRC, ROOT)).decode("utf-8")
check(part_m in root_text, f"the root's Part S.8 carries Part M of {METHOD_SRC} (sha256 {sha(ms.encode())}) verbatim, "
                           f"{part_m.count(chr(10)) + 1} lines")

# census
DECL = re.compile(r"^(?:@\[[^\]]*\]\s*)?(?:(?:private|protected|noncomputable)\s+)*(?:theorem|lemma)\s+[A-Za-z_\u00ab]", re.M)
PIN = re.compile(r"^#guard_msgs\s+in\s+#print\s+axioms\s", re.M)
rows = []
files = sorted(os.listdir(MOD))
for f in files + [ROOT]:
    p = os.path.join(MOD, f) if f != ROOT else os.path.join(SRC, ROOT)
    b = rd(p)
    t = b.decode("utf-8")
    rows.append({"file": ("Millennium/" + f) if f != ROOT else ROOT, "bytes": len(b), "sha256": sha(b),
                 "theorems": len(DECL.findall(t)), "pins": len(PIN.findall(t))})
tot_t = sum(r["theorems"] for r in rows)
tot_p = sum(r["pins"] for r in rows)
json.dump({"rows": rows, "total_theorems": tot_t, "total_pins": tot_p, "certificates": lines_out,
           "all_pass": not fails}, open(os.path.join(OUT, "census.json"), "w", encoding="utf-8"), indent=1,
          ensure_ascii=False)
with open(os.path.join(OUT, "CERTIFICATE.txt"), "w", encoding="utf-8") as fh:
    fh.write("MILLENNIUM GRAND MASTER v1.0.0_CC · provenance certificates and census\n\n")
    fh.write("\n".join(lines_out) + "\n\n")
    fh.write("%-42s %9s %9s %6s  %s\n" % ("file", "bytes", "theorems", "pins", "sha256"))
    for r in rows:
        fh.write("%-42s %9d %9d %6d  %s\n" % (r["file"], r["bytes"], r["theorems"], r["pins"], r["sha256"]))
    fh.write("%-42s %9s %9d %6d\n" % ("total", "", tot_t, tot_p))
print("\n".join(lines_out))
print(f"theorems {tot_t} · pins {tot_p} · {'ALL PASS' if not fails else 'FAILURES: %d' % len(fails)}")
sys.exit(1 if fails else 0)
