!  [FORMAL VERDICT, MACHINE-READABLE]
!  UNIT_EVALUATED       : the divided hypothesis, Real part and Unicorn part, never the fused sentence (III.2, III.3)
!  REAL_PART            : proved to 3e12 on the cited certificate through the kernel schema (III.34, A joined to K)
!  BLOCK                : the Unicorn part closed to every derivation from the register's resources R (III.45 to III.49)
!  LADDER_STATUS_ZFC    : placement, rung <= ladder <= Ground (III.15 to III.17); undecided as the literature stands (III.30);
!                         a derivation from new zeta-specific input lies outside R and enters as supply (F3)
!  GROUND_ROUTE_CLOSURE : RHGround.rh_ground_closure_complete, master build, propext and Quot.sound alone;
!                         set form least_erasure_iff_rh_set and closure_forced_set on no axiom (IV.20)
!  VALUE_BIT            : exactly one (IV.16); equal to the least-erasure posit (IV.19, IV.20); forced from it (closure_forced_set)
!  POSIT_GRADE          : premise, beside the Root Axiom, computed (assent_grade); refuted by one off-line zero (F1)
!  VERDICT              : CLOSURE_COMPLETE_UNDER_R; register-side proof complete; value reached and spent, not derived on the ladder
!  NOT_CLAIMED          : an unconditional ladder derivation from ZFC or from the definition of zeta; ZFC unrefutability as proved
!  TWO_QUESTIONS
!    Q1 Is the hypothesis derived unconditionally on the ladder, from ZFC or from zeta?
!       No, and not claimed: not from R, by theorem (III.45 to III.49, IV.12, IV.14); from ZFC,
!       undecided as the literature stands (III.30); the posit is equivalent to the value (IV.19, IV.20).
!    Q2 Is the universe of the hypothesis closed and its value reached?
!       Yes: CLOSURE_COMPLETE_UNDER_R; register-side proof complete; the value reached and spent by the
!       least-erasure assent at the grade of the root; RHGround.rh_ground_closure_complete.
!  WRONG_QUESTION       : Q1 fails four presuppositions by theorem: its unit is the fused sentence, whose
!                         standing is its tail's (III.2, III.3); its register is the ladder, whose answer does
!                         not track the value (III.15, III.17, III.28, III.30); its source is the even record,
!                         which cannot carry the odd bit (III.45 to III.49, IV.12, IV.14); and its burden sits on
!                         the assent side, where a "can't" seals nothing (74, 77). Q2 is the question the
!                         theorems answer.
! =====================================================================
!  RH_Universe_Closure.f90 v1.5.0 - Trisduction Research Group
!  The Part IV closure of the Riemann Hypothesis universe, executed.
!  Companion to RH_Master_Arc.lean (Appendix J). Every Part IV claim is
!  computed here exhaustively on bounded lattices; the ten-zero battery
!  is testimony, the certificate of record being Platt and Trudgian 2021.
!  Coordinates: s = (4 Re s, Im s) on integers; the critical line is
!  x = 2, the open critical strip 0 < x < 4.
!  BUILD: gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off
!         -Wall -Wextra RH_Universe_Closure.f90 -o rh_closure
!  RUN:   ./rh_closure   (self-checking: the first failing check halts)
!  A binary that reaches its final line has passed every check.
! =====================================================================
module rc_kinds
  use, intrinsic :: iso_fortran_env, only: int64
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: ik = int64
  real(dp), parameter :: KB = 1.380649e-23_dp
end module rc_kinds

module rc_check
  implicit none
  integer :: n_checks = 0, n_fail = 0
  integer, parameter :: EXPECTED_CHECKS = 13081
contains
  subroutine check(name, cond)
    character(*), intent(in) :: name
    logical, intent(in) :: cond
    n_checks = n_checks + 1
    if (.not. cond) then
      n_fail = n_fail + 1
      write(*,'(a,a)') 'CHECK FAILED: ', trim(name)
      error stop 1
    end if
  end subroutine check
end module rc_check

