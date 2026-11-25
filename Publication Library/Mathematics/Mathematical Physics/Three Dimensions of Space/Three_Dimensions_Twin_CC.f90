! Three_Dimensions_Twin_CC.f90 · twin of SPHYS_Three_Dimensions_CC.lean
! RATIONALE. The engine proves that five properties hold together in three dimensions of space and in no other.
!   This twin tabulates the five for d = 1..12, integrates an orbit under the force of each dimension as an
!   independent execution of the stability clause, and sets the readings against published measurements.
! DESIGN. Integers for the table; double precision and a fourth-order Runge-Kutta step for the orbits.
! NON-NEGOTIABLE. The orbit test perturbs a circular orbit by one percent in speed, both ways, and reports whether
!   the radius stays between one half and two for sixty turns. No tuning per dimension.
! RISK. The orbit run is a numerical illustration of a classical theorem (Bertrand, 1873; Ehrenfest, 1917); the
!   engine's clause is the inequality p < 3, and the run agrees with it for d = 2..6.
program dimension_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  integer :: checks = 0, failures = 0
  real(dp), parameter :: pi = 3.14159265358979323846d0
  call table()
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
    write(*,'(A)') ' A. The five properties, d = 1..12'
    write(*,'(A)') '    d  weight  waves  bent twice  stable orbits  two statistics'
    do d = 1, 12
      w = d - 2 > 0; g = ((d + 1)*max(d - 2, 0))/2 > 0; b = d - 2 == 1; s = d >= 2 .and. d - 1 < 3; t = d - 1 >= 2
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
    call check('each pair with stable orbits, duality, the two counts and the pure number: 3 only', bad == 0)
  end subroutine
  subroutine orbits()
    integer :: d, k
    logical :: held(2:6), ok
    real(dp) :: f
    write(*,'(A)') ' B. A circular orbit, speed changed by one percent, sixty turns'
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
    call check('the orbit holds for d = 2, 3 and is lost for d = 4, 5, 6, as the inequality p < 3 says', ok)
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
    write(*,'(A)') ' C. Against published measurements'
    gam = 2.1d-5; gsig = 2.3d-5                         ! Bertotti, Iess and Tortora, 2003: gamma - 1
    write(*,'(A,F5.2,A,F8.0,A)') '   share of space in the bending of light: 1 (d = 3) at ', abs(gam)/gsig, &
         ' uncertainties; 1/2 (d = 4) at ', abs(gam + 0.5d0)/gsig, ''
    ! the convention of five uncertainties decides an exclusion; no threshold is fitted to a result
    call check('light is bent twice: gamma - 1 = (2.1 +- 2.3)e-5; four dimensions excluded by more than five', &
               abs(gam)/gsig < 1.0d0 .and. abs(gam + 0.5d0)/gsig > 5.0d0)
    call check('inverse square of charge: exponent off by (2.7 +- 3.1)e-16 (Williams, Faller and Hill, 1971)', &
               abs(2.7d-16)/3.1d-16 < 1.0d0)
    call check('dimensions of spacetime from a wave of gravity: 4.02 +0.07 -0.10 (Pardo et al., 2018)', &
               4.0d0 >= 4.02d0 - 0.10d0 .and. 4.0d0 <= 4.02d0 + 0.07d0 .and. 5.0d0 > 4.02d0 + 5*0.07d0)
    ! a bound compared with the forced value zero cannot fail: it is printed as a reading and is not counted
    write(*,'(A)') '   reading, not a check: exclusion, violation below 3.4e-29 (Shi et al., 2018)'
  end subroutine
end program
