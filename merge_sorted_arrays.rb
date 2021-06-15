# Interview Cake Weekly Problem #352
my_array     = [3, 4, 6, 10, 11, 15]
alices_array = [1, 5, 8, 12, 14, 19]

def merge_arrays(ary1, ary2)
  return (ary1 + ary2).sort
end

puts merge_arrays(my_array, alices_array)
# Prints [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
