mealCost = gets.chomp.to_f
tipPercent = gets.chomp.to_i
taxPercent = gets.chomp.to_i

totalCost = mealCost + (mealCost*(tipPercent.to_f/100)) + (mealCost*(taxPercent.to_f/100))
puts "The total meal cost is #{totalCost.round.to_s} dollars."