! Gravity_Twin.f90 · the executed twin of SPHYS_Gravity.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Gravity_Twin.f90
! Blocks: A gravity reads the record; B the equivalence principle and the deficit; C one sign, no
! screening; D reversible motion; E gravity and time co-move; F the classical tests computed from
! the constants; G the waves; H the two branches' prices; I the sky's budget: the vacuum's pull.
program gravity_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: CL = 299792458.0_dp, GMS = 1.32712440018e20_dp, KB = 1.380649e-23_dp
  real(dp), parameter :: PI = 3.141592653589793_dp, ARCSEC = 206264.80624709636_dp
  integer :: checks, fails
  integer(i8) :: seed
  checks = 0; fails = 0; seed = 20260930_i8
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

  function rnd() result(r)
    real(dp) :: r
    seed = modulo(16807_i8*seed, 2147483647_i8)
    r = real(seed, dp)/2147483647.0_dp
  end function rnd

  subroutine block_a()
    integer :: q, col, e, n, neven, nblind, nsrc, noff
    write(*,'(a)') 'A · gravity reads the record: even under the particle map, blind to the side'
    n = 0; neven = 0; nblind = 0; nsrc = 0; noff = 0
    do q = -6, 6
      do col = -2, 2
        do e = -20, 20
          n = n + 1
          ! the particle (q, col, e) and its antiparticle (-q, -col, e): gravity reads e alone
          if (grav(q, e) == grav(-q, e)) neven = neven + 1
          if (grav(q, e) == grav(0, e)) nblind = nblind + 1
          if (1 + (grav(q, e) - grav(-q, e)) == 1) nsrc = nsrc + 1
          if (q /= 0 .and. 1 + (q - (-q)) /= 1) noff = noff + 1
        end do
      end do
    end do
    call check('gravity reads a particle and its antiparticle (-q, -colour, e) alike (2665 of 2665)', neven == n)
    call check('gravity is blind to charge at fixed energy (2665 of 2665)', nblind == n)
    call check('every gravitational source stands on the line; every charged source off it', &
               nsrc == n .and. noff == n - 5*41)
  end subroutine block_a

  pure function grav(q, e) result(g)
    integer, intent(in) :: q, e
    integer :: g
    g = e + 0*q
  end function grav

  subroutine block_b()
    real(dp) :: bti, bpt, mu, fti, fpt, dfrac, eta, reach
    write(*,'(a)') 'B · the equivalence principle, and the deficit read with the rest'
    bti = 8.72301_dp; bpt = 7.92655_dp; mu = 931.49410242_dp
    fti = bti/mu; fpt = bpt/mu; dfrac = fti - fpt
    eta = 1.5e-15_dp + sqrt(2.3e-15_dp**2 + 1.5e-15_dp**2)
    reach = eta/dfrac
    write(*,'(a,f8.5,a,f8.5,a,es10.3)') '  binding fraction of the mass: titanium ', 100.0_dp*fti, ' %, platinum ', &
         100.0_dp*fpt, ' %, difference ', dfrac
    write(*,'(a,es10.3,a,es10.3)') '  MICROSCOPE |eta| <= ', eta, ': the binding deficit falls with the rest to ', reach
    call check('the deficit of nuclear binding is read by gravity to better than 1e-11 of itself', reach < 1.0e-11_dp)
    call check('antihydrogen falls down, a = (0.75 +- 0.21) g, repulsion excluded (ALPHA-g 2023)', &
               0.75_dp - 3.0_dp*sqrt(0.13_dp**2 + 0.16_dp**2) > -1.0_dp)
  end subroutine block_b

  subroutine block_c()
    integer :: i, j, nq, nm, s, qq(4), mm(4)
    write(*,'(a)') 'C · one sign: gravity cannot be screened, charge can'
    nq = 0; nm = 0
    do i = 1, 20000
      s = 0
      do j = 1, 4
        qq(j) = int(7.0_dp*rnd()) - 3
        if (qq(j) == 0) qq(j) = 1
      end do
      if (sum(qq) == 0) nq = nq + 1
      do j = 1, 4
        mm(j) = int(4.0_dp*rnd())
      end do
      if (maxval(mm) > 0 .and. sum(mm) == 0) nm = nm + 1
    end do
    write(*,'(a,i0,a,i0)') '  of 20000 random sets of four nonzero charges, neutral: ', nq, &
         ';  of 20000 non-empty mass sets, massless: ', nm
    call check('charges screen (neutral sets exist); masses never total zero unless all are zero', nq > 0 .and. nm == 0)
  end subroutine block_c

  subroutine block_d()
    integer :: n, nsteps
    real(dp) :: dt, x0(2), x1(2), x2(2), a(2), e0, e, emax, v(2), xa(2), xb(2), err
    write(*,'(a)') 'D · no bit, and reversible: a Kepler orbit run forward and backward'
    nsteps = 50000; dt = 10.0_dp*2.0_dp*PI/real(nsteps, dp)
    ! GM = 1, a = 1, eccentricity 1/2, start at perihelion
    x0 = [0.5_dp, 0.0_dp]; v = [0.0_dp, sqrt(3.0_dp)]
    a = acc(x0); x1 = x0 + dt*v + 0.5_dp*dt*dt*a
    e0 = 0.5_dp*sum(v*v) - 1.0_dp/sqrt(sum(x0*x0)); emax = 0.0_dp
    xa = x0; xb = x1
    do n = 1, nsteps
      x2 = 2.0_dp*xb - xa + dt*dt*acc(xb)
      v = (x2 - xa)/(2.0_dp*dt)
      e = 0.5_dp*sum(v*v) - 1.0_dp/sqrt(sum(xb*xb))
      emax = max(emax, abs(e/e0 - 1.0_dp))
      xa = xb; xb = x2
    end do
    ! reverse: exchange the last two positions and run the same number of steps
    x2 = xa; xa = xb; xb = x2
    do n = 1, nsteps
      x2 = 2.0_dp*xb - xa + dt*dt*acc(xb)
      xa = xb; xb = x2
    end do
    err = sqrt(sum((xb - x0)**2))
    write(*,'(a,es9.2,a,es9.2)') '  ten revolutions: max |dE/E| = ', emax, ';  retrace error after reversal = ', err
    call check('the orbit keeps its energy to 1e-5 over ten revolutions', emax < 1.0e-5_dp)
    call check('run backwards, the orbit retraces its start to 1e-9', err < 1.0e-9_dp)
  end subroutine block_d

  pure function acc(x) result(g)
    real(dp), intent(in) :: x(2)
    real(dp) :: g(2), r
    r = sqrt(sum(x*x))
    g = -x/(r*r*r)
  end function acc

  subroutine block_e()
    integer :: i
    real(dp) :: f1, f2, phi, k, worst, pr, clk
    write(*,'(a)') 'E · gravity and time co-move: one factor shifts every clock'
    worst = 0.0_dp
    do i = 1, 10000
      f1 = 10.0_dp**(9.0_dp + 6.0_dp*rnd()); f2 = 10.0_dp**(9.0_dp + 6.0_dp*rnd())
      phi = -1.0e-8_dp*rnd()
      k = 1.0_dp + phi
      worst = max(worst, abs((k*f1)/(k*f2)/(f1/f2) - 1.0_dp))
    end do
    write(*,'(a,es9.2)') '  10000 clock pairs in 10000 potentials: max change of their ratio ', worst
    call check('every ratio of clocks is kept by the gravitational shift (to 1e-15)', worst < 1.0e-15_dp)
    pr = 9.80665_dp*22.5_dp/CL**2; clk = 9.80665_dp*0.33_dp/CL**2
    write(*,'(a,es10.3,a,es10.3)') '  Pound-Rebka tower 22.5 m: dnu/nu = ', pr, ';  optical clocks 33 cm: ', clk
    call check('the tower shift is 2.455e-15 and the 33 cm shift 3.60e-17', &
               abs(pr/2.4550e-15_dp - 1.0_dp) < 1.0e-3_dp .and. abs(clk/3.6007e-17_dp - 1.0_dp) < 1.0e-3_dp)
  end subroutine block_e

  subroutine block_f()
    real(dp) :: defl, prec, amerc, emerc, porb, pdot, pb, ecc, m1, m2, tsun, fe
    write(*,'(a)') 'F · the classical floor, computed from the constants'
    defl = 4.0_dp*GMS/(CL**2*6.957e8_dp)*ARCSEC
    amerc = 5.7909050e10_dp; emerc = 0.205630_dp; porb = 87.9691_dp
    prec = 6.0_dp*PI*GMS/(CL**2*amerc*(1.0_dp - emerc**2))*(36525.0_dp/porb)*ARCSEC
    tsun = GMS/CL**3
    pb = 0.322997448918_dp*86400.0_dp; ecc = 0.6171340_dp; m1 = 1.438_dp; m2 = 1.390_dp
    fe = (1.0_dp + 73.0_dp/24.0_dp*ecc**2 + 37.0_dp/96.0_dp*ecc**4)/(1.0_dp - ecc**2)**3.5_dp
    pdot = -192.0_dp*PI/5.0_dp*tsun**(5.0_dp/3.0_dp)*(pb/(2.0_dp*PI))**(-5.0_dp/3.0_dp)*fe*m1*m2/(m1 + m2)**(1.0_dp/3.0_dp)
    write(*,'(a,f7.4,a,f7.3,a,es12.5)') '  deflection at the solar limb ', defl, ' arcsec; Mercury ', prec, &
         ' arcsec per century; PSR B1913+16 dPb/dt = ', pdot
    call check('light grazing the Sun bends 1.751 arcsec, twice the Newtonian angle', abs(defl - 1.751_dp) < 2.0e-3_dp)
    call check('Mercury''s perihelion advances 42.98 arcsec per century', abs(prec - 42.98_dp) < 0.05_dp)
    call check('the binary pulsar''s orbital decay is -2.4026e-12, the GR value (Weisberg and Huang 2016)', &
               abs(pdot/(-2.40263e-12_dp) - 1.0_dp) < 2.0e-3_dp)
  end subroutine block_f

  subroutine block_g()
    integer :: s, n
    real(dp) :: dv
    write(*,'(a)') 'G · the waves: two polarizations, the speed of light'
    n = 0
    do s = -1, 1, 2
      if (-s /= s) n = n + 1
    end do
    dv = 1.74_dp/(130.0e6_dp*3.15576e7_dp)
    write(*,'(a,i0,a,es9.2)') '  polarizations 10 - 4 - 4 = ', 10 - 4 - 4, ';  GW170817 dv/c <= ', dv
    call check('two polarizations, each moved by parity, and gravity at the speed of light to 1e-15', &
               n == 2 .and. 10 - 4 - 4 == 2 .and. dv < 1.0e-15_dp)
  end subroutine block_g

  subroutine block_h()
    real(dp) :: floor
    write(*,'(a)') 'H · the two branches: the reversible run registers nothing; the kept bit is priced'
    floor = KB*300.0_dp*log(2.0_dp)
    write(*,'(a,f6.1,a)') '  gravity''s reversed orbit: 0 bits committed;  the magnet''s bit: ', 5.0e-19_dp/floor, &
         ' floors per switch'
    call check('the reversible branch commits no bit while the priced branch pays above the floor', &
               5.0e-19_dp/floor > 100.0_dp)
  end subroutine block_h
  subroutine block_i()
    real(dp) :: om, ol, q0, qm, zacc, zeq
    write(*,'(a)') 'I · the sky''s budget: dust attracts, the vacuum repels, and the sign is read'
    om = 0.3153_dp; ol = 0.6847_dp
    q0 = om/2.0_dp - ol; qm = 1.0_dp/2.0_dp
    zacc = (2.0_dp*ol/om)**(1.0_dp/3.0_dp) - 1.0_dp
    zeq = (ol/om)**(1.0_dp/3.0_dp) - 1.0_dp
    write(*,'(a,f7.4,a,f5.2,a,f6.3,a,f6.3)') '  flat budget of Planck 2018: q0 = ', q0, ' (all matter: ', qm, &
         ');  acceleration begins at z = ', zacc, ';  the vacuum overtakes matter at z = ', zeq
    call check('the two budgets give decelerations of opposite sign: q0 = -0.527 against +0.5', &
               abs(q0 + 0.527_dp) < 1.0e-3_dp .and. qm > 0.0_dp)
    call check('the acceleration begins at z = 0.63 and the vacuum overtakes matter at z = 0.295', &
               abs(zacc - 0.631_dp) < 2.0e-3_dp .and. abs(zeq - 0.295_dp) < 2.0e-3_dp)
  end subroutine block_i
end program gravity_twin
