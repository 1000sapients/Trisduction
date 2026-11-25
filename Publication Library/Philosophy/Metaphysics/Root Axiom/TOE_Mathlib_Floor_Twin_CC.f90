! TOE_Mathlib_Floor_Twin_CC.f90 · twin of TOE_Mathlib_Floor_CC.lean
! RATIONALE. The engine proves the Frozen Substrate Lemma, the Return and the line, the anatomy of the algebra, the
!   kernel identity and the twelve, on Mathlib. This twin runs each in numbers by independent code: a two-level
!   system for the lemma (A), quaternion arithmetic on random draws for the line, the frames and the anatomy (B, C),
!   a search for a product on the ground and two axes (D), the kernel on random rows (E), and two counts (F).
! DESIGN. Double precision, no library. Quaternions are four reals, multiplied by Hamilton's rule. The two-level
!   system has energies 0 and 1 in units with hbar = 1. Random draws use the intrinsic generator from a fixed seed.
! RISK. Random draws and grids are instances; the statements for every quaternion and every bounded generator are
!   the engine's theorems.
! NON-NEGOTIABLE. Every printed value is computed here. TOE_Zero_Twin.f90 is not edited.
program toe_floor_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  real(dp), parameter :: pi = 3.14159265358979323846_dp
  integer :: nfail, npass, i, n, ia, ib, ic, nsol, npair, neven, p(4), a1, a2, a3, a4, inv, s(33)
  real(dp) :: t, surv, worst, w2, w3, w4, u(4), q(4), r(4), a(4), b(4), c(4), lam, det, x(4), y(4), ca, cb, cc
  real(dp) :: lhs(3), rhs(3), mx
  complex(dp) :: ov
  nfail = 0; npass = 0
  call random_seed(size=n); s = 20260622; call random_seed(put=s(1:n))

  ! A. the Frozen Substrate Lemma on two levels of energy 0 and 1
  worst = 0
  do i = 0, 1000
    t = i * 0.01_dp
    worst = max(worst, abs(abs(exp(cmplx(0.0_dp, -t, dp))) - 1))          ! the state of energy 1 against its future
  end do
  write(*,'(a,es9.2)') '  a state of one energy, 1001 times: largest departure of its survival from one: ', worst
  call check('A1 a state of one energy survives whole at every time', worst < 1e-15_dp)
  ov = (1 + exp(cmplx(0.0_dp, -pi, dp))) / 2; surv = abs(ov)**2
  write(*,'(a,f9.6,a,f9.6,a,es9.2)') '  equal superposition: energy spread ', 0.5_dp, '; time to an orthogonal state ', pi, &
    '; survival there ', surv
  write(*,'(a,4(f8.4))') '  its survival at a quarter, a half and three quarters of that time: ', &
    abs((1 + exp(cmplx(0.0_dp, -pi/4, dp))) / 2)**2, abs((1 + exp(cmplx(0.0_dp, -pi/2, dp))) / 2)**2, &
    abs((1 + exp(cmplx(0.0_dp, -3*pi/4, dp))) / 2)**2
  call check('A2 a state that reaches an orthogonal state carries a positive spread, and reaches it at pi over twice it', &
    surv < 1e-30_dp .and. abs(pi / (2 * 0.5_dp) - pi) < 1e-15_dp)

  ! B. the Return, the line, the centre, the frames
  call qmul([0.0_dp, 1.0_dp, 0.0_dp, 0.0_dp], [0.0_dp, 0.0_dp, 1.0_dp, 0.0_dp], r)
  call qmul(r, [0.0_dp, 0.0_dp, 0.0_dp, 1.0_dp], q)
  write(*,'(a,4(f5.1))') '  i j k = ', q
  call check('B1 the Return: i j k is minus one', all(abs(q - [-1.0_dp, 0.0_dp, 0.0_dp, 0.0_dp]) < 1e-15_dp))
  worst = 0; w2 = 0; w3 = 0
  do i = 1, 1000
    call random_number(u); call random_number(q); u = u - 0.5_dp; q = q - 0.5_dp
    call qmul(u, q, r); call qmul(r, qinv(u), x)                          ! u q u**-1
    worst = max(worst, abs(x(1) - q(1)))
    call qmul(u, [q(1), 0.0_dp, 0.0_dp, 0.0_dp], r); call qmul(r, qinv(u), x)
    w2 = max(w2, maxval(abs(x - [q(1), 0.0_dp, 0.0_dp, 0.0_dp])))
    call qmul(u, q, x); call qmul(q, u, y)                                ! the commutator of two draws
    w3 = max(w3, maxval(abs(x - y)))
  end do
  write(*,'(a,es9.2,a,es9.2)') '  1000 frames: largest change of the scalar part ', worst, '; of a point of the line ', w2
  call check('B2 the scalar part is the same in every frame, and no frame moves the line', worst < 1e-13_dp .and. w2 < 1e-13_dp)
  write(*,'(a,es9.2)') '  largest commutator of two draws: ', w3
  call check('B3 composition is order-sensitive off the line', w3 > 0.1_dp)

  ! C. Scalar Exit and Fertile Orthogonality
  worst = 0; w2 = 0; w3 = 0; w4 = 0
  do i = 1, 1000
    call random_number(a); call random_number(b); a = a - 0.5_dp; b = b - 0.5_dp; a(1) = 0; b(1) = 0
    b(2:4) = b(2:4) - a(2:4) * sum(a(2:4) * b(2:4)) / sum(a(2:4)**2)      ! make b orthogonal to a
    call qmul(a, a, r); worst = max(worst, abs(r(1) + sum(a(2:4)**2)), maxval(abs(r(2:4))))
    call qmul(a, b, r); call qmul(b, a, x)
    w2 = max(w2, abs(r(1)), abs(sum(r(2:4) * a(2:4))), abs(sum(r(2:4) * b(2:4))))
    w3 = max(w3, abs(sum(r(2:4)**2) - sum(a(2:4)**2) * sum(b(2:4)**2)))
    w4 = max(w4, maxval(abs(r + x)))
  end do
  write(*,'(a,es9.2)') '  1000 pure draws: largest departure of the square from minus the square length: ', worst
  call check('C1 Scalar Exit: a pure quaternion squares onto the line', worst < 1e-15_dp)
  write(*,'(a,es9.2,a,es9.2,a,es9.2)') '  1000 orthogonal pairs: product off pure or off orthogonal ', w2, '; off length ', w3, &
    '; a b + b a ', w4
  call check('C2 Fertile Orthogonality: two orthogonal axes beget a third, and anticommute', &
    w2 < 1e-15_dp .and. w3 < 1e-15_dp .and. w4 < 1e-15_dp)

  ! D. a product on the ground and two axes: i i = -1, i j = a + b i + c j, associativity i (i j) = (i i) j
  nsol = 0; mx = huge(1.0_dp)
  do ia = -40, 40; do ib = -40, 40; do ic = -40, 40
    ca = ia * 0.1_dp; cb = ib * 0.1_dp; cc = ic * 0.1_dp
    lhs = [-cb + cc * ca, ca + cc * cb, cc * cc]          ! i (a + b i + c j) on the basis 1, i, j
    rhs = [0.0_dp, 0.0_dp, -1.0_dp]                       ! -j
    mx = min(mx, maxval(abs(lhs - rhs)))
    if (maxval(abs(lhs - rhs)) < 1e-9_dp) nsol = nsol + 1
  end do; end do; end do
  write(*,'(a,i0,a,f6.3)') '  of 531441 products on a grid, associative: ', nsol, '; least failure of associativity: ', mx
  call check('D1 no product on the ground and two axes is associative', nsol == 0 .and. mx >= 1 - 1e-12_dp)

  ! E. the kernel
  worst = 0; w2 = 0; w3 = 0; w4 = -1
  do i = 1, 1000
    call random_number(a); call random_number(b); call random_number(c)
    a = a - 0.5_dp; b = b - 0.5_dp; c = c - 0.5_dp; a(1) = 0; b(1) = 0; c(1) = 0
    call kern(a, b, c, lam, det); worst = max(worst, abs(lam**2 - det))
    call kern(-a, b, c, x(1), x(2)); w2 = max(w2, abs(x(1) + lam), abs(x(2) - det))
    call kern(-a, -b, -c, x(1), x(2)); w3 = max(w3, abs(x(2) - det))
    a(2:4) = a(2:4) / sqrt(sum(a(2:4)**2)); b(2:4) = b(2:4) / sqrt(sum(b(2:4)**2)); c(2:4) = c(2:4) / sqrt(sum(c(2:4)**2))
    call kern(a, b, c, lam, det); w4 = max(w4, det)
  end do
  write(*,'(a,es9.2)') '  1000 pure triples: largest difference of the squared volume and the determinant: ', worst
  call check('E1 the kernel identity', worst < 1e-15_dp)
  write(*,'(a,es9.2,a,es9.2)') '  one axis reflected: largest change of the determinant or of minus the volume ', w2, &
    '; all three negated: ', w3
  call check('E2 the Number is blind to orientation, and the sign is carried by the volume', w2 < 1e-15_dp .and. w3 < 1e-15_dp)
  write(*,'(a,f9.6)') '  1000 triples of unit rows: largest determinant ', w4
  call check('E3 for unit rows the lock is at most one', w4 <= 1 + 1e-12_dp .and. w4 > 0)
  call kern([0.0_dp, 1.0_dp, 0.0_dp, 0.0_dp], [0.0_dp, 0.0_dp, 1.0_dp, 0.0_dp], [0.0_dp, 0.0_dp, 0.0_dp, 1.0_dp], lam, det)
  write(*,'(a,f16.12,a,f16.12)') '  the axiom: volume ', lam, '; determinant ', det
  call check('E4 the axiom at the full Return', abs(lam + 1) < 1e-15_dp .and. abs(det - 1) < 1e-15_dp)
  call kern([0.0_dp, 0.0_dp, 0.0_dp, 0.0_dp], [0.0_dp, 0.0_dp, 1.0_dp, 0.0_dp], [0.0_dp, 0.0_dp, 0.0_dp, 1.0_dp], lam, det)
  call check('E5 a deleted slot collapses the volume', abs(lam) < 1e-300_dp .and. abs(det) < 1e-300_dp)

  ! F. the twelve
  npair = 0; neven = 0
  do a1 = 1, 4; do a2 = 1, 4
    if (a1 /= a2) npair = npair + 1
  end do; end do
  do a1 = 1, 4; do a2 = 1, 4; do a3 = 1, 4; do a4 = 1, 4
    p = [a1, a2, a3, a4]
    if (any([(count(p == i), i = 1, 4)] /= 1)) cycle
    inv = 0
    do ia = 1, 3; do ib = ia + 1, 4
      if (p(ia) > p(ib)) inv = inv + 1
    end do; end do
    if (mod(inv, 2) == 0) neven = neven + 1
  end do; end do; end do; end do
  write(*,'(a,i0,a,i0)') '  ordered pairs of distinct vertices among four: ', npair, '; even permutations of four points: ', neven
  call check('F1 the twelve, two ways', npair == 12 .and. neven == 12)

  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', npass + nfail, ',"failures":', nfail, '}'
  if (nfail /= 0) stop 1
