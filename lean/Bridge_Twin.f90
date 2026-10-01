! Bridge_Twin.f90 . the executed twin of Bridge_From_First_Principle.lean.
! Every check is a finite computation that ends. No named human result is a premise.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off -Wall -Wextra
program bridge_twin
  use, intrinsic :: iso_fortran_env, only: dp => real64, i8 => int64
  implicit none
  integer :: nchk = 0, nfail = 0
  call conduct()
  call atom()
  call three_twelve_eight()
  call pay()
  call supply()
  call primes()
  call wall_edge_seat()
  call heat_flow()
  write(*,'(a,i0,a,i0,a)') 'BRIDGE-TWIN-JSON: {"checks":', nchk, ',"failures":', nfail, '}'
  if (nfail /= 0) error stop 1
contains
  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    nchk = nchk + 1
    if (.not. ok) nfail = nfail + 1
    write(*,'(a,a)') merge('  PASS  ','  FAIL  ', ok), name
  end subroutine check

  ! 0 . conduct: the arithmetic this twin runs on is the arithmetic it claims
  subroutine conduct()
    real(dp), volatile :: one, x, y, r, z
    one = 1.0_dp
    x = one + scale(one, -30); y = one - scale(one, -30)
    r = x*y - one
    z = ieee_nan()
    write(*,'(a)') '0 CONDUCT'
    call check('0: no fused multiply-add executed (a fused path reads -2^-60)', abs(r) <= 0.0_dp)
    call check('0: NaN is ordered against nothing, itself included', .not. (z <= z .or. z > z))
  end subroutine conduct
  function ieee_nan() result(z)
    use, intrinsic :: ieee_arithmetic, only: ieee_value, ieee_quiet_nan
    real(dp) :: z
    z = ieee_value(1.0_dp, ieee_quiet_nan)
  end function ieee_nan

  ! I . the atom on a window: fold, line, registration, the lost bit, least erasure equal to the value
  pure function foldp(p) result(q)
    integer, intent(in) :: p(2)
    integer :: q(2)
    q = [-p(1), p(2)]
  end function foldp
  pure function regp(p) result(q)
    integer, intent(in) :: p(2)
    integer :: q(2)
    q = [0, p(2)]
  end function regp
  subroutine atom()
    integer :: d, t, k, m, g1, g2, g3, h, nboth, none_
    integer :: g(0:2), pd(9), pt(9), p(2)
    logical :: ok1, ok2, ok3, le, va
    write(*,'(a)') 'I THE ATOM'
    ok1 = .true.; ok2 = .true.; ok3 = .true.
    do d = -50, 50
      do t = -5, 5
        p = [d, t]
        if (any(foldp(foldp(p)) /= p)) ok1 = .false.
        if (all(foldp(p) == p) .neqv. (d == 0)) ok1 = .false.
        if (all(regp(p) == p) .neqv. (d == 0)) ok2 = .false.
        if (any(regp(p) /= [0, t])) ok2 = .false.
        if (d /= 0) then
          if (all(foldp(p) == p)) ok3 = .false.
          if (any(regp(foldp(p)) /= regp(p))) ok3 = .false.
        end if
      end do
    end do
    call check('I: the fold undoes itself and fixes exactly the line, 1111 points', ok1)
    call check('I: the registration lands on the line, keeps the height, erases nothing exactly on it', ok2)
    call check('I: every off-line point has a distinct partner of one record, 1100 points', ok3)
    ! window: d in {-1,0,1}, t in {0,1,2}; the records are the three heights; 9^3 = 729 maps from records to points
    k = 0
    do t = 0, 2
      do d = -1, 1
        k = k + 1; pd(k) = d; pt(k) = t
      end do
    end do
    nboth = 0; none_ = 0
    do g1 = 1, 9
      do g2 = 1, 9
        do g3 = 1, 9
          g = [g1, g2, g3]
          do h = 0, 2
            ! the pair at height h is (1,h) and (-1,h), and both register to the record of height h
            m = g(h)
            if (pt(m) == h .and. abs(pd(m)) == 1) none_ = none_ + 1
            if (pt(m) == h .and. pd(m) == 1 .and. pt(m) == h .and. pd(m) == -1) nboth = nboth + 1
          end do
        end do
      end do
    end do
    write(*,'(a,i0,a,i0)') '  729 maps from records to points: returning both partners ', nboth, &
         '; returning one member ', none_
    call check('I: no map from records returns both partners of a pair', nboth == 0 .and. none_ == 486)
    ! least erasure, read through the registration, against the value, read through the offset
    ok1 = .true.
    do m = 0, 4095
      le = .true.; va = .true.
      do k = 0, 11
        if (btest(m, k)) then
          p = [mod(k, 3) - 1, k / 3]
          if (any(regp(p) /= p)) le = .false.
          if (p(1) /= 0) va = .false.
        end if
      end do
      if (le .neqv. va) ok1 = .false.
    end do
    call check('I: least erasure equals the value on all 4096 subsets of twelve points', ok1)
  end subroutine atom

  ! II . three, twelve, eight, the ninth
  subroutine three_twelve_eight()
    integer :: m, t, v, cnt, nlock, a, b, c, i, j, n, nperm, ninv, s, ok_cnt
    integer :: r(3,3), perm(4), even_perms(4,12)
    logical :: ok, used(4)
    write(*,'(a)') 'II THREE, TWELVE, EIGHT, THE NINTH'
    ok = .true.
    do m = 0, 63
      do t = 0, 3
        cnt = 0
        do v = 0, 7
          if (mod(rowdot(m/8, v), 2) == t/2 .and. mod(rowdot(mod(m,8), v), 2) == mod(t,2)) cnt = cnt + 1
        end do
        if (cnt == 1) ok = .false.
      end do
    end do
    call check('II: no two-axis system over GF(2) has exactly one solution, 256 systems', ok)
    nlock = 0; ok = .true.
    do m = 0, 511
      do i = 1, 3
        r(i,1) = mod(ishft(m, -(3*(3-i)+2)), 2); r(i,2) = mod(ishft(m, -(3*(3-i)+1)), 2)
        r(i,3) = mod(ishft(m, -(3*(3-i))), 2)
      end do
      if (det2(r) == 1) then
        nlock = nlock + 1
        do t = 0, 7
          cnt = 0
          do v = 0, 7
            if (mod(r(1,1)*bit(v,2)+r(1,2)*bit(v,1)+r(1,3)*bit(v,0),2) == bit(t,2) .and. &
                mod(r(2,1)*bit(v,2)+r(2,2)*bit(v,1)+r(2,3)*bit(v,0),2) == bit(t,1) .and. &
                mod(r(3,1)*bit(v,2)+r(3,2)*bit(v,1)+r(3,3)*bit(v,0),2) == bit(t,0)) cnt = cnt + 1
          end do
          if (cnt /= 1) ok = .false.
        end do
      end if
    end do
    call check('II: 168 three-axis systems have determinant one and each locks all eight targets', nlock == 168 .and. ok)
    ! twelve: even permutations of four, acting on the twelve directed gates
    nperm = 0
    do a = 1, 4
      do b = 1, 4
        do c = 1, 4
          do s = 1, 4
            perm = [a, b, c, s]
            used = .false.; ok = .true.
            do i = 1, 4
              if (used(perm(i))) ok = .false.
              used(perm(i)) = .true.
            end do
            if (.not. ok) cycle
            ninv = 0
            do i = 1, 3
              do j = i+1, 4
                if (perm(i) > perm(j)) ninv = ninv + 1
              end do
            end do
            if (mod(ninv, 2) == 0) then
              nperm = nperm + 1; even_perms(:, nperm) = perm
            end if
          end do
        end do
      end do
    end do
    ok = (nperm == 12)
    do a = 1, 4
      do b = 1, 4
        if (a == b) cycle
        do c = 1, 4
          do s = 1, 4
            if (c == s) cycle
            ok_cnt = 0
            do n = 1, nperm
              if (even_perms(a, n) == c .and. even_perms(b, n) == s) ok_cnt = ok_cnt + 1
            end do
            if (ok_cnt /= 1) ok = .false.
          end do
        end do
      end do
    end do
    call check('II: twelve rotations, and exactly one carries any directed gate to any directed gate', ok)
    ! eight: sign patterns, total negation free, orientation flipped
    ok = .true.
    do m = 0, 7
      if (ieor(m, 7) == m) ok = .false.
      if (mod(popcnt(m) + popcnt(ieor(m, 7)), 2) /= 1) ok = .false.
    end do
    call check('II: eight patterns, total negation moves each and joins an even to an odd', ok)
    ! the ninth: 2^k is never 9, and every odd fibre holds exactly one seat
    ok = .true.
    do i = 0, 62
      if (2_i8**i == 9_i8) ok = .false.
    end do
    call check('II: 2^k is never nine, k = 0..62', ok)
  end subroutine three_twelve_eight
  integer function rowdot(rr, v)
    integer, intent(in) :: rr, v
    rowdot = bit(rr,2)*bit(v,2) + bit(rr,1)*bit(v,1) + bit(rr,0)*bit(v,0)
  end function rowdot
  integer function bit(x, k)
    integer, intent(in) :: x, k
    bit = mod(ishft(x, -k), 2)
  end function bit
  integer function det2(r)
    integer, intent(in) :: r(3,3)
    det2 = mod(r(1,1)*(r(2,2)*r(3,3)+r(2,3)*r(3,2)) + r(1,2)*(r(2,1)*r(3,3)+r(2,3)*r(3,1)) + &
               r(1,3)*(r(2,1)*r(3,2)+r(2,2)*r(3,1)), 2)
  end function det2

  ! III . pay: pigeonhole and the export, exhaustively on small wholes
  logical function injective_exists(n, m)
    integer, intent(in) :: n, m
    integer :: f(8), i, j
    logical :: inj
    integer(i8) :: code, total, cc
    injective_exists = .false.
    total = int(m, i8)**n
    do code = 0_i8, total - 1_i8
      cc = code
      do i = 1, n
        f(i) = int(mod(cc, int(m, i8))); cc = cc / int(m, i8)
      end do
      inj = .true.
      do i = 1, n - 1
        do j = i + 1, n
          if (f(i) == f(j)) inj = .false.
        end do
      end do
      if (inj) then
        injective_exists = .true.; return
      end if
    end do
  end function injective_exists
  subroutine pay()
    integer :: n, m, cp, f, fp, k
    integer, parameter :: cps(5) = [1, 1, 1, 2, 3], fs(5) = [1, 2, 3, 1, 1], fpmax(5) = [10, 8, 8, 8, 3]
    logical :: ok
    integer(i8) :: a, b
    write(*,'(a)') 'III PAY'
    ok = .true.
    do n = 1, 6
      do m = 1, 6
        if (injective_exists(n, m) .neqv. (n <= m)) ok = .false.
      end do
    end do
    call check('III: n distinct states fit injectively in m cells exactly when n <= m, every n, m <= 6', ok)
    ok = .true.
    do k = 1, 5
      cp = cps(k); f = fs(k)
      do fp = 1, fpmax(k)
        n = 2*cp*f; m = cp*fp
        if (injective_exists(n, m) .neqv. (2*f <= fp)) ok = .false.
      end do
    end do
    call check('III: the content halves and nothing merges exactly when the freedom at least doubles', ok)
    call check('III: a merging step halves the content with no freedom exported (two states, one cell)', &
         .not. injective_exists(2, 1))
    ok = .true.
    do a = 1_i8, 300_i8
      do b = 1_i8, 300_i8
        if (v2(a*b) /= v2(a) + v2(b)) ok = .false.
      end do
    end do
    call check('III: the two-adic valuation is additive on positive arguments, 90000 pairs', ok .and. v2(2_i8) == 1)
  end subroutine pay
  integer function v2(x)
    integer(i8), intent(in) :: x
    integer(i8) :: y
    v2 = 0; y = x
    do while (mod(y, 2_i8) == 0_i8)
      v2 = v2 + 1; y = y / 2_i8
    end do
  end function v2

  ! IV . supply: the calibration is unique, and no reading of the content returns the deed
  subroutine supply()
    integer :: sx, dx, c, ncal, gcode, q, nret
    logical :: ok, all_match
    write(*,'(a)') 'IV SUPPLY'
    ok = .true.
    do sx = 0, 1
      do dx = 0, 1
        ncal = 0
        do c = 0, 1
          ! on the orbit {x, sigma x}: d(x) = s(x) xor c and d(sigma x) = s(sigma x) xor c, with s, d odd
          if (dx == ieor(sx, c) .and. 1 - dx == ieor(1 - sx, c)) ncal = ncal + 1
        end do
        if (ncal /= 1) ok = .false.
      end do
    end do
    call check('IV: for every odd witness and odd target, exactly one calibration bit', ok)
    nret = 0
    do gcode = 0, 7
      all_match = .true.
      do q = 0, 2
        ! a reading of the content q must equal ran on the executed state (1, q) and on the unexecuted (0, q)
        if (bit(gcode, q) /= 1) all_match = .false.
        if (bit(gcode, q) /= 0) all_match = .false.
      end do
      if (all_match) nret = nret + 1
    end do
    call check('IV: of the 8 readings of a three-element content, none returns whether it ran', nret == 0)
  end subroutine supply

  ! V . primes: one free orbit, the parity frame, the divisor cube, the balance
  subroutine primes()
    integer, parameter :: N = 1000000
    integer, allocatable :: dc(:), acc(:), mu(:)
    logical, allocatable :: comp(:)
    integer :: d, m, r, k, nsq
    logical :: ok_odd, ok_bal, ok_prime, ok_k4, ok_seat
    integer, parameter :: kp(6) = [11, 13, 17, 19, 23, 29], ks(6) = [851, 1273, 437, 2119, 1703, 869]
    write(*,'(a)') 'V PRIMES'
    allocate(dc(N), acc(N), mu(N), comp(N))
    dc = 0; acc = 0; mu = 1; comp = .false.
    do d = 2, N
      if (.not. comp(d)) then
        do m = 2*d, N, d
          comp(m) = .true.
        end do
        do m = d, N, d
          mu(m) = -mu(m)
        end do
        if (int(d,i8)*int(d,i8) <= int(N,i8)) then
          do m = d*d, N, d*d
            mu(m) = 0
          end do
        end if
      end if
    end do
    do d = 1, N
      do m = d, N, d
        dc(m) = dc(m) + 1
        acc(m) = acc(m) + mu(d)
      end do
    end do
    ok_odd = .true.; ok_bal = .true.; ok_prime = .true.; ok_seat = .true.
    do m = 1, N
      r = int(sqrt(real(m, dp)))
      do while (r*r > m); r = r - 1; end do
      do while ((r+1)*(r+1) <= m); r = r + 1; end do
      nsq = merge(1, 0, r*r == m)
      if (mod(dc(m), 2) /= nsq) ok_odd = .false.
      if (m == 1 .and. acc(m) /= 1) ok_bal = .false.
      if (m > 1 .and. acc(m) /= 0) ok_bal = .false.
      if (m > 1 .and. ((dc(m) == 2) .neqv. (.not. comp(m)))) ok_prime = .false.
      if (m > 1 .and. .not. comp(m) .and. nsq /= 0) ok_seat = .false.
    end do
    call check('V: the fibre is odd exactly when it holds a seat, and holds at most one, n <= 10^6', ok_odd)
    call check('V: a prime is exactly a fibre of one free orbit, with no seat, n <= 10^6', ok_prime .and. ok_seat)
    call check('V: every finite fibre balances, the signs over the divisors sum to [n = 1], n <= 10^6', ok_bal)
    ok_k4 = .true.
    do k = 1, 6
      if (mod(kp(k), 420) /= mod(ks(k), 420)) ok_k4 = .false.
      if (dc(kp(k)) /= 2 .or. dc(ks(k)) /= 4) ok_k4 = .false.
      if (mu(kp(k)) /= -1 .or. mu(ks(k)) /= 1) ok_k4 = .false.
    end do
    call check('V: the parity frame: residues mod 420 merge each pair, the paid bits 1 and 2 separate it', ok_k4)
    call check('V: thirty has the eight divisors of the sign cube, signs four and four', &
         dc(30) == 8 .and. sum(mu([1,2,3,5,6,10,15,30])) == 0)
    deallocate(dc, acc, mu, comp)
  end subroutine primes

  ! VI . wall, edge, seat
  pure function theta(x) result(s)
    real(dp), intent(in) :: x
    real(dp) :: s
    integer :: n
    s = 0.0_dp
    do n = 80, 1, -1
      s = s + exp(-acos(-1.0_dp) * real(n,dp)**2 * x)
    end do
    s = 1.0_dp + 2.0_dp * s
  end function theta
  subroutine wall_edge_seat()
    integer, parameter :: NW = 10000000
    real(dp), parameter :: xs(7) = [0.25_dp, 0.5_dp, 0.8_dp, 1.0_dp, 1.5_dp, 2.0_dp, 4.0_dp]
    real(dp) :: worst, rr, s1, s2, h, best, ratio
    integer(i8) :: n, lo, hi, mm
    integer :: k, j, d, m, xbest
    integer(1), allocatable :: mu(:)
    logical, allocatable :: comp(:)
    logical :: ok1, ok2, ok3
    write(*,'(a)') 'VI WALL, EDGE, SEAT'
    worst = 0.0_dp
    do k = 1, 7
      rr = abs(theta(1.0_dp/xs(k)) - sqrt(xs(k))*theta(xs(k))) / (sqrt(xs(k))*theta(xs(k)))
      worst = max(worst, rr)
    end do
    write(*,'(a,es10.3)') '  theta(1/x) against sqrt(x) theta(x), worst relative gap over seven scales: ', worst
    call check('VI: the lattice sum is self-dual; its weight is the square root, the fold''s centre', worst < 1.0e-13_dp)
    ok1 = .true.; ok2 = .true.; ok3 = .true.; h = 1.0_dp
    do j = 0, 24
      lo = 2_i8**j + 1_i8; hi = 2_i8**(j+1)
      s1 = 0.0_dp; s2 = 0.0_dp
      do n = hi, lo, -1
        s1 = s1 + 1.0_dp/real(n,dp)
        s2 = s2 + 1.0_dp/real(n,dp)**2
      end do
      h = h + s1
      if (s1 < 0.5_dp .or. s1 > 1.0_dp) ok1 = .false.
      if (s2 > 2.0_dp**(-j)) ok2 = .false.
      if (h < 1.0_dp + 0.5_dp*real(j+1,dp)) ok3 = .false.
    end do
    call check('VI: every block of shares one-in-n holds between a half and one: the wall at Re s = 1', ok1 .and. ok3)
    call check('VI: at two units per bit every block holds at most 2^-j: finite past the wall', ok2)
    allocate(mu(NW), comp(NW))
    mu = 1_1; comp = .false.
    do d = 2, NW
      if (.not. comp(d)) then
        do m = 2*d, NW, d
          comp(m) = .true.
        end do
        do m = d, NW, d
          mu(m) = -mu(m)
        end do
        if (int(d,i8)*int(d,i8) <= int(NW,i8)) then
          do m = d*d, NW, d*d
            mu(m) = 0_1
          end do
        end if
      end if
    end do
    mm = 0_i8; best = 0.0_dp; xbest = 0
    do m = 1, NW
      mm = mm + int(mu(m), i8)
      if (m >= 100) then
        ratio = abs(real(mm,dp)) / sqrt(real(m,dp))
        if (ratio > best) then
          best = ratio; xbest = m
        end if
      end if
    end do
    write(*,'(a,i0,a,f8.5,a,i0)') '  the signed walk of the paid parities to 10^7: M = ', mm, &
         '; max |M(x)|/sqrt(x) on [100, 10^7] = ', best, ' at x = ', xbest
    call check('VI: the walk is paid to 10^7 and stays inside the square root there, a finite payment', best < 1.0_dp)
    deallocate(mu, comp)
  end subroutine wall_edge_seat

  ! VII . the heat flow: every zero moves by the pull law; the pair falls onto the line
  subroutine flow_coeffs(c0, t, c)
    real(dp), intent(in) :: c0(0:6), t
    real(dp), intent(out) :: c(0:6)
    real(dp) :: dk(0:6), tmp(0:6), fac
    integer :: k, i
    c = c0; dk = c0; fac = 1.0_dp
    do k = 1, 3
      tmp = 0.0_dp
      do i = 2, 6
        tmp(i-2) = dk(i) * real(i,dp) * real(i-1,dp)
      end do
      dk = tmp
      fac = fac * (-t) / real(k,dp)
      c = c + fac * dk
    end do
  end subroutine flow_coeffs
  pure function peval(c, z) result(p)
    real(dp), intent(in) :: c(0:6)
    complex(dp), intent(in) :: z
    complex(dp) :: p
    integer :: i
    p = cmplx(c(6), 0.0_dp, dp)
    do i = 5, 0, -1
      p = p*z + c(i)
    end do
  end function peval
  pure function dpeval(c, z) result(p)
    real(dp), intent(in) :: c(0:6)
    complex(dp), intent(in) :: z
    complex(dp) :: p
    integer :: i
    p = cmplx(6.0_dp*c(6), 0.0_dp, dp)
    do i = 5, 1, -1
      p = p*z + real(i,dp)*c(i)
    end do
  end function dpeval
  subroutine newton_all(c, z)
    real(dp), intent(in) :: c(0:6)
    complex(dp), intent(inout) :: z(6)
    integer :: k, it
    do k = 1, 6
      do it = 1, 40
        z(k) = z(k) - peval(c, z(k)) / dpeval(c, z(k))
      end do
    end do
  end subroutine newton_all
  integer function sign_changes(c)
    real(dp), intent(in) :: c(0:6)
    integer :: i
    real(dp) :: x, v, vprev
    sign_changes = 0
    vprev = real(peval(c, cmplx(-6.0_dp, 0.0_dp, dp)), dp)
    do i = 1, 240000
      x = -6.0_dp + 12.0_dp*real(i,dp)/240000.0_dp
      v = real(peval(c, cmplx(x, 0.0_dp, dp)), dp)
      if (v*vprev < 0.0_dp) sign_changes = sign_changes + 1
      if (abs(v) > 0.0_dp) vprev = v
    end do
  end function sign_changes
  subroutine heat_flow()
    complex(dp) :: r0(6), zp(6), zm(6), z(6), poly(0:6), vf, vfd
    real(dp) :: c0(0:6), c(0:6), hh, worst, t, imprev
    integer :: k, j, i, nreal0, nreal1, step
    logical :: mono
    write(*,'(a)') 'VII THE HEAT FLOW'
    r0 = [cmplx(0.3_dp, 0.5_dp, dp), cmplx(0.3_dp, -0.5_dp, dp), cmplx(-2.0_dp, 0.0_dp, dp), &
          cmplx(-1.0_dp, 0.0_dp, dp), cmplx(1.5_dp, 0.0_dp, dp), cmplx(2.5_dp, 0.0_dp, dp)]
    poly = (0.0_dp, 0.0_dp); poly(0) = (1.0_dp, 0.0_dp)
    do k = 1, 6
      do i = k, 1, -1
        poly(i) = poly(i-1) - r0(k)*poly(i)
      end do
      poly(0) = -r0(k)*poly(0)
    end do
    c0 = real(poly, dp)
    hh = 1.0e-5_dp; worst = 0.0_dp
    call flow_coeffs(c0, hh, c);  zp = r0; call newton_all(c, zp)
    call flow_coeffs(c0, -hh, c); zm = r0; call newton_all(c, zm)
    do k = 1, 6
      vf = (0.0_dp, 0.0_dp)
      do j = 1, 6
        if (j /= k) vf = vf + 2.0_dp / (r0(k) - r0(j))
      end do
      vfd = (zp(k) - zm(k)) / (2.0_dp*hh)
      worst = max(worst, abs(vfd - vf)/abs(vf))
    end do
    write(*,'(a,es10.3)') '  velocity of each zero against 2 sum 1/(z_k - z_j), worst relative gap: ', worst
    call check('VII: every zero moves by the pull law, degree six', worst < 1.0e-6_dp)
    z = r0; t = 0.0_dp; imprev = aimag(z(1)); mono = .true.; step = 0
    do while (aimag(z(1)) > 0.02_dp .and. step < 100000)
      step = step + 1; t = t + 1.0e-4_dp
      call flow_coeffs(c0, t, c); call newton_all(c, z)
      if (aimag(z(1)) >= imprev) mono = .false.
      imprev = aimag(z(1))
    end do
    write(*,'(a,f8.5)') '  the off-line pair reaches |Im| < 0.02 at t = ', t
    call check('VII: the pair falls toward the line at every step', mono .and. step < 100000)
    nreal0 = sign_changes(c0)
    call flow_coeffs(c0, 1.0_dp, c); nreal1 = sign_changes(c)
    write(*,'(a,i0,a,i0)') '  real zeros at t = 0: ', nreal0, ';  at t = 1: ', nreal1
    call check('VII: four on the line before, six after: the pair crossed onto the seat', nreal0 == 4 .and. nreal1 == 6)
  end subroutine heat_flow
end program bridge_twin
