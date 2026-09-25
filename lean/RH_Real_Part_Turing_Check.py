# Real part executed to height T, three independent counts, in floating point:
#   (a) zeros ON the line, as sign changes of Hardy's Z(t) on a fine grid;
#   (b) all zeros in the strip with 0 < Im < T, N(T), by mpmath's counting function nzeros(T),
#       computed independently of the grid; the earlier form theta(T)/pi + 1 + arg zeta(1/2 + iT)/pi
#       with a principal-branch endpoint argument is not the counting function S(T) and is not used;
#   (c) the ordinates of the first zeros themselves, from mpmath.zetazero, counted below T.
# Agreement of (a), (b), (c) at T means every zero up to T is on the line, in 30-digit floating
# point without interval arithmetic: testimony, not a certificate. The certificate of record for
# zeta to 3 x 10^12 is Platt and Trudgian (2021), cited in the paper, not this script.
import mpmath as mp
mp.mp.dps = 30
T = mp.mpf(100)
def Z(t): return mp.siegelz(t)
grid = [mp.mpf(k)/20 for k in range(1, int(T*20)+1)]
on_line, prev = 0, Z(grid[0])
for t in grid[1:]:
    z = Z(t)
    if z == 0 or mp.sign(z) != mp.sign(prev): on_line += 1
    prev = z
N = int(mp.nzeros(T))
ords = []
k = 1
while True:
    g = mp.zetazero(k).imag
    if g > T: break
    ords.append(g); k += 1
print("T =", T)
print("(a) zeros ON the line, sign changes of Z on a 1/20 grid :", on_line)
print("(b) N(T), all zeros in the strip, mpmath nzeros          :", N)
print("(c) ordinates of zeros below T, enumerated               :", len(ords),
      " first", mp.nstr(ords[0], 8), " last", mp.nstr(ords[-1], 8), " next", mp.nstr(mp.zetazero(k).imag, 8))
ok = (on_line == N == len(ords))
print("Real part at T =", int(T), ":", "HOLDS (three counts equal)" if ok else "count mismatch")
