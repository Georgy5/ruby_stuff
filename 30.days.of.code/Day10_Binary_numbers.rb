#!/bin/ruby
n = gets.strip.to_i

def to_binary(n)  # Constraint: n is a positive integer!
  n.to_s(2)
end
array = to_binary(n).split.map(&:to_i)
puts array.join.split("0").group_by(&:size).max.first