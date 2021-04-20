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


### Day 3 Self-Study