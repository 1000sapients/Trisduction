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
def _barrier(text):
    out=[]; code=False
    for line in text.split("\n"):
        if line.startswith("```"):
            code = not code if not line.startswith("```{=latex}") or code else code
            if line.startswith("```{=latex}"): code=True
        if not code and line.startswith("# "):
            out.append("```{=latex}"); out.append("\\FloatBarrier"); out.append("```"); out.append("")
        out.append(line)
    return "\n".join(out)
full = _barrier(full)
class _M:
    def __init__(self, tag, body): self._g = {1: tag, 2: body + "\n"}
    def group(self, k): return self._g[k]
def _convert(text):
    lines=text.split("\n"); out=[]; i=0
    while i < len(lines):
        l=lines[i]
        if l.startswith("```{=latex}"):
            j=i+1
            while j < len(lines) and lines[j].strip()!="```": j+=1
            out.extend(lines[i:j+1]); i=j+1; continue
        if l.startswith("```"):
            tag=l[3:].strip(); j=i+1
            while j < len(lines) and lines[j].strip()!="```": j+=1
            body="\n".join(lines[i+1:j])
            out.append(repl(_M(tag, body))); i=j+1; continue
        out.append(l); i+=1
    return "\n".join(out)
t = _convert(full)
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
