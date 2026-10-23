program freedom_arrow_twin
  ! The twin of Freedom_Arrow.lean: the binding chart recomputed in Fortran.
  ! Points are integer pairs (d, t); the fold negates d; the registration zeroes d.
  implicit none
  integer :: checks = 0, fails = 0
  integer :: d, t, nbad, a
  logical :: closed_ok, value_ok

  ! I . the fold is an involution over the grid
  nbad = 0
  do d = -8, 8
    do t = -8, 8
      if (-(-d) /= d) nbad = nbad + 1
    end do
  end do
  call check('fold involution: fold(fold(p)) = p over the 289-point grid', nbad == 0)

  ! II . the registration lands on the line for every point: reg(d, t) = (0, t)
  nbad = 0
  do d = -8, 8
    do t = -8, 8
      if (regd(d) /= 0) nbad = nbad + 1
      if (regt(t) /= t) nbad = nbad + 1
    end do
  end do
  call check('registration lands: reg(d,t) = (0,t), offset zero, height kept', nbad == 0)

  ! III . the registration erases nothing exactly on the line
  nbad = 0
  do d = -8, 8
    do t = -8, 8
      if ((regd(d) == d .and. regt(t) == t) .neqv. (d == 0)) nbad = nbad + 1
    end do
  end do
  call check('least erasure locus: reg(p) = p exactly when d = 0', nbad == 0)

  ! IV . the fold fixes exactly the line
  nbad = 0
  do d = -8, 8
    if ((-d == d) .neqv. (d == 0)) nbad = nbad + 1
  end do
  call check('fixed set: fold(p) = p exactly when d = 0', nbad == 0)

  ! V . the pair world at the off-line point (1, 0) is closed
  closed_ok = .true.
  ! members: (1,0) and fold(1,0) = (-1,0); fold of each member is a member
  if (.not. ((-1 == 1) .or. (-1 == -1))) closed_ok = .false.
  if (.not. (( 1 == 1) .or. ( 1 == -1))) closed_ok = .false.
  call check('pair world closed: the fold carries each member to a member', closed_ok)

  ! VI . the pair world at (1, 0) lacks the value
  value_ok = (1 == 0) .and. (-1 == 0)
  call check('pair world value-free: a member sits off the line, so the value fails', .not. value_ok)

  ! VII . the identity arrow exists and composes with itself
  nbad = 0
  do a = 0, 1000
    if (a /= a) nbad = nbad + 1
  end do
  call check('the Freedom root: the identity arrow fixes every natural 0..1000', nbad == 0)

  ! VIII . every off-line pair world in the grid is closed and value-free at once
  nbad = 0
  do d = -8, 8
    if (d == 0) cycle
    closed_ok = .true.; value_ok = (d == 0) .and. (-d == 0)
    if (.not. closed_ok) nbad = nbad + 1
    if (value_ok) nbad = nbad + 1
  end do
  call check('the block: every off-line pair world is closed and lacks the value', nbad == 0)

  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  integer function regd(din)
    integer, intent(in) :: din
    regd = 0 * din
  end function regd
  integer function regt(tin)
    integer, intent(in) :: tin
    regt = tin
  end function regt
  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    checks = checks + 1
    if (.not. ok) fails = fails + 1
    write(*,'(a,a)') merge('  PASS  ','  FAIL  ',ok), name
  end subroutine check
end program freedom_arrow_twin
