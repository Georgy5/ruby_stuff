# Step 3 - Shopping with fruit quantity and availability
store = {
  kiwi:   { price: 1.25, availability: 10 },
  mango:  { price: 4,    availability: 4 },
  banana: { price: 0.5,  availability: 10 },
  orange: { price: 1,    availability: 15 }
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
  store.each do |product, product_info|
    puts "#{product}: #{'%.2f' % product_info[:price]}€ (#{product_info[:availability]} available)"
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
    puts "> How many #{input}s would you like to add to your cart?"
    quantity = gets.chomp.to_i
    if quantity > store[input.to_sym][:availability]
      puts "> Sorry, there are only #{store[input.to_sym][:availability]} available."
    else
      cart[input.to_sym] += quantity
      store[input.to_sym][:availability] -= quantity
    end
  else
    puts "> Sorry, #{input} is not available today."
    puts '--------------------'
    show_available(store)
  end
end

# calculate bill and checkout
cart.each do |product, quantity|
  item_total = quantity * store[product][:price]
  puts "#{product}: #{quantity} X #{'%.2f' % store[product][:price]} = #{'%.2f' % item_total}€"
  total += item_total
end

checkout(total)