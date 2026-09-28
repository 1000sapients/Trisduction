! Full_Conjugation_Twin.f90 · v1.1.0 · twin of FullC in Dark_Closure.lean · Fortran 2018, binary64, sealed flags.
! Executes the numerical content in floating-point complex arithmetic, independently of the kernel's
! integer computation: the Dirac basis, C = i g2 g0, the sixteen bilinears with their conjugation
! parity and the symmetry of C.Gamma; and a census of states whose seven additive numbers run over
! {-1, 0, 1}: the fixed set, gauge darkness, the gap, the self-paired mass law, the shared record.
! Prints one battery line.
program full_conjugation_twin
  use, intrinsic :: iso_fortran_env, only: dp => real64
  implicit none
  complex(dp), parameter :: c0 = (0.0_dp, 0.0_dp), c1 = (1.0_dp, 0.0_dp), ci = (0.0_dp, 1.0_dp)
  complex(dp) :: g(4,4,0:3), g5(4,4), cc(4,4), ccinv(4,4), one(4,4), bas(4,4,16), m(4,4), t(4,4)
  logical :: odd(16), sym, anti, peven, podd
  integer :: checks, fails, k, mu, nu, n, q(7), i1, i2, i3, i4, i5, i6, i7
  integer :: nfixed, ndark, ngap, nrec, nrecfixed, nselfok
  real(dp), parameter :: tol = 1.0e-12_dp
  checks = 0; fails = 0
  one = c0; do k = 1, 4; one(k,k) = c1; end do
  g = c0
  g(1,1,0) = c1; g(2,2,0) = c1; g(3,3,0) = -c1; g(4,4,0) = -c1
  g(1,4,1) = c1; g(2,3,1) = c1; g(3,2,1) = -c1; g(4,1,1) = -c1
  g(1,4,2) = -ci; g(2,3,2) = ci; g(3,2,2) = ci; g(4,1,2) = -ci
  g(1,3,3) = c1; g(2,4,3) = -c1; g(3,1,3) = -c1; g(4,2,3) = c1
  g5 = ci * matmul(matmul(matmul(g(:,:,0), g(:,:,1)), g(:,:,2)), g(:,:,3))
  cc = ci * matmul(g(:,:,2), g(:,:,0))
  ccinv = -cc
  call check(maxval(abs(matmul(cc, cc) + one)) < tol, 'C squared is -1')
  call check(maxval(abs(transpose(cc) + cc)) < tol, 'C is antisymmetric')
  do mu = 0, 3
    do nu = 0, 3
      t = matmul(g(:,:,mu), g(:,:,nu)) + matmul(g(:,:,nu), g(:,:,mu))
      if (mu == nu) then
        if (mu == 0) then
          call check(maxval(abs(t - 2.0_dp * one)) < tol, 'Clifford diagonal, time')
        else
          call check(maxval(abs(t + 2.0_dp * one)) < tol, 'Clifford diagonal, space')
        end if
      else
        call check(maxval(abs(t)) < tol, 'Clifford off-diagonal')
      end if
    end do
    call check(maxval(abs(matmul(matmul(cc, transpose(g(:,:,mu))), ccinv) + g(:,:,mu))) < tol, 'C g^T C^-1 = -g')
  end do
  n = 0
  n = n + 1; bas(:,:,n) = one; odd(n) = .false.
  n = n + 1; bas(:,:,n) = g5; odd(n) = .false.
  do mu = 0, 3
    n = n + 1; bas(:,:,n) = g(:,:,mu); odd(n) = .true.
  end do
  do mu = 0, 3
    n = n + 1; bas(:,:,n) = matmul(g(:,:,mu), g5); odd(n) = .false.
  end do
  do mu = 0, 2
    do nu = mu + 1, 3
      n = n + 1; bas(:,:,n) = matmul(g(:,:,mu), g(:,:,nu)); odd(n) = .true.
    end do
  end do
  call check(n == 16, 'sixteen basis elements')
  do k = 1, 16
    m = matmul(cc, bas(:,:,k))
    sym = maxval(abs(m - transpose(m))) < tol
    anti = maxval(abs(m + transpose(m))) < tol
    t = matmul(matmul(ccinv, transpose(bas(:,:,k))), cc)
    podd = maxval(abs(t + bas(:,:,k))) < tol
    peven = maxval(abs(t - bas(:,:,k))) < tol
    call check(sym .eqv. odd(k), 'C.Gamma symmetric exactly for the C-odd')
    call check(anti .eqv. (.not. odd(k)), 'C.Gamma antisymmetric exactly for the C-even')
    call check(podd .eqv. odd(k), 'parity read off the matrices')
    call check(peven .eqv. (.not. odd(k)), 'even parity read off the matrices')
  end do
  call check(count(odd) == 10, 'ten odd, six even')
  nfixed = 0; ndark = 0; ngap = 0; nrec = 0; nrecfixed = 0; nselfok = 0
  do i1 = -1, 1; do i2 = -1, 1; do i3 = -1, 1; do i4 = -1, 1; do i5 = -1, 1; do i6 = -1, 1; do i7 = -1, 1
    q = [i1, i2, i3, i4, i5, i6, i7]
    if (all(q == 0)) nfixed = nfixed + 1
    if (all(q(1:4) == 0)) then
      ndark = ndark + 1
      if (any(q(5:7) /= 0)) ngap = ngap + 1
      nrec = nrec + 1
      if (all(q == 0)) nrecfixed = nrecfixed + 1
    end if
    if ((all(2 * q == 0)) .eqv. all(-q == q)) nselfok = nselfok + 1
    if (sum([1, 2, 3, 5, 7, 11, 13] * q) + sum([1, 2, 3, 5, 7, 11, 13] * (-q)) /= 0) fails = fails + 1
    checks = checks + 1
  end do; end do; end do; end do; end do; end do; end do
  call check(nfixed == 1, 'one fixed state in the box')
  call check(ndark == 27, 'twenty-seven gauge-dark states')
  call check(ngap == 26, 'twenty-six gauge-dark states off the fixed set')
  call check(nselfok == 2187, 'self-paired mass allowed exactly on the fixed set, all 2187 states')
  call check(nrec == 27 .and. nrecfixed == 1, 'one record, twenty-seven worlds, one fixed')
  print '(a,i0,a,i0,a)', ' box: 2187 states, fixed ', nfixed, ', gauge-dark ', ndark, ''
  print '(a,i0,a,i0)', ' gap (gauge-dark, off the fixed set) ', ngap, ' · worlds sharing the Majorana record ', nrec
  print '(a,i0,a,i0,a)', ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
contains
  subroutine check(ok, what)
    logical, intent(in) :: ok
    character(*), intent(in) :: what
    checks = checks + 1
    if (.not. ok) then
      fails = fails + 1
      print '(a,a)', ' CHECK FAILED: ', what
    end if
  end subroutine check
end program full_conjugation_twin
