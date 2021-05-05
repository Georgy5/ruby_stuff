# Another pattern you can use is the “super block”. Devise uses that to allow
# overriding some if its actions yet keep its ability to allow guarding the
# method. This requires all subclasses to write their overwritten methods a
# bit differently, though

SETTINGS = { silence: false }

class Animal
  def talk
    return "Hush" if SETTINGS[:silence]

    if block_given?
      yield
    else
      "???"
    end
  end
end

class Snake < Animal
end

class Dog < Animal
  def talk
    super do
      "bark bark"
    end
  end
end

Dog.new.talk # => "bark bark"
Snake.new.talk # => "???"

SETTINGS[:silence] = true
Dog.new.talk # => "Hush"
Snake.new.talk # => "Hush"
