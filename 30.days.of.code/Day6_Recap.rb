# Enter your code here. Read input from STDIN. Print output to STDOUT
def hack(s)
  even_a = Array.new
  odd_a = Array.new
  
  l = s.length - 1
  0.upto(l).each do |i|
    if i.even?
      even_a << s[i]
    else
      odd_a << s[i]
    end
  end
  puts even_a.join() + " " + odd_a.join()
end

gets.to_i.times do
  arr = gets.strip
  hack(arr)
end