# array of numbers
# Create a function to count boomerangs
# A boomerang is 3 lements where the first and last numbers are the same,
# the middle number however is different.
# eg  [1, 2, 1, 2] would be two boomerangs

# thoughts:
# iterate and compare groups of three numbers

def find_boomerang(ary)
  none_found_message = "This list does not contain any Boomerangs"
  if ary.length < 3
    return none_found_message
  end

  boomerang_counter = 0
  boomerang_list = []
  ary.each_with_index do |num, index|
    boom_ary = []
    if ary[index] == ary[index + 2] and ary[index] != ary[index + 1]
      boomerang_counter += 1
      boom_ary << ary[index]
      boom_ary << ary[index + 1]
      boom_ary << ary[index + 2]
    end
    boomerang_list << boom_ary unless boom_ary.empty?
  end

  if boomerang_counter == 0
    return none_found_message
  end

  return "#{pluralize_boomerangs(boomerang_counter)} found: #{boomerang_list}"
end

def pluralize_boomerangs(boomerang_counter)
  if boomerang_counter == 1
    "#{boomerang_counter} Boomerang"
  else
    "#{boomerang_counter} Boomerangs"
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
