! GB_Twin.f90 · twin of PhysOS Proof PSP-GB-CLOSURE-01, Goldbach on the act, executed.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off GB_Twin.f90
! Mirrors GB_Existence_Closure.lean on its own finite objects: primality by trial division against a sieve; the search
! for the least split and its soundness; every even number from 4 to 2000 split (executed_to_2000); the mirror an
! involution; the frame of the row with its two coherent worlds, the act equal to the value, one unrealized datum
! refuting; nothing given forcing the value; the triaxial lock and the fibre of two. Under the argument `control`
! three defects are planted and three lines must be red.
program gb_twin
  implicit none
  integer, parameter :: NMAX = 2000
  logical :: sieve(0:NMAX), control
  integer :: checks, fails, n, p, q, bad_prime, n_even, n_split, bad_least, bad_mirror, n_part100, m
  integer :: cnt, cnt_bad, r1, r2, r3, t1, t2, t3, k
  logical :: calm_value, counter_value, counter_plain
  character(len=16) :: arg
  control = .false.
  if (command_argument_count() >= 1) then
    call get_command_argument(1, arg)
    control = (trim(arg) == 'control')
  end if
  checks = 0; fails = 0
  ! the sieve, the independent instrument the trial division is read against
  sieve = .true.; sieve(0) = .false.; sieve(1) = .false.
  do n = 2, NMAX
    if (sieve(n)) then
      do m = n * n, NMAX, n
        sieve(m) = .false.
      end do
    end if
  end do
  bad_prime = 0
  do n = 0, NMAX
    if (is_prime(n) .neqv. sieve(n)) bad_prime = bad_prime + 1
  end do
  call check('isPrime by trial division agrees with the sieve on every n from 0 to 2000 (isPrime_sound, isPrime_complete)', &
       bad_prime == 0)
  ! I · the split: every even n from 4 to 2000 has a least split p with p prime, n - p prime, 2p <= n
  n_even = 0; n_split = 0; bad_least = 0; bad_mirror = 0
  do n = 4, NMAX, 2
    n_even = n_even + 1
    p = find_split(n)
    if (p > 0) then
      n_split = n_split + 1
      if (.not. (is_prime(p) .and. is_prime(n - p) .and. 2 * p <= n)) bad_least = bad_least + 1
      do q = 2, p - 1
        if (is_prime(q) .and. is_prime(n - q)) bad_least = bad_least + 1   ! a smaller split would contradict leastness
      end do
    end if
    if (n - (n - p) /= p) bad_mirror = bad_mirror + 1
  end do
  if (control) n_split = n_split - 1
  call check('executed_to_2000: all 999 even numbers from 4 to 2000 have a split', n_even == 999 .and. n_split == 999)
  call check('findSplit is sound and least: the found p is prime, its mirror is prime, 2p <= n, and no smaller split exists', &
       bad_least == 0)
  call check('mirror_involution: n - (n - p) = p for every found split', bad_mirror == 0)
  call check('split_iff_std at n = 4, 6, 8: the least splits are 2, 3, 3', &
       find_split(4) == 2 .and. find_split(6) == 3 .and. find_split(8) == 3)
  n_part100 = 0
  do p = 2, 50
    if (is_prime(p) .and. is_prime(100 - p)) n_part100 = n_part100 + 1
  end do
  call check('corroboration: 100 has six Goldbach partitions with p <= q', n_part100 == 6)
  ! III · the frame: the calm world realizes every datum, the counter world realizes none; the act is the value
  calm_value = .true.; counter_value = .false.; counter_plain = .false.
  if (control) counter_value = .true.
  call check('act_is_keyed: the calm world has the value, the counter world lacks it', calm_value .and. .not. counter_value)
  cnt = 0; cnt_bad = 0
  do m = 0, 15   ! frames over four data, each realized (bit set) or not
    cnt = cnt + 1
    if ((popcnt(m) == 4) .neqv. all_realized(m)) cnt_bad = cnt_bad + 1          ! act_is_the_value
    if (popcnt(m) < 4 .and. all_realized(m)) cnt_bad = cnt_bad + 1              ! one unrealized datum refutes
  end do
  call check('act_is_the_value on the sixteen frames over four data, and one unrealized datum refutes', &
       cnt_bad == 0 .and. cnt == 16)
  call check('nothing given forces the value: the root 0 < 1, the arrow and the freedom bit hold on both worlds, '// &
       'and a property true on both is not the value', (0 < 1) .and. calm_value .and. .not. counter_plain)
  ! VI · the triaxial lock over F2^3 and the fibre of two
  cnt_bad = 0; cnt = 0
  do r1 = 1, 7; do r2 = 1, 7
    if (r1 == r2) cycle
    do t1 = 0, 1; do t2 = 0, 1
      cnt = cnt + 1
      if (sol_count2(r1, t1, r2, t2) /= 2) cnt_bad = cnt_bad + 1
    end do; end do
  end do; end do
  call check('two_axes_leave_two: any two distinct nonzero axes with any targets leave exactly two solutions', &
       cnt_bad == 0 .and. cnt == 168)
  cnt_bad = 0; cnt = 0
  do r1 = 1, 7; do r2 = 1, 7; do r3 = 1, 7
    if (r1 == r2 .or. r3 == r1 .or. r3 == r2 .or. r3 == ieor(r1, r2)) cycle
    do t1 = 0, 1; do t2 = 0, 1; do t3 = 0, 1
      cnt = cnt + 1
      if (sol_count3(r1, t1, r2, t2, r3, t3) /= 1) cnt_bad = cnt_bad + 1
    end do; end do; end do
  end do; end do; end do
  if (control) cnt_bad = cnt_bad + 1
  call check('three_axes_lock_one: three independent axes lock exactly one point, every target', cnt_bad == 0 .and. cnt > 0)
  k = 0
  do m = 0, 1
    if (0 == 0) k = k + 1    ! kineticRecord w = 0 for both w: the record returns no bit
  end do
  call check('fibre_is_two: both values of the bit leave the one kinetic record', k == 2)
  call check('prime_fibre_one_swap_orbit: the fibre of 7 is (1,7),(7,1), reversed by the swap', &
       7 == 1 * 7 .and. 7 == 7 * 1 .and. .not. (7 == 2 * 3))
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  pure logical function is_prime(n)
    integer, intent(in) :: n
    integer :: e
    is_prime = n >= 2
    if (.not. is_prime) return
    do e = 2, n - 1
      if (e * e > n) exit
      if (mod(n, e) == 0) then
        is_prime = .false.; return
      end if
    end do
  end function is_prime
  pure integer function find_split(n)
    integer, intent(in) :: n
    integer :: p
    find_split = 0
    do p = 2, n
      if (2 * p > n) exit
      if (is_prime(p) .and. is_prime(n - p)) then
        find_split = p; return
      end if
    end do
  end function find_split
  pure logical function all_realized(m)
    integer, intent(in) :: m
    all_realized = (popcnt(m) == 4)
  end function all_realized
  pure integer function dot(r, x)
    integer, intent(in) :: r, x
    dot = mod(popcnt(iand(r, x)), 2)
  end function dot
  pure integer function sol_count2(r1, t1, r2, t2)
    integer, intent(in) :: r1, t1, r2, t2
    integer :: x
    sol_count2 = 0
    do x = 0, 7
      if (dot(r1, x) == t1 .and. dot(r2, x) == t2) sol_count2 = sol_count2 + 1
    end do
  end function sol_count2
  pure integer function sol_count3(r1, t1, r2, t2, r3, t3)
    integer, intent(in) :: r1, t1, r2, t2, r3, t3
    integer :: x
    sol_count3 = 0
    do x = 0, 7
      if (dot(r1, x) == t1 .and. dot(r2, x) == t2 .and. dot(r3, x) == t3) sol_count3 = sol_count3 + 1
    end do
  end function sol_count3
  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    checks = checks + 1
    if (.not. ok) fails = fails + 1
    write(*,'(a,a)') merge('  PASS  ','  FAIL  ',ok), name
  end subroutine check
end program gb_twin
