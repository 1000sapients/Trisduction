#!/usr/bin/env python3
"""os_check.py . PhysOSᵀ 1.0.5p . the ground, the verdict, the controls, the judgment, the bootstrap.
Called by boot.sh. Reads nothing outside the directory the OS file was extracted into.
  python3 os_check.py ground     manifest, source screen, citation closure, quarantine scan
  python3 os_check.py verdict    the digest chain in load order, and the seat line
  python3 os_check.py controls   negative controls in scratch copies: each must refuse
                                 for its named reason, and the clean copy must earn
  python3 os_check.py judge      every cited law negated in the kernel that proves it: each negation
                                 must be refused as a proof failure; a planted vacuous law must survive
  python3 os_check.py bootstrap  fetch core Lean 4.19.0 for this machine from its release, verify it against
                                 the pinned digest, unpack it under .toolchain/; name the gfortran to install
"""
import hashlib, os, re, shutil, subprocess, sys, tempfile

OS_FILE = os.environ.get("OS_FILE", "PhysOSᵀ_v1_0_5p.md")
LEAN_VERSION = "4.19.0"
LEAN_RELEASE = "https://github.com/leanprover/lean4/releases/download/v4.19.0/"
# the release archives of core Lean 4.19.0, one per platform, pinned by their SHA-256
LEAN_ASSETS = {
    ("Linux", "x86_64"): ("lean-4.19.0-linux.zip", "4e09ca16ff782f51f58b409e7bf983591a3fa17b85aa18d56feddca4398b7f29"),
    ("Linux", "aarch64"): ("lean-4.19.0-linux_aarch64.zip", "90edeb386a1102ed90a3b782ced1fd652bdaf1f5327657ea1bf8db22f02bf5c2"),
    ("Darwin", "x86_64"): ("lean-4.19.0-darwin.zip", "501fb6f9af205e594b023ebe894dd0ad6475f9c5e6a45487e68b9a8ed8d4b4be"),
    ("Darwin", "arm64"): ("lean-4.19.0-darwin_aarch64.zip", "09f5534815844869414274628b8dfa86be0a20df2d38c2a615e9afc0b06536c0"),
}
FORTRAN_HINTS = [("apt-get", "apt-get install -y gfortran"), ("dnf", "dnf install -y gcc-gfortran"),
                 ("pacman", "pacman -S gcc-fortran"), ("zypper", "zypper install gcc-fortran"),
                 ("apk", "apk add gfortran"), ("brew", "brew install gcc")]
MARK = "<!-- CODE" + " BEGINS -->"
NAME = re.compile(r"^[A-Za-z0-9_]+\.(?:lean|f90|sh|py)$")
SEAT_KERNELS = ["Bridge_Final", "Universal_Closure", "One_Cut", "One_Cut_Resolution", "One_Cut_Terminal",
                "Only_The_Arrow_Remains", "Physical_Closure", "Forced_Closure", "Closure_Executed", "Armed_Seat"]
SEAT_TWINS = ["One_Cut_Twin", "Physical_Closure_Twin"]
# The floor: the census, compiled and witnessed at every boot, and never a seat.
FLOOR_KERNELS = ["Census", "Heat_Bridge"]
FLOOR_TWINS = ["Census_Twin"]
EXTRA_TWINS = ["Electron_Twin", "Neutrino_Twin", "Arrows_Twin", "Proton_Twin",
               "PairCorr_Twin", "Fluid_Twin", "Rows_Twin", "Codex_Twin"]
THESIS = "RA_TOE_Thesis_Fortran_v2_0_0.f90"


def parse_proofs(path):
    """The PhysOS Proofs of II.10, read as data from their record lines: tag, kernel, capstones with their declared
    cone, the number of laws the judgment must refuse in the kernel, and the twin with its declared check count."""
    if not os.path.exists(path):
        return []
    text = open(path, encoding="utf-8", errors="replace").read()
    head = text[:text.index(MARK)] if MARK in text else text
    out = []
    for ln in head.split("\n"):
        if not ln.startswith("**PhysOS Proof · "):
            continue
        tag = re.search(r"PSP-[A-Z0-9-]+", ln)
        ker = re.search(r"kernel `([A-Za-z0-9_]+)\.lean`", ln)
        cap = re.search(r"capstones? ((?:`[A-Za-z0-9_]+`(?:, )?)+) \[([^\]]*)\]", ln)
        jud = re.search(r"(\d+) laws judged", ln)
        twn = re.search(r"twin `([A-Za-z0-9_]+)\.f90`, (\d+) checks", ln)
        out.append({"tag": tag.group(0) if tag else "PSP-?", "line": ln,
                    "kernel": ker.group(1) if ker else None,
                    "capstones": re.findall(r"`([A-Za-z0-9_]+)`", cap.group(1)) if cap else [],
                    "cone": [a.strip() for a in cap.group(2).split(",") if a.strip()] if cap else None,
                    "judged": int(jud.group(1)) if jud else None,
                    "twin": twn.group(1) if twn else None, "checks": int(twn.group(2)) if twn else None})
    return out


PROOFS = parse_proofs(OS_FILE)
PROOF_KERNELS = [p["kernel"] for p in PROOFS if p["kernel"]]
PROOF_TWINS = [p["twin"] for p in PROOFS if p["twin"]]
REQUIRED = (["boot.sh", "os_check.py", THESIS, "Codex.lean"]
            + [k + ".lean" for k in SEAT_KERNELS + FLOOR_KERNELS + PROOF_KERNELS]
            + [t + ".f90" for t in SEAT_TWINS + FLOOR_TWINS + PROOF_TWINS + EXTRA_TWINS])
