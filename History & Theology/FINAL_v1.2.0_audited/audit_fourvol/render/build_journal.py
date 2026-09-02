#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
JOURNAL build engine (Professional Journal Paper).
Compiles one Markdown source to a serif two-column journal-grade PDF via
WeasyPrint: accent masthead, superscript-affiliated authors, bold abstract,
drop-cap intro, flush-left bold heads, tinted Box N panels, Table N / Fig. N
captions, dense numbered references, citation footer.

Usage:  python3 build_journal.py source.md [out.pdf]
Source dir must contain journal.css (and optionally face.css + fonts/).
"""
import sys, os, re, html, pathlib

ACCENTS={'crimson','copper','slate','navy','forest','plum'}

def parse_front(text):
    fm={}; m=re.match(r'^---\s*\n(.*?)\n---\s*\n',text,re.S); body=text
    if m:
        for line in m.group(1).splitlines():
            if ':' in line: k,v=line.split(':',1); fm[k.strip()]=v.strip()
        body=text[m.end():]
    return fm, body

def inline(s):
    s=html.escape(s, quote=False)
    s=re.sub(r'\[\[(.+?)\]\]', r'<span class="xref">\1</span>', s)
    s=re.sub(r'\*\*(.+?)\*\*', r'<strong>\1</strong>', s)
    s=re.sub(r'(?<!\*)\*(?!\*)(.+?)(?<!\*)\*(?!\*)', r'<em>\1</em>', s)
    s=re.sub(r'`(.+?)`', r'<code>\1</code>', s)
    s=re.sub(r'\^(.+?)\^', r'<sup>\1</sup>', s)
    return s

def render_blocks(lines):
    out=[]; i=0; n=len(lines)
    while i<n:
        ln=lines[i]
        if not ln.strip(): i+=1; continue
        if re.match(r'^\s*[-*\u2022]\s+', ln):
            items=[]
            while i<n and re.match(r'^\s*[-*\u2022]\s+', lines[i]):
                items.append(inline(re.sub(r'^\s*[-*\u2022]\s+','',lines[i]).rstrip())); i+=1
            out.append('<ul>'+''.join(f'<li>{x}</li>' for x in items)+'</ul>'); continue
        if re.match(r'^\s*\d+\.\s+', ln):
            items=[]
            while i<n and re.match(r'^\s*\d+\.\s+', lines[i]):
                mnum=re.match(r'^\s*(\d+)\.\s+(.*)$', lines[i]); items.append((mnum.group(1), inline(mnum.group(2).rstrip()))); i+=1
            out.append('<ol class="numtext">'+''.join(f'<li><span class="ln">{k}.</span>{x}</li>' for k,x in items)+'</ol>'); continue
        mrun=re.match(r'^\{\.\s*(.+?)\s*\.?\s*\}\s*(.*)$', ln)   # tolerant close: .} / . } / }
        if mrun:
            buf=[mrun.group(2).rstrip()] if mrun.group(2).strip() else []; i+=1
            while i<n and lines[i].strip() and not re.match(r'^\s*([-*\u2022]|\d+\.)\s+', lines[i]) \
                  and not lines[i].startswith(':::') and not re.match(r'^\{\.', lines[i]):
                buf.append(lines[i].rstrip()); i+=1
            out.append(f'<p><span class="runin">{inline(mrun.group(1))}.</span> '+inline(' '.join(buf))+'</p>'); continue
        buf=[ln.rstrip()]; i+=1
        while i<n and lines[i].strip() and not re.match(r'^\s*([-*\u2022]|\d+\.)\s+', lines[i]) \
              and not lines[i].startswith(':::') and not re.match(r'^\{\.', lines[i]):
            buf.append(lines[i].rstrip()); i+=1
        out.append('<p>'+inline(' '.join(buf))+'</p>')
    return ''.join(out)

def render_table_rows(tbl_lines):
    rows=[r for r in tbl_lines if r.strip()]
    cells=[[c.strip() for c in re.split(r'(?<!\\)\|', r.strip().strip('|'))] for r in rows]
    body=[c for c in cells if not all(re.fullmatch(r':?-{2,}:?', x or '-') for x in c)]
    head=body[0] if body else []; data=body[1:] if len(body)>1 else []
    h='<thead><tr>'+''.join(f'<th>{inline(x)}</th>' for x in head)+'</tr></thead>'
    b='<tbody>'+''.join('<tr>'+''.join(f'<td>{inline(x)}</td>' for x in r)+'</tr>' for r in data)+'</tbody>'
    return h+b

def render_table(tbl_lines, caption=None, note=None, span=False):
    cap=''
    if caption:
        m=re.match(r'^(Table\s+[\w.]+)\s*[|:]\s*(.+)$', caption)
        if m: cap=f'<div class="tcap"><span class="lab">{inline(m.group(1))} | </span>{inline(m.group(2))}</div>'
        else: cap=f'<div class="tcap">{inline(caption)}</div>'
    nt=f'<div class="tnote">{inline(note)}</div>' if note else ''
    sp=' span' if span else ''
    return f'<div class="jtable{sp}">{cap}<table>{render_table_rows(tbl_lines)}</table>{nt}</div>'

def render_figure(alt, path, brace, span=False):
    label=''; body=brace or alt; src=''
    if brace and '|' in brace:
        parts=[p.strip() for p in brace.split('|')]
        label=parts[0] if parts else ''
        body=parts[1] if len(parts)>1 else ''
        src=parts[2] if len(parts)>2 else ''
    cap=''
    if label: cap+=f'<span class="flab">{inline(label)} | </span>'
    cap+=inline(body)
    if src: cap+=f' <span class="fsrc">{inline(src)}</span>'
    sp=' span' if span else ''
    return (f'<div class="jfig{sp}"><div class="frame"><img src="{html.escape(path)}" alt="{html.escape(alt)}"></div>'
            f'<figcaption>{cap}</figcaption></div>')

def render_box(number, title, body_lines, span=False):
    has_table=any(l.lstrip().startswith('|') for l in body_lines)
    if has_table:
        i=0;n=len(body_lines);chunks=[]
        while i<n:
            if body_lines[i].lstrip().startswith('|'):
                tl=[]
                while i<n and body_lines[i].lstrip().startswith('|'): tl.append(body_lines[i]); i+=1
                note=None
                if i<n and re.match(r'^Note:\s*(.+)$', body_lines[i]):
                    note=re.match(r'^Note:\s*(.+)$', body_lines[i]).group(1).strip(); i+=1
                chunks.append('<table>'+render_table_rows(tl)+'</table>'+(f'<div class="tnote">{inline(note)}</div>' if note else ''))
            else:
                tx=[]
                while i<n and not body_lines[i].lstrip().startswith('|'): tx.append(body_lines[i]); i+=1
                if any(x.strip() for x in tx): chunks.append(render_blocks(tx))
        inner=''.join(chunks)
    else:
        inner=render_blocks(body_lines)
    lab=f'Box {number}' if number else 'Box'
    cls=' jspan' if span else (' flow' if has_table else '')
    head=f'<div class="jbh"><span class="lab">{html.escape(lab)} | </span>{inline(title)}</div>'
    return f'<div class="jbox{cls}">{head}{inner}</div>'

# --- masthead brevity law (III·J.2) ------------------------------------------
# The masthead right block is a rigid three-line stack held beside a two-line
# wordmark. A line past its cap crowds the wordmark and reads as a sentence
# rather than a label. The cap is the fix; the step-down is the net.
MH_CAPS = {'atype': 30, 'goal': 44, 'doi': 36}

def mh_fit(s, key):
    """Step-down class for an over-long masthead line, with a build-time warning."""
    cap = MH_CAPS[key]; n = len(s or '')
    if n <= cap: return ''
    step = ' t1' if n <= cap * 1.25 else ' t2'
    sys.stderr.write(f"[masthead] {key} is {n} chars, cap {cap}; stepped down"
                     f" ({step.strip()}). Shorten it in the front matter: {s!r}\n")
    return step

def render_endmatter(lines):
    out=[]; buf=[]
    def flush():
        if buf: out.append(render_blocks(buf)); buf.clear()
    for ln in lines:
        m=re.match(r'^###\s+(.+)$', ln)
        if m: flush(); out.append(f'<h3>{inline(m.group(1).strip())}</h3>')
        else: buf.append(ln)
    flush(); return ''.join(out)

def build_html(fm, body, cssfiles):
    acc=fm.get('accent','crimson').strip().lower()
    if acc not in ACCENTS: acc='crimson'
    acccls='acc-'+acc
    journal=fm.get('journal','Journal'); atype=fm.get('article_type','Article'); goal=fm.get('goal','')
    doi=fm.get('doi',''); title=fm.get('title',''); authors=fm.get('author_line',''); subtitle=fm.get('subtitle','')
    vol=fm.get('volume',''); pages=fm.get('pages',''); date=fm.get('date','')
    # masthead wordmark: first word light, remainder bold
    parts=journal.split()
    mark=(f'<span class="lite">{html.escape(parts[0])}</span> '+html.escape(' '.join(parts[1:]))) if len(parts)>1 else html.escape(journal)
    # footer citation line
    foot=journal
    if vol: foot+=f" \u00b7 Vol {vol}"
    if date: foot+=f" \u00b7 {date}"
    if pages: foot+=f" \u00b7 {pages}"

    lines=body.splitlines(); i=0; n=len(lines)
    title_affil=''; title_abs=''; title_kw=''
    body_frag=[]; endmatter_html=['']; body_started=False; lead_done=False; in_refs=False

    def open_body():
        nonlocal body_started
        if body_started: return ''
        body_started=True
        doi_html=f'<div class="doi{mh_fit(doi,"doi")}">{html.escape(doi)}</div>' if doi else ''
        sub_html=f'<div class="jsubtitle">{inline(subtitle)}</div>' if subtitle else ''
        goal_html=f'<div class="agoal{mh_fit(goal,"goal")}">{html.escape(goal)}</div>' if goal else ''
        block=(f'<div class="masthead"><div class="mark">{mark}</div>'
               f'<div class="right"><div class="atype{mh_fit(atype,"atype")}">{html.escape(atype)}</div>{goal_html}{doi_html}</div></div>'
               f'<div class="titleblock"><h1 class="jtitle">{inline(title)}</h1>'
               f'{sub_html}'
               f'<div class="authors">{inline(authors)}</div>'
               f'{title_affil}{title_abs}{title_kw}</div>'
               f'<div class="smeta"><span class="jnameRaw">{html.escape(journal)}</span>'
               f'<span class="jtypeRaw">{html.escape(atype)}</span>'
               f'<span class="jfootRaw">{html.escape(foot)}</span></div>')
        return block+'<div class="cols">'

    def emit(frag):
        nonlocal body_frag
        body_frag.append(frag)

    state={'in_toc':False,'last_h1_at':-9}
    while i<n:
        ln=lines[i]
        # special title-block / endmatter blocks
        msp=re.match(r'^:::\s*(affiliations|abstract|keywords|endmatter|references)\s*$', ln)
        if msp:
            kind=msp.group(1); j=i+1; bl=[]
            while j<n and lines[j].strip()!=':::': bl.append(lines[j]); j+=1
            if kind=='affiliations':
                title_affil=f'<div class="affil">{inline(" ".join(x.strip() for x in bl if x.strip()))}</div>'
            elif kind=='abstract':
                title_abs=f'<div class="abstract">{inline(" ".join(x.strip() for x in bl if x.strip()))}</div>'
            elif kind=='keywords':
                title_kw=f'<div class="kwline"><span class="lab">Keywords </span>{inline(" ".join(x.strip() for x in bl if x.strip()))}</div>'
            elif kind=='endmatter':
                if not body_started: emit(open_body())
                endmatter_html[0]+=f'<div class="endmatter">{render_endmatter(bl)}</div>'
            i=j+1; continue
        # box / aside directive
        md=re.match(r'^:::\s*(\w+)(\*?)\s*(.*)$', ln)
        if md:
            if not body_started: emit(open_body())
            kind=md.group(1).lower(); bspan=md.group(2)=='*'; rest=md.group(3).strip()
            j=i+1; bl=[]
            while j<n and lines[j].strip()!=':::': bl.append(lines[j]); j+=1
            if kind in ('note','aside') and not rest:
                emit(f'<p class="aside">{render_blocks(bl).replace("<p>","").replace("</p>"," ")}</p>')
            else:
                num=''; mnum=re.match(r'^([\w.]*\d[\w.]*)\s+(.*)$', rest)
                if mnum: num=mnum.group(1); ttl=mnum.group(2).strip()
                else: ttl=rest
                emit(render_box(num, ttl, bl, span=bspan))
            i=j+1; continue
        # table
        cap=None; tspan=False; mcapt=re.match(r'^Table(\*?):\s*(.*)$', ln); look=i
        if mcapt: tspan=mcapt.group(1)=='*'; cap=(mcapt.group(2).strip() or None); look=i+1
        if look<n and lines[look].lstrip().startswith('|'):
            if not body_started: emit(open_body())
            tl=[]; k=look
            while k<n and lines[k].lstrip().startswith('|'): tl.append(lines[k]); k+=1
            note=None
            if k<n and re.match(r'^Note:\s*(.+)$', lines[k]):
                note=re.match(r'^Note:\s*(.+)$', lines[k]).group(1).strip(); k+=1
            if tspan:   # a spanning table leaves the column flow entirely: full width, may break across pages, header repeats
                emit('</div>'+render_table(tl, cap, note, span=True)+'<div class="cols">')
            else:
                emit(render_table(tl, cap, note, span=False))
            i=k; continue
        # figure
        mf=re.match(r'^!(\*?)\[(.*?)\]\((.*?)\)(?:\{(.*?)\})?\s*$', ln)
        if mf:
            if not body_started: emit(open_body())
            emit(render_figure(mf.group(2),mf.group(3),mf.group(4),span=mf.group(1)=='*')); i+=1; continue
        # headings
        mh=re.match(r'^(#{1,4})\s+(.+)$', ln)
        if mh:
            if not body_started: emit(open_body())
            lvl=len(mh.group(1)); t=mh.group(2).strip()
            if re.match(r'^(contents|table of contents)$', t, re.I) and lvl<=2:
                if state.get('in_toc'): i+=1; continue
                emit('</div>'); emit('<section class="toc"><h1 class="book toc">Contents</h1><div class="cols toccols">'); state['in_toc']=True; i+=1; continue
            if lvl==1:
                # a second h1 directly after a book head is that book's title line
                if state.get('last_h1_at')==i-2 or state.get('last_h1_at')==i-1:
                    emit(f'<div class="booksub">{inline(t)}</div>'); state['last_h1_at']=i; i+=1; continue
                emit('</div>')
                if state.get('in_toc'): emit('</section>'); state['in_toc']=False
                emit(f'<h1 class="book">{inline(t)}</h1><div class="cols">'); state['last_h1_at']=i; i+=1; continue
            if re.match(r'^(references|bibliography)$', t, re.I):
                in_refs=True; emit(f'<h2 class="refhead">{inline(t)}</h2>'); i+=1; continue
            in_refs=False
            mnum=re.match(r'^(\d+(?:\.\d+)*)\s+(.+)$', t)
            tag=f'h{lvl}'
            if mnum: emit(f'<{tag}><span class="num">{mnum.group(1)}</span>{inline(mnum.group(2))}</{tag}>')
            else:    emit(f'<{tag}>{inline(t)}</{tag}>')
            i+=1; continue
        # numbered list inside references context -> ol.refs
        if in_refs and re.match(r'^\s*\d+\.\s+', ln):
            if not body_started: emit(open_body())
            items=[]
            while i<n and re.match(r'^\s*\d+\.\s+', lines[i]):
                items.append(inline(re.sub(r'^\s*\d+\.\s+','',lines[i]).rstrip())); i+=1
            emit('<ol class="refs">'+''.join(f'<li>{x}</li>' for x in items)+'</ol>'); continue
        # ordinary block
        if not ln.strip(): i+=1; continue
        if not body_started: emit(open_body())
        buf=[ln]; i+=1
        while i<n and lines[i].strip() and not lines[i].startswith(':::') and not re.match(r'^#', lines[i]) \
              and not lines[i].lstrip().startswith('|') and not re.match(r'^(Table\*?:|Note:|!\*?\[)', lines[i]):
            buf.append(lines[i]); i+=1
        frag=render_blocks(buf)
        if not lead_done and '<p>' in frag:
            frag=frag.replace('<p>','<p class="lead">',1); lead_done=True
        emit(frag)

    if not body_started: emit(open_body())
    body_html=''.join(body_frag)+'</div>'+('</section>' if state.get('in_toc') else '')+endmatter_html[0]
    for leak in re.findall(r'\{\.[^\n<]{0,60}', body_html):   # run-in delimiter leak guard
        sys.stderr.write(f'[runin] unparsed run-in directive leaked into the body: {leak!r}\n')  # close .cols, then full-width end matter
    links=''.join(f'<link rel="stylesheet" href="{html.escape(c)}">' for c in cssfiles)
    return (f'<!DOCTYPE html><html><head><meta charset="utf-8"><title>{html.escape(title)}</title>'
            f'{links}</head><body class="{acccls}">{body_html}</body></html>')

def main():
    if len(sys.argv)<2: print("usage: build_journal.py source.md [out.pdf]"); sys.exit(1)
    src=pathlib.Path(sys.argv[1]).resolve(); text=src.read_text(encoding='utf-8')
    fm, body = parse_front(text); srcdir=src.parent
    css=[]
    if (srcdir/'face.css').exists(): css.append('face.css')
    css.append('journal.css')
    doc=build_html(fm, body, css)
    (srcdir/'_journal.html').write_text(doc, encoding='utf-8')
    out_pdf=pathlib.Path(sys.argv[2]) if len(sys.argv)>2 else srcdir/'journal.pdf'
    from weasyprint import HTML
    HTML(string=doc, base_url=str(srcdir)).write_pdf(str(out_pdf))
    print("PDF:", out_pdf)

if __name__=='__main__': main()