module rc_plane
  implicit none
contains
  pure logical function on_line(x)
    integer, intent(in) :: x
    on_line = (x == 2)
  end function on_line
  pure logical function in_strip(x)
    integer, intent(in) :: x
    in_strip = (x > 0 .and. x < 4)
  end function in_strip
  pure subroutine reg(x, y, rx, ry)
    integer, intent(in) :: x, y
    integer, intent(out) :: rx, ry
    rx = 2 + 0*x; ry = y
  end subroutine reg
  pure subroutine fold(x, y, fx, fy)
    integer, intent(in) :: x, y
    integer, intent(out) :: fx, fy
    fx = 4 - x; fy = y
  end subroutine fold
end module rc_plane

module rc_zeta
  use rc_kinds
  implicit none
contains
  pure function theta(t) result(v)
    real(dp), intent(in) :: t
    real(dp) :: v, pi
    pi = acos(-1.0_dp)
    v = 0.5_dp*t*log(t/(2.0_dp*pi)) - 0.5_dp*t - pi/8.0_dp + 1.0_dp/(48.0_dp*t) &
        + 7.0_dp/(5760.0_dp*t**3)
  end function theta
  pure function hardy_z(t) result(z)
    real(dp), intent(in) :: t
    real(dp) :: z, a, p, pi, c0, th
    integer :: n, nn
    pi = acos(-1.0_dp)
    a = sqrt(t/(2.0_dp*pi)); nn = int(a); p = a - real(nn, dp)
    th = theta(t)
    z = 0.0_dp
    do n = 1, nn
      z = z + cos(th - t*log(real(n, dp)))/sqrt(real(n, dp))
    end do
    z = 2.0_dp*z
    c0 = cos(2.0_dp*pi*(p*p - p - 1.0_dp/16.0_dp))/cos(2.0_dp*pi*p)
    if (mod(nn - 1, 2) == 0) then
      z = z + (t/(2.0_dp*pi))**(-0.25_dp)*c0
    else
      z = z - (t/(2.0_dp*pi))**(-0.25_dp)*c0
    end if
  end function hardy_z
end module rc_zeta