# The codex's declared premises: the only axioms any kernel may declare.
PREMISES = {"U", "ΔE", "RA", "FormalDomain", "L1m", "L2m", "L3m", "nest_21", "nest_32",
            "Ground", "σ", "σ_binding", "Residence", "FormalFace", "KineticFace", "Crossing",
            "erasureClass", "RegistrationPostulate", "Row", "SupplyClean", "FrozenData",
            "Algorithm", "certifiedPairing"}
PRINTED_OK = {"propext", "Quot.sound", "Classical.choice"}
FORBIDDEN = [
    ("sorry", r"\bsorry\b"), ("admit", r"\badmit\b"), ("native_decide", r"\bnative_decide\b"),
    ("#exit", r"#exit\b"),
    ("kernel-check bypass", r"skipKernelTC|Lean\.ofReduceBool|Lean\.trustCompiler"),
    ("unsafe or external code", r"\bunsafe\b|implemented_by|@\[\s*extern"),
    ("metaprogram command", r"(?m)^\s*(?:@\[[^\]]*\]\s*)?(?:scoped\s+|local\s+)?"
                            r"(?:macro|macro_rules|syntax|elab|elab_rules|declare_syntax_cat)\b"
                            r"|\brun_cmd\b|\brun_tac\b|\brun_elab\b|\binitialize\b"),
    ("compile-time IO", r"\bIO\b|\bEIO\b|\bBaseIO\b|\bSystem\.|\bFS\."),
]
RETIRED = ["[⟀] · [Ξ₀]", "lassical RH stays open", "[⟀] · [⟀ T] · [Ø₀]", "nuclear spacings",
           "undecidable in ZFC", "interpretive analog"]
HELD_BY_REVIEW = 3          # the retirements of section Q that name a kind of claim, not a string
EXEMPT = {"OS_MODE", "OS_FILE", "OS_SCAN", "LEAN", "FC"}
JSON_THESIS = '{"checks":1123,"failures":0,"mode":"sealed"}'


def read(p):
    return open(p, encoding="utf-8", errors="replace").read() if os.path.exists(p) else ""


def strip_lean(s):
    """Lean source with comments removed. String and char literals are lexed, so a "--" inside a
    string opens no comment, and kept verbatim, so code inside an interpolated string is screened."""
    out, i, n, depth = [], 0, len(s), 0
    while i < n:
        if depth == 0 and s.startswith("--", i):
            j = s.find("\n", i); i = n if j < 0 else j; continue
        if s.startswith("/-", i):
            depth += 1; i += 2; continue
        if depth and s.startswith("-/", i):
            depth -= 1; i += 2; continue
        if depth:
            i += 1; continue
        c = s[i]
        if c == '"':
            j = i + 1
            while j < n and s[j] != '"':
                j += 2 if s[j] == "\\" else 1
            out.append(s[i:j + 1]); i = j + 1; continue
        if c == "'" and i + 2 < n and s[i + 2] == "'" and s[i + 1] != "'":
            out.append(s[i:i + 3]); i += 3; continue
        out.append(c); i += 1
    return "".join(out)


def declared(base, lean_src, f90_src):
    lean_pat = (r"(?m)^\s*(?:@\[[^\]]*\]\s*)?(?:private\s+|protected\s+|noncomputable\s+)*"
                r"(?:theorem|lemma|def|abbrev|structure|inductive|axiom|instance|class)\s+"
                r"(?:[A-Za-z_][A-Za-z0-9_]*\.)*" + re.escape(base) + r"(?![A-Za-z0-9_'])")
    f90_pat = (r"(?i)(?:subroutine|function|program|module)\s+" + re.escape(base) + r"\b"
               r"|parameter\s*::\s*" + re.escape(base) + r"\b")
    return bool(re.search(lean_pat, lean_src) or re.search(f90_pat, f90_src))


def toolchain():
    """The Lean and the gfortran the boot will use, probed directly: version lines, or empty strings."""
    def probe(cmd):
        try:
            p = subprocess.run(cmd, capture_output=True, text=True, timeout=120)
            return (p.stdout + p.stderr).strip().split("\n")[0]
        except Exception:
            return ""
    return probe([os.environ.get("LEAN", "lean"), "--version"]), probe([os.environ.get("FC", "gfortran"), "--version"])


def fortran_hint():
    return "; ".join(cmd for tool, cmd in FORTRAN_HINTS if shutil.which(tool)) or "install gfortran (GCC 13 or later) with the machine's package manager"


