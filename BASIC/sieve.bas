
Dim n As Integer
n = 1000
Dim i As Integer
Dim j As Integer

Dim sieve(n) As Integer

For i = 2 To n
    sieve(i) = 1
Next i 

For i = 2 to Sqr(n)
    If sieve(i) = 1 Then
        For j = i*i To n Step i
            sieve(j) = 0
        Next j
    End If
Next i 

Print "The following are the Primes up to 1000"

For i = 0 to 1000
    If sieve(i) = 1 Then
        Print i 
    End If
Next i 
