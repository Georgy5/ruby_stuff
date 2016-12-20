#!/bin/ruby

n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)

res = arr.reverse

0.upto(n-1) do |i|
  print res[i]
  print " "
end