def ground():
    out, fails = [], []
    lv, fv = toolchain()
    if "version " + LEAN_VERSION not in lv:
        fails.append("toolchain: Lean %s required, %s; OS_MODE=bootstrap fetches it" % (LEAN_VERSION, ("found " + lv) if lv else "none found"))
    if "GNU Fortran" not in fv:
        fails.append("toolchain: gfortran not found; " + fortran_hint())
    out.append("toolchain: %s" % ("Lean %s and gfortran present" % LEAN_VERSION if not fails else "FAILED"))
    signed = {}
    if not os.path.exists("MANIFEST.sha256"):
        fails.append("manifest absent")
    else:
        for ln in read("MANIFEST.sha256").split("\n"):
            if not ln:
                continue
            m = re.match(r"^([0-9a-f]{64})  (\S+)$", ln)
            if not m or not NAME.match(m.group(2)):
                fails.append("manifest line malformed"); continue
            signed[m.group(2)] = m.group(1)
        for f in REQUIRED:
            if f not in signed:
                fails.append("manifest does not sign " + f)
        for f, d in sorted(signed.items()):
            if not os.path.exists(f):
                fails.append("manifest: " + f + " missing")
            elif hashlib.sha256(open(f, "rb").read()).hexdigest() != d:
                fails.append("manifest: " + f + " altered")
    mf = [x for x in fails if x.startswith("manifest")]
    out.append("manifest: %d files signed, %s" % (len(signed), "all verified" if not mf else "FAILED"))
    seated = {k + ".lean" for k in SEAT_KERNELS + FLOOR_KERNELS + PROOF_KERNELS + ["Codex"]}
    for f in sorted(signed):
        if f.endswith(".lean") and f not in seated:
            fails.append("signed kernel %s is not seated" % f)
    pf = []
    for p in PROOFS:
        if None in (p["kernel"], p["cone"], p["judged"], p["twin"], p["checks"]) or not p["capstones"]:
            pf.append("PhysOS Proof %s: record line incomplete" % p["tag"]); continue
        src = strip_lean(read(p["kernel"] + ".lean"))
        for c in p["capstones"]:
            if not re.search(r"(?m)^theorem " + re.escape(c) + r"(?![A-Za-z0-9_'])", src):
                pf.append("PhysOS Proof %s: capstone %s not declared in %s.lean" % (p["tag"], c, p["kernel"]))
    fails += pf
    out.append("proofs: %d PhysOS Proof%s read from II.10, %s" % (len(PROOFS), "" if len(PROOFS) == 1 else "s",
                                                             "record lines complete" if not pf else "FAILED"))

    kernels = [k + ".lean" for k in SEAT_KERNELS + FLOOR_KERNELS + PROOF_KERNELS + ["Codex"]]
    lean_src, screened, prem = "", 0, set()
    for f in kernels:
        if not os.path.exists(f):
            continue
        raw = read(f); lean_src += raw + "\n"; code = strip_lean(raw); screened += 1
        for label, pat in FORBIDDEN:
            if re.search(pat, code):
                fails.append("source screen: %s in %s" % (label, f))
        if any(i != "Lean" for i in re.findall(r"(?m)^\s*import\s+(\S+)", code)):
            fails.append("source screen: import beyond the core library in " + f)
        ax = set(re.findall(r"(?m)^\s*(?:@\[[^\]]*\]\s*)?(?:private\s+|protected\s+)?axiom\s+([^\s:({\[]+)", code))
        if ax - (PREMISES if f == "Codex.lean" else set()):
            fails.append("source screen: axiom beyond the named premises in " + f)
        if f == "Codex.lean":
            prem = ax
            if ax != PREMISES:
                fails.append("source screen: the codex's named premises altered")
    sf = [x for x in fails if x.startswith("source screen")]
    out.append("source screen: %d kernels, %d named premises, %s" % (screened, len(prem), "clean" if not sf else "FAILED"))

    f90_src = "".join(read(f) + "\n" for f in os.listdir(".") if f.endswith(".f90"))
    if not os.path.exists(OS_FILE):
        fails.append("OS file absent: " + OS_FILE)
    else:
        text = read(OS_FILE)
        head = text[:text.index(MARK)] if MARK in text else text
        prose = re.sub(r"(?s)```.*?```", "", head)
        names = {n for n in re.findall(r"`([A-Za-z_][A-Za-z0-9_.]*)`", prose)
                 if n not in EXEMPT and not re.fullmatch(r"[0-9a-f]{16}", n)
                 and not re.search(r"\.(?:lean|f90|sh|py|md|sha256)$", n)}
        bad = [n for n in sorted(names) if not declared(n.split(".")[-1], lean_src, f90_src)]
        for n in bad:
            fails.append("unresolved citation: " + n)
        out.append("citations: %d laws named in Parts I and II, %d resolved" % (len(names), len(names) - len(bad)))
        scan = head
        if "## §Q" in scan and "## §Φ.0" in scan:
            scan = scan[:scan.index("## §Q")] + scan[scan.index("## §Φ.0"):]
        hits = [i + 1 for i, q in enumerate(RETIRED) if q in scan]
        for extra in [x for x in os.environ.get("OS_SCAN", "").split(":") if x]:
            hits += [i + 1 for i, q in enumerate(RETIRED) if q in read(extra)]
        for i in sorted(set(hits)):
            fails.append("retired verdict outside quarantine (scan pattern %d)" % i)
        out.append("quarantine: %d retirements string-scanned, %d held by review, %s"
                   % (len(RETIRED), HELD_BY_REVIEW, "clean" if not hits else "HIT"))
    for l in out:
        print(l)
    for f in fails:
        print("FAIL " + f)
    return 1 if fails else 0


