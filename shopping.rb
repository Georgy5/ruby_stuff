# Step 1 - Dumb shopping
store = {
  kiwi: 1.25,
  banana: 0.5,
  mango: 4,
  orange: 9
}

cart = []
total = 0

def welcome
  puts '-----------------------------'
  puts "Welcome to Karl's Fruit Store"
  puts '-----------------------------'
end

def show_availale(store)
  puts 'In our store today:'
  store.each do |item, price|
    puts "#{item}: #{'%.2f' % price}€"
  end
  puts '-----------------------------'
end

def checkout(cost)
  puts '------------BILL-------------'
  puts "Total: #{'%.2f' % cost}€"
  puts '-----------------------------'
end

def calculate_bill(cart, store, total)
  cart.each do |item|
    total += store[item.to_sym]
  end
  return total
end

# interface
welcome
show_availale(store)

# interface loop
input = ''
while input
  puts "> Which item?"
  input = gets.chomp.downcase
  if input == 'quit'
    cost = calculate_bill(cart, store, total)
    p cost
    checkout(cost)
    break
  end
  # check user input
  if store.include?(input.to_sym)
    cart.append(input)
    puts "#{input.capitalize} added to cart"
  else
    puts "> Sorry, no #{input} in store."
    puts '-----------------------------'
    show_availale(store)
  end
end
