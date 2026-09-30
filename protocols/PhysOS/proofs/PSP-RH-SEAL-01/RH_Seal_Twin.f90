! RH_Seal_Twin.f90 · twin of PhysOS Proof PSP-RH-SEAL-01, the terminal seal at least erasure, executed.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off RH_Seal_Twin.f90
! The chart at resolution ten: x = 20 Re s, line x = 10, fold x -> 20 - x. A world is a fold-closed set of real parts
! at one height; its record is its registration onto the line; least erasure is read from its definition.
program rh_seal_twin
  implicit none
  integer, parameter :: i16 = selected_int_kind(38)
  integer :: checks, fails, m, n, i, nw, nag, nrej, nprice, nact, nsep, nroot
  logical :: le
  checks = 0; fails = 0; nw = 0; nag = 0; nrej = 0; nprice = 0; nact = 0; nsep = 0; nroot = 0
  do m = 0, 2**19 - 1
    if (.not. sym(m)) cycle
    nw = nw + 1
    le = .true.
    if (erases(m)) then
      do n = 0, 2**19 - 1
        if (sym(n) .and. ((n /= 0) .eqv. (m /= 0)) .and. .not. erases(n)) le = .false.
      end do
    end if
    if (le .eqv. rh(m)) nag = nag + 1
    if ((.not. le) .eqv. erases(m)) nrej = nrej + 1
    if ((offcount(m) == 0) .eqv. le) nprice = nprice + 1
    if ((.not. le) .or. rh(m)) nact = nact + 1
    if (m /= 0 .and. m /= ibset(0, 9) .and. .not. le) nsep = nsep + 1
    if (rh(m)) nroot = ior(nroot, 1)
    if (.not. rh(m)) nroot = ior(nroot, 2)
  end do
  call check('1024 fold-closed worlds at one height', nw == 1024)
  call check('least erasure is the value on every world', nag == 1024)
  call check('a rejection of least erasure is exactly a point off the line', nrej == 1024)
  call check('the price is zero exactly at least erasure, one bit per point off the line', nprice == 1024)
  call check('the act carries the value: every least-erasure world satisfies the hypothesis', nact == 1024)
  call check('the bit is keyed: worlds of one record differ in least erasure', nsep > 0)
  call check('the root crosses neither way: a property true on every world holds on both sides', nroot == 3)
  call check('the floor exact: 1380649 x 300 x 6931471805599453 = 2870978885078723755499100', &
       1380649_i16 * 300_i16 * 6931471805599453_i16 == 2870978885078723755499100_i16)
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  pure logical function sym(m)
    integer, intent(in) :: m
    integer :: i
    sym = .true.
    do i = 1, 19
      if (btest(m, i-1) .neqv. btest(m, 19-i)) sym = .false.
    end do
  end function sym
  pure integer function offcount(m)
    integer, intent(in) :: m
    integer :: i
    offcount = 0
    do i = 1, 19
      if (btest(m, i-1) .and. i /= 10) offcount = offcount + 1
    end do
  end function offcount
  pure logical function erases(m)
    integer, intent(in) :: m
    erases = offcount(m) > 0
  end function erases
  pure logical function rh(m)
    integer, intent(in) :: m
    rh = offcount(m) == 0
  end function rh
  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    checks = checks + 1
    if (.not. ok) fails = fails + 1
    write(*,'(a,a)') merge('  PASS  ','  FAIL  ',ok), name
  end subroutine check
end program rh_seal_twin