def verdict():
    mode = os.environ.get("OS_MODE", "quick")
    ex = [l for l in read("receipt/exits.txt").split("\n") if l]
    g = read("receipt/ground.txt")
    fails = [l[5:] for l in g.split("\n") if l.startswith("FAIL ")]
    if "ground 0" not in ex and not fails:
        fails.append("ground did not complete")
    fails += [l for l in ex if not l.endswith(" 0") and not l.startswith("ground ")]

    ra = read("receipt/ra_toe.run.txt")
    js = re.findall(r"BATTERY-JSON: (\{[^\n]*\})", ra)
    if "registerA RA_TOE_Thesis 0" in ex and (not js or js[-1] != JSON_THESIS):
        fails.append("Register A: the battery is not 1,123 checks, zero failures, sealed")

    kernels = SEAT_KERNELS + FLOOR_KERNELS + PROOF_KERNELS + (["Codex"] if mode == "full" else [])
    for k in kernels:
        t = read("receipt/%s.lean.txt" % k)
        if "registerB %s 0" % k not in ex:
            continue
        if "declaration uses 'sorry'" in t or "sorryAx" in t:
            fails.append("Register B: sorry in " + k)
        for name, axs in re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]", t):
            for a in [x.strip() for x in axs.replace("\n", " ").split(",") if x.strip()]:
                ns, base = (a.split(".", 1) + [""])[:2] if "." in a else ("", a)
                if a in PRINTED_OK or (ns in ("ROOT", "POSTULATE") and base in PREMISES):
                    continue
                fails.append("Register B: %s prints axiom %s for %s" % (k, a, name))
    if "registerB Universal_Closure 0" in ex and \
            "ledger_is_computed' does not depend on any axioms" not in read("receipt/Universal_Closure.lean.txt"):
        fails.append("Register B: the ledger is not printed axiom-free")
    if "#guard_msgs in #print axioms Bridge.line_property_is_keyed" not in read("Bridge_Final.lean"):
        fails.append("Register B: the Bridge's keyed theorem is not pinned")
    if "#guard_msgs in #print axioms Closure.riemann_closure_executed" not in read("Closure_Executed.lean"):
        fails.append("Register B: the capstone theorem is not pinned")
    if "registerB One_Cut_Terminal 0" in ex and \
            "'OneCutTerminal.arc_terminal' depends on axioms: [propext, Quot.sound]" not in read("receipt/One_Cut_Terminal.lean.txt"):
        fails.append("Register B: the terminal law is not printed")
    if "registerB Only_The_Arrow_Remains 0" in ex and \
            "'Arrow.only_one_bit' does not depend on any axioms" not in read("receipt/Only_The_Arrow_Remains.lean.txt"):
        fails.append("Register B: the arrow's one bit is not printed axiom-free")
    if "registerB One_Cut_Resolution 0" in ex and \
            "'OneCutRes.twin_grid_decided' does not depend on any axioms" not in read("receipt/One_Cut_Resolution.lean.txt"):
        fails.append("Register B: the twin's grid is not decided in the kernel")
    if "registerB Only_The_Arrow_Remains 0" in ex and \
            "'Arrow.return_one_bit' does not depend on any axioms" not in read("receipt/Only_The_Arrow_Remains.lean.txt"):
        fails.append("Register B: the earned-return law is not printed axiom-free")
    if "registerB Armed_Seat 0" in ex and \
            "'Armed.armed' depends on axioms: [propext, Classical.choice, Quot.sound]" not in read("receipt/Armed_Seat.lean.txt"):
        fails.append("Register B: the armed seat is not printed")
    if "registerB Armed_Seat 0" in ex and \
            "'Armed.root_undeniable' does not depend on any axioms" not in read("receipt/Armed_Seat.lean.txt"):
        fails.append("Register B: the root's undeniability is not printed axiom-free")
    if "registerB Census 0" in ex and \
            "'Census.the_census' depends on axioms: [propext, Quot.sound]" not in read("receipt/Census.lean.txt"):
        fails.append("Register B: the census law is not printed")
    if "registerB Heat_Bridge 0" in ex and \
            "'Heat.count_to_heat' depends on axioms: [propext, Quot.sound]" not in read("receipt/Heat_Bridge.lean.txt"):
        fails.append("Register B: the count-to-heat law is not printed")
    for p in PROOFS:
        if not p["kernel"] or "registerB %s 0" % p["kernel"] not in ex:
            continue
        t = read("receipt/%s.lean.txt" % p["kernel"])
        want = "does not depend on any axioms" if not p["cone"] else "depends on axioms: [%s]" % ", ".join(p["cone"])
        for c in p["capstones"]:
            if not re.search(r"'(?:[A-Za-z_][A-Za-z0-9_]*\.)*" + re.escape(c) + r"' " + re.escape(want), t):
                fails.append("PhysOS Proof %s: %s does not print the declared cone" % (p["tag"], c))
        if p["twin"] and "witness %s 0" % p["twin"] in ex:
            j = re.findall(r'"checks":(\d+)', read("receipt/%s.run.txt" % p["twin"]))
            if not j or int(j[-1]) != p["checks"]:
                fails.append("PhysOS Proof %s: %s does not run its declared checks" % (p["tag"], p["twin"]))

    twins = SEAT_TWINS + FLOOR_TWINS + PROOF_TWINS + (EXTRA_TWINS if mode == "full" else [])
    for w in twins:
        if "witness %s 0" % w not in ex:
            continue
        j = re.findall(r"BATTERY-JSON: (\{[^\n]*\})", read("receipt/%s.run.txt" % w))
        if len(j) != 1 or not re.search(r'"failures":0[,}]', j[0]):
            fails.append("witness %s: battery line not clean" % w)

    H = lambda *xs: hashlib.sha256("\x1f".join(xs).encode()).hexdigest()[:12]
    of = lambda *ph: "\n".join(l for l in ex if l.split(" ")[0] in ph)
    man = hashlib.sha256(open("MANIFEST.sha256", "rb").read()).hexdigest() if os.path.exists("MANIFEST.sha256") else "none"
    D0 = H(man, read("receipt/toolchain.txt"), g, read("receipt/hostile.txt"), of("ground", "hostile"))
    D1 = H(D0, "\n".join(l for l in ra.split("\n") if "IEEE" in l or "binary64" in l or "conduct" in l),
           js[-1] if js else "", of("registerA"))
    D2 = H(D1, *[k + "\n" + read("receipt/%s.lean.txt" % k) for k in kernels], of("registerB"))
    D3 = H(D2, *[w + "\n" + "\n".join(re.findall(r"BATTERY-JSON[^\n]*", read("receipt/%s.run.txt" % w)))
                 for w in twins], of("witness"))

    tm = {}
    for l in read("receipt/times.txt").split("\n"):
        if l:
            p, s = l.split(" "); tm[p] = int(s)
    span = lambda a, b: (str(tm[b] - tm[a]) + " s") if a in tm and b in tm else "n/a"

    lines = ["PhysOSᵀ 1.0.5p · RECEIPT · mode " + mode,
             "TOOLCHAIN " + " · ".join(l for l in read("receipt/toolchain.txt").split("\n") if l),
             "MANIFEST sha256 %s, the files that ran" % man[:16],
             "GROUND " + " · ".join(l for l in g.split("\n") if l and not l.startswith("FAIL "))]
    for l in read("receipt/hostile.txt").split("\n"):
        if l:
            lines.append("HOSTILE " + l)
    lines.append("EXITS " + " · ".join(ex))
    lines.append("REGISTER A " + (js[-1] if js else "no battery line"))
    nclean = sum(1 for w in twins if "witness %s 0" % w in ex)
    lines.append("WITNESS %d of %d twins ran, each held to one battery line with zero failures" % (nclean, len(twins)))
    lines.append("CHAIN · D0 %s -> D1 %s -> D2 %s -> D3 %s" % (D0, D1, D2, D3))
    lines.append("ELAPSED ground %s · Register A %s · Register B %s · witness %s · total %s (not hashed)"
                 % (span("start", "ground"), span("ground", "registerA"), span("registerA", "registerB"),
                    span("registerB", "witness"), span("start", "witness")))
    lines.append("SEAT EARNED · this run" if not fails else "SEAT NOT EARNED · " + "; ".join(fails))
    txt = "\n".join(lines)
    print(txt)
    open("receipt/RECEIPT.txt", "w", encoding="utf-8").write(txt + "\n")
    return 1 if fails else 0


