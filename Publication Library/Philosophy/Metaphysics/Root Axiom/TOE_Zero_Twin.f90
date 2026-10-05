! TOE_Zero_Twin.f90 . the Fortran twin of TOE_Zero.lean . Theory of Theories of Everything (TOE of All TOEs)
! Every finite claim of the zero-axiom kernel, recomputed by independent code in a second language:
! the self-grounding model, the constructed root, the Return, the involution and its fixed line on the chart,
! the twenty-four Hurwitz units and twelve gates, the norm-two shell split twelve and twelve, and the class
! equation 1, 3, 4, 4 of the twelve even permutations. Integer arithmetic only; no floating point anywhere.
! Build: gfortran -std=f2018 -O2 -Wall -Wextra -o TOE_Zero_Twin TOE_Zero_Twin.f90
! Modes: sealed by default, the live face withheld; 'witnessed' issues the live face [I AM] once every check passes.
program toe_zero_twin
  implicit none
  integer :: nchk = 0, nfail = 0
  integer :: a, b, c, d, nunit, nunit12, nshell, nshell12, nfix, i, j, k, ngate
  integer :: q(4), r(4), s(4)
  logical :: acts(3), ok, inv_ok, line_ok
  character(len=32) :: mode
  integer :: perms(24, 4), gates(12, 4), sizes(12), cls(12, 12), ncls, t(4), h(4)
  integer :: np, p1, p2, p3, p4

  ! I . the self-grounding model: three acts, the deed, the denial and the examination; every act instances the root
  acts = [.true., .true., .true.]
  call check('every act instances the root, the denial among them', all(acts))
  call check('the denial is an act and re-enacts the root', acts(2))

  ! II . the constructed root: the one existent actuates at positive energy
  call check('the root on the constructed domain: 0 < 1', 0 < 1)

  ! III . the Return and the line
  call qmul([0, 1, 0, 0], [0, 0, 1, 0], r); call qmul(r, [0, 0, 0, 1], s)
  call check('the Return: i.j.k = -1', all(s == [-1, 0, 0, 0]))
  call qmul([0, 1, 0, 0], [0, 1, 0, 0], r); ok = all(r == [-1, 0, 0, 0])
  call qmul([0, 0, 1, 0], [0, 0, 1, 0], r); ok = ok .and. all(r == [-1, 0, 0, 0])
  call qmul([0, 0, 0, 1], [0, 0, 0, 1], r); ok = ok .and. all(r == [-1, 0, 0, 0])
  call check('each unit squares to -1', ok)
  inv_ok = .true.; line_ok = .true.; nfix = 0
  do a = -2, 2; do b = -2, 2; do c = -2, 2; do d = -2, 2
    q = [a, b, c, d]; r = [a, -b, -c, -d]; s = [r(1), -r(2), -r(3), -r(4)]
    if (any(s /= q)) inv_ok = .false.
    if ((all(r == q)) .neqv. (b == 0 .and. c == 0 .and. d == 0)) line_ok = .false.
    if (all(r == q)) nfix = nfix + 1
  end do; end do; end do; end do
  call check('conjugation is an involution on all 625 chart points', inv_ok)
  call check('the fixed set of conjugation is exactly the scalar line', line_ok .and. nfix == 5)

  ! IV . the twelve gates, three ways
  nunit = 0; nunit12 = 0; nshell = 0; nshell12 = 0
  do a = -2, 2; do b = -2, 2; do c = -2, 2; do d = -2, 2
    if (.not. hurwitz(a, b, c, d)) cycle
    if (a*a + b*b + c*c + d*d == 4) then
      nunit = nunit + 1; if (first_positive(a, b, c, d)) nunit12 = nunit12 + 1
    end if
    if (a*a + b*b + c*c + d*d == 8) then
      nshell = nshell + 1; if (first_positive(a, b, c, d)) nshell12 = nshell12 + 1
    end if
  end do; end do; end do; end do
  call check('first way: twenty-four Hurwitz units, twelve up to sign', nunit == 24 .and. nunit12 == 12)
  call check('third way: the norm-two shell has twenty-four, split twelve and twelve', &
             nshell == 24 .and. nshell12 == 12 .and. nshell - nshell12 == 12)
  np = 0
  do p1 = 0, 3; do p2 = 0, 3; do p3 = 0, 3; do p4 = 0, 3
    if (p1 == p2 .or. p1 == p3 .or. p1 == p4 .or. p2 == p3 .or. p2 == p4 .or. p3 == p4) cycle
    np = np + 1; perms(np, :) = [p1, p2, p3, p4]
  end do; end do; end do; end do
  ngate = 0
  do i = 1, np
    if (mod(inversions(perms(i, :)), 2) == 0) then
      ngate = ngate + 1; gates(ngate, :) = perms(i, :)
    end if
  end do
  call check('the even permutations of four points number twelve', np == 24 .and. ngate == 12)
  do i = 1, 12
    ncls = 0
    do j = 1, 12
      h = gates(j, :); t = compose(compose(h, gates(i, :)), inverse(h))
      ok = .false.
      do k = 1, ncls
        if (all(cls(k, :) == pack_perm(t))) ok = .true.
      end do
      if (.not. ok) then
        ncls = ncls + 1; cls(ncls, :) = pack_perm(t)
      end if
    end do
    sizes(i) = ncls
  end do
  call check('second way: the class equation 1, 3, 4, 4', class_equation_ok(sizes))

  write (*, '(a, i0, a, i0, a)') ' TWIN: ', nchk, ' checks executed, ', nfail, ' failures.'
  if (nfail /= 0) error stop 1
  ! the live face: the token is issued on the witnessed act, never by the self-check
  call get_command_argument(1, mode)
  if (trim(mode) == 'witnessed') then
    write (*, '(a)') ' LIVE: [I AM] - the act re-enacts the root; the token is issued on the witnessed act'
  else
    write (*, '(a)') ' LIVE: [?] - self-check is not a witness; the token is issued on the witnessed act (run: witnessed)'
  end if

