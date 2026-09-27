! Arrows_Twin.f90 · twin of "The Arrow Has Two Branches" · Fortran 2018.
! The priced branch: a Stoner-Wohlfarth nanomagnet swept through its hysteresis loop. The
! reversible branch: a Kepler orbit integrated by velocity Verlet and run backwards. Every
! figure computed in this run; cited constants labelled; an oracle stops on any failure.
program arrows_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  real(dp), parameter :: PI = 3.14159265358979323846_dp, KB = 1.380649e-23_dp
  real(dp) :: psi, h, th, m_desc0, m_asc0, area, hsw_calc, hsw_theory, mprev, hprev
  real(dp) :: x(2), v(2), a(2), x0(2), v0(2), e0, e1, dt, work, r, fx(2), xold(2)
  real(dp) :: kt, floor, per_switch, emax_drift, ke0, ke1
  integer :: i, nsteps, nchk, nfail, k
  logical :: switched
  nchk = 0; nfail = 0
  ! ---------------- the priced branch: e(th) = sin^2(th)/2 - h cos(th - psi), field along psi
  psi = 5.0_dp*PI/180.0_dp; th = 0.0_dp; area = 0.0_dp; switched = .false.; hsw_calc = 0.0_dp
  mprev = cos(th - psi); hprev = 2.0_dp
  do i = 0, 4000                                      ! descending branch, h from 2 to -2
    h = 2.0_dp - 4.0_dp*real(i,dp)/4000.0_dp
    call relax(th, h, psi)
    if (abs(h) < 1.0e-12_dp) m_desc0 = cos(th - psi)
    if (.not. switched .and. cos(th - psi) < 0.0_dp) then
      switched = .true.; hsw_calc = -h
    end if
    area = area + 0.5_dp*(cos(th - psi) + mprev)*(h - hprev)
    mprev = cos(th - psi); hprev = h
  end do
  do i = 0, 4000                                      ! ascending branch, h from -2 to 2
    h = -2.0_dp + 4.0_dp*real(i,dp)/4000.0_dp
    call relax(th, h, psi)
    if (abs(h) < 1.0e-12_dp) m_asc0 = cos(th - psi)
    area = area + 0.5_dp*(cos(th - psi) + mprev)*(h - hprev)
    mprev = cos(th - psi); hprev = h
  end do
  area = abs(area)
  hsw_theory = (cos(psi)**(2.0_dp/3.0_dp) + sin(psi)**(2.0_dp/3.0_dp))**(-1.5_dp)
  call check('two worlds at zero field: the descending branch holds +m', m_desc0 > 0.9_dp)
  call check('two worlds at zero field: the ascending branch holds -m', m_asc0 < -0.9_dp)
  call check('switching field matches the Stoner-Wohlfarth astroid to 1 percent', abs(hsw_calc/hsw_theory - 1.0_dp) < 1.0e-2_dp)
  call check('the loop encloses area: the cycle is priced', area > 1.0_dp)
  kt = KB*300.0_dp; floor = kt*log(2.0_dp)
  per_switch = area * 40.0_dp * kt                  ! work per cycle = area x 2KV; per switch = area x KV; KV = 40 kT
  call check('a thermally stable bit (KV = 40 kT) pays far above the Landauer floor per switch', per_switch > 10.0_dp*floor)
  call check('the Landauer floor at 300 K is 2.87e-21 J', abs(floor/2.87e-21_dp - 1.0_dp) < 2.0e-3_dp)
  ! ---------------- the reversible branch: Kepler orbit, GM = 1, velocity Verlet
  x0 = [1.0_dp, 0.0_dp]; v0 = [0.0_dp, 1.2_dp]; x = x0; v = v0; dt = 1.0e-3_dp
  e0 = 0.5_dp*dot_product(v,v) - 1.0_dp/norm2(x); a = -x/norm2(x)**3
  nsteps = 150000; emax_drift = 0.0_dp; work = 0.0_dp; ke0 = 0.5_dp*dot_product(v,v)
  do k = 1, nsteps
    xold = x
    x = x + v*dt + 0.5_dp*a*dt*dt
    fx = -x/norm2(x)**3
    work = work + 0.5_dp*dot_product(a + fx, x - xold)
    v = v + 0.5_dp*(a + fx)*dt; a = fx
    e1 = 0.5_dp*dot_product(v,v) - 1.0_dp/norm2(x)
    emax_drift = max(emax_drift, abs(e1/e0 - 1.0_dp))
  end do
  ke1 = 0.5_dp*dot_product(v,v)
  call check('energy returns: relative drift over ten orbits below 1e-6', emax_drift < 1.0e-6_dp)
  v = -v                                              ! reverse the arrow of the orbit
  do k = 1, nsteps
    x = x + v*dt + 0.5_dp*a*dt*dt
    fx = -x/norm2(x)**3
    v = v + 0.5_dp*(a + fx)*dt; a = fx
  end do
  r = norm2(x - x0)
  call check('run backwards, the orbit retraces to its start within 1e-8', r < 1.0e-8_dp)
  call check('work-energy: the path integral of gravity equals the change in kinetic energy', abs(work - (ke1 - ke0)) < 1.0e-5_dp)
  write(*,'(a,2f10.5)')  ' remanent m at h = 0 (desc, asc)   = ', m_desc0, m_asc0
  write(*,'(a,2f10.5)')  ' switching field (computed, SW)    = ', hsw_calc, hsw_theory
  write(*,'(a,f10.5)')   ' loop area (units mu0 Ms HK)       = ', area
  write(*,'(a,es11.4,a)') ' Landauer floor kT ln 2 at 300 K   = ', floor, ' J'
  write(*,'(a,es11.4,a)') ' dissipation per switch, KV = 40kT = ', per_switch, ' J'
  write(*,'(a,es11.4)')  ' Kepler energy drift (max, rel)    = ', emax_drift
  write(*,'(a,es11.4)')  ' Kepler return error after reversal= ', r
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', nchk, ',"failures":', nfail, '}'
  if (nfail > 0) error stop 1
contains
  subroutine relax(th, h, psi)
    real(dp), intent(inout) :: th
    real(dp), intent(in) :: h, psi
    integer :: it
    real(dp) :: g
    do it = 1, 20000
      g = sin(th)*cos(th) + h*sin(th - psi)
      th = th - 0.05_dp*g
      if (abs(g) < 1.0e-13_dp) exit
    end do
  end subroutine relax
  subroutine check(label, cond)
    character(*), intent(in) :: label
    logical, intent(in) :: cond
    nchk = nchk + 1
    if (.not. cond) then
      nfail = nfail + 1; write(*,'(a,a)') ' FAIL  ', label
    end if
  end subroutine check
end program arrows_twin
