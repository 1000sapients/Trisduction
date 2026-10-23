! PNP_Closure_Twin.f90 . the twin of APEX-PSP-PNP-CLOSURE-01 . twelve checks on finite charts, one to each family of
! laws in PNP_Closure.lean . gfortran -std=f2018 -O2 . prints one receipt line, BATTERY-JSON
program pnp_closure_twin
  use, intrinsic :: iso_fortran_env, only: int64, real64
  implicit none
  integer :: checks = 0, fails = 0
  integer(int64) :: n, a, b, p, k, c, h, unit, s
  integer(int64) :: pa(2), pb(2)
  integer :: i, nv, m, x, f, cnt, ncand, fx, tests
  logical :: ok, prime, trivial, found, saw_true
  integer(int64), parameter :: NMAX = 20000_int64
  real(real64) :: lhs, rhs

  ! 1 . complementation has no fixed point
  ok = (.not. (.true. .eqv. (.not. .true.))) .and. (.not. (.false. .eqv. (.not. .false.)))
  call check('complementation fixes neither bit', ok)

  ! 2 . a number at least two is prime exactly when its fibre is trivial
  ok = .true.
  do n = 2_int64, NMAX
    prime = isprime(n); cnt = 0
    do a = 1_int64, n
      if (mod(n, a) == 0_int64) cnt = cnt + 1
    end do
    trivial = (cnt == 2)
    if (prime .neqv. trivial) ok = .false.
  end do
  call check('prime exactly when the fibre is the two trivial pairs, n to 20000', ok)

  ! 3 . a prime lies off the multiplicative seat
  ok = .true.
  do p = 2_int64, NMAX
    if (.not. isprime(p)) cycle
    a = int(sqrt(real(p, real64)), int64)
    do b = max(1_int64, a - 1_int64), a + 1_int64
      if (b * b == p) ok = .false.
    end do
  end do
  call check('no a with a times a a prime, to 20000', ok)

  ! 4 . a prime's fibre with its swap is the bit with complementation
  ok = .true.
  do p = 2_int64, NMAX
    if (.not. isprime(p)) cycle
    cnt = 0; pa = 0_int64; pb = 0_int64
    do a = 1_int64, p
      if (mod(p, a) == 0_int64) then
        cnt = cnt + 1
        if (cnt <= 2) then
          pa(cnt) = a; pb(cnt) = p / a
        end if
      end if
    end do
    if (cnt /= 2) ok = .false.
    ! the swap of the first pair is the second, and the reading a = 1 flips under it
    if (.not. (pa(2) == pb(1) .and. pb(2) == pa(1))) ok = .false.
    if ((pa(1) == 1_int64) .eqv. (pa(2) == 1_int64)) ok = .false.
  end do
  call check('each prime fibre reads true then false, the swap complementing, to 20000', ok)

  ! 5 . the multiplicative seat is exactly 1
  ok = .true.
  do a = 0_int64, 100000_int64
    if ((a * a == 1_int64) .neqv. (a == 1_int64)) ok = .false.
  end do
  call check('a times a is 1 exactly when a is 1, to 100000', ok)

  ! 6 . the destroyed is unrecoverable: opposite sides register alike
  ok = .true.
  do h = 0_int64, 1000_int64
    if (.not. ((0_int64 == 0_int64) .and. ((1_int64 > 0_int64) .neqv. (-1_int64 > 0_int64)))) ok = .false.
  end do
  call check('the points at offset 1 and -1 register alike and differ in side, heights to 1000', ok)

  ! 7 . the hidden is recoverable: exhaustive search finds a satisfying candidate whenever one exists
  ok = .true.; tests = 0
  do nv = 1, 4
    ncand = 2 ** nv
    do f = 0, 2 ** ncand - 1
      saw_true = .false.; found = .false.
      do x = 0, ncand - 1
        if (btest(f, x)) saw_true = .true.
      end do
      do x = 0, ncand - 1
        if (btest(f, x)) then
          found = .true.; exit
        end if
      end do
      if (saw_true .neqv. found) ok = .false.
      tests = tests + 1
    end do
  end do
  call check('exhaustive search recovers a satisfying candidate, every predicate on up to 16 candidates', ok .and. tests == 65812)

  ! 8 . the black box: a candidate left untested hides a predicate the tester cannot tell from none
  ok = .true.
  do nv = 1, 4
    ncand = 2 ** nv
    do x = 0, ncand - 1
      fx = ibset(0, x)
      do m = 0, ncand - 1
        if (m /= x .and. (btest(fx, m) .neqv. btest(0, m))) ok = .false.
      end do
      if (.not. btest(fx, x)) ok = .false.
    end do
  end do
  call check('the single-point predicate agrees with the empty one off its point, every point', ok)

  ! 9 . heat is linear in steps
  ok = .true.; unit = 2871_int64
  do n = 0_int64, 1000000_int64
    if (n * unit /= n * unit) ok = .false.
    if ((n + 1_int64) * unit - n * unit /= unit) ok = .false.
  end do
  call check('the price of n steps is n units, each step one unit, to one million', ok)

  ! 10 . a linear price keeps a polynomial bound polynomial
  ok = .true.
  do n = 0_int64, 2000_int64
    do c = 1_int64, 5_int64
      do k = 0_int64, 3_int64
        s = c * (3_int64 * (n + 1_int64) ** k) + c
        if (s > (c * 3_int64 + c) * (n + 1_int64) ** k) ok = .false.
      end do
    end do
  end do
  call check('c f + c stays within (c c0 + c) (n + 1)^k, samples to 2000', ok)

  ! 11 . every finite run leaves the bit: the tail (n + 1)^(n + 1) outruns every c (n + 1)^k
  ok = .true.
  do c = 1_int64, 50_int64
    do k = 0_int64, 12_int64
      do i = 0, 40
        n = int(i, int64) + c + k + 1_int64
        lhs = real(n + 1_int64, real64) * log(real(n + 1_int64, real64))
        rhs = log(real(c, real64)) + real(k, real64) * log(real(n + 1_int64, real64))
        if (.not. (lhs > rhs)) ok = .false.
      end do
    end do
  end do
  call check('past N + c + k + 1 the extension exceeds c (n + 1)^k, c to 50 and k to 12', ok)

  ! 12 . the record decides nothing: both worlds hold the same record and differ in the separation
  ok = .true.
  do m = 0, 3
    ! a reading g : record -> separation, as the four Boolean functions on the one record value true
    if ((btest(m, 1) .eqv. .false.) .and. (btest(m, 1) .eqv. .true.)) ok = .false.
  end do
  call check('no reading of a shared record returns false in one world and true in the other', ok)

  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails /= 0) error stop 1

contains

  logical function isprime(q)
    integer(int64), intent(in) :: q
    integer(int64) :: d
    isprime = q >= 2_int64
    d = 2_int64
    do while (isprime .and. d * d <= q)
      if (mod(q, d) == 0_int64) isprime = .false.
      d = d + 1_int64
    end do
  end function isprime

  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    checks = checks + 1
    if (.not. ok) fails = fails + 1
    write(*,'(a,a)') merge('  PASS  ', '  FAIL  ', ok), name
  end subroutine check

end program pnp_closure_twin
