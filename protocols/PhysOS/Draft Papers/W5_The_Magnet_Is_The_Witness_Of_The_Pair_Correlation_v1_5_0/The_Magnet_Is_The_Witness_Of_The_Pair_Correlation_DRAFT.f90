! PairCorr_Twin.f90 · twin of "The Magnet Is the Witness of the Pair Correlation" · Fortran 2018.
! Tridiagonal beta-Hermite ensembles (Dumitriu-Edelman 2002): beta = 1 (orthogonal, time-even,
! the class of nuclei) and beta = 2 (unitary, time broken by a magnetic term, the class of the
! Riemann zeros), with Poisson levels as the uncorrelated control. Eigenvalues by Sturm
! bisection; unfolding by the pooled empirical count; spacing statistics in the bulk.
program paircorr_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: N = 100, M = 300
  real(dp), parameter :: PI = 3.14159265358979323846_dp
  real(dp) :: v1, f1, v2, f2, v0, f0
  integer :: nchk, nfail
  integer(8) :: seed
  nchk = 0; nfail = 0; seed = 20260927_8
  call ensemble(1, v1, f1)
  call ensemble(2, v2, f2)
  call poisson(v0, f0)
  call check('orthogonal class (time-even): spacing variance near the Wigner value 0.273', abs(v1 - 0.286_dp) < 0.03_dp)
  call check('unitary class (time broken): spacing variance near the Wigner value 0.178', abs(v2 - 0.180_dp) < 0.03_dp)
  call check('uncorrelated control: spacing variance near one', abs(v0 - 1.0_dp) < 0.1_dp)
  call check('repulsion ordered: small spacings rarer with time broken than time even', f2 < f1)
  call check('repulsion present: small spacings rarer in both classes than without correlation', f1 < f0)
  call check('the two classes are distinguishable by variance', v1 - v2 > 0.05_dp)
  write(*,'(a,2f9.4)') ' orthogonal (beta 1): variance, P(s < 0.1) = ', v1, f1
  write(*,'(a,2f9.4)') ' unitary    (beta 2): variance, P(s < 0.1) = ', v2, f2
  write(*,'(a,2f9.4)') ' Poisson control    : variance, P(s < 0.1) = ', v0, f0
  write(*,'(a,2f9.4)') ' Wigner surmise P(s < 0.1), beta 1 and 2   = ', 1.0_dp - exp(-PI*0.01_dp/4.0_dp), &
                       wig2(0.1_dp)
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', nchk, ',"failures":', nfail, '}'
  if (nfail > 0) error stop 1
