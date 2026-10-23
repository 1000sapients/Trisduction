! Force_Witness_Twin.f90 · twin of PhysOS Proof PSP-FORCE-WITNESS-01, the force-witness closure, executed.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Force_Witness_Twin.f90
! Three checks, each beside a control that must fail. Run plain, the three checks pass and each control is shown
! to fail as it must: six lines, no failure. Run with the argument  control , each check runs with its defect
! planted and all three lines are red; the boot runs it so once and refuses the seat if any line stays green.
!   I   the ninth gate: on none and the eight sign patterns the five readings agree, and they hold only at none.
!       Control: the fixed-point reading dropped.
!   II  the act: on the 512 worlds least erasure and the value agree, and on every closed world of least erasure,
!       the supply of the act, the value holds. Control: an off-seat world supplied and the value demanded.
!   III the deed: a true flag yields an existent run and decides no value bit; the two partners of a pair share
!       one record slot, indexed once, and no one image is both. Control: a registration that keeps the side.
program force_witness_twin
  implicit none
  integer :: checks, fails
  logical :: ctl
  character(len=32) :: arg
  checks = 0; fails = 0
  call get_command_argument(1, arg)
  ctl = (trim(arg) == 'control')
  if (ctl) write(*,'(a)') ' CONTROL FLAG SET: each check runs with its defect planted; every line below must be red'
  call ninth_gate()
  call the_act()
  call the_deed()
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
  ! the chart: offsets -1, 0, 1 and heights 0, 1, 2; the fold reverses the offset; the registration forgets it,
  ! unless it is the registration of the control, which keeps the side
  pure function fold(p) result(q)
    integer, intent(in) :: p(2)
    integer :: q(2)
    q = [-p(1), p(2)]
  end function fold
  pure function reg(p, keep) result(q)
    integer, intent(in) :: p(2)
    logical, intent(in) :: keep
    integer :: q(2)
    if (keep) then
      q = p
    else
      q = [0, p(2)]
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
  ! the gates: 0 is none; 1 to 8 are the eight sign patterns, the three signs the bits of g - 1. The fold of a
  ! pattern reverses all three signs; the orientation is the parity of the pattern.
  pure integer function gfold(g)
    integer, intent(in) :: g
    if (g == 0) then
      gfold = 0
    else
      gfold = 9 - g
    end if
  end function gfold
  pure integer function orient(g)
    integer, intent(in) :: g
    orient = merge(1, -1, mod(popcnt(g - 1), 2) == 0)
  end function orient
  pure function tochart(t, g) result(p)
    integer, intent(in) :: t, g
    integer :: p(2)
    if (g == 0) then
      p = [0, t]
    else
      p = [orient(g), t]
    end if
  end function tochart
  ! the configuration of a gate: none is one point on the line and no pair, a pattern one pair and no line point;
  ! the erased bits are the pairs, and the price is one T to a bit
  pure integer function erased(g)
    integer, intent(in) :: g
    erased = merge(0, 1, g == 0)
  end function erased
  pure integer function price(temp, bits)
    integer, intent(in) :: temp, bits
    price = bits * temp
  end function price
  ! a gate owes a bit when some labelling of the nine gates by one bit tells it from its fold: found by search
  pure logical function owes(g)
    integer, intent(in) :: g
    integer :: m
    owes = .false.
    do m = 0, 511
      if (btest(m, gfold(g)) .neqv. btest(m, g)) owes = .true.
    end do
  end function owes
  subroutine ninth_gate()
    integer :: g, t, temp, nag, nagc
    logical :: r(5), rc(5)
    nag = 0; nagc = 0
    do g = 0, 8
      do t = 0, 2
        do temp = 1, 3
          r(1) = gfold(g) == g
          r(2) = online(tochart(t, g))
          r(3) = all(reg(tochart(t, g), .false.) == tochart(t, g))
          r(4) = price(temp, erased(g)) == 0
          r(5) = .not. owes(g)
          if (all(r .eqv. (g == 0))) nag = nag + 1
          rc = r; rc(1) = .true.
          if (all(rc .eqv. (g == 0))) nagc = nagc + 1
        end do
      end do
    end do
    if (.not. ctl) then
      call check('I: on none and the eight sign patterns, at three heights and three temperatures, the five ' // &
           'readings agree, and they hold only at none', nag == 81)
      call check('I: control, the fixed-point reading dropped: the agreement fails on the eight sign patterns', &
           nagc == 9)
    else
      call check('I: [defect planted: the fixed-point reading dropped] the five readings agree on every gate', &
           nagc == 81)
    end if
  end subroutine ninth_gate
  ! worlds: the 512 subsets of the nine points, a bit to a point
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
  pure logical function lerase(m)
    integer, intent(in) :: m
    integer :: i
    lerase = .true.
    do i = 1, 9
      if (member(m, i) .and. .not. all(reg(pt(i), .false.) == pt(i))) lerase = .false.
    end do
  end function lerase
  pure logical function valu(m)
    integer, intent(in) :: m
    integer :: i
    valu = .true.
    do i = 1, 9
      if (member(m, i) .and. .not. online(pt(i))) valu = .false.
    end do
  end function valu
  pure integer function recmask(m, keep)
    integer, intent(in) :: m
    logical, intent(in) :: keep
    integer :: i
    recmask = 0
    do i = 1, 9
      if (member(m, i)) recmask = ibset(recmask, idx(reg(pt(i), keep)) - 1)
    end do
  end function recmask
  subroutine the_act()
    integer :: m, nag, nsup, nval, zs
    nag = 0; nsup = 0; nval = 0
    do m = 0, 511
      if (lerase(m) .eqv. valu(m)) nag = nag + 1
      if (closed(m) .and. lerase(m)) then
        nsup = nsup + 1
        if (valu(m)) nval = nval + 1
      end if
    end do
    zs = ior(ibset(0, idx([1, 0]) - 1), ibset(0, idx([-1, 0]) - 1))
    if (.not. ctl) then
      call check('II: on the 512 worlds least erasure and the value agree; on each of the 8 closed worlds of ' // &
           'least erasure, the supply of the act, the value holds', nag == 512 .and. nsup == 8 .and. nval == 8)
      call check('II: control, an off-seat world supplied and the value demanded: closed, no world of least ' // &
           'erasure, and the demand fails', closed(zs) .and. .not. lerase(zs) .and. .not. valu(zs))
    else
      call check('II: [defect planted: an off-seat world supplied as the act] the value holds on the supplied ' // &
           'world', closed(zs) .and. lerase(zs) .and. valu(zs))
    end if
  end subroutine the_act
  subroutine the_deed()
    logical :: flags(3), exists, keep, onerec, split
    integer :: p(2), q(2), ip, iq, r, rq, v, v2, nboth1, none1, ntwo, wa, wb, c, nflag
    flags = [.false., .true., .false.]
    exists = any(flags)
    keep = ctl
    p = [1, 0]; q = fold(p); ip = idx(p); iq = idx(q)
    wa = ibset(0, idx(reg(p, .false.)) - 1)
    wb = ior(ibset(0, ip - 1), ibset(0, iq - 1))
    onerec = recmask(wa, keep) == recmask(wb, keep)
    split = valu(wa) .neqv. valu(wb)
    ! a reading of the flag returns one bit, the same on both worlds: it is the value on at most one of them
    nflag = 0
    do c = 0, 1
      if (((c == 1) .eqv. valu(wa)) .and. ((c == 1) .eqv. valu(wb))) nflag = nflag + 1
    end do
    ! the record slot of each partner, indexed once; then the one image a map can give the one slot
    r = idx(reg(p, keep)); rq = idx(reg(q, keep))
    nboth1 = 0; none1 = 0
    do v = 1, 9
      if (v == ip .and. v == iq) nboth1 = nboth1 + 1
      if (v == ip .or. v == iq) none1 = none1 + 1
    end do
    ! under a registration that keeps the side the partners hold two slots, and a map gives each its own image
    ntwo = 0
    do v = 1, 9
      do v2 = 1, 9
        if (v == ip .and. v2 == iq) ntwo = ntwo + 1
      end do
    end do
    if (.not. ctl) then
      write(*,'(a,i0,a,i0,a,i0,a,i0)') '  record slots of the partners ', r, ' and ', rq, &
           '; images equal to both partners ', nboth1, ' of 9; to one of them ', none1
      call check('III: the flag is true and a run exists; over one record the registered world and the pair ' // &
           'world part on the value and no reading of the flag returns it on both; the partners share one ' // &
           'slot and no one image is both', exists .and. onerec .and. split .and. nflag == 0 .and. r == rq &
           .and. ip /= iq .and. nboth1 == 0 .and. none1 == 2)
      call check('III: control, a registration that keeps the side: the partners hold two slots and one pair ' // &
           'of images recovers both', idx(reg(p, .true.)) /= idx(reg(q, .true.)) .and. ntwo == 1 .and. &
           recmask(wa, .true.) /= recmask(wb, .true.))
    else
      call check('III: [defect planted: a registration that keeps the side] the two partners share one ' // &
           'record slot and the two worlds share one record', onerec .and. r == rq)
    end if
  end subroutine the_deed
end program force_witness_twin
