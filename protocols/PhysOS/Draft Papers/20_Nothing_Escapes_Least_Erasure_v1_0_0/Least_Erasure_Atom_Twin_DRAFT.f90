! Least_Erasure_Atom_Twin.f90 · the twin of SPHYS_Least_Erasure_Atom.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Least_Erasure_Atom_Twin.f90
! The second defense: every law of the atom computed exhaustively on finite grids by a route that
! shares nothing with the proof checker. A point is p = (d, t), d its offset from the line.
! fold(p) = (-d, t); reg(p) = (0, t); on the line when d = 0.
! A the fold is an involution; B the cut is the line; C the registration lands, keeps the height,
! forgets the side, and erases nothing exactly on the line; D off the line two worlds over one
! record, one bit lost; E least erasure equals value on all 4096 subsets of a twelve-point set.
program least_erasure_atom_twin
  implicit none
  integer :: checks, fails
  checks = 0; fails = 0
  call block_a(); call block_b(); call block_c(); call block_d(); call block_e()
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    checks = checks + 1
    if (.not. ok) fails = fails + 1
    write(*,'(a,a)') merge('  PASS  ', '  FAIL  ', ok), name
  end subroutine check
  pure function fold(p) result(q)
    integer, intent(in) :: p(2)
    integer :: q(2)
    q = [-p(1), p(2)]
  end function fold
  pure function reg(p) result(q)
    integer, intent(in) :: p(2)
    integer :: q(2)
    q = [0, p(2)]
  end function reg
  pure logical function online(p)
    integer, intent(in) :: p(2)
    online = (p(1) == 0)
  end function online
  subroutine block_a()
    integer :: d, t, n, ok
    n = 0; ok = 0
    do d = -500, 500
      do t = -50, 50
        n = n + 1
        if (all(fold(fold([d, t])) == [d, t])) ok = ok + 1
      end do
    end do
    call check('A  the fold is an involution at all 101101 points', ok == n)
  end subroutine block_a
  subroutine block_b()
    integer :: d, t, n, ok
    n = 0; ok = 0
    do d = -500, 500
      do t = -50, 50
        n = n + 1
        if (all(fold([d, t]) == [d, t]) .eqv. online([d, t])) ok = ok + 1
      end do
    end do
    call check('B  the fold fixes a point exactly when it is on the line, at all 101101 points', ok == n)
  end subroutine block_b
  subroutine block_c()
    integer :: d, t, n, ok, p(2), r(2)
    n = 0; ok = 0
    do d = -500, 500
      do t = -50, 50
        n = n + 1
        p = [d, t]; r = reg(p)
        if (online(r) .and. r(2) == p(2) .and. all(reg(fold(p)) == r) .and. &
            (all(r == p) .eqv. online(p))) ok = ok + 1
      end do
    end do
    call check('C  the registration lands, keeps the height, forgets the side, erases nothing exactly on the line', &
               ok == n)
  end subroutine block_c
  subroutine block_d()
    integer :: d, t, n, ok, p(2)
    n = 0; ok = 0
    do d = -500, 500
      do t = -50, 50
        p = [d, t]
        if (online(p)) cycle
        n = n + 1
        ! a distinct partner with one record: any map of records returns one point for both
        if (any(fold(p) /= p) .and. all(reg(fold(p)) == reg(p))) ok = ok + 1
      end do
    end do
    call check('D  off the line, 101000 points each with a distinct partner of one record: one bit lost', &
               ok == n .and. n == 101000)
  end subroutine block_d
  subroutine block_e()
    integer :: pd(12), m, k, ok
    logical :: le, va
    pd = [0, 0, 0, 0, 1, -1, 2, -2, 3, -3, 7, -7]
    ok = 0
    do m = 0, 4095
      le = .true.; va = .true.
      do k = 1, 12
        if (btest(m, k - 1)) then
          if (.not. all(reg([pd(k), k]) == [pd(k), k])) le = .false.
          if (.not. online([pd(k), k])) va = .false.
        end if
      end do
      if (le .eqv. va) ok = ok + 1
    end do
    call check('E  least erasure equals value on all 4096 subsets of a twelve-point set', ok == 4096)
  end subroutine block_e
end program least_erasure_atom_twin
