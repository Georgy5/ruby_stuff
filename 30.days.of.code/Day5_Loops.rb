#!/bin/ruby

puts 'Multiplication table for the number you enter. Please enter desired number:'
n = gets.strip.to_i

(1..10).each do |i|
  puts "#{n} x #{i} = #{n*i}"
end
