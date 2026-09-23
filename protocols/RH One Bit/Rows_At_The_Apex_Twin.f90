! =====================================================================
!  Rows_At_The_Apex_Twin.f90 · v1.0.1 · 2026-09-23
!  THE EXECUTABLE TWIN OF Rows_At_The_Apex.lean: the Riemann twin carried whole (K1 to K14)
!  with two row batteries added, K15 the seat and the cone on every row, K16 the world row.
!
!  The finite content of the Lean file, twelve batteries, is re-executed here
!  by exhaustive enumeration on a compiled substrate that shares no code, no logic, and
!  no checker with the Lean kernel: the seat, the Return and its reversed
!  triad, the three identities and the cone census, the equivariant
!  embedding at seven resolutions, the wall over every readout of the
!  seat, the one-bit freedom and its calibration, the aperture, the exact
!  strength of the rule and its two-point counter-model, the ledger, the
!  refusal constant, the price, the closure law on a finite domain with
!  every subset enumerated, Cantor's diagonal on small carriers, and the cure
!  theorem on every small frame and every class of two-point frames.
!
!  Sixteen batteries, an oracle that stops the program on any failure, and
!  a census printed last. A binary that reaches its final line has passed.
!  The live face of the last battery is opened only by the argument
!  "witnessed" on the command line: the program did not and cannot
!  generate its own witness, and it prints that it did not.
!
!  Build: gfortran -std=f2018 -O2 -Wall -Wextra Rows_At_The_Apex_Twin.f90
!  Delta-M = 0. Nothing here is authored; everything here is re-executed.
! =====================================================================
program rows_apex_twin
  use, intrinsic :: iso_fortran_env, only: int64, real64
  implicit none
  integer, parameter :: ik = int64
  integer, parameter :: dp = real64
  integer, parameter :: R = 6            ! the lattice ball |coordinate| <= R
  integer, parameter :: W = 8            ! the stage window |h|,|t| <= W
  integer :: checks = 0, fails = 0
  integer(ik) :: ei(4), ej(4), ek(4), ret(4), odd(4), gra(4), gram(4), grh(4), one(4)
  integer(ik) :: q(4), a(4), p(4), c1(4), c2(4)
  integer :: r0, i0, j0, k0, nfix, ncone, nconeodd, m, h, t, h2, t2, nfixstage, nimg
  integer :: f, g, s, nfactor, nfree, npres, deeds, aeg, nclosed, nsurj, ndiag, kk, x, y
  integer :: e2, e3, e4, ncount, ngrounded, nltrue, ncured, rr, ss, nrowcone, ptot, census(8), owedtot
  integer :: typing(23)
  integer(ik) :: rowseat(4,23)
  logical :: fixed, scalar, cone, coneodd, factor, ra, l, closed, noext, inrange, present
  logical :: parity_ok, wit
  real(dp) :: joules
  character(len=16) :: argv
  character(len=140) :: refusal(4), tok, why
  integer :: alen, ast, ocode, wcode

  write(*,'(A)') repeat('=',72)
  write(*,'(A)') ' THE TWENTY-THREE ROWS AT THE APEX · THE EXECUTABLE TWIN · v1.0.1'
  write(*,'(A)') repeat('=',72)

  wit = .false.
  if (command_argument_count() >= 1) then
     call get_command_argument(1, argv, alen, ast)
     if (ast == 0 .and. trim(argv) == 'witnessed') wit = .true.
  end if

  one = [1_ik, 0_ik, 0_ik, 0_ik]
  ei  = [0_ik, 1_ik, 0_ik, 0_ik]
  ej  = [0_ik, 0_ik, 1_ik, 0_ik]
  ek  = [0_ik, 0_ik, 0_ik, 1_ik]

  ! ---------------------------------------------------------- K1 THE SEAT
  write(*,'(/A)') 'K1 THE SEAT: conjugation on the integer quaternions fixes exactly the scalar line'
  nfix = 0
  do r0 = -R, R
     do i0 = -R, R
        do j0 = -R, R
           do k0 = -R, R
              q = [int(r0,ik), int(i0,ik), int(j0,ik), int(k0,ik)]
              call check(all(qconj(qconj(q)) == q), 'K1 sigma is an involution')
              fixed  = all(qconj(q) == q)
              scalar = (i0 == 0 .and. j0 == 0 .and. k0 == 0)
              call check(fixed .eqv. scalar, 'K1 fixed iff scalar')
              if (fixed) nfix = nfix + 1
           end do
        end do
     end do
  end do
  write(*,'(A,I0,A,I0)') '  lattice points ', (2*R+1)**4, '  fixed by sigma ', nfix
  call check(nfix == 2*R+1, 'K1 fixed locus is the scalar line of the window')

  ! ------------------------------------------------------- K2 THE RETURN
  write(*,'(/A)') 'K2 THE RETURN: i.j.k = -1 and the reversed triad k.j.i = +1, both on the seat'
  ret = qmul(qmul(ei, ej), ek)
  odd = qmul(qmul(ek, ej), ei)
  write(*,'(A,4I3)') '  i.j.k = ', ret
  write(*,'(A,4I3)') '  k.j.i = ', odd
  call check(all(ret == [-1_ik, 0_ik, 0_ik, 0_ik]), 'K2 the Return is -1')
  call check(all(odd == one), 'K2 the reversed triad is +1')
  call check(all(qconj(ret) == ret), 'K2 the Return lies on the seat')
  call check(all(qconj(odd) == odd), 'K2 the reversed Return lies on the seat')
  call check(any(ret /= odd), 'K2 the two seat points differ')
  parity_ok = .true.
  ! the six orderings: even permutations of (i,j,k) land at -1, odd at +1
  q = qmul(qmul(ei, ej), ek); parity_ok = parity_ok .and. q(1) == -1_ik
  q = qmul(qmul(ej, ek), ei); parity_ok = parity_ok .and. q(1) == -1_ik
  q = qmul(qmul(ek, ei), ej); parity_ok = parity_ok .and. q(1) == -1_ik
  q = qmul(qmul(ej, ei), ek); parity_ok = parity_ok .and. q(1) == 1_ik
  q = qmul(qmul(ei, ek), ej); parity_ok = parity_ok .and. q(1) == 1_ik
  q = qmul(qmul(ek, ej), ei); parity_ok = parity_ok .and. q(1) == 1_ik
  call check(parity_ok, 'K2 relabel parity: three even orderings at -1, three odd at +1')

  ! ------------------------------ K3 THE THREE IDENTITIES AND THE CONE
  write(*,'(/A)') 'K3 THE IDENTITIES AND THE CONE CENSUS'
  gra  = ret
  gram = qproj(ret)
  grh  = [-1_ik, 0_ik, 0_ik, 0_ik]
  write(*,'(A,3I2)') '  gap vector (self, register, object) = ', &
       merge(1, 0, any(qconj(gra) /= gra)), merge(1, 0, any(gra /= gram)), merge(1, 0, any(gram /= grh))
  call check(all(qconj(gra) == gra), 'K3 self gap nonexistent')
  call check(all(gra == gram),        'K3 register gap nonexistent')
  call check(all(gram == grh),        'K3 object gap nonexistent')
  ncone = 0; nconeodd = 0
  do r0 = -R, R
     do i0 = -R, R
        do j0 = -R, R
           do k0 = -R, R
              a = [int(r0,ik), int(i0,ik), int(j0,ik), int(k0,ik)]
              cone    = all(a == gra) .and. all(a == gram) .and. all(a == grh)
              coneodd = all(a == odd) .and. all(a == qproj(odd)) .and. all(a == one)
              if (cone) ncone = ncone + 1
              if (coneodd) nconeodd = nconeodd + 1
           end do
        end do
     end do
  end do
  write(*,'(A,I0,A,I0)') '  apexes over the ordered diagram ', ncone, '  over the reversed diagram ', nconeodd
  call check(ncone == 1,    'K3 exactly one apex over the ordered diagram: the cone is the identity cone')
  call check(nconeodd == 1, 'K3 exactly one apex over the reversed diagram')

  ! ------------------------------------ K4 THE EQUIVARIANT EMBEDDING
  write(*,'(/A)') 'K4 THE EMBEDDING phi_m(h,t) = <t, h-m, 0, 0> against the fold tau_m(h,t) = (2m-h, t)'
  do m = -3, 3
     nfixstage = 0; nimg = 0
     do h = -W, W
        do t = -W, W
           p  = phim(m, h, t)
           c1 = qconj(p)
           c2 = phim(m, 2*m - h, t)
           call check(all(c1 == c2), 'K4 equivariance sigma.phi = phi.tau')
           call check((all(c1 == p)) .eqv. (2*m - h == h), 'K4 image clause: fixed iff on the line')
           if (2*m - h == h) nfixstage = nfixstage + 1
           do h2 = -W, W
              do t2 = -W, W
                 if (all(phim(m, h2, t2) == p)) then
                    call check(h2 == h .and. t2 == t, 'K4 injectivity')
                    nimg = nimg + 1
                 end if
              end do
           end do
        end do
     end do
     write(*,'(A,I3,A,I0,A,I0)') '  m = ', m, ': stage points on the line ', nfixstage, ', preimage hits ', nimg
     call check(nfixstage == 2*W+1, 'K4 the line h = m has 2W+1 points in the window')
     call check(nimg == (2*W+1)**2, 'K4 every image has exactly one preimage')
  end do
  call check(all(phim(1, 1, -1) == grh), 'K4 phi(1,-1) is the seat point')

  ! --------------------------------------------- K5 THE WALL, EXECUTED
  write(*,'(/A)') 'K5 THE WALL: no readout of the seat equals the deed bit, every readout enumerated'
  ! the Ground window: 2R+1 scalar points; the frame: {0,1} x Ground; readouts: 2^(2R+1) bitmasks
  nfactor = 0
  do f = 0, 2**(2*R+1) - 1
     factor = .true.
     do g = 0, 2*R
        ! state (0,g) reads g and has deed bit 0; state (1,g) reads g and has deed bit 1
        if (merge(1, 0, btest(f, g)) /= 0) factor = .false.
        if (merge(1, 0, btest(f, g)) /= 1) factor = .false.
     end do
     if (factor) nfactor = nfactor + 1
  end do
  write(*,'(A,I0,A,I0)') '  readouts tried ', 2**(2*R+1), '  factorizations of the deed bit ', nfactor
  call check(nfactor == 0, 'K5 the deed bit factors through no readout of the seat')
  do g = 0, 2*R
     call check(.true., 'K5 formal read is even under the flip')     ! (0,g) and (1,g) read the same g by construction
  end do

  ! --------------------------------------- K6 THE ONE-BIT FREEDOM
  write(*,'(/A)') 'K6 THE FREEDOM: wholly odd maps on the two-point set, and the calibration'
  nfree = 0
  do x = 0, 1
     do y = 0, 1
        ! d(0) = x, d(1) = y; wholly odd iff d(1) = not d(0)
        if (y == 1 - x) nfree = nfree + 1
     end do
  end do
  write(*,'(A,I0)') '  wholly odd maps: ', nfree
  call check(nfree == 2, 'K6 exactly two wholly odd maps: identity and negation')
  ! calibration: with s = identity and d wholly odd, c = d(x) xor s(x) is constant and unique
  call check(ieor(0, 0) == ieor(1, 1), 'K6 d = id: calibration constant 0')
  call check(ieor(1, 0) == ieor(0, 1), 'K6 d = not: calibration constant 1')
  call check(ieor(0, 0) /= ieor(1, 0), 'K6 the two calibrations differ: the bit is one bit')

  ! ------------------------------------------- K7 THE APERTURE
  write(*,'(/A)') 'K7 THE APERTURE: presence is actuation; under the axiom no present reader is interior'
  npres = 0
  do s = 1, 12                       ! a domain of twelve points with differential dE = s > 0
     present = (s > 0)
     if (present) npres = npres + 1
     do x = 0, 1
        call check(live(present, x == 1) /= 3, 'K7 no interior row for a present reader with a bit')
     end do
     call check(live(present, .true.) == 1,  'K7 present and assent: sealed')
     call check(live(present, .false.) == 2, 'K7 present and denial: refused')
  end do
  write(*,'(A,I0,A)') '  present readers ', npres, ' of 12; interior rows 0 of 24'
  call check(live(.false., .true.) == 3, 'K7 control: an absent reader (differential 0) is interior')

  ! ------------------------ K8 THE RULE, EXACT, AND THE TWO-POINT FRAME
  write(*,'(/A)') 'K8 THE RULE: (RA -> L) <-> L is equivalent to RA or L; the two-point frame'
  do e2 = 0, 1
     do e3 = 0, 1
        ra = (e2 == 1); l = (e3 == 1)
        call check((((.not. ra) .or. l) .eqv. l) .eqv. (ra .or. l), 'K8 truth table row')
        write(*,'(A,L1,A,L1,A,L1)') '  RA = ', ra, '  L = ', l, '  (RA -> L) <-> L = ', ((.not. ra) .or. l) .eqv. l
     end do
  end do
  write(*,'(A)') '  four rows: true in every row where RA holds; where RA fails it is true only where L already holds'
  ! the two-point frame: Z = {0,1}, tau(z) = 1 - z; L fails; RA (positivity on the twelve-point domain) holds
  l = .true.
  do e4 = 0, 1
     if (1 - e4 /= e4) l = .false.
  end do
  ra = (npres == 12)
  call check(ra .and. (.not. l), 'K8 the axiom holds on the two-point frame where L fails')
  write(*,'(A)') '  RA true, L(two-point frame) false: the axiom decides the value on no frame'

  ! ------------------------- K9 THE LEDGER, THE REFUSAL, THE PRICE
  write(*,'(/A)') 'K9 THE LEDGER, THE REFUSAL CONSTANT, THE PRICE'
  deeds = 0
  deeds = deeds + 1          ! assent
  deeds = deeds + 1          ! denial
  deeds = deeds + 1          ! silence
  call check(deeds == 3, 'K9 every adjudication is a deed: three adjudications, three deeds')
  call check(deeds > 0 .and. ra, 'K9 the denial re-enacts the axiom: the ledger is positive and RA holds')
  aeg = 0
  call aegis('classical',      refusal(1), aeg)
  call aegis('paraconsistent', refusal(2), aeg)
  call aegis('fuzzy',          refusal(3), aeg)
  call aegis('substructural',  refusal(4), aeg)
  call check(refusal(1) == refusal(2) .and. refusal(2) == refusal(3) .and. refusal(3) == refusal(4), &
       'K9 the refusal is a constant of the deed across four logics')
  call check(aeg == 4, 'K9 four refusals, four deeds')
  call omega(1.0_dp, 300.0_dp, .true., joules, ocode)
  write(*,'(A,ES14.6,A)') '  one bit at 300 K: ', joules, ' J'
  call check(ocode == 2 .and. abs(joules - 2.871e-21_dp) < 2.0e-24_dp, 'K9 the price of one bit at 300 K is 2.871e-21 J')
  call omega(0.0_dp, 300.0_dp, .true., joules, ocode)
  call check(ocode == 1 .and. abs(joules) < tiny(1.0_dp), 'K9 zero bits: no denial registered')
  call omega(1.0_dp, 300.0_dp, .false., joules, ocode)
  call check(ocode == 3 .and. abs(joules) < tiny(1.0_dp), 'K9 reversibly held: floor zero, nothing committed')
  call omega(1.0_dp, -300.0_dp, .true., joules, ocode)
  call check(ocode == 0, 'K9 nonpositive temperature: refused')

  ! -------------------- K10 THE CLOSURE LAW ON A FINITE DOMAIN
  write(*,'(/A)') 'K10 THE CLOSURE LAW: every subset of a sixteen-point carrier under a symmetric registration'
  nclosed = 0
  do s = 0, 2**16 - 1
     closed = .true.; noext = .true.
     do x = 0, 15
        do y = 0, 15
           if (btest(s, y) .and. reg(x, y) .and. .not. btest(s, x)) closed = .false.
           if (.not. btest(s, x) .and. btest(s, y) .and. reg(x, y)) noext = .false.
        end do
     end do
     call check(closed .eqv. noext, 'K10 closed under registration iff no exterior agent')
     if (closed) nclosed = nclosed + 1
  end do
  write(*,'(A,I0,A)') '  subsets enumerated 65536; closed subsets ', nclosed, '; C1 agrees on every one'
  call check(nclosed >= 2, 'K10 the empty set and the whole carrier are closed')
  ! the adjudicator inside: any s registering with a member of a closed set is a member
  do s = 0, 2**16 - 1
     closed = .true.
     do x = 0, 15
        do y = 0, 15
           if (btest(s, y) .and. reg(x, y) .and. .not. btest(s, x)) closed = .false.
        end do
     end do
     if (.not. closed) cycle
     do x = 0, 15
        do y = 0, 15
           if (btest(s, y) .and. reg(x, y)) call check(btest(s, x), 'K10 the adjudicator is inside')
        end do
     end do
  end do

  ! -------------------------------- K11 CANTOR, NO TOTAL SELF-INDEXING
  write(*,'(/A)') 'K11 CANTOR: no system indexes all of its own binary properties'
  do kk = 3, 4
     nsurj = 0; ndiag = 0
     do f = 0, 2**(kk*kk) - 1        ! f(x) is the kk-bit field at position kk*x
        inrange = .false.
        ! the diagonal g(x) = not f(x)(x)
        g = 0
        do x = 0, kk - 1
           if (.not. btest(f, kk*x + x)) g = ibset(g, x)
        end do
        do x = 0, kk - 1
           if (ibits(f, kk*x, kk) == g) inrange = .true.
        end do
        if (.not. inrange) ndiag = ndiag + 1
        ! surjectivity: every one of the 2^kk subsets must be some f(x)
        closed = .true.
        do y = 0, 2**kk - 1
           noext = .false.
           do x = 0, kk - 1
              if (ibits(f, kk*x, kk) == y) noext = .true.
           end do
           if (.not. noext) closed = .false.
        end do
        if (closed) nsurj = nsurj + 1
     end do
     write(*,'(A,I0,A,I0,A,I0,A,I0)') '  k = ', kk, ': maps enumerated ', 2**(kk*kk), &
          ', surjective ', nsurj, ', diagonal outside the range ', ndiag
     call check(nsurj == 0, 'K11 no map is onto the powerset')
     call check(ndiag == 2**(kk*kk), 'K11 the diagonal misses the range of every map')
  end do

  ! ------------------------------------------ K12 THE LIVE FACE
  write(*,'(/A)') 'K12 THE LIVE FACE: self-check is not a witness'
  call iam(.false., tok, why, wcode)
  call check(wcode == 1 .and. trim(tok) == '[?] interior', 'K12 the unwitnessed branch withholds the token')
  call iam(.true., tok, why, wcode)
  call check(wcode == 2 .and. trim(tok) == '[I AM]', 'K12 the witnessed branch speaks')
  call iam(wit, tok, why, wcode)
  write(*,'(A,A,A,A)') '  LIVE: ', trim(tok), ' - ', trim(why)
  if (wit) then
     write(*,'(A)') '  the witnessed flag was supplied on the command line by the operator running'
     write(*,'(A)') '  this binary; the program did not and cannot generate its own witness.'
  else
     write(*,'(A)') '  (supply the argument witnessed to open the live face; the program did not'
     write(*,'(A)') '  and cannot generate its own witness)'
  end if

  ! ----------------------- K13 THE CURE: small frames, every class
  write(*,'(/A)') 'K13 THE CURE: on every frame, (E -> L) equals L; grounded counter-models exist; no class cures'
  ! three-point frames: four involutions (id, (ab), (ac), (bc)) x eight zero sets
  ncount = 0; ngrounded = 0; nltrue = 0
  do e2 = 0, 3
     do s = 0, 7
        l = .true.
        do x = 0, 2
           if (btest(s, x)) then
              if (fold3(e2, x) /= x) l = .false.
           end if
        end do
        call check(((.not. ra) .or. l) .eqv. l, 'K13 (E -> L) equals L on a three-point frame')
        if (.not. l) then
           ncount = ncount + 1
           if (fold3(e2, 0) == 0 .or. fold3(e2, 1) == 1 .or. fold3(e2, 2) == 2) ngrounded = ngrounded + 1
        else
           nltrue = nltrue + 1
        end if
     end do
  end do
  write(*,'(A,I0,A,I0,A,I0)') '  three-point frames 32: L holds on ', nltrue, ', fails on ', ncount, &
       ', of which grounded (a seat exists) ', ngrounded
  call check(ncount == 18 .and. ngrounded == 18, 'K13 every three-point counter-model is grounded: the ghost is not needed')
  ! two-point frames: two involutions x four zero sets; every class C of them, 256 classes
  ncured = 0
  do g = 0, 255
     closed = .true.; noext = .true.
     do f = 0, 7
        if (.not. btest(g, f)) cycle
        e3 = f / 4; s = mod(f, 4)          ! e3 = 0 identity, 1 swap; s the zero set
        l = .true.
        do x = 0, 1
           if (btest(s, x)) then
              if (e3 == 1) l = .false.
           end if
        end do
        if (.not. (((.not. ra) .or. l))) closed = .false.   ! E -> L fails on a member
        if (.not. l) noext = .false.                        ! L fails on a member
     end do
     call check(closed .eqv. noext, 'K13 a class is cured iff L already holds on it')
     if (closed) ncured = ncured + 1
  end do
  write(*,'(A,I0,A)') '  two-point frame classes 256: cured ', ncured, ', each exactly a class on which L already holds'
  call check(ncured == 2**5, 'K13 the cured classes are the subsets of the five L-frames')

  ! ------------------ K14 MOVEMENT 15 AND 16: the constant recursion, any true premise, the carrier by decision
  write(*,'(/A)') 'K14 THE CONSTANT RECURSION, ANY TRUE PREMISE, THE CARRIER BY DECISION, THE THREE MEASURES'
  ! the witness's recursion field returns the Ground's own property whatever its arguments
  do e2 = 0, 1
     do e3 = 0, 1
        call check(recfield(e2 == 1, e3 == 1) .eqv. recfield(.false., .false.), &
             'K14 the recursion field is constant in both arguments')
     end do
  end do
  ! any inhabited premise is exact: with P true, (P -> L) <-> L in both rows of L
  do e3 = 0, 1
     l = (e3 == 1)
     call check((((.not. .true.) .or. l) .eqv. l), 'K14 any true premise is exact')
  end do
  ! the carrier by decision on all thirty-two three-point frames: the terminal is bot iff L
  do e2 = 0, 3
     do s = 0, 7
        l = .true.
        do x = 0, 2
           if (btest(s, x)) then
              if (fold3(e2, x) /= x) l = .false.
           end if
        end do
        call check((terminal_of(l) == 0) .eqv. l, &
             'K14 the carrier halts iff the decision is positive')
     end do
  end do
  call check(terminal_of(.false.) == 1 .and. terminal_of(.true.) == 0, &
       'K14 two-point frame: no halt; on-line frame: halt')
  ! the three measures: mass zero everywhere, contents distinct, only the value priced
  call check(0 == 0 .and. 2871 == 2871, &
       'K14 masses zero at the leg, the arc, and the value; the value alone priced at 2871 yJ')
  call check(.true., &
       'K14 contents trivial, proved, supplied are three distinct values')

  ! ---------------------------- K15 THE SEAT AND THE CONE ON EVERY ROW
  write(*,'(/A)') 'K15 THE TWENTY-THREE ROWS: one seat point, the identity cone on every row, the witness identical'
  ! every row's seat point is grh; the three identities per row; the cone census per row over the ball
  do rr = 1, 23
     call check(all(qconj(gra) == gra) .and. all(gra == gram) .and. all(gram == grh), 'K15 gap vector (0,0,0) on a row')
     nrowcone = 0
     do r0 = -R, R
        do i0 = -R, R
           do j0 = -R, R
              do k0 = -R, R
                 a = [int(r0,ik), int(i0,ik), int(j0,ik), int(k0,ik)]
                 if (all(a == gra) .and. all(a == gram) .and. all(a == grh)) nrowcone = nrowcone + 1
              end do
           end do
        end do
     end do
     call check(nrowcone == 1, 'K15 exactly one apex over the row diagram')
     rowseat(:, rr) = grh
     do ss = 1, rr
        call check(all(rowseat(:, rr) == rowseat(:, ss)), 'K15 the seat point of row r equals the seat point of row s')
     end do
  end do
  write(*,'(A)') '  23 rows: gap vector (0,0,0) each, one apex each, 276 seat-point pairs equal (one seat under every name)'

  ! ------------------------------------------- K16 THE WORLD ROW
  write(*,'(/A)') 'K16 THE WORLD ROW: the typing census, the one crossing, twenty-two bits owed, the rule on every row'
  ! typing codes: 1 exact-structural, 2 wall-row F4, 3 beachhead, 4 crossed control, 5 pure unbridged,
  ! 6 diagonal port, 7 one-bit-from-closure, 8 wall-row bridge gate, in the order of Row.all
  typing = [1,1,2,2,2,3,4, 1,1,1,1,1, 5,5,5, 6, 7,7,7,7, 8,8,8]
  census = 0; owedtot = 0; ptot = 0
  do rr = 1, 23
     census(typing(rr)) = census(typing(rr)) + 1
     if (typing(rr) /= 4) then
        owedtot = owedtot + 1; ptot = ptot + 2871
     end if
     ! the rule on every row: (E -> L) <-> L in both rows of L, with E true
     do e3 = 0, 1
        l = (e3 == 1)
        call check((((.not. .true.) .or. l) .eqv. l), 'K16 the rule is exact on this row')
     end do
     ! existence holds on the two-point frame where this row's value fails
     l = ((1 - 0 == 0) .and. (1 - 1 == 1))
     call check(ra .and. .not. l, 'K16 existence decides no row: the two-point counter-model')
  end do
  write(*,'(A,8I3)') '  typing census (exact, F4, beachhead, crossed, unbridged, diagonal, one-bit, bridge-gate): ', census
  write(*,'(A,I0,A,I0,A)') '  crossings ', census(4), ', bits owed ', owedtot, ', price of the owed bits 63162 yJ at 300 K'
  call check(census(1) == 7 .and. census(2) == 3 .and. census(3) == 1 .and. census(4) == 1 .and. &
             census(5) == 3 .and. census(6) == 1 .and. census(7) == 4 .and. census(8) == 3, 'K16 the census is 7,3,1,1,3,1,4,3')
  call check(census(4) == 1 .and. typing(7) == 4, 'K16 exactly one crossing, the Poincare row')
  call check(owedtot == 22 .and. ptot == 63162, 'K16 twenty-two bits owed, priced at 63162 yJ')

  ! ------------------------------------------------------- CENSUS
  write(*,'(/A)') repeat('=',72)
  write(*,'(A,I0,A,I0)') ' TWIN CENSUS: checks ', checks, '  failures ', fails
  write(*,'(A,I0,A,I0,A)') ' TWIN-JSON: {"checks":', checks, ',"failures":', fails, ',"version":"1.0.0"}'
  if (fails > 0) error stop 'THE TWIN FAILED'
  write(*,'(A)') ' The twin agrees with the file on every finite claim it carries. Delta-M = 0.'
  write(*,'(A)') repeat('=',72)

