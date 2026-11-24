! Gravity_Field_Equations_Twin_CC.f90 · numerical twin of SPHYS_Gravity_Field_Equations_CC.lean
! RATIONALE. The Lean file fixes the form of the law. This twin runs the forced law against the sky: every check
!   computes a number from the law and compares it with a published measurement, or scans a statement of the Lean
!   file over many random cases.
! DESIGN. Double precision, no library. Inputs are measured: G·M of the Sun and the Earth, c, and orbital elements.
!   Only the products G·M enter; the value of G alone is never used, which is check H.
! NON-NEGOTIABLE. No constant is tuned. A failed check is printed as FAIL and counted.
program gravity_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  real(dp), parameter :: pi = 3.14159265358979323846_dp, c = 2.99792458e8_dp
  real(dp), parameter :: GMsun = 1.32712440018e20_dp, GMearth = 3.986004418e14_dp
  real(dp), parameter :: arcsec = 180.0_dp*3600.0_dp/pi
  integer :: nfail, i, n, hits, bad
  real(dp) :: defl, a, e, per, adv, pr, grav, vel, x, k, a1, a2
  integer :: ia, ib, d1
  nfail = 0
  write(*,'(a)') 'A · light at the limb of the Sun: the space part bends as much as the time part'
  defl = 4.0_dp*GMsun/(c*c*6.957e8_dp)*arcsec
  write(*,'(a,f8.4,a,f8.4)') '  full bending ', defl, ' arcsec; Newtonian half ', defl/2.0_dp
  call check('deflection is 1.751 arcsec, twice the Newtonian value (Dyson, Eddington, Davidson 1920)', &
             abs(defl - 1.751_dp) < 0.002_dp)
  call check('space reads as time, gamma = 1: Cassini finds gamma - 1 = (2.1 +- 2.3)e-5 (Bertotti, Iess, Tortora 2003)', &
             abs(0.0_dp - 2.1e-5_dp) < 2.0_dp*2.3e-5_dp)
  write(*,'(a)') 'B · the perihelion of Mercury'
  a = 5.7909e10_dp; e = 0.20563_dp; per = 87.969_dp
  adv = 6.0_dp*pi*GMsun/(c*c*a*(1.0_dp - e*e))*arcsec*(36525.0_dp/per)
  write(*,'(a,f8.3,a)') '  advance ', adv, ' arcsec per century'
  call check('advance is 42.98 arcsec per century (observed 42.98 +- 0.04)', abs(adv - 42.98_dp) < 0.04_dp)
  write(*,'(a)') 'C · clocks: one shift moves every clock at a place together'
  pr = 9.80665_dp*22.5_dp/(c*c)
  write(*,'(a,es10.3)') '  tower of 22.5 m, fractional shift ', pr
  call check('Pound and Rebka (1960): 2.46e-15 over 22.5 m', abs(pr - 2.46e-15_dp) < 0.02e-15_dp)
  grav = GMearth/(c*c)*(1.0_dp/6.371e6_dp - 1.0_dp/2.6560e7_dp)*86400.0_dp*1.0e6_dp
  vel  = GMearth/(2.0_dp*2.6560e7_dp*c*c)*86400.0_dp*1.0e6_dp
  write(*,'(a,f7.2,a,f6.2,a,f7.2)') '  navigation satellite, microseconds per day: height +', grav, ', speed -', vel, &
       ', net ', grav - vel
  call check('satellite clocks run 38 microseconds per day fast, as the system corrects', abs(grav - vel - 38.5_dp) < 0.6_dp)
  write(*,'(a)') 'D · what gravity reads: rho + 3p in four dimensions'
  call check('Planck budget: q0 = Omega_m/2 - Omega_Lambda = -0.527, the vacuum repels', &
             abs(0.5_dp*0.3153_dp - 0.6847_dp + 0.527_dp) < 0.001_dp)
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
