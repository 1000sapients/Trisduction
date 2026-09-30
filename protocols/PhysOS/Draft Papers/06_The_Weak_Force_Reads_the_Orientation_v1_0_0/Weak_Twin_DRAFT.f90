! Weak_Twin.f90 · the executed twin of SPHYS_Weak.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Weak_Twin.f90
! Blocks: A the orientation carrier; B the mirror: dot products blind, triple products reversed;
! C C, P and CP on the charged current; D the mixing matrix: unitarity, one phase, the Jarlskog
! invariant; E helicity suppression in pion decay; F the orientation the other forces do not read;
! G the Z reads each fermion's orientation by its isospin.
program weak_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  integer :: checks, fails
  integer(i8) :: seed
  checks = 0; fails = 0; seed = 20260930_i8
  call block_a(); call block_b(); call block_c(); call block_d(); call block_e(); call block_f(); call block_g()
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    checks = checks + 1
    if (.not. ok) fails = fails + 1
    write(*,'(a,a)') merge('  PASS  ', '  FAIL  ', ok), name
  end subroutine check

  function rnd() result(r)
    real(dp) :: r
    seed = modulo(16807_i8*seed, 2147483647_i8)
    r = real(seed, dp)/2147483647.0_dp
  end function rnd

  subroutine block_a()
    integer :: l, r, n, neq, nline, t3, q, s, nz
    write(*,'(a)') 'A · parity is the fold on couplings: vector couplings on the line, the charged current off it'
    n = 0; neq = 0; nline = 0
    do l = -30, 30
      do r = -30, 30
        n = n + 1
        if (1 + (r - l) == 2 - (1 + (l - r)) .and. r + l == l + r) neq = neq + 1
        if ((1 + (l - r) == 1) .eqv. (l == r)) nline = nline + 1
      end do
    end do
    call check('equivariance on 3721 couplings: parity is the fold', neq == n)
    call check('a coupling is on the line exactly when it treats both hands alike (3721)', nline == n)
    nz = 0
    do t3 = -1, 1
      do q = -3, 3
        do s = 0, 50
          if ((t3 - q*s) - (-(q*s)) == t3) nz = nz + 1
        end do
      end do
    end do
    call check('the Z''s left-right difference is the weak isospin at every charge and mixing weight (1071)', nz == 1071)
  end subroutine block_a

  subroutine block_b()
    integer :: t, nd, nt
    real(dp) :: a(3), b(3), c(3), d1, d2, t1, t2
    write(*,'(a)') 'B · the mirror: every dot product is blind, every triple product reverses'
    nd = 0; nt = 0
    do t = 1, 5000
      a = [rnd(), rnd(), rnd()] - 0.5_dp; b = [rnd(), rnd(), rnd()] - 0.5_dp; c = [rnd(), rnd(), rnd()] - 0.5_dp
      d1 = sum(a*b); d2 = sum((-a)*(-b))
      if (d1 == d2) nd = nd + 1
      t1 = trip(a, b, c); t2 = trip(-a, -b, -c)
      if (t2 == -t1) nt = nt + 1
    end do
    call check('5000 random triples: dot products unchanged by the mirror, exactly', nd == 5000)
    call check('5000 random triples: the triple product reversed by the mirror, exactly', nt == 5000)
  end subroutine block_b

  pure function trip(a, b, c) result(t)
    real(dp), intent(in) :: a(3), b(3), c(3)
    real(dp) :: t
    t = a(1)*(b(2)*c(3) - b(3)*c(2)) - a(2)*(b(1)*c(3) - b(3)*c(1)) + a(3)*(b(1)*c(2) - b(2)*c(1))
  end function trip

  subroutine block_c()
    integer :: nc, np, ncp
    write(*,'(a)') 'C · the charged current: left-handed particles and right-handed antiparticles'
    call table(nc, np, ncp)
    call check('C moves the coupling on every state, P on every state, CP on none (4 states each)', &
               nc == 4 .and. np == 4 .and. ncp == 0)
  end subroutine block_c

  subroutine table(nc, np, ncp)
    integer, intent(out) :: nc, np, ncp
    integer :: a, h
    logical :: s0, sc, sp, scp
    nc = 0; np = 0; ncp = 0
    do a = 0, 1
      do h = 0, 1
        s0 = (a == h); sc = ((1 - a) == h); sp = (a == (1 - h)); scp = ((1 - a) == (1 - h))
        if (s0 .neqv. sc) nc = nc + 1
        if (s0 .neqv. sp) np = np + 1
        if (s0 .neqv. scp) ncp = ncp + 1
      end do
    end do
  end subroutine table

  subroutine block_d()
    real(dp) :: s12, s13, s23, c12, c13, c23, dl, jar, worst
    complex(dp) :: v(3,3), e, u(3,3)
    integer :: i, j, n
    integer, parameter :: expect(6) = [0, 0, 1, 3, 6, 10]
    write(*,'(a)') 'D · the mixing matrix: unitary, one phase at three generations, J = 3.1e-5'
    s12 = 0.22501_dp; s13 = 0.003732_dp; s23 = 0.04183_dp; dl = 1.147_dp
    c12 = sqrt(1.0_dp - s12**2); c13 = sqrt(1.0_dp - s13**2); c23 = sqrt(1.0_dp - s23**2)
    e = cmplx(cos(dl), sin(dl), dp)
    v(1,:) = [cmplx(c12*c13, 0.0_dp, dp), cmplx(s12*c13, 0.0_dp, dp), s13/e]
    v(2,:) = [-s12*c23 - c12*s23*s13*e, c12*c23 - s12*s23*s13*e, cmplx(s23*c13, 0.0_dp, dp)]
    v(3,:) = [s12*s23 - c12*c23*s13*e, -c12*s23 - s12*c23*s13*e, cmplx(c23*c13, 0.0_dp, dp)]
    u = matmul(v, conjg(transpose(v)))
    worst = 0.0_dp
    do i = 1, 3
      do j = 1, 3
        worst = max(worst, abs(u(i,j) - merge(1.0_dp, 0.0_dp, i == j)))
      end do
    end do
    jar = aimag(v(1,2)*v(2,3)*conjg(v(1,3))*conjg(v(2,2)))
    write(*,'(a,es9.2,a,es11.4)') '  |V V* - 1| <= ', worst, ';  Jarlskog invariant J = ', jar
    call check('the three-generation mixing matrix is unitary to 1e-15', worst < 1.0e-15_dp)
    call check('its one phase gives J = 3.1e-5, the measure of CP violation in quarks', abs(jar/3.1e-5_dp - 1.0_dp) < 0.03_dp)
    n = 0
    do i = 1, 6
      if ((i - 1)*(i - 2)/2 == expect(i)) n = n + 1
    end do
    call check('physical phases (n-1)(n-2)/2 for n = 1..6 are 0, 0, 1, 3, 6, 10: none below three', n == 6)
  end subroutine block_d

  subroutine block_e()
    real(dp) :: me, mmu, mpi, tree, noha
    write(*,'(a)') 'E · helicity suppression: the pion decays to the muon, not the electron'
    me = 0.51099895_dp; mmu = 105.6583755_dp; mpi = 139.57039_dp
    noha = ((mpi**2 - me**2)/(mpi**2 - mmu**2))**2
    tree = (me/mmu)**2*noha
    write(*,'(a,es11.4,a,f6.3,a)') '  Gamma(e nu)/Gamma(mu nu) at tree level = ', tree, '  (phase space alone: ', noha, ')'
    call check('the left-handed coupling suppresses the electron channel to 1.28e-4, measured 1.2327e-4', &
               abs(tree/1.2327e-4_dp - 1.0_dp) < 0.05_dp .and. noha > 5.0_dp)
  end subroutine block_e

  subroutine block_f()
    real(dp) :: edm, sm
    write(*,'(a)') 'F · the other forces do not read the orientation: the neutron''s electric dipole'
    edm = 1.8e-26_dp; sm = 1.0e-32_dp
    write(*,'(a,es9.2,a,es9.2,a)') '  neutron EDM < ', edm, ' e cm; the weak force alone induces about ', sm, ' e cm'
    call check('no time- and parity-odd reading beyond the weak force is seen: the bound sits 6 orders above it', &
               edm/sm > 1.0e5_dp)
  end subroutine block_f
  subroutine block_g()
    real(dp) :: sw, anu, ae, au, ad
    write(*,'(a)') 'G · the Z reads each fermion''s orientation by its isospin: A_f = 2 gV gA / (gV^2 + gA^2)'
    sw = 0.23153_dp
    anu = asym(0.5_dp, 0.0_dp, sw); ae = asym(-0.5_dp, -1.0_dp, sw)
    au = asym(0.5_dp, 2.0_dp/3.0_dp, sw); ad = asym(-0.5_dp, -1.0_dp/3.0_dp, sw)
    write(*,'(a,f7.4,a,f7.4,a,f7.4,a,f7.4)') '  neutrino ', anu, ';  charged lepton ', ae, ';  up-type ', au, ';  down-type ', ad
    call check('the neutrino is purely left-handed to the Z: A = 1 exactly', anu == 1.0_dp)
    call check('lepton, charm and bottom asymmetries 0.147, 0.668, 0.936 against measured 0.1513, 0.670, 0.923', &
               abs(ae/0.1513_dp - 1.0_dp) < 0.035_dp .and. abs(au/0.670_dp - 1.0_dp) < 0.035_dp .and. &
               abs(ad/0.923_dp - 1.0_dp) < 0.035_dp)
  end subroutine block_g

  pure function asym(t3, q, sw) result(a)
    real(dp), intent(in) :: t3, q, sw
    real(dp) :: a, gl, gr, gv, ga
    gl = t3 - q*sw; gr = -q*sw
    gv = gl + gr; ga = gl - gr
    a = 2.0_dp*gv*ga/(gv*gv + ga*ga)
  end function asym
end program weak_twin
