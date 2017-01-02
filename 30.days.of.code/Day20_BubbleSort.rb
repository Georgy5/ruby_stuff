#!/bin/ruby

n = gets.strip.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)

numSwaps = 0

for i in 0.upto(n) do
  for j in 0...(n - 1) do
    if a[j] > a[j + 1]
      a[j], a[j + 1] = a[j + 1], a[j]
      numSwaps += 1
    end
  end
end

puts "Array is sorted in #{numSwaps} swaps."
puts "First Element: #{a.first}"
puts "Last Element: #{a.last}"