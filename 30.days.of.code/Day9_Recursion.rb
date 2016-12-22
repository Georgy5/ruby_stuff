# Enter your code here. Read input from STDIN. Print output to STDOUT
N = gets.chomp.to_i

def factorial(n)
    n == 0 ? 1 : n * factorial(n-1)
end
puts factorial(N)