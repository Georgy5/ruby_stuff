# Enter your code here. Read input from STDIN. Print output to STDOUT
t = gets.chomp.to_i

def is_prime?(x)
  return false if x % 2 == 0 and x > 2 
  max = Math.sqrt(x+1)
  i = 3
  while i < max
    return false if x % i == 0
    i += 2
  end
  return x > 1
end

t.times do
  n = gets.to_i
  is_prime?(n) ? (puts 'Prime') : (puts 'Not prime')
end