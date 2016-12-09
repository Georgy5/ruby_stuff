
numerals = []

def old_roman_numerals num
	if num >= 1000
		print 'M' * (num / 1000)
		num = num % 1000
	end
	if num >= 500
		print 'D' * (num / 500)
		num = num % 500
	end
	if num >= 100
		print 'C' * (num / 100)
		num = num % 100
	end
	if num >= 50
		print 'L' * (num / 50)
		num = num % 50
	end
	if num >= 10
		print 'X' * (num / 10)
		num = num % 10
	end
	if num >= 5
		print 'V' * (num / 5)
		num = num % 5
	end
	if num >= 1
		print 'I' * (num / 1)
		num = num % 1
	end
end


old_roman_numerals 5533
puts
old_roman_numerals 19
puts
old_roman_numerals 13
puts
old_roman_numerals 333