# Enter your code here. Read input from STDIN. Print output to STDOUT
phonebook = {}   
arr = []
N = gets.chomp.to_i 

N.times do
  name, number = gets.split
  phonebook[name] = number
end

while true
  input = gets
  break if input == nil
  arr << input.chomp
end

0.upto(arr.size-1) do |j|
  puts phonebook.has_key?(arr[j]) ? "#{arr[j]}=#{phonebook[arr[j]]}" : "Not found"
end