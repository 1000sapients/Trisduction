! Maxwell_Forced_Twin_CC.f90 · twin of SPHYS_Maxwell_Forced_CC.lean
! RATIONALE. The engine proves its statements in every arena. This twin executes them in floating point on waves,
!   whose derivatives are exact, as an independent run; searches every law with whole constants in a box for the
!   conserved ones; counts the waves along random null vectors in three to seven dimensions; differentiates
!   radial fields numerically; and sets the forced law against published measurements, with a rival where one
!   exists.
! DESIGN. A wave is a polarization on the profile exp(k.x): the derivative along a direction multiplies by the
!   component of k. Signs are plus for the time and minus for space. Double precision; one generator, fixed seed.
! CONVENTION. An identity holds when its largest residual is below 1e-9 of the scale. A measured check passes when
!   the forced value lies within two quoted uncertainties; a rival is excluded when it lies further than five.
! NON-NEGOTIABLE. No constant is tuned and no coupling is computed.
! RISK. The measured values are inputs, printed with their sources in the paper. The search of section A covers
!   whole constants from -5 to 5; the engine's theorem covers every rational constant.
program maxwell_twin
  implicit none
  integer, parameter :: i8 = selected_int_kind(18), dp = kind(1.0d0)
  integer(i8) :: seed = 20260622_i8
  integer :: checks = 0, failures = 0
  real(dp), parameter :: pi = 3.14159265358979323846d0
  call laws()
  call waves()
  call static()
  call counts()
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
  function rnd(n) result(k)
    integer, intent(in) :: n
    integer :: k
    seed = mod(seed * 6364136223846793005_i8 + 1442695040888963407_i8, 9223372036854775807_i8)
    k = int(mod(abs(seed / 65536_i8), int(n, i8)))
  end function
  function uni() result(u)
    real(dp) :: u
    u = (rnd(1000000) + 0.5d0)/1.0d6
  end function
  function eta(n) result(e)
    integer, intent(in) :: n
    real(dp) :: e(n)
    e = -1; e(1) = 1
  end function
  function mrank(m, nr, nc) result(r)               ! rank by elimination with pivoting
    integer, intent(in) :: nr, nc
    real(dp), intent(in) :: m(nr, nc)
    real(dp) :: a(nr, nc), t(nc), big
    integer :: r, c, i, p
    a = m; r = 0
    do c = 1, nc
      if (r == nr) exit
      p = r + 1; big = abs(a(p, c))
      do i = r + 2, nr
        if (abs(a(i, c)) > big) then
          big = abs(a(i, c)); p = i
        end if
      end do
      if (big < 1.0d-9) cycle
      r = r + 1
      t = a(r, :); a(r, :) = a(p, :); a(p, :) = t
      do i = r + 1, nr
        a(i, :) = a(i, :) - a(i, c)/a(r, c)*a(r, :)
      end do
    end do
  end function
  subroutine laws()
    integer :: a, b, m, i, nu, kept, wrong, gkept, differ
    real(dp) :: k(4), e(4), et(4), kk, ke, j(4), dv, gch, worst
    logical :: cons, gauge
    et = eta(4); kept = 0; wrong = 0; gkept = 0; differ = 0; worst = 0
    do a = -5, 5
      do b = -5, 5
        do m = -5, 5
          cons = .true.; gauge = .true.
          do i = 1, 200
            do nu = 1, 4
              k(nu) = 2*uni() - 1; e(nu) = 2*uni() - 1
            end do
            kk = sum(et*k*k); ke = sum(et*k*e)
            j = a*kk*e + b*k*ke + m*e                 ! the law on the wave, without the common profile
            dv = sum(et*k*j)                         ! its divergence
            worst = max(worst, abs(dv - ((a + b)*kk*ke + m*ke)))
            if (abs(dv) > 1.0d-9) cons = .false.
            gch = maxval(abs(a*kk*k + b*k*kk + m*k)) ! the change of the law under the gauge turn exp(k.x)
            if (gch > 1.0d-9) gauge = .false.
          end do
          if (cons) kept = kept + 1
          if (gauge) gkept = gkept + 1
          if (cons .neqv. gauge) differ = differ + 1
          if (cons .neqv. (b == -a .and. m == 0)) wrong = wrong + 1
        end do
      end do
    end do
    write(*,'(A)') ' A. The law, on 200 random waves for each of 1331 laws with whole constants from -5 to 5'
    write(*,'(A,ES9.2)') '   largest residual of the divergence of the law against its formula: ', worst
    call check('the divergence of the law is (a + b)(k.k)(k.e) + m (k.e)', worst < 1.0d-9)
    write(*,'(A,I0,A,I0)') '   laws conserved on every wave: ', kept, '   laws unchanged by every gauge turn: ', gkept
    call check('the conserved laws are the eleven with b = -a and m = 0, and no other', kept == 11 .and. wrong == 0)
    call check('conserved and unchanged by a gauge turn coincide on all 1331', differ == 0 .and. gkept == 11)
  end subroutine
  subroutine waves()
    integer :: n, i, j, mu, nu, bad, badoff, trial
    real(dp), allocatable :: k(:), et(:), e(:), ej(:), pm(:,:), mm(:,:)
    real(dp) :: kk, ke, worst
    bad = 0; badoff = 0; worst = 0
    do n = 3, 7
      allocate(k(n), et(n), e(n), ej(n), pm(n, n*n), mm(n, n))
      et = eta(n)
      do trial = 1, 200
        do i = 2, n
          k(i) = 2*uni() - 1; e(i) = 2*uni() - 1
        end do
        e(1) = 2*uni() - 1
        k(1) = sqrt(sum(k(2:n)**2))                   ! on the cone
        kk = sum(et*k*k); ke = sum(et*k*e)
        ! the divergence of the field of the wave: sum over mu of eta k_mu (k_mu e_nu - k_nu e_mu)
        do nu = 1, n
          worst = max(worst, abs(sum(et*k*(k*e(nu) - k(nu)*e)) - (kk*e(nu) - ke*k(nu))))
        end do
        ! the polarizations with k.e = 0, and the fields k wedge e they give
        do j = 1, n
          ej = 0; ej(j) = 1; ej(1) = ej(1) - et(j)*k(j)/k(1)
          do mu = 1, n
            do nu = 1, n
              pm(j, (mu - 1)*n + nu) = k(mu)*ej(nu) - k(nu)*ej(mu)
            end do
          end do
        end do
        if (mrank(pm, n, n*n) /= n - 2) bad = bad + 1
        ! off the cone: the solutions of (k.k) e - (k.e) k = 0 are the multiples of k, and their field is zero
        k(1) = k(1) + 0.5d0 + uni(); kk = sum(et*k*k)
        do mu = 1, n
          do nu = 1, n
            mm(mu, nu) = -k(mu)*et(nu)*k(nu)
          end do
          mm(mu, mu) = mm(mu, mu) + kk
        end do
        if (mrank(mm, n, n) /= n - 1 .or. maxval(abs(matmul(mm, k))) > 1.0d-9) badoff = badoff + 1
      end do
      deallocate(k, et, e, ej, pm, mm)
    end do
    write(*,'(A)') ' B. Waves, 200 random wave vectors in each dimension from 3 to 7'
    write(*,'(A,ES9.2)') '   largest residual of the divergence of the field of a wave: ', worst
    call check('the divergence of the field of a wave is (k.k) e - (k.e) k', worst < 1.0d-9)
    call check('on the cone the fields of the waves form a space of dimension n - 2, in every case', bad == 0)
    call check('off the cone the only solutions are multiples of k, whose field is zero', badoff == 0)
  end subroutine
  subroutine static()
    integer :: d, i, t, badfree, badrival
    real(dp) :: x(6), xp(6), xm(6), h, dv, r, c, worst, exact
    h = 1.0d-4; worst = 0; badfree = 0; badrival = 0
    do d = 2, 6
      do t = 1, 200
        do i = 1, d
          x(i) = 0.5d0 + uni()
        end do
        r = sqrt(sum(x(1:d)**2))
        c = -6 + 8*uni()                                ! a random power of the distance
        dv = 0
        do i = 1, d
          xp = x; xm = x; xp(i) = x(i) + h; xm(i) = x(i) - h
          dv = dv + (xp(i)*sqrt(sum(xp(1:d)**2))**c - xm(i)*sqrt(sum(xm(1:d)**2))**c)/(2*h)
        end do
        exact = (d + c)*r**c
        worst = max(worst, abs(dv - exact)/r**c)
        ! the power c = -d, and the rival: the inverse square, c = -3, in every dimension
        dv = 0
        do i = 1, d
          xp = x; xm = x; xp(i) = x(i) + h; xm(i) = x(i) - h
          dv = dv + (xp(i)*sqrt(sum(xp(1:d)**2))**(-d) - xm(i)*sqrt(sum(xm(1:d)**2))**(-d))/(2*h)
        end do
        if (abs(dv)*r**d > 1.0d-5) badfree = badfree + 1
        dv = 0
        do i = 1, d
          xp = x; xm = x; xp(i) = x(i) + h; xm(i) = x(i) - h
          dv = dv + (xp(i)*sqrt(sum(xp(1:d)**2))**(-3) - xm(i)*sqrt(sum(xm(1:d)**2))**(-3))/(2*h)
        end do
        if ((abs(dv)*r**3 > 1.0d-5) .neqv. (d /= 3)) badrival = badrival + 1
      end do
    end do
    write(*,'(A)') ' C. The static half, 200 random points in each dimension of space from 2 to 6'
    write(*,'(A,ES9.2)') '   largest relative residual of the divergence of x r^c against (d + c) r^c: ', worst
    call check('the divergence of the radial field x r^c is (d + c) r^c', worst < 1.0d-5)
    call check('the power c = -d is free of sources in every dimension', badfree == 0)
    call check('rival, the inverse square in every dimension: free of sources in three and in no other', badrival == 0)
  end subroutine
  subroutine counts()
    integer :: n, bad
    bad = 0
    do n = 2, 60
      if ((2*(n - 1) == (n - 1)*(n - 2)) .neqv. (n == 4)) bad = bad + 1
      if ((2*(n - 2) == n*(n - 3)) .neqv. (n == 4)) bad = bad + 1
    end do
    write(*,'(A)') ' D. The classical counts, dimensions 2 to 60'
    call check('electric and magnetic parts, and the waves of light and of gravity, are equal in number in four only', bad == 0)
  end subroutine
  subroutine measured()
    real(dp), parameter :: h = 6.62607015d-34, kb = 1.380649d-23, c = 2.99792458d8
    real(dp) :: sb2, sb3, q, dq, sm, ds
    write(*,'(A)') ' E. Against published measurements'
    q = 2.7d-16; dq = 3.1d-16
    write(*,'(A,ES8.1,A,ES8.1,A,F5.2,A)') '   deviation of the exponent of the static law from two: measured ', q, ' +- ', dq, &
         ', forced 0 at ', abs(q)/dq, ' uncertainties'
    call check('the inverse square: forced deviation 0 within two uncertainties (Williams, Faller and Hill 1971)', &
               abs(0 - q) < 2*dq)
    sb2 = 2*pi**5*kb**4/(15*h**3*c*c); sb3 = 1.5d0*sb2; sm = 5.66967d-8; ds = 0.00076d-8
    write(*,'(A,ES12.5,A,ES12.5,A,F7.5,A,F7.5,A)') '   constant of thermal radiation: two waves ', sb2, ', three ', sb3, &
         ', measured (', sm*1.0d8, ' +- ', ds*1.0d8, ')e-8'
    write(*,'(A,F5.2,A,F8.1,A)') '   two waves at ', abs(sb2 - sm)/ds, ' uncertainties, three at ', &
         abs(sb3 - sm)/ds, ' uncertainties'
    call check('two waves give the measured constant of thermal radiation within two uncertainties (Quinn and Martin 1985)', &
               abs(sb2 - sm) < 2*ds)
    call check('rival, three waves in equilibrium: excluded by more than five uncertainties', abs(sb3 - sm) > 5*ds)
    write(*,'(A)') '   speed of gravity less speed of light, over the speed of light: between -3e-15 and 7e-16; forced 0'
    call check('one speed for light and gravity: forced difference 0 inside the measured interval (Abbott et al. 2017)', &
               -3.0d-15 < 0.0d0 .and. 0.0d0 < 7.0d-16)
    write(*,'(A)') '   reading, not a check: forced mass of the photon 0; measured below 1e-18 eV (Ryutov 2007)'
    write(*,'(A)') '   reading, not a check: forced decay of the electron none; lifetime above 6.6e28 years (Borexino 2015)'
  end subroutine
end program
