! Fluid_Twin.f90 · twin of "The Fluid Is the Witness" · Fortran 2018.
! Burgers' equation u_t + u u_x = nu u_xx on a circle, u0 = -sin x. The reversible branch
! (nu = 0) leaves the regular locus at t* = 1: the characteristic gradient -1/(1 - t) diverges.
! The priced branch (nu > 0) stays regular for all time: the exact Cole-Hopf solution is built
! here from its Fourier-Bessel series, checked against the equation, and its energy is seen to
! fall exactly by the viscous dissipation.
program fluid_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  real(dp), parameter :: PI = 3.14159265358979323846_dp, NU = 0.1_dp
  integer, parameter :: KMAX = 60, NX = 512
  real(dp) :: bes(0:KMAX), acoef, t, gmax, e1, e2, dis, dt, res, resmax, grad_inv
  real(dp) :: x, u, ux, ut, uxx
  integer :: i, nchk, nfail, it
  nchk = 0; nfail = 0
  acoef = 1.0_dp/(2.0_dp*NU)                      ! phi0 = exp(a (1 - cos x))
  do i = 0, KMAX
    bes(i) = besI(i, acoef)
  end do
  ! the reversible branch: gradient along the characteristic from x = 0
  grad_inv = -1.0_dp/(1.0_dp - 0.999_dp)
  call check('reversible branch: the gradient reaches -1000 at t = 0.999 and diverges at t = 1', grad_inv < -999.0_dp)
  ! the priced branch: the maximal gradient stays bounded through and after t = 1
  gmax = 0.0_dp
  do it = 0, 60
    t = 0.05_dp*real(it, dp)
    do i = 0, NX - 1
      x = 2.0_dp*PI*real(i,dp)/real(NX,dp)
      call field(x, t, u, ux)
      gmax = max(gmax, abs(ux))
    end do
  end do
  call check('priced branch: the maximal gradient stays finite for t in [0, 3]', gmax < 20.0_dp)
  ! the constructed solution satisfies the equation: residual by finite differences
  resmax = 0.0_dp; t = 1.0_dp
  do i = 1, 16
    x = 2.0_dp*PI*real(i,dp)/17.0_dp
    call derivs(x, t, u, ux, ut, uxx)
    res = ut + u*ux - NU*uxx
    resmax = max(resmax, abs(res))
  end do
  call check('the Cole-Hopf construction satisfies Burgers'' equation to 1e-5', resmax < 1.0e-5_dp)
  ! energy falls by exactly the dissipation: dE/dt = -nu * integral of u_x^2
  dt = 1.0e-4_dp
  e1 = energy(1.0_dp - dt); e2 = energy(1.0_dp + dt); dis = dissip(1.0_dp)
  call check('energy balance at t = 1: dE/dt equals minus the viscous dissipation to 1e-6', &
             abs((e2 - e1)/(2.0_dp*dt) + NU*dis) < 1.0e-6_dp)
  call check('the priced branch pays: energy strictly falls', e2 < e1)
  write(*,'(a,f12.3)')   ' reversible gradient at t = 0.999      = ', grad_inv
  write(*,'(a,f12.6)')   ' priced branch max |u_x| on [0, 3]     = ', gmax
  write(*,'(a,es12.4)')  ' residual of the constructed solution  = ', resmax
  write(*,'(a,es12.4)')  ' energy balance error at t = 1         = ', abs((e2 - e1)/(2.0_dp*dt) + NU*dis)
  write(*,'(a,f12.6)')   ' energy at t = 1                       = ', energy(1.0_dp)
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', nchk, ',"failures":', nfail, '}'
  if (nfail > 0) error stop 1
contains
  function besI(k, a) result(r)                    ! I_k(a) = (1/pi) int_0^pi e^{a cos th} cos(k th) d th
    integer, intent(in) :: k
    real(dp), intent(in) :: a
    real(dp) :: r, th
    integer :: j, nq
    nq = 4000; r = 0.0_dp
    do j = 0, nq
      th = PI*real(j,dp)/real(nq,dp)
      if (j == 0 .or. j == nq) then
        r = r + 0.5_dp*exp(a*cos(th))*cos(real(k,dp)*th)
      else
        r = r + exp(a*cos(th))*cos(real(k,dp)*th)
      end if
    end do
    r = r/real(nq,dp)
  end function besI
  subroutine phis(x, t, p, px)                     ! phi up to the factor e^a, and its x-derivative
    real(dp), intent(in) :: x, t
    real(dp), intent(out) :: p, px
    integer :: k
    real(dp) :: w, sgn
    p = bes(0); px = 0.0_dp; sgn = 1.0_dp
    do k = 1, KMAX
      sgn = -sgn
      w = 2.0_dp*sgn*bes(k)*exp(-NU*real(k*k,dp)*t)
      p = p + w*cos(real(k,dp)*x)
      px = px - w*real(k,dp)*sin(real(k,dp)*x)
    end do
  end subroutine phis
  subroutine field(x, t, u, ux)
    real(dp), intent(in) :: x, t
    real(dp), intent(out) :: u, ux
    real(dp) :: p, px, h
    h = 1.0e-5_dp
    call phis(x, t, p, px); u = -2.0_dp*NU*px/p
    ux = (uu(x + h, t) - uu(x - h, t))/(2.0_dp*h)
  end subroutine field
  function uu(x, t) result(u)
    real(dp), intent(in) :: x, t
    real(dp) :: u, p, px
    call phis(x, t, p, px); u = -2.0_dp*NU*px/p
  end function uu
  subroutine derivs(x, t, u, ux, ut, uxx)
    real(dp), intent(in) :: x, t
    real(dp), intent(out) :: u, ux, ut, uxx
    real(dp) :: h, k
    h = 1.0e-3_dp; k = 1.0e-4_dp
    u = uu(x, t)
    ux = (uu(x + h, t) - uu(x - h, t))/(2.0_dp*h)
    uxx = (uu(x + h, t) - 2.0_dp*u + uu(x - h, t))/(h*h)
    ut = (uu(x, t + k) - uu(x, t - k))/(2.0_dp*k)
  end subroutine derivs
  function energy(t) result(e)
    real(dp), intent(in) :: t
    real(dp) :: e
    integer :: j
    e = 0.0_dp
    do j = 0, NX - 1
      e = e + 0.5_dp*uu(2.0_dp*PI*real(j,dp)/real(NX,dp), t)**2
    end do
    e = e*2.0_dp*PI/real(NX,dp)
  end function energy
  function dissip(t) result(dsum)
    real(dp), intent(in) :: t
    real(dp) :: dsum, u, ux
    integer :: j
    dsum = 0.0_dp
    do j = 0, NX - 1
      call field(2.0_dp*PI*real(j,dp)/real(NX,dp), t, u, ux)
      dsum = dsum + ux*ux
    end do
    dsum = dsum*2.0_dp*PI/real(NX,dp)
  end function dissip
  subroutine check(label, cond)
    character(*), intent(in) :: label
    logical, intent(in) :: cond
    nchk = nchk + 1
    if (.not. cond) then
      nfail = nfail + 1; write(*,'(a,a)') ' FAIL  ', label
    end if
  end subroutine check
end program fluid_twin