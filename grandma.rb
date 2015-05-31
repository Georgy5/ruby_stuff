
while true
	puts you = gets.chomp
	
	if you == you.upcase
		puts "NO, NOT SINCE 19#{rand(50)}"
	else
		puts "HUH?!		SPEAK UP, SONNY!"
	end
	
	if you == 'BYE'
		break
	end
end