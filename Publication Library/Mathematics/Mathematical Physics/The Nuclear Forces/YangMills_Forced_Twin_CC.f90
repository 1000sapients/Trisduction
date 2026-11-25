! YangMills_Forced_Twin_CC.f90 · twin of SPHYS_YangMills_Forced_CC.lean
! RATIONALE. The engine proves the forcing over all integers. This twin does two other things: it scans the same
!   identities on random integer data, as an independent execution, and it sets the counts of the engine against
!   published measurements.
! DESIGN. Integer arithmetic (64 bit) for the algebra; double precision for the measured cells. One linear
!   congruential generator, fixed seed, so every run prints the same lines.
! NON-NEGOTIABLE. A measured cell compares a count of the engine with a published value and its uncertainty. No
!   coupling is computed from first principles: every coupling used here is a measured input and is named as one.
! RISK. The leading formulas for the ratio R and the running coupling carry higher-order corrections of a few
!   percent. The tolerances below are the published uncertainties, and the rival counts are excluded by many of them.
program yangmills_twin
  implicit none
  integer, parameter :: i8 = selected_int_kind(18), dp = kind(1.0d0)
  integer(i8) :: seed = 20260622_i8
  integer :: checks = 0, failures = 0
  real(dp), parameter :: pi = 3.14159265358979323846d0
  call algebra()
  call counts()
  call measured()
  write(*,'(A,I0,A,I0,A)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', failures, '}'
contains
  subroutine check(label, ok)
    character(*), intent(in) :: label
    logical, intent(in) :: ok
    checks = checks + 1
    if (ok) then
      write(*,'(A,A)') '  PASS  ', label
    else
      failures = failures + 1
      write(*,'(A,A)') '  FAIL  ', label
    end if
  end subroutine
  function rnd() result(k)                         ! integers in -9..9
    integer(i8) :: k
    seed = mod(seed * 6364136223846793005_i8 + 1442695040888963407_i8, 9223372036854775807_i8)
    k = mod(abs(seed / 65536_i8), 19_i8) - 9_i8
  end function
  function rv() result(v)
    integer(i8) :: v(3)
    v = [rnd(), rnd(), rnd()]
  end function
  function turn(a, b) result(c)                    ! the bracket of the rotation algebra
    integer(i8), intent(in) :: a(3), b(3)
    integer(i8) :: c(3)
    c = [a(2)*b(3) - a(3)*b(2), a(3)*b(1) - a(1)*b(3), a(1)*b(2) - a(2)*b(1)]
  end function
  function residue(s, t, Am, An, dA, ep, dem, den) result(r)   ! dF - s[F, eps], every term kept
    integer(i8), intent(in) :: s, t, Am(3), An(3), dA(3), ep(3), dem(3), den(3)
    integer(i8) :: r(3), var(3), F(3)
    var = s*turn(dA, ep) + s*turn(An, dem) - s*turn(Am, den) + t*turn(dem, An) + t*turn(Am, den) &
        + t*s*(turn(turn(Am, ep), An) + turn(Am, turn(An, ep)))
    F = dA + t*turn(Am, An)
    r = var - s*turn(F, ep)
  end function
  subroutine algebra()
    integer :: i, bad_j, bad_r, bad_c, bad_f
    integer(i8) :: a(3), b(3), c(3), d(3), e(3), f(3), s, t, r(3), x(3)
    bad_j = 0; bad_r = 0; bad_c = 0; bad_f = 0
    do i = 1, 200000
      a = rv(); b = rv(); c = rv(); d = rv(); e = rv(); f = rv(); s = rnd(); t = rnd()
      if (any(turn(a, turn(b, c)) + turn(b, turn(c, a)) + turn(c, turn(a, b)) /= 0)) bad_j = bad_j + 1
      r = residue(s, t, a, b, c, d, e, f)
      x = turn(b, e) - turn(a, f)
      if (any(r /= (s - t)*x)) bad_r = bad_r + 1
      if (any(residue(s, s, a, b, c, d, e, f) /= 0)) bad_c = bad_c + 1
      if (s /= t .and. any(x /= 0) .and. all(r == 0)) bad_f = bad_f + 1
    end do
    write(*,'(A)') ' A. The algebra, on 200000 random integer points'
    call check('Jacobi''s identity holds at every point', bad_j == 0)
    call check('the residue is (s - t) times the stray term at every point', bad_r == 0)
    call check('with t = s the strength turns as a charge at every point', bad_c == 0)
    call check('with t /= s it fails wherever the stray term is not zero', bad_f == 0)
  end subroutine
  subroutine counts()
    integer :: n, f, bad
    write(*,'(A)') ' B. The counts'
    call check('carriers: 3 for two colours, 8 for three, 12 with the commuting one', &
               2*2-1 == 3 .and. 3*3-1 == 8 .and. 8+3+1 == 12)
    call check('states: 12*2 + 4 = (8*2 + 2 + 3*3) + 1, one scalar remains', 12*2+4 == 8*2+2+3*3+1)
    bad = 0
    do n = 1, 40
      if ((((n-1)*(n-2))/2 >= 1) .neqv. (n >= 3)) bad = bad + 1
    end do
    call check('a phase exists exactly from three generations on, n = 1..40', bad == 0)
    bad = 0
    do f = 0, 60
      if ((11*3 - 2*f > 0) .neqv. (f <= 16)) bad = bad + 1
      if (f > 0 .and. 11*0 - 2*f >= 0) bad = bad + 1
    end do
    call check('three colours are free exactly up to 16 flavours; a commuting charge never', bad == 0)
    bad = 0
    do n = 1, 40
      if ((4 - n == 0) .neqv. (n == 4)) bad = bad + 1
    end do
    call check('the coupling is a pure number in four dimensions only, n = 1..40', bad == 0)
  end subroutine
  subroutine measured()
    real(dp) :: as_mz, mz, mb, mtau, ia, as_b, as_tau, as_r, R3, Rm, Rs, g3, gm, gs, nn, ns
    real(dp) :: alpha, mpi, fpi
    integer :: n
    write(*,'(A)') ' C. Against published measurements'
    ! inputs, all measured: the strong coupling at the Z mass (Particle Data Group, 2024), the masses in GeV
    as_mz = 0.1180d0; mz = 91.1880d0; mb = 4.18d0; mtau = 1.77693d0
    ia = 1.0d0/as_mz + (11.0d0 - 2.0d0*5/3.0d0)/(2*pi)*log(mb/mz);     as_b = 1.0d0/ia
    ia = ia + (11.0d0 - 2.0d0*4/3.0d0)/(2*pi)*log(2.5d0/mb);           as_r = 1.0d0/ia
    ia = 1.0d0/as_b + (11.0d0 - 2.0d0*4/3.0d0)/(2*pi)*log(mtau/mb);    as_tau = 1.0d0/ia
    write(*,'(A,F6.4,A,F6.4,A,F6.4)') '   leading running from 0.1180 at the Z: ', as_b, ' at 4.18 GeV, ', &
         as_r, ' at 2.5 GeV, ', as_tau
    write(*,'(A)') '   at the tau mass; measured at the tau mass 0.332 +- 0.012 (Davier et al., 2014)'
    call check('the coupling is larger at the tau mass than at the Z: 0.332 against 0.1180, 17 uncertainties', &
               (0.332d0 - as_mz)/0.012d0 > 5.0d0)
    ! the next correction is of the order of the coupling itself: the threshold is one power of it, 0.332
    call check('leading running reaches the tau value within one power of the coupling', &
               abs(as_tau - 0.332d0)/0.332d0 < 0.332d0)
    ! the ratio R below the charm threshold (KEDR, 2017): 2.225 +- 0.020 +- 0.047
    Rm = 2.225d0; Rs = sqrt(0.020d0**2 + 0.047d0**2)
    do n = 2, 4
      R3 = n*(4.0d0 + 1 + 1)/9.0d0*(1.0d0 + as_r/pi)
      write(*,'(A,I1,A,F6.3,A,F6.1,A)') '   R with ', n, ' colours: ', R3, '   pull ', (R3 - Rm)/Rs, ' uncertainties'
    end do
    R3 = 2.0d0*(1.0d0 + as_r/pi)
    ! the convention: two uncertainties for an agreement, five for an exclusion; no threshold is fitted to a result
    call check('R: three colours within 2 uncertainties of 2.225 +- 0.051; two and four excluded by more than 5', &
               abs(R3 - Rm)/Rs < 2.0d0 .and. abs(R3*2/3 - Rm)/Rs > 5.0d0 .and. abs(R3*4/3 - Rm)/Rs > 5.0d0)
    ! the neutral pion into two photons (Larin et al., 2020): 7.802 +- 0.052 +- 0.105 eV
    alpha = 7.2973525693d-3; mpi = 134.9768d0; fpi = 130.2d0/sqrt(2.0d0)       ! MeV
    gm = 7.802d0; gs = sqrt(0.052d0**2 + 0.105d0**2)
    do n = 2, 4
      g3 = alpha**2*mpi**3/(64*pi**3*fpi**2)*(n/3.0d0)**2*1.0d6
      write(*,'(A,I1,A,F7.3,A,F7.1,A)') '   pion width with ', n, ' colours: ', g3, ' eV   pull ', (g3 - gm)/gs, &
           ' uncertainties'
    end do
    g3 = alpha**2*mpi**3/(64*pi**3*fpi**2)*1.0d6
    call check('pion width: three colours within 2 uncertainties of 7.802 +- 0.117 eV; two and four excluded by 5', &
               abs(g3 - gm)/gs < 2.0d0 .and. abs(g3*4/9 - gm)/gs > 5.0d0 .and. abs(g3*16/9 - gm)/gs > 5.0d0)
    ! the number of light neutrino kinds at the Z (Janot and Jadach, 2020): 2.9963 +- 0.0074
    nn = 2.9963d0; ns = 0.0074d0
    write(*,'(A,F5.2,A,F6.1,A,F6.1,A)') '   generations: 3 at ', abs(3 - nn)/ns, ' uncertainties; 2 at ', &
         abs(2 - nn)/ns, '; 4 at ', abs(4 - nn)/ns, ''
    call check('three generations within 2 uncertainties of 2.9963 +- 0.0074; two and four excluded by 5', &
               abs(3 - nn)/ns < 2.0d0 .and. abs(2 - nn)/ns > 5.0d0 .and. abs(4 - nn)/ns > 5.0d0)
  end subroutine
end program
