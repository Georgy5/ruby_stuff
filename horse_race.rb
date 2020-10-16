horses = ["Lucky", "Peño", "Flash", "George"]
# INDEX      0        1       2        3
## 1 - Lucky
## 2 - Lapeño
## 3 - Flash
## 4 - George
puts "Welcome to the horse race!!"
# Ask the user to choose a horse to bet on (number)
horses.each_with_index do |horse, index|
  puts "#{index + 1} - #{horse}"
end
puts "Which number horse would you like to bet on?"
bet_index = gets.chomp.to_i - 1
puts "You chose #{horses[bet_index]}"
# Begin the race and choose a horse at random to win
puts "The race is about to begin!"
sleep(1)
first_announcement = horses.sample
puts "#{first_announcement} is in the lead!"
sleep(1)
second_announcement = horses.sample
if first_announcement == second_announcement
  puts "#{first_announcement} is dominating this race!"
else
  puts "Now #{second_announcement} is in the lead!"
end
sleep(1)
puts "The race is done!"
winning_horse_index = rand(0...horses.length)
# Announce the result and whether user wins or not
if bet_index == winning_horse_index
  puts "You win!!! #{horses[winning_horse_index]} won!"
else
  puts "You lose!! #{horses[winning_horse_index]} won! Sorry."
end
