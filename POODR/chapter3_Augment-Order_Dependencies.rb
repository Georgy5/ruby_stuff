class Gear
  attr_reader :chainring, :cog, :wheel

  # keyword arguments with defined defaults
  def initialize(chainring: 40, cog: 18, wheel:)
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

puts Gear.new(wheel: Wheel.new(26, 1.5)).chainring

puts Gear.new(
        wheel:      Wheel.new(26, 1.5),
        chainring:  52, 
        cog:        11).chainring
