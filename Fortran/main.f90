program main
     implicit none

     integer :: N 
     integer :: i, j, end_i
     logical, allocatable :: all(:)

     
     print *, 'Please enter a number:\n'
     read*, N
     
     
     allocate(all(N))
     all(:) = .true.
     
     end_i = int(sqrt(real(N)))
     
     
     do i = 2, end_i
          if (all(i) .eqv. .true.) then
               do j = i*i, N, i
                    all(j) = .false.
               end do
          end if
     end do
     
     print *, '\nThe following are all primes up to ', N

     do i = 2, N
          if (all(i)) print *, i
     end do

     deallocate(all)
     
end program main