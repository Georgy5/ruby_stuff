class Gear
  attr_reader :chainring, :cog, :wheel

  # using keyword arguments
  def initialize(chainring:, cog:, wheel:)
    @chainring  = chainring
    @cog        = cog
    @wheel      = wheel
  end

  def ratio
    chainring / cog.to_f
  end

 def gear_inches
   ratio * wheel.diameter
 end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim        = rim
    @tire       = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

# passing keyword arguments as a hash
puts Gear.new(
        wheel:      Wheel.new(26, 1.5),
        chainring:  52, 
        cog:        11).gear_inches
