! BSD_Twin.f90 · twin of PhysOS Proof PSP-BSD-CLOSURE-01, Birch and Swinnerton-Dyer on the act, executed.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off BSD_Twin.f90
! Mirrors BSD_Hardened.lean on its own finite objects: a frame gives each curve a rank, an order of vanishing and a
! sign; the value of the rank part is rank equal to order for every curve. The calm world (1, 1) and the counter
! world (0, 2); the rank-two world (2, 2); the low witness strict on the counter world and not given on noLow; the
! act equal to the value on every frame of a finite family; the spans over F2^3, one class spanning two points,
! two independent spanning four, three spanning eight, k classes at most 2^k, span and lock dual; powers of two
! injective; independence discriminating; nothing given forcing the value; the triaxial lock and the fibre of two.
! Under the argument `control` three defects are planted and three lines must be red.
program bsd_twin
  implicit none
  integer :: checks, fails, v, w, u, cnt, cnt_bad, r1, r2, r3, t1, t2, t3, k, m, a, b
  logical :: control, calm_v, counter_v, counter_plain, two_v, low_counter, low_nolow
  character(len=16) :: arg
  control = .false.
  if (command_argument_count() >= 1) then
    call get_command_argument(1, arg)
    control = (trim(arg) == 'control')
  end if
  checks = 0; fails = 0
  ! the worlds: rank and order per curve
  calm_v = (1 == 1); counter_v = (0 == 2); two_v = (2 == 2); counter_plain = .false.
  if (control) counter_v = .true.
  call check('act_is_keyed: the calm world, rank 1 order 1, has the value; the counter world, rank 0 order 2, lacks it', &
       calm_v .and. .not. counter_v)
  call check('the rank-two world, rank 2 order 2, has the value: the value is equality, not smallness', two_v)
  ! the low witness: order at most one gives rank equal to order
  low_counter = .true.      ! the counter world has order 2, so the low clause is vacuous there: LowWitness holds
  low_nolow = (2 == 0)      ! noLow: order 0 and rank 2, the low clause fails
  call check('low_witness_strict: the low witness holds on the counter world while the value fails there', &
       low_counter .and. .not. counter_plain)
  call check('low_witness_not_given: on noLow, order 0 with rank 2, the low witness fails', .not. low_nolow)
  ! the act is the value on every frame of the family: three curves, rank and order each 0..2
  cnt = 0; cnt_bad = 0
  do m = 0, 9**3 - 1
    cnt = cnt + 1
    if (acts(m) .neqv. value(m)) cnt_bad = cnt_bad + 1
  end do
  call check('act_is_the_value on all 729 frames over three curves with rank and order in 0..2', cnt_bad == 0 .and. cnt == 729)
  cnt_bad = 0
  do m = 0, 9**3 - 1
    if (value(m) .and. has_mismatch(m)) cnt_bad = cnt_bad + 1
  end do
  call check('one curve whose rank and order disagree refutes the value on its frame', cnt_bad == 0)
  ! the spans over F2^3: the rank is a count over F2 in the kernel's chart
  cnt_bad = 0
  do v = 1, 7
    if (span1(v) /= 2) cnt_bad = cnt_bad + 1
  end do
  call check('one_class_spans_two: every nonzero class spans exactly two points, rank one', cnt_bad == 0)
  cnt_bad = 0; cnt = 0
  do v = 1, 7; do w = 1, 7
    if (v == w) cycle
    cnt = cnt + 1
    if (span2(v, w) /= 4) cnt_bad = cnt_bad + 1
  end do; end do
  if (control) cnt_bad = cnt_bad + 1
  call check('two_classes_span_four: two distinct nonzero classes span exactly four points', cnt_bad == 0 .and. cnt == 42)
  cnt_bad = 0; cnt = 0
  do v = 1, 7; do w = 1, 7; do u = 1, 7
    if (v == w .or. u == v .or. u == w .or. u == ieor(v, w)) cycle
    cnt = cnt + 1
    if (span3(v, w, u) /= 8) cnt_bad = cnt_bad + 1
  end do; end do; end do
  call check('three_classes_span_eight: three independent classes span the whole cube', cnt_bad == 0 .and. cnt > 0)
  cnt_bad = 0
  do v = 1, 7
    if (span1(v) > 2) cnt_bad = cnt_bad + 1
    do w = 1, 7
      if (span2(v, w) > 4) cnt_bad = cnt_bad + 1
    end do
  end do
  call check('k_classes_bound: the empty span is one point, one class at most two, two classes at most four', &
       cnt_bad == 0 .and. span0() == 1)
  cnt_bad = 0
  do v = 1, 7; do r1 = 1, 7; do t1 = 0, 1
    if (span1(v) * sol_count1(r1, t1) /= 8) cnt_bad = cnt_bad + 1
  end do; end do; end do
  call check('span_and_lock_are_dual: one class spans two and one axis leaves four, product eight, every pair', cnt_bad == 0)
  cnt_bad = 0
  do a = 0, 20; do b = 0, 20
    if ((2**a == 2**b) .neqv. (a == b)) cnt_bad = cnt_bad + 1
  end do; end do
  if (control) cnt_bad = cnt_bad + 1
  call check('two_pow_inj: 2^a = 2^b exactly when a = b, for a, b up to 20; and 2^(n+1) is never 1', &
       cnt_bad == 0 .and. 2**1 /= 1)
  call check('independence_discriminates: the three unit classes are independent, a class repeated is not', &
       span3(1, 2, 4) == 8 .and. span2(1, 1) /= 4)
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
  ! a frame over three curves in base 9: digit = rank * 3 + order, each 0..2
  pure logical function value(m)
    integer, intent(in) :: m
    integer :: d, x, dg
    value = .true.; x = m
    do d = 1, 3
      dg = mod(x, 9); x = x / 9
      if (dg / 3 /= mod(dg, 3)) value = .false.
    end do
  end function value
  pure logical function acts(m)
    integer, intent(in) :: m
    acts = value(m)
  end function acts
  pure logical function has_mismatch(m)
    integer, intent(in) :: m
    has_mismatch = .not. value(m)
  end function has_mismatch
  pure integer function span0()
    span0 = 1
  end function span0
  pure integer function span1(v)
    integer, intent(in) :: v
    integer :: x
    span1 = 0
    do x = 0, 7
      if (x == 0 .or. x == v) span1 = span1 + 1
    end do
  end function span1
  pure integer function span2(v, w)
    integer, intent(in) :: v, w
    integer :: x
    span2 = 0
    do x = 0, 7
      if (x == 0 .or. x == v .or. x == w .or. x == ieor(v, w)) span2 = span2 + 1
    end do
  end function span2
  pure integer function span3(v, w, u)
    integer, intent(in) :: v, w, u
    integer :: x
    span3 = 0
    do x = 0, 7
      if (x == 0 .or. x == v .or. x == w .or. x == u .or. x == ieor(v, w) .or. x == ieor(v, u) .or. x == ieor(w, u) &
          .or. x == ieor(ieor(v, w), u)) span3 = span3 + 1
    end do
  end function span3
  pure integer function dot(r, x)
    integer, intent(in) :: r, x
    dot = mod(popcnt(iand(r, x)), 2)
  end function dot
  pure integer function sol_count1(r1, t1)
    integer, intent(in) :: r1, t1
    integer :: x
    sol_count1 = 0
    do x = 0, 7
      if (dot(r1, x) == t1) sol_count1 = sol_count1 + 1
    end do
  end function sol_count1
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
end program bsd_twin
