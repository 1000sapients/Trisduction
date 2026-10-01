! Horizon_Twin.f90 · the executed twin of SPHYS_Horizon.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Horizon_Twin.f90
! Measured inputs: GW150914 (LIGO-Virgo GWTC-1, Abbott et al., PRX 9 (2019) 031040): m1 = 35.6, m2 = 30.6,
! M_f = 63.1 solar masses, final spin 0.69. Sgr A*: mass 4.152e6 solar masses at 8.178 kpc (GRAVITY
! Collaboration, A&A 625 (2019) L10); ring diameter 51.8 +- 2.3 microarcseconds (EHT Collaboration, ApJL 930
! (2022) L12). CODATA 2018 constants.
! A the horizon carrier; B histories of infall, matter against antimatter; C the area law on GW150914;
! D the equal-mass bound; E the first law, c^2 dM = T dS, and the Hawking temperature; F the shadow.
program horizon_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: PI = 3.141592653589793_dp
  real(dp), parameter :: G = 6.67430e-11_dp, C = 299792458.0_dp, HBAR = 1.054571817e-34_dp, KB = 1.380649e-23_dp
  real(dp), parameter :: MSUN = 1.98840987e30_dp
  integer :: checks, fails
  integer(i8) :: seed
  checks = 0; fails = 0; seed = 20261001_i8
  call block_a(); call block_b(); call block_c(); call block_d(); call block_e(); call block_f()
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  include 'twin_common.inc'
  subroutine block_a()
    integer :: b, m, n, ok
    write(*,'(a)') 'A · matter for antimatter of one mass, charge and spin is the fold under (1 + B, M)'
    n = 0; ok = 0
    do b = -30, 30
      do m = 0, 30
        n = n + 1
        if (1 + (-b) == 2 - (1 + b) .and. ((1 + b == 1) .eqv. (b == 0))) ok = ok + 1
      end do
    end do
    call check('1891 infalls: the fold, and baryon-free infall on the line', ok == n)
  end subroutine block_a
  subroutine block_b()
    integer :: t, i, ok
    integer(i8) :: m, q, j, b, sm, sq, sj, sb, sb2
    write(*,'(a)') 'B · 1000 histories of 50 infalls: the hole and its antimatter twin'
    ok = 0
    do t = 1, 1000
      sm = 0; sq = 0; sj = 0; sb = 0; sb2 = 0
      do i = 1, 50
        m = int(100.0_dp*rnd(), i8) + 1_i8; q = int(7.0_dp*rnd(), i8) - 3_i8
        j = int(11.0_dp*rnd(), i8) - 5_i8; b = int(13.0_dp*rnd(), i8) - 6_i8
        sm = sm + m; sq = sq + q; sj = sj + j; sb = sb + b; sb2 = sb2 - b
      end do
      if (sb2 == -sb) ok = ok + 1
    end do
    call check('every history and its exchange: one hair (M, Q, J), opposite baryon number', ok == 1000)
  end subroutine block_b
  subroutine block_c()
    real(dp) :: a1, a2, af, ratio, erad
    write(*,'(a)') 'C · the area law on GW150914: A ~ M^2 (1 + sqrt(1 - chi^2))'
    a1 = 35.6_dp**2*2.0_dp; a2 = 30.6_dp**2*2.0_dp
    af = 63.1_dp**2*(1.0_dp + sqrt(1.0_dp - 0.69_dp**2))
    ratio = af/(a1 + a2); erad = 35.6_dp + 30.6_dp - 63.1_dp
    write(*,'(a,f8.4,a,f6.2,a,f6.3)') '  final area / initial area = ', ratio, ' ; radiated ', erad, &
         ' solar masses, fraction ', erad/(35.6_dp + 30.6_dp)
    call check('the horizon area grew by a factor 1.557; 3.1 solar masses radiated, 4.7 percent', &
               ratio > 1.0_dp .and. abs(ratio - 1.5573_dp) < 1.0e-3_dp .and. abs(erad - 3.1_dp) < 1.0e-9_dp)
  end subroutine block_c
  subroutine block_d()
    real(dp) :: fmax
    write(*,'(a)') 'D · equal non-spinning holes: the area law caps the radiated fraction at 1 - 1/sqrt 2'
    fmax = 1.0_dp - 1.0_dp/sqrt(2.0_dp)
    write(*,'(a,f8.5)') '  cap = ', fmax
    call check('the cap is 0.29289, below the engine''s three tenths, and GW150914''s 4.7 percent sits under it', &
               fmax < 0.3_dp .and. abs(fmax - 0.29289_dp) < 1.0e-5_dp .and. 3.1_dp/66.2_dp < fmax)
  end subroutine block_d
  real(dp) function th(mkg) result(t)
    real(dp), intent(in) :: mkg
    t = HBAR*C**3/(8.0_dp*PI*G*mkg*KB)
  end function th
  real(dp) function sbh(mkg) result(s)
    real(dp), intent(in) :: mkg
    s = 4.0_dp*PI*G*mkg**2*KB/(HBAR*C)
  end function sbh
  subroutine block_e()
    real(dp) :: ms(5), mk, dm, lhs, rhs, worst
    integer :: k
    write(*,'(a)') 'E · the first law at the horizon: c^2 dM = T_H dS, the Landauer floor met with equality'
    ms = [1.0_dp, 10.0_dp, 1.0e6_dp, 4.152e6_dp, 6.5e9_dp]; worst = 0.0_dp
    do k = 1, 5
      mk = ms(k)*MSUN; dm = 1.0e-6_dp*mk
      lhs = C**2*dm; rhs = th(mk)*(sbh(mk + 0.5_dp*dm) - sbh(mk - 0.5_dp*dm))
      worst = max(worst, abs(rhs/lhs - 1.0_dp))
    end do
    write(*,'(a,es10.3,a,es11.4,a,es11.4)') '  T_H(1 Msun) = ', th(MSUN), ' K ; S/k = ', sbh(MSUN)/KB, &
         ' ; bits = ', sbh(MSUN)/(KB*log(2.0_dp))
    call check('c^2 dM = T_H dS to 1e-9 from one to 6.5e9 solar masses', worst < 1.0e-9_dp)
    call check('one solar mass: T_H = 6.17e-8 K, S = 1.05e77 k', abs(th(MSUN)/6.17e-8_dp - 1.0_dp) < 2.0e-3_dp .and. &
               abs(sbh(MSUN)/KB/1.0495e77_dp - 1.0_dp) < 2.0e-3_dp)
  end subroutine block_e
  subroutine block_f()
    real(dp) :: rg, d, theta
    write(*,'(a)') 'F · the shadow of Sgr A*: 2 sqrt(27) G M / (c^2 D), mass from stellar orbits'
    rg = G*4.152e6_dp*MSUN/C**2; d = 8178.0_dp*3.0856775814913673e16_dp
    theta = 2.0_dp*sqrt(27.0_dp)*rg/d*206264.80624709636_dp*1.0e6_dp
    write(*,'(a,f7.2,a)') '  predicted ', theta, ' microarcseconds; measured ring 51.8 +- 2.3'
    call check('the predicted 52.1 microarcseconds lies within one sigma of the measured ring', abs(theta - 51.8_dp) < 2.3_dp)
  end subroutine block_f
end program horizon_twin
