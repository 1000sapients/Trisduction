import re, subprocess, sys, os
src, stem = sys.argv[1], sys.argv[2]
s = open(src).read()
full = re.sub(r"@@INCLUDE ([^@]+)@@", lambda m: open(m.group(1)).read().rstrip("\n"), s)
open(stem + "_full.md", "w").write(full)
ret = ["[⟀] · [Ξ₀]", "lassical RH stays open", "[⟀] · [⟀ T] · [Ø₀]", "nuclear spacings", "undecidable in ZFC", "interpretive analog"]
print("retired:", [r for r in ret if r in full], "em dashes:", full.count("—"))
def repl(m):
    single = "RECEIPT · mode quick" in m.group(2)
    fs = (os.environ.get("RFS", "\\fontsize{6.0}{7.0}")) if single else os.environ.get("CFS", "\\fontsize{6.2}{7.2}")
    v = "\\begin{Verbatim}[fontsize=" + fs + "\\selectfont,breaklines,breakanywhere,breaksymbolleft={}]\n" + m.group(2).rstrip("\n") + "\n\\end{Verbatim}"
    return "```{=latex}\n" + (v if single else "\\begin{multicols}{2}\n" + v + "\n\\end{multicols}") + "\n```"
t = re.sub(r"```(lean|fortran|text)\n(.*?)```", repl, full, flags=re.S)
parts = re.split(r"(\\begin\{Verbatim\}.*?\\end\{Verbatim\})", t, flags=re.S)
for i in range(0, len(parts), 2):
    parts[i] = parts[i].replace("10.5281/zenodo.", "10.5281/`\\allowbreak{}`{=latex}zenodo.").replace(
        "github.com/1000sapients/Trisduction", "github.com/`\\allowbreak{}`{=latex}1000sapients/`\\allowbreak{}`{=latex}Trisduction")
t = "".join(parts)
t = t.replace("**Provenance.**", "```{=latex}\n\\sloppy\n```\n\n**Provenance.**", 1)
open(stem + "_pdf.md", "w").write(t)
subprocess.run(["pandoc", stem + "_pdf.md", "-o", stem + ".tex", "--template", "mathjournal_1col.tex", "--standalone",
                "-f", "markdown+raw_tex+tex_math_dollars", "--no-highlight"], check=True)
for _ in range(2):
    r = subprocess.run(["xelatex", "-interaction=nonstopmode", "-halt-on-error", stem + ".tex"], capture_output=True, text=True)
log = open(stem + ".log", errors="replace").read()
bad = [l for l in log.splitlines() if l.startswith("!") or "Missing character" in l or "Overfull" in l]
print("xelatex exit", r.returncode, "| warnings:", len(bad))
for l in bad[:8]: print("  ", l)
print(subprocess.run(["pdfinfo", stem + ".pdf"], capture_output=True, text=True).stdout.split("Pages:")[1].split("\n")[0].strip(), "pages")
