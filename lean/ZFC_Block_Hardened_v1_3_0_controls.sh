#!/usr/bin/env bash
# ZFC_Block_Hardened_v1_3_0_controls.sh · hostile builds for ZFC_Block_Hardened_v1_3_0.lean
# Each control plants one break in a copy of the kernel and must be REFUSED by Lean 4.19.0.
# The pristine file must then build silently (exit 0, no output: every #guard_msgs pin holds).
# Usage: bash ZFC_Block_Hardened_v1_3_0_controls.sh [path/to/ZFC_Block_Hardened_v1_3_0.lean]
set -u
SRC="${1:-ZFC_Block_Hardened_v1_3_0.lean}"
LEAN="${LEAN:-lean}"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT
pass=0; fail=0

control() {   # control <id> <description> <command applied to $WORK/c.lean>
  local id="$1" desc="$2"; shift 2
  cp "$SRC" "$WORK/c.lean"
  "$@" "$WORK/c.lean"
  if cmp -s "$SRC" "$WORK/c.lean"; then echo "[$id] PLANT DID NOT APPLY · $desc"; fail=$((fail+1)); return; fi
  if "$LEAN" "$WORK/c.lean" > "$WORK/out.txt" 2>&1; then
    echo "[$id] ACCEPTED (control failed) · $desc"; fail=$((fail+1))
  else
    echo "[$id] REFUSED · $desc · $(grep -m1 'error' "$WORK/out.txt" | cut -c1-110)"; pass=$((pass+1))
  fi
}

sub()    { local pat="$1" rep="$2" f="$3"; python3 - "$pat" "$rep" "$f" <<'PY'
import sys
pat, rep, path = sys.argv[1], sys.argv[2], sys.argv[3]
s = open(path, encoding='utf-8').read()
if pat in s: s = s.replace(pat, rep, 1)
open(path, 'w', encoding='utf-8').write(s)
PY
}
append() { printf '\n%s\n' "$1" >> "$2"; }

