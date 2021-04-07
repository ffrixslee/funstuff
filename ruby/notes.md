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

### Day 2 Self-Study

Find:
- Find out how to access files with and without code blocks. What is the benefit of the code block?
```ruby

File.open(filename, mode="r" [, opt]) → file
File.open(filename, mode="r" [, opt]) {|file| block } → obj


without code blocks:
file = File.open('filename.ext', 'w')
file.write('some content')
file.close

with code blocks:
File.open('filename.ext', 'w') { |file| file.write('some content')}
```
> The use of code block  allows the user to not have to manually close the file object.

- How would you translate a hash to an array? Can you translate arrays to hashes?
```ruby
array = [:a, :b, :c]
hash = array.each.with_index.inject({}) do |memo, (element, index)|
  memo[index] = element
  memo
end
```
> Set array's indexes as hash keys.

- Can you iterate through a hash?
```ruby
{ a: 1, b: 2, c: 3 }.map { |key, value| [key, value] }
```

- You can use Ruby arrays as stacks. What other common data structures do arrays support?
> Lists, sets, queues and binary trees.

Do: 
- Print the contents of an array of sixteen numbers, four numbers at a time, using just each. Now, do the same with each_slice in Enumerable.
```ruby
array = (1..16).to_a
index = 0
slice_size = 4
slice_index = 0
slices = []
array.each.do |n|
  slices[slice_index] ||= []
  slices[slice_index].push(n)
  if ((index + 1) % slice_size) == 0
    slice_index += 1
  end
  index += 1
end
slices.each { |slice| p slice}

Using Enumerator's each_slice:
array = (1..16).to_a
array.each.slice(4) { |slice| p slice }
```

- The Tree class was interesting, but it did not allow you to specify a new tree with a clean user interface. Let the initializer accept a nested structure with hashes and arrays. You should be able to specify a tree like this: {’grandpa’ => {’ dad’ => {’child 1’ => {}, ’child 2’ => {} }, ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }.
```ruby
class Tree 
  attr_accessor :node_name, :children

  def initialize(tree_hash)
    @node_name = tree_hash.keys.first
    @children = tree_hash.values.first.map do |name, children| 
                  child_tree_hash = {}
                  child_tree_hash[name] = children
                  Tree.new(child_tree_hash)
                end
    end
end
```

- Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere in that line. You will need to do a simple regular expression match and read lines from a file. (This is surprisingly simple in Ruby.) If you want, include line numbers.
```ruby
def grep(file_name, pattern)
  File.read(file_name).each_line.with_index do |line, index|
    puts "#{index} #{line}" if line.match(pattern)
  end
end
```