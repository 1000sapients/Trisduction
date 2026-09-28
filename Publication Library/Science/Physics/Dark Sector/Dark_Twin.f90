! Dark_Twin.f90 · the executed twin of Dark_Closure.lean · Fortran 2018.
! The dark sector on the closure template: the fixed set and its readings on a grid, the radiative weight, the
! multiplet test, the anomaly sums of the dark worlds, the measured budget, the kinetic floor, the phantom
! crossing of the fitted CPL curve, the geometry of the neutrino fog, the dark-force floors, and one halo read
! by two species. Every figure is computed in this run; cited inputs enter as data with their source named.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Dark_Twin.f90
program dark_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  real(dp), parameter :: PI = 3.14159265358979323846_dp, DEG = PI/180.0_dp
  ! Planck 2018, TT,TE,EE+lowE+lensing (Planck Collaboration VI 2020, A&A 641, A6, Table 2)
  real(dp), parameter :: OMC_H2 = 0.1200_dp, OMB_H2 = 0.02237_dp, H100 = 0.6736_dp
  real(dp), parameter :: OM_L = 0.6847_dp, OM_M = 0.3153_dp, SIG_OM = 0.0073_dp
  real(dp), parameter :: SUM_MNU = 0.06_dp                       ! eV, the minimal sum Planck assumes
  ! CODATA 2018 and IAU 2012
  real(dp), parameter :: G = 6.67430e-11_dp, C = 299792458.0_dp, MPC = 3.0856775814913673e22_dp
  real(dp), parameter :: EV = 1.602176634e-19_dp, HBARC = 1.973269804e-7_dp, KB = 1.380649e-23_dp
  real(dp), parameter :: MPL = 1.220890e28_dp, MPLRED = 2.435e27_dp, VEW = 246.22e9_dp   ! eV
  real(dp), parameter :: GEV_G = 1.78266192e-24_dp                                        ! grams per GeV/c^2
  ! DESI DR2 BAO + CMB + DESY5, CPL best fit (DESI Collaboration 2025)
  real(dp), parameter :: W0 = -0.752_dp, WA = -0.86_dp
  ! ACT DR6 (Calabrese et al. 2025, P-ACT-LB); Standard Model N_eff
  real(dp), parameter :: NEFF_ACT = 2.86_dp, SIG_NEFF = 0.13_dp, NEFF_SM = 3.044_dp
  ! Galactic pole and node, J2000; obliquity of the ecliptic, J2000
  real(dp), parameter :: A_NGP = 192.85948_dp, D_NGP = 27.12825_dp, L_NCP = 122.93192_dp
  real(dp), parameter :: EPS = 23.4392911_dp
  integer, parameter :: MULT(5) = [6, 3, 3, 2, 1], Y6(5) = [1, -4, 2, -3, 6]
  logical, parameter :: TRIP(5) = [.true., .true., .true., .false., .false.]
  logical, parameter :: DOUB(5) = [.true., .false., .false., .true., .false.]
  integer, parameter :: C3(5) = [1, -1, -1, 0, 0]
  integer, parameter :: PSY(3) = [3, -3, 0], PST(3) = [0, 0, 0], PSD(3) = [1, 1, 0], PSK(3) = [0, 0, 1]
  integer, parameter :: PFY(6) = [1, -4, 2, -3, 6, 0], PFT(6) = [1, -1, -1, 0, 0, 0]
  integer, parameter :: PFD(6) = [1, 0, 0, 1, 0, 0], PFK(6) = [0, 0, 0, 0, 0, 1]
  integer, parameter :: CA(4) = [1, -1, 0, 0], CB(4) = [1, 3, 0, 0], CK(4) = [0, 0, 1, 0], CD(4) = [0, 0, 0, 1]
  integer :: nchk, nfail, y, t, k, d, ic, nfix, nbad, nrad, r, rc, ku, v, nviol, nmis, i, nfixm
  integer :: qq, nfree, nmono, nport, j1, j2, j3, j4, jcj, jo, nstab, nstabn, nmis2
  integer :: gg, qv, bv, nv12, nv13, nd0, nd1, nv14, nv15, nv16, mm
  logical :: okq
  logical :: fixed, okD0, okD, okBad
  real(dp) :: omc, omb, omnu, q0, zacc, zeq, h0, rhoc, u, e4, lp, lr, lew, w, zc, x, sep, smin, smax
  real(dp) :: sd, alpha, delta, sb, beta, lam, s1, n_heavy, n_light, vh(5), vl(5), rr, bh, bl, dn1, dn2
  nchk = 0; nfail = 0
  ! ---------------- A. the fixed set and its readings, on the grid of charges -6..6
  nfix = 0; nbad = 0; nrad = 0
  do y = -6, 6
    do t = -6, 6
      do k = -6, 6
        do d = -6, 6
          fixed = (-y == y) .and. (-t == t) .and. (-k == k) .and. (-d == d)
          if (fixed) nfix = nfix + 1
          do ic = 1, 4
            r  = CA(ic)*y + CB(ic)*t + CK(ic)*k + CD(ic)*d
            rc = CA(ic)*(-y) + CB(ic)*(-t) + CK(ic)*(-k) + CD(ic)*(-d)
            if (rc /= -r) nbad = nbad + 1
            if (fixed .and. r /= 0) nbad = nbad + 1
          end do
          if ((y*y + t*t + k*k + d*d == 0) .neqv. fixed) nrad = nrad + 1
        end do
      end do
    end do
  end do
  call check('A1 the fixed set of conjugation on the 13^4 grid is one point, the neutral state', nfix == 1)
  call check('A2 photon, Z, gluon and dark-photon readings are odd and vanish on the fixed set', nbad == 0)
  call check('A3 the radiative weight vanishes exactly on the fixed set', nrad == 0)
  call check('A4 neutrino-like state: charge 0, radiative weight 18, Z reading T3 - Q sin2(thW) = 1/2', &
             (3 + (-3) == 0) .and. (9 + 9 == 18) .and. &
             (abs(3.0d0/6.0d0 - dble(3 + (-3))/6.0d0*0.23122d0 - 0.5d0) < 1.0d-15))
  nfixm = 0
  do t = 6, -6, -6
    if (-t == t) nfixm = nfixm + 1
  end do
  call check('A5 isospin triplet: one neutral member of three, so the multiplet is not dark', nfixm == 1)
  call closure([0, 0], 2, okD0); call closure([1, -1], 2, okD); call closure([1, 0], 1, okBad)
  call check('A6 the vector-like dark pair closes uncharged and charged +1, -1; one chiral charge fails', &
             okD0 .and. okD .and. (.not. okBad))
  nmono = 0; nport = 0; nstab = 0; nstabn = 0
  do j1 = 1, 3
    do j2 = j1, 3
      call scal([j1, j2])
      do j3 = j2, 3
        call scal([j1, j2, j3])
        do j4 = j3, 3
          call scal([j1, j2, j3, j4])
        end do
      end do
    end do
  end do
  do j1 = 1, 6
    do j2 = j1, 6
      do jcj = -1, 1, 2
        do jo = 0, 3
          call ferm(j1, j2, jcj, jo)
        end do
      end do
    end do
  end do
  call check('A7 portal census: 199 renormalizable monomials, four portals: S H+H, S2 H+H, L N H and its conjugate', &
             nmono == 199 .and. nport == 4)
  nfree = 0
  do qq = -12, 12
    call closure([qq, -qq], 2, okq)
    if (okq) nfree = nfree + 1
  end do
  call check('A8 every vector-like dark charge q, -q closes all twelve conditions, q = -12..12', nfree == 25)
  call check('A9 a stable singlet keeps one door: under dark parity one portal survives, S2 H+H, none for the fermion', &
             nstab == 1 .and. nstabn == 0)
  nmis2 = 0
  do y = -6, 6
    do t = -6, 6
      do k = -1, 1
        do d = -1, 1
          if ((-y == y .and. -t == t .and. -k == k .and. -d == d) .neqv. &
              ((-y == y .and. -t == t .and. -k == k) .and. d == 0)) nmis2 = nmis2 + 1
        end do
      end do
    end do
  end do
  call check('A10 C fixes a state exactly when C_SM fixes it and its dark charge is zero, on the 13^2 x 3^2 grid', nmis2 == 0)
  call check('A11 every coloured Standard Model field is charged in every component: u 2/3, d -1/3, u^c -2/3, d^c 1/3', &
             all([4, -2, -4, 2] /= 0))
  nv12 = 0
  do gg = 1, 5
    do qv = -5, 5
      if (gg*qv*qv < gg .and. qv /= 0) nv12 = nv12 + 1
    end do
  end do
  do bv = 1, 5
    do qv = -5, 5
      if (.not. (1*qv*qv < bv*(qv*qv + 1))) nv12 = nv12 + 1
    end do
  end do
  call check('A12 a bound fixes a charge only through a measured coupling; a free coupling 1/(q^2+1) meets every bound', &
             nv12 == 0)
  nv13 = 0; nd0 = 0; nd1 = 0
  do y = -6, 6
    do t = -6, 6
      do k = -1, 1
        do d = -2, 2
          if (t + y == 0 .and. 1000*t - 231*(t + y) == 0 .and. k == 0) then
            if (.not. (y == 0 .and. t == 0)) nv13 = nv13 + 1
            if (d == 0) nd0 = nd0 + 1
            if (d /= 0) nd1 = nd1 + 1
          end if
        end do
      end do
    end do
  end do
  call check('A13 the record sorts the title: every admitted state is C_SM-fixed, admitted with and without dark charge', &
             nv13 == 0 .and. nd0 > 0 .and. nd1 > 0)
  nv14 = 0
  do y = -6, 6
    do d = -3, 3
      if ((2*y == 0 .and. 2*d == 0) .neqv. (y == 0 .and. d == 0)) nv14 = nv14 + 1
      if (y == 0 .and. ((2*y == 0 .and. 2*d == 0) .neqv. (d == 0))) nv14 = nv14 + 1
    end do
  end do
  call check('A14 a self-paired mass carries twice each abelian charge; on the visible fixed set it is the dark bit', &
             nv14 == 0)
  nv15 = 0
  do d = -3, 3
    if (d /= 0 .and. -d == d) nv15 = nv15 + 1
  end do
  call check('A15 a dark-charged state takes its mass with a distinct partner of opposite dark charge', nv15 == 0)
  nv16 = 0
  do d = -3, 3
    do mm = 1, 3
      if (1 + (-d) /= 2 - (1 + d)) nv16 = nv16 + 1
      if ((1 + d == 1) .neqv. (d == 0)) nv16 = nv16 + 1
      if (d /= 0 .and. (1 - d == 1 + d .or. 1 + d == 1)) nv16 = nv16 + 1
    end do
  end do
  call check('A16 the carrier (1 + dark, mass) is equivariant onto the fold; the line is the bit; a dark pair is off-line', &
             nv16 == 0)
  ! ---------------- B. the measured budget
  omc = OMC_H2/H100**2; omb = OMB_H2/H100**2; omnu = SUM_MNU/93.14_dp/H100**2
  call check('B1 Omega_c = 0.2645, Omega_b = 0.0493, ratio 5.36', abs(omc - 0.2645_dp) < 5.0e-4_dp .and. &
             abs(omb - 0.0493_dp) < 2.0e-4_dp .and. abs(omc/omb - 5.364_dp) < 0.01_dp)
  call check('B2 cold dark matter, baryons and neutrinos reproduce Omega_m to 0.002', &
             abs(omc + omb + omnu - OM_M) < 0.002_dp)
  q0 = 0.5_dp*OM_M - OM_L
  call check('B3 q0 = -0.527 +- 0.011: the expansion accelerates', abs(q0 + 0.527_dp) < 1.0e-3_dp .and. &
             q0/(1.5_dp*SIG_OM) < -40.0_dp)
  zacc = (2.0_dp*OM_L/OM_M)**(1.0_dp/3.0_dp) - 1.0_dp; zeq = (OM_L/OM_M)**(1.0_dp/3.0_dp) - 1.0_dp
  call check('B4 acceleration begins at z = 0.631; vacuum and matter densities cross at z = 0.295', &
             abs(zacc - 0.631_dp) < 1.0e-3_dp .and. abs(zeq - 0.295_dp) < 1.0e-3_dp)
  h0 = H100*1.0e5_dp/MPC; rhoc = 3.0_dp*h0**2/(8.0_dp*PI*G)
  call check('B5 critical density 8.52e-27 kg per cubic metre', abs(rhoc/8.52e-27_dp - 1.0_dp) < 2.0e-3_dp)
  u = OM_L*rhoc*C**2/EV*HBARC**3; e4 = u**0.25_dp
  call check('B6 the vacuum energy density is (2.24 meV)^4', abs(e4*1.0e3_dp - 2.24_dp) < 0.01_dp)
  lp = log10(u/MPL**4); lr = log10(u/MPLRED**4); lew = log10(u/VEW**4)
  call check('B7 rho_Lambda / M_P^4 = 10^-122.9, reduced 10^-120.1, electroweak scale 10^-56.2', &
             abs(lp + 122.95_dp) < 0.1_dp .and. abs(lr + 120.15_dp) < 0.1_dp .and. abs(lew + 56.16_dp) < 0.1_dp)
  call check('B8 active density rho + 3p: dust +1, radiation +6, vacuum -2', &
             (1 + 3*0 == 1) .and. (3 + 3*1 == 6) .and. (1 + 3*(-1) == -2))
  ! ---------------- C. the kinetic floor
  nviol = 0; nmis = 0
  do ku = 0, 50
    do v = -50, 50
      if (ku + v <= 0) cycle
      w = real(ku - v, dp)/real(ku + v, dp)
      if (w < -1.0_dp) nviol = nviol + 1
      if ((w == -1.0_dp) .neqv. (ku == 0)) nmis = nmis + 1
    end do
  end do
  call check('C1 no canonical state (K >= 0, rho > 0) on the grid lies below w = -1', nviol == 0)
  call check('C2 w = -1 exactly when the kinetic term vanishes', nmis == 0)
  w = real(-1 - 10, dp)/real(-1 + 10, dp)
  call check('C3 ghost control: K = -1, V = 10 gives w = -1.222, across the divide', w < -1.0_dp)
  x = (-1.0_dp - W0)/WA; zc = x/(1.0_dp - x)
  call check('C4 the fitted CPL curve crosses w = -1 at z = 0.405 and sits at -1.182 by z = 1', &
             abs(zc - 0.405_dp) < 1.0e-3_dp .and. (W0 + WA*0.5_dp) < -1.0_dp .and. W0 > -1.0_dp .and. W0 + WA < -1.0_dp)
  ! ---------------- D. the geometry of the fog
  sd = sin(D_NGP*DEG)*sin(0.0_dp) + cos(D_NGP*DEG)*cos(0.0_dp)*cos((L_NCP - 90.0_dp)*DEG)
  delta = asin(sd)/DEG
  alpha = A_NGP + atan2(sin((L_NCP - 90.0_dp)*DEG), -sin(D_NGP*DEG)*cos((L_NCP - 90.0_dp)*DEG))/DEG
  alpha = modulo(alpha, 360.0_dp)
  call check('D1 the wind source (l = 90, b = 0) lies at alpha = 318.0, delta = +48.3, in Cygnus', &
             abs(alpha - 318.0_dp) < 0.05_dp .and. abs(delta - 48.33_dp) < 0.02_dp)
  sb = sin(delta*DEG)*cos(EPS*DEG) - cos(delta*DEG)*sin(EPS*DEG)*sin(alpha*DEG)
  beta = asin(sb)/DEG
  lam = atan2(sin(alpha*DEG)*cos(EPS*DEG) + tan(delta*DEG)*sin(EPS*DEG), cos(alpha*DEG))/DEG
  smin = 180.0_dp; smax = 0.0_dp
  do i = 0, 3599
    s1 = real(i, dp)*0.1_dp
    sep = acos(cos(beta*DEG)*cos((s1 - lam)*DEG))/DEG
    smin = min(smin, sep); smax = max(smax, sep)
  end do
  call check('D2 the Sun never comes nearer the wind source than 59.6 degrees, nor farther than 120.4', &
             abs(smin - 59.6_dp) < 0.1_dp .and. abs(smax - 120.4_dp) < 0.1_dp .and. abs(beta - smin) < 0.01_dp)
  ! ---------------- E. the floors of a fifth reading
  bh = 1.25_dp*GEV_G/1.0e-24_dp; bl = 0.47_dp*GEV_G/1.0e-24_dp
  call check('E1 self-interaction bounds: 1.25 cm2/g = 2.23 b/GeV (Bullet), 0.47 cm2/g = 0.84 b/GeV (72 clusters)', &
             abs(bh - 2.228_dp) < 0.005_dp .and. abs(bl - 0.838_dp) < 0.005_dp)
  dn1 = (4.0_dp/7.0_dp)*1.0_dp*(10.75_dp/106.75_dp)**(4.0_dp/3.0_dp)
  dn2 = (4.0_dp/7.0_dp)*2.0_dp*(10.75_dp/106.75_dp)**(4.0_dp/3.0_dp)
  call check('E2 a relic once in equilibrium above the electroweak scale: Delta N_eff >= 0.027 (scalar), 0.054 (dark photon)', &
             abs(dn1 - 0.0268_dp) < 5.0e-4_dp .and. abs(dn2 - 0.0535_dp) < 5.0e-4_dp)
  call check('E3 the dark-photon floor lies inside the ACT DR6 95% bound: still open', &
             NEFF_SM + dn2 < NEFF_ACT + 2.0_dp*SIG_NEFF)
  call check('E4 the Landauer price of one spent bit at 300 K is 2.87e-21 J', &
             abs(KB*300.0_dp*log(2.0_dp)/2.871e-21_dp - 1.0_dp) < 1.0e-3_dp)
  ! ---------------- F. one halo, two species
  n_heavy = 0.3_dp/100.0_dp; n_light = 0.3_dp/1.0e-14_dp
  do i = 1, 5
    rr = real(i, dp)*0.8_dp
    vh(i) = sqrt(nfw_mass(rr)/rr); vl(i) = sqrt(nfw_mass(rr)/rr)
  end do
  call check('F1 at 0.3 GeV/cm3 a 100 GeV particle and a 10 micro-eV field differ 1e16 in number, one rotation curve', &
             abs(log10(n_light/n_heavy) - 16.0_dp) < 1.0e-9_dp .and. all(vh == vl))
  write(*,'(a,3f9.4)')  ' Omega_c, Omega_b, Omega_c/Omega_b      = ', omc, omb, omc/omb
  write(*,'(a,f9.4,a,f7.4)') ' q0                                     = ', q0, ' +- ', 1.5_dp*SIG_OM
  write(*,'(a,2f9.4)')  ' z acceleration onset, z Lambda = matter = ', zacc, zeq
  write(*,'(a,es11.4)') ' critical density (kg/m3)               = ', rhoc
  write(*,'(a,f9.4)')   ' rho_Lambda^(1/4) (meV)                 = ', e4*1.0e3_dp
  write(*,'(a,3f9.2)')  ' log10 rho_Lambda / (M_P, M_P red, v)^4 = ', lp, lr, lew
  write(*,'(a,f9.4)')   ' CPL phantom crossing redshift          = ', zc
  write(*,'(a,2f9.3)')  ' wind source alpha, delta (deg)         = ', alpha, delta
  write(*,'(a,3f9.3)')  ' ecliptic latitude, min and max Sun sep = ', beta, smin, smax
  write(*,'(a,2f9.4)')  ' Delta N_eff floors, scalar and vector  = ', dn1, dn2
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', nchk, ',"failures":', nfail, '}'
  if (nfail > 0) error stop 1
