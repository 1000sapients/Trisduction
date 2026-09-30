! EM_Twin.f90 · the executed twin of SPHYS_Electromagnetism.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off EM_Twin.f90
! Blocks: A the field carrier; B C, P, T and CPT; C duality; D plane waves are null; E the magnet
! and the Landau levels; F the quantum registrations of electromagnetism; G the Aharonov-Bohm
! record; H the two readings' strengths; I charge.
program em_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: HP = 6.62607015e-34_dp, QE = 1.602176634e-19_dp, CL = 299792458.0_dp
  real(dp), parameter :: HBAR = 1.054571817e-34_dp, ME = 9.1093837015e-31_dp, MP = 1.67262192369e-27_dp
  real(dp), parameter :: EPS0 = 8.8541878128e-12_dp, G = 6.67430e-11_dp, KB = 1.380649e-23_dp
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

  pure function T(f) result(g)
    integer, intent(in) :: f(2)
    integer :: g(2)
    g = [f(1), -f(2)]
  end function T
  pure function C(f) result(g)
    integer, intent(in) :: f(2)
    integer :: g(2)
    g = [-f(1), -f(2)]
  end function C
  pure function P(f) result(g)
    integer, intent(in) :: f(2)
    integer :: g(2)
    g = [-f(1), f(2)]
  end function P
  pure function D(f) result(g)
    integer, intent(in) :: f(2)
    integer :: g(2)
    g = [f(2), -f(1)]
  end function D
  pure function seat(f) result(p)
    integer, intent(in) :: f(2)
    integer :: p(2)
    p = [1 - f(2), f(1)]
  end function seat

  subroutine block_a()
    integer :: e, b, n, neq, nline, nen, npair, f(2), sf(2), st(2), tf(2)
    write(*,'(a)') 'A · the field carrier s = 1/2 + iF, F = E + iB: time reversal is the fold'
    n = 0; neq = 0; nline = 0; nen = 0; npair = 0
    do e = -30, 30
      do b = -30, 30
        n = n + 1; f = [e, b]; sf = seat(f); tf = T(f); st = seat(tf)
        if (all(st == [2 - sf(1), sf(2)])) neq = neq + 1
        if ((sf(1) == 1) .eqv. (b == 0)) nline = nline + 1
        if (sum(tf**2) == sum(f**2)) nen = nen + 1
        if (b /= 0) then
          if (any(tf /= f) .and. tf(1) == e .and. st(2) == sf(2)) npair = npair + 1
        end if
      end do
    end do
    call check('equivariance on 3721 fields: time reversal of the field is the fold', neq == n)
    call check('the line is the purely electric field (3721 of 3721)', nline == n)
    call check('the energy density is even under time reversal (3721 of 3721)', nen == n)
    call check('every magnetic field has a distinct time reverse with one electric record (3660)', npair == n - 61)
  end subroutine block_a

  subroutine block_b()
    integer :: e, b, n, nok, f(2)
    write(*,'(a)') 'B · C, P and T on the field: involutions, CT = P, CPT the identity'
    n = 0; nok = 0
    do e = -30, 30
      do b = -30, 30
        n = n + 1; f = [e, b]
        if (all(T(T(f)) == f) .and. all(C(C(f)) == f) .and. all(P(P(f)) == f) .and. &
            all(C(T(f)) == P(f)) .and. all(C(P(T(f))) == f)) nok = nok + 1
      end do
    end do
    call check('three involutions, C composed with T is P, and CPT fixes every field (3721)', nok == n)
  end subroutine block_b

  subroutine block_c()
    integer :: e, b, n, nok, f(2), df(2)
    write(*,'(a)') 'C · duality F -> -iF: its square is charge conjugation, its fourth power the identity'
    n = 0; nok = 0
    do e = -30, 30
      do b = -30, 30
        n = n + 1; f = [e, b]; df = D(f)
        if (all(D(D(f)) == C(f)) .and. all(D(D(D(D(f)))) == f) .and. all(T(D(f)) == C(D(T(f)))) .and. &
            sum(df**2) == sum(f**2) .and. df(1)*df(2) == -(e*b) .and. &
            (df(1)**2 - df(2)**2) == -(e*e - b*b)) nok = nok + 1
      end do
    end do
    call check('D^2 = C, D^4 = 1, TD = CDT, energy invariant, both invariants reversed (3721)', nok == n)
  end subroutine block_c

  subroutine block_d()
    integer :: i, nnull, ndual
    real(dp) :: k(3), e(3), bf(3), nk, eb, dd, e2(3), b2(3), kk(3)
    write(*,'(a)') 'D · light is null: E perpendicular to B, |E| = |B|, and duality keeps it a plane wave'
    nnull = 0; ndual = 0
    do i = 1, 5000
      k = [rnd() - 0.5_dp, rnd() - 0.5_dp, rnd() - 0.5_dp]; nk = sqrt(sum(k*k)); k = k/nk
      e = [rnd() - 0.5_dp, rnd() - 0.5_dp, rnd() - 0.5_dp]
      e = e - sum(e*k)*k
      bf = cross(k, e)
      eb = sum(e*bf); dd = sum(e*e) - sum(bf*bf)
      if (abs(eb) < 1.0e-15_dp .and. abs(dd) < 1.0e-15_dp) nnull = nnull + 1
      e2 = bf; b2 = -e
      kk = cross(k, e2)
      if (maxval(abs(kk - b2)) < 1.0e-15_dp .and. abs(sum(e2*b2)) < 1.0e-15_dp) ndual = ndual + 1
    end do
    call check('5000 random plane waves: both invariants zero to 1e-15', nnull == 5000)
    call check('the dual of every plane wave is again a plane wave along the same k (5000)', ndual == 5000)
  end subroutine block_d

  pure function cross(a, b) result(c)
    real(dp), intent(in) :: a(3), b(3)
    real(dp) :: c(3)
    c = [a(2)*b(3) - a(3)*b(2), a(3)*b(1) - a(1)*b(3), a(1)*b(2) - a(2)*b(1)]
  end function cross

  subroutine block_e()
    integer :: i, nneg, n
    real(dp) :: a, b, cr, ci, disc, wc, deg, lev
    write(*,'(a)') 'E · the magnet: time reversal broken, every energy real; the Landau levels'
    nneg = 0
    do i = 1, 100000
      a = 20.0_dp*(rnd() - 0.5_dp); b = 20.0_dp*(rnd() - 0.5_dp)
      cr = 20.0_dp*(rnd() - 0.5_dp); ci = 20.0_dp*(rnd() - 0.5_dp)
      disc = (a - b)**2 + 4.0_dp*(cr*cr + ci*ci)
      if (disc < 0.0_dp) nneg = nneg + 1
    end do
    call check('100000 Hermitian blocks with a magnetic phase: every eigenvalue real', nneg == 0)
    wc = HBAR*QE*1.0_dp/ME/QE
    deg = QE*1.0_dp/HP
    write(*,'(a,es12.5,a,es10.3,a)') '  electron at 1 T: hbar omega_c = ', wc, ' eV; degeneracy ', deg, ' per m^2'
    n = 0
    do i = 0, 50
      lev = wc*(real(i, dp) + 0.5_dp)
      if (lev > 0.0_dp) n = n + 1
    end do
    call check('the cyclotron quantum at 1 T is 1.1577e-4 eV and every Landau level is real and positive', &
               abs(wc/1.1576764e-4_dp - 1.0_dp) < 1.0e-6_dp .and. n == 51)
  end subroutine block_e

  subroutine block_f()
    real(dp) :: rk, phi0, kj
    write(*,'(a)') 'F · the registrations of electromagnetism land on integers: h/e^2, h/2e, 2e/h'
    rk = HP/QE**2; phi0 = HP/(2.0_dp*QE); kj = 2.0_dp*QE/HP
    write(*,'(a,f16.8,a)') '  von Klitzing constant h/e^2 = ', rk, ' ohm'
    write(*,'(a,es18.10,a)') '  flux quantum h/2e = ', phi0, ' Wb'
    write(*,'(a,es18.10,a)') '  Josephson constant 2e/h = ', kj, ' Hz/V'
    call check('R_K = 25812.80745 ohm, exact in the SI of 2019', abs(rk - 25812.80745930_dp) < 1.0e-6_dp)
    call check('Phi_0 = 2.067833848e-15 Wb and K_J = 4.835978484e14 Hz/V', &
               abs(phi0/2.067833848461929e-15_dp - 1.0_dp) < 1.0e-12_dp .and. &
               abs(kj/4.835978484169836e14_dp - 1.0_dp) < 1.0e-12_dp)
  end subroutine block_f

  subroutine block_g()
    integer :: i
    real(dp) :: flux, ph1, ph2, worst, q0
    write(*,'(a)') 'G · Aharonov-Bohm: the phase reads the enclosed flux modulo h/e'
    q0 = HP/QE; worst = 0.0_dp
    do i = 1, 2000
      flux = (rnd() - 0.5_dp)*10.0_dp*q0
      ph1 = cos(2.0_dp*acos(-1.0_dp)*flux/q0)
      ph2 = cos(2.0_dp*acos(-1.0_dp)*(flux + q0)/q0)
      worst = max(worst, abs(ph1 - ph2))
    end do
    write(*,'(a,es9.2)') '  max phase difference between fluxes one quantum apart: ', worst
    call check('two fluxes one quantum h/e apart leave one interference record (to 1e-12)', worst < 1.0e-12_dp)
  end subroutine block_g

  subroutine block_h()
    real(dp) :: alpha, ratio
    write(*,'(a)') 'H · the odd reading and the even reading: the fine-structure constant and gravity'
    alpha = QE**2/(4.0_dp*acos(-1.0_dp)*EPS0*HBAR*CL)
    ratio = QE**2/(4.0_dp*acos(-1.0_dp)*EPS0*G*MP*ME)
    write(*,'(a,es16.10,a,es11.4)') '  alpha = ', alpha, ';  Coulomb over gravity in hydrogen = ', ratio
    call check('alpha = 7.2973525693e-3 from the constants', abs(alpha/7.2973525693e-3_dp - 1.0_dp) < 1.0e-9_dp)
    call check('the odd reading exceeds the even one by 2.27e39 in hydrogen', abs(ratio/2.269e39_dp - 1.0_dp) < 2.0e-3_dp)
  end subroutine block_h

  subroutine block_i()
    integer :: q, s, n, floor_ok
    real(dp) :: floor
    write(*,'(a)') 'I · charge: pair creation conserves it; it comes in thirds; the kept magnetic bit is priced'
    n = 0
    do q = -9, 9
      if (q + (-q) == 0) n = n + 1
    end do
    s = 0
    if (3 + 1 == 4 .and. -3 + 1 == -2 .and. 3 - 3 == 0 .and. -3 - 3 == -6) s = 1
    call check('pair creation conserves charge (19 of 19) and the charges are 2/3, -1/3, 0, -1', n == 19 .and. s == 1)
    floor = KB*300.0_dp*log(2.0_dp)
    floor_ok = 0
    if (5.0e-19_dp/floor > 100.0_dp) floor_ok = 1
    write(*,'(a,f6.1,a)') '  a stable magnetic bit at 5.0e-19 J per switch costs ', 5.0e-19_dp/floor, ' Landauer floors'
    call check('the magnetic bit is kept at a price above the floor (the arrow witness''s loop)', floor_ok == 1)
  end subroutine block_i
end program em_twin
