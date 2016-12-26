def find_factorial_loop (number)
	total = number
	if total != 0
		while number >= 2
			number -= 1
			total *= number
		end
			total
	else
		1 # Return 1 because factor of 0 is 1
	end
end


def find_factorial_recursive (number)
	if number == 1 or number == 0
		1
	else
		total = find_factorial_recursive(number - 1) * number
	end
end


def factorial(n)
    n == 0 ? 1 : n * factorial(n-1)
end



print "Factorial Finder\n\n"
print "Enter the number:"
number = gets.strip.to_i
puts find_factorial_loop(number)
puts find_factorial_recursive(number)
puts factorial(number)