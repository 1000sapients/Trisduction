! Universal_Seat_Twin.f90 . the executed twin of Universal_Seat.lean.
! Every check is a finite computation that ends. Each law that could be coded as an identity runs beside a control
! in which it must fail, so a green line here is a check that could have been red. The lost bit is checked where it
! can fail: the registration, computed, sends both partners to one record; that no map returns both is then the
! consequence, printed and no pass condition. The zeros of the series are located by the twin, none supplied.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off
program universal_seat_twin
  use, intrinsic :: iso_fortran_env, only: qp => real128, dp => real64
  implicit none
  integer :: nchk = 0, nfail = 0
  call seats()
  call both_partners()
  call two_definitions()
  call stream()
  call bridge()
  call floor_digit()
  call zeta_series()
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', nchk, ',"failures":', nfail, '}'
  if (nfail /= 0) error stop 1
contains
  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    nchk = nchk + 1
    if (.not. ok) nfail = nfail + 1
    write(*,'(a,a)') merge('  PASS  ', '  FAIL  ', ok), name
  end subroutine check
  ! the chart at grain n: the fold x to 2n - x, the registration onto x = n; grain 0 is the offset chart
  pure function foldg(n, p) result(q)
    integer, intent(in) :: n, p(2)
    integer :: q(2)
    q = [2 * n - p(1), p(2)]
  end function foldg
  pure function regg(n, p) result(q)
    integer, intent(in) :: n, p(2)
    integer :: q(2)
    q = [n, p(2)]
  end function regg
  pure integer function idx(p)
    integer, intent(in) :: p(2)
    idx = p(1) + 2 + 3 * p(2)
  end function idx
  pure logical function hasoff(m)
    integer, intent(in) :: m
    hasoff = iand(m, 365) /= 0
  end function hasoff
  pure integer function recof(m)
    integer, intent(in) :: m
    integer :: t
    recof = 0
    do t = 0, 2
      if (iand(m, ishft(7, 3 * t)) /= 0) recof = ibset(recof, t)
    end do
  end function recof

  ! I . the four laws of a seat, on five charts
  subroutine seats()
    integer :: gr(5), i, n, x, t, p(2)
    logical :: ok
    gr = [0, 1, 2, 6, 10]; ok = .true.
    do i = 1, 5
      n = gr(i)
      do x = n - 5, n + 5
        do t = 0, 3
          p = [x, t]
          if (any(foldg(n, foldg(n, p)) /= p)) ok = .false.
          if (any(foldg(n, regg(n, p)) /= regg(n, p))) ok = .false.
          if (all(foldg(n, p) == p) .and. any(regg(n, p) /= p)) ok = .false.
          if (any(regg(n, foldg(n, p)) /= regg(n, p))) ok = .false.
          if (all(regg(n, p) == p) .neqv. all(foldg(n, p) == p)) ok = .false.
        end do
      end do
    end do
    call check('I: the four laws of a seat hold on five charts, grains 0, 1, 2, 6 and 10, 220 points', ok)
  end subroutine seats

  ! II . one bit is lost. What can fail is checked: the two partners of a pair are distinct and the registration,
  ! computed, sends both to one record. From that alone no map returns both, so that count is printed as the
  ! consequence it is and is no pass condition. The live counts are the most recovered and the times one is.
  subroutine both_partners()
    integer :: g(6), m, k, i, t, mode, got, best(2), nboth(2), none_(2), nsame(2), ip, iq, rp, rq
    best = 0; nboth = 0; none_ = 0; nsame = 0
    do mode = 1, 2
      do t = 0, 1
        ip = idx([1, t]); iq = idx(foldg(0, [1, t]))
        if (mode == 1) then
          rp = idx(regg(0, [1, t])); rq = idx(regg(0, foldg(0, [1, t])))
        else
          rp = ip; rq = iq
        end if
        if (ip /= iq .and. rp == rq) nsame(mode) = nsame(mode) + 1
      end do
      do m = 0, 6**6 - 1
        k = m
        do i = 1, 6
          g(i) = mod(k, 6) + 1; k = k / 6
        end do
        do t = 0, 1
          ip = idx([1, t]); iq = idx(foldg(0, [1, t]))
          if (mode == 1) then
            rp = idx(regg(0, [1, t])); rq = idx(regg(0, foldg(0, [1, t])))
          else
            rp = ip; rq = iq
          end if
          got = 0
          if (g(rp) == ip) got = got + 1
          if (g(rq) == iq) got = got + 1
          best(mode) = max(best(mode), got)
          if (got == 2) nboth(mode) = nboth(mode) + 1
          if (got == 1) none_(mode) = none_(mode) + 1
        end do
      end do
    end do
    write(*,'(a,i0,a,i0,a,i0,a,i0)') '  pairs sent to one record ', nsame(1), ' of 2; most recovered ', best(1), &
         '; one member ', none_(1), ' times; both, the consequence, ', nboth(1)
    call check('II: both partners of each pair go to one record; over 46656 maps the most recovered is one, 31104 times', &
         nsame(1) == 2 .and. best(1) == 1 .and. none_(1) == 31104)
    call check('II: control, a registration that keeps the side: no pair shares a record; both recovered 2592 times', &
         nsame(2) == 0 .and. best(2) == 2 .and. nboth(2) == 2592)
  end subroutine both_partners

  ! III . the two definitions of least erasure against the value, the record's definition by search over every world
  subroutine two_definitions()
    integer :: m, mp, k, d, t, bad, badc
    logical :: val, ler, ext
    bad = 0; badc = 0
    do m = 0, 511
      val = .true.; ler = .true.
      do k = 0, 8
        if (btest(m, k)) then
          d = mod(k, 3) - 1; t = k / 3
          if (any(foldg(0, [d, t]) /= [d, t])) val = .false.
          if (any(regg(0, [d, t]) /= [d, t])) ler = .false.
        end if
      end do
      ext = .true.
      if (hasoff(m)) then
        do mp = 0, 511
          if (recof(mp) == recof(m) .and. .not. hasoff(mp)) ext = .false.
        end do
      end if
      if ((ext .neqv. val) .or. (ler .neqv. val)) bad = bad + 1
      if (iand(m, 146) == 0) then
        ext = .true.
        if (hasoff(m)) then
          do mp = 0, 511
            if (iand(mp, 146) == 0 .and. recof(mp) == recof(m) .and. .not. hasoff(mp)) ext = .false.
          end do
        end if
        if (ext .neqv. val) badc = badc + 1
      end if
    end do
    call check('III: the two definitions of least erasure and the value agree on all 512 worlds, by search', bad == 0)
    call check('III: control, the line removed from the universe: the record''s definition fails on 63 worlds', &
         badc == 63)
  end subroutine two_definitions

  ! IV . the stream: the value of a listed world is its bits; no shorter stretch decides
  subroutine digits(a, z)
    integer, intent(in) :: a
    integer, intent(out) :: z(0:5)
    integer :: n, k
    k = a
    do n = 0, 5
      z(n) = mod(k, 3) - 1; k = k / 3
    end do
  end subroutine digits
  logical function setvalue(z)
    integer, intent(in) :: z(0:5)
    logical :: inset(-1:1, 0:5)
    integer :: n, d
    inset = .false.
    do n = 0, 5
      inset(z(n), n) = .true.
    end do
    setvalue = .true.
    do n = 0, 5
      do d = -1, 1
        if (inset(d, n) .and. d /= 0) setvalue = .false.
      end do
    end do
  end function setvalue
  subroutine stream()
    integer :: a, b, k, n, za(0:5), zb(0:5), nbad
    logical :: va, vb, bits, found(0:6), agree
    nbad = 0; found = .false.
    do a = 0, 728
      call digits(a, za)
      va = setvalue(za); bits = .true.
      do n = 0, 5
        if (any(foldg(0, [za(n), n]) /= [za(n), n])) bits = .false.
      end do
      if (va .neqv. bits) nbad = nbad + 1
      do b = 0, 728
        call digits(b, zb); vb = setvalue(zb)
        if (va .eqv. vb) cycle
        do k = 0, 6
          agree = .true.
          do n = 0, k - 1
            if (za(n) /= zb(n)) agree = .false.
          end do
          if (agree) found(k) = .true.
        end do
      end do
    end do
    call check('IV: the value of a listed world is its bit-stream, on all 729 streams', nbad == 0)
    call check('IV: no stretch shorter than the stream decides, 0 to 5 members; the whole stream does', &
         all(found(0:5)) .and. .not. found(6))
  end subroutine stream

  ! V . the bridge of the charts, beside a shift that is off by one
  subroutine bridge()
    integer :: gr(4), i, n, x, t, p(2), a(2), b(2), fails(0:1), shift
    gr = [1, 2, 6, 10]; fails = 0
    do shift = 0, 1
      do i = 1, 4
        n = gr(i)
        do x = n - 5, n + 5
          do t = 0, 3
            p = [x, t]
            a = foldg(n, p); b = regg(n, p)
            if (any([a(1) - n + shift, a(2)] /= foldg(0, [x - n + shift, t])) .or. &
                any([b(1) - n + shift, b(2)] /= regg(0, [x - n + shift, t]))) fails(shift) = fails(shift) + 1
          end do
        end do
      end do
    end do
    call check('V: at grains 1, 2, 6 and 10 the shift by n carries fold and registration onto the offset chart', &
         fails(0) == 0)
    call check('V: control, a shift off by one: the conjugation fails at all 176 points', fails(1) == 176)
  end subroutine bridge

  ! VI . the floor's last digit
  subroutine floor_digit()
    real(qp) :: s, tail, lo, prod
    integer :: k
    s = 0.0_qp
    do k = 1, 60
      s = s + 1.0_qp / (real(k, qp) * 2.0_qp**k)
    end do
    tail = 1.0_qp / (60.0_qp * 2.0_qp**60)
    lo = 6931471805599453.0_qp / 1.0e16_qp
    call check('VI: the sixtieth partial sum lies above 0.6931471805599453 and, with its tail, below ...454', &
         lo < s .and. s + tail < lo + 1.0e-16_qp)
    prod = 1380649.0_qp * 300.0_qp * 6931471805599453.0_qp
    call check('VI: 1380649 x 300 x 6931471805599453 is 2870978885078723755499100, exact at sixteen places', &
         abs(prod - 2870978885078723755499100.0_qp) < 0.5_qp)
  end subroutine floor_digit

  ! VII . the series the kernel defines. First the finite sums of the kernel, in the arithmetic of this twin, held
  ! to the bracket the kernel proves (series_meet_the_twin). Then the inner limits, against the functions of the
  ! machine. Then the zeros, located by Newton iteration from starts off the line with no ordinate supplied; the
  ! tables are read afterwards, as corroboration. The acceleration is Cohen, Rodriguez Villegas, Zagier (2000).
  pure function expn(n, x) result(v)
    integer, intent(in) :: n
    real(qp), intent(in) :: x
    real(qp) :: v, term
    integer :: k
    v = 1.0_qp; term = 1.0_qp
    do k = 1, n
      term = term * x / real(k, qp); v = v + term
    end do
  end function expn
  pure function cosn(n, x) result(v)
    integer, intent(in) :: n
    real(qp), intent(in) :: x
    real(qp) :: v, term
    integer :: k
    v = 1.0_qp; term = 1.0_qp
    do k = 1, n
      term = -term * x * x / (real(2 * k - 1, qp) * real(2 * k, qp)); v = v + term
    end do
  end function cosn
  pure function sinn(n, x) result(v)
    integer, intent(in) :: n
    real(qp), intent(in) :: x
    real(qp) :: v, term
    integer :: k
    v = x; term = x
    do k = 1, n
      term = -term * x * x / (real(2 * k, qp) * real(2 * k + 1, qp)); v = v + term
    end do
  end function sinn
  pure function lnn(n, m) result(v)
    integer, intent(in) :: n, m
    real(qp) :: v, y, p
    integer :: j
    y = real(m - 1, qp) / real(m + 1, qp); p = y; v = y
    do j = 1, n
      p = p * y * y; v = v + p / real(2 * j + 1, qp)
    end do
    v = 2.0_qp * v
  end function lnn
  ! etaRe and etaIm of the kernel: terms m = 1 .. mtop + 1, each at the n-th approximation
  subroutine eta_own(mtop, n, b, tt, re, im)
    integer, intent(in) :: mtop, n
    real(qp), intent(in) :: b, tt
    real(qp), intent(out) :: re, im
    integer :: j
    real(qp) :: l, a, sg
    re = 0.0_qp; im = 0.0_qp; sg = 1.0_qp
    do j = 0, mtop
      l = lnn(n, j + 1); a = expn(n, -(b * l))
      re = re + sg * a * cosn(n, tt * l); im = im - sg * a * sinn(n, tt * l)
      sg = -sg
    end do
  end subroutine eta_own
  ! the same sum with the inner limits taken by the functions of the machine
  subroutine eta_mach(mtop, b, tt, re, im)
    integer, intent(in) :: mtop
    real(qp), intent(in) :: b, tt
    real(qp), intent(out) :: re, im
    integer :: j
    real(qp) :: l, a, sg
    re = 0.0_qp; im = 0.0_qp; sg = 1.0_qp
    do j = 0, mtop
      l = log(real(j + 1, qp)); a = exp(-(b * l))
      re = re + sg * a * cos(tt * l); im = im - sg * a * sin(tt * l)
      sg = -sg
    end do
  end subroutine eta_mach
  ! the alternating series, summed with acceleration; own takes each term from the four series of the kernel at
  ! inner index nin, otherwise from the functions of the machine
  function eta_acc(s, nt, own, nin) result(e)
    complex(qp), intent(in) :: s
    integer, intent(in) :: nt, nin
    logical, intent(in) :: own
    complex(qp) :: e, acc, ak
    real(qp) :: d, b, c, l, a
    integer :: k
    real(qp), save :: lntab(64)
    integer, save :: ltn = -1
    if (own .and. ltn /= nin) then
      do k = 1, 64
        lntab(k) = lnn(nin, k)
      end do
      ltn = nin
    end if
    d = (3.0_qp + sqrt(8.0_qp))**nt; d = (d + 1.0_qp / d) / 2.0_qp
    b = -1.0_qp; c = -d; acc = cmplx(0.0_qp, 0.0_qp, qp)
    do k = 0, nt - 1
      c = b - c
      if (own) then
        l = lntab(k + 1); a = expn(nin, -(real(s, qp) * l))
        ak = cmplx(a * cosn(nin, aimag(s) * l), -(a * sinn(nin, aimag(s) * l)), qp)
      else
        ak = exp(-s * log(real(k + 1, qp)))
      end if
      acc = acc + c * ak
      b = real(k + nt, qp) * real(k - nt, qp) * b / ((real(k, qp) + 0.5_qp) * real(k + 1, qp))
    end do
    e = acc / d
  end function eta_acc
  function newton(s0, nt, own, nin, h, nit) result(s)
    complex(qp), intent(in) :: s0
    integer, intent(in) :: nt, nin, nit
    logical, intent(in) :: own
    real(qp), intent(in) :: h
    complex(qp) :: s, f, fp
    integer :: it
    s = s0
    do it = 1, nit
      f = eta_acc(s, nt, own, nin)
      fp = (eta_acc(s + h, nt, own, nin) - eta_acc(s - h, nt, own, nin)) / (2.0_qp * h)
      s = s - f / fp
    end do
  end function newton
  subroutine partial(b, tt, mtop, sre, sim)
    real(dp), intent(in) :: b, tt
    integer, intent(in) :: mtop
    real(dp), intent(out) :: sre, sim
    integer :: m
    real(dp) :: lg, a, sg
    sre = 0.0_dp; sim = 0.0_dp; sg = 1.0_dp
    do m = 1, mtop
      lg = log(real(m, dp)); a = exp(-b * lg)
      sre = sre + sg * a * cos(tt * lg); sim = sim - sg * a * sin(tt * lg)
      sg = -sg
    end do
  end subroutine partial
  subroutine zeta_series()
    real(qp), parameter :: lo_re = 0.53180207690295243439_qp, lo_im = 0.22737850912720984721_qp, w = 2.0e-20_qp
    real(qp), parameter :: tab(3) = [14.134725141734693790457251983562_qp, &
         21.022039638771554992628479593897_qp, 25.010857580145688763213790992563_qp]
    real(qp), parameter :: h0(3) = [14.0_qp, 21.0_qp, 25.0_qp]
    complex(qp) :: z(3), zo
    real(qp) :: re, im, re2, im2, rm, imm, dev8, dev60
    real(dp) :: sre, sim, r(3), off, t1
    integer :: mm(3), i
    logical :: ok
    call eta_own(2, 8, 0.5_qp, 2.0_qp, re, im)
    write(*,'(a,f24.20,a,f24.20)') '  the finite sum of the kernel at 1/2 + 2i, three terms, eight inner: ', re, ' ', im
    call check('VII: the kernel and the twin meet: the same finite sum lands inside the bracket at the twentieth ' // &
         'place that the kernel proves', re > lo_re .and. re < lo_re + w .and. im > lo_im .and. im < lo_im + w)
    call eta_own(2, 60, 0.5_qp, 2.0_qp, re2, im2)
    call eta_mach(2, 0.5_qp, 2.0_qp, rm, imm)
    dev8 = max(abs(re - rm), abs(im - imm)); dev60 = max(abs(re2 - rm), abs(im2 - imm))
    write(*,'(a,es9.2,a,es9.2)') '  inner limits, distance from the machine functions at 8 and at 60 inner terms: ', &
         dev8, '  ', dev60
    call check('VII: the inner limits: at sixty inner terms the series of the kernel are the functions of the ' // &
         'machine to twenty-five places', dev60 < 1.0e-25_qp .and. dev8 < 1.0e-4_qp)
    zo = newton(cmplx(0.75_qp, 14.0_qp, qp), 40, .true., 400, 1.0e-6_qp, 12)
    write(*,'(a,f15.12,a,f16.12)') '  first zero by the four series of the kernel alone, from 3/4 + 14i: ', &
         real(zo, qp), ' + i ', aimag(zo)
    call check('VII: the first zero, located from off the line by the four series of the kernel alone: real part ' // &
         'one half to nine places', abs(real(zo, qp) - 0.5_qp) < 1.0e-9_qp .and. &
         abs(eta_acc(zo, 40, .true., 400)) < 1.0e-9_qp)
    ok = .true.
    do i = 1, 3
      z(i) = newton(cmplx(0.75_qp, h0(i), qp), 60, .false., 0, 1.0e-15_qp, 20)
      write(*,'(a,i0,a,i0,a,f28.25,a,f29.25)') '  zero ', i, ', from 3/4 + ', nint(h0(i)), 'i: ', real(z(i), qp), &
           ' + i ', aimag(z(i))
      if (abs(real(z(i), qp) - 0.5_qp) >= 1.0e-24_qp) ok = .false.
    end do
    call check('VII: three zeros located from starts off the line, no ordinate supplied: each real part one half ' // &
         'to twenty-four places', ok)
    call check('VII: read afterwards, the tables give the same three heights to twelve places', &
         all(abs(aimag(z) - tab) < 1.0e-12_qp))
    t1 = real(aimag(z(1)), dp)
    mm = [10000, 100000, 1000000]; ok = .true.
    do i = 1, 3
      call partial(0.5_dp, t1, mm(i), sre, sim)
      r(i) = sqrt(sre * sre + sim * sim) * sqrt(real(mm(i), dp))
      if (r(i) <= 0.45_dp .or. r(i) >= 0.55_dp) ok = .false.
    end do
    write(*,'(a,3f9.5)') '  at the located zero, |S_M| root M at M = 10^4, 10^5, 10^6: ', r
    call check('VII: at the located zero the plain partial sums fall to zero as one half over the root of M', ok)
    call partial(0.75_dp, t1, 1000000, sre, sim)
    off = sqrt(sre * sre + sim * sim)
    write(*,'(a,f9.5)') '  at 3/4, the same height, |S_M| at M = 10^6: ', off
    call check('VII: control, the same height off the line: the partial sums stay away from zero', off > 0.05_dp)
  end subroutine zeta_series
end program universal_seat_twin
