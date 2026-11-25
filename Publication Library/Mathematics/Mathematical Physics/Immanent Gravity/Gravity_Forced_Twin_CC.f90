! Gravity_Forced_Twin_CC.f90 · numerical twin of SPHYS_Gravity_Forced_CC.lean
! RATIONALE. The first twin of this paper evaluated textbook formulas and compared them with measurements. That shows
!   general relativity agrees with observation, which was known. This twin is built to discriminate: it integrates
!   the paths of light and of a planet in the exact solution of the forced law, and beside each it integrates rival
!   laws, which must fail the same measurement. It also checks the conservation statement of the engine on the
!   engine's own model geometry, with rival ratios beside it.
! DESIGN. Double precision, no library, fourth-order Runge-Kutta throughout.
!   A. Light past the Sun. A ray in the plane obeys dv/ds = grad(ln n) - (v.grad(ln n)) v for unit tangent v, where
!      n is the optical index of the static metric in isotropic coordinates. Exact solution of the forced law
!      (Schwarzschild 1916): n = (1 + m/2r)**3 / (1 - m/2r). Rival, with the space part weighted by gamma:
!      n = sqrt((1 + 2 gamma m/r) / (1 - 2m/r)). The ray runs from 10000 solar radii before the Sun to 10000 after,
!      with a step of one thousandth of the distance to the Sun. Nothing of the form 4GM/(c**2 R) is entered.
!      A second road for the exact solution: the equation of the orbit that SPHYS_Schwarzschild_CC.lean derives
!      from free fall (`orbit_equation`), with kappa = 0 for light, u'' + u = 3 m u**2, integrated from the point
!      of closest approach to u = 0. The two roads share no formula and must agree.
!   B. Mercury. The orbit obeys u'' + u = 1/p + 3 k m u**2, with k = (2 + 2 gamma - beta)/3 in the standard
!      post-Newtonian parameters (Will 2014); the exact solution of the forced law has gamma = beta = 1, k = 1.
!      Rivals: a law whose space part reads nothing (gamma = 0, beta = 1, k = 1/3), and Nordstrom's scalar law
!      (gamma = -1, beta = 1/2, k = -1/6), which also bends no light. Fifty orbits at 20000 steps each; each
!      perihelion is located by one Newton step on u'.
!   C. Conservation on the model of Part VIII of the engine, where the curvature is K = -(1 + x**2): the divergence
!      of a Ric + b Scal g + c g along the first field of the frame is d/dx of (a + 2b) K + c. In two dimensions
!      the forced combination 2 Ric - Scal g vanishes identically, so its conservation there tests nothing and is
!      printed as a note, not counted as a check. The checks are the rival ratios, which are not conserved.
!   Measured inputs: GM of the Sun 1.32712440018e20 m**3/s**2, c = 299792458 m/s, solar radius 6.957e8 m;
!   gamma = 0.9998 +- 0.0004 from radio deflection (Shapiro et al. 2004); Mercury's semi-major axis 5.7909e10 m,
!   eccentricity 0.2056, period 87.969 days; observed advance 42.98 +- 0.04 arcsec a century (Will 2014).
! CONVENTION. A law agrees when it lies within two printed uncertainties; a rival is excluded beyond five.
! RISK. The exact solution integrated here is the one the paper derives in Lean (SPHYS_Schwarzschild_CC.lean and
!   SPHYS_Birkhoff_CC.lean): 1 - 2m/r, forced by the vacuum law. The equation of the orbit integrated in B and in
!   the second road of A is a theorem of the first file. The isotropic form, used for the optical index in the
!   first road of A, is the classical change of radial coordinate and is not formalised. The rival indices and the
!   rival weights k are standard post-Newtonian forms, entered. What is tested is the forced law's solution
!   against rivals.
! NON-NEGOTIABLE. Every check compares numbers this program integrated. A rival that passed would be printed FAIL.
program gravity_forced_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  real(dp), parameter :: GM = 1.32712440018e20_dp, c = 299792458.0_dp, Rs = 6.957e8_dp
  real(dp), parameter :: pi = 3.14159265358979323846_dp, asec = 206264.806247096_dp
  real(dp) :: d_orb, m, d_ex, d_lo2, d_hi2, d_lo5, d_hi5, d_newt, d_st, d_nord, adv, adv_r, adv_n, x, xx, worst, cc
  integer :: nfail, npass, i
  logical :: ok
  nfail = 0; npass = 0
  m = GM/(c*c)/Rs                                  ! the mass of the Sun in units of its radius

  ! A. the bending of light at the limb
  d_ex  = bend(m, -1.0_dp)*asec                    ! the exact solution of the forced law
  d_lo2 = bend(m, 0.9998_dp - 2.0_dp*0.0004_dp)*asec; d_hi2 = bend(m, 0.9998_dp + 2.0_dp*0.0004_dp)*asec
  d_lo5 = bend(m, 0.9998_dp - 5.0_dp*0.0004_dp)*asec; d_hi5 = bend(m, 0.9998_dp + 5.0_dp*0.0004_dp)*asec
  d_newt = bend(m, 0.0_dp)*asec                    ! rival: the space part reads nothing
  d_st   = bend(m, 0.99_dp)*asec                   ! rival: a scalar-tensor law with gamma = 0.99
  d_nord = 0.0_dp      ! rival: Nordstrom's scalar law. Its metric is conformally flat, so light runs straight;
                       ! this zero is that classical fact, entered, not integrated.
  write(*,'(a,f9.5,a)') '  light at the limb, exact solution of the forced law, integrated: ', d_ex, ' arcsec'
  write(*,'(a,f9.5,a,f9.5)') '  measured band, two uncertainties, integrated at its two ends: ', d_lo2, ' to ', d_hi2
  write(*,'(a,f9.5,a,f9.5)') '  measured band, five uncertainties:                           ', d_lo5, ' to ', d_hi5
  write(*,'(a,f9.5,a,f9.5)') '  rivals integrated: space part reading nothing ', d_newt, '; gamma = 0.99 ', d_st
  call check('A1 the forced law bends light inside two uncertainties of the measured band', &
       d_ex > d_lo2 .and. d_ex < d_hi2)
  call check('A2 a law whose space part reads nothing is excluded: outside five uncertainties', &
       d_newt < d_lo5 .or. d_newt > d_hi5)
  call check('A3 a scalar-tensor law with gamma = 0.99 is excluded: outside five uncertainties', &
       d_st < d_lo5 .or. d_st > d_hi5)
  d_orb = bend_orbit(m)*asec                       ! the second road: the orbit equation derived in Lean
  write(*,'(a,f9.5,a)') '  light at the limb, on the orbit equation derived in Lean, integrated: ', d_orb, ' arcsec'
  call check('A5 the two roads to the bending of light agree to 0.00005 arcsec', abs(d_orb - d_ex) < 5.0e-5_dp)
  write(*,'(a,f9.5)') '  rival, not integrated: a scalar law bends no light (conformal flatness): ', d_nord
  call check('A4 a scalar law of gravity is excluded by the bending of light', d_nord < d_lo5)

  ! B. the perihelion of Mercury
  adv   = advance(1.0_dp)
  adv_r = advance(1.0_dp/3.0_dp)
  adv_n = advance(-1.0_dp/6.0_dp)
  write(*,'(a,f8.3,a)') '  Mercury, exact solution, 50 orbits integrated: ', adv, ' arcsec a century'
  write(*,'(a,f8.3,a)') '  rival, space part reading nothing (k = 1/3):   ', adv_r, ' arcsec a century'
  write(*,'(a,f8.3,a)') '  rival, Nordstrom scalar law (k = -1/6):        ', adv_n, ' arcsec a century'
  call check('B1 the forced law advances the perihelion inside two uncertainties of 42.98 +- 0.04', &
       abs(adv - 42.98_dp) < 2.0_dp*0.04_dp)
  call check('B2 the law whose space part reads nothing is excluded: beyond five uncertainties', &
       abs(adv_r - 42.98_dp) > 5.0_dp*0.04_dp)
  call check('B3 the scalar law is excluded: the perihelion would retreat', adv_n < 0.0_dp)

  ! C. conservation on the model geometry, K = -(1 + x**2), by a centred difference of step 1e-4
  ok = .true.; worst = 0.0_dp
  do i = 1, 1000
    x = -3.0_dp + 6.0_dp*real(i, dp)/1000.0_dp; cc = real(mod(i*37, 101) - 50, dp)
    xx = divlaw(2.0_dp, -1.0_dp, cc, x); worst = max(worst, abs(xx))
    if (abs(xx) > 1.0e-6_dp) ok = .false.
  end do
  write(*,'(a,es9.2)') '  note: 2 Ric - Scal g + c g on the model, largest divergence over 1000 points:    ', worst
  if (.not. ok) nfail = nfail + 1                  ! a note, not a check: it holds identically in two dimensions
  write(*,'(a,f9.4,a,f9.4)') '  divergence at x = 1: Ricci alone ', divlaw(1.0_dp, 0.0_dp, 0.0_dp, 1.0_dp), &
        '; Ric - Scal g ', divlaw(1.0_dp, -1.0_dp, 0.0_dp, 1.0_dp)
  call check('C1 the Ricci curvature alone is not conserved on the model', &
       abs(divlaw(1.0_dp, 0.0_dp, 0.0_dp, 1.0_dp)) > 0.1_dp)
  call check('C2 nor is Ric - Scal g, the ratio one to minus one', &
       abs(divlaw(1.0_dp, -1.0_dp, 0.0_dp, 1.0_dp)) > 0.1_dp)

  write(*,'(a,i0,a,i0)') 'checks passed: ', npass, '   failures: ', nfail