def controls():
    files = REQUIRED + ["MANIFEST.sha256", OS_FILE]

    def resign(d, f):
        p = os.path.join(d, "MANIFEST.sha256")
        keep = [l for l in open(p, encoding="utf-8") if not l.rstrip("\n").endswith("  " + f)]
        keep.append(hashlib.sha256(open(os.path.join(d, f), "rb").read()).hexdigest() + "  " + f + "\n")
        open(p, "w", encoding="utf-8").write("".join(keep))

    def edit(f, fn, sign=True):
        def act(d):
            p = os.path.join(d, f)
            s = open(p, encoding="utf-8").read()
            open(p, "w", encoding="utf-8").write(fn(s))
            if sign:
                resign(d, f)
        return act

    def after_verdict_heading(extra):
        return lambda s: s.replace("## §Φ.5 · The verdict", "## §Φ.5 · The verdict\n\n" + extra, 1)

    C = [
        ("the clean copy", None, "SEAT EARNED"),
        ("a file edited, the manifest untouched",
         edit("One_Cut.lean", lambda s: s + "\n-- edited after extraction\n", sign=False), "manifest: One_Cut.lean altered"),
        ("the manifest deleted", lambda d: os.remove(os.path.join(d, "MANIFEST.sha256")), "manifest absent"),
        ("a sorry proving 1 = 2, re-signed",
         edit("Physical_Closure.lean", lambda s: s + "\ntheorem cheat_rh : 1 = 2 := sorry\n"), "sorry in Physical_Closure.lean"),
        ("a new axiom proving 1 = 2, re-signed",
         edit("Physical_Closure.lean", lambda s: s + "\naxiom cheat : False\ntheorem everything : 1 = 2 := cheat.elim\n"),
         "axiom beyond the named premises in Physical_Closure.lean"),
        ("an #exit truncation, re-signed",
         edit("Physical_Closure.lean", lambda s: s.replace("theorem", "#exit\ntheorem", 1)), "#exit in Physical_Closure.lean"),
        ("an admit, re-signed",
         edit("Physical_Closure.lean", lambda s: s + "\ntheorem cheat_admit : 1 = 2 := by admit\n"), "admit in Physical_Closure.lean"),
        ("a native_decide, re-signed",
         edit("Physical_Closure.lean", lambda s: s + "\ntheorem cheat_nd : 2 + 2 = 4 := by native_decide\n"), "native_decide in Physical_Closure.lean"),
        ("a kernel-check bypass, re-signed",
         edit("Physical_Closure.lean", lambda s: s + "\nset_option debug.skipKernelTC true in\ntheorem cheat_tc : True := trivial\n"),
         "kernel-check bypass in Physical_Closure.lean"),
        ("unsafe code, re-signed",
         edit("Physical_Closure.lean", lambda s: s + "\nunsafe def cheat_unsafe : Nat := 0\n"), "unsafe or external code in Physical_Closure.lean"),
        ("external code, re-signed",
         edit("One_Cut.lean", lambda s: s + "\n@[extern \"cheat_c\"] opaque cheatExtern : Nat → Nat\n"), "unsafe or external code in One_Cut.lean"),
        ("an import beyond the core library, re-signed",
         edit("One_Cut.lean", lambda s: "import Mathlib\n" + s), "import beyond the core library in One_Cut.lean"),
        ("a metaprogram command, re-signed",
         edit("One_Cut.lean", lambda s: s + "\nmacro \"hollow\" : tactic => `(tactic| rfl)\n"), "metaprogram command in One_Cut.lean"),
        ("compile-time IO, re-signed",
         edit("One_Cut.lean", lambda s: s + "\n#eval IO.println \"forged\"\n"), "compile-time IO in One_Cut.lean"),
        ("a retired verdict planted in Part I",
         edit(OS_FILE, after_verdict_heading("C" + "lassical RH stays open."), sign=False),
         "retired verdict outside quarantine (scan pattern 2)"),
        ("a phantom law cited in Part I",
         edit(OS_FILE, after_verdict_heading("The seat also rests on `phantom_law_never_proved`, `phantomlaw` and `lam`."), sign=False),
         "unresolved citation: lam; unresolved citation: phantom_law_never_proved; unresolved citation: phantomlaw"),
        ("Register A failed, re-signed",
         edit(THESIS, lambda s: s.replace("EXPECTED_CHECKS = 1123", "EXPECTED_CHECKS = 1124", 1)),
         "registerB Bridge_Final skipped"),
        ("a twin reporting a failure, re-signed",
         edit("One_Cut_Twin.f90", lambda s: s.replace(",\"failures\":'", ",\"failures\":1,\"planted\":'", 1)),
         "witness One_Cut_Twin: battery line not clean"),
        ("the independence reading planted in Part I",
         edit(OS_FILE, after_verdict_heading("Some say the value is " + "undecidable in ZFC."), sign=False),
         "retired verdict outside quarantine (scan pattern 5)"),
        ("the terminal law unprinted, re-signed",
         edit("One_Cut_Terminal.lean", lambda s: s.replace("#print axioms OneCutTerminal.arc_terminal\n", "", 1)),
         "Register B: the terminal law is not printed"),
        ("the earned-return law unprinted, re-signed",
         edit("Only_The_Arrow_Remains.lean", lambda s: s.replace("#print axioms Arrow.return_one_bit\n", "", 1)),
         "Register B: the earned-return law is not printed axiom-free"),
        ("the armed seat unprinted, re-signed",
         edit("Armed_Seat.lean", lambda s: s.replace("#print axioms Armed.armed\n", "", 1)),
         "Register B: the armed seat is not printed"),
        ("the census law unprinted, re-signed",
         edit("Census.lean", lambda s: s.replace("#print axioms Census.the_census\n", "", 1)),
         "Register B: the census law is not printed"),
        ("the count-to-heat law unprinted, re-signed",
         edit("Heat_Bridge.lean", lambda s: s.replace("#print axioms Heat.count_to_heat\n", "", 1)),
         "Register B: the count-to-heat law is not printed"),
        ("a PhysOS Proof's declared cone altered in II.10",
         edit(OS_FILE, lambda s: s.replace("`record_closes_value_stays` [propext, Quot.sound]",
                                           "`record_closes_value_stays` [propext]", 1), sign=False),
         "PhysOS Proof PSP-LOOP-01: loop_final does not print the declared cone"),
        ("a PhysOS Proof's record line deleted from II.10",
         edit(OS_FILE, lambda s: "\n".join(l for l in s.split("\n") if not l.startswith("**PhysOS Proof · The Loop")),
              sign=False),
         "signed kernel The_Loop.lean is not seated"),
    ]

    def snap(d):
        return {f: hashlib.sha256(open(os.path.join(d, f), "rb").read()).hexdigest()
                for f in sorted(os.listdir(d)) if os.path.isfile(os.path.join(d, f))}

    rows, good = [], 0
    for i, (name, mut, expect) in enumerate(C, 1):
        d = tempfile.mkdtemp(prefix="physos_control_")
        try:
            for f in files:
                if os.path.exists(f):
                    shutil.copy(f, d)
            applied = True
            if mut:
                before = snap(d); mut(d); applied = snap(d) != before
            env = dict(os.environ, OS_MODE="quick", OS_FILE=OS_FILE)
            p = subprocess.run(["bash", "boot.sh"], cwd=d, env=env, capture_output=True, text=True, timeout=3600)
            seat = ([l for l in p.stdout.split("\n") if l.startswith("SEAT")] or ["no seat line"])[-1]
            if expect == "SEAT EARNED":
                ok = applied and p.returncode == 0 and seat.startswith("SEAT EARNED")
                obs = "earned"
            else:
                ok = applied and p.returncode != 0 and seat.startswith("SEAT NOT EARNED") and expect in p.stdout
                obs = "refused: " + expect if ok else ("mutation did not apply" if not applied else "NOT AS EXPECTED: " + seat[:160])
        finally:
            shutil.rmtree(d, ignore_errors=True)
        good += ok
        rows.append("%2d %-46s %s%s" % (i, name, obs, "" if ok else "  <<<"))
    print("CONTROLS · %d · each hostile copy must refuse for its named reason, the clean copy must earn" % len(C))
    for r in rows:
        print(r)
    print("CONTROLS %d/%d as expected" % (good, len(C)))
    return 0 if good == len(C) else 1


