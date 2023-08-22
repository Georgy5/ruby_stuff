# array of numbers
# Create a function to count boomerangs
# A boomerang is 3 lements where the first and last numbers are the same,
# the middle number however is different.
# eg  [1, 2, 1, 2] would be two boomerangs

# thoughts:
# iterate and compare groups of three numbers

def find_boomerang(ary)
  boomerang_list = []

  ary.each_cons(3) do |a, b, c|
    if a == c and a != b
      boomerang_list << [a, b, c]
    end
  end

  boomerang_count = boomerang_list.size

  if boomerang_count.zero?
    "This list does not contain any Boomerangs"
  else
    plural = boomerang_count > 1 ? 's' : ''
    "#{boomerang_count} Boomerang#{plural} found: #{boomerang_list}"
  end
end

# Test cases to test the #find_boomerang function
test1 = [1, 2, 1, 2, 3, 4, 5, 6, 5]
test2 = [1, 2, 1, 2]
test3 = [2, 2]
test4 = []
test5 = [5, 5, 5, 5, 5]
test6 = [3, 2, 3]

p find_boomerang(test1)
p find_boomerang(test2)
p find_boomerang(test3)
p find_boomerang(test4)
p find_boomerang(test5)
p find_boomerang(test6)
