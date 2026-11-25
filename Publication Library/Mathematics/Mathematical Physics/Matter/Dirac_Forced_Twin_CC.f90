! Dirac_Forced_Twin_CC.f90 · twin of SPHYS_Dirac_Forced_CC.lean
! RATIONALE. The engine proves its identities in every ring. This twin executes them on random integer data, as an
!   independent run; searches small matrices and small groups exhaustively for what the engine proves cannot exist;
!   and sets three readings of the law against published measurements, with a rival beside the first.
! DESIGN. 64-bit integers for the algebra; complex integers for the search; double precision for the measured cells;
!   one generator, fixed seed. The turns of section A are the quaternions, which are the products of pairs of the
!   three generators of Part V of the engine.
! CONVENTION. A reading agrees within the stated scale; a rival is excluded when it lies further than that scale.
! NON-NEGOTIABLE. No mass and no coupling is computed. The fine-structure constant is a measured input.
! RISK. The least law gives the moment of the electron as two. The first correction, alpha over two pi, belongs to
!   the field's own quantum; it is a classical formula, entered, and is printed as such, not as a result of the law.
!   The search of section A covers matrices of size two with entries 0, 1, -1, i, -i only; the engine's theorem
!   covers every field.
program dirac_twin
  implicit none
  integer, parameter :: i8 = selected_int_kind(18), dp = kind(1.0d0)
  integer(i8) :: seed = 20260622_i8
  integer :: checks = 0, failures = 0
  real(dp), parameter :: pi = 3.14159265358979323846d0
  call algebra()
  call exclusion()
  call measured()
  write(*,'(A,I0,A,I0,A)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', failures, '}'
contains
  subroutine check(label, ok)
    character(*), intent(in) :: label
    logical, intent(in) :: ok
    checks = checks + 1
    if (ok) then
      write(*,'(A,A)') '  PASS  ', label
    else
      failures = failures + 1
      write(*,'(A,A)') '  FAIL  ', label
    end if
  end subroutine
  function rnd() result(k)                         ! integers in -9..9
    integer(i8) :: k
    seed = mod(seed * 6364136223846793005_i8 + 1442695040888963407_i8, 9223372036854775807_i8)
    k = mod(abs(seed / 65536_i8), 19_i8) - 9_i8
  end function
  function qm(p, q) result(r)                      ! product of two turns a + b i + c j + d k
    integer(i8), intent(in) :: p(4), q(4)
    integer(i8) :: r(4)
    r(1) = p(1)*q(1) - p(2)*q(2) - p(3)*q(3) - p(4)*q(4)
    r(2) = p(1)*q(2) + p(2)*q(1) + p(3)*q(4) - p(4)*q(3)
    r(3) = p(1)*q(3) - p(2)*q(4) + p(3)*q(1) + p(4)*q(2)
    r(4) = p(1)*q(4) + p(2)*q(3) - p(3)*q(2) + p(4)*q(1)
  end function
  function mm(a, b) result(c)                      ! product of two by two arrays of turns, stored (entry, part)
    integer(i8), intent(in) :: a(4,4), b(4,4)
    integer(i8) :: c(4,4)
    c(1,:) = qm(a(1,:), b(1,:)) + qm(a(2,:), b(3,:))
    c(2,:) = qm(a(1,:), b(2,:)) + qm(a(2,:), b(4,:))
    c(3,:) = qm(a(3,:), b(1,:)) + qm(a(4,:), b(3,:))
    c(4,:) = qm(a(3,:), b(2,:)) + qm(a(4,:), b(4,:))
  end function
  function dop(E, x, y, z, m) result(d)            ! the operator of first order, shifted by a mass
    integer(i8), intent(in) :: E, x, y, z, m
    integer(i8) :: d(4,4)
    d = 0
    d(1,1) = E + m; d(4,1) = -E + m
    d(2,2:4) = [x, y, z]; d(3,2:4) = [x, y, z]
  end function
  subroutine algebra()
    integer :: i, bad1, bad2, bad3, bad4, bad5, na, nb
    integer(i8) :: x, y, z, u, v, w, E, m, a, b, c, d, r(4), s(4,4), want(4,4)
    logical :: ok
    bad1 = 0; bad2 = 0; bad3 = 0; bad4 = 0
    do i = 1, 200000
      x = rnd(); y = rnd(); z = rnd(); u = rnd(); v = rnd(); w = rnd(); E = rnd()
      r = qm([0_i8, x, y, z], [0_i8, x, y, z])
      if (any(r /= [-(x*x + y*y + z*z), 0_i8, 0_i8, 0_i8])) bad1 = bad1 + 1
      r = qm([0_i8, x, y, z], [0_i8, u, v, w])
      if (any(r /= [-(x*u + y*v + z*w), y*w - z*v, z*u - x*w, x*v - y*u])) bad2 = bad2 + 1
      s = mm(dop(E, x, y, z, 0_i8), dop(E, x, y, z, 0_i8))
      want = 0; want(1,1) = E*E - (x*x + y*y + z*z); want(4,1) = want(1,1)
      if (any(s /= want)) bad3 = bad3 + 1
      ! a point on the mass shell: (a2+b2+c2+d2)^2 = (a2+b2-c2-d2)^2 + (2(ad+bc))^2 + (2(bd-ac))^2
      a = rnd(); b = rnd(); c = rnd(); d = rnd()
      E = a*a + b*b + c*c + d*d; m = a*a + b*b - c*c - d*d; x = 2*(a*d + b*c); y = 2*(b*d - a*c)
      s = mm(dop(E, x, y, 0_i8, -m), dop(E, x, y, 0_i8, m))
      if (any(s /= 0)) bad4 = bad4 + 1
    end do
    write(*,'(A)') ' A. The algebra, on 200000 random integer points'
    call check('the square of a direction is minus its squared length', bad1 == 0)
    call check('the product of two directions carries the dot and the cross', bad2 == 0)
    call check('the operator of first order squares to the mass shell', bad3 == 0)
    call check('on the mass shell, operator less mass times operator plus mass is zero', bad4 == 0)
    bad5 = 0
    do na = -6, 6
      do nb = -6, 6
        ok = (na*1 + nb*0)**2 == 1 .and. (na*0 + nb*1)**2 == 1 .and. (na + nb)**2 == 2
        if (ok) bad5 = bad5 + 1
      end do
    end do
    call check('no pair of numbers takes the square root, a and b in -6..6', bad5 == 0)
    call search2(na, nb)
    write(*,'(A,I0,A,I0)') '   size two, entries 0, 1, -1, i, -i: matrices whose square is a scalar, not zero: ', na, &
         '; largest set that anticommutes in pairs: ', nb
    call check('in size two three coefficients anticommute and four never do', nb == 3)
  end subroutine
  subroutine search2(nsq, best)                      ! exhaustive search in size two
    integer, intent(out) :: nsq, best
    complex(dp), parameter :: v(5) = [(0d0,0d0), (1d0,0d0), (-1d0,0d0), (0d0,1d0), (0d0,-1d0)]
    complex(dp), allocatable :: m(:,:,:)
    complex(dp) :: a(2,2), z(2,2)
    integer :: i1, i2, i3, i4, p, q, r, t
    logical, allocatable :: ac(:,:)
    allocate(ac(625,625), m(2,2,625))
    nsq = 0
    do i1 = 1, 5; do i2 = 1, 5; do i3 = 1, 5; do i4 = 1, 5
      a = reshape([v(i1), v(i2), v(i3), v(i4)], [2,2]); z = matmul(a, a)
      if (isz(z(1,2)) .and. isz(z(2,1)) .and. isz(z(1,1) - z(2,2)) .and. .not. isz(z(1,1))) then
        nsq = nsq + 1; m(:,:,nsq) = a
      end if
    end do; end do; end do; end do
    do p = 1, nsq
      do q = 1, nsq
        ac(p,q) = all(isz(matmul(m(:,:,p), m(:,:,q)) + matmul(m(:,:,q), m(:,:,p))))
      end do
    end do
    best = 1
    do p = 1, nsq
      do q = p + 1, nsq
        if (.not. ac(p,q)) cycle
        best = max(best, 2)
        do r = q + 1, nsq
          if (.not. (ac(p,r) .and. ac(q,r))) cycle
          best = max(best, 3)
          do t = r + 1, nsq
            if (ac(p,t) .and. ac(q,t) .and. ac(r,t)) best = max(best, 4)
          end do
        end do
      end do
    end do
  end subroutine
  elemental logical function isz(c)                  ! entries are whole numbers, so the test is exact
    complex(dp), intent(in) :: c
    isz = nint(real(c)) == 0 .and. nint(aimag(c)) == 0
  end function
  integer function count_sign_maps()                 ! homomorphisms from the permutations of three things to +-1
    integer :: perm(3,6), f(6), mask, a, b, c, k, comp(3)
    logical :: ok
    perm = reshape([1,2,3, 1,3,2, 2,1,3, 2,3,1, 3,1,2, 3,2,1], [3,6])
    count_sign_maps = 0
    do mask = 0, 63
      do a = 1, 6
        f(a) = merge(-1, 1, btest(mask, a - 1))
      end do
      ok = .true.
      do a = 1, 6
        do b = 1, 6
          do k = 1, 3
            comp(k) = perm(perm(k, b), a)
          end do
          do c = 1, 6
            if (all(perm(:, c) == comp)) then
              if (f(c) /= f(a)*f(b)) ok = .false.
            end if
          end do
        end do
      end do
      if (ok) count_sign_maps = count_sign_maps + 1
    end do
  end function
  subroutine exclusion()
    integer :: i, j, bad1, bad2, bad3, sg
    integer(i8) :: f(12), g(12), psi(12,12)
    bad1 = 0; bad2 = 0; bad3 = 0
    do i = 1, 12
      f(i) = rnd(); g(i) = rnd() + 10
    end do
    do i = 1, 12                                     ! the amplitude with the minus sign, built once and then read
      do j = 1, 12
        psi(i,j) = f(i)*g(j) - f(j)*g(i)
      end do
    end do
    do i = 1, 12
      if (psi(i,i) /= 0) bad1 = bad1 + 1             ! empty wherever the two share a state
      do j = 1, 12
        if (psi(j,i) /= -psi(i,j)) bad1 = bad1 + 1
      end do
    end do
    do sg = -50, 50
      if ((sg*sg == 1) .neqv. (sg == 1 .or. sg == -1)) bad2 = bad2 + 1
    end do
    bad3 = count_sign_maps()                         ! maps from the six permutations of three things to +-1
    write(*,'(A)') ' B. Exclusion and the two statistics'
    call check('an amplitude with the minus sign vanishes wherever two share a state', bad1 == 0)
    call check('a sign whose square is one is plus one or minus one, -50..50', bad2 == 0)
    write(*,'(A,I0)') '   maps from the permutations of three things to signs that respect products: ', bad3
    call check('the permutations of three things carry two statistics and no third', bad3 == 2)
  end subroutine
  subroutine measured()
    real(dp) :: alpha, ghalf, sch, qm_ratio, qm_sig
    write(*,'(A)') ' C. Against published measurements'
    alpha = 7.2973525693d-3                         ! measured input
    ghalf = 1.00115965218059d0                      ! Fan et al., 2023, uncertainty 13 in the last two digits
    sch = alpha/(2*pi)
    write(*,'(A,F16.14,A,F10.8)') '   half the moment of the electron: least law 1, measured ', ghalf, &
         ', first correction alpha/2pi = ', sch
    ! thresholds are the scales of the expansion, not fitted numbers: alpha for the least law, (alpha/pi)^2 for the rest
    call check('the least law holds within alpha: measured 1.00115965218059(13)', abs(ghalf - 1.0d0) < alpha)
    ! rival: a law with no spin term gives half the moment as one half
    write(*,'(A,F8.5,A)') '   rival, no spin term: half the moment 0.5, away from the measured value by ', abs(ghalf - 0.5d0), ''
    call check('a law with no spin term is excluded: it misses by more than alpha', abs(ghalf - 0.5d0) > alpha)
    call check('the first correction closes the rest within (alpha/pi)^2', abs(ghalf - 1.0d0 - sch) < (alpha/pi)**2)
    qm_ratio = -1.000000000003d0; qm_sig = 16.0d-12  ! Borchert et al., 2022
    write(*,'(A,F6.2,A)') '   antiproton to proton charge over mass: -1 at ', abs(qm_ratio + 1.0d0)/qm_sig, &
         ' uncertainties'
    call check('the antiparticle mirrors the particle: -1.000000000003(16) against -1', &
               abs(qm_ratio + 1.0d0)/qm_sig < 1.0d0)
    ! a bound compared with the forced value zero cannot fail: it is printed as a reading and is not counted
    write(*,'(A)') '   reading, not a check: exclusion forced 0; measured probability of a violation below 3.4e-29'
  end subroutine
end program