OPEN, CLOSE = "({[⦃⟨", ")}]⦄⟩"


def negate(src, name):
    """src with the named theorem's statement replaced by its negation; the proof is left untouched."""
    m = re.search(r"(?m)^(?:@\[[^\]]*\]\s*)?theorem (?:[A-Za-z_][A-Za-z0-9_]*\.)*" + re.escape(name) + r"(?![A-Za-z0-9_'])", src)
    if not m:
        return src, False
    i, depth = m.end(), 0
    while i < len(src):
        c = src[i]
        if c in OPEN: depth += 1
        elif c in CLOSE: depth -= 1
        elif c == ":" and depth == 0 and src[i:i + 2] != ":=": break
        i += 1
    j, depth = i + 1, 0
    while j < len(src):
        c = src[j]
        if c in OPEN: depth += 1
        elif c in CLOSE: depth -= 1
        elif src[j:j + 2] == ":=" and depth == 0: break
        j += 1
    if i >= len(src) or j >= len(src):
        return src, False
    return src[:i + 1] + " ¬ (" + src[i + 1:j].strip() + ") " + src[j:], True


def judge():
    """Every law Parts I and II cite, negated in the kernel that proves it: the kernel must refuse each
    negation as a proof failure. A planted vacuous law must survive its negation, or the instrument is
    blind. The keyed bit is the one thing negation cannot destroy: no reading decides it."""
    if ground() != 0:
        print("JUDGMENT REFUSED · the ground is not clean; no judgment from an unearned seat"); return 1
    lean = os.environ.get("LEAN", "lean")
    text = read(OS_FILE); head = text[:text.index(MARK)] if MARK in text else text
    prose = re.sub(r"(?s)```.*?```", "", head)
    cited = sorted({n.split(".")[-1] for n in re.findall(r"`([A-Za-z_][A-Za-z0-9_.]*)`", prose)
                    if n not in EXEMPT and not re.fullmatch(r"[0-9a-f]{16}", n)
                    and not re.search(r"\.(?:lean|f90|sh|py|md|sha256)$", n)})
    fails, total, lines, judged = [], 0, [], set()
    PLANT = "planted_vacuous_dust"
    for k in SEAT_KERNELS + FLOOR_KERNELS + PROOF_KERNELS + ["Codex"]:
        f = k + ".lean"
        src = read(f)
        if f == "Bridge_Final.lean":
            src += "\ntheorem " + PLANT + " (h : (1 : Nat) = 2) : (0 : Nat) = 1 := by omega\n"
        mine = [n for n in cited if re.search(r"(?m)^(?:@\[[^\]]*\]\s*)?theorem (?:[A-Za-z_][A-Za-z0-9_]*\.)*" + re.escape(n) + r"(?![A-Za-z0-9_'])", src)]
        if f == "Bridge_Final.lean":
            mine.append(PLANT)
        if not mine:
            continue
        mut = src
        for n in mine:
            mut, _ = negate(mut, n)
        starts = {}
        for n in mine:
            m = re.search(r"(?m)^(?:@\[[^\]]*\]\s*)?theorem (?:[A-Za-z_][A-Za-z0-9_]*\.)*" + re.escape(n) + r"(?![A-Za-z0-9_'])", mut)
            starts[n] = mut[:m.start()].count("\n") + 1
        decl = [mut[:m.start()].count("\n") + 1 for m in re.finditer(
            r"(?m)^(?:@\[[^\]]*\]\s*)?(?:theorem|def|lemma|abbrev|structure|inductive|instance|axiom|#guard_msgs|#print|#eval|namespace|end|section|open|set_option|variable)\b", mut)]
        d = tempfile.mkdtemp(prefix="physos_judge_")
        SENT = "physos judge: the end of the file was reached"
        code, out = "timeout", ""
        try:
            open(os.path.join(d, f), "w", encoding="utf-8").write(mut + '\n#eval "' + SENT + '"\n')
            p = subprocess.run([lean, f], cwd=d, capture_output=True, text=True, timeout=7200)
            code, out = p.returncode, p.stdout
        except subprocess.TimeoutExpired:
            pass
        finally:
            shutil.rmtree(d, ignore_errors=True)
        if SENT not in out:
            fails.append("%s: the compile did not reach the end of the file (exit %s); nothing is judged "
                         "from an unfinished compile" % (f, code))
            lines.append("  %s: NOT JUDGED, the compile did not complete" % f)
            continue
        errs = {int(a): b for a, b in re.findall(re.escape(f) + r":(\d+):\d+: error: ([^\n]*)", out)}
        ok = 0
        for n in mine:
            a = starts[n]; z = min([x for x in decl if x > a] + [10 ** 9])
            hit = sorted(e for e in errs if a <= e < z)
            parse = bool(hit) and bool(re.search(r"unexpected|expected token", errs[hit[0]]))
            if n == PLANT:
                if hit: fails.append("the instrument is blind: the planted vacuous law fell")
                else: lines.append("  instrument control: a planted vacuous law survived its negation, as dust must")
                continue
            total += 1; judged.add(n)
            if hit and not parse: ok += 1
            else: fails.append("%s: the negation of %s %s" % (f, n, "was a parse failure" if parse else "SURVIVED"))
        lines.append("  %s: %d of %d cited laws refused their negation, each a proof failure"
                     % (f, ok, len([n for n in mine if n != PLANT])))
        for p in PROOFS:
            if p["kernel"] == k and p["judged"] is not None and ok != p["judged"]:
                fails.append("PhysOS Proof %s: %d laws refused in %s, %d declared" % (p["tag"], ok, f, p["judged"]))
    cx = strip_lean(read("Codex.lean"))
    posited = [n for n in cited if n not in judged and n in PREMISES
               and re.search(r"(?m)^\s*axiom\s+" + re.escape(n) + r"(?![A-Za-z0-9_'])", cx)]
    left = [n for n in cited if n not in judged and n not in posited
            and not declared(n, "", "".join(read(x) + "\n" for x in os.listdir(".") if x.endswith(".f90")))]
    for n in left:
        fails.append("cited law not found as a theorem: " + n)
    gates = [n for n in cited if n not in judged and n not in left and n not in posited]
    br = read("Bridge_Final.lean")
    arrow = all(re.search(r"(?m)^theorem " + a + r"\b", br) for a in ("line_property_contingent", "denial_is_coherent"))
    if not arrow:
        fails.append("the keyed bit is not carried: line_property_contingent and denial_is_coherent are required")
    print("JUDGMENT · %d cited laws, %d negations across the kernels that prove them" % (len(judged), total))
    for l in lines:
        print(l)
    if gates:
        print("  Fortran gates cited (%s): judged by the thesis battery at every boot" % ", ".join(gates))
    if posited:
        print("  declared premises cited (%s): posited, not proved; premise grade; pinned by the source screen"
              % ", ".join(posited))
    print("  the keyed bit: it holds on the line frame and fails on the two-point frame "
          "(line_property_contingent), and its denial keeps every fold law (denial_is_coherent); "
          "no reading decides it, so negation cannot destroy it; it is carried, never derived")
    print("JUDGMENT PASSED · everything forced fell to no negation; the keyed bit alone stands free" if not fails
          else "JUDGMENT FAILED · " + "; ".join(fails))
    return 0 if not fails else 1


