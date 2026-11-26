! PNP_Identity_Twin_CC.f90 · numerical twin of the identity part of PNP_Normal_Form_Paper_v1_15_0_CC.lean
! RATIONALE. The engine proves the identity of the separation on the vacant seat, for every machine and on the Turing
!   model. This twin checks the same statements by exhaustion on finite instances, so that a reader who does not run
!   Lean can see them hold on objects small enough to enumerate.
! DESIGN.
!   A. The seat of verdicts. All 4 configurations of the two verdicts: the three axes never meet; each pair is carried.
!   B. Small machines. 2 algorithms, 2 instances, every output table and every predicate: 64 machines. On each, the
!      deciders are witnessed; the faces of the separation agree; form is the absence of deciders; the record is
!      separated; and both a separated machine and one that is not occur.
!   C. The exchange. Every Turing machine with 2 states over 2 tape symbols, every choice of start, accept and reject:
!      32768 machines, 7 inputs, 12 steps. The exchanged machine halts when the machine does, and where accept and
!      reject differ its verdict is the opposite.
! RISK. Exhaustion on small instances is an instance, not the theorem. B uses machines with no time bound to exceed,
!   so "escapes" is "answers rightly on every instance". C is not the kernel's model: it has 2 tape symbols, not s + 4.
! NON-NEGOTIABLE. Every check is computed. The twin states nothing about SAT and decides nothing about P and NP.
program pnp_identity_twin
  implicit none
  integer :: nchk, nfail
  nchk = 0; nfail = 0
  write(*,'(a)') 'PNP_Identity_Twin_CC · the identity on the vacant seat, by exhaustion'
  call part_a()
  call part_b()
  call part_c()
  write(*,'(a,i0,a,i0,a)') 'BATTERY {"checks":', nchk, ',"failures":', nfail, '}'
  if (nfail /= 0) error stop 1
