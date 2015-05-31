
def sum elements
  elements.reduce 0, :+
end


def max_2_sum elements
  sum(elements.sort.last(2))
end



def sum_eq_n?(arr, n)
  return true if arr.empty? and n.zero?
  arr.combination(2).any? {|a, b| a + b == n}
end


puts sum_eq_n?([1,2,3,4], 7)
puts sum_eq_n?([1,2,3,13], 14)
puts sum_eq_n?([1,2,3,4], 42)
puts sum_eq_n?([], 0)