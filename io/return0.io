origDiv := Number getSlot("/")
Number / = method(n, if(n==0, 0, self origDiv(n)))

(5/0) println 