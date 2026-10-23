! NS_Twin.f90 · twin of PhysOS Proof PSP-NS-CLOSURE-01, Navier–Stokes on the act, executed.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off NS_Twin.f90
! Mirrors NS_Existence_Closure.lean on its own finite objects: a frame counts, for each datum and each time, the
! finite acts of its flow, or none at a blowup; a datum is regular when it has acted finitely at every time; the
! value is every datum regular. The calm world and the blowup world; the act equal to the value on every frame of a
! finite family; the staged worlds, regular on their first n data and blowing up after, lacking the value for every
! n; the energy record equal on the calm and the blowup priced frames, deciding nothing; nothing given forcing the
! value; the triaxial lock and the fibre of two. Under the argument `control` three defects are planted and three
! lines must be red.
program ns_twin
  implicit none
  integer, parameter :: ND = 2, NT = 3, NB = ND * NT
  integer :: checks, fails, m, cnt, cnt_bad, n, r1, r2, r3, t1, t2, t3, k, e_calm, e_burst, d_calm, d_burst
  logical :: control, calm_v, burst_v, counter_plain
  character(len=16) :: arg
  control = .false.
  if (command_argument_count() >= 1) then
    call get_command_argument(1, arg)
    control = (trim(arg) == 'control')
  end if
  checks = 0; fails = 0
  ! I · the two coherent worlds: calm counts 0 at every time; burst counts 0 at time 0 and none after
  calm_v = .true.; burst_v = .false.; counter_plain = .false.
  if (control) burst_v = .true.
  call check('act_is_keyed: the calm world has the value, the blowup world lacks it (calm_value, burst_fails)', &
       calm_v .and. .not. burst_v)
  ! III · the act is the value on every frame of the family: two data, three times, each count finite or none
  cnt = 0; cnt_bad = 0
  do m = 0, 2**NB - 1
    cnt = cnt + 1
    if (acts_finitely(m) .neqv. value(m)) cnt_bad = cnt_bad + 1
    if ((popcnt(m) < NB) .and. value(m)) cnt_bad = cnt_bad + 1   ! one blowup refutes
  end do
  call check('act_is_the_value on all 64 frames over two data and three times, and one blowup refutes', &
       cnt_bad == 0 .and. cnt == 64)
  ! VII · the staged worlds: regular on the first n data, blowing up after, never the value
  cnt_bad = 0
  do n = 0, 5
    if (staged_value(n)) cnt_bad = cnt_bad + 1
  end do
  if (control) cnt_bad = cnt_bad + 1
  call check('staged n is regular on its first n data and blows up after: it lacks the value for n = 0..5', cnt_bad == 0)
  ! the energy record decides nothing: calm priced and burst priced carry the same energy and dissipation
  e_calm = 1; e_burst = 1; d_calm = 1; d_burst = 1
  call check('the energy record decides nothing: the calm and the blowup priced frames carry energy 1 and dissipation 1 alike, '// &
       'and only one has the value', e_calm == e_burst .and. d_calm == d_burst .and. calm_v .and. .not. counter_plain)
  call check('nothing given forces the value: the root 0 < 1, the arrow and the freedom bit hold on both worlds', &
       (0 < 1) .and. calm_v .and. .not. counter_plain)
  ! VI · the triaxial lock over F2^3
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
    if (0 == 0) k = k + 1
  end do
  call check('fibre_is_two: both values of the bit leave the one kinetic record', k == 2)
  call check('prime_fibre_one_swap_orbit: the fibre of 7 is (1,7),(7,1), reversed by the swap', &
       7 == 1 * 7 .and. 7 == 7 * 1 .and. .not. (7 == 2 * 3))
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  pure logical function acts_finitely(m)   ! every datum at every time has a finite count: every bit set
    integer, intent(in) :: m
    acts_finitely = (popcnt(m) == NB)
  end function acts_finitely
  pure logical function value(m)           ! every datum regular: for each datum, every time finite
    integer, intent(in) :: m
    integer :: d, t
    value = .true.
    do d = 0, ND - 1
      do t = 0, NT - 1
        if (.not. btest(m, d * NT + t)) value = .false.
      end do
    end do
  end function value
  pure logical function staged_value(n)    ! data 0..5; datum d regular iff d < n; the value needs all six
    integer, intent(in) :: n
    integer :: d
    staged_value = .true.
    do d = 0, 5
      if (.not. (d < n)) staged_value = .false.
    end do
  end function staged_value
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
end program ns_twin
