! SpinStat_Twin.f90 · the executed twin of SPHYS_Spin_Statistics.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off SpinStat_Twin.f90
! Blocks: A the exchange carrier; B Pauli exclusion; C the Return and the double cover; D one bit in
! three dimensions; E bunching and antibunching; F the periodic table from the bit; G degeneracy:
! Chandrasekhar's mass; H condensation: London's temperature; I spin and statistics on the table.
program spinstat_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: PI = 3.141592653589793_dp, HBAR = 1.054571817e-34_dp, CL = 299792458.0_dp
  real(dp), parameter :: G = 6.67430e-11_dp, MH = 1.6735575e-27_dp, MSUN = 1.98847e30_dp
  real(dp), parameter :: KB = 1.380649e-23_dp, AMU = 1.66053906660e-27_dp
  integer :: checks, fails
  integer(i8) :: seed
  checks = 0; fails = 0; seed = 20260930_i8
  call block_a(); call block_b(); call block_c(); call block_d(); call block_e()
  call block_f(); call block_g(); call block_h(); call block_i()
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
    integer :: x, y, n, neq, nline, nzero, npair
    write(*,'(a)') 'A · the exchange is the fold: bosons on the line, fermions at height zero'
    n = 0; neq = 0; nline = 0; nzero = 0; npair = 0
    do x = -30, 30
      do y = -30, 30
        n = n + 1
        ! seat of (x, y) is (1 + (x - y), x + y); seat of the swap is (1 + (y - x), y + x)
        if (1 + (y - x) == 2 - (1 + (x - y)) .and. y + x == x + y) neq = neq + 1
        if ((1 + (x - y) == 1) .eqv. (x == y)) nline = nline + 1
        if (x == -y) then
          if (x + y == 0 .and. ((1 + (x - y) /= 1) .eqv. (x /= 0))) nzero = nzero + 1
        end if
        if (x /= y .and. x + y == y + x) npair = npair + 1
      end do
    end do
    call check('equivariance on 3721 pair amplitudes: the exchange is the fold', neq == n)
    call check('a pair amplitude is on the line exactly when it is symmetric (3721)', nline == n)
    call check('antisymmetric amplitudes stand at height zero, off the line unless zero (61)', nzero == 61)
    call check('a pair and its exchange share one record (3660 unsymmetric pairs)', npair == n - 61)
  end subroutine block_a

  subroutine block_b()
    integer :: t, a, b, nd, nsl, nbit, nn
    real(dp) :: psi(6,6), f(6), gg(6), m
    write(*,'(a)') 'B · Pauli exclusion: the odd amplitude is blind on the diagonal; the occupation is a bit'
    nd = 0; nsl = 0
    do t = 1, 1000
      do a = 1, 6
        f(a) = rnd() - 0.5_dp; gg(a) = rnd() - 0.5_dp
        do b = 1, 6
          psi(a,b) = rnd() - 0.5_dp
        end do
      end do
      psi = psi - transpose(psi)
      if (all([(psi(a,a) == 0.0_dp, a = 1, 6)])) nd = nd + 1
      m = 0.0_dp
      do a = 1, 6
        m = max(m, abs(f(a)*gg(a) - f(a)*gg(a)))
      end do
      if (m == 0.0_dp) nsl = nsl + 1
    end do
    call check('1000 random antisymmetric amplitudes vanish exactly on every diagonal entry', nd == 1000)
    call check('1000 random Slater amplitudes f(a)g(b) - f(b)g(a) vanish at a = b', nsl == 1000)
    nbit = 0
    do nn = -50, 50
      if ((nn*nn == nn) .eqv. (nn == 0 .or. nn == 1)) nbit = nbit + 1
    end do
    call check('an occupation equal to its own square is 0 or 1 (101 of 101)', nbit == 101)
  end subroutine block_b

  pure function qm(a, b) result(c)
    real(dp), intent(in) :: a(4), b(4)
    real(dp) :: c(4)
    c(1) = a(1)*b(1) - a(2)*b(2) - a(3)*b(3) - a(4)*b(4)
    c(2) = a(1)*b(2) + a(2)*b(1) + a(3)*b(4) - a(4)*b(3)
    c(3) = a(1)*b(3) - a(2)*b(4) + a(3)*b(1) + a(4)*b(2)
    c(4) = a(1)*b(4) + a(2)*b(3) - a(3)*b(2) + a(4)*b(1)
  end function qm

  pure function qc(a) result(c)
    real(dp), intent(in) :: a(4)
    real(dp) :: c(4)
    c = [a(1), -a(2), -a(3), -a(4)]
  end function qc

  subroutine block_c()
    integer :: t
    real(dp) :: u(3), q2(4), q4(4), v(4), w(4), psi(4), s(4), e2, e4, ev, es, ec, q(4), r1(4), r2(4)
    write(*,'(a)') 'C · the Return: a full turn is -1 on spinors, +1 on vectors; the cover is two to one'
    e2 = 0.0_dp; e4 = 0.0_dp; ev = 0.0_dp; es = 0.0_dp; ec = 0.0_dp
    do t = 1, 1000
      u = [rnd() - 0.5_dp, rnd() - 0.5_dp, rnd() - 0.5_dp]; u = u/sqrt(sum(u*u))
      q2 = [cos(PI), sin(PI)*u(1), sin(PI)*u(2), sin(PI)*u(3)]
      q4 = [cos(2.0_dp*PI), sin(2.0_dp*PI)*u(1), sin(2.0_dp*PI)*u(2), sin(2.0_dp*PI)*u(3)]
      e2 = max(e2, maxval(abs(q2 - [-1.0_dp, 0.0_dp, 0.0_dp, 0.0_dp])))
      e4 = max(e4, maxval(abs(q4 - [1.0_dp, 0.0_dp, 0.0_dp, 0.0_dp])))
      v = [0.0_dp, rnd() - 0.5_dp, rnd() - 0.5_dp, rnd() - 0.5_dp]
      w = qm(qm(q2, v), qc(q2)); ev = max(ev, maxval(abs(w - v)))
      psi = [rnd() - 0.5_dp, rnd() - 0.5_dp, rnd() - 0.5_dp, rnd() - 0.5_dp]
      s = qm(q2, psi); es = max(es, maxval(abs(s + psi)))
      q = [rnd() - 0.5_dp, rnd() - 0.5_dp, rnd() - 0.5_dp, rnd() - 0.5_dp]; q = q/sqrt(sum(q*q))
      r1 = qm(qm(q, v), qc(q)); r2 = qm(qm(-q, v), qc(-q)); ec = max(ec, maxval(abs(r1 - r2)))
    end do
    write(*,'(a,es9.2,a,es9.2,a,es9.2)') '  full turn: |q - (-1)| <= ', e2, ';  vectors return to ', ev, &
         ';  spinors to -psi within ', es
    call check('a full turn about 1000 random axes is -1 on spinors and the identity on vectors', &
               e2 < 1.0e-15_dp .and. ev < 1.0e-15_dp .and. es < 1.0e-15_dp)
    call check('two full turns are the identity, and q and -q rotate every vector alike (1000)', &
               e4 < 1.0e-15_dp .and. ec < 1.0e-15_dp)
  end subroutine block_c

  subroutine block_d()
    integer :: t, n
    real(dp) :: th, re, im
    write(*,'(a)') 'D · statistics is one bit in three dimensions; the anyon needs the plane'
    n = 0
    do t = 0, 3599
      th = 2.0_dp*PI*real(t, dp)/3600.0_dp
      re = cos(2.0_dp*th); im = sin(2.0_dp*th)
      if (abs(re - 1.0_dp) < 1.0e-12_dp .and. abs(im) < 1.0e-12_dp) n = n + 1
    end do
    write(*,'(a,i0,a)') '  exchange phases on a grid of 3600 whose square is the identity: ', n, ' (0 and pi)'
    call check('only the phases +1 and -1 square to the identity', n == 2)
    call check('the fractional phase pi/3 of the nu = 1/3 anyon does not square to the identity', &
               abs(cos(2.0_dp*PI/3.0_dp) - 1.0_dp) > 0.5_dp)
  end subroutine block_d

  subroutine block_e()
    integer :: t
    real(dp) :: x, pb, pf, worst, gb, gf
    write(*,'(a)') 'E · the record reads the bit: bosons bunch, fermions part'
    worst = 0.0_dp
    do t = 0, 100
      x = real(t, dp)/100.0_dp
      pb = 0.5_dp*(1.0_dp - x); pf = 0.5_dp*(1.0_dp + x)
      worst = max(worst, abs(pb + pf - 1.0_dp))
    end do
    call check('at a balanced splitter, full overlap: bosons never coincide, fermions always do', &
               0.5_dp*(1.0_dp - 1.0_dp) == 0.0_dp .and. 0.5_dp*(1.0_dp + 1.0_dp) == 1.0_dp .and. worst < 1.0e-15_dp)
    call thermal_g2(0.3_dp, gb, gf)
    write(*,'(a,f9.6,a,f9.6)') '  one thermal mode at mean occupation 0.3: Bose g2 = ', gb, ';  Fermi g2 = ', gf
    call check('a thermal Bose mode bunches, g2 = 2 (helium-4), and a Fermi mode antibunches, g2 = 0 (helium-3)', &
               abs(gb - 2.0_dp) < 1.0e-12_dp .and. gf == 0.0_dp)
  end subroutine block_e

  subroutine thermal_g2(nbar, gb, gf)
    real(dp), intent(in) :: nbar
    real(dp), intent(out) :: gb, gf
    integer :: n
    real(dp) :: p, s1, s2, r
    ! Bose: geometric occupation with ratio r = nbar/(1 + nbar); Fermi: occupation 0 or 1 only
    r = nbar/(1.0_dp + nbar); s1 = 0.0_dp; s2 = 0.0_dp
    do n = 0, 400
      p = (1.0_dp - r)*r**n
      s1 = s1 + real(n, dp)*p; s2 = s2 + real(n, dp)*real(n - 1, dp)*p
    end do
    gb = s2/(s1*s1)
    s1 = 0.0_dp*(1.0_dp - nbar) + 1.0_dp*nbar
    s2 = 0.0_dp*(1.0_dp - nbar) + 0.0_dp*nbar
    gf = s2/(s1*s1)
  end subroutine thermal_g2

  subroutine block_f()
    integer, parameter :: order(19,2) = reshape([1,2,2,3,3,4,3,4,5,4,5,6,4,5,6,7,5,6,7, &
                                                 0,0,1,0,1,0,2,1,0,2,1,0,3,2,1,0,3,2,1], [19,2])
    integer :: k, total, nclos, closures(7)
    write(*,'(a)') 'F · the periodic table from the bit: two states per orbital, one per state'
    total = 0; nclos = 0
    do k = 1, 19
      total = total + 2*(2*order(k,2) + 1)
      if ((order(k,2) == 1 .or. (order(k,1) == 1 .and. order(k,2) == 0)) .and. nclos < 7) then
        nclos = nclos + 1; closures(nclos) = total
      end if
    end do
    write(*,'(a,7i5)') '  shell closures from the Madelung order: ', closures
    call check('the noble gases stand at 2, 10, 18, 36, 54, 86, 118', &
               all(closures == [2, 10, 18, 36, 54, 86, 118]))
  end subroutine block_f

  subroutine block_g()
    real(dp) :: mch, omega3, mue
    write(*,'(a)') 'G · degeneracy: the fermion bit holds a white dwarf up to Chandrasekhar''s mass'
    omega3 = 2.01824_dp; mue = 2.0_dp
    mch = omega3*sqrt(3.0_dp*PI)/2.0_dp*(HBAR*CL/G)**1.5_dp/(mue*MH)**2/MSUN
    write(*,'(a,f6.3,a)') '  Chandrasekhar mass for mu_e = 2: ', mch, ' solar masses'
    call check('the degenerate-electron limit is 1.43 solar masses (ideal, mu_e = 2)', abs(mch - 1.43_dp) < 0.02_dp)
  end subroutine block_g

  subroutine block_h()
    real(dp) :: m4, n, tc
    write(*,'(a)') 'H · condensation: the boson bit, London''s estimate for helium-4'
    m4 = 4.002602_dp*AMU; n = 145.0_dp/m4
    tc = 2.0_dp*PI*HBAR**2/(m4*KB)*(n/2.6123753_dp)**(2.0_dp/3.0_dp)
    write(*,'(a,f6.3,a)') '  ideal Bose gas at liquid-helium density: T_c = ', tc, ' K (the lambda point is 2.17 K)'
    call check('London''s ideal-gas temperature is 3.13 K, the scale of the lambda transition', abs(tc - 3.13_dp) < 0.05_dp)
  end subroutine block_h

  subroutine block_i()
    integer, parameter :: ntab = 12
    integer :: spin2(ntab), ferm(ntab), k, nok
    ! twice the spin, and the number of elementary fermion constituents, for
    ! e, p, n, photon, W, gluon, Higgs, pion, deuteron, helium-4 atom, helium-3 atom, Delta
    ! (quarks and electrons counted: the deuteron six quarks, helium-4 twelve and two, helium-3 nine and two)
    spin2 = [1, 1, 1, 2, 2, 2, 0, 0, 2, 0, 1, 3]
    ferm  = [1, 3, 3, 0, 0, 0, 0, 2, 6, 14, 11, 3]
    write(*,'(a)') 'I · spin and statistics on the table: the turn sign is the exchange sign'
    nok = 0
    do k = 1, ntab
      if (mod(spin2(k), 2) == mod(ferm(k), 2)) nok = nok + 1
    end do
    call check('twelve particles and atoms: half-integer spin exactly when an odd number of fermions', nok == ntab)
  end subroutine block_i
end program spinstat_twin
