require 'benchmark'

# Interview Cake Weekly Problem #352
my_array     = [3, 4, 6, 10, 11, 15]
alices_array = [1, 5, 8, 12, 14, 19]

def first_arrays(ary1, ary2)
  (ary1 + ary2).sort
end

puts first_arrays(my_array, alices_array)
# Prints [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
puts Benchmark.measure { 100.times { first_arrays(my_array, alices_array) } }

def second_merge(ary1, ary2)
  (ary1.concat(ary2)).sort
end

puts second_merge(my_array, alices_array)
# Prints [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
puts Benchmark.measure { 100.times { second_merge(my_array, alices_array) } }

def third_merge(ary1, ary2)
  (ary1.union(ary2))
end

puts third_merge(my_array, alices_array).sort
# Prints [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
puts Benchmark.measure { 100.times { third_merge(my_array, alices_array) } }
