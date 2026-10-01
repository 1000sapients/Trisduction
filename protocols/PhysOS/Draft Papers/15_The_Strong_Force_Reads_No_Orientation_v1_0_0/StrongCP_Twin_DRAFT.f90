! StrongCP_Twin.f90 · the executed twin of SPHYS_Strong_CP.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off StrongCP_Twin.f90
! Measured inputs: neutron electric dipole moment |d_n| < 1.8e-26 e cm (Abel et al., PRL 124 (2020) 081803);
! its coefficient d_n = 2.4e-16 theta e cm (Pospelov and Ritz, PRL 82 (1999) 2526); m_pi0 = 134.977 MeV,
! f_pi = 130.2/sqrt 2 MeV, m_u/m_d = 0.474 (PDG 2024).
! A the discrete circle: the reflection is the fold, 0 and pi the line; B the vacuum energy of the angle:
! even, least at 0, greatest at pi, stationary at both; C at equal quark masses the two branches meet at
! pi in a cusp; D the curvature at 0; E the dipole null puts the angle on the fixed point 0.
program strong_cp_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: PI = 3.141592653589793_dp
  real(dp), parameter :: MPI = 134.977_dp, FPI = 92.0647_dp, ZR = 0.474_dp
  integer :: checks, fails
  integer(i8) :: seed
  checks = 0; fails = 0; seed = 20261001_i8
  call block_a(); call block_b(); call block_c(); call block_d(); call block_e()
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  include 'twin_common.inc'
  subroutine block_a()
    integer :: m, k, fk, n, ok, o, ofk
    write(*,'(a)') 'A · circles of 2m points, m up to 500: the reflection is the fold; exactly 0 and pi are fixed'
    n = 0; ok = 0
    do m = 1, 500
      do k = 0, 2*m - 1
        n = n + 1
        fk = mod(2*m - k, 2*m)
        o = 0; if (k /= 0 .and. k /= m) o = merge(1, -1, k < m)
        ofk = 0; if (fk /= 0 .and. fk /= m) ofk = merge(1, -1, fk < m)
        if (ofk == -o .and. ((fk == k) .eqv. (k == 0 .or. k == m)) .and. ((1 + o == 1) .eqv. (k == 0 .or. k == m))) ok = ok + 1
      end do
    end do
    call check('250500 points: the fold, and the line exactly at the two fixed points', ok == n)
  end subroutine block_a
  real(dp) function evac(z, th) result(e)
    real(dp), intent(in) :: z, th
    e = -MPI**2*FPI**2*sqrt(1.0_dp - 4.0_dp*z/(1.0_dp + z)**2*sin(th/2.0_dp)**2)
  end function evac
  subroutine block_b()
    integer :: k
    real(dp) :: th, emin, emax, tmin, tmax, h, d0, dpi
    logical :: even
    write(*,'(a)') 'B · the vacuum energy of the angle, E(theta), at the measured quark mass ratio'
    even = .true.; emin = huge(1.0_dp); emax = -huge(1.0_dp); tmin = -1.0_dp; tmax = -1.0_dp
    do k = 0, 3600
      th = 2.0_dp*PI*real(k, dp)/3600.0_dp
      if (abs(evac(ZR, th) - evac(ZR, -th)) > 1.0e-9_dp*abs(evac(ZR, th))) even = .false.
      if (evac(ZR, th) < emin) then
        emin = evac(ZR, th); tmin = th
      end if
      if (evac(ZR, th) > emax) then
        emax = evac(ZR, th); tmax = th
      end if
    end do
    h = 1.0e-4_dp
    d0 = (evac(ZR, h) - evac(ZR, -h))/(2.0_dp*h); dpi = (evac(ZR, PI + h) - evac(ZR, PI - h))/(2.0_dp*h)
    write(*,'(a,f8.5,a,f8.5)') '  least at theta = ', tmin, ' ; greatest at theta = ', tmax
    call check('E is even, least at 0, greatest at pi, stationary at both', even .and. tmin == 0.0_dp .and. &
               abs(tmax - PI) < 1.0e-9_dp .and. abs(d0) < 1.0e-6_dp*abs(emin) .and. abs(dpi) < 1.0e-6_dp*abs(emin))
  end subroutine block_b
  subroutine block_c()
    real(dp) :: h, dl, dr
    write(*,'(a)') 'C · at equal quark masses the energy is |cos(theta/2)|: two branches meet at pi in a cusp'
    h = 1.0e-6_dp
    dl = (evac(1.0_dp, PI) - evac(1.0_dp, PI - h))/h; dr = (evac(1.0_dp, PI + h) - evac(1.0_dp, PI))/h
    write(*,'(a,es11.3,a,es11.3)') '  slope left of pi ', dl, ' ; right of pi ', dr
    call check('the slopes at pi are opposite and nonzero: two vacua, one energy, CP broken there', &
               dl > 0.0_dp .and. dr < 0.0_dp .and. abs(dl + dr) < 1.0e-3_dp*abs(dl))
  end subroutine block_c
  subroutine block_d()
    real(dp) :: chi, h, num
    write(*,'(a)') 'D · the curvature at 0: chi = m_pi^2 f_pi^2 z / (1 + z)^2'
    chi = MPI**2*FPI**2*ZR/(1.0_dp + ZR)**2
    h = 1.0e-3_dp
    num = (evac(ZR, h) - 2.0_dp*evac(ZR, 0.0_dp) + evac(ZR, -h))/h**2
    write(*,'(a,f8.3,a)') '  chi^(1/4) = ', chi**0.25_dp, ' MeV'
    call check('the energy curves up at 0; the second difference equals chi to 1e-5; computed chi^(1/4) = 76.19 MeV', &
               abs(num/chi - 1.0_dp) < 1.0e-5_dp .and. abs(chi**0.25_dp - 76.185_dp) < 0.01_dp)
  end subroutine block_d
  subroutine block_e()
    real(dp) :: tbound
    write(*,'(a)') 'E · the dipole null puts the angle at the fixed point 0'
    tbound = 1.8e-26_dp/2.4e-16_dp
    write(*,'(a,es10.3,a,f8.5)') '  |theta| < ', tbound, ' ; distance to pi ', PI
    call check('|theta| < 7.5e-11: the angle stands at 0, not at pi', &
               tbound < 1.0e-10_dp .and. abs(tbound - 7.5e-11_dp) < 1.0e-12_dp)
  end subroutine block_e
end program strong_cp_twin
