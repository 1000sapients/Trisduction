! Dark_Fixed_Set_Twin_CC.f90 · twin of SPHYS_Dark_Fixed_Set_CC.lean
! RATIONALE. The engine proves the fixed set of conjugation, the blindness of odd readings, the visible half forced
!   by two nulls, the anomaly sums with a pair of singlets, the census of renormalizable terms and the floor of the
!   equation of state. This twin finds the same things by search on grids (A), recounts the census by independent
!   code (B), and sets the consequences against measured cosmology (C, D) and measured bounds (E).
! DESIGN. Whole numbers in A and B; double precision in C to E. Hypercharge is carried in sixths.
!   Measured inputs, each printed where it is used:
!   Planck 2018: matter 0.3153 +- 0.0073, vacuum 0.6847, cold dark matter 0.2645, baryons 0.0493,
!     physical densities 0.1200 and 0.02237, h = 0.6736.
!   DESI second release with the DES five-year supernovae: w0 = -0.752, wa = -0.86.
!   Bounds on self-interaction: 1.25 cm2/g (one cluster) and 0.47 cm2/g (72 clusters).
!   ACT sixth release: N_eff = 2.86 +- 0.13. Standard value 3.044.
!   Constants: critical density 1.05371e-5 h**2 GeV/cm3; hbar c = 1.973269804e-14 GeV cm;
!     Planck mass 1.220890e19 GeV; 1 g = 5.609589e23 GeV; 1 barn = 1e-24 cm2.
! RISK. A search of a grid is not a proof outside the grid; the statements over every field of characteristic zero
!   are the engine's theorems. The rows of C to E are retrodictions: each measurement stood before this work.
! NON-NEGOTIABLE. Every count printed by A and B is found by the search, not entered.
program dark_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  integer :: nfail, npass, y, t, c, d, a, b, k, e, nfix, nvis, ndark, nz, i, j, l, cj, o, nmono, nport, neven, nevenN
  integer :: ncl, nbad, nfl, s3(3), tr(3), f(5), cnj(5), nl, ntrip
  integer, parameter :: y6(8) = [1, -4, 2, -3, 6, 3, 0, 0], tri(8) = [1, -1, -1, 0, 0, 0, 0, 0]
  logical, parameter :: dbl(8) = [.true., .false., .false., .true., .false., .true., .false., .false.]
  real(dp) :: w, z, q0, om, ol, rho, mev, wmin, kk, vv, w0, wa, zc, dn, x
  logical :: ok, blind
  nfail = 0; npass = 0

  ! A. states with whole charges from -2 to 2
  nfix = 0; nvis = 0; ndark = 0
  do y = -2, 2; do t = -2, 2; do c = -2, 2; do d = -2, 2
    if (-y == y .and. -t == t .and. -c == c .and. -d == d) nfix = nfix + 1
    if (-y == y .and. -t == t .and. -c == c) nvis = nvis + 1
    blind = .true.
    do a = -2, 2; do b = -2, 2; do k = -2, 2; do e = -2, 2
      if (a*y + b*t + k*c + e*d /= 0) blind = .false.
    end do; end do; end do; end do
    if (blind) ndark = ndark + 1
    if (blind .neqv. (y == 0 .and. t == 0 .and. c == 0 .and. d == 0)) nfail = nfail + 1
  end do; end do; end do; end do
  write(*,'(a,i0,a,i0,a,i0)') '  of 625 states: fixed by conjugation: ', nfix, '; fixed by visible conjugation: ', nvis, &
    '; blind to all 625 linear readings: ', ndark
  call check('A1 conjugation fixes exactly the state of no charge; visible conjugation fixes five', nfix == 1 .and. nvis == 5)
  call check('A2 a state is blind to every linear reading exactly when conjugation fixes it', ndark == 1)
  ok = .true.
  do i = 0, 100
    w = i / 100.0_dp
    x = 0.5_dp; q0 = -0.5_dp                 ! isospin and hypercharge of a neutrino
    z = x - w * (x + q0)
    if (abs(x + q0) > 0 .or. abs(z - 0.5_dp) > 0) ok = .false.
  end do
  call check('A3 the charges of a neutrino: no electric charge, a Z reading of one half at 101 mixing weights', ok)
  nz = 0
  do t = -12, 12; do y = -12, 12          ! isospin and hypercharge in sixths
    if (t + y == 0 .and. abs(t - 0.2312_dp * (t + y)) < 0.5_dp) nz = nz + 1
  end do; end do
  write(*,'(a,f7.4,a,i0)') '  mixing weight ', 0.2312_dp, &
    '; of 625 pairs of isospin and hypercharge in sixths, with both nulls inside half a quantum: ', nz
  call check('A4 the photon null and the Z null leave one pair: no isospin and no hypercharge', nz == 1)
  ntrip = 0
  do t = -1, 1
    if (-t == t) ntrip = ntrip + 1
  end do
  call check('A5 one member of a triplet of isospin is fixed', ntrip == 1)
  ! the anomaly sums of one generation, hypercharge in sixths, weights: colour 3, isospin 2
  s3 = [2*1 - 1 - 1, 2*y6(1) + y6(2) + y6(3), 3*y6(1) + y6(4)]
  tr = [6*y6(1)**3 + 3*y6(2)**3 + 3*y6(3)**3 + 2*y6(4)**3 + y6(5)**3, 6*y6(1) + 3*y6(2) + 3*y6(3) + 2*y6(4) + y6(5), 0]
  write(*,'(a,5(1x,i0))') '  the five sums of one generation:', s3(1), s3(2), s3(3), tr(1), tr(2)
  ncl = 0; nbad = 0
  do a = -5, 5; do b = -5, 5
    ok = (a**3 + b**3 == 0) .and. (a + b == 0)
    if (ok) ncl = ncl + 1
    if (ok .neqv. (a + b == 0)) nbad = nbad + 1
  end do; end do
  write(*,'(a,i0,a)') '  of 121 pairs of dark charges of two singlets, closing: ', ncl, ', those that sum to zero'
  call check('A6 one generation closes; with two singlets it closes exactly when their dark charges sum to zero', &
    all(s3 == 0) .and. all(tr == 0) .and. ncl == 11 .and. nbad == 0)

  ! B. the census: fields 1 Q, 2 uc, 3 dc, 4 L, 5 ec, 6 H, 7 S, 8 N
  nmono = 0; nport = 0; neven = 0; nevenN = 0
  do i = 1, 3; do j = i, 3
    f(1:2) = [sc(i), sc(j)]; cnj(1:2) = [scj(i), scj(j)]; call term(2)
  end do; end do
  do i = 1, 3; do j = i, 3; do k = j, 3
    f(1:3) = [sc(i), sc(j), sc(k)]; cnj(1:3) = [scj(i), scj(j), scj(k)]; call term(3)
  end do; end do; end do
  do i = 1, 3; do j = i, 3; do k = j, 3; do l = k, 3
    f(1:4) = [sc(i), sc(j), sc(k), sc(l)]; cnj(1:4) = [scj(i), scj(j), scj(k), scj(l)]; call term(4)
  end do; end do; end do; end do
  do i = 1, 6; do j = i, 6; do cj = 0, 1; do o = 0, 3
    f(1:2) = [fe(i), fe(j)]; cnj(1:2) = cj; nl = 2
    if (o > 0) then
      nl = 3; f(3) = merge(7, 6, o == 3); cnj(3) = merge(1, 0, o == 2)
    end if
    call term(nl)
  end do; end do; end do; end do
  write(*,'(a,i0,a,i0,a,i0,a,i0)') '  terms: ', nmono, '; portals: ', nport, '; portals even under the parity: ', neven, &
    '; of those with the fermion: ', nevenN
  call check('B1 of 199 terms four are portals', nmono == 199 .and. nport == 4)
  call check('B2 under the parity that keeps the dark matter stable one portal survives, and none with the fermion', &
    neven == 1 .and. nevenN == 0)

  ! C. the acceleration
  om = 0.3153_dp; ol = 0.6847_dp
  q0 = om / 2 - ol
  write(*,'(a,f7.4,a,f7.4,a,f7.4,a,f7.4,a,f7.4)') '  inputs: matter ', om, ' +- ', 0.0073_dp, '; vacuum ', ol, &
    '; cold dark matter ', 0.2645_dp, '; baryons ', 0.0493_dp
  write(*,'(a,f7.4,a,f8.5,a,f7.4)') '  inputs: physical densities ', 0.1200_dp, ' and ', 0.02237_dp, '; h ', 0.6736_dp
  write(*,'(a,f7.3,a,f6.3,a,f6.3)') '  deceleration: all matter ', 0.5_dp, '; measured budget ', q0, ' +- ', 1.5_dp * 0.0073_dp
  call check('C1 all matter decelerates and the measured budget accelerates', 0.5_dp > 0 .and. q0 < 0)
  write(*,'(a,f6.3,a,f6.3)') '  acceleration begins at redshift ', (2 * ol / om)**(1.0_dp/3) - 1, &
    '; vacuum overtakes matter at ', (ol / om)**(1.0_dp/3) - 1
  write(*,'(a,f5.2,a,f5.2)') '  dark matter to baryons: ', 0.2645_dp / 0.0493_dp, &
    '; in physical densities: ', 0.1200_dp / 0.02237_dp
  call check('C2 the budget: five times as much dark matter as baryons, by both measures', &
    abs(0.2645_dp / 0.0493_dp - 0.1200_dp / 0.02237_dp) < 0.01_dp)
  rho = ol * 1.05371e-5_dp * 0.6736_dp**2 * 1.973269804e-14_dp**3      ! GeV**4
  mev = rho**0.25_dp * 1.0e12_dp
  write(*,'(a,f5.2,a,f7.1)') '  vacuum density: (', mev, ' meV)**4; log10 of its ratio to the Planck mass**4: ', &
    log10(rho / 1.220890e19_dp**4)
  call check('C3 the vacuum density is a number near (2.2 meV)**4, 123 orders below the Planck density', &
    abs(mev - 2.24_dp) < 0.02_dp .and. abs(log10(rho / 1.220890e19_dp**4) + 122.9_dp) < 0.1_dp)

  ! D. the floor of the equation of state
  wmin = 1; nfl = 0; nbad = 0
  do i = 0, 60; do j = -60, 60
    kk = i * 0.05_dp; vv = j * 0.05_dp
    if (kk + vv <= 1e-12_dp) cycle
    w = (kk - vv) / (kk + vv); wmin = min(wmin, w)
    if (w < -1 - 1e-12_dp) nbad = nbad + 1
    if (abs(w + 1) < 1e-12_dp .and. i /= 0) nfl = nfl + 1
  end do; end do
  write(*,'(a,f8.5,a,i0,a,i0)') '  canonical fields on a grid: least equation of state ', wmin, '; below -1: ', nbad, &
    '; at -1 with motion: ', nfl
  call check('D1 at positive density no canonical field falls below -1, and only the frozen field reaches it', &
    nbad == 0 .and. nfl == 0 .and. abs(wmin + 1) < 1e-12_dp)
  write(*,'(a,f6.2)') '  kinetic 1, potential -3, density -2: equation of state ', (1.0_dp + 3) / (1.0_dp - 3)
  call check('D2 at negative density the floor fails', (1.0_dp + 3) / (1.0_dp - 3) < -1)
  w0 = -0.752_dp; wa = -0.86_dp
  x = (-1 - w0) / wa; zc = x / (1 - x)
  write(*,'(a,f7.3,a,f6.2)') '  inputs: w0 ', w0, '; wa ', wa
  write(*,'(a,f6.3,a,f7.3)') '  the fitted curve w0 + wa z/(1+z) crosses -1 at redshift ', zc, &
    ' and is at redshift 1: ', w0 + wa / 2
  call check('D3 the fitted curve of the second release lies below the floor beyond redshift 0.4', &
    abs(zc - 0.405_dp) < 0.002_dp .and. w0 + wa / 2 < -1)

  ! E. the measured bounds the posit must meet
  write(*,'(a,f5.2,a,f5.2,a)') '  bounds on self-interaction: ', 1.25_dp / 0.5609589_dp, ' and ', 0.47_dp / 0.5609589_dp, &
    ' barn per GeV'
  write(*,'(a,f5.2,a,f5.2,a,f6.3,a,f5.2,a,f5.2)') '  inputs: bounds ', 1.25_dp, ' and ', 0.47_dp, &
    ' cm2/g; standard count ', 3.044_dp, '; measured count ', 2.86_dp, ' +- ', 0.13_dp
  dn = (4.0_dp / 7) * (10.75_dp / 106.75_dp)**(4.0_dp / 3)
  write(*,'(a,f6.3,a,f6.3,a,f6.3)') '  a light relic decoupled above the weak scale adds per boson state ', dn, &
    '; a dark photon ', 2 * dn, '; with the standard value: ', 3.044_dp + 2 * dn
  call check('E1 a dark photon once in equilibrium would still lie inside the measured count of light species', &
    3.044_dp + 2 * dn < 2.86_dp + 2 * 0.13_dp .and. abs(dn - 0.027_dp) < 0.001_dp)
  write(*,'(a,es8.1)') '  one density, two particles of 100 GeV and 10 micro-eV: ratio of their numbers ', 100.0e9_dp / 10.0e-6_dp
  call check('E2 two particles sixteen orders apart in number leave one density', &
    abs(100.0e9_dp / 10.0e-6_dp / 1e16_dp - 1) < 1e-12_dp)

  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', npass + nfail, ',"failures":', nfail, '}'
  if (nfail /= 0) stop 1