contains
  function rnd() result(r)
    real(dp) :: r
    seed = mod(16807_8*seed, 2147483647_8)
    r = (real(seed, dp) + 0.5_dp) / 2147483647.0_dp
  end function rnd
  function gauss() result(g)
    real(dp) :: g
    g = sqrt(-2.0_dp*log(rnd())) * cos(2.0_dp*PI*rnd())
  end function gauss
  function chi(k) result(c)
    integer, intent(in) :: k
    real(dp) :: c
    integer :: q
    c = 0.0_dp
    do q = 1, k
      c = c + gauss()**2
    end do
    c = sqrt(c)
  end function chi
  function wig2(s) result(p)                             ! P(s < s0) for the beta = 2 surmise
    real(dp), intent(in) :: s
    real(dp) :: p, x, dx
    integer :: q
    p = 0.0_dp; dx = s/2000.0_dp
    do q = 1, 2000
      x = (real(q,dp) - 0.5_dp)*dx
      p = p + (32.0_dp/PI**2)*x*x*exp(-4.0_dp*x*x/PI)*dx
    end do
  end function wig2
  integer function sturm(d, e2, x) result(cnt)          ! eigenvalues below x
    real(dp), intent(in) :: d(N), e2(N), x
    real(dp) :: q
    integer :: i
    cnt = 0; q = d(1) - x
    if (q < 0.0_dp) cnt = cnt + 1
    do i = 2, N
      if (abs(q) < 1.0e-300_dp) q = 1.0e-300_dp
      q = d(i) - x - e2(i)/q
      if (q < 0.0_dp) cnt = cnt + 1
    end do
  end function sturm
  subroutine eigs(d, e2, lam)
    real(dp), intent(in) :: d(N), e2(N)
    real(dp), intent(out) :: lam(N)
    real(dp) :: lo, hi, a, b, c, bound
    integer :: k, it
    bound = 0.0_dp
    do k = 1, N
      bound = max(bound, abs(d(k)) + 2.0_dp*sqrt(maxval(e2)))
    end do
    lo = -bound - 1.0_dp; hi = bound + 1.0_dp
    do k = 1, N
      a = lo; b = hi
      do it = 1, 80
        c = 0.5_dp*(a + b)
        if (sturm(d, e2, c) >= k) then
          b = c
        else
          a = c
        end if
      end do
      lam(k) = 0.5_dp*(a + b)
    end do
  end subroutine eigs
  subroutine stats(all, v, f)                           ! pooled unfolding, bulk spacings
    real(dp), intent(in) :: all(N, M)
    real(dp), intent(out) :: v, f
    real(dp), allocatable :: pool(:)
    real(dp) :: u(N), s, sm, ss
    integer :: j, k, ns, nsm, lo, hi, mid
    allocate(pool(N*M)); pool = reshape(all, [N*M]); call shellsort(pool)
    sm = 0.0_dp; ss = 0.0_dp; ns = 0; nsm = 0
    do j = 1, M
      do k = 1, N
        lo = 1; hi = N*M                                 ! rank by binary search
        do while (lo < hi)
          mid = (lo + hi)/2
          if (pool(mid) < all(k,j)) then
            lo = mid + 1
          else
            hi = mid
          end if
        end do
        u(k) = real(lo, dp) / real(M, dp)                ! unfolded: mean spacing one
      end do
      do k = N/4, 3*N/4 - 1
        s = u(k+1) - u(k)
        sm = sm + s; ss = ss + s*s; ns = ns + 1
        if (s < 0.1_dp) nsm = nsm + 1
      end do
    end do
    sm = sm/ns; v = ss/ns - sm*sm; v = v/(sm*sm); f = real(nsm,dp)/real(ns,dp)
  end subroutine stats
  subroutine ensemble(beta, v, f)
    integer, intent(in) :: beta
    real(dp), intent(out) :: v, f
    real(dp) :: d(N), e2(N), lam(N)
    real(dp), allocatable :: all(:,:)
    integer :: j, k
    allocate(all(N, M))
    do j = 1, M
      e2(1) = 0.0_dp
      do k = 1, N
        d(k) = sqrt(2.0_dp)*gauss()
        if (k > 1) e2(k) = chi(beta*(N - k + 1))**2
      end do
      call eigs(d, e2, lam)
      all(:, j) = lam
    end do
    call stats(all, v, f)
  end subroutine ensemble
  subroutine poisson(v, f)
    real(dp), intent(out) :: v, f
    real(dp), allocatable :: all(:,:)
    real(dp) :: x(N)
    integer :: j, k
    allocate(all(N, M))
    do j = 1, M
      do k = 1, N
        x(k) = rnd()
      end do
      call shellsort(x)
      all(:, j) = x
    end do
    call stats(all, v, f)
  end subroutine poisson
  subroutine shellsort(a)
    real(dp), intent(inout) :: a(:)
    integer :: gap, i, j, n
    real(dp) :: t
    n = size(a); gap = n/2
    do while (gap > 0)
      do i = gap + 1, n
        t = a(i); j = i
        do while (j > gap)
          if (a(j - gap) <= t) exit
          a(j) = a(j - gap); j = j - gap
        end do
        a(j) = t
      end do
      gap = gap/2
    end do
  end subroutine shellsort
  subroutine check(label, cond)
    character(*), intent(in) :: label
    logical, intent(in) :: cond
    nchk = nchk + 1
    if (.not. cond) then
      nfail = nfail + 1; write(*,'(a,a)') ' FAIL  ', label
    end if
  end subroutine check
end program paircorr_twin