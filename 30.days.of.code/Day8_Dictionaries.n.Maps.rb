# Enter your code here. Read input from STDIN. Print output to STDOUT
phonebook = {}
arr = []

n = gets.strip.to_i
n.times do
  name, number = gets.split
  phonebook[name] = number
end

while true
  input = gets
  break if input == nil
  arr << input.chomp
end

0.upto(arr.size-1) do |j|
  if phonebook.has_key?(arr[j])
    puts "#{arr[j]}=#{phonebook[arr[j]]}" 
  else
    puts "Not found"
  end
end