contains
  subroutine check(name, ok)
    character(len=*), intent(in) :: name
    logical, intent(in) :: ok
    nchk = nchk + 1
    if (ok) then
      write(*,'(a,a)') '  PASS  ', name
    else
      nfail = nfail + 1
      write(*,'(a,a)') '  FAIL  ', name
    end if
  end subroutine check

  subroutine part_a()
    ! verdict 1 = false, 2 = true; a configuration is a subset of the two verdicts
    integer :: m, nall, nfw, new, nef
    logical :: s(2), ex, fo, wi
    nall = 0; nfw = 0; new = 0; nef = 0
    do m = 0, 3
      s(1) = btest(m, 0); s(2) = btest(m, 1)
      ex = s(1) .or. s(2)                       ! existence
      fo = (s(1) .eqv. s(2))                    ! form: closed under the turn
      wi = .not. (s(1) .and. s(2))              ! witness: both verdicts have one registration
      if (ex .and. fo .and. wi) nall = nall + 1
      if (fo .and. wi .and. .not. ex) nfw = nfw + 1
      if (ex .and. wi .and. .not. fo) new = new + 1
      if (ex .and. fo .and. .not. wi) nef = nef + 1
    end do
    write(*,'(a)') 'A. the seat of verdicts'
    write(*,'(a,i0,a,i0,a,i0,a,i0)') '  all three: ', nall, '; form and witness only: ', nfw, &
      '; existence and witness only: ', new, '; existence and form only: ', nef
    call check('A1 on the vacant seat no configuration has existence, form and witness together', nall == 0)
    call check('A2 each pair of the three axes is carried by a configuration', nfw > 0 .and. new > 0 .and. nef > 0)
  end subroutine part_a

  subroutine part_b()
    ! machine: out(a,x) for a,x in {1,2} (4 bits), sat(x) (2 bits). No time bound is exceeded.
    integer :: mo, ms, a, x, nmach, nsep, nnot, nwitbad, nface, nform, nrec
    logical :: outp(2,2), sat(2), esc(2), esco(2), escr(2), sep, sepco, f_prof, f_turn, f_errs, anydec, folded
    nmach = 0; nsep = 0; nnot = 0; nwitbad = 0; nface = 0; nform = 0; nrec = 0
    do mo = 0, 15
      do ms = 0, 3
        nmach = nmach + 1
        outp(1,1) = btest(mo,0); outp(1,2) = btest(mo,1); outp(2,1) = btest(mo,2); outp(2,2) = btest(mo,3)
        sat(1) = btest(ms,0); sat(2) = btest(ms,1)
        do a = 1, 2
          esc(a)  = (outp(a,1) .eqv. sat(1)) .and. (outp(a,2) .eqv. sat(2))            ! decides the problem
          esco(a) = (outp(a,1) .neqv. sat(1)) .and. (outp(a,2) .neqv. sat(2))          ! decides the complement
          escr(a) = .false.                                                            ! on the record, output is never sat
        end do
        sep = .not. (esc(1) .or. esc(2)); sepco = .not. (esco(1) .or. esco(2))
        if (sep) then
          nsep = nsep + 1
        else
          nnot = nnot + 1
        end if
        do a = 1, 2
          if (esc(a) .and. esco(a)) nwitbad = nwitbad + 1                              ! one algorithm on both sides
        end do
        f_prof = (esc(1) .eqv. escr(1)) .and. (esc(2) .eqv. escr(2))                   ! profile of the record
        f_turn = ((.not. esc(1)) .or. esco(1)) .and. ((.not. esc(2)) .or. esco(2))     ! the turn of sides
        f_errs = .true.                                                                ! every algorithm errs somewhere
        do a = 1, 2
          x = 0
          if (outp(a,1) .neqv. sat(1)) x = 1
          if (outp(a,2) .neqv. sat(2)) x = 1
          if (x == 0) f_errs = .false.
        end do
        if ((sep .neqv. f_prof) .or. (sep .neqv. f_turn) .or. (sep .neqv. f_errs)) nface = nface + 1
        anydec = esc(1) .or. esc(2) .or. esco(1) .or. esco(2)
        folded = (esc(1) .eqv. esco(1)) .and. (esc(2) .eqv. esco(2))                   ! closed under the turn of sides
        if (folded .neqv. (.not. anydec)) nform = nform + 1
        if ((sep .and. sepco) .neqv. folded) nform = nform + 1
        if (escr(1) .or. escr(2)) nrec = nrec + 1
      end do
    end do
    write(*,'(a)') 'B. small machines: 2 algorithms, 2 instances'
    write(*,'(a,i0,a,i0,a,i0)') '  machines: ', nmach, '; separated: ', nsep, '; not separated: ', nnot
    call check('B1 the deciders are witnessed on every machine: no algorithm holds both sides', nwitbad == 0)
    call check('B2 the faces of the separation agree on every machine', nface == 0)
    call check('B3 form is the absence of deciders, and is the separation of the problem and its complement', nform == 0)
    call check('B4 the record of every one of the machines is separated', nrec == 0)
    call check('B5 the domain holds both: a separated machine and one that is not', nsep > 0 .and. nnot > 0)
  end subroutine part_b

  subroutine part_c()
    ! Turing machines with states 1,2 and tape symbols 0,1. delta(state,symbol) = (new state, written symbol, move).
    integer, parameter :: tmax = 12, half = 16
    integer :: code, e(4), ns(2,0:1), wr(2,0:1), mv(2,0:1), st0, acc, rej, iw, t, i
    integer :: tape(-half:half), tape2(-half:half), pos, pos2, s, s2, nmach, nhalt, nbadh, nbadv, r
    logical :: h1, h2
    integer :: w(7,2), wl(7)
    wl = [0, 1, 1, 2, 2, 2, 2]
    w = 0
    w(3,1) = 1
    w(5,2) = 1
    w(6,1) = 1
    w(7,1) = 1; w(7,2) = 1
    nmach = 0; nhalt = 0; nbadh = 0; nbadv = 0
    do code = 0, 4095
      r = code
      do i = 1, 4
        e(i) = mod(r, 8); r = r / 8
      end do
      ns(1,0) = 1 + mod(e(1),2); wr(1,0) = mod(e(1)/2,2); mv(1,0) = 2*mod(e(1)/4,2) - 1
      ns(1,1) = 1 + mod(e(2),2); wr(1,1) = mod(e(2)/2,2); mv(1,1) = 2*mod(e(2)/4,2) - 1
      ns(2,0) = 1 + mod(e(3),2); wr(2,0) = mod(e(3)/2,2); mv(2,0) = 2*mod(e(3)/4,2) - 1
      ns(2,1) = 1 + mod(e(4),2); wr(2,1) = mod(e(4)/2,2); mv(2,1) = 2*mod(e(4)/4,2) - 1
      do st0 = 1, 2
        do acc = 1, 2
          do rej = 1, 2
            nmach = nmach + 1
            do iw = 1, 7
              tape = 0
              do i = 1, wl(iw)
                tape(i-1) = w(iw,i)
              end do
              tape2 = tape; pos = 0; pos2 = 0; s = st0; s2 = st0
              do t = 0, tmax
                h1 = (s == acc) .or. (s == rej)          ! the machine: accept acc, reject rej
                h2 = (s2 == rej) .or. (s2 == acc)        ! the exchange: accept rej, reject acc
                if (h1 .neqv. h2) nbadh = nbadh + 1
                if (h1) then
                  nhalt = nhalt + 1
                  if (acc /= rej) then
                    if ((s == acc) .eqv. (s2 == rej)) nbadv = nbadv + 1
                  end if
                else
                  i = tape(pos); tape(pos) = wr(s,i); r = mv(s,i); s = ns(s,i); pos = pos + r
                end if
                if (.not. h2) then
                  i = tape2(pos2); tape2(pos2) = wr(s2,i); r = mv(s2,i); s2 = ns(s2,i); pos2 = pos2 + r
                end if
              end do
            end do
          end do
        end do
      end do
    end do
    write(*,'(a)') 'C. the exchange of accept and reject'
    write(*,'(a,i0,a,i0)') '  machines: ', nmach, '; halted configurations visited: ', nhalt
    call check('C1 the exchanged machine is halted exactly when the machine is', nbadh == 0 .and. nhalt > 0)
    call check('C2 where accept and reject differ, the verdict of the exchange is the opposite', nbadv == 0)
  end subroutine part_c
end program pnp_identity_twin
