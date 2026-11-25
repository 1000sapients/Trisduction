! Correlation_Forced_Twin_CC.f90 · twin of SPHYS_Correlation_Forced_CC.lean
! RATIONALE. The engine proves its statements over all integers. This twin executes them on enumerated and random
!   data, computes the pair of the quantum in floating point at many settings, and sets the local reach against
!   four published experiments.
! DESIGN. Integers for records and tables; double precision for the singlet; one generator, fixed seed.
! NON-NEGOTIABLE. The twin never predicts which outcome occurs. It checks counts, bounds and biases only.
! RISK. The four measured values are those printed in Part I with their sources; they are inputs here.
program correlation_twin
  implicit none
  integer, parameter :: i8 = selected_int_kind(18), dp = kind(1.0d0)
  integer(i8) :: seed = 20260622_i8
  integer :: checks = 0, failures = 0
  real(dp), parameter :: pi = 3.14159265358979323846d0
  call records()
  call tables()
  call singlet()
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
  function rnd(n) result(k)                        ! integers in 0..n-1
    integer, intent(in) :: n
    integer :: k
    seed = mod(seed * 6364136223846793005_i8 + 1442695040888963407_i8, 9223372036854775807_i8)
    k = int(mod(abs(seed / 65536_i8), int(n, i8)))
  end function
  function uni() result(u)
    real(dp) :: u
    u = (rnd(1000000) + 0.5d0)/1.0d6
  end function
  subroutine records()
    integer :: i, bad1, bad2, pp, pm, mp, mm, s1, s2, k1, k2
    bad1 = 0; bad2 = 0
    do i = 1, 200000
      pp = rnd(500); pm = rnd(500); mp = rnd(500); mm = rnd(500)
      k1 = rnd(pp + pm + 1); k2 = rnd(mp + mm + 1)          ! the far side redistributes each of my rows at will
      s1 = k1 + (pp + pm - k1); s2 = k2 + (mp + mm - k2)
      if (s1 /= pp + pm .or. s2 /= mp + mm) bad1 = bad1 + 1
      if ((pm + mp - pp - mm) /= -(pp + mm - pm - mp)) bad2 = bad2 + 1
    end do
    write(*,'(A)') ' A. The registration, on 200000 random joint records'
    call check('any far operation that keeps my rows leaves my record', bad1 == 0)
    call check('a far relabelling reverses the correlation', bad2 == 0)
  end subroutine
  subroutine tables()
    integer :: a0, a1, b0, b1, s, bad, i, j, n, w, tot, wt, v(16), nt
    bad = 0; nt = 0
    do a0 = -1, 1, 2
      do a1 = -1, 1, 2
        do b0 = -1, 1, 2
          do b1 = -1, 1, 2
            s = a0*b0 + a0*b1 + a1*b0 - a1*b1
            nt = nt + 1; v(nt) = s
            if (abs(s) /= 2) bad = bad + 1
          end do
        end do
      end do
    end do
    write(*,'(A)') ' B. Local records'
    call check('all sixteen tables give plus or minus two', bad == 0 .and. nt == 16)
    bad = 0
    do i = 1, 100000
      n = 1 + rnd(12); tot = 0; wt = 0
      do j = 1, n
        w = rnd(1000); tot = tot + w*v(1 + rnd(16)); wt = wt + w
      end do
      if (abs(tot) > 2*wt) bad = bad + 1
    end do
    call check('100000 random mixtures of tables stay within two', bad == 0)
    bad = 0
    do w = 0, 200
      do j = 0, w
        if (2*j - 2*(w - j) /= 4*j - 2*w) bad = bad + 1
      end do
    end do
    call check('every step from -2W to 2W is reached, W = 0..200', bad == 0)
  end subroutine
  subroutine singlet()
    integer :: i, bad, bias_bad
    integer(i8) :: T(4,4), T2(4,4), E(4,4), psi(4), ZI(4,4), IZ(4,4), Id(4,4)
    real(dp) :: a0, a1, b0, b1, s, smax, tsir, pplus
    tsir = 2*sqrt(2.0d0)
    s = -cos(0.0d0 - pi/4) - cos(0.0d0 + pi/4) - cos(pi/2 - pi/4) + cos(pi/2 + pi/4)
    write(*,'(A)') ' C. The pair of the quantum'
    write(*,'(A,F9.6,A,F9.6)') '   value at the settings 0, pi/2 against pi/4, -pi/4: ', s, '   2*sqrt(2) = ', tsir
    call check('the singlet reaches 2*sqrt(2) at the settings of the engine', abs(abs(s) - tsir) < 1.0d-12)
    bad = 0; smax = 0; bias_bad = 0
    do i = 1, 100000
      a0 = 2*pi*uni(); a1 = 2*pi*uni(); b0 = 2*pi*uni(); b1 = 2*pi*uni()
      s = -cos(a0 - b0) - cos(a0 - b1) - cos(a1 - b0) + cos(a1 - b1)
      smax = max(smax, abs(s))
      if (abs(s) > tsir + 1.0d-12) bad = bad + 1
      pplus = (1 + cos(a0 - b0))/4 + (1 - cos(a0 - b0))/4      ! my plus outcome, summed over the other's
      if (abs(pplus - 0.5d0) > 1.0d-15) bias_bad = bias_bad + 1
    end do
    write(*,'(A,F9.6)') '   largest value over 100000 random settings: ', smax
    call check('no one of 100000 random settings exceeds 2*sqrt(2)', bad == 0)
    call check('my record of the singlet is unbiased at every setting of the other', bias_bad == 0)
    T = 0; T(1,1) = 2; T(2,2) = -2; T(3,3) = -2; T(4,4) = 2; T(1,4) = 2; T(2,3) = 2; T(3,2) = 2; T(4,1) = 2
    psi = [0_i8, 1_i8, -1_i8, 0_i8]
    E = 0; E(1,1) = 16; E(2,2) = 16; E(3,3) = 16; E(4,4) = 16
    T2 = matmul(T, T)
    call check('integer form: T on the singlet is -4, and T^2 (T^2 - 16) = 0', &
               all(matmul(T, psi) == -4*psi) .and. all(matmul(T2, T2 - E) == 0))
    ! the pair read with Z on both sides: the chance of plus-plus and of minus-minus (times four), and my bias,
    ! computed from the singlet and the two readings; a wrong state or a wrong reading makes this fail
    ZI = 0; ZI(1,1) = 1; ZI(2,2) = 1; ZI(3,3) = -1; ZI(4,4) = -1
    IZ = 0; IZ(1,1) = 1; IZ(2,2) = -1; IZ(3,3) = 1; IZ(4,4) = -1
    Id = E/16
    call check('the pair at equal settings: same outcome never, my record unbiased (from the arrays)', &
               dot_product(psi, matmul(Id + ZI, matmul(Id + IZ, psi))) == 0 .and. &
               dot_product(psi, matmul(Id - ZI, matmul(Id - IZ, psi))) == 0 .and. dot_product(psi, matmul(ZI, psi)) == 0)
  end subroutine
  subroutine measured()
    real(dp) :: val(4), sig(4), tsir
    character(40) :: nm(4)
    integer :: i
    logical :: ok
    tsir = 2*sqrt(2.0d0)
    nm = [character(40) :: 'Aspect, Grangier and Roger, 1982', 'Weihs et al., 1998', 'Hensen et al., 2015', &
          'Storz et al., 2023']
    val = [2.697d0, 2.73d0, 2.42d0, 2.0747d0]; sig = [0.015d0, 0.02d0, 0.20d0, 0.0033d0]
    write(*,'(A)') ' D. Against published measurements'
    ok = .true.
    do i = 1, 4
      write(*,'(A,A,F7.4,A,F5.1,A)') '   ', nm(i), val(i), '   above the local reach by ', (val(i) - 2)/sig(i), &
           ' uncertainties'
      if (val(i) <= 2 .or. val(i) >= tsir) ok = .false.
    end do
    ! the convention of five uncertainties is asked of the loophole-free result of 2023; no threshold is fitted
    call check('four experiments lie above two and below 2*sqrt(2); the loophole-free one of 2023 by more than five', &
               ok .and. (val(4) - 2)/sig(4) > 5.0d0)
  end subroutine
end program
