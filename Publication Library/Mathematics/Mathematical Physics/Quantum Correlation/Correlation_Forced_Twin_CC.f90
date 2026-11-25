! Correlation_Forced_Twin_CC.f90 · twin of SPHYS_Correlation_Forced_CC.lean
! RATIONALE. The engine proves its statements in every ring and for every record. This twin executes them in
!   floating point on random readings, random records and enumerated tables, as an independent run; searches for
!   what the engine proves cannot exist; and sets two rival bounds against four published experiments.
! DESIGN. Readings are real matrices of size four: a near reading at angle a is cos(a) Z + sin(a) X on the first
!   factor, a far reading the same on the second. A record is a random positive matrix of trace one, or a random
!   vector. Double precision; one generator, fixed seed.
! CONVENTION. An identity holds when its largest residual over the run is below 1e-10. A rival bound is excluded
!   by a measurement that lies further from it than five of its stated uncertainties.
! NON-NEGOTIABLE. The twin never predicts which outcome occurs. It checks identities, bounds and frequencies only.
! RISK. The four measured values are inputs, printed with their sources in the paper. The search of section C
!   covers readings in one plane; the engine's theorem covers every reading that squares to one.
program correlation_twin
  implicit none
  integer, parameter :: i8 = selected_int_kind(18), dp = kind(1.0d0)
  integer(i8) :: seed = 20260622_i8
  integer :: checks = 0, failures = 0
  real(dp), parameter :: pi = 3.14159265358979323846d0
  real(dp) :: Id(4,4), ZI(4,4), XI(4,4), IZ(4,4), IX(4,4)
  call setup()
  call registration()
  call tables()
  call readings()
  call outcome()
  call measured()
  write(*,'(A,I0,A,I0,A)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', failures, '}'
contains
  subroutine check(label, ok)
    character(*), intent(in) :: label
    logical, intent(in) :: ok
    checks = checks + 1
    if (ok) then
      write(*,'(A,A)') '  PASS  ', label
    else
      failures = failures + 1
      write(*,'(A,A)') '  FAIL  ', label
    end if
  end subroutine
  function rnd(n) result(k)                        ! integers in 0..n-1
    integer, intent(in) :: n
    integer :: k
    seed = mod(seed * 6364136223846793005_i8 + 1442695040888963407_i8, 9223372036854775807_i8)
    k = int(mod(abs(seed / 65536_i8), int(n, i8)))
  end function
  function uni() result(u)
    real(dp) :: u
    u = (rnd(1000000) + 0.5d0)/1.0d6
  end function
  subroutine setup()
    integer :: i
    Id = 0; ZI = 0; XI = 0; IZ = 0; IX = 0
    do i = 1, 4
      Id(i,i) = 1
    end do
    ZI(1,1) = 1; ZI(2,2) = 1; ZI(3,3) = -1; ZI(4,4) = -1
    IZ(1,1) = 1; IZ(2,2) = -1; IZ(3,3) = 1; IZ(4,4) = -1
    XI(1,3) = 1; XI(2,4) = 1; XI(3,1) = 1; XI(4,2) = 1
    IX(1,2) = 1; IX(2,1) = 1; IX(3,4) = 1; IX(4,3) = 1
  end subroutine
  function near(a) result(m)
    real(dp), intent(in) :: a
    real(dp) :: m(4,4)
    m = cos(a)*ZI + sin(a)*XI
  end function
  function far(b) result(m)
    real(dp), intent(in) :: b
    real(dp) :: m(4,4)
    m = cos(b)*IZ + sin(b)*IX
  end function
  function tr(m) result(t)
    real(dp), intent(in) :: m(4,4)
    real(dp) :: t
    t = m(1,1) + m(2,2) + m(3,3) + m(4,4)
  end function
  function randstate() result(rho)                 ! a random positive matrix of trace one
    real(dp) :: rho(4,4), g(4,4)
    integer :: i, j
    do i = 1, 4
      do j = 1, 4
        g(i,j) = 2*uni() - 1
      end do
    end do
    rho = matmul(g, transpose(g))
    rho = rho/tr(rho)
  end function
  function corr(a0, a1, b0, b1) result(s)
    real(dp), intent(in) :: a0, a1, b0, b1
    real(dp) :: s(4,4), n0(4,4), n1(4,4), f0(4,4), f1(4,4)
    n0 = near(a0); n1 = near(a1); f0 = far(b0); f1 = far(b1)
    s = matmul(n0, f0) + matmul(n0, f1) + matmul(n1, f0) - matmul(n1, f1)
  end function
  subroutine registration()
    integer :: i, k
    real(dp) :: rho(4,4), e(4,4), f(4,4), q(4,4), kr(4,4,3), lsum(4,4), worst1, worst2, acc, c, s, t
    worst1 = 0; worst2 = 0
    do i = 1, 100000
      rho = randstate(); e = (Id + near(2*pi*uni()))/2
      ! a complete far reading at a random angle: the near record summed over the two far outcomes
      f = far(2*pi*uni()); q = (Id + f)/2
      acc = tr(matmul(rho, matmul(e, q))) + tr(matmul(rho, matmul(e, Id - q)))
      worst1 = max(worst1, abs(acc - tr(matmul(rho, e))))
      ! a far operation of three branches K with K1'K1 + K2'K2 + K3'K3 = 1: a far turn mixed with two far readings
      c = uni(); s = sqrt(1 - c); c = sqrt(c); t = 2*pi*uni()
      kr(:,:,1) = c*(cos(t)*Id + sin(t)*matmul(IZ, IX))
      kr(:,:,2) = s*q
      kr(:,:,3) = s*(Id - q)
      acc = 0; lsum = 0
      do k = 1, 3
        acc = acc + tr(matmul(rho, matmul(transpose(kr(:,:,k)), matmul(e, kr(:,:,k)))))
        lsum = lsum + matmul(transpose(kr(:,:,k)), kr(:,:,k))
      end do
      worst2 = max(worst2, abs(acc - tr(matmul(rho, e))), maxval(abs(lsum - Id)))
    end do
    write(*,'(A)') ' A. The registration, on 100000 random records, near readings and far settings'
    write(*,'(A,ES9.2,A,ES9.2)') '   largest change of the near record: far reading ', worst1, '   far operation ', worst2
    call check('a complete far reading leaves the near record', worst1 < 1.0d-10)
    call check('a complete far operation of three branches leaves the near record', worst2 < 1.0d-10)
  end subroutine
  subroutine tables()
    integer :: a0, a1, b0, b1, s, bad, i, j, n, nt, v(16)
    real(dp) :: w, tot, wt, target, got, worst
    bad = 0; nt = 0
    do a0 = -1, 1, 2
      do a1 = -1, 1, 2
        do b0 = -1, 1, 2
          do b1 = -1, 1, 2
            s = a0*b0 + a0*b1 + a1*b0 - a1*b1
            nt = nt + 1; v(nt) = s
            if (abs(s) /= 2) bad = bad + 1
          end do
        end do
      end do
    end do
    write(*,'(A)') ' B. Local records'
    call check('all sixteen tables give plus or minus two', bad == 0 .and. nt == 16)
    bad = 0
    do i = 1, 100000
      n = 1 + rnd(12); tot = 0; wt = 0
      do j = 1, n
        w = uni(); tot = tot + w*v(1 + rnd(16)); wt = wt + w
      end do
      if (abs(tot/wt) > 2 + 1.0d-12) bad = bad + 1
    end do
    call check('100000 random weighted families of tables stay within two', bad == 0)
    worst = 0
    do i = 0, 400
      target = -2 + i*0.01d0
      got = (2 + target)/4*2 + (2 - target)/4*(-2)        ! the two tables of the engine, with its weights
      worst = max(worst, abs(got - target))
    end do
    call check('every value from -2 to 2 in steps of 0.01 is reached by two tables', worst < 1.0d-12)
  end subroutine
  subroutine readings()
    integer :: i
    real(dp) :: a0, a1, b0, b1, s(4,4), s2(4,4), ca(4,4), cb(4,4), n0(4,4), n1(4,4), f0(4,4), f1(4,4), p(4,4), &
                q(4,4), rho(4,4), r, w1, w2, w3, smax, cmax, val, psi(4), tsir, e8(4,4), pmax
    r = sqrt(2.0d0); tsir = 2*r
    w1 = 0; w2 = 0; smax = 0; cmax = 0; w3 = 0; pmax = 0
    psi = [0.0d0, 1.0d0, -1.0d0, 0.0d0]
    do i = 1, 100000
      a0 = 2*pi*uni(); a1 = 2*pi*uni(); b0 = 2*pi*uni(); b1 = 2*pi*uni()
      n0 = near(a0); n1 = near(a1); f0 = far(b0); f1 = far(b1)
      s = corr(a0, a1, b0, b1); s2 = matmul(s, s)
      ca = matmul(n0, n1) - matmul(n1, n0); cb = matmul(f0, f1) - matmul(f1, f0)
      w1 = max(w1, maxval(abs(s2 - (4*Id - matmul(ca, cb)))))
      p = r*n0 - (f0 + f1); q = r*n1 - (f0 - f1)
      w2 = max(w2, maxval(abs(matmul(p, p) + matmul(q, q) - (8*Id - 2*r*s))))
      rho = randstate()
      val = tr(matmul(rho, s)); smax = max(smax, abs(val))
      pmax = max(pmax, abs(dot_product(psi, matmul(s, psi))/2))
      ! the two near readings made to commute: the second equal to the first, or its reverse
      if (mod(i, 2) == 0) then
        s = corr(a0, a0, b0, b1)
      else
        s = corr(a0, a0 + pi, b0, b1)
      end if
      cmax = max(cmax, abs(tr(matmul(rho, s))))
      ! the two near readings at right angles, and the two far readings at right angles
      s = corr(a0, a0 + pi/2, b0, b0 + pi/2); s2 = matmul(s, s); e8 = 8*Id
      w3 = max(w3, maxval(abs(matmul(s2, s2 - e8))))
    end do
    write(*,'(A)') ' C. Four readings, 100000 random settings and records'
    write(*,'(A,ES9.2,A,ES9.2,A,ES9.2)') '   largest residual: square ', w1, '   two squares ', w2, '   zero or eight ', w3
    call check('the square of the correlation is four less the product of the two commutators', w1 < 1.0d-10)
    call check('eight less 2*sqrt(2) times the correlation is the sum of the two squares', w2 < 1.0d-10)
    call check('readings at right angles on both sides: the square is zero or eight', w3 < 1.0d-10)
    write(*,'(A,F9.6,A,F9.6,A,F9.6)') '   largest record of the correlation: random records ', smax, &
         '   the pair ', pmax, '   2*sqrt(2) = ', tsir
    call check('no record of the correlation exceeds 2*sqrt(2)', max(smax, pmax) <= tsir + 1.0d-10)
    write(*,'(A,F9.6)') '   largest record when the two near readings commute: ', cmax
    call check('near readings that commute stay within two, on every record', cmax <= 2 + 1.0d-10)
    s = corr(0.0d0, pi/2, 5*pi/4, 3*pi/4)                  ! the far readings of the engine: -(Z+X)/r and -(Z-X)/r
    val = dot_product(psi, matmul(s, psi))/2
    write(*,'(A,F9.6)') '   the pair at the settings of the engine: ', val
    call check('the pair of the engine reaches 2*sqrt(2), and is carried to that multiple of itself', &
               abs(val - tsir) < 1.0d-12 .and. maxval(abs(matmul(s, psi) - tsir*psi)) < 1.0d-12)
  end subroutine
  subroutine outcome()
    real(dp) :: psi(4), nu(4,4), nd(4,4), fu(4,4), fd(4,4), puu, pdd, pud, pdu, a, worst
    integer :: i
    psi = [0.0d0, 1.0d0, -1.0d0, 0.0d0]
    worst = 0
    do i = 1, 1000
      a = 2*pi*uni()                                       ! both parties read along the same random axis
      nu = (Id + near(a))/2; nd = Id - nu; fu = (Id + far(a))/2; fd = Id - fu
      puu = dot_product(psi, matmul(matmul(nu, fu), psi))/2; pdd = dot_product(psi, matmul(matmul(nd, fd), psi))/2
      pud = dot_product(psi, matmul(matmul(nu, fd), psi))/2; pdu = dot_product(psi, matmul(matmul(nd, fu), psi))/2
      worst = max(worst, abs(puu), abs(pdd), abs(pud - 0.5d0), abs(pdu - 0.5d0))
    end do
    write(*,'(A)') ' D. The outcome, the pair read along 1000 random common axes'
    call check('the two outcomes never agree, and each alone is one half', worst < 1.0d-12)
  end subroutine
  subroutine measured()
    real(dp) :: val(4), sig(4), tsir, pr(2,2,2,2), s, m, worst
    character(40) :: nm(4)
    integer :: i, x, y, a, b
    logical :: ok
    tsir = 2*sqrt(2.0d0)
    ! the rival that keeps no signal and drops the readings: outcome a, b in {0,1} at settings x, y in {0,1},
    ! with probability one half when a + b = x y (mod 2), else zero
    s = 0; worst = 0
    do x = 0, 1
      do y = 0, 1
        do a = 0, 1
          do b = 0, 1
            pr(a+1, b+1, x+1, y+1) = merge(0.5d0, 0.0d0, mod(a + b, 2) == x*y)
            s = s + merge(1, -1, x*y == 1 .eqv. .false.)*merge(1, -1, a == b)*pr(a+1, b+1, x+1, y+1)
          end do
        end do
      end do
    end do
    do x = 0, 1
      do a = 0, 1
        m = pr(a+1, 1, x+1, 1) + pr(a+1, 2, x+1, 1)
        worst = max(worst, abs(m - (pr(a+1, 1, x+1, 2) + pr(a+1, 2, x+1, 2))))
      end do
    end do
    write(*,'(A)') ' E. Against published measurements, with two rivals'
    write(*,'(A,F7.4,A,ES9.2)') '   rival, no signal alone: correlation ', s, '   change of the near record ', worst
    call check('a table of chances with no signal and no readings reaches four', abs(s - 4) < 1.0d-12 .and. worst < 1.0d-12)
    nm = [character(40) :: 'Aspect, Grangier and Roger, 1982', 'Weihs et al., 1998', 'Hensen et al., 2015', &
          'Storz et al., 2023']
    val = [2.697d0, 2.73d0, 2.42d0, 2.0747d0]; sig = [0.015d0, 0.02d0, 0.20d0, 0.0033d0]
    ok = .true.
    do i = 1, 4
      write(*,'(A,A,F7.4,A,F6.4,A,F6.1,A,F7.1,A)') '   ', nm(i), val(i), ' +- ', sig(i), '   above two by ', (val(i) - 2)/sig(i), &
           ', below four by ', (4 - val(i))/sig(i), ' uncertainties'
      if (val(i) <= 2 .or. val(i) > tsir) ok = .false.
    end do
    call check('four experiments lie above two and not above 2*sqrt(2)', ok)
    call check('rival, local records: excluded by more than five uncertainties in three experiments, '// &
               'one of them free of loopholes', &
               count((val - 2)/sig > 5.0d0) == 3 .and. (val(4) - 2)/sig(4) > 5.0d0)
    call check('rival, no signal alone: its value four is excluded by more than five uncertainties in all four', &
               all((4 - val)/sig > 5.0d0))
  end subroutine
end program
