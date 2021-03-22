### Day 1 Self-Study

Find:
- The Ruby API [https://rubyapi.org/]
- The free online version of Programming Ruby: The Pragmatic Programmer’s Guide [TFH08] [https://ruby-doc.com/docs/ProgrammingRuby/]
- [x] A method that substitutes part of a string [https://rubyapi.org/3.0/o/string#method-i-gsub]
```ruby
irb(main):043:0> puts "NIGHS".gsub "S", "WING"
NIGHWING
=> nil
```
- Information about Ruby’s regular expressions
> A regular expression (or regexp) is a set of characters surrounded by slashes.
> /ruby/, /[0-9]+/ and /^\d{3}-\d{3}-\d{4}/ are examples.
> Regular expressions are used to find words or patterns in text. The slashes on each side of the expression are pins.
- Information about Ruby’s ranges
> A range is two values surrounded by parentheses and separated by an ellipsis (in the form of two or three dots).

Do: 
- [x] Print the string “Hello, world.”
```ruby
irb(main):011:0> puts 'Hello, world.'
Hello, world.
=> nil
```
- [x] For the string “Hello, Ruby,” find the index of the word “Ruby.”
```ruby
irb(main):037:0> 'Hello, Ruby.'.index('Ruby')
=> 7
```
- [x] Print your name ten times.
```ruby
irb(main):009:0> 10.times { print "ffrixslee" }
ffrixsleeffrixsleeffrixsleeffrixsleeffrixsleeffrixsleeffrixsleeffrixsleeffrixsleeffrixslee=> 10
```
- [x] Print the string “This is sentence number 1,” where the number 1 changes from 1 to 10.
```ruby
irb(main):040:0> 1.upto(10) {|i| print "This is sentence number #{i} "}  
This is sentence number 1 This is sentence number 2 This is sentence number 3 This is sentence number 4 This is sentence number 5 This is sentence number 6 This is sentence number 7 This is sentence number 8 This is sentence number 9 This is sentence number 10 => 1
```
- [x] Run a Ruby program from a file.
```ruby
save ex.rb with:
for i in 0..10 puts "This is sentence number #{i}" end then run: jruby ex.rb
```
- [x] Bonus problem: If you’re feeling the need for a little more, write a program that picks a random number. Let a player guess the number, telling the player whether the guess is too low or too high.
(Hint: rand(10) will generate a random number from 0 to 9, and gets will read a string from the keyboard that you can translate to an integer.)
```ruby
random_number = rand(1000) + 1
guess = 0

while guess != random_number do
    print "Pick a number between 1 and 1000: "
    guess = gets.to_i
    puts "Too low!" if guess < random_number
    puts "Too high!" if guess > random_number
end

puts "Got it! It was #{random_number}"
```