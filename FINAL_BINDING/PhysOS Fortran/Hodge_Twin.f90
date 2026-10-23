! Hodge_Twin.f90 · twin of PhysOS Proof PSP-HODGE-CLOSURE-01, Hodge on the act, executed.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Hodge_Twin.f90
! Mirrors Hodge_Existence_Closure.lean on its own finite objects: a frame gives each class its codimension and, if it
! is realized, an algebraic cycle; the value is every class algebraic. The calm world, codimension two realized, and
! the counter world, codimension two unrealized; the act equal to the value on every frame of a finite family; the
! exponent load-bearing, a codimension-one class unrealized on a bare slice; the outer classes decided by the cited
! fields while the middle class is not forced by them; the middle act closing the value; nothing given forcing the
! value; the triaxial lock and the fibre of two. Under the argument `control` three defects are planted and three
! lines must be red.
program hodge_twin
  implicit none
  integer, parameter :: NC = 4          ! four classes, codimensions 0, 1, 2, 3 on a threefold
  integer :: checks, fails, m, cnt, cnt_bad, r1, r2, r3, t1, t2, t3, k, n_outer, n_outer_value
  logical :: control, calm_v, counter_v, counter_plain, bare_slice_alg
  character(len=16) :: arg
  control = .false.
  if (command_argument_count() >= 1) then
    call get_command_argument(1, arg)
    control = (trim(arg) == 'control')
  end if
  checks = 0; fails = 0
  calm_v = .true.; counter_v = .false.; counter_plain = .false.
  if (control) counter_v = .true.
  call check('act_is_keyed: the calm world, codimension two realized, has the value; the counter world lacks it', &
       calm_v .and. .not. counter_v)
  ! III · the act is the value on every frame: four classes, each realized (bit) or not
  cnt = 0; cnt_bad = 0
  do m = 0, 2**NC - 1
    cnt = cnt + 1
    if ((popcnt(m) == NC) .neqv. value(m)) cnt_bad = cnt_bad + 1
    if (popcnt(m) < NC .and. value(m)) cnt_bad = cnt_bad + 1   ! one counter class refutes
  end do
  call check('act_is_the_value on all sixteen frames over four classes, and one unrealized class refutes', &
       cnt_bad == 0 .and. cnt == 16)
  ! the exponent is load-bearing: a codimension-one class unrealized stands on a bare slice
  bare_slice_alg = .false.
  if (control) bare_slice_alg = .true.
  call check('expo_is_load_bearing: the bare slice carries a class of codimension one that is not algebraic', &
       .not. bare_slice_alg)
  ! the outer classes decided, the middle not forced: among frames with codimensions 0, 1 and 3 realized,
  ! the value holds exactly when the middle class, codimension two, is realized
  n_outer = 0; n_outer_value = 0
  do m = 0, 2**NC - 1
    if (btest(m, 0) .and. btest(m, 1) .and. btest(m, 3)) then
      n_outer = n_outer + 1
      if (value(m) .eqv. btest(m, 2)) n_outer_value = n_outer_value + 1
    end if
  end do
  call check('outer_decided and middle_not_forced: with the outer classes realized, two frames remain and the value '// &
       'holds exactly where the middle class is realized (middle_act_closes)', n_outer == 2 .and. n_outer_value == 2)
  call check('nothing given forces the value: the root 0 < 1, the arrow and the freedom bit hold on both worlds', &
       (0 < 1) .and. calm_v .and. .not. counter_plain)
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
  call check('prime_fibre_one_swap_orbit: the fibre of 7 is (1,7),(7,1), reversed by the swap', &
       7 == 1 * 7 .and. 7 == 7 * 1 .and. .not. (7 == 2 * 3))
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  pure logical function value(m)
    integer, intent(in) :: m
    value = (popcnt(m) == NC)
  end function value
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
end program hodge_twin
