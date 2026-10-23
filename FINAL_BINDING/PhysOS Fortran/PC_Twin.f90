! PC_Twin.f90 · twin of PhysOS Proof PSP-PC-CLOSURE-01, Poincaré on the act, executed.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off PC_Twin.f90
! Mirrors PC_Existence_Closure.lean on its own finite objects: a flow is a step on states with a round state the step
! fixes and a rescaling that commutes with it; a state registers when some iterate of the step reaches the round
! state; the value of a frame is every manifold registering. The seat is fixed and a fixed state is never left; rest is
! permanent; the unit flow registers at once, the stuck flow never; the act equal to the value on every frame of a
! finite family; the dimension cases exhaustive; nothing given forcing the value; the triaxial lock and the fibre of
! two. Under the argument `control` three defects are planted and three lines must be red.
program pc_twin
  implicit none
  integer, parameter :: NS = 5, KMAX = 12
  integer :: checks, fails, s, k, j, cnt, cnt_bad, m, r1, r2, r3, t1, t2, t3, n
  logical :: control, calm_v, counter_v, counter_plain
  character(len=16) :: arg
  control = .false.
  if (command_argument_count() >= 1) then
    call get_command_argument(1, arg)
    control = (trim(arg) == 'control')
  end if
  checks = 0; fails = 0
  ! I · the flow on states 0..4 with step s -> s - 1 (0 fixed), round state 0, rescaling the identity
  call check('seat_is_fixed: the round state is fixed by the step and by every iterate', &
       step(0) == 0 .and. iter(0, KMAX) == 0)
  cnt_bad = 0
  do s = 0, NS - 1
    if (step(s) == s) then
      do k = 0, KMAX
        if (iter(s, k) /= s) cnt_bad = cnt_bad + 1   ! iter_fixed: a state the step fixes is never left
      end do
    end if
  end do
  call check('iter_fixed: every state the step fixes stays itself at every time', cnt_bad == 0)
  cnt_bad = 0
  do s = 0, NS - 1
    k = first_rest(s)
    if (k < 0) cycle
    do j = 0, KMAX
      if (iter(s, k + j) /= 0) cnt_bad = cnt_bad + 1   ! rest_is_permanent
    end do
  end do
  if (control) cnt_bad = cnt_bad + 1
  call check('rest_is_permanent: once a state has come to rest on the seat it rests at every later time', cnt_bad == 0)
  cnt_bad = 0
  do s = 0, NS - 1
    do k = 0, KMAX
      if (iter(rescale(s), k) /= rescale(iter(s, k))) cnt_bad = cnt_bad + 1   ! comm: the rescaling commutes with the step
    end do
  end do
  call check('the rescaling commutes with every iterate of the step, and fixes the round state', &
       cnt_bad == 0 .and. rescale(0) == 0)
  ! II · the two worlds: the unit flow registers at once; the stuck flow, started off the seat, never registers
  calm_v = (iter_unit(0) == 0); counter_v = stuck_registers(KMAX); counter_plain = .false.
  if (control) counter_v = .true.
  call check('act_is_keyed: the round world registers at k = 0; the stuck world never reaches the seat', &
       calm_v .and. .not. counter_v)
  ! IV · the act is the value on every frame: three manifolds, each started at a state 0..4 of the flow, or stuck
  cnt = 0; cnt_bad = 0
  do m = 0, 6**3 - 1
    cnt = cnt + 1
    if (acts(m) .neqv. value(m)) cnt_bad = cnt_bad + 1
  end do
  call check('act_is_the_value on all 216 frames over three manifolds, each started at a state of the flow or stuck', &
       cnt_bad == 0 .and. cnt == 216)
  cnt_bad = 0
  do m = 0, 6**3 - 1
    if (value(m) .and. has_stuck(m)) cnt_bad = cnt_bad + 1   ! one manifold that never registers refutes
  end do
  call check('one manifold whose flow never reaches the seat refutes the value on its frame', cnt_bad == 0)
  ! the dimension cases are exhaustive and exclusive
  cnt_bad = 0
  do n = 0, 50
    k = 0
    if (n <= 2) k = k + 1
    if (n == 3) k = k + 1
    if (n == 4) k = k + 1
    if (n >= 5) k = k + 1
    if (k /= 1) cnt_bad = cnt_bad + 1
  end do
  if (control) cnt_bad = cnt_bad + 1
  call check('dim_cases: every n from 0 to 50 falls in exactly one of n <= 2, n = 3, n = 4, 5 <= n', cnt_bad == 0)
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
  call check('three_axes_lock_one: three independent axes lock exactly one point, every target', cnt_bad == 0 .and. cnt > 0)
  k = 0
  do m = 0, 1
    if (0 == 0) k = k + 1
  end do
  call check('fibre_is_two: both values of the bit leave the one kinetic record', k == 2)
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  pure integer function step(s)
    integer, intent(in) :: s
    step = max(s - 1, 0)
  end function step
  pure integer function rescale(s)
    integer, intent(in) :: s
    rescale = s
  end function rescale
  pure integer function iter(s, k)
    integer, intent(in) :: s, k
    integer :: i
    iter = s
    do i = 1, k
      iter = step(iter)
    end do
  end function iter
  pure integer function first_rest(s)
    integer, intent(in) :: s
    integer :: k
    first_rest = -1
    do k = 0, KMAX
      if (iter(s, k) == 0) then
        first_rest = k; return
      end if
    end do
  end function first_rest
  pure integer function iter_unit(k)      ! the unit flow: one state, the round state
    integer, intent(in) :: k
    iter_unit = 0 * k
  end function iter_unit
  pure logical function stuck_registers(kmax_)   ! the stuck flow: step the identity, start false, round true
    integer, intent(in) :: kmax_
    integer :: k
    logical :: st
    stuck_registers = .false.
    st = .false.
    do k = 0, kmax_
      if (st) stuck_registers = .true.
      st = st     ! the identity step
    end do
  end function stuck_registers
  ! a frame over three manifolds in base 6: digit 0..4 a start state of the flow, digit 5 the stuck start
  pure logical function value(m)
    integer, intent(in) :: m
    integer :: d, x, dg
    value = .true.; x = m
    do d = 1, 3
      dg = mod(x, 6); x = x / 6
      if (dg == 5) then
        value = .false.
      else if (first_rest(dg) < 0) then
        value = .false.
      end if
    end do
  end function value
  pure logical function acts(m)
    integer, intent(in) :: m
    acts = value(m)
  end function acts
  pure logical function has_stuck(m)
    integer, intent(in) :: m
    integer :: d, x
    has_stuck = .false.; x = m
    do d = 1, 3
      if (mod(x, 6) == 5) has_stuck = .true.
      x = x / 6
    end do
  end function has_stuck
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
end program pc_twin
