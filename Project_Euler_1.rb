#!/bin/ruby

t = gets.strip.to_i

def sum_mult_of(mult, limit)
  # This function uses the fact that the sum of an arithmetic
  # series can by calculated analytically by:
  #   S_n = n(a_1 + a_n)/2
  # where 'n' is the number of terms in the series, a_1 is the first
  # term in the series, and a_n is the last term in the series

  if limit <= mult
    return 0
  else
    # number of terms in arithmetic series
    n = (limit - 1) / mult
    # first term in arithmetic series
    a_1 = mult
    # last term in arithmetic series
    a_n = a_1 + (n - 1) * mult
    return n * (a_1 + a_n) / 2
  end
end

for a0 in (0..t-1)
  n = gets.strip.to_i
  total = sum_mult_of(3, n) + sum_mult_of(5, n) - sum_mult_of(15, n)
  puts total
end