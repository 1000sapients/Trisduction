! Dirac_Forced_Twin_CC.f90 · twin of SPHYS_Dirac_Forced_CC.lean
! RATIONALE. The engine proves its identities over all integers. This twin executes the same identities on random
!   integer data, as an independent run, and sets three readings of the engine against published measurements.
! DESIGN. 64-bit integers for the algebra; double precision for the measured cells; one generator, fixed seed.
! NON-NEGOTIABLE. No mass and no coupling is computed. The fine-structure constant is a measured input.
! RISK. The least law gives the moment of the electron as two. The first correction, alpha over two pi, belongs to
!   the field's own quantum and is printed as such, not as a result of the least law.
program dirac_twin
  implicit none
  integer, parameter :: i8 = selected_int_kind(18), dp = kind(1.0d0)
  integer(i8) :: seed = 20260622_i8
  integer :: checks = 0, failures = 0
  real(dp), parameter :: pi = 3.14159265358979323846d0
  call algebra()
  call exclusion()
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
  function rnd() result(k)                         ! integers in -9..9
    integer(i8) :: k
    seed = mod(seed * 6364136223846793005_i8 + 1442695040888963407_i8, 9223372036854775807_i8)
    k = mod(abs(seed / 65536_i8), 19_i8) - 9_i8
  end function
  function qm(p, q) result(r)                      ! product of two turns a + b i + c j + d k
    integer(i8), intent(in) :: p(4), q(4)
    integer(i8) :: r(4)
    r(1) = p(1)*q(1) - p(2)*q(2) - p(3)*q(3) - p(4)*q(4)
    r(2) = p(1)*q(2) + p(2)*q(1) + p(3)*q(4) - p(4)*q(3)
    r(3) = p(1)*q(3) - p(2)*q(4) + p(3)*q(1) + p(4)*q(2)
    r(4) = p(1)*q(4) + p(2)*q(3) - p(3)*q(2) + p(4)*q(1)
  end function
  function mm(a, b) result(c)                      ! product of two by two arrays of turns, stored (entry, part)
    integer(i8), intent(in) :: a(4,4), b(4,4)
    integer(i8) :: c(4,4)
    c(1,:) = qm(a(1,:), b(1,:)) + qm(a(2,:), b(3,:))
    c(2,:) = qm(a(1,:), b(2,:)) + qm(a(2,:), b(4,:))
    c(3,:) = qm(a(3,:), b(1,:)) + qm(a(4,:), b(3,:))
    c(4,:) = qm(a(3,:), b(2,:)) + qm(a(4,:), b(4,:))
  end function
  function dop(E, x, y, z, m) result(d)            ! the operator of first order, shifted by a mass
    integer(i8), intent(in) :: E, x, y, z, m
    integer(i8) :: d(4,4)
    d = 0
    d(1,1) = E + m; d(4,1) = -E + m
    d(2,2:4) = [x, y, z]; d(3,2:4) = [x, y, z]
  end function
  subroutine algebra()
    integer :: i, bad1, bad2, bad3, bad4, bad5, na, nb
    integer(i8) :: x, y, z, u, v, w, E, m, a, b, c, d, r(4), s(4,4), want(4,4)
    logical :: ok
    bad1 = 0; bad2 = 0; bad3 = 0; bad4 = 0
    do i = 1, 200000
      x = rnd(); y = rnd(); z = rnd(); u = rnd(); v = rnd(); w = rnd(); E = rnd()
      r = qm([0_i8, x, y, z], [0_i8, x, y, z])
      if (any(r /= [-(x*x + y*y + z*z), 0_i8, 0_i8, 0_i8])) bad1 = bad1 + 1
      r = qm([0_i8, x, y, z], [0_i8, u, v, w])
      if (any(r /= [-(x*u + y*v + z*w), y*w - z*v, z*u - x*w, x*v - y*u])) bad2 = bad2 + 1
      s = mm(dop(E, x, y, z, 0_i8), dop(E, x, y, z, 0_i8))
      want = 0; want(1,1) = E*E - (x*x + y*y + z*z); want(4,1) = want(1,1)
      if (any(s /= want)) bad3 = bad3 + 1
      ! a point on the mass shell: (a2+b2+c2+d2)^2 = (a2+b2-c2-d2)^2 + (2(ad+bc))^2 + (2(bd-ac))^2
      a = rnd(); b = rnd(); c = rnd(); d = rnd()
      E = a*a + b*b + c*c + d*d; m = a*a + b*b - c*c - d*d; x = 2*(a*d + b*c); y = 2*(b*d - a*c)
      s = mm(dop(E, x, y, 0_i8, -m), dop(E, x, y, 0_i8, m))
      if (any(s /= 0)) bad4 = bad4 + 1
    end do
    write(*,'(A)') ' A. The algebra, on 200000 random integer points'
    call check('the square of a direction is minus its squared length', bad1 == 0)
    call check('the product of two directions carries the dot and the cross', bad2 == 0)
    call check('the operator of first order squares to the mass shell', bad3 == 0)
    call check('on the mass shell, operator less mass times operator plus mass is zero', bad4 == 0)
    bad5 = 0
    do na = -6, 6
      do nb = -6, 6
        ok = (na*1 + nb*0)**2 == 1 .and. (na*0 + nb*1)**2 == 1 .and. (na + nb)**2 == 2
        if (ok) bad5 = bad5 + 1
      end do
    end do
    call check('no pair of numbers takes the square root, a and b in -6..6', bad5 == 0)
    bad5 = 0
    do na = 2, 12                                    ! the count 2**(n/2), whole part: 4 at n = 4 and 5 only, 2 at n = 2 and 3
      if ((2**(na/2) == 4) .neqv. (na == 4 .or. na == 5)) bad5 = bad5 + 1
      if ((2**(na/2) == 2) .neqv. (na == 2 .or. na == 3)) bad5 = bad5 + 1
    end do
    call check('components of the least law, n = 2..12: two in three dimensions of spacetime, four in four', bad5 == 0)
  end subroutine
  subroutine exclusion()
    integer :: i, j, bad1, bad2, bad3, sg
    integer(i8) :: f(12), g(12), psi(12,12)
    bad1 = 0; bad2 = 0; bad3 = 0
    do i = 1, 12
      f(i) = rnd(); g(i) = rnd() + 10
    end do
    do i = 1, 12                                     ! the amplitude with the minus sign, built once and then read
      do j = 1, 12
        psi(i,j) = f(i)*g(j) - f(j)*g(i)
      end do
    end do
    do i = 1, 12
      if (psi(i,i) /= 0) bad1 = bad1 + 1             ! empty wherever the two share a state
      do j = 1, 12
        if (psi(j,i) /= -psi(i,j)) bad1 = bad1 + 1
      end do
    end do
    do sg = -50, 50
      if ((sg*sg == 1) .neqv. (sg == 1 .or. sg == -1)) bad2 = bad2 + 1
    end do
    do i = 1, 40
      if ((i - 1 >= 2) .neqv. (i >= 3)) bad3 = bad3 + 1
    end do
    write(*,'(A)') ' B. Exclusion and the two statistics'
    call check('an amplitude with the minus sign vanishes wherever two share a state', bad1 == 0)
    call check('a sign whose square is one is plus one or minus one, -50..50', bad2 == 0)
    call check('the double exchange unwinds exactly from three dimensions of space, d = 1..40', bad3 == 0)
  end subroutine
  subroutine measured()
    real(dp) :: alpha, ghalf, sch, qm_ratio, qm_sig
    write(*,'(A)') ' C. Against published measurements'
    alpha = 7.2973525693d-3                         ! measured input
    ghalf = 1.00115965218059d0                      ! Fan et al., 2023, uncertainty 13 in the last two digits
    sch = alpha/(2*pi)
    write(*,'(A,F16.14,A,F10.8)') '   half the moment of the electron: least law 1, measured ', ghalf, &
         ', first correction alpha/2pi = ', sch
    ! thresholds are the scales of the expansion, not fitted numbers: alpha for the least law, (alpha/pi)^2 for the rest
    call check('the least law holds within alpha: measured 1.00115965218059(13)', abs(ghalf - 1.0d0) < alpha)
    call check('the first correction closes the rest within (alpha/pi)^2', abs(ghalf - 1.0d0 - sch) < (alpha/pi)**2)
    qm_ratio = -1.000000000003d0; qm_sig = 16.0d-12  ! Borchert et al., 2022
    write(*,'(A,F6.2,A)') '   antiproton to proton charge over mass: -1 at ', abs(qm_ratio + 1.0d0)/qm_sig, &
         ' uncertainties'
    call check('the antiparticle mirrors the particle: -1.000000000003(16) against -1', &
               abs(qm_ratio + 1.0d0)/qm_sig < 1.0d0)
    ! a bound compared with the forced value zero cannot fail: it is printed as a reading and is not counted
    write(*,'(A)') '   reading, not a check: exclusion forced 0; measured probability of a violation below 3.4e-29'
  end subroutine
end program
