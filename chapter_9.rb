OLD_DIVIDERS = [1000, 500, 100, 50, 10, 5, 1]
OLD_CHAR = ["M", "D", "C", "L", "X", "V", "I"]

NEW_DIVIDERS = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
NEW_CHAR = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

def old_roman_numeral(number)
  roman_numeral = ""
  OLD_DIVIDERS.each_with_index do |divider, index|
    t = number / divider
    t.times do
      roman_numeral << OLD_CHAR[index]
    end
    number = number % divider
  end
  return roman_numeral
end

p "Enter the number you want to convert to an old roman numeral:"
puts old_roman_numeral(gets.chomp.to_i)

def new_roman_numeral(number)
  roman_numeral = ""
  NEW_DIVIDERS.each_with_index do |divider, index|
    t = number / divider
    t.times do
      roman_numeral << NEW_CHAR[index]
    end
    number = number % divider
  end
  return roman_numeral
end

p "Enter the number you want to convert to a new roman numeral:"
puts new_roman_numeral(gets.chomp.to_i)
