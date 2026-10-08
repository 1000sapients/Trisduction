! Annihilation_Closure_Twin.f90 · twin of Book Three of Annihilation_Closure.lean, the annihilation closure, executed.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Annihilation_Closure_Twin.f90
! Eight checks, each beside a control that must fail. Run plain, the eight checks pass and each control is shown to
! fail as it must: sixteen lines, no failure. Run with the argument  control , each check runs with its defect
! planted and all eight lines are red.
! The chart: offsets -1, 0, 1 and heights 0, 1, 2; nine points; the worlds are the 512 subsets.
! Monism is computed as the root read twice: every member returned unchanged by both readings, the fold and the
! registration. Co-location is the floor (0 < 1, standing everywhere) together with Monism.
!   I    four names, one proposition: on all 512 worlds least erasure, the value, Monism and co-location agree.
!        Control: Monism read as the floor alone.
!   II   the sole witness: every candidate equivalent to the value equals Monism on all worlds; worlds of one record
!        differ in value, so no reading of the record witnesses; the floor is universal and is not the value.
!        Control: a record that keeps the side.
!   III  co-location is not universal: the floor stands on every closed world and Monism fails on some.
!        Control: Monism read as the floor alone.
!   IV   the timeless zone, in the toy of the bound: for widths 0 to 20 the width is real at time zero exactly when
!        Λ = 0; width 0 is real and width 1 is not at time zero; both are real at every time from 1 to 20; the width
!        never grows. Control: a flow that forgets nothing.
!   V    determinacy, not selection: every world stands behind exactly one door, the value or a member off the line;
!        a closed world lacks the value with the floor on it, and a closed world has it.
!        Control: the off-line test reading only the right side.
!   VI   the check: a closed off-line pair world and a closed true world leave one record, differ in value and in Monism,
!        and each has least erasure exactly when it has the value; every principle true on all closed worlds, the
!        floor and closure themselves, holds on the pair world. Control: a record that keeps the side.
!   VII  the Unicorn cut, Book Four: at every height T = 0, 1, 2 and on all 512 worlds, the value is exactly the Real
!        part (heights up to T on the line) and the Unicorn part (heights above T on the line); and given the Real
!        part, the value is exactly the Unicorn part. Control: the cut taken strictly, heights below T only.
!   VIII the Unicorn contained: on every world with the value, the act's field, every member above every height
!        stands on the line; and above every height a fold pair leaves one record with opposite sides, so no reading
!        of the record decides the side. Control: worlds without the value admitted to the act's field.
program annihilation_closure_twin
  implicit none
  integer :: checks, fails
  logical :: ctl
  character(len=32) :: arg
  checks = 0; fails = 0
  call get_command_argument(1, arg)
  ctl = (trim(arg) == 'control')
  if (ctl) write(*,'(a)') ' CONTROL FLAG SET: each check runs with its defect planted; every line below must be red'
  call pair('I: on all 512 worlds least erasure, the value, Monism and co-location agree', &
            'Monism read as the floor alone', four_names(.false.), four_names(.true.))
  call pair('II: Monism the sole witness, the record witnesses nothing, the universal floor is not the value', &
            'a record that keeps the side', sole_witness(.false.), sole_witness(.true.))
  call pair('III: the floor stands on every closed world and Monism fails on some', &
            'Monism read as the floor alone', colocation(.false.), colocation(.true.))
  call pair('IV: real at time zero exactly at Λ = 0; widths 0 and 1 separate at zero and join at every later time', &
            'a flow that forgets nothing', timeless(.false.), timeless(.true.))
  call pair('V: exactly one door on every world; a closed off-line pair world with the floor, and a closed true world', &
            'the off-line test reading only the right side', determinacy(.false.), determinacy(.true.))
  call pair('VI: one record, two closed worlds, different values; every closed principle holds on the pair world', &
            'a record that keeps the side', the_check(.false.), the_check(.true.))
  call pair('VII: at every height the value is exactly its Real part and its Unicorn part; no bypass', &
            'the cut taken strictly', unicorn_cut(.false.), unicorn_cut(.true.))
  call pair('VIII: on the act''s field no arrival above any height is off the line; the record never decides the side', &
            'worlds without the value admitted', unicorn_contained(.false.), unicorn_contained(.true.))
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
    if (mode == 1) then
      q = p                    ! defect: keeps the side
    else
      q = [0, p(2)]            ! the registration: keeps the height, forgets the side
    end if
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
  pure logical function lerasure(m)
    integer, intent(in) :: m
    integer :: i
    lerasure = .true.
    do i = 1, 9
      if (member(m, i)) then
        if (any(reg(pt(i), 0) /= pt(i))) lerasure = .false.
      end if
    end do
  end function lerasure
  ! Monism, the root read twice: every member returned unchanged by the fold and by the registration
  pure logical function monism(m)
    integer, intent(in) :: m
    integer :: i
    monism = .true.
    do i = 1, 9
      if (member(m, i)) then
        if (any(fold(pt(i)) /= pt(i)) .or. any(reg(pt(i), 0) /= pt(i))) monism = .false.
      end if
    end do
  end function monism
  pure integer function rec(m, mode)
    integer, intent(in) :: m, mode
    integer :: i, q(2)
    rec = 0
    do i = 1, 9
      if (member(m, i)) then
        q = reg(pt(i), mode)
        rec = ibset(rec, idx(q) - 1)
      end if
    end do
  end function rec
  pure logical function offline_member(m, rightonly)
    integer, intent(in) :: m
    logical, intent(in) :: rightonly
    integer :: i, p(2)
    offline_member = .false.
    do i = 1, 9
      if (member(m, i)) then
        p = pt(i)
        if (rightonly) then
          if (p(1) == 1) offline_member = .true.
        else
          if (.not. online(p)) offline_member = .true.
        end if
      end if
    end do
  end function offline_member

  ! I · four names, one proposition
  logical function four_names(defect)
    logical, intent(in) :: defect
    integer :: m
    logical :: floor, mon, coloc
    four_names = .true.
    do m = 0, 511
      floor = (0 < 1)
      mon = monism(m)
      if (defect) mon = floor
      coloc = floor .and. mon
      if ((lerasure(m) .neqv. value(m)) .or. (mon .neqv. value(m)) .or. (coloc .neqv. value(m))) &
        four_names = .false.
    end do
  end function four_names

  ! II · Monism the sole witness
  logical function sole_witness(defect)
    logical, intent(in) :: defect
    integer :: m, n, mode, pairs
    logical :: floor_is_value
    sole_witness = .true.
    mode = 0
    if (defect) mode = 1
    do m = 0, 511
      ! every candidate equivalent to the value is Monism: least erasure and co-location, computed independently
      if ((lerasure(m) .neqv. monism(m)) .or. (((0 < 1) .and. monism(m)) .neqv. monism(m))) sole_witness = .false.
    end do
    pairs = 0
    do m = 0, 511
      do n = m + 1, 511
        if (rec(m, mode) == rec(n, mode) .and. (value(m) .neqv. value(n))) pairs = pairs + 1
      end do
    end do
    if (pairs == 0) sole_witness = .false.
    floor_is_value = .true.
    do m = 0, 511
      if (.not. value(m)) floor_is_value = .false.
    end do
    if (floor_is_value) sole_witness = .false.
  end function sole_witness

  ! III · co-location is not universal
  logical function colocation(defect)
    logical, intent(in) :: defect
    integer :: m, nfail
    logical :: floor, mon
    colocation = .true.; nfail = 0
    do m = 0, 511
      if (.not. closed(m)) cycle
      floor = (0 < 1)
      if (.not. floor) colocation = .false.
      mon = monism(m)
      if (defect) mon = floor
      if (.not. mon) nfail = nfail + 1
    end do
    if (nfail == 0) colocation = .false.
  end function colocation

  ! IV · the timeless zone in the toy of the bound
  integer function flow(d2, t, defect)
    integer, intent(in) :: d2, t
    logical, intent(in) :: defect
    if (defect) then
      flow = d2
    else
      flow = max(d2 - 2 * t, 0)
    end if
  end function flow
  logical function timeless(defect)
    logical, intent(in) :: defect
    integer :: d2, t, lam
    timeless = .true.
    do d2 = 0, 20
      lam = (d2 + 1) / 2
      if ((flow(d2, 0, defect) == 0) .neqv. (lam == 0)) timeless = .false.
      do t = 0, 19
        if (flow(d2, t + 1, defect) > flow(d2, t, defect)) timeless = .false.
      end do
    end do
    if (flow(0, 0, defect) /= 0 .or. flow(1, 0, defect) == 0) timeless = .false.
    do t = 1, 20
      if (flow(0, t, defect) /= 0 .or. flow(1, t, defect) /= 0) timeless = .false.
    end do
  end function timeless

  ! V · determinacy, not selection
  logical function determinacy(defect)
    logical, intent(in) :: defect
    integer :: m
    logical :: v, o, has_false, has_true
    determinacy = .true.; has_false = .false.; has_true = .false.
    do m = 0, 511
      v = value(m)
      o = offline_member(m, defect)
      if (v .eqv. o) determinacy = .false.
      if (closed(m) .and. .not. v .and. (0 < 1)) has_false = .true.
      if (closed(m) .and. v .and. m /= 0) has_true = .true.
    end do
    if (.not. (has_false .and. has_true)) determinacy = .false.
  end function determinacy

  ! VI · the check
  logical function the_check(defect)
    logical, intent(in) :: defect
    integer :: m, n, mode
    logical :: found
    mode = 0
    if (defect) mode = 1
    found = .false.
    do m = 0, 511
      if (.not. closed(m) .or. value(m)) cycle
      do n = 0, 511
        if (.not. closed(n) .or. .not. value(n)) cycle
        if (rec(m, mode) /= rec(n, mode)) cycle
        if (monism(m) .or. .not. monism(n)) cycle
        if ((lerasure(m) .neqv. value(m)) .or. (lerasure(n) .neqv. value(n))) cycle
        ! every principle true on all closed worlds holds on m: the floor and closure themselves
        if (.not. ((0 < 1) .and. closed(m))) cycle
        found = .true.
      end do
    end do
    the_check = found
  end function the_check

  ! the Real part at height t: every member at height up to t (or below t, under the control) is on the line
  logical function realpart(m, t, strict)
    integer, intent(in) :: m, t
    logical, intent(in) :: strict
    integer :: i, p(2)
    realpart = .true.
    do i = 1, 9
      if (.not. member(m, i)) cycle
      p = pt(i)
      if (strict) then
        if (p(2) < t .and. .not. online(p)) realpart = .false.
      else
        if (p(2) <= t .and. .not. online(p)) realpart = .false.
      end if
    end do
  end function realpart
  ! the Unicorn part at height t: every member above t is on the line
  logical function unicornpart(m, t)
    integer, intent(in) :: m, t
    integer :: i, p(2)
    unicornpart = .true.
    do i = 1, 9
      if (.not. member(m, i)) cycle
      p = pt(i)
      if (p(2) > t .and. .not. online(p)) unicornpart = .false.
    end do
  end function unicornpart

  ! VII · the Unicorn cut
  logical function unicorn_cut(defect)
    logical, intent(in) :: defect
    integer :: m, t
    unicorn_cut = .true.
    do t = 0, 2
      do m = 0, 511
        if (value(m) .neqv. (realpart(m, t, defect) .and. unicornpart(m, t))) unicorn_cut = .false.
        if (realpart(m, t, defect)) then
          if (value(m) .neqv. unicornpart(m, t)) unicorn_cut = .false.
        end if
      end do
    end do
  end function unicorn_cut

  ! VIII · the Unicorn contained
  logical function unicorn_contained(defect)
    logical, intent(in) :: defect
    integer :: m, t, h, a(2), b(2), ra(2), rb(2)
    unicorn_contained = .true.
    do t = 0, 2
      do m = 0, 511
        if (.not. (value(m) .or. defect)) cycle
        if (.not. unicornpart(m, t)) unicorn_contained = .false.
      end do
    end do
    do t = 0, 1
      do h = t + 1, 2
        a = [1, h]; b = fold(a)
        ra = reg(a, 0); rb = reg(b, 0)
        if (any(ra /= rb)) unicorn_contained = .false.
        if (a(1) * b(1) >= 0) unicorn_contained = .false.
      end do
    end do
  end function unicorn_contained
end program annihilation_closure_twin
