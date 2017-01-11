#!/bin/ruby

t = gets.strip.to_i
t.times do
  n,k = gets.strip.split(' ')
  n = n.to_i
  k = k.to_i
  
  max = 0

  (0..k).each do |a|
    (a+1..n).each do |b|
      ab = a & b

      if (ab > max) and (ab < k)
        max = ab
      end
    end
  end
  puts max
end