! Remembered_Offered_Twin.f90 · twin of PhysOS Proof PSP-REMEMBERED-OFFERED-01, the remembered and the offered, executed.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Remembered_Offered_Twin.f90
! Ten checks, each beside a control that must fail. Run plain, the ten checks pass and each control is shown to fail
! as it must: twenty lines, no failure. Run with the argument  control , each check runs with its defect planted and
! all ten lines are red.
! The chart: offsets -1, 0, 1 and heights 0, 1, 2; nine points; the worlds are the 512 subsets.
!   I     the Tongue always has a world: the floor holds on every world, closed worlds without the value among them.
!         Control: the floor read as the value.
!   II    one self, one place at a time: the floor and least erasure differ on some closed world.
!         Control: least erasure read as the floor.
!   III   the twins: least erasure and the value agree on all 512 worlds; registration and fold differ at (1,0).
!         Control: a registration that keeps the side.
!   IV    the remembered and the offered: every record is lossless; a world is its own record exactly at the value.
!         Control: a registration that keeps the side.
!   V     the one-bit gap: remembering is stable, and every world shares its record with its memory.
!         Control: the record taken through the fold.
!   Vb    the forcing by heat: at temperatures 1 to 3, a closed world registers at zero heat exactly at the value,
!         pays at least one unit otherwise, and within a record the free world is one. Control: forgetting made free.
!   VI    the chain: registration lands every point on the line; the line rests both maps; least erasure is standing
!         on the locus. Control: a registration that lands at offset one.
!   VIb   zero time remembers: at t = 0 the toy separates width 0 from width 1; at t = 1 to 20 it does not; the width
!         never grows. Control: a flow that forgets nothing.
!   VII   two doors, no third: on every world exactly one of the value and an off-line member. Control: the off-line
!         test reading only the right side.
!   VIII  a band forces nothing: a closed world within offset 3 lacks the value; the band of width 0 is the value.
!         Control: the band of width 0 offered as the band of width 3.
program remembered_offered_twin
  implicit none
  integer :: checks, fails
  logical :: ctl
  character(len=32) :: arg
  checks = 0; fails = 0
  call get_command_argument(1, arg)
  ctl = (trim(arg) == 'control')
  if (ctl) write(*,'(a)') ' CONTROL FLAG SET: each check runs with its defect planted; every line below must be red'
  call pair('I: the floor holds on every world, closed worlds without the value among them', &
            'the floor read as the value', tongue_world(.false.), tongue_world(.true.))
  call pair('II: the floor and least erasure differ on some closed world', &
            'least erasure read as the floor', one_self(.false.), one_self(.true.))
  call pair('III: least erasure and the value agree on all 512 worlds; registration and fold differ at (1,0)', &
            'a registration that keeps the side', twins(.false.), twins(.true.))
  call pair('IV: every record is lossless, and a world is its own record exactly at the value', &
            'a registration that keeps the side', remembered(.false.), remembered(.true.))
  call pair('V: remembering is stable, and every world shares its record with its memory', &
            'the record taken through the fold', gap(.false.), gap(.true.))
  call pair('Vb: zero heat exactly at the value, at least one unit otherwise, one free world to a record', &
            'forgetting made free', heat(.false.), heat(.true.))
  call pair('VI: registration lands on the line, the line rests both maps, least erasure is standing on it', &
            'a registration that lands at offset one', chain(.false.), chain(.true.))
  call pair('VIb: zero time separates width 0 from width 1, every later time does not, the width never grows', &
            'a flow that forgets nothing', zero_time(.false.), zero_time(.true.))
  call pair('VII: on every world exactly one door: the value, or a member off the line', &
            'the off-line test reading only the right side', doors(.false.), doors(.true.))
  call pair('VIII: a closed world within offset 3 lacks the value; the band of width 0 is the value', &
            'the band of width 0 offered as the band of width 3', band(.false.), band(.true.))
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  subroutine check(label, ok)
    character(len=*), intent(in) :: label
    logical, intent(in) :: ok
    checks = checks + 1
    if (ok) then
      write(*,'(2a)') '  PASS  ', label
    else
      fails = fails + 1
      write(*,'(2a)') '  FAIL  ', label
    end if
  end subroutine check
  subroutine pair(label, defect, ok, okdef)
    character(len=*), intent(in) :: label, defect
    logical, intent(in) :: ok, okdef
    if (.not. ctl) then
      call check(label, ok)
      call check(label(1:index(label, ':')) // ' control, ' // defect // ': the check fails, as it must', .not. okdef)
    else
      call check(label(1:index(label, ':')) // ' [defect planted: ' // defect // '] ' // &
                 label(index(label, ':') + 2:), okdef)
    end if
  end subroutine pair
  ! the chart
  pure function fold(p) result(q)
    integer, intent(in) :: p(2)
    integer :: q(2)
    q = [-p(1), p(2)]
  end function fold
  pure function reg(p, mode) result(q)
    integer, intent(in) :: p(2), mode
    integer :: q(2)
    select case (mode)
    case (1)
      q = p                    ! defect: keeps the side
    case (2)
      q = [1, p(2)]            ! defect: lands at offset one
    case default
      q = [0, p(2)]            ! the registration: keeps the height, forgets the side
    end select
  end function reg
  pure logical function online(p)
    integer, intent(in) :: p(2)
    online = p(1) == 0
  end function online
  pure integer function idx(p)
    integer, intent(in) :: p(2)
    idx = p(2) * 3 + p(1) + 2
  end function idx
  pure function pt(i) result(p)
    integer, intent(in) :: i
    integer :: p(2)
    p = [mod(i - 1, 3) - 1, (i - 1) / 3]
  end function pt
  pure logical function member(m, i)
    integer, intent(in) :: m, i
    member = btest(m, i - 1)
  end function member
  pure logical function closed(m)
    integer, intent(in) :: m
    integer :: i
    closed = .true.
    do i = 1, 9
      if (member(m, i) .and. .not. member(m, idx(fold(pt(i))))) closed = .false.
    end do
  end function closed
  pure logical function value(m)
    integer, intent(in) :: m
    integer :: i
    value = .true.
    do i = 1, 9
      if (member(m, i) .and. .not. online(pt(i))) value = .false.
    end do
  end function value
  pure logical function lerasure(m, mode)
    integer, intent(in) :: m, mode
    integer :: i
    lerasure = .true.
    do i = 1, 9
      if (member(m, i)) then
        if (any(reg(pt(i), mode) /= pt(i))) lerasure = .false.
      end if
    end do
  end function lerasure
  ! the record of a world: the image of its members under the registration, or under the fold for the control of V
  pure integer function rec(m, mode)
    integer, intent(in) :: m, mode
    integer :: i, q(2)
    rec = 0
    do i = 1, 9
      if (member(m, i)) then
        if (mode == 3) then
          q = fold(pt(i))
        else
          q = reg(pt(i), mode)
        end if
        if (q(1) >= -1 .and. q(1) <= 1) rec = ibset(rec, idx(q) - 1)
      end if
    end do
  end function rec
  logical function tongue_world(defect)
    logical, intent(in) :: defect
    integer :: m, nfalse
    logical :: floor
    tongue_world = .true.; nfalse = 0
    do m = 0, 511
      floor = (0 < 1)
      if (defect) floor = value(m)
      if (.not. floor) tongue_world = .false.
      if (closed(m) .and. .not. value(m) .and. floor) nfalse = nfalse + 1
    end do
    tongue_world = tongue_world .and. nfalse > 0
  end function tongue_world
  logical function one_self(defect)
    logical, intent(in) :: defect
    integer :: m, ndiff
    logical :: floor, le
    ndiff = 0
    do m = 0, 511
      if (.not. closed(m)) cycle
      floor = (0 < 1)
      le = lerasure(m, 0)
      if (defect) le = floor
      if (floor .neqv. le) ndiff = ndiff + 1
    end do
    one_self = ndiff > 0
  end function one_self
  logical function twins(defect)
    logical, intent(in) :: defect
    integer :: m, mode
    mode = merge(1, 0, defect)
    twins = .true.
    do m = 0, 511
      if (lerasure(m, mode) .neqv. value(m)) twins = .false.
    end do
    twins = twins .and. any(reg([1, 0], mode) /= fold([1, 0]))
  end function twins
  logical function remembered(defect)
    logical, intent(in) :: defect
    integer :: m, mode
    mode = merge(1, 0, defect)
    remembered = .true.
    do m = 0, 511
      if (.not. value(rec(m, mode)) .and. .not. defect) remembered = .false.
      if ((rec(m, mode) == m) .neqv. value(m)) remembered = .false.
    end do
  end function remembered
  logical function gap(defect)
    logical, intent(in) :: defect
    integer :: m, mode
    mode = merge(3, 0, defect)
    gap = .true.
    do m = 0, 511
      if (rec(rec(m, mode), mode) /= rec(m, mode)) gap = .false.
      if (rec(rec(m, mode), 0) /= rec(m, 0) .and. .not. defect) gap = .false.
    end do
  end function gap
  pure integer function erased(m)
    integer, intent(in) :: m
    integer :: t
    erased = 0
    do t = 0, 2
      if (member(m, idx([1, t])) .or. member(m, idx([-1, t]))) erased = erased + 1
    end do
  end function erased
  logical function heat(defect)
    logical, intent(in) :: defect
    integer :: m, m2, temp, cost, nfree
    heat = .true.
    do m = 0, 511
      if (.not. closed(m)) cycle
      do temp = 1, 3
        cost = erased(m) * temp
        if (defect) cost = 0
        if ((cost == 0) .neqv. value(m)) heat = .false.
        if (.not. value(m) .and. cost < temp) heat = .false.
      end do
      nfree = 0
      do m2 = 0, 511
        if (closed(m2) .and. value(m2) .and. rec(m2, 0) == rec(m, 0)) nfree = nfree + 1
      end do
      if (nfree /= 1) heat = .false.
    end do
  end function heat
  logical function chain(defect)
    logical, intent(in) :: defect
    integer :: i, m, mode
    mode = merge(2, 0, defect)
    chain = .true.
    do i = 1, 9
      if (.not. online(reg(pt(i), mode))) chain = .false.
      if (online(pt(i))) then
        if (any(fold(pt(i)) /= pt(i)) .or. any(reg(pt(i), mode) /= pt(i))) chain = .false.
      end if
    end do
    do m = 0, 511
      if (lerasure(m, 0) .neqv. value(m)) chain = .false.
    end do
  end function chain
  pure integer function flow(d2, t, keep)
    integer, intent(in) :: d2, t
    logical, intent(in) :: keep
    if (keep) then
      flow = d2
    else
      flow = max(d2 - 2 * t, 0)
    end if
  end function flow
  logical function zero_time(defect)
    logical, intent(in) :: defect
    integer :: d2, t
    zero_time = flow(0, 0, defect) == 0 .and. flow(1, 0, defect) /= 0
    do t = 1, 20
      if (flow(0, t, defect) /= 0 .or. flow(1, t, defect) /= 0) zero_time = .false.
    end do
    do d2 = 0, 20
      do t = 0, 20
        if (flow(d2, t + 1, defect) > flow(d2, t, defect)) zero_time = .false.
      end do
    end do
  end function zero_time
  logical function doors(defect)
    logical, intent(in) :: defect
    integer :: m, i, p(2)
    logical :: off
    doors = .true.
    do m = 0, 511
      off = .false.
      do i = 1, 9
        if (member(m, i)) then
          p = pt(i)
          if (defect) then
            if (p(1) >= 1) off = .true.
          else
            if (.not. online(pt(i))) off = .true.
          end if
        end if
      end do
      if (value(m) .eqv. off) doors = .false.
    end do
  end function doors
  pure logical function within(m, k)
    integer, intent(in) :: m, k
    integer :: i, p(2)
    within = .true.
    do i = 1, 9
      p = pt(i)
      if (member(m, i) .and. abs(p(1)) > k) within = .false.
    end do
  end function within
  logical function band(defect)
    logical, intent(in) :: defect
    integer :: m, k, nopen
    k = merge(0, 3, defect)
    nopen = 0
    do m = 0, 511
      if (closed(m) .and. within(m, k) .and. .not. value(m)) nopen = nopen + 1
    end do
    band = nopen > 0
    do m = 0, 511
      if (within(m, 0) .neqv. value(m)) band = .false.
    end do
  end function band
end program remembered_offered_twin