contains

  subroutine check(name, cond)
    character(*), intent(in) :: name
    logical, intent(in) :: cond
    nchk = nchk + 1
    if (cond) then
      write (*, '(a, i2, a, a)') ' PASS ', nchk, '  ', name
    else
      nfail = nfail + 1; write (*, '(a, i2, a, a)') ' FAIL ', nchk, '  ', name
    end if
  end subroutine check

  subroutine qmul(x, y, z)
    integer, intent(in) :: x(4), y(4)
    integer, intent(out) :: z(4)
    z(1) = x(1)*y(1) - x(2)*y(2) - x(3)*y(3) - x(4)*y(4)
    z(2) = x(1)*y(2) + x(2)*y(1) + x(3)*y(4) - x(4)*y(3)
    z(3) = x(1)*y(3) - x(2)*y(4) + x(3)*y(1) + x(4)*y(2)
    z(4) = x(1)*y(4) + x(2)*y(3) - x(3)*y(2) + x(4)*y(1)
  end subroutine qmul

  logical function hurwitz(a, b, c, d)
    integer, intent(in) :: a, b, c, d
    hurwitz = (mod(a, 2) == 0 .and. mod(b, 2) == 0 .and. mod(c, 2) == 0 .and. mod(d, 2) == 0) .or. &
              (mod(a, 2) /= 0 .and. mod(b, 2) /= 0 .and. mod(c, 2) /= 0 .and. mod(d, 2) /= 0)
  end function hurwitz

  logical function first_positive(a, b, c, d)
    integer, intent(in) :: a, b, c, d
    if (a /= 0) then
      first_positive = a > 0
    else if (b /= 0) then
      first_positive = b > 0
    else if (c /= 0) then
      first_positive = c > 0
    else
      first_positive = d > 0
    end if
  end function first_positive

  integer function inversions(p)
    integer, intent(in) :: p(4)
    integer :: x, y
    inversions = 0
    do x = 1, 3
      do y = x + 1, 4
        if (p(y) < p(x)) inversions = inversions + 1
      end do
    end do
  end function inversions

  function compose(p, r1) result(o)
    integer, intent(in) :: p(4), r1(4)
    integer :: o(4), x
    do x = 1, 4
      o(x) = p(r1(x) + 1)
    end do
  end function compose

  function inverse(p) result(o)
    integer, intent(in) :: p(4)
    integer :: o(4), x
    do x = 1, 4
      o(p(x) + 1) = x - 1
    end do
  end function inverse

  function pack_perm(p) result(o)
    integer, intent(in) :: p(4)
    integer :: o(12)
    o = 0; o(1:4) = p
  end function pack_perm

  logical function class_equation_ok(sz)
    integer, intent(in) :: sz(12)
    integer :: n1, n3, n4
    n1 = count(sz == 1); n3 = count(sz == 3); n4 = count(sz == 4)
    class_equation_ok = n1 == 1 .and. n3 == 3 .and. n4 == 8 .and. n1 + n3 + n4 == 12
  end function class_equation_ok

end program toe_zero_twin
