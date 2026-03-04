program main
    implicit none
    integer :: N
    integer :: i, end_i
    logical, allocatable :: all(:)

    print *, 'Please enter a number:'
    read *, N

    allocate(all(N))
    all(:) = .true.

    end_i = int(sqrt(real(N)))

    do i = 2, end_i
        if (all(i)) all(i*i:N:i) = .false.
    end do

    print *, 'The following are all primes up to ', N
    do i = 2, N
        if (all(i)) print *, i
    end do

    deallocate(all)
end program main