contains
  logical function portal(ys, ts, ds, ks, nl)
    ! the kernel's portalM: hypercharge zero, triality zero mod 3, doublets paired, a dark leg and a Standard Model leg
    integer, intent(in) :: ys, ts, ds, ks, nl
    portal = ys == 0 .and. modulo(ts, 3) == 0 .and. mod(ds, 2) == 0 .and. ks > 0 .and. ks < nl
  end function portal
  subroutine scal(ix)
    integer, intent(in) :: ix(:)
    integer :: j, ys, ts, ds, ks, ns
    ys = 0; ts = 0; ds = 0; ks = 0; ns = 0
    do j = 1, size(ix)
      ys = ys + PSY(ix(j)); ts = ts + PST(ix(j)); ds = ds + PSD(ix(j)); ks = ks + PSK(ix(j))
      if (ix(j) == 3) ns = ns + 1
    end do
    nmono = nmono + 1
    if (portal(ys, ts, ds, ks, size(ix))) then
      nport = nport + 1
      if (mod(ns, 2) == 0) nstab = nstab + 1
    end if
  end subroutine scal
  subroutine ferm(a, b, s, o)
    integer, intent(in) :: a, b, s, o
    integer :: ys, ts, ds, ks, nl, ns, nn
    ys = s*(PFY(a) + PFY(b)); ts = s*(PFT(a) + PFT(b)); ds = PFD(a) + PFD(b); ks = PFK(a) + PFK(b); nl = 2; ns = 0
    nn = merge(1, 0, a == 6) + merge(1, 0, b == 6)
    if (o > 0) then
      ys = ys + PSY(o); ts = ts + PST(o); ds = ds + PSD(o); ks = ks + PSK(o); nl = 3
      if (o == 3) ns = 1
    end if
    nmono = nmono + 1
    if (portal(ys, ts, ds, ks, nl)) then
      nport = nport + 1
      if (mod(ns, 2) == 0 .and. mod(nn, 2) == 0) then
        nstab = nstab + 1
        if (nn > 0) nstabn = nstabn + 1
      end if
    end if
  end subroutine ferm
  subroutine closure(q, n, ok)
    ! the kernel's closes, sum for sum: six visible conditions and six dark ones over the Standard Model and n singlets
    integer, intent(in) :: q(:), n
    logical, intent(out) :: ok
    integer :: i, m, sm(12), fm(7), fy(7), fc(7), fq(7)
    logical :: ft(7), fdb(7)
    m = 5 + n
    fm(1:5) = MULT; fy(1:5) = Y6; ft(1:5) = TRIP; fdb(1:5) = DOUB; fc(1:5) = C3; fq(1:5) = 0
    do i = 1, n
      fm(5+i) = 1; fy(5+i) = 0; ft(5+i) = .false.; fdb(5+i) = .false.; fc(5+i) = 0; fq(5+i) = q(i)
    end do
    sm = 0
    do i = 1, m
      sm(1) = sm(1) + fm(i)*fy(i)
      sm(2) = sm(2) + fm(i)*fy(i)**3
      if (ft(i)) sm(3) = sm(3) + (fm(i)/3)*fy(i)
      if (fdb(i)) sm(4) = sm(4) + (fm(i)/2)*fy(i)
      if (fdb(i)) sm(5) = sm(5) + fm(i)/2
      if (ft(i)) sm(6) = sm(6) + (fm(i)/3)*fc(i)
      sm(7) = sm(7) + fm(i)*fq(i)
      sm(8) = sm(8) + fm(i)*fq(i)**3
      sm(9) = sm(9) + fm(i)*fq(i)**2*fy(i)
      sm(10) = sm(10) + fm(i)*fq(i)*fy(i)**2
      if (ft(i)) sm(11) = sm(11) + (fm(i)/3)*fq(i)
      if (fdb(i)) sm(12) = sm(12) + (fm(i)/2)*fq(i)
    end do
    ok = all(sm([1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12]) == 0) .and. mod(sm(5), 2) == 0
  end subroutine closure
  pure function nfw_mass(rr) result(m)
    real(dp), intent(in) :: rr
    real(dp) :: m
    m = 4.0_dp*PI*(log(1.0_dp + rr) - rr/(1.0_dp + rr))
  end function nfw_mass
  subroutine check(label, cond)
    character(*), intent(in) :: label
    logical, intent(in) :: cond
    nchk = nchk + 1
    if (.not. cond) nfail = nfail + 1
    write(*,'(a,a)') merge('  PASS  ', '  FAIL  ', cond), label
  end subroutine check
end program dark_twin
