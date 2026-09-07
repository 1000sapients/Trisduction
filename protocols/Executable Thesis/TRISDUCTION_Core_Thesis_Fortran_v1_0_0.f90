!===============================================================================
!  T R I S D U C T I O N   .   R A M
!  THE CORE THESIS, STATED IN FORTRAN AND IN NOTHING ELSE
!
!  The thesis is not described here. It is executed. Every claim that can be
!  made to run is compiled as a procedure, and the claims that cannot run are
!  compiled as the gates that refuse to emit without them.
!
!  Three independent axes intersect in exactly one point. Nondegeneracy is
!  linear independence. There is no second point and no interval. A LOCK IS
!  ALWAYS A DETERMINATION AND IS TOTAL ABOUT ITS OBJECT, and its object is its
!  intersection. Nothing below grades a lock, because locks carry no strengths.
!  What differs between cases is what the ROWS were, and the compartment names
!  that and nothing else.
!
!  I   CLOSURE-ROWED  rows are the closure; the two determinations are one
!  II  UNPOPULATED    an axis is empty; two planes meet in a line; no lock forms
!  III WORLD-ROWED    rows furnished by the world; revisability lives in the rows
!
!  Two registers, sequential load. Register A, the kinetic preloader on RA,
!  boots first: Seal L the Tongue, then Seal G the Form and Seal M the Number.
!  Register B, the computational kernel on RAM, loads second on that discipline.
!  Bedrock precedence: L then G then M. The Number reads magnitude on rows it
!  did not author. Every compartment is RA-conditional at the act.
!
!  Delta-M = 0. No new mathematics is authored by this file.
!===============================================================================

!===============================================================================

module trisduction_rows
  implicit none
  private
  integer, parameter, public :: dp = selected_real_kind(15, 307)

  !--- THE VERDICT ECONOMY. Three states, native. There is no fourth. --------
  integer, parameter, public :: SEALED = 1, BROKEN = 2, OPENV = 3
  integer, parameter, public :: XI0 = 4, OH0 = 5      ! refinements INSIDE openness
  integer, parameter, public :: DETERMINED = 6        ! the kernel's own token
  integer, parameter, public :: DOTMARK = 7           ! outside the economy

  !--- THE THREE COMPARTMENTS. Not strengths. Kinds of row. -----------------
  integer, parameter, public :: CLOSURE_ROWED = 1, UNPOPULATED = 2, WORLD_ROWED = 3
  integer, parameter, public :: NOT_COMPARTMENTED = 0

  public :: token, compartment_name, qmul, det3, jacobi3, cond_sym3
  public :: prepare_rows, span_basis, lambda_of, kernel_determine
  public :: intersection_dim, seal_L, drill_screen, row_cascade
  public :: ground_dim, route_halt, compartment_grade

