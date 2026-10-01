! MatterAntimatter_Twin.f90 · the executed twin of SPHYS_Matter_Antimatter.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off MatterAntimatter_Twin.f90
! Measured inputs, sources named: Planck 2018 (A&A 641, A6) Omega_b h^2 = 0.02237; FIRAS (Fixsen 2009,
! ApJ 707, 916) T_CMB = 2.7255 K; CODATA 2018 constants; PDG 2024 quark masses and the Jarlskog invariant
! J = 3.12e-5; Super-Kamiokande (Takenaka et al. 2020, PRD 102, 112011) tau(p -> e+ pi0) > 2.4e34 yr;
! Planck 2018 age 13.787 Gyr.
! A the baryon carrier; B the wall on random conjugation-closed spectra; C the odd part of the weight
! carries the net; D the measured asymmetry; E the visible CP phase weighed at the electroweak
! temperature; F the proton's survival.
program matter_antimatter_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: PI = 3.141592653589793_dp
  integer :: checks, fails
  integer(i8) :: seed
  real(dp) :: eta
  checks = 0; fails = 0; seed = 20261001_i8
  call block_a(); call block_b(); call block_c(); call block_d(); call block_e(); call block_f()
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  include 'twin_common.inc'
  subroutine block_a()
    integer :: b, e, n, ok
    write(*,'(a)') 'A · conjugation on the baryon register is the fold under (1 + B, E); zero net baryon number is the line'
    n = 0; ok = 0
    do b = -30, 30
      do e = 0, 30
        n = n + 1
        if (1 + (-b) == 2 - (1 + b) .and. ((1 + b == 1) .eqv. (b == 0)) .and. &
            (b == 0 .or. abs((1 + b) - 1) == abs((1 - b) - 1))) ok = ok + 1
      end do
    end do
    call check('1891 states: the fold, the line, and one registration for each matter and antimatter pair', ok == n)
  end subroutine block_a
  subroutine block_b()
    integer :: t, i, ok
    integer(i8) :: en(50), bn(50), w(0:20), s
    write(*,'(a)') 'B · the wall: an energy-only weight against baryon number over a conjugation-closed spectrum'
    ok = 0
    do t = 1, 1000
      do i = 0, 20
        w(i) = int(1000.0_dp*rnd(), i8)
      end do
      s = 0_i8
      do i = 1, 50
        en(i) = int(20.0_dp*rnd(), i8); bn(i) = int(13.0_dp*rnd(), i8) - 6_i8
        s = s + w(en(i))*bn(i) + w(en(i))*(-bn(i))
      end do
      if (s == 0_i8) ok = ok + 1
    end do
    call check('1000 random spectra and weights: the net baryon number is exactly zero', ok == 1000)
  end subroutine block_b
  subroutine block_c()
    integer :: t, i, nz
    integer(i8) :: wp, wm, b, s, sodd
    write(*,'(a)') 'C · a weight that tells matter from antimatter: the net is its odd part, and only that'
    nz = 0
    do t = 1, 1000
      s = 0_i8; sodd = 0_i8
      do i = 1, 50
        wp = int(1000.0_dp*rnd(), i8); wm = int(1000.0_dp*rnd(), i8); b = int(13.0_dp*rnd(), i8) - 6_i8
        s = s + wp*b + wm*(-b)
        sodd = sodd + (wp - wm)*b
      end do
      if (s == sodd .and. s /= 0_i8) nz = nz + 1
    end do
    call check('1000 asymmetric weights: the net equals the odd part, and it is nonzero', nz >= 990)
  end subroutine block_c
  subroutine block_d()
    real(dp), parameter :: OBH2 = 0.02237_dp, TCMB = 2.7255_dp, KBEV = 8.617333262e-5_dp
    real(dp), parameter :: HBARC = 1.973269804e-7_dp, MP = 1.67262192369e-27_dp, ZETA3 = 1.2020569031595942_dp
    real(dp), parameter :: G = 6.67430e-11_dp, MPC = 3.0856775814913673e22_dp
    real(dp) :: rhoc_h2, nb, ng, x
    write(*,'(a)') 'D · the measured asymmetry: baryons per photon from the Planck budget and the FIRAS temperature'
    rhoc_h2 = 3.0_dp*(1.0e5_dp/MPC)**2/(8.0_dp*PI*G)
    nb = OBH2*rhoc_h2/MP
    x = KBEV*TCMB/HBARC
    ng = 2.0_dp*ZETA3/PI**2*x**3
    eta = nb/ng
    write(*,'(a,f9.4,a,es11.4,a,es11.4)') '  n_b = ', nb, ' per m^3 ; n_gamma = ', ng, ' per m^3 ; eta = ', eta
    call check('eta = 6.1e-10: one excess baryon per 1.6 billion photons', eta > 6.0e-10_dp .and. eta < 6.2e-10_dp .and. &
               abs(ng/4.107e8_dp - 1.0_dp) < 2.0e-3_dp)
  end subroutine block_d
  subroutine block_e()
    real(dp), parameter :: J = 3.12e-5_dp, T = 100.0_dp
    real(dp), parameter :: MT = 172.57_dp, MC = 1.2730_dp, MU = 0.00216_dp, MB = 4.183_dp, MS = 0.0935_dp, MD = 0.00470_dp
    real(dp) :: dcp
    write(*,'(a)') 'E · the visible CP phase, weighed at the electroweak temperature (100 GeV)'
    dcp = J*(MT**2 - MC**2)*(MT**2 - MU**2)*(MC**2 - MU**2)*(MB**2 - MS**2)*(MB**2 - MD**2)*(MS**2 - MD**2)/T**12
    write(*,'(a,es11.4,a,es11.4)') '  J times the mass-splitting product over T^12 = ', dcp, ' ; eta / that = ', eta/dcp
    call check('the quark sector supplies 1e-19, short of the measured 6.1e-10 by more than eight orders', &
               dcp < 1.0e-18_dp .and. dcp > 1.0e-20_dp .and. eta/dcp > 1.0e8_dp)
  end subroutine block_e
  subroutine block_f()
    real(dp) :: r
    write(*,'(a)') 'F · the reading barely moves today: the proton outlives the universe'
    r = 2.4e34_dp/13.787e9_dp
    write(*,'(a,es11.4)') '  lifetime bound over the age: ', r
    call check('tau(p -> e+ pi0) > 2.4e34 yr is 1.7e24 ages of the universe', abs(r/1.741e24_dp - 1.0_dp) < 2.0e-3_dp)
  end subroutine block_f
end program matter_antimatter_twin
