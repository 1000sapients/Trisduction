# cert.py KEY : read the traced goal of x_KEY.log, reduce LHS-RHS modulo the inverse relations, print a certificate.
# Rationale: Lean's field_simp stalls on these goals; an explicit linear_combination is checked by `ring` alone.
import re,sys,sympy as sp
k=sys.argv[1]; t=open(f'x_{k}.log').read()
g=t[t.index('⊢')+1:]; g=re.split(r'\n/|\n\S+\.lean', g)[0]
g=g.replace('^','**').replace('\n',' ')
names="Att Atr Arr Btt Btr Brr At Ar Bt Br r s c A B a b p q".split()
ns={n:sp.Symbol(n) for n in names}
L,R=g.split('=')
P=sp.expand(sp.sympify(L,locals=ns,rational=True)-sp.sympify(R,locals=ns,rational=True))
G=[ns['r']*ns['a']-1, ns['s']*ns['b']-1, ns['A']*ns['p']-1, ns['B']*ns['q']-1]
gens=[ns[n] for n in "a b p q r s A B c Att Atr Arr Btt Btr Brr At Ar Bt Br".split()]
qs,rem=sp.reduced(P,G,*gens,order='lex')
print('REMAINDER:',rem, file=sys.stderr)
def lean(x):
    o=str(sp.expand(x)).replace('**','^')
    return re.sub(r'(?<![\w.^])(\d+)/(\d+)',r'(\1/\2 : K)',o)
terms=[f"({lean(q)}) * e{i+1}" for i,q in enumerate(qs) if q!=0]
open(f'lc_{k}.txt','w').write("  linear_combination\n    "+"\n    + ".join(terms)+"\n")
print(k,'terms',len(terms),'chars',sum(map(len,terms)), file=sys.stderr)
