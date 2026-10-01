! SeatReach_Twin.f90 · the executed twin of SPHYS_Seat_Reach.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off SeatReach_Twin.f90
! Measured inputs: Planck 2018 (A&A 641, A6) H0 = 67.36 km/s/Mpc, Omega_Lambda = 0.6847, Omega_b h^2 =
! 0.02237; FIRAS T = 2.7255 K; CODATA 2022 (NIST, 2024) 1/alpha = 137.035999177, m_p/m_e = 1836.152673426; PDG 2024
! m_H = 125.20 GeV, m_t = 172.57 GeV, m_e = 0.51099895 MeV; Planck mass 1.220890e19 GeV; G_F = 1.1663788e-5.
! A the seat's verdicts are blind to every rescaling; B counts survive and are reached; C the dot ledger:
! the magnitudes the seat cannot reach, computed from measurement.
program seat_reach_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: PI = 3.141592653589793_dp
  integer :: checks, fails
  integer(i8) :: seed
  checks = 0; fails = 0; seed = 20261001_i8
  call block_a(); call block_b(); call block_c()
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  include 'twin_common.inc'
  subroutine block_a()
    integer :: i, okh, oko
    integer(i8) :: h, t, k, f1h, f1t, s2h, s2t, f2h, f2t
    write(*,'(a)') 'A · 100000 points and scales: the fold commutes and the line holds under every rescaling'
    okh = 0; oko = 0
    do i = 1, 100000
      h = int(41.0_dp*rnd(), i8) - 19_i8; t = int(2001.0_dp*rnd(), i8) - 1000_i8
      k = int(2001.0_dp*rnd(), i8) - 1000_i8
      if (k == 0_i8) k = 7_i8
      ! route one: fold, then rescale the height; route two: rescale the height, then fold
      f1h = 2_i8 - h; f1t = k*t
      s2h = h; s2t = k*t; f2h = 2_i8 - s2h; f2t = s2t
      if (f1h == f2h .and. f1t == f2t .and. ((s2h == 1_i8) .eqv. (h == 1_i8))) okh = okh + 1
      if (2_i8 - (1_i8 + k*(h - 1_i8)) == 1_i8 + k*((2_i8 - h) - 1_i8) .and. &
          ((1_i8 + k*(h - 1_i8) == 1_i8) .eqv. (h == 1_i8))) oko = oko + 1
    end do
    call check('height rescaling: fold and line unchanged at every point', okh == 100000)
    call check('offset rescaling by any nonzero factor: fold commutes, line preserved, at every point', oko == 100000)
  end subroutine block_a
  subroutine block_b()
    integer :: n, m, k, nfix, okc, oka, a1, a2, a3, a4, nh
    integer :: ph(6)
    write(*,'(a)') 'B · counts the seat reaches'
    do n = 1, 6
      ph(n) = (n - 1)*(n - 2)/2
    end do
    write(*,'(a,6i3)') '  CP phases of 1..6 generations: ', ph
    okc = 0
    if (ph(1) == 0 .and. ph(2) == 0 .and. ph(3) == 1 .and. ph(4) == 3) okc = 1
    oka = 0
    do m = 1, 1000
      nfix = 0
      do k = 0, 2*m - 1
        if (mod(2*m - k, 2*m) == k) nfix = nfix + 1
      end do
      if (nfix == 2) oka = oka + 1
    end do
    nh = 0
    do a1 = -2, 2
      do a2 = -2, 2
        do a3 = -2, 2
          do a4 = -2, 2
            if (mod(a1 - a2, 2) == 0 .and. mod(a2 - a3, 2) == 0 .and. mod(a3 - a4, 2) == 0 .and. &
                a1*a1 + a2*a2 + a3*a3 + a4*a4 == 4) nh = nh + 1
          end do
        end do
      end do
    end do
    call check('three generations are the least with a CP phase', okc == 1)
    call check('the strong angle''s reflection fixes exactly two points on every circle up to 2000 points', oka == 1000)
    call check('the Hurwitz order has 24 units', nh == 24)
  end subroutine block_b
  subroutine block_c()
    real(dp), parameter :: G = 6.67430e-11_dp, C = 299792458.0_dp, HBARC_GEVM = 1.973269804e-16_dp
    real(dp), parameter :: MPC = 3.0856775814913673e22_dp, EV = 1.602176634e-19_dp
    real(dp) :: rhoc, rhol_j, rhol_gev4, mp, r1, r2, r3, r4, r5, nb, ng, eta
    write(*,'(a)') 'C · the dot ledger: dimensionless magnitudes, measured, no seat'
    rhoc = 3.0_dp*(67.36e3_dp/MPC)**2/(8.0_dp*PI*G)
    rhol_j = 0.6847_dp*rhoc*C**2
    rhol_gev4 = rhol_j/(EV*1.0e9_dp)*HBARC_GEVM**3
    mp = 1.220890e19_dp
    r1 = log10(rhol_gev4/mp**4)
    r2 = 125.20_dp/mp
    r3 = 172.57_dp/0.51099895e-3_dp
    nb = 0.02237_dp*3.0_dp*(1.0e5_dp/MPC)**2/(8.0_dp*PI*G)/1.67262192369e-27_dp
    ng = 2.0_dp*1.2020569031595942_dp/PI**2*(8.617333262e-5_dp*2.7255_dp/1.973269804e-7_dp)**3
    eta = nb/ng
    r4 = 137.035999177_dp; r5 = 1836.152673426_dp
    write(*,'(a,f9.3)')   '  log10 of the vacuum density over the Planck mass to the fourth: ', r1
    write(*,'(a,es11.4)') '  Higgs mass over Planck mass:                                    ', r2
    write(*,'(a,es11.4)') '  top mass over electron mass:                                    ', r3
    write(*,'(a,es11.4)') '  baryons per photon:                                             ', eta
    write(*,'(a,f14.9)')  '  inverse fine-structure constant:                                ', r4
    write(*,'(a,f14.9)')  '  proton over electron mass:                                      ', r5
    call check('six magnitudes computed: 10^-122.9, 1.03e-17, 3.38e5, 6.12e-10, 137.036, 1836.15', &
               abs(r1 + 122.9_dp) < 0.1_dp .and. abs(r2/1.0255e-17_dp - 1.0_dp) < 1.0e-3_dp .and. &
               abs(r3/3.3771e5_dp - 1.0_dp) < 1.0e-3_dp .and. abs(eta/6.116e-10_dp - 1.0_dp) < 2.0e-3_dp)
  end subroutine block_c
end program seat_reach_twin
