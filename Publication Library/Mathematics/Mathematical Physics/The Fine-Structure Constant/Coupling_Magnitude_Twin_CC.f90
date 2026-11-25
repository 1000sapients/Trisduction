! Coupling_Magnitude_Twin_CC.f90 · numerical twin of SPHYS_Coupling_Magnitude_CC.lean
! RATIONALE. The engine proves that the flux law admits every source and that no scale-blind verdict fixes one.
!   This twin computes the flux of a point source through spheres by quadrature (A to C) and sets three numbers
!   against measurement (D, E).
! DESIGN. Double precision, no library. The source sits at distance a from the centre of a sphere of radius R, on
!   its axis. With a strength falling as the power p of the distance, the flux through the sphere is
!     (q/2) R**2 * integral over theta of (R - a cos theta) sin theta / (R**2 + a**2 - 2 a R cos theta)**((p+1)/2),
!   computed by the midpoint rule on 200000 intervals. For p = 2 it is q when the source is inside and 0 when it
!   is outside, whatever R and a; for any other p it depends on R. A fixed linear congruential generator.
!   Measured inputs: the inverse fine-structure constant 137.035999177(21), CODATA 2022 (Mohr et al. 2025); the
!   bound on a deviation of the exponent of Coulomb's law from two, (2.7 +- 3.1)e-16 (Williams, Faller and Hill 1971).
!   Formulas tested in D: Eddington's integer 137 (1929), and Wyler's expression (1969),
!   alpha = (9 / (8 pi**4)) (pi**5 / (2**4 5!))**(1/4).
! RISK. D tests two formulas. It does not test every formula; that none can come from the form is the engine's
!   theorem, on the bridge the paper prints. Quadrature tolerance is 1e-6 of the source.
! NON-NEGOTIABLE. A formula is called excluded only when it stands more than five printed uncertainties away.
program coupling_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  integer :: nfail, npass, i, d
  integer(8) :: seed
  logical :: ok, ok2
  real(dp) :: pi, aw, ainv, sig, dev, q, k, r, a, f1, f2, lam, worst
  nfail = 0; npass = 0; seed = 20260622_8; pi = 4.0_dp*atan(1.0_dp)

  ! A. the inverse square conserves the flux, and no other power does
  ok = .true.; ok2 = .true.; worst = 0.0_dp
  do i = 1, 200
    q = 1.0_dp + urand()*99.0_dp; r = 0.5_dp + urand()*9.5_dp; a = urand()*0.8_dp*r
    f1 = flux(q, r, a, 2.0_dp); worst = max(worst, abs(f1 - q)/q)
    if (abs(f1 - q) > 1.0e-6_dp*q) ok = .false.
    a = r*(1.3_dp + urand()*3.0_dp)                       ! the source outside the sphere
    if (abs(flux(q, r, a, 2.0_dp)) > 1.0e-6_dp*q) ok2 = .false.
  end do
  write(*,'(a,es9.2)') '  200 spheres about a source off their centre: largest departure of the flux from the source, ', worst
  call check('A1 with the inverse square, the flux through every sphere holding the source is the source', ok)
  call check('A2 and the flux through every sphere not holding it is zero', ok2)
  f1 = flux(1.0_dp, 1.0_dp, 0.0_dp, 2.1_dp); f2 = flux(1.0_dp, 2.0_dp, 0.0_dp, 2.1_dp)
  write(*,'(a,f8.5,a,f8.5)') '  with the power 2.1: flux through radius 1, ', f1, '; through radius 2, ', f2
  call check('A3 with the power 2.1 the flux through two spheres differs by more than one part in a hundred', &
             abs(f1 - f2) > 0.01_dp*f1)
  f1 = flux(1.0_dp, 1.0_dp, 0.0_dp, 1.9_dp); f2 = flux(1.0_dp, 2.0_dp, 0.0_dp, 1.9_dp)
  call check('A4 and with the power 1.9', abs(f1 - f2) > 0.01_dp*f1)

  ! B. every rescaling of the source is a solution, and two fluxes stand in the ratio of their sources
  ok = .true.; ok2 = .true.
  do i = 1, 200
    q = 1.0_dp + urand()*9.0_dp; k = -50.0_dp + urand()*100.0_dp; r = 0.5_dp + urand()*9.5_dp; a = urand()*0.8_dp*r
    f1 = flux(q, r, a, 2.0_dp); f2 = flux(k*q, 2.0_dp*r, 0.3_dp*r, 2.0_dp)   ! the rescaled source, another sphere
    if (abs(f2 - k*q) > 1.0e-6_dp*abs(k*q) + 1.0e-9_dp) ok = .false.
    if (abs(f2*q - f1*k*q) > 1.0e-6_dp*abs(k*q*q) + 1.0e-9_dp) ok2 = .false.
  end do
  call check('B1 the flux of a source rescaled by any number, positive or negative, is conserved', ok)
  call check('B2 two conserved fluxes stand in the ratio of their sources through any two spheres', ok2)

  ! C. the law has no scale of length: stretch the sphere and the offset by one factor and the flux is unchanged
  ok = .true.
  do i = 1, 200
    q = 1.0_dp + urand()*9.0_dp; r = 0.5_dp + urand()*9.5_dp; a = urand()*0.8_dp*r; lam = 0.01_dp + urand()*100.0_dp
    if (abs(flux(q, lam*r, lam*a, 2.0_dp) - flux(q, r, a, 2.0_dp)) > 1.0e-6_dp*q) ok = .false.
  end do
  call check('C1 with the inverse square, stretching every length by one factor leaves the flux unchanged', ok)
  f1 = flux(1.0_dp, 1.0_dp, 0.2_dp, 2.1_dp); f2 = flux(1.0_dp, 7.0_dp, 1.4_dp, 2.1_dp)
  call check('C2 with the power 2.1 it does not: that law carries a length', abs(f1 - f2) > 0.01_dp*f1)

  ! D. two formulas for the number, against the measurement
  ainv = 137.035999177_dp; sig = 0.000000021_dp
  dev = (137.0_dp - ainv)/sig
  write(*,'(a,es10.3,a)') '  Eddington, 137 exactly: ', abs(dev), ' uncertainties from the measured value'
  call check('D1 the integer 137 stands more than five uncertainties from the measured value', abs(dev) > 5.0_dp)
  aw = (9.0_dp/(8.0_dp*pi**4))*(pi**5/(16.0_dp*120.0_dp))**0.25_dp
  dev = (1.0_dp/aw - ainv)/sig
  write(*,'(a,f14.9,a,f8.1,a)') '  Wyler: 1/alpha = ', 1.0_dp/aw, ', ', abs(dev), ' uncertainties from the measured value'
  call check('D2 the value of Wyler stands more than five uncertainties from the measured value', abs(dev) > 5.0_dp)

  ! E. the exponent of the law: the area of a sphere in d dimensions of space grows as the power d - 1 of its radius
  d = 3
  write(*,'(a,i0)') '  power of the radius by which the strength falls in three dimensions: ', d - 1
  call check('E  the forced exponent, two, lies within two uncertainties of the measured (2.7 +- 3.1)e-16 from two', &
             abs(real(d - 1 - 2, dp) - 2.7e-16_dp) < 2.0_dp*3.1e-16_dp)

  write(*,'(a,i0,a,i0)') 'checks passed: ', npass, '   failures: ', nfail
