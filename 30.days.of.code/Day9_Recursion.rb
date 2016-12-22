# Enter your code here. Read input from STDIN. Print output to STDOUT
N = gets.chomp.to_i

def factorial(n)
    if n == 0
        1
    else
        n * factorial(n-1)
    end
end

puts factorial(N)