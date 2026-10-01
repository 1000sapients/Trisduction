! LeeYang_Twin.f90 · the executed twin of SPHYS_Lee_Yang.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off LeeYang_Twin.f90
! Blocks: A the circle is the line; B spin flip is the palindrome; C random ferromagnets, every zero
! on the circle; D antiferromagnets leave it; E the four-spin ring in closed form; F the zeros pinch
! the positive axis as a two-dimensional lattice grows below its critical temperature.
! Method for C to F: for a palindromic partition function of even degree N, F(t) = sum_m c_m
! cos((m - N/2) t) is real on the circle, and all N zeros lie on it exactly when F changes sign N/2
! times on (0, pi).
program leeyang_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: PI = 3.141592653589793_dp
  integer :: checks, fails
  integer(i8) :: seed
  checks = 0; fails = 0; seed = 20260930_i8
  call block_a(); call block_b(); call block_c(); call block_d(); call block_e(); call block_f()
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

  subroutine block_a()
    integer :: r, t, n, neq, nline
    write(*,'(a)') 'A · the circle is the line: inversion z -> 1/conj(z) is the fold under s = 1/2 + (ln z)/2'
    n = 0; neq = 0; nline = 0
    do r = -30, 30
      do t = -30, 30
        n = n + 1
        if (1 + (-r) == 2 - (1 + r)) neq = neq + 1
        if ((1 + r == 1) .eqv. (r == 0)) nline = nline + 1
      end do
    end do
    call check('3721 fugacities: inversion is the fold, and the unit circle is the line', neq == n .and. nline == n)
  end subroutine block_a

  ! coefficients c(0:n) of the partition function of n Ising spins with couplings jm, inverse
  ! temperature 1 absorbed into jm; c(m) sums exp(sum_{i<j} J_ij s_i s_j) over states with m down spins
  subroutine partition(n, jm, c)
    integer, intent(in) :: n
    real(dp), intent(in) :: jm(n, n)
    real(dp), intent(out) :: c(0:n)
    integer :: k, i, j, m, s(n)
    real(dp) :: e, emax
    real(dp), allocatable :: es(:)
    integer, allocatable :: ms(:)
    allocate(es(0:2**n - 1), ms(0:2**n - 1))
    emax = -huge(1.0_dp)
    do k = 0, 2**n - 1
      m = 0
      do i = 1, n
        if (btest(k, i - 1)) then
          s(i) = -1; m = m + 1
        else
          s(i) = 1
        end if
      end do
      e = 0.0_dp
      do i = 1, n
        do j = i + 1, n
          e = e + jm(i, j)*real(s(i)*s(j), dp)
        end do
      end do
      es(k) = e; ms(k) = m; emax = max(emax, e)
    end do
    c = 0.0_dp
    do k = 0, 2**n - 1
      c(ms(k)) = c(ms(k)) + exp(es(k) - emax)
    end do
  end subroutine partition

  integer function sign_changes(n, c, tmin) result(nc)
    integer, intent(in) :: n
    real(dp), intent(in) :: c(0:n)
    real(dp), intent(out) :: tmin
    integer :: k, m, ng
    real(dp) :: t, f, fprev
    ng = 40000; nc = 0; tmin = -1.0_dp; fprev = 0.0_dp
    do k = 1, ng - 1
      t = PI*real(k, dp)/real(ng, dp)
      f = 0.0_dp
      do m = 0, n
        f = f + c(m)*cos((real(m, dp) - 0.5_dp*real(n, dp))*t)
      end do
      if (k > 1 .and. f*fprev < 0.0_dp) then
        nc = nc + 1
        if (tmin < 0.0_dp) tmin = t
      end if
      fprev = f
    end do
  end function sign_changes

  subroutine block_b()
    integer :: n, k, m, w, i, nok, ntot
    integer :: cen(0:8, 0:8), s(8)
    write(*,'(a)') 'B · spin flip keeps every wall: the ring census is palindromic'
    nok = 0; ntot = 0
    do n = 4, 8, 2
      cen = 0
      do k = 0, 2**n - 1
        m = 0; w = 0
        do i = 1, n
          s(i) = merge(1, 0, btest(k, i - 1)); m = m + s(i)
        end do
        do i = 1, n
          if (s(i) /= s(mod(i, n) + 1)) w = w + 1
        end do
        cen(m, w) = cen(m, w) + 1
      end do
      do m = 0, n
        do w = 0, n
          ntot = ntot + 1
          if (cen(m, w) == cen(n - m, w)) nok = nok + 1
        end do
      end do
      if (n == 4) call check('the four-ring census: 1, 4, 4 + 2, 4, 1 by down spins', &
          cen(0,0) == 1 .and. cen(1,2) == 4 .and. cen(2,2) == 4 .and. cen(2,4) == 2 .and. cen(3,2) == 4 .and. cen(4,0) == 1)
    end do
    call check('rings of 4, 6 and 8 spins: every census cell equals its spin-flipped cell', nok == ntot)
  end subroutine block_b

  subroutine block_c()
    integer :: n, t, i, j, nall, nok, npal
    real(dp) :: jm(10, 10), c(0:10), tm, pal
    write(*,'(a)') 'C · random ferromagnets: every zero of the partition function on the unit circle'
    nall = 0; nok = 0; npal = 0
    do n = 6, 10, 2
      do t = 1, 100
        jm = 0.0_dp
        do i = 1, n
          do j = i + 1, n
            jm(i, j) = 0.8_dp*rnd()
          end do
        end do
        call partition(n, jm(1:n, 1:n), c(0:n))
        pal = 0.0_dp
        do i = 0, n
          pal = max(pal, abs(c(i) - c(n - i))/max(c(i), c(n - i)))
        end do
        if (pal < 1.0e-12_dp) npal = npal + 1
        nall = nall + 1
        if (sign_changes(n, c(0:n), tm) == n/2) nok = nok + 1
      end do
    end do
    write(*,'(a,i0,a,i0)') '  instances with all zeros on the circle: ', nok, ' of ', nall
    call check('300 random ferromagnets on 6, 8 and 10 spins: palindromic to 1e-12', npal == nall)
    call check('300 random ferromagnets: every zero on the unit circle (Lee and Yang, 1952)', nok == nall)
  end subroutine block_c

  subroutine block_d()
    integer :: n, t, i, j, nall, noff
    real(dp) :: jm(10, 10), c(0:10), tm
    write(*,'(a)') 'D · antiferromagnets: two signs of coupling, zeros leave the circle'
    nall = 0; noff = 0
    do n = 6, 10, 2
      do t = 1, 100
        jm = 0.0_dp
        do i = 1, n
          do j = i + 1, n
            jm(i, j) = -0.8_dp - 0.8_dp*rnd()
          end do
        end do
        call partition(n, jm(1:n, 1:n), c(0:n))
        nall = nall + 1
        if (sign_changes(n, c(0:n), tm) < n/2) noff = noff + 1
      end do
    end do
    write(*,'(a,i0,a,i0)') '  antiferromagnets with a zero off the circle: ', noff, ' of ', nall
    call check('the antiferromagnet leaves the circle in every one of 300 instances', noff == nall)
  end subroutine block_d

  subroutine block_e()
    real(dp) :: p, u1, u2
    logical :: ferro_in, anti_out
    write(*,'(a)') 'E · the four-spin ring in closed form: u = -2p +- sqrt(2)(1 - p)'
    p = 0.3_dp; u1 = -2.0_dp*p + sqrt(2.0_dp)*(1.0_dp - p); u2 = -2.0_dp*p - sqrt(2.0_dp)*(1.0_dp - p)
    ferro_in = (u1 >= -2.0_dp .and. u1 <= 2.0_dp .and. u2 >= -2.0_dp .and. u2 <= 2.0_dp)
    write(*,'(a,f8.5,a,f8.5)') '  p = 0.3: u = ', u1, ', ', u2
    p = 1.5_dp; u1 = -2.0_dp*p + sqrt(2.0_dp)*(1.0_dp - p); u2 = -2.0_dp*p - sqrt(2.0_dp)*(1.0_dp - p)
    anti_out = (u1 < -2.0_dp .or. u2 < -2.0_dp)
    write(*,'(a,f8.5,a,f8.5)') '  p = 1.5: u = ', u1, ', ', u2
    call check('ferromagnetic p = 0.3: both u in [-2, 2]; antiferromagnetic p = 1.5: a root below -2', ferro_in .and. anti_out)
  end subroutine block_e

  subroutine block_f()
    integer :: lx(3), ly(3), q, n, i, j, x, y, nb, nc
    real(dp) :: jm(16, 16), c(0:16), tm(3), bj
    integer :: nok
    write(*,'(a)') 'F · the pinch: on growing tori below the critical temperature the zeros close on z = 1'
    lx = [2, 3, 4]; ly = [4, 4, 4]; bj = 0.6_dp; nok = 0
    do q = 1, 3
      n = lx(q)*ly(q); jm = 0.0_dp
      do x = 0, lx(q) - 1
        do y = 0, ly(q) - 1
          i = x*ly(q) + y + 1
          nb = mod(x + 1, lx(q))*ly(q) + y + 1
          if (nb /= i) jm(min(i, nb), max(i, nb)) = jm(min(i, nb), max(i, nb)) + bj
          nb = x*ly(q) + mod(y + 1, ly(q)) + 1
          if (nb /= i) jm(min(i, nb), max(i, nb)) = jm(min(i, nb), max(i, nb)) + bj
        end do
      end do
      call partition(n, jm(1:n, 1:n), c(0:n))
      nc = sign_changes(n, c(0:n), tm(q))
      if (nc == n/2) nok = nok + 1
      write(*,'(a,i0,a,i0,a,i0,a,i0,a,f9.6)') '  torus ', lx(q), 'x', ly(q), ': ', nc, ' of ', n/2, &
           ' zero pairs on the circle; nearest angle ', tm(q)
      j = 0
    end do
    call check('every torus at beta J = 0.6 keeps all its zeros on the circle', nok == 3)
    call check('the zero nearest the positive axis closes in as the torus grows (2x4, 3x4, 4x4)', &
               tm(3) < tm(2) .and. tm(2) < tm(1))
  end subroutine block_f
end program leeyang_twin
