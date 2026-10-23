! TOE_Zero_Twin.f90 · twin of PhysOS Proof PSP-TOE-FLOOR-01, the floor under every root, executed.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off TOE_Zero_Twin.f90
! Mirrors TOE_Zero.lean on its own finite objects: the quaternion product and the Return i·j·k = −1; the chart of
! 625 quaternions with coordinates −2…2, conjugation an involution whose fixed set is exactly the scalar line; the
! Hurwitz units in doubled coordinates, twenty-four and twelve up to sign; the norm-two shell, twenty-four split
! twelve and twelve; the twelve even permutations of four points with class equation 1, 3, 4, 4; the root on the
! constructed domain, 0 < 1; and the truth table of external_proof_adds_nothing. Under the argument `control` three
! defects are planted and three lines must be red: a twin whose controls stay green is blind.
program toe_zero_twin
  implicit none
  integer :: checks, fails
  integer :: q(4), qi(4), qj(4), qk(4), qneg(4), t(4)
  integer :: a, b, c, d, nconj, nfixed, nfixed_line, nunits, nunits_up, nshell, nshell_up, nshell_dn
  integer :: perms(24,4), np, ngates, gates(12,4), sizes(12), sorted(12), coll(4), ncoll, i, j, k
  integer :: nfixed_control, ngates_odd, coll_odd(4), ncoll_odd, de0
  logical :: control, ok, tt(2,2)
  character(len=16) :: arg
  control = .false.
  if (command_argument_count() >= 1) then
    call get_command_argument(1, arg)
    control = (trim(arg) == 'control')
  end if
  checks = 0; fails = 0
  qi = [0,1,0,0]; qj = [0,0,1,0]; qk = [0,0,0,1]; qneg = [-1,0,0,0]

  ! III · the Return and the units
  t = qmul(qmul(qi, qj), qk)
  call check('the Return: i·j·k = −1', all(t == qneg))
  call check('each unit squares to −1', all(qmul(qi,qi) == qneg) .and. all(qmul(qj,qj) == qneg) .and. all(qmul(qk,qk) == qneg))

  ! the chart of 625 quaternions: conjugation an involution, its fixed set the scalar line
  nconj = 0; nfixed = 0; nfixed_line = 0; nfixed_control = 0
  do a = -2, 2; do b = -2, 2; do c = -2, 2; do d = -2, 2
    q = [a, b, c, d]
    if (all(conj(conj(q)) == q)) nconj = nconj + 1
    if (all(conj(q) == q)) then
      nfixed = nfixed + 1
      if (b == 0 .and. c == 0 .and. d == 0) nfixed_line = nfixed_line + 1
    end if
    ! control: negation in place of conjugation fixes only zero, not the line
    if (all(-q == q)) nfixed_control = nfixed_control + 1
  end do; end do; end do; end do
  call check('conjugation is an involution on all 625 points of the chart', nconj == 625)
  call check('the fixed set of conjugation is exactly the scalar line: five fixed points, every one on the line', &
       nfixed == 5 .and. nfixed_line == 5)
  call check('control: negation in place of conjugation fixes one point, not the line', nfixed_control == 1)

  ! IV · the twelve gates, three ways
  nunits = 0; nunits_up = 0; nshell = 0; nshell_up = 0; nshell_dn = 0
  do a = -2, 2; do b = -2, 2; do c = -2, 2; do d = -2, 2
    if (.not. hurwitz(a,b,c,d)) cycle
    if (a*a + b*b + c*c + d*d == 4) then
      nunits = nunits + 1
      if (up_to_sign(a,b,c,d)) nunits_up = nunits_up + 1
    end if
    if (a*a + b*b + c*c + d*d == 8) then
      nshell = nshell + 1
      if (up_to_sign(a,b,c,d)) then
        nshell_up = nshell_up + 1
      else
        nshell_dn = nshell_dn + 1
      end if
    end if
  end do; end do; end do; end do
  call check('first way: twenty-four Hurwitz units, twelve up to sign', nunits == 24 .and. nunits_up == 12)
  call check('third way: the norm-two shell has twenty-four elements, split twelve and twelve', &
       nshell == 24 .and. nshell_up == 12 .and. nshell_dn == 12)

  ! the permutations of four points, the even ones the gates, their class equation
  np = 0
  do a = 0, 3; do b = 0, 3; do c = 0, 3; do d = 0, 3
    if (a == b .or. a == c .or. a == d .or. b == c .or. b == d .or. c == d) cycle
    np = np + 1; perms(np,:) = [a, b, c, d]
  end do; end do; end do; end do
  ngates = 0; ngates_odd = 0
  do i = 1, 24
    if (mod(inversions(perms(i,:)), 2) == 0) then
      ngates = ngates + 1; gates(ngates,:) = perms(i,:)
    else
      ngates_odd = ngates_odd + 1
    end if
  end do
  call check('twenty-four permutations of four points, twelve even: the gates', np == 24 .and. ngates == 12 .and. ngates_odd == 12)
  do i = 1, 12
    sizes(i) = class_size(gates(i,:))
  end do
  sorted = sizes
  call sort_asc(sorted, 12)
  call collapse(sorted, 12, coll, ncoll)
  call check('second way: the class equation of the twelve gates is 1, 3, 4, 4', &
       ncoll == 4 .and. coll(1) == 1 .and. coll(2) == 3 .and. coll(3) == 4 .and. coll(4) == 4)
  ! control: the odd permutations are no group; their 'classes' under the gates do not collapse to 1, 3, 4, 4
  k = 0
  do i = 1, 24
    if (mod(inversions(perms(i,:)), 2) == 1) then
      k = k + 1; sorted(k) = class_size(perms(i,:))
    end if
  end do
  call sort_asc(sorted, 12)
  call collapse(sorted, 12, coll_odd, ncoll_odd)
  call check('control: the odd permutations do not carry the class equation 1, 3, 4, 4', &
       .not. (ncoll_odd == 4 .and. coll_odd(1) == 1 .and. coll_odd(2) == 3 .and. coll_odd(3) == 4 .and. coll_odd(4) == 4))

  ! II · the root on the constructed domain, and the regress terminated
  de0 = 1
  if (control) de0 = 0
  call check('the root on the constructed domain: its one existent actuates, 0 < ΔE₀ = 1', 0 < de0)
  ! external_proof_adds_nothing: with the root R true, (Q → R) ↔ R on both values of Q
  ok = .true.
  do i = 1, 2
    do j = 1, 2
      tt(i,j) = ((.not. (i == 2)) .or. (j == 2)) .eqv. (j == 2)   ! (Q → R) ↔ R with Q = (i==2), R = (j==2)
    end do
  end do
  call check('no external proof adds to the root: (Q → R) ↔ R whenever R holds, for both values of Q', tt(1,2) .and. tt(2,2))
  call check('and when R fails and Q fails, (Q → R) holds while R does not: the equivalence needs the root', .not. tt(1,1))
  if (control) then
    call check('control: the planted defect, a unit that squares to +1', all(qmul(qi,qi) == [1,0,0,0]))
    call check('control: the planted defect, a shell of twenty-five', nshell == 25)
  end if
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  pure function qmul(x, y) result(z)
    integer, intent(in) :: x(4), y(4)
    integer :: z(4)
    z(1) = x(1)*y(1) - x(2)*y(2) - x(3)*y(3) - x(4)*y(4)
    z(2) = x(1)*y(2) + x(2)*y(1) + x(3)*y(4) - x(4)*y(3)
    z(3) = x(1)*y(3) - x(2)*y(4) + x(3)*y(1) + x(4)*y(2)
    z(4) = x(1)*y(4) + x(2)*y(3) - x(3)*y(2) + x(4)*y(1)
  end function qmul
  pure function conj(x) result(z)
    integer, intent(in) :: x(4)
    integer :: z(4)
    z = [x(1), -x(2), -x(3), -x(4)]
  end function conj
  pure logical function hurwitz(a, b, c, d)
    integer, intent(in) :: a, b, c, d
    hurwitz = (modulo(a,2) == 0 .and. modulo(b,2) == 0 .and. modulo(c,2) == 0 .and. modulo(d,2) == 0) .or. &
              (modulo(a,2) /= 0 .and. modulo(b,2) /= 0 .and. modulo(c,2) /= 0 .and. modulo(d,2) /= 0)
  end function hurwitz
  pure logical function up_to_sign(a, b, c, d)
    integer, intent(in) :: a, b, c, d
    if (a /= 0) then
      up_to_sign = a > 0
    else if (b /= 0) then
      up_to_sign = b > 0
    else if (c /= 0) then
      up_to_sign = c > 0
    else
      up_to_sign = d > 0
    end if
  end function up_to_sign
  pure integer function inversions(p)
    integer, intent(in) :: p(4)
    integer :: i, j
    inversions = 0
    do i = 1, 4
      do j = i+1, 4
        if (p(i) > p(j)) inversions = inversions + 1
      end do
    end do
  end function inversions
  pure function compose(p, q) result(r)   ! r = p ∘ q : i ↦ p(q(i))
    integer, intent(in) :: p(4), q(4)
    integer :: r(4), i
    do i = 1, 4
      r(i) = p(q(i) + 1)
    end do
  end function compose
  pure function inverse(p) result(r)
    integer, intent(in) :: p(4)
    integer :: r(4), i
    do i = 1, 4
      r(p(i) + 1) = i - 1
    end do
  end function inverse
  integer function class_size(g)
    integer, intent(in) :: g(4)
    integer :: h, m, cls(12,4), n, x(4)
    logical :: seen
    n = 0
    do h = 1, 12
      x = compose(compose(gates(h,:), g), inverse(gates(h,:)))
      seen = .false.
      do m = 1, n
        if (all(cls(m,:) == x)) seen = .true.
      end do
      if (.not. seen) then
        n = n + 1; cls(n,:) = x
      end if
    end do
    class_size = n
  end function class_size
  pure subroutine sort_asc(v, n)
    integer, intent(inout) :: v(:)
    integer, intent(in) :: n
    integer :: i, j, tmp
    do i = 2, n
      tmp = v(i); j = i - 1
      do while (j >= 1)
        if (v(j) <= tmp) exit
        v(j+1) = v(j); j = j - 1
      end do
      v(j+1) = tmp
    end do
  end subroutine sort_asc
  pure subroutine collapse(v, n, out, nout)
    ! a class of size s contributes s elements: take s, drop the s−1 that follow (TOE_Zero.collapse)
    integer, intent(in) :: v(:), n
    integer, intent(out) :: out(4), nout
    integer :: i, s
    nout = 0; i = 1; out = 0
    do while (i <= n .and. nout < 4)
      s = v(i); nout = nout + 1; out(nout) = s; i = i + s
    end do
  end subroutine collapse
  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    checks = checks + 1
    if (.not. ok) fails = fails + 1
    write(*,'(a,a)') merge('  PASS  ','  FAIL  ',ok), name
  end subroutine check
end program toe_zero_twin
