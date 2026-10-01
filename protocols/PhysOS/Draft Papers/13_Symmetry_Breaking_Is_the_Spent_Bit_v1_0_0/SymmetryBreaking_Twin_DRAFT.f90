! SymmetryBreaking_Twin.f90 · the executed twin of SPHYS_Symmetry_Breaking.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off SymmetryBreaking_Twin.f90
! Measured inputs (PDG 2024, Navas et al., PRD 110, 030001): G_F = 1.1663788e-5 GeV^-2; m_H = 125.20 GeV;
! m_W = 80.3692 GeV; m_Z = 91.1876 GeV; 1/alpha(m_Z) = 127.951; sin^2(theta_W)(m_Z, MSbar) = 0.23129;
! m_t = 172.57 GeV; m_b(m_b) = 4.183 GeV; m_tau = 1.77693 GeV; m_e = 0.51099895e-3 GeV.
! A the vacuum carrier; B the double well; C the electroweak vacuum from the Fermi constant; D masses
! as couplings to the depth; E heat restores the line.
program symmetry_breaking_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: PI = 3.141592653589793_dp
  integer :: checks, fails
  integer(i8) :: seed
  real(dp) :: vev
  checks = 0; fails = 0; seed = 20261001_i8
  call block_a(); call block_b(); call block_c(); call block_d(); call block_e()
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  include 'twin_common.inc'
  subroutine block_a()
    integer :: x, a, n, ok
    integer(i8) :: vx, vm
    write(*,'(a)') 'A · the field reflection is the fold under (1 + x, V(x)); the symmetric point is the line'
    n = 0; ok = 0
    do a = 0, 30
      do x = -40, 40
        n = n + 1
        vx = (int(x, i8)*x - a)**2; vm = (int(-x, i8)*(-x) - a)**2
        if (1 + (-x) == 2 - (1 + x) .and. vx == vm .and. ((1 + x == 1) .eqv. (x == 0))) ok = ok + 1
      end do
    end do
    call check('2511 field values: the fold, an even energy, and the line at the symmetric point', ok == n)
  end subroutine block_a
  real(dp) function pot(mu2, lam, x) result(v)
    real(dp), intent(in) :: mu2, lam, x
    v = -mu2*x*x + lam*x**4
  end function pot
  subroutine block_b()
    integer :: i, ok
    real(dp) :: mu2, lam, v, h, c0, cv
    write(*,'(a)') 'B · the double well V = -mu^2 x^2 + lam x^4: two vacua, one energy; down at the line, up at the vacuum'
    ok = 0
    do i = 1, 1000
      mu2 = 0.1_dp + 10.0_dp*rnd(); lam = 0.01_dp + rnd()
      v = sqrt(mu2/(2.0_dp*lam)); h = 1.0e-3_dp*v
      c0 = (pot(mu2, lam, h) - 2.0_dp*pot(mu2, lam, 0.0_dp) + pot(mu2, lam, -h))/h**2
      cv = (pot(mu2, lam, v + h) - 2.0_dp*pot(mu2, lam, v) + pot(mu2, lam, v - h))/h**2
      if (pot(mu2, lam, v) == pot(mu2, lam, -v) .and. pot(mu2, lam, v) < pot(mu2, lam, 0.0_dp) .and. &
          abs(c0/(-2.0_dp*mu2) - 1.0_dp) < 1.0e-5_dp .and. abs(cv/(4.0_dp*mu2) - 1.0_dp) < 1.0e-5_dp) ok = ok + 1
    end do
    call check('1000 wells: V(v) = V(-v) exactly, below V(0); curvature -2 mu^2 at the line, +4 mu^2 at the vacuum', ok == 1000)
  end subroutine block_b
  subroutine block_c()
    real(dp), parameter :: GF = 1.1663788e-5_dp, MH = 125.20_dp, MW = 80.3692_dp, MZ = 91.1876_dp
    real(dp), parameter :: AINV = 127.951_dp, S2W = 0.23129_dp
    real(dp) :: lam, e, g, mw_p, mz_p
    write(*,'(a)') 'C · the electroweak vacuum: v from the Fermi constant, the masses as the depth read by the couplings'
    vev = 1.0_dp/sqrt(sqrt(2.0_dp)*GF)
    lam = MH**2/(2.0_dp*vev**2)
    e = sqrt(4.0_dp*PI/AINV); g = e/sqrt(S2W)
    mw_p = g*vev/2.0_dp; mz_p = e*vev/(2.0_dp*sqrt(S2W)*sqrt(1.0_dp - S2W))
    write(*,'(a,f9.4,a,f7.4,a,f8.3,a,f8.3)') '  v = ', vev, ' GeV ; lambda = ', lam, ' ; m_W = ', mw_p, ' ; m_Z = ', mz_p
    call check('v = 246.22 GeV from muon decay', abs(vev - 246.22_dp) < 0.01_dp)
    call check('g v/2 gives m_W within 0.5 percent of 80.369 GeV, and e v/(2 s c) m_Z within 0.5 percent of 91.188', &
               abs(mw_p/MW - 1.0_dp) < 5.0e-3_dp .and. abs(mz_p/MZ - 1.0_dp) < 5.0e-3_dp)
  end subroutine block_c
  subroutine block_d()
    real(dp), parameter :: MT = 172.57_dp, MB = 4.183_dp, MTAU = 1.77693_dp, ME = 0.51099895e-3_dp
    real(dp) :: yt, yb, ytau, ye
    write(*,'(a)') 'D · each mass is a coupling to the depth: y = sqrt(2) m / v'
    yt = sqrt(2.0_dp)*MT/vev; yb = sqrt(2.0_dp)*MB/vev; ytau = sqrt(2.0_dp)*MTAU/vev; ye = sqrt(2.0_dp)*ME/vev
    write(*,'(a,f8.5,a,f8.5,a,f8.5,a,es10.3)') '  top ', yt, ' ; bottom ', yb, ' ; tau ', ytau, ' ; electron ', ye
    call check('the top couples at 0.991, the electron at 2.9e-6: 5.5 decades on one depth', &
               abs(yt - 0.9912_dp) < 1.0e-3_dp .and. abs(log10(yt/ye) - 5.53_dp) < 0.01_dp)
  end subroutine block_d
  subroutine block_e()
    integer :: k, it
    real(dp) :: mu2, lam, c, tc, t, x, best, xbest, vt
    logical :: ok_above, ok_below
    write(*,'(a)') 'E · heat restores the line: V + c T^2 x^2 has its ground at x = 0 once c T^2 >= mu^2'
    mu2 = 1.0_dp; lam = 0.25_dp; c = 0.5_dp; tc = sqrt(mu2/c)
    ok_above = .true.; ok_below = .true.
    do it = 1, 2
      t = merge(1.2_dp*tc, 0.8_dp*tc, it == 1)
      best = huge(1.0_dp); xbest = 0.0_dp
      do k = -4000, 4000
        x = real(k, dp)*1.0e-3_dp
        vt = pot(mu2, lam, x) + c*t*t*x*x
        if (vt < best) then
          best = vt; xbest = x
        end if
      end do
      write(*,'(a,f6.3,a,f8.4)') '  T/Tc = ', t/tc, ' ; ground at x = ', xbest
      if (it == 1) ok_above = (xbest == 0.0_dp)
      if (it == 2) ok_below = (abs(xbest) > 0.5_dp)
    end do
    call check('above Tc the ground is the line; below it the vacuum leaves the line', ok_above .and. ok_below)
  end subroutine block_e
end program symmetry_breaking_twin