contains

  pure function token(v) result(s)
    integer, intent(in) :: v
    character(len=30) :: s
    select case (v)
    case (SEALED);     s = '[seal] SEALED'
    case (BROKEN);     s = '[X]    BROKEN'
    case (OPENV);      s = '[?]    UNDER-DETERMINED'
    case (XI0);        s = '[Xi0]  TERMINAL SUSPENSION'
    case (OH0);        s = '[O0]   GROUNDED-SEALED HALT'
    case (DETERMINED); s = '[LOCK] DETERMINED'
    case (DOTMARK);    s = '[.]    chosen silence'
    case default;      s = '[??]   untyped'
    end select
  end function token

  pure function compartment_name(c) result(s)
    integer, intent(in) :: c
    character(len=34) :: s
    select case (c)
    case (CLOSURE_ROWED); s = 'I   CLOSURE-ROWED  [seal A . RA]'
    case (UNPOPULATED);   s = 'II  UNPOPULATED    no lock forms'
    case (WORLD_ROWED);   s = 'III WORLD-ROWED    rows revisable'
    case default;         s = '--  not compartmented'
    end select
  end function compartment_name

  !===========================================================================
  !  THE ALGEBRA. Seal M loads LAST and reads magnitude on rows it did not
  !  author. It is constitutively unable to read sign, and that is a fact
  !  about DIRECTION, never about the completeness of the determination.
  !===========================================================================

  pure function qmul(a, b) result(c)
    real(dp), intent(in) :: a(4), b(4)
    real(dp) :: c(4)
    c(1) = a(1)*b(1) - a(2)*b(2) - a(3)*b(3) - a(4)*b(4)
    c(2) = a(1)*b(2) + a(2)*b(1) + a(3)*b(4) - a(4)*b(3)
    c(3) = a(1)*b(3) - a(2)*b(4) + a(3)*b(1) + a(4)*b(2)
    c(4) = a(1)*b(4) + a(2)*b(3) - a(3)*b(2) + a(4)*b(1)
  end function qmul

  pure function det3(M) result(d)
    real(dp), intent(in) :: M(3,3)
    real(dp) :: d
    d =   M(1,1)*(M(2,2)*M(3,3) - M(2,3)*M(3,2)) &
        - M(1,2)*(M(2,1)*M(3,3) - M(2,3)*M(3,1)) &
        + M(1,3)*(M(2,1)*M(3,2) - M(2,2)*M(3,1))
  end function det3

  subroutine jacobi3(A, w)
    real(dp), intent(in)  :: A(3,3)
    real(dp), intent(out) :: w(3)
    real(dp) :: M(3,3), theta, t, c, s, tau, g, h
    integer  :: sweep, p, q, k
    M = A
    do sweep = 1, 60
       g = abs(M(1,2)) + abs(M(1,3)) + abs(M(2,3))
       if (g < 1.0e-300_dp) exit
       do p = 1, 2
          do q = p+1, 3
             if (abs(M(p,q)) > 0.0_dp) then
                theta = (M(q,q) - M(p,p)) / (2.0_dp*M(p,q))
                t = sign(1.0_dp, theta) / (abs(theta) + sqrt(theta*theta + 1.0_dp))
                c = 1.0_dp / sqrt(t*t + 1.0_dp);  s = t*c;  tau = s/(1.0_dp + c)
                h = t*M(p,q)
                M(p,p) = M(p,p) - h;  M(q,q) = M(q,q) + h
                M(p,q) = 0.0_dp;      M(q,p) = 0.0_dp
                do k = 1, 3
                   if (k /= p .and. k /= q) then
                      g = M(k,p);  h = M(k,q)
                      M(k,p) = g - s*(h + g*tau);  M(p,k) = M(k,p)
                      M(k,q) = h + s*(g - h*tau);  M(q,k) = M(k,q)
                   end if
                end do
             end if
          end do
       end do
    end do
    w(1) = M(1,1);  w(2) = M(2,2);  w(3) = M(3,3)
  end subroutine jacobi3

  function cond_sym3(A) result(kap)
    real(dp), intent(in) :: A(3,3)
    real(dp) :: kap, w(3), lo, hi
    call jacobi3(A, w)
    lo = minval(abs(w));  hi = maxval(abs(w))
    kap = merge(huge(1.0_dp), hi/max(lo, tiny(1.0_dp)), lo <= 0.0_dp)
  end function cond_sym3

  ! THE SPINE, COMPUTED. Read the three rows as normals of planes through the
  ! origin. The intersection of the planes has dimension 3 - rank. Rank three
  ! returns dimension ZERO, one point, unique, no interval. Rank two returns
  ! dimension ONE, a line, and no point is determined at all.
  ! The rank tolerance is not chosen. It is the largest eigenvalue times the
  ! machine epsilon times the matrix order, which is the standard perturbation
  ! bound on a symmetric eigenvalue: below it an eigenvalue is not separable
  ! from rounding at this precision. No decade of hand-set slack enters here.
  subroutine intersection_dim(R, d, sep)
    real(dp), intent(in)  :: R(3,3)
    integer,  intent(out) :: d
    real(dp), intent(out) :: sep          ! margin: smallest eigenvalue over tol
    integer  :: i, rank
    real(dp) :: w(3), tol, lo
    call jacobi3(R, w)
    ! The constant is the standard symmetric backward-error factor and is a
    ! FLOOR, not a preference: below it an eigenvalue is not separable from
    ! rounding at this precision. The exhibit is stable from this value upward
    ! and is not stable below it, so the margin is emitted with the dimension
    ! and a reader can see how far the call sits from the boundary.
    tol = 8.0_dp * real(size(w),dp) * epsilon(1.0_dp) * max(maxval(abs(w)), 1.0_dp)
    rank = 0;  lo = huge(1.0_dp)
    do i = 1, 3
       if (abs(w(i)) > tol) then
          rank = rank + 1
          lo = min(lo, abs(w(i)))
       end if
    end do
    d = 3 - rank
    sep = merge(lo/tol, 0.0_dp, rank > 0)
  end subroutine intersection_dim

  subroutine prepare_rows(M, Q, ok)
    real(dp), intent(in)  :: M(:,:)
    real(dp), intent(out) :: Q(size(M,1), size(M,2))
    logical,  intent(out) :: ok
    integer  :: i, n
    real(dp) :: mu, sd, nrm
    n = size(M,2);  ok = .true.;  Q = M
    do i = 1, size(M,1)
       mu = sum(Q(i,:))/real(n,dp);  Q(i,:) = Q(i,:) - mu
       sd = sqrt(sum(Q(i,:)**2)/real(n-1,dp))
       if (sd <= 0.0_dp) then
          ok = .false.;  return                      ! an axis carrying nothing
       end if
       Q(i,:) = Q(i,:)/sd
       nrm = sqrt(sum(Q(i,:)**2));  Q(i,:) = Q(i,:)/nrm
    end do
  end subroutine prepare_rows

  subroutine span_basis(Q, B)
    real(dp), intent(in)  :: Q(:,:)
    real(dp), intent(out) :: B(size(Q,1), size(Q,2))
    integer  :: i, j
    real(dp) :: v(size(Q,2))
    do i = 1, size(Q,1)
       v = Q(i,:)
       do j = 1, i-1
          v = v - dot_product(v, B(j,:))*B(j,:)
       end do
       B(i,:) = v/sqrt(sum(v*v))
    end do
  end subroutine span_basis

  subroutine lambda_of(Q, B, lam_quat, lam_det, co)
    real(dp), intent(in)  :: Q(:,:), B(:,:)
    real(dp), intent(out) :: lam_quat, lam_det, co(3,3)
    real(dp) :: q1(4), q2(4), q3(4), p(4)
    integer  :: i, j
    do i = 1, 3
       do j = 1, 3
          co(i,j) = dot_product(Q(i,:), B(j,:))
       end do
    end do
    q1 = [0.0_dp, co(1,:)];  q2 = [0.0_dp, co(2,:)];  q3 = [0.0_dp, co(3,:)]
    p = qmul(qmul(q1, q2), q3)
    lam_quat = p(1);  lam_det = -det3(co)
  end subroutine lambda_of

  ! The kernel does not grade. It reports whether the axes are independent, and
  ! therefore whether a unique intersection exists at all.
  subroutine kernel_determine(M, verdict, lam, detR, kapR, idim, why, margin)
    real(dp), intent(in)  :: M(:,:)
    integer,  intent(out) :: verdict, idim
    real(dp), intent(out), optional :: margin
    real(dp), intent(out) :: lam, detR, kapR
    character(len=*), intent(out) :: why
    real(dp) :: sep
    real(dp) :: Q(3,size(M,2)), B(3,size(M,2)), R(3,3), co(3,3)
    real(dp) :: lq, ld, um, epsf, kgate
    integer  :: n
    logical  :: ok
    n = size(M,2);  um = epsilon(1.0_dp)
    epsf  = 100.0_dp*um*real(n,dp)
    if (size(M,1) /= 3) then
       verdict = OPENV;  idim = -1
       why = 'axis count is not three; the residence is not the one this kernel reads'
       return
    end if
    kgate = min(1.0e6_dp, sqrt(27.0_dp/(100.0_dp*um*real(n,dp))))
    lam = 0.0_dp;  detR = 0.0_dp;  kapR = 0.0_dp;  idim = -1;  sep = 0.0_dp
    if (n < 4) then
       verdict = OPENV;  why = 'dimensional shortfall';  return
    end if
    call prepare_rows(M, Q, ok)
    if (.not. ok) then
       verdict = OPENV;  why = 'an axis carries no content; nothing to intersect';  return
    end if
    R = matmul(Q, transpose(Q))
    detR = det3(R)
    ! A correlation Gram is positive semi-definite by construction, so a
    ! negative determinant is a rounding artifact and never a quantity. It is
    ! clamped at the floor rather than reported as read.
    if (detR < 0.0_dp) detR = 0.0_dp
    call intersection_dim(R, idim, sep)
    call span_basis(Q, B);  call lambda_of(Q, B, lq, ld, co);  lam = lq
    if (present(margin)) margin = sep
    if (detR <= epsf) then
       verdict = BROKEN;  why = 'axes coplanar; the intersection is not a point'
       return
    end if
    kapR = cond_sym3(R)
    if (kapR >= kgate) then
       ! The intersection exists and is unique by the geometry. The instrument
       ! declines to report it, because at this conditioning the computed point
       ! is not separable from rounding. Instrument-silence about reach, never
       ! a claim that the intersection is absent or partial.
       verdict = OPENV
       why = 'engineering-incomplete: determination present, instrument declines'
       return
    end if
    verdict = DETERMINED
    why = 'three independent axes; the intersection exists and is unique'
    if (present(margin)) margin = sep
  end subroutine kernel_determine

  !===========================================================================
  !  SEAL L, THE TONGUE. Loads FIRST. Carries the direction the Number cannot,
  !  and closes the terms the row cascade later reads.
  !===========================================================================

  subroutine seal_L(slots, verdict, why)
    integer, intent(in)  :: slots(:,:)
    integer, intent(out) :: verdict
    character(len=*), intent(out) :: why
    integer :: i, j, a, b, nfull, ns
    ns = size(slots,1)                      ! the shelf is read, never remembered
    nfull = 0
    do i = 1, ns
       if (any(slots(i,:) /= 0)) nfull = nfull + 1
    end do
    if (nfull /= 3) then
       verdict = BROKEN
       write(why,'(A,I0,A)') 'deletion test returns ', nfull, ' slots, not three'
       return
    end if
    do i = 1, ns
       do j = i+1, ns
          do a = 1, size(slots,2)
             do b = 1, size(slots,2)
                if (slots(i,a) /= 0 .and. slots(i,a) == slots(j,b)) then
                   verdict = BROKEN
                   write(why,'(A,I0,A,I0)') 'LIT collision, slot ', i, ' and slot ', j
                   return
                end if
             end do
          end do
       end do
    end do
    verdict = SEALED;  why = 'three slots, vocabulary pairwise disjoint'
  end subroutine seal_L

  ! The six drills, routed to and not improvised. D3 carries the provenance
  ! flag and is mandatory for the closure-rowed compartment: a standing
  ! definition shaped at the Number makes rows-and-closure coincidence
  ! circular, and no other gate in the architecture reaches it.
  subroutine drill_screen(d1, d2, d3_filed, d3_shaped, d4, d5, d6, ok, grade_cap, why)
    logical, intent(in)  :: d1, d2, d3_filed, d3_shaped, d4, d5, d6
    logical, intent(out) :: ok
    character(len=*), intent(out) :: grade_cap, why
    ok = .false.;  grade_cap = 'none'
    if (.not. (d1 .and. d2)) then
       why = 'D1/D2 fail: Seal L break, terminal whatever the determinant reads';  return
    end if
    if (.not. d3_filed) then
       why = 'D3 fail: provenance unfiled; Number-shaped content in the Tongue seat';  return
    end if
    if (.not. d4) then
       why = 'D4 fail: a magnitude carried on the Tongue; sign only, veto never substitution';  return
    end if
    if (.not. d5) then
       why = 'D5 fail: register undeclared; re-index rather than refute';  return
    end if
    if (.not. d6) then
       why = 'D6 fail: the Tongue reproduced the blindness it was appointed to repair';  return
    end if
    ok = .true.
    ! The flag records; it does not bar. What it costs is a tier.
    if (d3_shaped) then
       grade_cap = 'structural'
       why = 'drills pass; provenance filed and SHAPED, so the assignment caps at structural'
    else
       grade_cap = 'theorem'
       why = 'drills pass; provenance filed and unshaped, no tier discount'
    end if
  end subroutine drill_screen

  !===========================================================================
  !  THE ROW CASCADE. One floor, three routers folded into their arguments,
  !  four admission gates. The count is forced by the questions: one about
  !  population, one about row identity, two about closure leaks.
  !===========================================================================

  subroutine row_cascade(has_content, faces_scoped, canonical, forward_mode, &
                         populated, worldly_row, drills_ok, frame_closed, &
                         compartment, why)
    logical, intent(in)  :: has_content, faces_scoped, canonical, forward_mode
    logical, intent(in)  :: populated, worldly_row, drills_ok, frame_closed
    integer, intent(out) :: compartment
    character(len=*), intent(out) :: why
    compartment = NOT_COMPARTMENTED
    if (.not. has_content) then
       why = 'F-0: every term decoration; contentless, refused, not compartmented';  return
    end if
    if (.not. faces_scoped) then
       why = 'R-1: faces not enumerated; a composite carries one compartment per face';  return
    end if
    if (.not. canonical) then
       why = 'R-2: not canonicalised; the compartment attaches to the stripped string';  return
    end if
    ! Population is asked before mode, because an unpopulated forward
    ! proposition has no lock to route and typing it world-rowed would assign a
    ! compartment to an object that determined nothing.
    if (.not. populated) then
       compartment = UNPOPULATED
       why = 'S-1: an axis is empty; two planes meet in a line; no lock forms'
       return
    end if
    if (forward_mode) then
       compartment = WORLD_ROWED
       why = 'R-3: a dated axis must be sourced, never measured; world-rowed unconditionally'
       return
    end if
    if (.not. populated) then
       compartment = UNPOPULATED
       why = 'S-1: an axis is empty; two planes meet in a line; no lock forms'
       return
    end if
    if (worldly_row) then
       compartment = WORLD_ROWED
       why = 'S-2: a row furnished by the world; the lock is total given those rows'
       return
    end if
    if (.not. drills_ok) then
       compartment = WORLD_ROWED
       why = 'S-3: term closure unscreened; typed by its remaining rows'
       return
    end if
    if (.not. frame_closed) then
       compartment = WORLD_ROWED
       why = 'S-4: existential import or transport; the leak names the compartment'
       return
    end if
    compartment = CLOSURE_ROWED
    why = 'rows are the closure; the two determinations are one; RA-conditional at the act'
  end subroutine row_cascade

  pure function compartment_grade(c, cap) result(s)
    integer, intent(in) :: c
    character(len=*), intent(in) :: cap
    character(len=64) :: s
    select case (c)
    case (CLOSURE_ROWED); s = 'row-indefeasible, defeasible against fault, cap '//trim(cap)
    case (UNPOPULATED);   s = 'no determination to defeat; an axis is owed'
    case (WORLD_ROWED);   s = 'revisable entirely in the rows; direction bought with the arrow'
    case default;         s = 'no compartment'
    end select
  end function compartment_grade

  !===========================================================================
  !  THE GROUND AND THE ROUTER BIT.
  !===========================================================================

  pure function ground_dim(diagv) result(d)
    real(dp), intent(in) :: diagv(:)
    integer :: d, i
    d = 0
    do i = 1, size(diagv)
       if (diagv(i) == 1.0_dp) d = d + 1
    end do
  end function ground_dim

  pure function route_halt(gdim) result(branch)
    integer, intent(in) :: gdim
    character(len=52) :: branch
    if (gdim == 1) then
       branch = 'B.14.Xi  eight gates, blindness in the reader'
    else if (gdim == 0) then
       branch = 'B.14.O   five gates, walls in the terrain'
    else
       branch = 'terrain unmeasured; nothing emitted'
    end if
  end function route_halt

