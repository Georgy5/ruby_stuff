
words = []


while true
	you = gets.chomp
	
	if you != ''
		words.push you
	elsif you == ''
		break
	end
	
end

words.sort!
words.each do |word|
	puts word
end