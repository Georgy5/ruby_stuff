# Explaining Class.new:
# https://ruby-doc.org/core-2.5.3/Class.html#new-method
print `clear`

class MyClass
  def self.new(params) 
    new_instance = allocate
    puts "new_instance = "
    p new_instance
    puts "running the initialize instance method (that is private) in a hacker way"
    puts "this is going to trigger line 20"
    new_instance.send(:initialize, params) # https://ruby-doc.org/core-3.0.1/Object.html#send-method
    puts "after running initialize, it becomes"
    p new_instance
    puts "and then we return it. To save it on line 25 in a variable"
    return new_instance
  end
  
  def initialize(params)
    puts "That's why this runs after line 11 and before line 13"
		@params = params
  end
end

my_class = MyClass.new("lots of params")
p my_class

# TLDR
# Class.new allocates space in RAM for the new_instance, 
# calls #initialize on that instance (that's why we write the params in the instance.initialize, not on the Class.new)
# and returns the same new_instance
# https://stackoverflow.com/questions/16245315/does-ruby-call-initialize-method-automatically
