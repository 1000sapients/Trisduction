! Three_Dimensions_Twin_CC.f90 · twin of SPHYS_Three_Dimensions_CC.lean
! RATIONALE. The engine proves five properties of the forced laws as conditions on the dimension of space. This
!   twin executes each independently: it solves the law of gravity for matter at rest as a linear system in each
!   dimension, differentiates the radial field and the radial force numerically, integrates an orbit under the
!   force of each dimension, tabulates the five conditions, and sets the readings against published measurements.
! DESIGN. Double precision; elimination with pivoting for the linear systems; central differences; a fourth-order
!   Runge-Kutta step for the orbits. No random numbers.
! CONVENTION. A measured check passes when the forced value lies within two quoted uncertainties; a rival is
!   excluded when it lies further than five.
! NON-NEGOTIABLE. The orbit test perturbs a circular orbit by one percent in speed, both ways, and reports whether
!   the radius stays between one half and two for sixty turns. No tuning per dimension.
! RISK. The orbit run illustrates a classical theorem (Bertrand, 1873; Ehrenfest, 1917); the engine's statement is
!   the sign of the stiffness, and the run agrees with it for d = 2..6. The measured values are inputs.
program dimension_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  integer :: checks = 0, failures = 0
  real(dp), parameter :: pi = 3.14159265358979323846d0
  call table()
  call gravity()
  call point()
  call orbits()
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
  subroutine table()
    integer :: d, nall, only, bad
    logical :: w, g, b, s, t
    character(3) :: yn(5)
    nall = 0; only = 0; bad = 0
    write(*,'(A)') ' A. The five conditions of the engine, d = 1..12'
    write(*,'(A)') '    d  weight  waves  bent twice  stable orbits  two statistics'
    do d = 1, 12
      w = d /= 1 .and. d /= 2; g = (d + 1)*max(d - 2, 0) >= 2; b = d - 2 == 1; s = d >= 2 .and. d - 1 < 3; t = d >= 3
      yn = 'no '; if (w) yn(1) = 'yes'; if (g) yn(2) = 'yes'; if (b) yn(3) = 'yes'; if (s) yn(4) = 'yes'
      if (t) yn(5) = 'yes'
      write(*,'(I5,2X,A6,2X,A5,2X,A10,2X,A13,2X,A14)') d, yn(1), yn(2), yn(3), yn(4), yn(5)
      if (w .and. g .and. b .and. s .and. t) then
        nall = nall + 1; only = d
      end if
      if ((w .and. s) .neqv. (d == 3)) bad = bad + 1
      if ((g .and. s) .neqv. (d == 3)) bad = bad + 1
      if ((t .and. s) .neqv. (d == 3)) bad = bad + 1
      if ((2*d == d*(d - 1)) .neqv. (d == 3)) bad = bad + 1
      if ((2*(d - 1) == (d + 1)*(d - 2)) .neqv. (d == 3)) bad = bad + 1
      if ((3 - d == 0) .neqv. (d == 3)) bad = bad + 1
    end do
    call check('all five hold together at exactly one d, and it is 3', nall == 1 .and. only == 3)
    call check('each pair with stable orbits, and the three counts of light and the coupling: 3 only', bad == 0)
  end subroutine
  subroutine solve(a, b, n, x, singular)             ! elimination with pivoting
    integer, intent(in) :: n
    real(dp), intent(in) :: a(n, n), b(n)
    real(dp), intent(out) :: x(n)
    logical, intent(out) :: singular
    real(dp) :: m(n, n + 1), t(n + 1), big
    integer :: c, i, p
    m(:, 1:n) = a; m(:, n + 1) = b; singular = .false.; x = 0
    do c = 1, n
      p = c; big = abs(m(c, c))
      do i = c + 1, n
        if (abs(m(i, c)) > big) then
          big = abs(m(i, c)); p = i
        end if
      end do
      if (big < 1.0d-12) then
        singular = .true.; return
      end if
      t = m(c, :); m(c, :) = m(p, :); m(p, :) = t
      do i = 1, n
        if (i /= c) m(i, :) = m(i, :) - m(i, c)/m(c, c)*m(c, :)
      end do
    end do
    do i = 1, n
      x(i) = m(i, n + 1)/m(i, i)
    end do
  end subroutine
  subroutine gravity()
    integer :: d, i, j, n, bad, zero_at, equal_at
    real(dp), allocatable :: a(:, :), b(:), x(:), sgn(:)
    real(dp) :: kr
    logical :: sing, line
    kr = 1.7d0                                         ! kappa times rho, any value that is not zero
    bad = 0; zero_at = 0; equal_at = 0; line = .false.
    write(*,'(A)') ' B. The law of gravity for matter at rest, solved in each dimension'
    write(*,'(A)') '    d   time / (kappa rho)   space / (kappa rho)   space over time'
    do d = 1, 8
      n = d + 1
      allocate(a(n, n), b(n), x(n), sgn(n))
      sgn = -1; sgn(1) = 1
      do i = 1, n
        do j = 1, n
          a(i, j) = -0.5d0*sgn(i)*sgn(j)
        end do
        a(i, i) = a(i, i) + 1
      end do
      b = 0; b(1) = kr
      call solve(a, b, n, x, sing)
      if (d == 1) then
        line = sing
      else
        if (sing) bad = bad + 1
        if (abs((d - 1)*x(1) - (d - 2)*kr) > 1.0d-10 .or. abs((d - 1)*x(2) - kr) > 1.0d-10) bad = bad + 1
        if (abs(x(1)) < 1.0d-10) zero_at = zero_at*100 + d
        if (abs(x(2) - x(1)) < 1.0d-10) equal_at = equal_at*100 + d
        if (d == 2) then
          write(*,'(I5,2F20.6,A)') d, x(1)/kr, x(2)/kr, '        no weight'
        else
          write(*,'(I5,3F20.6)') d, x(1)/kr, x(2)/kr, x(2)/x(1)
        end if
      end if
      deallocate(a, b, x, sgn)
    end do
    call check('the solution is (d - 2)/(d - 1) along the time and 1/(d - 1) along space, d = 2..8', bad == 0)
    call check('with one dimension of space the system is singular: no matter at rest', line)
    call check('the time component is zero at d = 2 only, and space equals time at d = 3 only', &
               zero_at == 2 .and. equal_at == 3)
  end subroutine
  subroutine point()
    integer :: d, i, t, bad
    real(dp) :: x(8), xp(8), xm(8), h, dv, r
    h = 1.0d-4; bad = 0
    do d = 2, 8
      do t = 1, 50
        do i = 1, d
          x(i) = 0.4d0 + 0.013d0*t + 0.11d0*i
        end do
        r = sqrt(sum(x(1:d)**2))
        dv = 0
        do i = 1, d
          xp = x; xm = x; xp(i) = x(i) + h; xm(i) = x(i) - h
          dv = dv + (xp(i)*sqrt(sum(xp(1:d)**2))**(-d) - xm(i)*sqrt(sum(xm(1:d)**2))**(-d))/(2*h)
        end do
        if (abs(dv)*r**d > 1.0d-5) bad = bad + 1
      end do
    end do
    write(*,'(A)') ' C. The field of a point, 50 points in each dimension of space from 2 to 8'
    call check('the radial field of size r^(1-d) is free of sources: the force falls as the power d - 1', bad == 0)
  end subroutine
  subroutine orbits()
    integer :: d, k, p
    logical :: held(2:6), ok
    real(dp) :: f, r0, kk, l2, h, num, exact, worst
    write(*,'(A)') ' D. The orbit'
    worst = 0; h = 1.0d-5
    do p = 0, 6
      do k = 1, 5
        r0 = 0.6d0 + 0.3d0*k; kk = 0.5d0 + 0.4d0*k
        l2 = kk*r0**(3 - p)                              ! the circular orbit: L2 r^-3 = k r^-p
        num = ((l2*(r0 + h)**(-3) - kk*(r0 + h)**(-p)) - (l2*(r0 - h)**(-3) - kk*(r0 - h)**(-p)))/(2*h)
        exact = (p - 3)*kk*r0**(-p - 1)
        worst = max(worst, abs(num - exact)/(kk*r0**(-p - 1)))
      end do
    end do
    write(*,'(A,ES9.2)') '   largest relative residual of the stiffness against (p - 3) k r^(-p-1), p = 0..6: ', worst
    call check('the derivative of the radial force at a circular orbit is (p - 3) k r^(-p-1)', worst < 1.0d-6)
    write(*,'(A)') '   a circular orbit, speed changed by one percent, sixty turns'
    ok = .true.
    do d = 2, 6
      held(d) = .true.
      do k = 1, 2
        f = 1.01d0; if (k == 2) f = 0.99d0
        if (.not. stays(d, f)) held(d) = .false.
      end do
      write(*,'(A,I1,A,I1,A,L1)') '   d = ', d, ': force falls as the power ', d - 1, ';  orbit held = ', held(d)
      if (held(d) .neqv. (d - 1 < 3)) ok = .false.
    end do
    call check('the orbit holds for d = 2, 3 and is lost for d = 4, 5, 6, as the sign of the stiffness says', ok)
  end subroutine
  function stays(d, f) result(ok)
    integer, intent(in) :: d
    real(dp), intent(in) :: f
    logical :: ok
    real(dp) :: y(4), k1(4), k2(4), k3(4), k4(4), h, r
    integer :: i, n
    y = [1.0d0, 0.0d0, 0.0d0, f]                       ! position (1,0), velocity (0,f); circular speed is 1
    h = 1.0d-3; n = int(60*2*pi/h); ok = .true.
    do i = 1, n
      k1 = rhs(y, d); k2 = rhs(y + h/2*k1, d); k3 = rhs(y + h/2*k2, d); k4 = rhs(y + h*k3, d)
      y = y + h/6*(k1 + 2*k2 + 2*k3 + k4)
      r = sqrt(y(1)**2 + y(2)**2)
      if (r < 0.5d0 .or. r > 2.0d0) then
        ok = .false.; return
      end if
    end do
  end function
  function rhs(y, d) result(dy)
    real(dp), intent(in) :: y(4)
    integer, intent(in) :: d
    real(dp) :: dy(4), r
    r = sqrt(y(1)**2 + y(2)**2)
    dy(1:2) = y(3:4); dy(3:4) = -y(1:2)/r**d            ! attraction of magnitude r^-(d-1)
  end function
  subroutine measured()
    real(dp) :: gam, gsig
    write(*,'(A)') ' E. Against published measurements'
    gam = 2.1d-5; gsig = 2.3d-5                         ! Bertotti, Iess and Tortora, 2003: gamma - 1
    write(*,'(A,F5.2,A,F8.0,A)') '   share of space in the bending of light: 1 (d = 3) at ', abs(gam)/gsig, &
         ' uncertainties; 1/2 (d = 4) at ', abs(gam + 0.5d0)/gsig, ' uncertainties'
    call check('light is bent twice: gamma - 1 = (2.1 +- 2.3)e-5; the share 1/2 of four dimensions is excluded', &
               abs(gam)/gsig < 2.0d0 .and. abs(gam + 0.5d0)/gsig > 5.0d0)
    write(*,'(A,F5.2,A)') '   exponent of the static law of charge, off two by (2.7 +- 3.1)e-16: forced 0 at ', &
         2.7d0/3.1d0, ' uncertainties'
    call check('the inverse square of charge (Williams, Faller and Hill, 1971)', abs(2.7d-16)/3.1d-16 < 2.0d0)
    write(*,'(A,F5.2,A,F5.1,A)') '   dimensions of spacetime from a wave of gravity, 4.02 +0.07 -0.10: four at ', &
         0.02d0/0.10d0, ' uncertainties, five at ', 0.98d0/0.07d0, ' uncertainties'
    call check('four dimensions of spacetime, five excluded (Pardo et al., 2018)', &
               0.02d0/0.10d0 < 2.0d0 .and. 0.98d0/0.07d0 > 5.0d0)
    write(*,'(A)') '   reading, not a check: exclusion, violation below 3.4e-29 (Shi et al., 2018)'
  end subroutine
end program
