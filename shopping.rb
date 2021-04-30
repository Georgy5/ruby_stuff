# Step 2 - shopping
store = {
  kiwi: 1.25,
  banana: 0.5,
  mango: 4,
  orange: 9
}

cart = Hash.new(0)
total = 0

def welcome
  puts '-----------------------------'
  puts "Welcome to Karl's Fruit Store"
  puts '-----------------------------'
end

def show_available(store)
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

# interface
welcome
show_available(store)

# interface loop
input = ''
until input.downcase == 'quit'
  puts "> Which item?"
  input = gets.chomp.downcase
  if store.key?(input.to_sym)
    puts "How many #{input}s would you like to add to your cart?"
    quantity = gets.chomp.to_i
    quantity += cart[input.to_sym]
    cart[input.to_sym] = quantity
  else
    puts "Sorry, #{input} is not available today."
    puts '--------------------'
    show_available(store)
  end
end
# calculate bill and checkout
cart.each do |product, quantity|
  item_total = quantity * store[product]
  puts "#{product}: #{quantity} X #{'%.2f' % store[product]} = #{'%.2f' % item_total}€"
  total += item_total
end
checkout(total)
