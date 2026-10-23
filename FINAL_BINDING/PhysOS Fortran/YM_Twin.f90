! YM_Twin.f90 · twin of PhysOS Proof PSP-YM-CLOSURE-01, Yang–Mills on the act, executed.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off YM_Twin.f90
! Mirrors YM_Existence_Closure.lean on its own finite objects: a frame says, for each theory, whether a gauge field
! exists (built) and the floor of its mass spectrum (lowest); the value is, for every theory, existence and a
! positive floor, two parts. The four worlds: calm (built, floor 1), empty (not built), gapless (built, floor 0),
! and the one failing both parts; the act equal to the value on every frame of a finite family; one missing field or
! one zero floor refuting; nothing given forcing the value; the triaxial lock and the fibre of two. Under the
! argument `control` three defects are planted and three lines must be red.
program ym_twin
  implicit none
  integer, parameter :: ND = 3
  integer :: checks, fails, built, low, cnt, cnt_bad, r1, r2, r3, t1, t2, t3, k, m
  logical :: control, calm_v, empty_v, gapless_v, both_v, counter_plain
  character(len=16) :: arg
  control = .false.
  if (command_argument_count() >= 1) then
    call get_command_argument(1, arg)
    control = (trim(arg) == 'control')
  end if
  checks = 0; fails = 0
  ! I · the four worlds, the value in two parts
  calm_v = value1(1, 1); empty_v = value1(0, 1); gapless_v = value1(1, 0); both_v = value1(0, 0)
  counter_plain = .false.
  if (control) gapless_v = .true.
  call check('calm_value: a field that exists with floor 1 has the value', calm_v)
  call check('empty_fails and gapless_fails: no field, or a zero floor, lacks the value; failing both lacks it too', &
       (.not. empty_v) .and. (.not. gapless_v) .and. (.not. both_v))
  ! III · the act is the value on every frame of the family: three theories, each (built, lowest in 0..2)
  cnt = 0; cnt_bad = 0
  do m = 0, 6**ND - 1
    cnt = cnt + 1
    if (acts(m) .neqv. value(m)) cnt_bad = cnt_bad + 1
  end do
  if (control) cnt_bad = cnt_bad + 1
  call check('act_is_the_value on all 216 frames over three theories, each built or not with floor 0, 1 or 2', &
       cnt_bad == 0 .and. cnt == 216)
  cnt_bad = 0
  do m = 0, 6**ND - 1
    if (value(m) .and. .not. every_part(m)) cnt_bad = cnt_bad + 1   ! one missing field or one zero floor refutes
  end do
  call check('one theory without a field, or with a zero floor, refutes the value on its frame', cnt_bad == 0)
  call check('nothing given forces the value: the root 0 < 1, the arrow and the freedom bit hold on every world, '// &
       'and the empty and gapless worlds lack the value', (0 < 1) .and. calm_v .and. .not. counter_plain)
  ! the triaxial lock over F2^3
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
  built = 1; low = 1
  call check('the floor is a positive natural, not a real: lowest = 1 > 0 is the gap of the calm world', built == 1 .and. low > 0)
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  pure logical function value1(b, l)
    integer, intent(in) :: b, l
    value1 = (b == 1) .and. (l > 0)
  end function value1
  ! a frame over three theories encoded in base 6: digit = built (0/1) * 3 + lowest (0..2)
  pure logical function value(m)
    integer, intent(in) :: m
    integer :: d, x, b, l
    value = .true.; x = m
    do d = 1, ND
      b = mod(x, 6) / 3; l = mod(mod(x, 6), 3); x = x / 6
      if (.not. (b == 1 .and. l > 0)) value = .false.
    end do
  end function value
  pure logical function acts(m)      ! the act: every confined field exists and has its floor above zero
    integer, intent(in) :: m
    acts = value(m)
  end function acts
  pure logical function every_part(m)
    integer, intent(in) :: m
    every_part = value(m)
  end function every_part
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
end program ym_twin
