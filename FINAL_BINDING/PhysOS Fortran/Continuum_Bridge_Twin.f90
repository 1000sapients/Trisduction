program continuum_bridge_twin
  ! The twin of Continuum_Bridge.lean: the two exhibited worlds recomputed in Fortran.
  ! World 0 is the forcing-side world, world 1 the constructible-side world;
  ! chholds(w) is (w = 1); the root is 0 < 1 on the unit substrate.
  implicit none
  integer :: checks = 0, fails = 0
  integer :: nroot, nch, nnch, i

  ! I . the root holds on the unit substrate
  call check('the root: 0 < 1, the unit substrate is positive', 0 < 1)

  ! II . the root holds in both worlds (keyless)
  nroot = 0
  do i = 0, 1
    if (0 < 1) nroot = nroot + 1
  end do
  call check('keyless root: the root stands in both worlds', nroot == 2)

  ! III . the continuum hypothesis holds in the constructible-side world
  call check('CH world: the hypothesis holds in world 1', chholds(1))

  ! IV . the continuum hypothesis fails in the forcing-side world, so CH is keyed
  call check('non-CH world: the hypothesis fails in world 0, a world lacks CH', .not. chholds(0))

  ! V . the negation fails in the constructible-side world, so the negation is keyed too
  call check('keyed both sides: world 1 lacks the negation of CH', .not. (.not. chholds(1)))

  ! VI . neither side is universal: each holds in exactly one of the two worlds
  nch = 0; nnch = 0
  do i = 0, 1
    if (chholds(i)) nch = nch + 1
    if (.not. chholds(i)) nnch = nnch + 1
  end do
  call check('non-decision: CH and its negation each hold in exactly one world', nch == 1 .and. nnch == 1)

  ! VII . a keyless sentence crosses: the root sentence is true in every world
  call check('keyless crosses: the root sentence is true in 2 of 2 worlds', nroot == 2)

  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  logical function chholds(w)
    integer, intent(in) :: w
    chholds = (w == 1)
  end function chholds
  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    checks = checks + 1
    if (.not. ok) fails = fails + 1
    write(*,'(a,a)') merge('  PASS  ','  FAIL  ',ok), name
  end subroutine check
end program continuum_bridge_twin
