n = 99
bottles = lambda {|n| n == 1 ? "#{n} bottle" : "#{n} bottles"}

while n>1 do
	puts "#{bottles[n]} of beer on the wall, #{bottles[n]} of beer."
	n-=1
	puts "Take one down, pass it around, #{bottles[n]} of beer on the wall"
end
puts "1 bottle of beer on the wall, 1 bottle of beer."
puts "Take one down, pass it around, no more bottles of beer on the wall"


#bottles = lambda {|n| n == 1 ? "#{n} bottle" : "#{n} bottles"}

#99.downto 1 do |n|
#	puts "#{bottles[n]} of beer on the wall
#	#{bottles[n]} of beer 
#	Take one down, pass it around
#	#{bottles[n-1]} of beer on the wall"
#end