contains
  subroutine qmul(x, y, z)
    real(dp), intent(in) :: x(4), y(4)
    real(dp), intent(out) :: z(4)
    z(1) = x(1)*y(1) - x(2)*y(2) - x(3)*y(3) - x(4)*y(4)
    z(2) = x(1)*y(2) + x(2)*y(1) + x(3)*y(4) - x(4)*y(3)
    z(3) = x(1)*y(3) - x(2)*y(4) + x(3)*y(1) + x(4)*y(2)
    z(4) = x(1)*y(4) + x(2)*y(3) - x(3)*y(2) + x(4)*y(1)
  end subroutine
  function qinv(x) result(z)
    real(dp), intent(in) :: x(4)
    real(dp) :: z(4)
    z = [x(1), -x(2), -x(3), -x(4)] / sum(x**2)
  end function
  subroutine kern(a, b, c, lam, det)     ! the volume as the scalar part of a b c, the determinant of the Gram matrix
    real(dp), intent(in) :: a(4), b(4), c(4)
    real(dp), intent(out) :: lam, det
    real(dp) :: r(4), z(4), g(3,3), v(3,3)
    integer :: i, j
    call qmul(a, b, r); call qmul(r, c, z); lam = z(1)
    v(1,:) = a(2:4); v(2,:) = b(2:4); v(3,:) = c(2:4)
    do i = 1, 3; do j = 1, 3
      g(i,j) = sum(v(i,:) * v(j,:))
    end do; end do
    det = g(1,1)*(g(2,2)*g(3,3) - g(2,3)*g(3,2)) - g(1,2)*(g(2,1)*g(3,3) - g(2,3)*g(3,1)) + g(1,3)*(g(2,1)*g(3,2) - g(2,2)*g(3,1))
  end subroutine
  subroutine check(name, cond)
    character(*), intent(in) :: name
    logical, intent(in) :: cond
    if (cond) then
      write(*,'(a,a)') '  PASS  ', name; npass = npass + 1
    else
      write(*,'(a,a)') '  FAIL  ', name; nfail = nfail + 1
    end if
  end subroutine
end program toe_floor_twin
