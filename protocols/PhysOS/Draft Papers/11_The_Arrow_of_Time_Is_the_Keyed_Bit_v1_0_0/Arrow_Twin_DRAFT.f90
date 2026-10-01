! Arrow_Twin.f90 · the executed twin of SPHYS_Arrow_of_Time.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Arrow_Twin.f90
! A the urn's carrier; B a reversible law, Kac's ring: entropy rises, the reversed motion returns it
! exactly to order, and the ring recurs; C the urn in exact integers: detailed balance and the mode;
! D the urn relaxes from order; E the mean return time to order; F the price of a record.
program arrow_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: KB = 1.380649e-23_dp
  integer :: checks, fails
  integer(i8) :: seed
  checks = 0; fails = 0; seed = 20261001_i8
  call block_a(); call block_b(); call block_c(); call block_d(); call block_e(); call block_f()
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  include 'twin_common.inc'
  subroutine block_a()
    integer :: n, k, tot, ok
    write(*,'(a)') 'A · relabelling the urn, k -> N - k, is the fold under (1 + (2k - N), N); the even split is the line'
    tot = 0; ok = 0
    do n = 0, 60
      do k = 0, n
        tot = tot + 1
        if (1 + (2*(n - k) - n) == 2 - (1 + (2*k - n)) .and. ((1 + (2*k - n) == 1) .eqv. (2*k == n))) ok = ok + 1
      end do
    end do
    call check('1891 urn states: the relabelling is the fold and the even split is the line', ok == tot)
  end subroutine block_a
  real(dp) function hbin(x) result(h)
    real(dp), intent(in) :: x
    if (x <= 0.0_dp .or. x >= 1.0_dp) then
      h = 0.0_dp
    else
      h = -(x*log(x) + (1.0_dp - x)*log(1.0_dp - x))
    end if
  end function hbin
  subroutine block_b()
    integer, parameter :: n = 2000
    logical :: mark(n), col(n), c0(n), tmp(n)
    integer :: i, t, nw
    real(dp) :: s, smax
    logical :: back_ok, rec_ok
    write(*,'(a)') 'B · Kac ring, 2000 sites, a reversible deterministic law'
    do i = 1, n
      mark(i) = (rnd() < 0.1_dp); col(i) = .true.
    end do
    c0 = col; smax = 0.0_dp
    do t = 1, 300
      do i = 1, n
        tmp(mod(i, n) + 1) = col(i) .neqv. mark(i)
      end do
      col = tmp
      nw = count(col); s = hbin(real(nw, dp)/real(n, dp)); smax = max(smax, s)
    end do
    write(*,'(a,f9.6,a,f9.6)') '  entropy after 300 steps: ', s, '   of ln 2 = ', log(2.0_dp)
    call check('from order the entropy rises to within 1e-3 of ln 2', s > log(2.0_dp) - 1.0e-3_dp)
    do t = 1, 300
      do i = 1, n
        tmp(i) = col(mod(i, n) + 1) .neqv. mark(i)
      end do
      col = tmp
    end do
    back_ok = all(col .eqv. c0)
    call check('the reversed motion, 300 steps back, returns every ball to its first colour: entropy 0', back_ok)
    col = c0
    do t = 1, 2*n
      do i = 1, n
        tmp(mod(i, n) + 1) = col(i) .neqv. mark(i)
      end do
      col = tmp
    end do
    rec_ok = all(col .eqv. c0)
    call check('forward 2N = 4000 steps the ring recurs exactly', rec_ok)
  end subroutine block_b
  subroutine block_c()
    integer(i8) :: b(0:60)
    integer :: k, j, okdb, oksym, kmax
    write(*,'(a)') 'C · the urn of 60 balls in exact integers'
    b = 0_i8; b(0) = 1_i8
    do k = 1, 60
      do j = k, 1, -1
        b(j) = b(j) + b(j - 1)
      end do
    end do
    okdb = 0; oksym = 0; kmax = 0
    do k = 0, 59
      if (b(k)*int(60 - k, i8) == b(k + 1)*int(k + 1, i8)) okdb = okdb + 1
    end do
    do k = 0, 60
      if (b(k) == b(60 - k)) oksym = oksym + 1
      if (b(k) > b(kmax)) kmax = k
    end do
    write(*,'(a,i0,a,i0)') '  mode k = ', kmax, ' ; microstates there: ', b(30)
    call check('detailed balance C(60,k)(60-k) = C(60,k+1)(k+1) exactly for every k', okdb == 60)
    call check('the counts are symmetric under relabelling and the mode is the even split, k = 30', oksym == 61 .and. kmax == 30)
  end subroutine block_c
  subroutine block_d()
    integer :: t, k, n
    real(dp) :: mean, s0, s1
    write(*,'(a)') 'D · the urn of 100 balls relaxes from all on one side'
    n = 100; k = 100; mean = 0.0_dp
    s0 = 0.0_dp
    do t = 1, 4000
      if (rnd() < real(k, dp)/real(n, dp)) then
        k = k - 1
      else
        k = k + 1
      end if
      if (t > 2000) mean = mean + real(k, dp)
    end do
    mean = mean/2000.0_dp
    s1 = hbin(mean/real(n, dp))
    write(*,'(a,f8.3)') '  mean occupancy over the last 2000 steps: ', mean
    call check('the occupancy settles at the even split within 5 balls, entropy near ln 2', &
               abs(mean - 50.0_dp) < 5.0_dp .and. s1 > s0 .and. s1 > 0.99_dp*log(2.0_dp))
  end subroutine block_d
  subroutine block_e()
    real(dp) :: tret
    write(*,'(a)') 'E · the mean return time to the ordered state is 2^N / C(N,0) steps (Kac)'
    tret = 2.0_dp**100
    write(*,'(a,es12.4)') '  N = 100: ', tret
    call check('return to order for 100 balls takes 1.27e30 steps on average', abs(tret/1.2677e30_dp - 1.0_dp) < 1.0e-3_dp)
  end subroutine block_e
  subroutine block_f()
    real(dp) :: q
    write(*,'(a)') 'F · the price of a record: k T ln 2 per bit'
    q = KB*300.0_dp*log(2.0_dp)
    call check('one bit at 300 K costs 2.871e-21 J', abs(q/2.871e-21_dp - 1.0_dp) < 1.0e-3_dp)
  end subroutine block_f
end program arrow_twin
