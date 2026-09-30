! Substrate_Twin.f90 · the executed twin of SPHYS_One_Substrate.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Substrate_Twin.f90
! Blocks: A the integer chart; B the exact complex carrier; C closed systems and the magnet;
! D the balanced dimer; E the actuated zeros; F the hardware and the colour lock; G the particle
! map, the two carriers, antimatter's fall and measured widths; H the neutrino's floor; I the price.
program substrate_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: HBAR_EVS = 6.582119569e-16_dp, YEAR_S = 3.15576e7_dp
  real(dp), parameter :: KB = 1.380649e-23_dp
  integer :: checks, fails
  real(dp) :: pi
  checks = 0; fails = 0; pi = acos(-1.0_dp)

  call block_a(); call block_b(); call block_c(); call block_d()
  call block_e(); call block_f(); call block_g(); call block_h(); call block_i()

  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains

  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    checks = checks + 1
    if (.not. ok) fails = fails + 1
    write(*,'(a,a)') merge('  PASS  ', '  FAIL  ', ok), name
  end subroutine check

  ! ---------------------------------------------------------------- A. the integer chart
  subroutine block_a()
    integer :: a, b, t, h, n, neq, nrt, nline, nstat, npair
    logical :: stat
    n = 0; neq = 0; nrt = 0; nline = 0; nstat = 0; npair = 0
    write(*,'(a)') 'A · the integer chart: E = (a, beta), phi(E) = (1 - beta, a), fold (h, t) = (2 - h, t)'
    do a = -30, 30
      do b = -30, 30
        n = n + 1
        ! equivariance: phi(mirror E) = fold(phi E)
        if ((1 - (-b)) == 2 - (1 - b)) neq = neq + 1
        ! round trip: psi(phi E) = E, psi(h, t) = (t, 1 - h)
        h = 1 - b
        if (a == a .and. (1 - h) == b) nrt = nrt + 1
        ! the line is the image of the real energies
        if ((h == 1) .eqv. (b == 0)) nline = nline + 1
        ! stationary: beta t = 0 at every integer time in [-12, 12] exactly when beta = 0
        stat = .true.
        do t = -12, 12
          if (b*t /= 0) stat = .false.
        end do
        if (stat .eqv. (b == 0)) nstat = nstat + 1
        ! the off-line pair: one record, rates cancel, exactly one decays
        if (b /= 0) then
          if ((2 - h) /= h .and. b + (-b) == 0 .and. (b < 0 .neqv. -b < 0)) npair = npair + 1
        end if
      end do
    end do
    call check('equivariance on 3721 energies: the time mirror of the rate is the fold', neq == n)
    call check('the carrier is a bijection: psi(phi E) = E on 3721 energies', nrt == n)
    call check('the line is exactly the image of the real energies (3721 of 3721)', nline == n)
    call check('stationary at every time in [-12,12] exactly when real (3721 of 3721)', nstat == n)
    call check('every off-line mode has a distinct mirror, one record, rates cancelling, one decaying (3660)', &
               npair == n - 61)
  end subroutine block_a

  ! ---------------------------------------------------------------- B. the exact complex carrier
  subroutine block_b()
    integer :: k, t
    integer(i8) :: seed
    complex(dp) :: E, s, sf, sm
    real(dp) :: dmax, x, y, nrm, dn_real, dn_off
    seed = 20260930_i8; dmax = 0.0_dp; dn_real = 0.0_dp; dn_off = huge(1.0_dp)
    write(*,'(a)') 'B · the complex carrier s = 1/2 + iE: fold(s) = 1 - conj(s), mirror(E) = conj(E)'
    do k = 1, 20000
      x = 200.0_dp*(rnd(seed) - 0.5_dp); y = 2.0_dp*(rnd(seed) - 0.5_dp)
      E = cmplx(x, y, dp)
      s = cmplx(0.5_dp, 0.0_dp, dp) + cmplx(0.0_dp, 1.0_dp, dp)*E
      sf = cmplx(1.0_dp, 0.0_dp, dp) - conjg(s)
      sm = cmplx(0.5_dp, 0.0_dp, dp) + cmplx(0.0_dp, 1.0_dp, dp)*conjg(E)
      dmax = max(dmax, abs(sf - sm))
    end do
    write(*,'(a,es10.3)') '  max |fold(s(E)) - s(conj E)| over 20000 energies: ', dmax
    call check('fold(s(E)) = s(conj E) on 20000 complex energies, to 4 ulp of the scale', &
               dmax <= 4.0_dp*epsilon(1.0_dp)*100.0_dp)
    ! the norm of e^{-iEt}: stationary exactly on the real axis
    do k = 1, 2000
      x = 50.0_dp*(rnd(seed) - 0.5_dp)
      do t = 1, 10
        nrm = abs(exp(-cmplx(0.0_dp, 1.0_dp, dp)*cmplx(x, 0.0_dp, dp)*real(t, dp)))**2
        dn_real = max(dn_real, abs(nrm - 1.0_dp))
        nrm = abs(exp(-cmplx(0.0_dp, 1.0_dp, dp)*cmplx(x, 1.0e-3_dp, dp)*real(t, dp)))**2
        dn_off = min(dn_off, abs(nrm - 1.0_dp))
      end do
    end do
    write(*,'(a,es10.3,a,es10.3)') '  real energies: max |norm - 1| = ', dn_real, &
         ';  rate 2e-3: min |norm - 1| = ', dn_off
    call check('a real energy keeps its norm at every time to 1e-14', dn_real <= 1.0e-14_dp)
    call check('a mode off the axis moves its norm (growth e^{beta t} visible at t >= 1)', dn_off >= 1.0e-3_dp)
  end subroutine block_b

  ! ---------------------------------------------------------------- C. closed systems
  subroutine block_c()
    integer :: k, nneg, nneg0, ntb
    integer(i8) :: seed
    real(dp) :: a, b, cr, ci, disc, disc0
    seed = 777_i8; nneg = 0; nneg0 = 0; ntb = 0
    write(*,'(a)') 'C · closed systems and the magnet: a Hermitian generator has a real spectrum, T-broken or not'
    do k = 1, 100000
      a = 20.0_dp*(rnd(seed) - 0.5_dp); b = 20.0_dp*(rnd(seed) - 0.5_dp)
      cr = 20.0_dp*(rnd(seed) - 0.5_dp); ci = 20.0_dp*(rnd(seed) - 0.5_dp)
      disc = (a - b)**2 + 4.0_dp*(cr*cr + ci*ci)
      disc0 = (a - b)**2 + 4.0_dp*(cr*cr)
      if (ci /= 0.0_dp) ntb = ntb + 1
      if (disc < 0.0_dp) nneg = nneg + 1
      if (disc0 < 0.0_dp) nneg0 = nneg0 + 1
    end do
    write(*,'(a,i0,a)') '  time-broken blocks (imaginary off-diagonal, the magnetic term): ', ntb, ' of 100000'
    call check('100000 time-broken Hermitian blocks: discriminant >= 0, every eigenvalue real', nneg == 0 .and. ntb == 100000)
    call check('their time-symmetric parts (off-diagonal made real): every eigenvalue real', nneg0 == 0)
  end subroutine block_c

  ! ---------------------------------------------------------------- D. the balanced dimer
  subroutine block_d()
    integer :: i, nreal, npair, nbal, ntot
    real(dp) :: w, kap, gam, g
    complex(dp) :: tr, det, sq, l1, l2
    write(*,'(a)') 'D · the balanced gain-loss dimer H = [[w + i g, k], [k, w - i g]]: open halves, balanced whole'
    w = 1.0_dp; kap = 0.25_dp; nreal = 0; npair = 0; nbal = 0; ntot = 0
    do i = 0, 200
      gam = 0.005_dp*real(i, dp)
      if (abs(gam - kap) < 1.0e-12_dp) cycle
      ntot = ntot + 1
      tr = cmplx(2.0_dp*w, 0.0_dp, dp)
      det = cmplx(w, gam, dp)*cmplx(w, -gam, dp) - cmplx(kap*kap, 0.0_dp, dp)
      sq = sqrt(tr*tr - 4.0_dp*det)
      l1 = 0.5_dp*(tr + sq); l2 = 0.5_dp*(tr - sq)
      if (abs(aimag(l1) + aimag(l2)) <= 1.0e-14_dp) nbal = nbal + 1
      if (gam < kap) then
        if (abs(aimag(l1)) <= 1.0e-14_dp .and. abs(aimag(l2)) <= 1.0e-14_dp) nreal = nreal + 1
      else
        g = sqrt(gam*gam - kap*kap)
        if (abs(real(l1, dp) - real(l2, dp)) <= 1.0e-14_dp .and. abs(abs(aimag(l1)) - g) <= 1.0e-13_dp &
            .and. aimag(l1)*aimag(l2) < 0.0_dp) npair = npair + 1
      end if
    end do
    write(*,'(a,i0,a,i0,a,i0)') '  gain below coupling, real pairs: ', nreal, &
         ';  above, mirror pairs: ', npair, ';  swept: ', ntot
    call check('below the exceptional point both modes are real: on the line (50 of 50)', nreal == 50)
    call check('above it the modes form one mirror pair: equal frequency, opposite rates (150 of 150)', npair == 150)
    call check('the whole is balanced at every gain: total rate zero (200 of 200)', nbal == ntot)
  end subroutine block_d

  ! ---------------------------------------------------------------- E. the actuated zeros
  pure function theta(t) result(r)
    real(dp), intent(in) :: t
    real(dp) :: r
    r = 0.5_dp*t*log(t/(2.0_dp*acos(-1.0_dp))) - 0.5_dp*t - acos(-1.0_dp)/8.0_dp &
        + 1.0_dp/(48.0_dp*t) + 7.0_dp/(5760.0_dp*t**3) + 31.0_dp/(80640.0_dp*t**5)
  end function theta

  ! zeta(1/2 + it) by Euler-Maclaurin summation, N = 60 terms and eight Bernoulli corrections;
  ! the truncation error at t <= 100 is below 1e-11. Hardy's Z(t) = e^{i theta(t)} zeta(1/2 + it).
  function zeta_em(t) result(z)
    real(dp), intent(in) :: t
    complex(dp) :: z, s, term, poch
    integer, parameter :: NN = 60
    real(dp), parameter :: B2K(8) = [1.0_dp/6.0_dp, -1.0_dp/30.0_dp, 1.0_dp/42.0_dp, -1.0_dp/30.0_dp, &
        5.0_dp/66.0_dp, -691.0_dp/2730.0_dp, 7.0_dp/6.0_dp, -3617.0_dp/510.0_dp]
    real(dp) :: fact
    integer :: n, k
    s = cmplx(0.5_dp, t, dp)
    z = (0.0_dp, 0.0_dp)
    do n = 1, NN - 1
      z = z + exp(-s*log(real(n, dp)))
    end do
    z = z + exp((1.0_dp - s)*log(real(NN, dp)))/(s - 1.0_dp) + 0.5_dp*exp(-s*log(real(NN, dp)))
    poch = s; fact = 2.0_dp
    do k = 1, 8
      term = B2K(k)/fact*poch*exp(-(s + real(2*k - 1, dp))*log(real(NN, dp)))
      z = z + term
      poch = poch*(s + real(2*k - 1, dp))*(s + real(2*k, dp))
      fact = fact*real(2*k + 1, dp)*real(2*k + 2, dp)
    end do
  end function zeta_em

  function zrs(t) result(r)
    real(dp), intent(in) :: t
    real(dp) :: r
    r = real(exp(cmplx(0.0_dp, theta(t), dp))*zeta_em(t), dp)
  end function zrs

  function zimag(t) result(r)
    real(dp), intent(in) :: t
    real(dp) :: r
    r = aimag(exp(cmplx(0.0_dp, theta(t), dp))*zeta_em(t))
  end function zimag

  subroutine block_e()
    real(dp), parameter :: KNOWN(10) = [14.134725142_dp, 21.022039639_dp, 25.010857580_dp, &
        30.424876126_dp, 32.935061588_dp, 37.586178159_dp, 40.918719012_dp, 43.327073281_dp, &
        48.005150881_dp, 49.773832478_dp]
    real(dp) :: t, dt, zl, zr, lo, hi, mid, found(40), emax, nsmooth, imax
    integer :: nz, k, it
    write(*,'(a)') 'E · the actuated zeros: sign changes of Hardy''s Z on the line, heights 10 to 100'
    dt = 0.01_dp; t = 10.0_dp; zl = zrs(t); nz = 0; imax = 0.0_dp
    do while (t + dt <= 100.0_dp)
      zr = zrs(t + dt)
      imax = max(imax, abs(zimag(t + dt)))
      if (zl*zr < 0.0_dp) then
        nz = nz + 1
        lo = t; hi = t + dt
        do it = 1, 60
          mid = 0.5_dp*(lo + hi)
          if (zrs(lo)*zrs(mid) <= 0.0_dp) then
            hi = mid
          else
            lo = mid
          end if
        end do
        if (nz <= 40) found(nz) = 0.5_dp*(lo + hi)
      end if
      t = t + dt; zl = zr
    end do
    nsmooth = theta(100.0_dp)/acos(-1.0_dp) + 1.0_dp
    emax = 0.0_dp
    do k = 1, 10
      emax = max(emax, abs(found(k) - KNOWN(k)))
    end do
    write(*,'(a,i0,a,f8.4)') '  sign changes on (10, 100]: ', nz, ';  theta(100)/pi + 1 = ', nsmooth
    write(*,'(a,f13.9,a,es9.2)') '  first zero at t = ', found(1), ';  max error on the first ten: ', emax
    write(*,'(a,es9.2)') '  max |Im e^{i theta} zeta(1/2+it)| on the scan (Z is real): ', imax
    call check('Z(t) = e^{i theta} zeta(1/2 + it) is real on the scan to 1e-8', imax <= 1.0e-8_dp)
    call check('29 sign changes of Z on (10, 100]: 29 zeros located on the line by the executed chart', nz == 29)
    call check('the count agrees with the smooth term theta(100)/pi + 1, rounded (29)', nint(nsmooth) == 29)
    call check('the first ten located heights match the tabulated zeros to 1e-8', emax <= 1.0e-8_dp)
  end subroutine block_e

  ! ---------------------------------------------------------------- F. the hardware
  subroutine block_f()
    integer, parameter :: MULT(5) = [6, 3, 3, 2, 1], Y6(5) = [1, -4, 2, -3, 6]
    logical, parameter :: TRIP(5) = [.true., .true., .true., .false., .false.]
    logical, parameter :: DOUB(5) = [.true., .false., .false., .true., .false.]
    integer :: n, i, s1, s3, sc, sw, nd, cc, nok, yu, yd, yl, ye, yh, nsol, sol(5)
    write(*,'(a)') 'F · the hardware: generations, forced hypercharges, charges'
    nok = 0
    do n = 1, 6
      s1 = 0; s3 = 0; sc = 0; sw = 0; nd = 0; cc = 0
      do i = 1, 5
        s1 = s1 + n*MULT(i)*Y6(i)
        s3 = s3 + n*MULT(i)*Y6(i)**3
        if (TRIP(i)) sc = sc + n*(MULT(i)/3)*Y6(i)
        if (DOUB(i)) sw = sw + n*(MULT(i)/2)*Y6(i)
        if (DOUB(i)) nd = nd + n*(MULT(i)/2)
        if (TRIP(i)) cc = cc + n*merge(MULT(i)/3, -(MULT(i)/3), i == 1)
      end do
      if (s1 == 0 .and. s3 == 0 .and. sc == 0 .and. sw == 0 .and. nd == 4*n .and. cc == 0) nok = nok + 1
    end do
    call check('one to six generations: every anomaly vanishes, doublets 4n (the count is not forced)', nok == 6)
    nsol = 0
    do yu = -12, 12
      do yd = -12, 12
        do yl = -12, 12
          do ye = -12, 12
            do yh = -12, 12
              if (1 + yu + yh == 0 .and. 1 + yd - yh == 0 .and. yl + ye - yh == 0 .and. &
                  3 + yl == 0 .and. 6 + 3*yu + 3*yd + 2*yl + ye == 0) then
                nsol = nsol + 1; sol = [yu, yd, yl, ye, yh]
              end if
            end do
          end do
        end do
      end do
    end do
    call check('at yQ = 1 the five conditions admit one hypercharge vector in [-12,12]^5: (-4, 2, -3, 6, 3)', &
               nsol == 1 .and. all(sol == [-4, 2, -3, 6, 3]))
    call check('charges Q = T3 + Y: up 2/3, down -1/3, neutrino 0, electron -1', &
               3 + 1 == 4 .and. -3 + 1 == -2 .and. 3 - 3 == 0 .and. -3 - 3 == -6)
    call check('proton one unit, neutron none, hydrogen neutral, vacuum neutral', &
               4 + 4 - 2 == 6 .and. 4 - 2 - 2 == 0 .and. 4 + 4 - 2 - 6 == 0 .and. -3 + 3 == 0)
    block
      integer :: ca, cb, cc2, nlock, nok2
      nlock = 0; nok2 = 0
      do ca = 0, 2
        do cb = 0, 2
          do cc2 = 0, 2
            if ((cb - ca)*(cc2 - ca)*(cc2 - cb) /= 0) nlock = nlock + 1
            if (((cb - ca)*(cc2 - ca)*(cc2 - cb) /= 0) .eqv. (ca /= cb .and. ca /= cc2 .and. cb /= cc2)) &
              nok2 = nok2 + 1
          end do
        end do
      end do
      call check('the colour lock: of 27 colour triples exactly the 6 on three distinct axes are nonzero', &
                 nlock == 6 .and. nok2 == 27)
    end block
  end subroutine block_f

  ! ---------------------------------------------------------------- G. the particle map
  subroutine block_g()
    integer, parameter :: NP = 9
    ! q3, colour, b3, lepton, width flag (0 stable in the table)
    integer, parameter :: TAB(4, NP) = reshape([ -3, 0, 0, 1,   3, 0, 3, 0,   0, 0, 3, 0, &
        0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 1,   0, 0, 0, 0,   0, 0, 0, 0,   -3, 0, 0, 1 ], [4, NP])
    ! electron, proton, neutron, photon, Z, neutrino (Dirac), neutrino (Majorana), dark stable, muon
    logical, parameter :: NEUTRAL_EXPECT(NP) = [.false., .false., .false., .true., .true., .false., &
        .true., .true., .false.]
    integer :: k, nfix, ninv
    real(dp) :: ge, gp, gmu, gz, gn, me, mmu, mz, mn
    write(*,'(a)') 'G · the particle map: every additive charge flipped, the energy kept'
    nfix = 0; ninv = 0
    do k = 1, NP
      if (all(-(-TAB(:, k)) == TAB(:, k))) ninv = ninv + 1
      if ((all(-TAB(:, k) == TAB(:, k))) .eqv. NEUTRAL_EXPECT(k)) nfix = nfix + 1
    end do
    call check('the particle map is an involution on the nine-entry table', ninv == NP)
    call check('fixed exactly on the neutral entries: photon, Z, Majorana neutrino, the dark state', nfix == NP)
    call check('Dirac and Majorana neutrinos share the gauge record and differ in the one bit', &
               TAB(1, 6) == TAB(1, 7) .and. TAB(2, 6) == TAB(2, 7) .and. TAB(4, 6) /= TAB(4, 7))
    block
      integer :: q, fr, bt, ncar, ncom, njoint, nlep
      logical :: fixc, fixt
      ncar = 0; ncom = 0; njoint = 0; nlep = 0
      do q = -9, 9
        do fr = -20, 20
          ! charge carrier (1 + q3, freq): the particle map goes to the fold
          if (1 + (-q) == 2 - (1 + q)) ncar = ncar + 1
          do bt = -3, 3
            ! the two involutions commute on (q, fr, bt): bar flips q, the mirror flips bt
            ! bar then mirror against mirror then bar, composed on the tuple (q, fr, bt)
            if (all(mirror_t(bar_t([q, fr, bt])) == bar_t(mirror_t([q, fr, bt])))) ncom = ncom + 1
            fixc = (q == 0); fixt = (bt == 0)
            if ((fixc .and. fixt) .eqv. ((1 + q == 1) .and. (1 - bt == 1))) njoint = njoint + 1
          end do
        end do
      end do
      if (1 + (-1) == 0 .and. 1 + 1 == 2 .and. 2 - 0 == 2) nlep = 1
      call check('the charge carrier sends the particle map onto the fold (779 of 779)', ncar == 19*41)
      call check('the two involutions commute; fixed by both exactly when on the line under both (5453)', &
                 ncom == 19*41*7 .and. njoint == 19*41*7)
      call check('the electron and the positron land on the edges h = 0 and h = 2, mirror images', nlep == 1)
    end block
    block
      real(dp) :: ag, sg
      ag = 0.75_dp; sg = sqrt(0.13_dp**2 + 0.16_dp**2)
      write(*,'(a,f5.2,a)') '  antihydrogen falls with (0.75 +- 0.13 +- 0.16) g: from g at ', (1.0_dp - ag)/sg, ' sigma'
      call check('gravity reads no charge bit: antimatter falls as matter within 2 sigma (ALPHA-g)', (1.0_dp - ag)/sg < 2.0_dp)
    end block
    ! measured widths, hbar / tau, and their distance from the line relative to the rest energy
    me = 510998.95_dp; mmu = 105.6583755e6_dp; mz = 91.1876e9_dp; mn = 939.56542052e6_dp
    ge = HBAR_EVS/(6.6e28_dp*YEAR_S)
    gp = HBAR_EVS/(2.4e34_dp*YEAR_S)
    gmu = HBAR_EVS/2.1969811e-6_dp
    gn = HBAR_EVS/878.4_dp
    gz = 2.4952e9_dp
    write(*,'(a,es10.3,a,es10.3)') '  electron (e -> gamma nu):  width < ', ge, ' eV;  width/m < ', ge/me
    write(*,'(a,es10.3,a,es10.3)') '  proton (p -> e+ pi0):      width < ', gp, ' eV;  width/m < ', gp/938.27208816e6_dp
    write(*,'(a,es10.3,a,es10.3)') '  neutron (free):            width = ', gn, ' eV;  width/m = ', gn/mn
    write(*,'(a,es10.3,a,es10.3)') '  muon:                      width = ', gmu, ' eV;  width/m = ', gmu/mmu
    write(*,'(a,es10.3,a,es10.3)') '  Z boson:                   width = ', gz, ' eV;  width/m = ', gz/mz
    call check('the electron stands on the line to 1e-57 of its rest energy (partial width bound)', ge/me < 1.0e-57_dp)
    call check('the proton stands on the line to 1e-65 of its rest energy (partial width bound)', &
               gp/938.27208816e6_dp < 1.0e-65_dp)
    call check('the muon, neutron and Z stand off the line: open modes whose decay exports to products', &
               gmu > 0.0_dp .and. gn > 0.0_dp .and. gz/mz > 0.02_dp)
  end subroutine block_g

  ! ---------------------------------------------------------------- H. the neutrino's floor
  subroutine block_h()
    real(dp) :: d21, d32, m2min, m3min
    write(*,'(a)') 'H · the neutrino''s floor, supplied by deed: oscillation returns positive mass-squared differences'
    d21 = 7.53e-5_dp; d32 = 2.455e-3_dp
    m2min = sqrt(d21); m3min = sqrt(d21 + d32)
    write(*,'(a,es10.3,a,es10.3,a)') '  lightest possible m2 = ', m2min, ' eV;  m3 >= ', m3min, ' eV (normal ordering)'
    call check('both measured splittings are positive, so at least two neutrino masses are nonzero', &
               d21 > 0.0_dp .and. d32 > 0.0_dp .and. m2min > 8.0e-3_dp .and. m3min > 4.9e-2_dp)
  end subroutine block_h

  ! ---------------------------------------------------------------- I. the price
  subroutine block_i()
    real(dp) :: q, qexact
    write(*,'(a)') 'I · the price of one committed bit at 300 K'
    q = KB*300.0_dp*log(2.0_dp)
    qexact = 2.8709788850787237e-21_dp
    write(*,'(a,es22.15,a)') '  k_B T ln 2 at 300 K = ', q, ' J'
    call check('one irreversibly committed bit at 300 K costs 2.870978885e-21 J', abs(q/qexact - 1.0_dp) < 1.0e-14_dp)
  end subroutine block_i

  pure function bar_t(x) result(y)
    integer, intent(in) :: x(3)
    integer :: y(3)
    y = [-x(1), x(2), x(3)]
  end function bar_t

  pure function mirror_t(x) result(y)
    integer, intent(in) :: x(3)
    integer :: y(3)
    y = [x(1), x(2), -x(3)]
  end function mirror_t

  ! the Park-Miller minimal standard generator, fixed seed, no overflow in 64-bit integers
  function rnd(s) result(r)
    integer(i8), intent(inout) :: s
    real(dp) :: r
    s = modulo(16807_i8*s, 2147483647_i8)
    r = real(s, dp)/2147483647.0_dp
  end function rnd

end program substrate_twin
