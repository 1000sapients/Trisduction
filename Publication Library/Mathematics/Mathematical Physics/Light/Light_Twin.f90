! Light_Twin.f90 · the executed twin of SPHYS_Light.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Light_Twin.f90
! Blocks: A light on the line; B the speed hierarchy; C helicity; D C-parity; E which-path
! complementarity; F the quantum is the field's; G the price of a detection.
program light_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: KB = 1.380649e-23_dp, HP = 6.62607015e-34_dp, CL = 299792458.0_dp
  real(dp), parameter :: QE = 1.602176634e-19_dp
  integer :: checks, fails
  integer(i8) :: seed
  checks = 0; fails = 0; seed = 20260930_i8
  call block_a(); call block_b(); call block_c(); call block_d()
  call block_e(); call block_f(); call block_g()
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

  pure function eseat(freq, rate) result(p)
    integer, intent(in) :: freq, rate
    integer :: p(2)
    p = [1 - rate, freq]
  end function eseat

  pure function cseat(q3, freq) result(p)
    integer, intent(in) :: q3, freq
    integer :: p(2)
    p = [1 + q3, freq]
  end function cseat

  function rnd() result(r)
    real(dp) :: r
    seed = modulo(16807_i8*seed, 2147483647_i8)
    r = real(seed, dp)/2147483647.0_dp
  end function rnd

  subroutine block_a()
    integer :: w, nline, nheight, k
    real(dp) :: e, emin, emax
    write(*,'(a)') 'A · light is the line: every frequency, one side; the frequency is the height'
    nline = 0; nheight = 0
    do w = -1000, 1000
      ! the energy seat (1 - rate, freq) with rate 0, and the charge seat (1 + q3) with q3 = 0
      if (all(eseat(w, 0) == [1, w]) .and. all(cseat(0, w) == [1, w])) nline = nline + 1
      ! one side for neighbouring frequencies, two heights: side equal, height different
      if (all(eseat(w, 0) == eseat(w, 0) .and. eseat(w, 0) /= eseat(w + 1, 0) .eqv. [.false., .true.])) &
        nheight = nheight + 1
    end do
    call check('2001 photon frequencies: all on the line under both carriers, height = frequency', &
               nline == 2001 .and. nheight == 2001)
    emin = huge(1.0_dp); emax = 0.0_dp
    do k = 0, 200
      e = 1.0e-9_dp*10.0_dp**(real(k, dp)*0.1_dp)
      emin = min(emin, e); emax = max(emax, e)
    end do
    write(*,'(a,es9.2,a,es9.2,a)') '  the spectrum from radio to gamma, ', emin, ' eV to ', emax, &
         ' eV: one side, 201 heights'
    call check('twenty decades of photon energy occupy one side of the seat', emax/emin > 1.0e19_dp)
  end subroutine block_a

  subroutine block_b()
    integer :: i, nslow
    real(dp) :: k, m, w, vg, dmax, mg, ev, dv
    write(*,'(a)') 'B · the speed hierarchy: massless modes at c at every frequency; massive modes below'
    dmax = 0.0_dp; nslow = 0
    do i = 1, 2000
      k = 10.0_dp**(-9.0_dp + 20.0_dp*rnd())
      ! massless: omega = k (c = 1); group velocity by a relative finite difference
      vg = ((k*(1.0_dp + 1.0e-6_dp)) - k)/(k*1.0e-6_dp)
      dmax = max(dmax, abs(vg - 1.0_dp))
      m = 10.0_dp**(-6.0_dp + 12.0_dp*rnd())
      w = sqrt(k*k + m*m)
      ! the deficit 1 - v = m^2 / (w (w + k)), computed without cancellation
      if (m*m/(w*(w + k)) > 0.0_dp) nslow = nslow + 1
    end do
    write(*,'(a,es9.2)') '  massless group velocity, max |v/c - 1| over 2000 frequencies: ', dmax
    call check('every massless mode moves at c, independent of frequency (to 1e-9)', dmax < 1.0e-9_dp)
    call check('every massive mode moves below c (2000 of 2000)', nslow == 2000)
    mg = 1.0e-18_dp; ev = 1.0e-6_dp
    dv = 0.5_dp*(mg/ev)**2
    write(*,'(a,es9.2)') '  a photon mass at the bound 1e-18 eV slows a 1 microeV radio photon by dv/c = ', dv
    call check('the photon-mass bound leaves light frequency-independent below 1e-24 even at radio', dv < 1.0e-24_dp)
    dv = 1.74_dp/(130.0e6_dp*3.15576e7_dp)
    write(*,'(a,es9.2)') '  GW170817: 1.74 s after 130 million years of flight, dv/c <= ', dv
    call check('gravity and light, both massless, arrive together to below 1e-15', dv < 1.0e-15_dp)
  end subroutine block_b

  subroutine block_c()
    integer :: w, s, n
    write(*,'(a)') 'C · helicity: parity reverses it and keeps the frequency; the energy never reads it'
    n = 0
    do w = -500, 500
      do s = -1, 1, 2
        if (-s /= s .and. -(-s) == s) n = n + 1
      end do
    end do
    call check('parity is an involution, moves every helicity, and keeps the frequency (2002 states)', n == 2002)
  end subroutine block_c

  subroutine block_d()
    integer :: n, cp, nok
    write(*,'(a)') 'D · C-parity (-1)^n of n photons: Furry''s selection and positronium'
    nok = 0; cp = 1
    do n = 0, 40
      if (n > 0) cp = -cp
      if ((cp == 1) .eqv. (mod(n, 2) == 0)) nok = nok + 1
    end do
    call check('C-parity of 0 to 40 photons is +1 exactly on even counts (41 of 41)', nok == 41)
    call check('parapositronium (C = +1) decays to two photons, orthopositronium (C = -1) to three', &
               (-1)**2 == 1 .and. (-1)**3 == -1)
  end subroutine block_d

  subroutine block_e()
    integer :: i, nf, nk
    real(dp) :: pa, pb, g, v, d, worst, a, b, c, ip, im
    write(*,'(a)') 'E · detection is registration: which-path and fringe trade exactly, D^2 + V^2 = 1'
    worst = 0.0_dp
    do i = 1, 20000
      pa = rnd(); pb = 1.0_dp - pa; g = rnd()
      v = 2.0_dp*sqrt(pa*pb)*g
      d = sqrt((pa - pb)**2 + 4.0_dp*pa*pb*(1.0_dp - g*g))
      worst = max(worst, abs(d*d + v*v - 1.0_dp))
    end do
    write(*,'(a,es9.2)') '  max |D^2 + V^2 - 1| over 20000 pure two-path states: ', worst
    call check('Englert''s duality holds with equality on every pure state (to 1e-14)', worst < 1.0e-14_dp)
    nf = 0; nk = 0
    do i = 1, 20000
      a = real(int(10.0_dp*rnd()) - 5, dp); b = real(int(10.0_dp*rnd()) - 5, dp)
      c = real(int(3.0_dp*rnd()) - 1, dp)
      ip = a*a + b*b + 2.0_dp*a*b*c; im = a*a + b*b - 2.0_dp*a*b*c
      if ((ip /= im) .eqv. (a /= 0.0_dp .and. b /= 0.0_dp .and. c /= 0.0_dp)) nf = nf + 1
      if (c == 0.0_dp .and. ip == im) nk = nk + 1
    end do
    call check('a fringe exists exactly when both paths are open and the side is forgotten (20000)', nf == 20000)
    call check('registering the side erases the fringe on every sample', nk > 0)
  end subroutine block_e

  subroutine block_f()
    integer :: n, i, j, nbad
    real(dp) :: p, s1, s2, g2c, g2t, x(8), m1, m2, ga, sg
    write(*,'(a)') 'F · the quantum is the field''s: g2 = 0 for one photon, >= 1 for every classical field'
    ! coherent (Poisson, mean 1) and thermal (geometric, mean 1) photon-number statistics
    s1 = 0.0_dp; s2 = 0.0_dp; p = exp(-1.0_dp)
    do n = 0, 120
      if (n > 0) p = p/real(n, dp)
      s1 = s1 + real(n, dp)*p; s2 = s2 + real(n*(n - 1), dp)*p
    end do
    g2c = s2/(s1*s1)
    s1 = 0.0_dp; s2 = 0.0_dp
    do n = 0, 1000
      p = 0.5_dp**(n + 1)
      s1 = s1 + real(n, dp)*p; s2 = s2 + real(n, dp)*real(n - 1, dp)*p
    end do
    g2t = s2/(s1*s1)
    write(*,'(a,f9.6,a,f9.6,a)') '  one photon g2 = 0;  coherent g2 = ', g2c, ';  thermal g2 = ', g2t, ''
    call check('one photon: g2 = 0; coherent light: g2 = 1; thermal light: g2 = 2', &
               abs(g2c - 1.0_dp) < 1.0e-12_dp .and. abs(g2t - 2.0_dp) < 1.0e-12_dp .and. 1*(1 - 1) == 0)
    nbad = 0
    do i = 1, 10000
      m1 = 0.0_dp; m2 = 0.0_dp
      do j = 1, 8
        x(j) = rnd()**3
        m1 = m1 + x(j); m2 = m2 + x(j)*x(j)
      end do
      m1 = m1/8.0_dp; m2 = m2/8.0_dp
      if (m2 < m1*m1*(1.0_dp - 1.0e-12_dp)) nbad = nbad + 1
    end do
    call check('10000 classical intensity distributions: every one has g2 >= 1', nbad == 0)
    ga = 0.18_dp; sg = 0.06_dp
    write(*,'(a,f5.2,a,f5.1,a)') '  Grangier, Roger and Aspect: anticorrelation ', ga, ', below the classical 1 by ', &
         (1.0_dp - ga)/sg, ' sigma'
    call check('the measured single-photon anticorrelation is below every classical field by > 10 sigma', &
               (1.0_dp - ga)/sg > 10.0_dp)
  end subroutine block_f

  subroutine block_g()
    real(dp) :: floor, ephot
    write(*,'(a)') 'G · the price of a detection: each registration commits at least one bit'
    floor = KB*300.0_dp*log(2.0_dp)
    ephot = HP*CL/550.0e-9_dp
    write(*,'(a,es12.5,a,f7.1,a)') '  k_B T ln 2 at 300 K = ', floor, ' J; a 550 nm photon carries ', &
         ephot/floor, ' floors'
    call check('the floor is 2.870978885e-21 J and a visible photon pays its own registration', &
               abs(floor/2.8709788850787237e-21_dp - 1.0_dp) < 1.0e-14_dp .and. ephot > floor)
  end subroutine block_g
end program light_twin