contains
  ! gradient of ln n over r, as a factor of the position vector: (d ln n / dr) / r.  gam < 0 selects the exact solution.
  real(dp) function dlnn(mm, gam, r)
    real(dp), intent(in) :: mm, gam, r
    if (gam < 0.0_dp) then
      dlnn = (-1.5_dp*mm/(r*r)/(1.0_dp + 0.5_dp*mm/r) - 0.5_dp*mm/(r*r)/(1.0_dp - 0.5_dp*mm/r))/r
    else
      dlnn = (-gam*mm/(r*r)/(1.0_dp + 2.0_dp*gam*mm/r) - mm/(r*r)/(1.0_dp - 2.0_dp*mm/r))/r
    end if
  end function
  subroutine rhs(mm, gam, y, f)
    real(dp), intent(in) :: mm, gam, y(4)
    real(dp), intent(out) :: f(4)
    real(dp) :: r, gx, gy, vg
    r = sqrt(y(1)*y(1) + y(2)*y(2)); gx = dlnn(mm, gam, r)*y(1); gy = dlnn(mm, gam, r)*y(2)
    vg = y(3)*gx + y(4)*gy
    f(1) = y(3); f(2) = y(4); f(3) = gx - vg*y(3); f(4) = gy - vg*y(4)
  end subroutine
  ! total turning of a ray that starts parallel to the axis at height one solar radius, far before the Sun
  real(dp) function bend(mm, gam)
    real(dp), intent(in) :: mm, gam
    real(dp) :: y(4), k1(4), k2(4), k3(4), k4(4), h, r
    y = (/ -1.0e4_dp, 1.0_dp, 1.0_dp, 0.0_dp /)
    do while (y(1) < 1.0e4_dp)
      r = sqrt(y(1)*y(1) + y(2)*y(2)); h = 1.0e-3_dp*r
      call rhs(mm, gam, y, k1); call rhs(mm, gam, y + 0.5_dp*h*k1, k2)
      call rhs(mm, gam, y + 0.5_dp*h*k2, k3); call rhs(mm, gam, y + h*k3, k4)
      y = y + h*(k1 + 2.0_dp*k2 + 2.0_dp*k3 + k4)/6.0_dp
    end do
    bend = -atan2(y(4), y(3))
  end function
  ! bending of light of impact parameter one solar radius, on u'' + u = 3 m u**2 (kappa = 0 in `orbit_equation`).
  ! The first integral u'**2 = 1 - u**2 + 2 m u**3 fixes the closest approach u0; the ray is followed to u = 0.
  real(dp) function bend_orbit(mm)
    real(dp), intent(in) :: mm
    real(dp), parameter :: h = 1.0e-5_dp
    real(dp) :: u, w, phi, a1, a2, a3, a4, b1, b2, b3, b4, uold, wold
    integer :: j
    u = 1.0_dp
    do j = 1, 50                                             ! Newton on u**2 - 2 m u**3 = 1
      u = u - (u*u - 2.0_dp*mm*u*u*u - 1.0_dp)/(2.0_dp*u - 6.0_dp*mm*u*u)
    end do
    w = 0.0_dp; phi = 0.0_dp
    do
      uold = u; wold = w
      a1 = w;                 b1 = 3.0_dp*mm*u*u - u
      a2 = w + 0.5_dp*h*b1;   b2 = 3.0_dp*mm*(u + 0.5_dp*h*a1)**2 - (u + 0.5_dp*h*a1)
      a3 = w + 0.5_dp*h*b2;   b3 = 3.0_dp*mm*(u + 0.5_dp*h*a2)**2 - (u + 0.5_dp*h*a2)
      a4 = w + h*b3;          b4 = 3.0_dp*mm*(u + h*a3)**2 - (u + h*a3)
      u = u + h*(a1 + 2.0_dp*a2 + 2.0_dp*a3 + a4)/6.0_dp; w = w + h*(b1 + 2.0_dp*b2 + 2.0_dp*b3 + b4)/6.0_dp
      phi = phi + h
      if (u <= 0.0_dp) exit
    end do
    bend_orbit = 2.0_dp*(phi - u/w) - pi                     ! one Newton step back to u = 0, both halves of the ray
  end function
  ! perihelion advance of Mercury in arcsec a century, the nonlinear term weighted by kk
  real(dp) function advance(kk)
    real(dp), intent(in) :: kk
    real(dp), parameter :: a = 5.7909e10_dp, e = 0.2056_dp, per = 87.969_dp
    integer, parameter :: n = 20000, norb = 50
    real(dp) :: p, ms, h, u, w, phi, a1, a2, a3, a4, b1, b2, b3, b4, wold, first, last, acc
    integer :: j, found
    p = a*(1.0_dp - e*e); ms = GM/(c*c); h = 2.0_dp*pi/real(n, dp)
    u = (1.0_dp + e)/p; w = 1.0e-12_dp/p; phi = 0.0_dp; found = 0; first = 0.0_dp; last = 0.0_dp
    do j = 1, (norb + 1)*n
      wold = w
      a1 = w;                 b1 = 1.0_dp/p + 3.0_dp*kk*ms*u*u - u
      a2 = w + 0.5_dp*h*b1;   b2 = 1.0_dp/p + 3.0_dp*kk*ms*(u + 0.5_dp*h*a1)**2 - (u + 0.5_dp*h*a1)
      a3 = w + 0.5_dp*h*b2;   b3 = 1.0_dp/p + 3.0_dp*kk*ms*(u + 0.5_dp*h*a2)**2 - (u + 0.5_dp*h*a2)
      a4 = w + h*b3;          b4 = 1.0_dp/p + 3.0_dp*kk*ms*(u + h*a3)**2 - (u + h*a3)
      u = u + h*(a1 + 2.0_dp*a2 + 2.0_dp*a3 + a4)/6.0_dp; w = w + h*(b1 + 2.0_dp*b2 + 2.0_dp*b3 + b4)/6.0_dp
      phi = phi + h
      if (wold > 0.0_dp .and. w <= 0.0_dp) then               ! u has passed a maximum: a perihelion
        acc = 1.0_dp/p + 3.0_dp*kk*ms*u*u - u                 ! u'' here
        if (found == 0) first = phi - w/acc
        last = phi - w/acc; found = found + 1
        if (found == norb + 1) exit
      end if
    end do
    advance = ((last - first)/real(found - 1, dp) - 2.0_dp*pi)*asec*36525.0_dp/per
  end function
  ! divergence of a Ric + b Scal g + c g on the model, along the first field: in two dimensions Ric = K g, Scal = 2K
  real(dp) function divlaw(a, b, cc, x)
    real(dp), intent(in) :: a, b, cc, x
    real(dp), parameter :: h = 1.0e-4_dp
    divlaw = (coef(a, b, cc, x + h) - coef(a, b, cc, x - h))/(2.0_dp*h)
  end function
  real(dp) function coef(a, b, cc, x)
    real(dp), intent(in) :: a, b, cc, x
    real(dp) :: k
    k = -(1.0_dp + x*x)
    coef = a*k + b*2.0_dp*k + cc
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
end program gravity_forced_twin