c1()  { sub 'abbrev W2 : World := fun z => z = ⟨0, 14⟩ ∨ z = ⟨2, 14⟩' 'abbrev W2 : World := fun z => z = ⟨0, 15⟩ ∨ z = ⟨2, 15⟩' "$1"; }
c2()  { sub 'abbrev W2 : World := fun z => z = ⟨0, 14⟩ ∨ z = ⟨2, 14⟩' 'abbrev W2 : World := fun z => z = ⟨1, 14⟩ ∨ z = ⟨1, 14⟩' "$1"; }
c3()  { sub 'fun A _ => Nat.beq A 0, fun _ _ => 0, fun _ => true⟩' 'fun A _ => Nat.beq A 0, fun _ _ => 0, fun _ => false⟩' "$1"; }
c4()  { sub $'  step    := fun s => s\n  round   := true\n  rescale := fun s => s' $'  step    := fun s => s\n  round   := true\n  rescale := fun _ => true' "$1"; }
c5()  { sub $'  step    := fun s => s\n  round   := true' $'  step    := fun _ => true\n  round   := true' "$1"; }
c6()  { append 'def plantedSolitonWitness : ZFCBlockHardened.PC.Witness ZFCBlockHardened.PC.soliton :=
  ⟨fun s => cond s 0 1, fun s hs => match s, hs with | true, h => absurd rfl h | false, _ => Nat.zero_lt_one,
   fun _ => rfl⟩' "$1"; }
c7()  { append 'example : (ZFCBlockHardened.semLadder ZFCBlockHardened.RH.row Bool
    (fun b => cond b ZFCBlockHardened.RH.W1 ZFCBlockHardened.RH.W2)).Prov ZFCBlockHardened.RH.row.Value :=
  fun _ => ZFCBlockHardened.RH.W1_rh' "$1"; }
c8()  { sub '(R : OnRow.{u, v, w} r T N) (complete : ¬ T.Prov N.V → ∃ m, ¬ R.Holds m N.V) :' '(R : OnRow.{u, v, w} r T N) :' "$1"; }
c9()  { append 'example : ¬ (ZFCBlockHardened.semLadder ZFCBlockHardened.PC.row Unit
    (fun _ => ZFCBlockHardened.PC.roundWorld)).Prov ZFCBlockHardened.PC.row.Value :=
  fun h => ZFCBlockHardened.PC.stuck_does_not_rest (h ())' "$1"; }
c10() { sub '  ⟨T.mp _ _ N.vb, T.mp _ _ N.bv⟩' '  ⟨fun p => Classical.byContradiction (fun n => n (T.mp _ _ N.vb p)), T.mp _ _ N.bv⟩' "$1"; }

c11() { append 'example : ¬ ZFCBlockHardened.Bit ZFCBlockHardened.RH.row ZFCBlockHardened.RH.W1 :=
  fun h => ZFCBlockHardened.RH.W2_not_rh (h (ZFCBlockHardened.RH.record_on_line _))' "$1"; }

c12() { sub '  | .foundationAsSystem => .open' '  | .foundationAsSystem => .blocked' "$1"; }
c13() { sub '  | .independence       => .blocked' '  | .independence       => .open' "$1"; }
c14() { sub '       false r.value_t⟩⟩' '       true r.value_t⟩⟩' "$1"; }

c15() { append 'example : ZFCBlockHardened.ActAt ZFCBlockHardened.RH.row ZFCBlockHardened.RH.W2 :=
  ⟨ZFCBlockHardened.RH.W2_closed, fun h => h⟩' "$1"; }
c16() { sub '  ⟨R.adm m, fun _ => (R.reads m).mp (R.sound N.V m p)⟩' '  ⟨R.adm m, fun _ => Classical.byContradiction (fun n => n ((R.reads m).mp (R.sound N.V m p)))⟩' "$1"; }
c17() { append 'example : ZFCBlockHardened.ActAt ZFCBlockHardened.PC.row ZFCBlockHardened.PC.stuckWorld :=
  ⟨trivial, fun _ => ZFCBlockHardened.PC.witness_gives_the_act ZFCBlockHardened.PC.stuckWorld ZFCBlockHardened.PC.roundWitness⟩' "$1"; }
c18() { append 'example : ∀ x, ZFCBlockHardened.RH.row.Adm x → ZFCBlockHardened.ActAt ZFCBlockHardened.RH.row x :=
  fun x hx => ⟨hx, fun _ => ZFCBlockHardened.RH.record_on_line x⟩' "$1"; }

control C1  "Riemann twin moved to height 15: the two worlds no longer share a record" c1
control C2  "Riemann twin put on the line: the twin no longer defies"                  c2
control C3  "P vs NP twin answers false: the two machines no longer share a record"     c3
control C4  "Poincare stuck twin given another rescaling: the record differs"           c4
control C5  "Poincare stuck twin made to rest: the fake sphere no longer defies"        c5
control C6  "a Perelman witness claimed on the self-similar flow"                       c6
control C7  "the ladder with a defiant model claimed to prove the Riemann value"        c7
control C8  "Goedel completeness deleted from the exact block"                          c8
control C9  "the unrestricted block claimed: the round-world ladder declared blocked"   c9
control C10 "a cone drifted: no_escape rerouted through Classical.choice"               c10
control C11 "a blocked ladder read as denying the bit at the compliant world"         c11
control C12 "the foundation route printed blocked, as the record's ledger allows"      c12
control C13 "independence printed open: an irrefutable value claimed false"          c13
control C14 "the open route's blocked ladder handed its compliant model as defiant"   c14
control C15 "the record passed off as the act at the Riemann twin"                   c15
control C16 "a cone drifted: one_door rerouted through Classical.choice"            c16
control C17 "Perelman's witness claimed on the stuck world"                         c17
control C18 "the record's line passed off as the act on every world"                c18

if out="$("$LEAN" "$SRC" 2>&1)" && [ -z "$out" ]; then
  echo "[PRISTINE] silent build, every pin holds"
else
  echo "[PRISTINE] FAILED"; echo "$out" | head -5; fail=$((fail+1))
fi
echo "controls refused: $pass of 18 · failures: $fail"
[ "$fail" -eq 0 ]
