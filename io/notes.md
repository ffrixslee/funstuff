### Day 1 Self-Study

```io
"Io> ferrari drive
it goes vroom vroom vroom
==> it goes vroom vroom vroom"
```

- Io as an embeddable language with a tiny virtual machine and rich concurrency.
- Core strengths: 
  - Rich customizable syntax and function
  - Strong concurrency model
- Tip: Try to focus on the simplicity of the syntax and the prototype programming model. The language's syntax is simple and low-level.
- Slots in this case function like hashes, retrieved with a key value
- Types begin with an uppercase


Find:
- Some Io example problems
> http://www.iolanguage.com/about/samplecode/
- An Io community that will answer questions
> http://tech.groups.yahoo.com/group/iolanguage/messages
> http://stackoverflow.com/questions/tagged/iolanguage
> http://www.reddit.com/r/iolanguage
> https://news.ycombinator.com/item?id=22796409
- A style guide with Io idioms
> http://en.wikibooks.org/wiki/IO_Programming/IO_Style_Guide

Answer: 
- Evaluate 1 + 1 and then 1 + "one". Is Io strongly typed or weakly typed? Support your answer with code.
> Strongly typed because:
```io
Io> 1 + 1
==> 2
Io> 1 + "one"

  Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
  ---------
  message '+' in 'Command Line' on line 1
```
- Is 0 true or false? What about the empty string? Is nil true or false? Support your answer with code.
```io
if(0) println 
- true

if("") println 
- true

if(nil) println
- false
```

- How can you tell what slots a prototype supports?
> <protype> slotNames

- What is the difference between =(equals), :=(colon equals), and ::=(colon colon equals)? When would you use each one?
  - = is used for assignments to an existing slot
  - := is used for assignments to a previously non-existent slot
  - ::= is for assignments to a previously non-existent slot as well as create a setter for that slot


Do: 
- Run an Io program from a file.
> Run from the CLI: io <filename>.io

- Execute the code in a slot given its name.

### Day 2 Self-Study

Do:
- 1. A Fibonacci sequence starts with two 1s. Each subsequent number is the sum of the two numbers that came before: 1, 1, 2, 3, 5, 8, 13, 21, and so on. Write a program to find the nth Fibonacci number. fib(1) is 1, and fib(4) is 3. As a bonus, solve the problem with recursion and with loops.
```io
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
```

- 2. How would you change / to return 0 if the denominator is zero? 
```io
origDiv := Number getSlot("/")
Number / = method(n, if(n==0, 0, self origDiv(n)))

(5/0) println 
```

- 3. Write a program to add up all of the numbers in a two-dimensional array.
```io
addUp2DArray := method(array, array flatten reduce(+))

addUp2DArray(list(2,3,4,5)) println
```

- 4. Add a slot called myAverage to a list that computes the average of all the numbers in a list. What happens if there are no numbers in a list? (Bonus: Raise an Io exception if any item in the list is not a number.)
```io
List myAverage := method(self sum / self size)

val := list(2,7,10)
val myAverage println
```

- 5. Write a prototype for a two-dimensional list. The dim(x, y) method should allocate a list of y lists that are x elements long. set(x, y, value should set a value, and get(x, y) should return that value.
```io
List2D := List clone

dim := method(x,y, List2D clone setSize(y) mapInPlace(_, List clone setSize(x)) )

dim(3,8) println

List2D set := method(x,y,value, at(y) atPut(x,value))
List2D get := method(x,y, at(y) at(x))

l := dim(3,8)
l set(1,7,"foo")
l get(1,7) println
```

- 6. Bonus: Write a transpose method so that (new_matrix get(y, x)) == matrix get(x,y) on the original list.
```io
List2D transpose := method(
  other := dim(size, at(0) size)
  foreach(y,row, row foreach(x,value, other set(y,x,value)))
  other
)

List2D with := method( source,
  result := dim(source size, source at(0) size)
  source foreach(y,row, row foreach(x,value, result set(x,y,value)))
  result
)

l := dim(2,2)
l set(0,0,1)
l set(1,0,2)
l set(0,1,3)
l set(1,1,4)
l println
l transpose println

# write the matrix to a file, and read it back
List2D serializeTo := method(path, File open(path) write(serialized) close)
List2D serializeFrom := method(path, with(doFile(path)))

l serializeTo("list.io")
m := List2D serializeFrom("list.io")

l println
m println
```

- 7. Write the matrix to a file, and read a matrix from a file.
```io
List2D serializeTo := method(path, File open(path) write(serialized) close)
List2D serializeFrom := method(path, with(doFile(path)))

l serializeTo("list.io")
m := List2D serializeFrom("list.io")

l println
m println
```

- 8. Write a program that gives you ten tries to guess a random number from 1-100. If you would like, give a hint of "hotter" or "colder" after the first guess.
```io
true_value := Random value(1,100) floor
previous_guess := nil
current_guess := nil
10 repeat(
  "What do you guess?" println
  current_guess = File standardInput readLine asNumber
  if(current_guess == true_value, break)
  if(previous_guess,
    if((current_guess - true_value) abs <= (previous_guess - true_value) abs,
    "Hotter" println,
    "Colder" println
    )
  )

  previous_guess = current_guess
)

if(current_guess == true_value, ("Well done. It was indeed " .. true_value) println, ("Bad luck. It was actually" .. true_value) println)
```

### Day 3 Self-Study
Do:
- Enhance the XML program to add spaces to show the indentation structure.
- Create a list syntax that uses brackets.
- Enhance the XML program to handle attributes: if the first argument is  a map (use the curly brackets syntax), add attributes to the XML program. For example:  
book({"author":"Tate"}...) would print 
</book author="Tate">: