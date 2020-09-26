# A script to write the Fibonacci numbers up to and including 
# the first commandline argument.

n = ARGV[0].to_i

a, b = 0, 1
while b <= n
  puts "#{b} "
  a, b = b, a+b
end