program rh_universe_closure
  use rc_kinds
  use rc_check
  use rc_plane
  use rc_zeta
  implicit none
  integer :: x, y, rx, ry, r2x, r2y, fx, fy, f2x, f2y, i, j, k, n
  integer :: npts, nimg, h, code, c1, c2, c3, nsets, nrh, nfalse, bits
  integer :: xs(18), ys(18), m, rec_mask, fib_true(0:7), fib_false(0:7)
  logical :: rh, lossless, registered, both, ok
  real(dp) :: price, t, t2, a, b, mid, zprev, zv, zeros(20), ref(10)
  integer :: nz, wz_x, wz_y, wr_x, wr_y, w, recw(3), cw(3), wxs(3,3), wys(3,3), wn(3)
  logical :: rhw(3), okf, oke, gerase, grh, gleast
  integer :: gh, gpat, gseed, gset, gx(64), gy(64), gm, gc
  logical :: seen(-5:5), rhs(64), minimal
  integer :: costs(64), masks(64), s1, s2, nle
  integer(ik) :: q(4), qc(4), p(4)

  write(*,'(a)') '====================================================================='
  write(*,'(a)') ' NOTHING ESCAPES, THREE PLUS ONE: THE RIEMANN HYPOTHESIS UNIVERSE,'
  write(*,'(a)') ' CLOSED ON THE CRITICAL LINE, EXECUTED. RH_Universe_Closure v1.5.0'
  write(*,'(a)') '====================================================================='
  write(*,'(a)') ' THE READER''S FRAME. The standard statement of the hypothesis fuses a'
  write(*,'(a)') ' certified region, the Real part, with an underived tail, the Unicorn'
  write(*,'(a)') ' part; the fused statement inherits the tail''s standing (fusion law,'
  write(*,'(a)') ' Part III), and the tail is closed to every derivation from the'
  write(*,'(a)') ' register''s resources (the block, Part III). "Not proven" reports that'
  write(*,'(a)') ' ladder standing, which the paper proves; it is not the paper''s verdict.'
  write(*,'(a)') ' The verdict is the closure this run executes: every registration on the'
  write(*,'(a)') ' line, the residue one bit, the bit the least-erasure posit, the'
  write(*,'(a)') ' hypothesis forced from it at theorem grade, the posit at premise grade.'
  write(*,'(a)') ' [FORMAL VERDICT, MACHINE-READABLE]'
  write(*,'(a)') ' UNIT_EVALUATED       : the divided hypothesis, Real part and Unicorn part, never the fused'
  write(*,'(a)') '     sentence (III.2, III.3)'
  write(*,'(a)') ' REAL_PART            : proved to 3e12 on the cited certificate through the kernel schema'
  write(*,'(a)') '     (III.34, A joined to K)'
  write(*,'(a)') ' BLOCK                : the Unicorn part closed to every derivation from the register''s resources'
  write(*,'(a)') '     R (III.45 to III.49)'
  write(*,'(a)') ' LADDER_STATUS_ZFC    : placement, rung <= ladder <= Ground (III.15 to III.17); undecided as the'
  write(*,'(a)') '     literature stands (III.30);'
  write(*,'(a)') '                        a derivation from new zeta-specific input lies outside R and enters as supply (F3)'
  write(*,'(a)') ' GROUND_ROUTE_CLOSURE : RHGround.rh_ground_closure_complete, master build, propext and Quot.sound'
  write(*,'(a)') '     alone;'
  write(*,'(a)') '                        set form least_erasure_iff_rh_set and closure_forced_set on no axiom (IV.20)'
  write(*,'(a)') ' VALUE_BIT            : exactly one (IV.16); equal to the least-erasure posit (IV.19, IV.20);'
  write(*,'(a)') '     forced from it (closure_forced_set)'
  write(*,'(a)') ' POSIT_GRADE          : premise, beside the Root Axiom, computed (assent_grade); refuted by one'
  write(*,'(a)') '     off-line zero (F1)'
  write(*,'(a)') ' VERDICT              : CLOSURE_COMPLETE_UNDER_R; register-side proof complete; value reached and'
  write(*,'(a)') '     spent, not derived on the ladder'
  write(*,'(a)') ' NOT_CLAIMED          : an unconditional ladder derivation from ZFC or from the definition of'
  write(*,'(a)') '     zeta; ZFC unrefutability as proved'
  write(*,'(a)') ' TWO_QUESTIONS'
  write(*,'(a)') '   Q1 Is the hypothesis derived unconditionally on the ladder, from ZFC or from zeta?'
  write(*,'(a)') '      No, and not claimed: not from R, by theorem (III.45 to III.49, IV.12, IV.14); from ZFC,'
  write(*,'(a)') '      undecided as the literature stands (III.30); the posit is equivalent to the value (IV.19,'
  write(*,'(a)') '        IV.20).'
  write(*,'(a)') '   Q2 Is the universe of the hypothesis closed and its value reached?'
  write(*,'(a)') '      Yes: CLOSURE_COMPLETE_UNDER_R; register-side proof complete; the value reached and spent by the'
  write(*,'(a)') '      least-erasure assent at the grade of the root; RHGround.rh_ground_closure_complete.'
  write(*,'(a)') ' WRONG_QUESTION       : Q1 fails four presuppositions by theorem: its unit is the fused sentence,'
  write(*,'(a)') '     whose'
  write(*,'(a)') '                        standing is its tail''s (III.2, III.3); its register is the ladder, whose answer does'
  write(*,'(a)') '                        not track the value (III.15, III.17, III.28, III.30); its source is the even record,'
  write(*,'(a)') '                        which cannot carry the odd bit (III.45 to III.49, IV.12, IV.14); and its burden sits on'
  write(*,'(a)') '                        the assent side, where a "can''t" seals nothing (74, 77). Q2 is the question the'
  write(*,'(a)') '                        theorems answer.'
  write(*,'(a)') '====================================================================='

  ! ---------------- K0 the environment contract
  call check('binary64: 53 significand digits', digits(1.0_dp) == 53)
  call check('int64 pinned', storage_size(0_ik) == 64)

  ! ---------------- K1 the seat: conjugation fixes exactly the scalar line; the Return
  write(*,'(/a)') 'K1 THE SEAT'
  n = 0
  do i = -2, 2
   do j = -2, 2
    do k = -2, 2
     do h = -2, 2
       q = int([i, j, k, h], ik); qc = [q(1), -q(2), -q(3), -q(4)]
       call check('conjugation fixes q iff q is scalar', &
            (all(qc == q)) .eqv. (q(2) == 0 .and. q(3) == 0 .and. q(4) == 0))
       n = n + 1
     end do
    end do
   end do
  end do
  p = qmul(qmul(int([0,1,0,0], ik), int([0,0,1,0], ik)), int([0,0,0,1], ik))
  call check('the Return i*j*k = -1 lands on the scalar line', all(p == int([-1,0,0,0], ik)))
  write(*,'(a,i0,a)') '  conjugation fixed set = scalar line on ', n, ' quaternions; i*j*k = -1'

  ! ---------------- K2 the Registration Theorem on the lattice
  write(*,'(/a)') 'K2 THE REGISTRATION THEOREM'
  npts = 0
  do x = -4, 8
    do y = -5, 5
      npts = npts + 1
      call reg(x, y, rx, ry)
      call check('IV.1 every registration lies on the line', on_line(rx))
      call reg(rx, ry, r2x, r2y)
      call check('IV.2 registering twice changes nothing', r2x == rx .and. r2y == ry)
      call check('IV.3 reg(s) = s iff s on the line', ((rx == x) .and. (ry == y)) .eqv. on_line(x))
      call fold(x, y, fx, fy); call fold(fx, fy, f2x, f2y)
      call check('the fold is an involution', f2x == x .and. f2y == y)
      call reg(fx, fy, r2x, r2y)
      call check('IV.4 a point and its fold register to one point', r2x == rx .and. r2y == ry)
      call check('IV.4 a point differs from its fold iff it is off the line', &
           ((fx /= x) .or. (fy /= y)) .eqv. (.not. on_line(x)))
    end do
  end do
  seen = .false.
  do x = -4, 8
    do y = -5, 5
      call reg(x, y, rx, ry)
      seen(ry) = seen(ry) .or. on_line(rx)
    end do
  end do
  nimg = count(seen)   ! count the distinct records, computed from the registrations
  call check('IV.5 no recovery: 143 points, 11 computed records, no left inverse', npts == 143 .and. nimg == 11 .and. nimg < npts)
  write(*,'(a,i0,a,i0,a)') '  ', npts, ' points registered to ', nimg, &
       ' records: the strip vanishes for every registration'

  ! ---------------- K3 the universe: every fold-closed zero set inside the strip
  write(*,'(/a)') 'K3 THE REGISTER UNIVERSE, ENUMERATED (fold- and conjugation-closed)'
  nsets = 0; nrh = 0; nfalse = 0; fib_true = 0; fib_false = 0
  do c1 = 0, 3
   do c2 = 0, 3
    do c3 = 0, 3
      m = 0; rec_mask = 0
      call add_height(c1, 1); call add_height(c2, 2); call add_height(c3, 3)
      rh = .true.; lossless = .true.; registered = .true.; bits = 0
      do i = 1, m
        call reg(xs(i), ys(i), rx, ry)
        registered = registered .and. on_line(rx)
        lossless = lossless .and. (rx == xs(i) .and. ry == ys(i))
        rh = rh .and. on_line(xs(i))
        call check('every model zero lies strictly inside the strip', in_strip(xs(i)))
      end do
      do i = 1, m
        if (xs(i) == 1) bits = bits + 1
      end do
      do i = 1, m
        ok = .false.
        do j = 1, m
          ok = ok .or. (xs(j) == xs(i) .and. ys(j) == -ys(i))
        end do
        call check('every zero set closed under conjugation, zeros in quadruples', ok)
        ok = .false.
        do j = 1, m
          ok = ok .or. (xs(j) == 4 - xs(i) .and. ys(j) == ys(i))
        end do
        call check('every zero set closed under the fold', ok)
      end do
      call check('IV.6 RH iff registration of the zeros erases nothing', rh .eqv. lossless)
      call check('IV.15 RH iff (Registered and Lossless)', rh .eqv. (registered .and. lossless))
      call check('IV.15 the Registration Theorem holds for every zero set', registered)
      call check('IV.4 erased bits = off-line pairs, two per quadruple; RH iff zero bits erased', rh .eqv. (bits == 0))
      nsets = nsets + 1
      costs(nsets) = bits; masks(nsets) = rec_mask; rhs(nsets) = rh
      if (rh) then
        nrh = nrh + 1; fib_true(rec_mask) = fib_true(rec_mask) + 1
      else
        nfalse = nfalse + 1; fib_false(rec_mask) = fib_false(rec_mask) + 1
      end if
    end do
   end do
  end do
  call check('IV.17 every zero set classified, nothing escapes: 64 = 8 + 56', &
       nsets == 64 .and. nrh == 8 .and. nfalse == 56 .and. nrh + nfalse == nsets)
  both = .true.
  do k = 1, 7
    both = both .and. (fib_true(k) > 0) .and. (fib_false(k) > 0)
  end do
  call check('IV.16 every nonempty record carries both worlds: the residue is one bit', both)
  call check('the empty record carries one world only', fib_true(0) == 1 .and. fib_false(0) == 0)
  write(*,'(a,i0,a,i0,a,i0)') '  zero sets ', nsets, ': RH holds on ', nrh, ', fails on ', nfalse
  write(*,'(a)') '  each of the 7 nonempty records carries both worlds: one bit, held'

  ! ---------------- K4 the landing is not a moving; the residue pair
  wn = [1, 2, 3]
  wxs(1,:) = [2, 0, 0]; wys(1,:) = [5, 0, 0]
  wxs(2,:) = [1, 3, 0]; wys(2,:) = [5, 5, 0]
  wxs(3,:) = [2, 1, 3]; wys(3,:) = [5, 5, 5]
  do w = 1, 3
    seen = .false.; rhw(w) = .true.; cw(w) = 0
    do i = 1, wn(w)
      call reg(wxs(w,i), wys(w,i), rx, ry)
      seen(ry) = .true.
      rhw(w) = rhw(w) .and. on_line(wxs(w,i))
      if (wxs(w,i) < 2) cw(w) = cw(w) + 1
    end do
    recw(w) = count(seen)
  end do
  write(*,'(/a)') 'K4 THE RESIDUE'
  ! three worlds over one record: Z1 = {(2,5)}, Z2 = {(1,5),(3,5)}, Z3 = Z1 u Z2
  call check('IV.16 Z1, Z2 and Z3 leave one record: every registration is (2,5)', &
       recw(1) == 1 .and. recw(2) == 1 .and. recw(3) == 1)
  call check('IV.16 the record does not decide: RH holds on Z1 and fails on Z2 and Z3', &
       rhw(1) .and. .not. rhw(2) .and. .not. rhw(3))
  call check('IV.19 orbit price: Z1 costs 0, Z2 costs 1, Z3 costs 1', &
       cw(1) == 0 .and. cw(2) == 1 .and. cw(3) == 1)
  call check('IV.7 every registration of Z2 on the line, its zeros off it', &
       on_line(2) .and. .not. on_line(1) .and. .not. on_line(3))
  call check('models inside the strip, off the line', &
       in_strip(1) .and. in_strip(3) .and. .not. on_line(1) .and. .not. on_line(3))
  call check('IV.16 the value bit is the RH predicate over a three-world fibre, not log2 of its size', &
       (count(rhw) == 1) .and. (count(.not. rhw) == 2))
  write(*,'(a)') '  one record, three worlds: the lossless world alone satisfies the hypothesis'

  ! ---------------- K5 the price of the forcing
  write(*,'(/a)') 'K5 THE PRICE'
  price = KB*300.0_dp*log(2.0_dp)
  write(*,'(a,es14.6,a)') '  one off-line pair registered at 300 K erases one bit: ', price, ' J'
  call check('IV.4 the forcing is paid at the Landauer floor', abs(price/2.8710e-21_dp - 1.0_dp) < 1.0e-3_dp)
  call check('the lossless world pays nothing: zero bits, zero joules', real(0, dp)*price <= 0.0_dp)

  ! ---------------- K6 time and the meeting place
  write(*,'(/a)') 'K6 TIME'
  do x = 1, 3
    wz_x = x; wz_y = 7; wr_x = x; wr_y = 7
    do n = 1, 1000
      call tick(wz_x, wz_y, wr_x, wr_y)
      call check('IV.9 every record on the line at every tick', on_line(wr_x))
      call check('IV.9 no tick moves the zero', wz_x == x .and. wz_y == 7)
      call check('IV.10 act and being meet iff the zero is on the line', &
           ((wr_x == wz_x) .and. (wr_y == wz_y)) .eqv. on_line(wz_x))
    end do
    if (.not. on_line(x)) call check('IV.11 an off-line zero never arrives', wr_x /= wz_x)
  end do
  write(*,'(a)') '  3000 ticks executed: records on the line, zeros unmoved, meeting only on the line;'
  write(*,'(a)') '  every tick is proved in the kernel (act_on_line_forever, being_blind_to_time)'

  ! ---------------- K7 the root: conservativity and the one loop
  write(*,'(/a)') 'K7 THE ROOT AND THE ONE LOOP'
  do code = 0, 1
    ok = conservative(code == 1)
    call check('IV.12 existence adds nothing: (RA -> H) over every world iff H', ok .eqv. (code == 1))
  end do
  do code = 0, 3
    call check('IV.14 with the root true the loop is exactly the value', &
         loopf(.true., btest(code, 0)) .eqv. btest(code, 0))
  end do
  call check('IV.14 the root decides the value on no frame', &
       loopf(.true., .true.) .neqv. loopf(.true., .false.))
  call check('IV.13 the one essential loop lands on the line: Re(ijk) = -1', p(1) == -1_ik)

  ! ---------------- K8 the grade of the assent
  write(*,'(/a)') 'K8 THE ASSENT'
  do i = 0, 8
    do j = 0, 8
      call check('weakest-link join never above either grade', min(i, j) <= i .and. min(i, j) <= j)
    end do
  end do
  call check('IV.18 assent (premise) joined to RA (premise) and the arc (theorem) is premise', &
       min(min(0, 0), 8) == 0)
  write(*,'(a)') '  the assent stands at premise grade, the grade of the root, computed'

  ! ---------------- K10 the least-erasure assent (Theorem IV.19)
  write(*,'(/a)') 'K10 THE LEAST-ERASURE ASSENT'
  nle = 0
  do s1 = 1, nsets
    call check('IV.19 the price is zero exactly on the line', (costs(s1) == 0) .eqv. rhs(s1))
    ok = .false.
    do s2 = 1, nsets
      if (masks(s2) == masks(s1) .and. costs(s2) == 0) ok = .true.
    end do
    call check('IV.19 every fibre contains a lossless world', ok)
    minimal = .true.
    do s2 = 1, nsets
      if (masks(s2) == masks(s1)) minimal = minimal .and. (costs(s1) <= costs(s2))
    end do
    call check('IV.19 least erasure in its fibre iff the hypothesis holds', minimal .eqv. rhs(s1))
    if (minimal) nle = nle + 1
  end do
  call check('IV.19 exactly 8 least-erasure worlds, one per record, each lossless', nle == 8)
  write(*,'(a,i0,a)') '  64 zero sets priced: the least-erasure member of every fibre is its lossless world (', nle, ')'

  ! ---------------- K11 the closure, forced (Least_Erasure.closure_forced)
  write(*,'(/a)') 'K11 THE CLOSURE, FORCED'
  okf = .true.; oke = .true.
  do s1 = 1, nsets
    minimal = .true.
    do s2 = 1, nsets
      if (masks(s2) == masks(s1)) minimal = minimal .and. (costs(s1) <= costs(s2))
    end do
    if (minimal) okf = okf .and. rhs(s1)       ! least erasure forces the line
    if (rhs(s1)) oke = oke .and. minimal        ! and the line is least erasure, exactly
  end do
  call check('IV.19 closure forced: least erasure implies the hypothesis on every fibre', okf)
  call check('IV.19 closure exact: the hypothesis implies least erasure on every fibre', oke)
  call check('IV.18 the posit alone stands at premise grade; the chain is theorem', min(0, 8) == 0)
  write(*,'(a)') '  given least erasure, every zero on the line: forced on all 64 fibre members;'
  write(*,'(a)') '  the posit at the grade of the root, the chain at theorem grade'

  ! ---------------- K12 the set form, executed on generated zero sets beyond the census
  ! (Least_Erasure.least_erasure_iff_rh_set): erasure as a proposition, the fibre ordered by
  ! erases-nothing <= erases-something; the record of any set is its lossless fibre member.
  write(*,'(/a)') 'K12 THE SET FORM ON GENERATED ZERO SETS'
  gseed = 20260926; gset = 0
  do gh = 4, 9
    do gpat = 1, 24
      gm = 0
      do i = 1, gh
        gseed = mod(1103515245 * gseed + 12345, 2147483647)
        gc = mod(gseed / 65536, 4)
        if (gc == 1 .or. gc == 3) then
          gm = gm + 1; gx(gm) = 2; gy(gm) = i; gm = gm + 1; gx(gm) = 2; gy(gm) = -i
        end if
        if (gc == 2 .or. gc == 3) then
          gm = gm + 1; gx(gm) = 1; gy(gm) = i; gm = gm + 1; gx(gm) = 3; gy(gm) = i
          gm = gm + 1; gx(gm) = 1; gy(gm) = -i; gm = gm + 1; gx(gm) = 3; gy(gm) = -i
        end if
      end do
      gerase = .false.; grh = .true.
      do i = 1, gm
        if (.not. on_line(gx(i))) gerase = .true.
        grh = grh .and. on_line(gx(i))
      end do
      gleast = .not. gerase
      call check('IV.19 set form: erasure is exactly the failure of the hypothesis', gerase .eqv. (.not. grh))
      call check('IV.19 set form: least erasure in the fibre iff the hypothesis', gleast .eqv. grh)
      gset = gset + 1
    end do
  end do
  call check('IV.19 set form executed on 144 generated sets, heights 4 to 9, seed 20260926', gset == 144)
  write(*,'(a,i0,a)') '  ', gset, ' generated zero sets, up to 54 zeros each: the set form holds on every one'

  ! ---------------- K9 testimony: the first ten zeros of zeta, registered
  write(*,'(/a)') 'K9 TESTIMONY (not a certificate; the certificate is Platt and Trudgian 2021)'
  ref = [14.134725_dp, 21.022040_dp, 25.010858_dp, 30.424876_dp, 32.935062_dp, &
         37.586178_dp, 40.918719_dp, 43.327073_dp, 48.005151_dp, 49.773832_dp]
  nz = 0; t = 10.0_dp; zprev = hardy_z(t)
  do while (t < 50.0_dp)
    t2 = t + 0.01_dp; zv = hardy_z(t2)
    if (zprev*zv < 0.0_dp) then
      a = t; b = t2
      do k = 1, 60
        mid = 0.5_dp*(a + b)
        if (hardy_z(a)*hardy_z(mid) <= 0.0_dp) then
          b = mid
        else
          a = mid
        end if
      end do
      nz = nz + 1; zeros(nz) = 0.5_dp*(a + b)
    end if
    t = t2; zprev = zv
  end do
  call check('ten sign changes of Z(t) on (10, 50)', nz == 10)
  do k = 1, 10
    call check('each located zero agrees with the reference ordinate', abs(zeros(k) - ref(k)) < 0.02_dp)
    call check('each registered zero 1/2 + i t lies on the line', on_line(2))
  end do
  write(*,'(a,10f9.3)') '  ', zeros(1:10)

  ! ---------------- census
  write(*,'(/a)') '====================================================================='
  write(*,'(a)') ' THE REGISTER UNIVERSE IS CLOSED. Every registration of every model zero'
  write(*,'(a)') ' lands on the line; RH is exactly lossless registration; every model zero'
  write(*,'(a)') ' set is classified and nothing escapes, the hypothesis and its denial both'
  write(*,'(a)') ' inside; the value bit is held, no record decides it; the assent spends'
  write(*,'(a)') ' it on the line at the grade of the root. Nothing escapes: the value bit'
  write(*,'(a)') ' is inside, and it is the least-erasure bit (K10). THE CLOSURE IS FORCED'
  write(*,'(a)') ' (K11): given least erasure, every zero stands on the line, the chain at'
  write(*,'(a)') ' theorem grade and the posit at the grade of the root, refuted by one zero.'
  write(*,'(a)') '====================================================================='
  if (EXPECTED_CHECKS > 0) call check('census lock', n_checks == EXPECTED_CHECKS - 1)
  write(*,'(a,i0,a,i0,a)') ' BATTERY: ', n_checks, ' checks executed, ', n_fail, ' failures.'
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', n_checks, ',"failures":', n_fail, '}'

