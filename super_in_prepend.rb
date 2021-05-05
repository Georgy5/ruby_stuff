SETTINGS = { silence: false }

module Husher
  def talk
    return "Hush" if SETTINGS[:silence]
    super
  end
end

class Dog < Animal
  prepend Husher
  def talk
    "bark bark"
  end
end

Dog.new.talk # => "bark bark"

SETTINGS[:silence] = true
Dog.new.talk # => "Hush"
