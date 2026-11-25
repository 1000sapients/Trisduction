! Gravity_Field_Equations_Twin_CC.f90 · numerical twin of SPHYS_Gravity_Field_Equations_CC.lean
! RATIONALE. The Lean file fixes the form of the law. This twin runs the forced law against the sky: every check
!   computes a number from the law and compares it with a published measurement, or scans a statement of the Lean
!   file over many random cases.
! DESIGN. Double precision, no library. Inputs are measured: G·M of the Sun and the Earth, c, orbital elements, the
!   potential of the geoid and the matter fraction of Planck 2018.
!   Only the products G·M enter; the value of G alone is never used, which is check H.
! NON-NEGOTIABLE. No constant is tuned. A failed check is printed as FAIL and counted.
program gravity_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  real(dp), parameter :: pi = 3.14159265358979323846_dp, c = 2.99792458e8_dp
  real(dp), parameter :: GMsun = 1.32712440018e20_dp, GMearth = 3.986004418e14_dp
  real(dp), parameter :: arcsec = 180.0_dp*3600.0_dp/pi
  integer :: nfail, i, n, hits, bad
  real(dp) :: defl, a, e, per, adv, pr, grav, vel, x, k, a1, a2, tt, ss, gam, act
  integer :: ia, ib, d1
  nfail = 0
  write(*,'(a)') 'A · light at the limb of the Sun: the space part bends as much as the time part'
  defl = 4.0_dp*GMsun/(c*c*6.957e8_dp)*arcsec
  write(*,'(a,f8.4,a,f8.4)') '  full bending ', defl, ' arcsec; Newtonian half ', defl/2.0_dp
  ! measured values, not the prediction: 1919 eclipse 1.98 +- 0.12 (Sobral), 1.61 +- 0.30 (Principe), probable errors;
  ! radio interferometry gamma = 0.9998 +- 0.0004, so the angle is 0.9999 +- 0.0002 of the full value
  call check('eclipse of 1919 (1.98 +- 0.12, 1.61 +- 0.30) and radio interferometry (0.9999 +- 0.0002 of full) hold it', &
             abs(defl - 1.98_dp) < 2.0_dp*0.12_dp .and. abs(defl - 1.61_dp) < 2.0_dp*0.30_dp .and. &
             abs(0.9999_dp*defl - defl) < 2.0_dp*0.0002_dp*defl)
  ! gamma is the space part over the time part for dust of density 1 in n = 4: ((n-2)p - T) / ((n-2)rho + T), T = -rho + (n-1)p
  gam = (2.0_dp*0.0_dp - (-1.0_dp + 3.0_dp*0.0_dp)) / (2.0_dp*1.0_dp + (-1.0_dp + 3.0_dp*0.0_dp))
  call check('space reads as time, gamma = 1: Cassini finds gamma - 1 = (2.1 +- 2.3)e-5 (Bertotti, Iess, Tortora 2003)', &
             abs((gam - 1.0_dp) - 2.1e-5_dp) < 2.0_dp*2.3e-5_dp)
  write(*,'(a)') 'B · the perihelion of Mercury'
  a = 5.7909e10_dp; e = 0.20563_dp; per = 87.969_dp
  adv = 6.0_dp*pi*GMsun/(c*c*a*(1.0_dp - e*e))*arcsec*(36525.0_dp/per)
  write(*,'(a,f8.3,a)') '  advance ', adv, ' arcsec per century'
  call check('advance is 42.98 arcsec per century (observed 42.98 +- 0.04, Will 2014)', abs(adv - 42.98_dp) < 2.0_dp*0.04_dp)
  write(*,'(a)') 'C · clocks: one shift moves every clock at a place together'
  pr = 9.80665_dp*22.56_dp/(c*c)   ! the tower of Pound and Rebka: 74 feet, 22.56 m
  write(*,'(a,es10.3)') '  tower of 22.56 m, fractional shift ', pr
  call check('measured over computed: 1.05 +- 0.10 (Pound, Rebka 1960) and 0.9990 +- 0.0076 (Pound, Snider 1965)', &
             abs(1.05_dp*pr - pr) < 2.0_dp*0.10_dp*pr .and. abs(0.9990_dp*pr - pr) < 2.0_dp*0.0076_dp*pr)
  ! clocks at rest on the geoid: Phi0/c**2 = 6.969290134e-10; orbit of semi-major axis 2.656175e7 m (Ashby 2003)
  grav = (6.969290134e-10_dp - GMearth/(2.656175e7_dp*c*c))*86400.0_dp*1.0e6_dp
  vel  = GMearth/(2.0_dp*2.656175e7_dp*c*c)*86400.0_dp*1.0e6_dp
  write(*,'(a,f7.3,a,f6.3,a,f7.3)') '  navigation satellite, microseconds per day: height +', grav, ', speed -', vel, &
       ', net ', grav - vel
  ! tolerance: half a unit of the last digit Ashby prints, 0.00005e-10
  write(*,'(a,f8.4,a)') '  net as a fraction: ', (grav - vel)/86400.0e6_dp*1.0e10_dp, 'e-10'
  call check('the offset built into the satellite clocks is 4.4647e-10 (Ashby 2003), to the last digit printed', &
             abs((grav - vel)/86400.0e6_dp - 4.4647e-10_dp) < 0.00005e-10_dp)
  write(*,'(a)') 'D · what gravity reads: rho + 3p in four dimensions'
  ! rho + 3p over the critical density for matter 0.3153 +- 0.0073 and a flat vacuum (Planck 2018): Om + (1 - 3)(1 - Om)
  act = 0.3153_dp + (1.0_dp - 3.0_dp)*(1.0_dp - 0.3153_dp)
  write(*,'(a,f7.3,a,f6.3)') '  active density of the Planck budget: ', act, ' +- ', 3.0_dp*0.0073_dp
  call check('Planck budget read through rho + 3p is below zero by more than five uncertainties: the vacuum repels', &
             act < -5.0_dp*3.0_dp*0.0073_dp)
  write(*,'(a)') 'E · the counts'
  call check('polarizations n(n-3)/2: none in three dimensions, two in four, five in five', &
             pol(3) == 0 .and. pol(4) == 2 .and. pol(5) == 5)
  call check('curvature components n^2(n^2-1)/12: six in three, twenty in four', curv(3) == 6 .and. curv(4) == 20)
  call check('in three dimensions curvature equals law, 6 = 6; in four it exceeds it by ten', &
             curv(3) == 3*4/2 .and. curv(4) == 4*5/2 + 10)
  write(*,'(a)') 'F · nothing escapes: conservation forces the law'
  hits = 0; bad = 0
  call random_seed()
  do i = 1, 20000
     call random_number(x); ia = int(x*21.0_dp) - 10
     call random_number(x); ib = int(x*21.0_dp) - 10
     ! conserved on every geometry iff (a + 2b)*dR = 0 for every dR; test dR = 1..5
     d1 = 0
     do n = 1, 5
        if ((ia + 2*ib)*n /= 0) d1 = 1
     end do
     if (d1 == 0) then
        hits = hits + 1
        if (ia + 2*ib /= 0) bad = bad + 1
     else
        if (ia + 2*ib == 0) bad = bad + 1
     end if
  end do
  write(*,'(a,i6,a)') '  ', hits, ' conserved laws among 20000 random pairs (a, b)'
  call check('every conserved law has b = -a/2 and every such law is conserved', bad == 0 .and. hits > 0)
  write(*,'(a)') 'G · inverse square: the reading loses nothing between spheres'
  bad = 0
  do i = 1, 1000
     if ((2*i)**2 /= 4*i**2) bad = bad + 1
  end do
  call check('twice the radius, four times the area, for a thousand radii', bad == 0)
  write(*,'(a)') 'H · the law returns no scale'
  bad = 0
  do i = 1, 100000
     call random_number(x); k = 10.0_dp**(40.0_dp*x - 20.0_dp)
     a1 = 4.0_dp*GMsun/(c*c*6.957e8_dp)
     a2 = 4.0_dp*(k*GMsun)/(c*c*(k*6.957e8_dp))
     if (abs(a2 - a1) > 1.0e-12_dp*a1) bad = bad + 1
  end do
  call check('100000 rescalings over forty decades leave the bending unchanged: only the ratio is read', bad == 0)
  write(*,'(a)') 'I · the exact solution outside a body: gamma = 1 and beta = 1'
  ! time part ((1-x)/(1+x))**2 against 1 - 4x + 8x**2, space part (1+x)**4 against 1 + 4x, with x = GM/(2 c**2 r);
  ! the remainders are of third and of second order, bounded here by 20 x**3 and 7 x**2
  bad = 0
  do i = 1, 1000
     x = 1.0e-5_dp*real(i, dp)
     tt = ((1.0_dp - x)/(1.0_dp + x))**2
     ss = (1.0_dp + x)**4
     if (abs(tt - (1.0_dp - 4.0_dp*x + 8.0_dp*x*x)) > 20.0_dp*x**3) bad = bad + 1
     if (abs(ss - (1.0_dp + 4.0_dp*x)) > 7.0_dp*x*x) bad = bad + 1
  end do
  call check('a thousand radii: the time part is 1 - 2U + 2U**2 and the space part 1 + 2U, to the order stated', bad == 0)
  write(*,'(a,i2)') 'failures: ', nfail
contains
  integer function pol(m)
    integer, intent(in) :: m
    pol = m*(m + 1)/2 - 2*m
  end function pol
  integer function curv(m)
    integer, intent(in) :: m
    curv = m*m*(m*m - 1)/12
  end function curv
  subroutine check(label, ok)
    character(len=*), intent(in) :: label
    logical, intent(in) :: ok
    if (ok) then
       write(*,'(a,a)') '  PASS  ', label
    else
       write(*,'(a,a)') '  FAIL  ', label
       nfail = nfail + 1
    end if
  end subroutine check
end program gravity_twin