def bootstrap():
    """Fetch core Lean 4.19.0 for this machine from its release, verify it against the pinned digest, unpack it under
    .toolchain/ beside this file, and name the gfortran to install. Network is used here and nowhere else."""
    import platform, urllib.request, zipfile
    key = (platform.system(), platform.machine())
    if key == ("Linux", "arm64"):
        key = ("Linux", "aarch64")
    if key not in LEAN_ASSETS:
        print("bootstrap: no pinned Lean %s archive for %s %s; install it by hand and set LEAN, or use WSL on Windows"
              % (LEAN_VERSION, key[0], key[1])); return 1
    asset, digest = LEAN_ASSETS[key]
    os.makedirs(".toolchain", exist_ok=True)
    path = os.path.join(".toolchain", asset)
    if not (os.path.exists(path) and hashlib.sha256(open(path, "rb").read()).hexdigest() == digest):
        print("bootstrap: fetching " + LEAN_RELEASE + asset)
        with urllib.request.urlopen(LEAN_RELEASE + asset, timeout=600) as r, open(path, "wb") as w:
            shutil.copyfileobj(r, w)
    got = hashlib.sha256(open(path, "rb").read()).hexdigest()
    if got != digest:
        os.remove(path); print("bootstrap: %s has digest %s, pinned %s; refused and removed" % (asset, got[:16], digest[:16])); return 1
    print("bootstrap: %s verified, sha256 %s" % (asset, digest[:16]))
    with zipfile.ZipFile(path) as z:
        for info in z.infolist():
            target = z.extract(info, ".toolchain")
            mode = (info.external_attr >> 16) & 0o777
            if mode and not info.is_dir():
                os.chmod(target, mode)
    leans = sorted(glob_lean())
    lv, fv = toolchain() if not leans else (subprocess.run([leans[0], "--version"], capture_output=True, text=True).stdout.strip(), toolchain()[1])
    print("bootstrap: " + (leans[0] + " · " + lv if leans else "no lean binary unpacked"))
    print("bootstrap: gfortran " + ("present · " + fv if "GNU Fortran" in fv else "absent; install it: " + fortran_hint()))
    print("bootstrap: then run  LEAN=%s bash boot.sh  or simply  bash boot.sh, which finds it" % (leans[0] if leans else "<path>"))
    return 0 if leans and "GNU Fortran" in fv else 1


def glob_lean():
    import glob
    return [os.path.abspath(p) for p in glob.glob(".toolchain/lean-" + LEAN_VERSION + "-*/bin/lean")]


def proofs():
    """Names the PhysOS Proof kernels or twins for the boot: `proofs kernels` or `proofs twins`."""
    which = sys.argv[2] if len(sys.argv) > 2 else "kernels"
    print(" ".join(PROOF_KERNELS if which == "kernels" else PROOF_TWINS))
    return 0


if __name__ == "__main__":
    cmd = sys.argv[1] if len(sys.argv) > 1 else ""
    sys.exit({"ground": ground, "verdict": verdict, "controls": controls, "judge": judge, "bootstrap": bootstrap,
              "proofs": proofs}.get(cmd, lambda: (print(__doc__), 2)[1])())
