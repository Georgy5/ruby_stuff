OLD_DIVIDERS = [1000, 500, 100, 50, 10, 5, 1]
OLD_CHAR = ["M", "D", "C", "L", "X", "V", "I"]

NEW_DIVIDERS = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
NEW_CHAR = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

def old_roman_numeral num
	numerals = ''
	if num >= 1000
		numerals << 'M' * (num / 1000)
		num = num % 1000
	end
	if num >= 500
		numerals << 'D' * (num / 500)
		num = num % 500
	end
	if num >= 100
		numerals << 'C' * (num / 100)
		num = num % 100
	end
	if num >= 50
		numerals << 'L' * (num / 50)
		num = num % 50
	end
	if num >= 10
		numerals << 'X' * (num / 10)
		num = num % 10
	end
	if num >= 5
		numerals << 'V' * (num / 5)
		num = num % 5
	end
	if num >= 1
		numerals << 'I' * (num / 1)
		num = num % 1
	end
	return numerals
end

puts old_roman_numeral 5533
puts old_roman_numeral 19
puts old_roman_numeral 13
puts  old_roman_numeral 333

p "Enter the number you want to convert to an old roman numeral: "
puts old_roman_numeral(gets.chomp.to_i)

def new_roman_numeral(an_integer)
  roman_numeral = ""
  NEW_DIVIDERS.each_with_index do |divider, index|
    t = an_integer / divider
    t.times do
      roman_numeral << NEW_CHAR[index]
    end
    an_integer = an_integer % divider
  end
  return roman_numeral
end

p "Enter the number you want to convert to a new roman numeral: "
puts new_roman_numeral(gets.chomp.to_i)
