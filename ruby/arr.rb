# An array has key-value pairs which can extracted from a hash
# hash = { a: 1, b: 2, c: 3 }
# hash_array = hash.zip.map(&:first)
# print hash_array

array = [:a, :b, :c]
hash = array.each.with_index.inject({}) do |memo, (element, index)|
  memo[index] = element
  memo
end