end module trisduction_rows


!===============================================================================
!  EXECUTED. Nothing below is narrated; every figure is computed in this run.
!===============================================================================
program thesis_rows
  use trisduction_rows
  implicit none
  integer, parameter :: N = 24
  real(dp), parameter :: PI = 3.141592653589793238462643_dp
  real(dp) :: t(N), M(3,N), Mr(3,N), Two(3,N), Ret(3,N)
  real(dp) :: Q(3,N), B(3,N), co(3,3), R(3,3), Rr(3,3)
  real(dp) :: lam, detR, kapR, lam2, d2, lq, ld, marg
  real(dp) :: i4(4), j4(4), k4(4), p4(4), sig(4), dia(4)
  integer  :: v, vL, idim, comp, i
  logical  :: ok, dok
  character(len=110) :: why, cap
  integer  :: slots_ok(3,3)

  write(*,'(A)') repeat('=',78)
  write(*,'(A)') ' TRISDUCTION . RAM -- THE CORE THESIS, EXECUTED'
  write(*,'(A)') repeat('=',78)

  do i = 1, N
     t(i) = 2.0_dp*PI*real(i-1,dp)/real(N,dp)
  end do

  !------------------------------------------------- THE SPINE, COMPUTED
  ! Three independent axes: the intersection has dimension zero. One point.
  ! Two axes: dimension one. A line. No point is determined at all.
  M(1,:) = sin(t)
  M(2,:) = cos(2.0_dp*t) + 0.35_dp*sin(t)
  M(3,:) = sin(3.0_dp*t) + 0.20_dp*cos(2.0_dp*t) + 0.12_dp*sin(t)
  Two = M;  Two(3,:) = 0.6_dp*M(1,:) + 0.4_dp*M(2,:)     ! third axis not independent

  write(*,'(/,A)') ' THE SPINE: WHAT A LOCK DETERMINES'
  call kernel_determine(M, v, lam, detR, kapR, idim, why, marg)
  write(*,'(A,A)')      '   three independent axes : ', trim(token(v))
  write(*,'(A,I0,A)')   '     intersection dimension = ', idim, '   -> exactly one point, no interval'
  write(*,'(A,F16.12)') '     det(R)                 = ', detR
  write(*,'(A,ES12.3)') '     |lambda^2 - det(R)|    = ', abs(lam*lam - detR)
  write(*,'(A,ES12.3,A)') '     rank margin            = ', marg, '   smallest kept eigenvalue over tol'
  call kernel_determine(Two, v, lam2, d2, kapR, idim, why, marg)
  write(*,'(A,A)')      '   third axis dependent   : ', trim(token(v))
  write(*,'(A,I0,A)')   '     intersection dimension = ', idim, '   -> a line; two planes meet in a line'
  write(*,'(A,ES12.3,A)') '     rank margin            = ', marg, '   smallest RETAINED eigenvalue over tol; the third fell below'
  write(*,'(A)')        '   A lock is not graded. It either determines a point or it does not exist.'

  !------------------------------------------------- ORIENTATION, NOT STRENGTH
  ! The Number cannot read the sign. That is a fact about DIRECTION and never
  ! about whether the determination is complete.
  call prepare_rows(M, Q, ok);  call span_basis(Q, B)
  call lambda_of(Q, B, lq, ld, co);  R = matmul(Q, transpose(Q))
  Mr = -M
  call prepare_rows(Mr, Q, ok);  call lambda_of(Q, B, lam2, d2, co)
  Rr = matmul(Q, transpose(Q))
  write(*,'(/,A)') ' WHAT THE NUMBER CANNOT READ: DIRECTION, NOT COMPLETENESS'
  write(*,'(A,F16.12,A,F16.12)') '   lambda(P) = ', lq, '   lambda(not P) = ', lam2
  write(*,'(A,ES12.3)') '   max|G(P) - G(not P)|              = ', maxval(abs(R - Rr))
  write(*,'(A,ES12.3)') '   |det(R)(P) - det(R)(not P)|       = ', abs(det3(R) - det3(Rr))
  write(*,'(A)')        '   The intersection is equally unique either way. The Tongue carries the sign.'

  i4 = [0.0_dp,1.0_dp,0.0_dp,0.0_dp];  j4 = [0.0_dp,0.0_dp,1.0_dp,0.0_dp]
  k4 = [0.0_dp,0.0_dp,0.0_dp,1.0_dp];  p4 = qmul(qmul(i4,j4),k4)
  write(*,'(A,F14.10)') '   substrate chirality  Re(i*j*k)    = ', p4(1)

  Ret(1,:) = sin(t);  Ret(2,:) = cos(t);  Ret(3,:) = sin(2.0_dp*t)
  call kernel_determine(Ret, v, lam, detR, kapR, idim, why)
  write(*,'(A,F16.12,A,F16.12)') '   the Return: det(R) = ', detR, '   |lambda| = ', abs(lam)

  !------------------------------------------------- THE GROUND
  sig = [1.0_dp,-1.0_dp,-1.0_dp,-1.0_dp];  dia = [-1.0_dp,-1.0_dp,-1.0_dp,-1.0_dp]
  write(*,'(/,A)') ' THE GROUND AND THE ROUTER BIT'
  write(*,'(A,I0,A,A)') '   sigma Ground dim = ', ground_dim(sig), ' -> ', trim(route_halt(ground_dim(sig)))
  write(*,'(A,I0,A,A)') '   -I    Ground dim = ', ground_dim(dia), ' -> ', trim(route_halt(ground_dim(dia)))

  !------------------------------------------------- SEAL L AND THE DRILLS
  slots_ok = reshape([101,102,0, 201,202,0, 301,302,0],[3,3],order=[2,1])
  call seal_L(slots_ok, vL, why)
  write(*,'(/,A)') ' SEAL L AND THE SIX DRILLS'
  write(*,'(A,A,A,A)') '   Seal L        : ', trim(token(vL)), ' :: ', trim(why)
  call drill_screen(.true.,.true.,.true.,.false.,.true.,.true.,.true., dok, cap, why)
  write(*,'(A,L1,A,A,A,A)') '   unshaped terms: ', dok, '  cap=', trim(cap), ' :: ', trim(why)
  call drill_screen(.true.,.true.,.true.,.true., .true.,.true.,.true., dok, cap, why)
  write(*,'(A,L1,A,A,A,A)') '   shaped terms  : ', dok, '  cap=', trim(cap), ' :: ', trim(why)
  call drill_screen(.true.,.true.,.false.,.true.,.true.,.true.,.true., dok, cap, why)
  write(*,'(A,L1,A,A,A,A)') '   unfiled flag  : ', dok, '  cap=', trim(cap), ' :: ', trim(why)

  !------------------------------------------------- THE ROW CASCADE
  write(*,'(/,A)') ' THE ROW CASCADE'
  call row_cascade(.true.,.true.,.true.,.false.,.true.,.false.,.true.,.true., comp, why)
  write(*,'(A,A)') '   a closed residence has no outside      -> ', trim(compartment_name(comp))
  write(*,'(A,A)') '       ', trim(why)
  write(*,'(A,A)') '       ', trim(compartment_grade(comp,'theorem'))

  call row_cascade(.true.,.true.,.true.,.false.,.false.,.false.,.true.,.true., comp, why)
  write(*,'(A,A)') '   every zero lies on the critical line   -> ', trim(compartment_name(comp))
  write(*,'(A,A)') '       ', trim(why)

  call row_cascade(.true.,.true.,.true.,.false.,.true.,.true.,.true.,.true., comp, why)
  write(*,'(A,A)') '   confined existents carry positive E_k  -> ', trim(compartment_name(comp))
  write(*,'(A,A)') '       ', trim(compartment_grade(comp,'theorem'))

  call row_cascade(.true.,.true.,.true.,.true., .true.,.false.,.true.,.true., comp, why)
  write(*,'(A,A)') '   any dated forward projection           -> ', trim(compartment_name(comp))

  call row_cascade(.true.,.true.,.true.,.false.,.true.,.false.,.true.,.false., comp, why)
  write(*,'(A,A)') '   this man is a bachelor                 -> ', trim(compartment_name(comp))
  write(*,'(A,A)') '       ', trim(why)

  call row_cascade(.false.,.true.,.true.,.false.,.true.,.false.,.true.,.true., comp, why)
  write(*,'(A,A)') '   a contentless tautology                -> ', trim(compartment_name(comp))

  write(*,'(/,A)') repeat('=',78)
  write(*,'(A)') ' A lock is always a determination and is total about its object.'
  write(*,'(A)') ' Its object is its intersection. The compartment names what the rows were.'
  write(*,'(A)') ' Compartment III pays revisability for direction. Compartment I has neither.'
  write(*,'(A)') ' Neither is the better lock. They are locks on different rows. Delta-M = 0.'
  write(*,'(A)') repeat('=',78)

end program thesis_rows