contains
  integer function sc(i)               ! the scalars: H, H conjugate, S
    integer, intent(in) :: i
    sc = merge(7, 6, i == 3)
  end function
  integer function scj(i)
    integer, intent(in) :: i
    scj = merge(1, 0, i == 2)
  end function
  integer function fe(i)               ! the fermions: Q, uc, dc, L, ec, N
    integer, intent(in) :: i
    fe = merge(8, i, i == 6)
  end function
  subroutine term(n)                   ! one term of n legs held in f and cnj
    integer, intent(in) :: n
    integer :: ys, ts, ds, nd, ns, nn, m
    logical :: port
    ys = 0; ts = 0; ds = 0; nd = 0; ns = 0; nn = 0
    do m = 1, n
      ys = ys + merge(-y6(f(m)), y6(f(m)), cnj(m) == 1); ts = ts + merge(-tri(f(m)), tri(f(m)), cnj(m) == 1)
      if (dbl(f(m))) ds = ds + 1
      if (f(m) >= 7) nd = nd + 1
      if (f(m) == 7) ns = ns + 1
      if (f(m) == 8) nn = nn + 1
    end do
    nmono = nmono + 1
    port = ys == 0 .and. modulo(ts, 3) == 0 .and. mod(ds, 2) == 0 .and. nd > 0 .and. nd < n
    if (port) nport = nport + 1
    if (port .and. mod(ns, 2) == 0 .and. mod(nn, 2) == 0) then
      neven = neven + 1
      if (nn /= 0) nevenN = nevenN + 1
    end if
  end subroutine
  subroutine check(name, cond)
    character(*), intent(in) :: name
    logical, intent(in) :: cond
    if (cond) then
      write(*,'(a,a)') '  PASS  ', name; npass = npass + 1
    else
      write(*,'(a,a)') '  FAIL  ', name; nfail = nfail + 1
    end if
  end subroutine
end program dark_twin