contains
  real(dp) function flux(qq, rr, aa, p)
    real(dp), intent(in) :: qq, rr, aa, p
    integer, parameter :: n = 200000
    integer :: j
    real(dp) :: th, s2, acc
    acc = 0.0_dp
    do j = 1, n
      th = (real(j, dp) - 0.5_dp)*pi/real(n, dp)
      s2 = rr*rr + aa*aa - 2.0_dp*aa*rr*cos(th)
      acc = acc + (rr - aa*cos(th))*sin(th)/s2**(0.5_dp*(p + 1.0_dp))
    end do
    flux = 0.5_dp*qq*rr*rr*acc*pi/real(n, dp)
  end function
  real(dp) function urand()          ! uniform on [0, 1)
    seed = mod(seed*6364136223846793005_8 + 1442695040888963407_8, 9223372036854775807_8)
    if (seed < 0) seed = -seed
    urand = real(mod(seed/65536_8, 1000000_8), dp)/1.0e6_dp
  end function
  subroutine check(name, cond)
    character(*), intent(in) :: name
    logical, intent(in) :: cond
    if (cond) then
      write(*,'(a,a)') '  PASS  ', name; npass = npass + 1
    else
      write(*,'(a,a)') '  FAIL  ', name; nfail = nfail + 1
    end if
  end subroutine
end program coupling_twin
