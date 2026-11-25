! Record_Forced_Twin_CC.f90 · twin of SPHYS_Record_Forced_CC.lean
! RATIONALE. The engine proves its statements for every history of maps of every finite set. This twin executes
!   them on generated histories as an independent run; tests, for every pair of times, whether any map could undo
!   the history between them; generates an evaporation act by act; and sets one reading against a published
!   measurement.
! DESIGN. A state is a number from 1 to NS. An act is built from a random pairing of the states, the fold: with
!   chance one in three it is idle, and otherwise it writes each of a random half of the pairs as one state, and
!   then renames the states by a random permutation. Such an act is a registration followed by a renaming.
!   Integers throughout, double precision for the areas; one generator, fixed seed.
! NON-NEGOTIABLE. Every check computes both sides. A line marked "reading" is printed and not counted.
! RISK. The scans cover generated histories only. The areas are computed from printed central values and from the
!   corner of the printed intervals least favourable to the statement; the corner is not a probability. The area of
!   a hole of mass m and spin chi is proportional to m**2 (1 + sqrt(1 - chi**2)); the common factor is dropped, and
!   the initial holes are taken without spin, which makes their areas largest.
program record_twin
  implicit none
  integer, parameter :: i8 = selected_int_kind(18), dp = kind(1.0d0), NS = 64, L = 40, NH = 500
  integer(i8) :: seed = 20260622_i8
  integer :: checks = 0, failures = 0
  call histories()
  call seat()
  call turnover()
  call names()
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
  function rnd(n) result(k)                        ! 0 .. n-1
    integer, intent(in) :: n
    integer :: k
    seed = mod(seed * 6364136223846793005_i8 + 1442695040888963407_i8, 9223372036854775807_i8)
    k = int(mod(abs(seed / 65536_i8), int(n, i8)))
  end function
  subroutine shuffle(p)
    integer, intent(out) :: p(NS)
    integer :: i, j, t
    do i = 1, NS
      p(i) = i
    end do
    do i = NS, 2, -1
      j = 1 + rnd(i); t = p(i); p(i) = p(j); p(j) = t
    end do
  end subroutine
  subroutine make_act(f)                           ! a registration followed by a renaming
    integer, intent(out) :: f(NS)
    integer :: p(NS), q(NS), i
    call shuffle(p)                                ! the fold pairs p(1) with p(2), p(3) with p(4), ...
    do i = 1, NS
      f(i) = i
    end do
    if (rnd(3) /= 0) then
      do i = 1, NS - 1, 2
        if (rnd(2) == 0) f(p(i + 1)) = p(i)        ! this pair is written as one state
      end do
    end if
    call shuffle(q)
    do i = 1, NS
      f(i) = q(f(i))
    end do
  end subroutine
  function count_alive(s) result(c)
    integer, intent(in) :: s(NS)
    integer :: c, i
    logical :: seen(NS)
    seen = .false.
    do i = 1, NS
      seen(s(i)) = .true.
    end do
    c = count(seen)
  end function
  subroutine histories()
    integer :: f(NS), run(NS, 0:L), al(0:L), h, n, m, i, j
    integer :: bad_sign, bad_half, bad_span, bad_ret, bad_undo, erasing, spans, returned, pairs_tested
    logical :: undo
    bad_sign = 0; bad_half = 0; bad_span = 0; bad_ret = 0; bad_undo = 0; erasing = 0; spans = 0; returned = 0
    pairs_tested = 0
    do h = 1, NH
      do i = 1, NS
        run(i, 0) = i
      end do
      al(0) = NS
      do n = 1, L
        call make_act(f)
        do i = 1, NS
          run(i, n) = f(run(i, n - 1))
        end do
        al(n) = count_alive(run(:, n))
        if (al(n) > al(n - 1)) bad_sign = bad_sign + 1
        if (al(n - 1) > 2*al(n)) bad_half = bad_half + 1
        if (al(n) < al(n - 1)) erasing = erasing + 1
      end do
      do n = 0, L - 1
        do m = n + 1, L
          spans = spans + 1
          if (al(m) == al(n)) then
            returned = returned + 1
            if (any(al(n + 1:m) /= al(n))) bad_ret = bad_ret + 1
          end if
          if (al(n + 1) < al(n)) then
            if (.not. (NS - al(m) > NS - al(n))) bad_span = bad_span + 1
            ! could any map g give run(., n) from run(., m)? Only if states equal at m are equal at n
            undo = .true.; pairs_tested = pairs_tested + 1
            do i = 1, NS
              do j = i + 1, NS
                if (run(i, m) == run(j, m) .and. run(i, n) /= run(j, n)) undo = .false.
              end do
            end do
            if (undo) bad_undo = bad_undo + 1
          end if
        end do
      end do
    end do
    write(*,'(A,I0,A,I0,A,I0,A)') ' A. ', NH, ' histories of ', L, ' acts on ', NS, ' states'
    write(*,'(A,I0,A,I0,A,I0)') '   erasing acts: ', erasing, '   spans: ', spans, '   spans that returned the record: ', returned
    call check('no act raises the number of states told apart', bad_sign == 0)
    call check('no act takes that number below one half', bad_half == 0)
    call check('a span that returns the record holds no erasing act', bad_ret == 0)
    call check('a span that starts with an erasing act ends strictly above its start', bad_span == 0)
    write(*,'(A,I0)') '   pairs of times tested for a map that undoes the history between them: ', pairs_tested
    call check('after an erasing act no map of the states gives back the earlier history', bad_undo == 0 .and. pairs_tested > 0)
  end subroutine
  subroutine seat()
    integer :: s, h, cnt(0:20, -5:5), bad, off, on
    cnt = 0; bad = 0; off = 0; on = 0
    do s = -20, 20
      do h = -5, 5
        cnt(abs(s), h) = cnt(abs(s), h) + 1
      end do
    end do
    do s = 0, 20
      do h = -5, 5
        if (s == 0) then
          on = on + 1
          if (cnt(s, h) /= 1) bad = bad + 1
        else
          off = off + 1
          if (cnt(s, h) /= 2) bad = bad + 1
        end if
      end do
    end do
    write(*,'(A)') ' B. The seat: 451 states, a side from -20 to 20 and a height from -5 to 5'
    write(*,'(A,I0,A,I0)') '   values of the registration taken twice: ', off, '   taken once: ', on
    call check('a value is taken by two states off the line and by one on it; 440 states off the line give 220 values', &
               bad == 0 .and. off == 220 .and. on == 11)
  end subroutine
  subroutine turnover()
    integer :: t, m, r1, r2, turn, k, idle
    logical :: ok, first
    t = 1000; ok = .true.; first = .true.; turn = 0; k = 0; r1 = 0; m = 0; idle = 0
    do while (r1 < t)
      m = m + 1
      r2 = r1 + merge(0, 1, rnd(5) == 0)             ! the gain of this act: zero one time in five
      if (r2 < r1) ok = .false.
      if (m == 1 .and. .not. (2*(t - r1) > t)) first = .false.
      if (2*r1 <= t .and. 2*r2 > t) then
        turn = m; k = k + 1
      end if
      if (2*r1 > t .and. 2*r2 <= t) k = k + 100       ! the majority going back would be counted here
      if (r2 == r1) idle = idle + 1
      r1 = r2
    end do
    write(*,'(A)') ' C. The turnover'
    write(*,'(A,I0,A,I0,A,I0)') '   a total of ', t, ' in ', m, ' acts, idle acts ', idle
    write(*,'(A,I0,A,I0)') '   the majority changes hands at act ', turn, '; times it changes hands: ', k
    call check('the share that only grows takes the majority once and keeps it; the other starts with it and ends with none', &
               ok .and. first .and. k == 1 .and. t - r1 == 0)
  end subroutine
  subroutine names()
    integer :: nm(4096), cnt, k, i
    logical :: seen(0:4095), ok
    ok = .true.; nm(1) = 0; cnt = 1
    do k = 1, 12
      do i = 1, cnt
        nm(cnt + i) = 2*nm(i) + 1; nm(i) = 2*nm(i)
      end do
      cnt = 2*cnt
      seen = .false.
      do i = 1, cnt
        if (seen(nm(i))) ok = .false.
        seen(nm(i)) = .true.
      end do
      if (cnt /= 2**k) ok = .false.
    end do
    write(*,'(A)') ' D. A boundary'
    write(*,'(A,I0)') '   names written by a boundary of 12 sites, all distinct: ', cnt
    call check('a boundary of k sites of one bit writes 2**k distinct names, k = 1 to 12', ok)
  end subroutine
  function area(mm, chi) result(a)
    real(dp), intent(in) :: mm, chi
    real(dp) :: a
    a = mm*mm*(1 + sqrt(1 - chi*chi))
  end function
  subroutine measured()
    real(dp) :: ai, af
    write(*,'(A)') ' E. Against a published measurement: the merger GW150914'
    ai = area(36.0d0, 0.0d0) + area(29.0d0, 0.0d0); af = area(62.0d0, 0.67d0)
    write(*,'(A,F8.1,A,F8.1,A,F6.3)') '   central values: initial ', ai, ', final ', af, ', ratio ', af/ai
    call check('the area of the remnant exceeds the sum of the initial areas at the central values', af > ai)
    ai = area(41.0d0, 0.0d0) + area(33.0d0, 0.0d0); af = area(58.0d0, 0.72d0)
    write(*,'(A,F8.1,A,F8.1,A,F6.3)') '   least favourable corner: initial ', ai, ', final ', af, ', ratio ', af/ai
    call check('and at the corner of the printed intervals least favourable to it', af > ai)
    write(*,'(A)') '   reading, not a check: Isi et al. (2021) find agreement with the area law at 97 per cent probability'
  end subroutine
end program
