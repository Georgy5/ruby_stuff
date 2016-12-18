#!/bin/ruby

n = gets.strip.to_i
$i = 1

while $i <= 10 do
  puts "#{n} x #{$i} = " + (n*$i).to_s
  $i+=1
end
