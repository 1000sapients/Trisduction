! Record_Forced_Twin_CC.f90 · numerical twin of SPHYS_Record_Forced_CC.lean
! RATIONALE. The engine proves the step law and the one sign for the record of acts. This twin scans the same
!   statements over generated histories (A to G) and sets one of them against a published measurement (H).
! DESIGN. Integers and double precision, no library. A state is a pair (x, y); it is on the line when x = 1; the
!   registration sets x to 1. A fixed linear congruential generator makes every run print the same numbers.
!   Measured inputs of H: the masses and the final spin of GW150914 with their 90 per cent intervals
!   (Abbott et al. 2016). The area of a hole of mass m and spin chi is 8 pi (G m / c**2)**2 (1 + sqrt(1 - chi**2));
!   the common factor is dropped, and the initial holes are taken without spin, which makes their areas largest.
! RISK. The scans cover generated histories only; the theorems are the engine's. H compares areas computed from
!   printed central values and from the corner of the printed intervals least favourable to the theorem; the
!   corner is not a probability.
! NON-NEGOTIABLE. Every check computes both sides. A line marked "reading" is printed and not counted.
program record_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0), L = 200, NH = 2000
  integer :: nfail, i, j, k, m, t, x(L), rec(0:L), r1, r2, cnt, turn, npass
  integer :: names(4096)
  logical :: seen(0:4095)
  integer(8) :: seed
  logical :: ok, ok2, ok3, ok4
  real(dp) :: ai, af
  nfail = 0; npass = 0; seed = 20260622_8

  ! A. the step law and the one sign, over 2000 histories of 200 acts
  ok = .true.; ok2 = .true.; ok3 = .true.; ok4 = .true.; cnt = 0
  do i = 1, NH
    call history(x)
    rec(0) = 0
    do j = 1, L
      rec(j) = rec(j-1) + gain(x(j))
      if (gain(x(j)) < 0 .or. gain(x(j)) > 1) ok = .false.
      if (rec(j) < rec(j-1)) ok2 = .false.
    end do
    if (rec(L) > L) ok4 = .false.
    ! C. the count is the same read backwards
    r1 = 0; do j = L, 1, -1; r1 = r1 + gain(x(j)); end do
    if (r1 /= rec(L)) ok3 = .false.
    cnt = cnt + rec(L)
  end do
  write(*,'(a,i0,a,i0,a)') '  ', NH, ' histories of ', L, ' acts'
  write(*,'(a,i0)') '  bits erased in all: ', cnt
  call check('A1 every gain is 0 or 1', ok)
  call check('A2 the record never decreases along the order of the acts', ok2)
  call check('C  the record of a history read backwards is the same', ok3)
  call check('E  the record is at most the number of acts', ok4)

  ! B. spans: the record returns exactly when every act in the span is idle; one erasing act and it does not
  ok = .true.; ok2 = .true.; cnt = 0
  do i = 1, NH
    call history(x)
    rec(0) = 0
    do j = 1, L; rec(j) = rec(j-1) + gain(x(j)); end do
    do t = 1, 20
      m = irand(L - 20); k = 1 + irand(20)
      r1 = 0; do j = m + 1, m + k; r1 = r1 + gain(x(j)); end do
      if (rec(m+k) == rec(m)) then
        cnt = cnt + 1
        if (r1 /= 0) ok = .false.
      else
        if (.not. (rec(m+k) > rec(m) .and. r1 > 0)) ok2 = .false.
      end if
    end do
  end do
  write(*,'(a,i0,a,i0)') '  spans tried: ', 20*NH, '; spans that returned the record: ', cnt
  call check('B1 a span that returns the record holds no erasing act', ok)
  call check('B2 a span with an erasing act ends strictly above its start', ok2)

  ! D. the registration merges each state off the line with its fold partner, and no state on it
  ok = .true.; cnt = 0
  do i = -20, 22
    if (i /= 1) then
      cnt = cnt + 1
      if (.not. (2 - i /= i .and. gain(i) == 1 .and. gain(2 - i) == 1)) ok = .false.
    else
      if (gain(i) /= 0 .or. 2 - i /= i) ok = .false.
    end if
  end do
  write(*,'(a,i0)') '  states off the line tried: ', cnt
  call check('D  a gain of 1 is a state with a distinct fold partner; a gain of 0 is a state on the line', ok)

  ! F. the turnover: an evaporation generated act by act until the record reaches the total T
  t = 1000; ok = .true.; ok2 = .true.; turn = 0; k = 0; r1 = 0; m = 0; cnt = 0
  do while (r1 < t)
    m = m + 1
    r2 = r1 + gain(irand(5) - 1)             ! the radiation's share after this act
    if (r2 < r1) ok = .false.                ! the radiation's share never shrinks
    if ((t - r2) + r2 /= t) ok = .false.     ! the record is complete
    if (m == 1) then
      if (.not. (2*(t - r1) > t)) ok2 = .false.   ! before the first act the hole holds the majority
    end if
    if (2*r1 < t .and. 2*r2 >= t) then
      turn = m; k = k + 1                    ! the majority changes hands at this act
    end if
    if (r2 == r1) cnt = cnt + 1
    r1 = r2
  end do
  write(*,'(a,i0,a,i0,a,i0)') '  evaporation of ', t, ' bits in ', m, ' acts, idle acts ', cnt
  write(*,'(a,i0,a,i0)') '  the majority changes hands at act ', turn, '; times it changes hands: ', k
  call check('F1 the record is complete at every step and the radiation never loses a bit', ok)
  call check('F2 the hole holds the majority at first, the radiation at last, it changes hands once, nothing is left', &
             ok2 .and. 2*r1 > t .and. k == 1 .and. t - r1 == 0)

  ! G. the names a boundary of k sites writes, built as the engine builds them: each name of k-1 sites, extended by 0 and by 1
  ok = .true.; names(1) = 0; cnt = 1
  do k = 1, 12
    do i = 1, cnt
      names(cnt + i) = 2*names(i) + 1; names(i) = 2*names(i)
    end do
    cnt = 2*cnt
    seen = .false.
    do i = 1, cnt
      if (seen(names(i))) ok = .false.        ! a name written twice
      seen(names(i)) = .true.
    end do
    if (cnt /= 2**k) ok = .false.
  end do
  write(*,'(a,i0)') '  names written by a boundary of 12 sites, all distinct: ', cnt
  call check('G  a boundary of k one-bit sites writes 2**k distinct names, k = 1 to 12', ok)

  ! H. measured: the area of the remnant of GW150914 against the sum of the areas of the two holes that merged
  ai = area(36.0_dp, 0.0_dp) + area(29.0_dp, 0.0_dp); af = area(62.0_dp, 0.67_dp)
  write(*,'(a,f8.1,a,f8.1,a,f6.3)') '  GW150914, central values: initial ', ai, ', final ', af, ', ratio ', af/ai
  call check('H1 the final area exceeds the sum of the initial areas at the central values', af > ai)
  ai = area(41.0_dp, 0.0_dp) + area(33.0_dp, 0.0_dp); af = area(58.0_dp, 0.72_dp)
  write(*,'(a,f8.1,a,f8.1,a,f6.3)') '  GW150914, least favourable corner: initial ', ai, ', final ', af, ', ratio ', af/ai
  call check('H2 and at the corner of the printed intervals least favourable to it', af > ai)
  write(*,'(a)') '  reading: Isi et al. (2021) find agreement with the area law at 97 per cent probability'

  write(*,'(a,i0,a,i0)') 'checks passed: ', npass, '   failures: ', nfail
contains
  integer function gain(xx)
    integer, intent(in) :: xx
    gain = 1; if (xx == 1) gain = 0
  end function
  real(dp) function area(mm, chi)
    real(dp), intent(in) :: mm, chi
    area = mm*mm*(1.0_dp + sqrt(1.0_dp - chi*chi))
  end function
  integer function irand(n)          ! 0 .. n-1
    integer, intent(in) :: n
    seed = mod(seed*6364136223846793005_8 + 1442695040888963407_8, 9223372036854775807_8)
    if (seed < 0) seed = -seed
    irand = int(mod(seed/65536_8, int(n,8)))
  end function
  subroutine history(xx)
    integer, intent(out) :: xx(L)
    integer :: jj
    do jj = 1, L
      xx(jj) = irand(5) - 1          ! -1 .. 3: one state in five is on the line
    end do
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
end program record_twin