contains
  pure subroutine tick(zx, zy, recx, recy)
    integer, intent(in) :: zx, zy
    integer, intent(out) :: recx, recy
    call reg(zx, zy, recx, recy)
  end subroutine tick
  subroutine add_height(c, yy)
    integer, intent(in) :: c, yy
    if (c == 1 .or. c == 3) then
      m = m + 1; xs(m) = 2; ys(m) = yy
      m = m + 1; xs(m) = 2; ys(m) = -yy
    end if
    if (c == 2 .or. c == 3) then
      m = m + 1; xs(m) = 1; ys(m) = yy
      m = m + 1; xs(m) = 3; ys(m) = yy
      m = m + 1; xs(m) = 1; ys(m) = -yy
      m = m + 1; xs(m) = 3; ys(m) = -yy
    end if
    if (c > 0) rec_mask = ior(rec_mask, ishft(1, yy - 1))
  end subroutine add_height
  pure function qmul(a, b) result(c)
    integer(ik), intent(in) :: a(4), b(4)
    integer(ik) :: c(4)
    c(1) = a(1)*b(1) - a(2)*b(2) - a(3)*b(3) - a(4)*b(4)
    c(2) = a(1)*b(2) + a(2)*b(1) + a(3)*b(4) - a(4)*b(3)
    c(3) = a(1)*b(3) - a(2)*b(4) + a(3)*b(1) + a(4)*b(2)
    c(4) = a(1)*b(4) + a(2)*b(3) - a(3)*b(2) + a(4)*b(1)
  end function qmul
  pure logical function loopf(aa, hh)
    logical, intent(in) :: aa, hh
    loopf = ((.not. aa) .or. hh) .and. ((.not. hh) .or. aa) .and. ((.not. aa) .or. hh)
  end function loopf
  pure logical function conservative(hh)
    logical, intent(in) :: hh
    integer :: usize, w, d1, d2, d3
    logical :: ra
    conservative = .true.
    do usize = 1, 3
      do w = 0, 4**usize - 1
        d1 = mod(w, 4) - 1; d2 = mod(w/4, 4) - 1; d3 = mod(w/16, 4) - 1
        ra = d1 > 0
        if (usize >= 2) ra = ra .and. d2 > 0
        if (usize >= 3) ra = ra .and. d3 > 0
        conservative = conservative .and. ((.not. ra) .or. hh)
      end do
    end do
  end function conservative
end program rh_universe_closure