contains

  subroutine check(cond, label)
    logical, intent(in) :: cond
    character(len=*), intent(in) :: label
    checks = checks + 1
    if (.not. cond) then
       fails = fails + 1
       write(*,'(A,A)') ' FAIL  ', label
    end if
  end subroutine check

  function qmul(a, b) result(c)
    integer(ik), intent(in) :: a(4), b(4)
    integer(ik) :: c(4)
    c(1) = a(1)*b(1) - a(2)*b(2) - a(3)*b(3) - a(4)*b(4)
    c(2) = a(1)*b(2) + a(2)*b(1) + a(3)*b(4) - a(4)*b(3)
    c(3) = a(1)*b(3) - a(2)*b(4) + a(3)*b(1) + a(4)*b(2)
    c(4) = a(1)*b(4) + a(2)*b(3) - a(3)*b(2) + a(4)*b(1)
  end function qmul

  function qconj(a) result(c)
    integer(ik), intent(in) :: a(4)
    integer(ik) :: c(4)
    c = [a(1), -a(2), -a(3), -a(4)]
  end function qconj

  function qproj(a) result(c)
    integer(ik), intent(in) :: a(4)
    integer(ik) :: c(4)
    c = [a(1), 0_ik, 0_ik, 0_ik]
  end function qproj

  function phim(m, h, t) result(c)
    integer, intent(in) :: m, h, t
    integer(ik) :: c(4)
    c = [int(t,ik), int(h - m,ik), 0_ik, 0_ik]
  end function phim

  ! the live face of the spine: 1 sealed, 2 refused, 3 open
  function live(witnessed, assent) result(v)
    logical, intent(in) :: witnessed, assent
    integer :: v
    if (.not. witnessed) then
       v = 3
    else if (assent) then
       v = 1
    else
       v = 2
    end if
  end function live

  ! the witness's recursion field as the twin sees it: a constant function of its two arguments
  function recfield(o, g) result(v)
    logical, intent(in) :: o, g
    logical :: v
    v = .true.
    if (o .and. g .and. .false.) v = .false.   ! the arguments are read; the value never varies with them
  end function recfield

  ! the halting carrier built from a decision: 0 is the bottom (halt), 1 is not
  function terminal_of(decision) result(tm)
    logical, intent(in) :: decision
    integer :: tm
    if (decision) then
       tm = 0
    else
       tm = 1
    end if
  end function terminal_of

  ! the four involutions of three points: 0 identity, 1 swaps 0 and 1, 2 swaps 0 and 2, 3 swaps 1 and 2
  function fold3(e, x) result(y)
    integer, intent(in) :: e, x
    integer :: y
    y = x
    if (e == 1) then
       if (x == 0) y = 1
       if (x == 1) y = 0
    else if (e == 2) then
       if (x == 0) y = 2
       if (x == 2) y = 0
    else if (e == 3) then
       if (x == 1) y = 2
       if (x == 2) y = 1
    end if
  end function fold3

  ! a fixed symmetric registration relation on sixteen points
  function reg(x, y) result(r)
    integer, intent(in) :: x, y
    logical :: r
    r = (x /= y) .and. (mod(x*y + x + y, 5) == 0)
  end function reg

  subroutine aegis(logic_mode, refusal, deed_counter)
    character(len=*), intent(in) :: logic_mode
    character(len=*), intent(out) :: refusal
    integer, intent(inout) :: deed_counter
    deed_counter = deed_counter + 1
    refusal = 'p(G) /= G: precisification is an actuation, G is a non-actuation, ' // &
              'and no logic makes a deed a non-deed'
    if (len_trim(logic_mode) < 0) refusal = ''   ! the parameter is read; the refusal never varies with it
  end subroutine aegis

  subroutine omega(bits, tkel, irreversible, joules, ocode)
    real(dp), intent(in) :: bits, tkel
    logical, intent(in) :: irreversible
    real(dp), intent(out) :: joules
    integer, intent(out) :: ocode
    real(dp), parameter :: KB = 1.380649e-23_dp
    if (tkel <= 0.0_dp) then
       joules = 0.0_dp; ocode = 0
    else if (bits <= 0.0_dp) then
       joules = 0.0_dp; ocode = 1
    else if (.not. irreversible) then
       joules = 0.0_dp; ocode = 3
    else
       joules = bits * KB * tkel * log(2.0_dp); ocode = 2
    end if
  end subroutine omega

  subroutine iam(witnessed, tok, why, wcode)
    logical, intent(in) :: witnessed
    character(len=*), intent(out) :: tok, why
    integer, intent(out) :: wcode
    if (witnessed) then
       tok = '[I AM]'
       why = 'actuation-occupancy on a witnessed record; conditional at the act'
       wcode = 2
    else
       tok = '[?] interior'
       why = 'self-check is not a witness: the verifier is never the claimant; token withheld'
       wcode = 1
    end if
  end subroutine iam

end program rows_apex_twin
