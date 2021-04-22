fibo_recur := method(num, 
    if(num <= 1, num, fibo_recur(num - 1) + fibo_recur(num - 2) )
)

fibo_loop := method(n, 
    n1 := 0
    n2 := 1
    nNext := 0
    for(i, n, 1, -1, 
        nNext = n1 + n2
        n1 = n2
        n2 = nNext
    )
    n1
)
"Fib 0" println
fibo_recur(0) println
fibo_loop(0) println

"Fib 6" println
fibo_recur(6) println
fibo_loop(6) println

"Fib 10" println
fibo_recur(10) println
fibo_loop(10) println