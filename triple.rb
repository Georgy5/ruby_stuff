# A script to print some Pythagorean triples.

1.upto(100) do |c|
  1.upto(c) do |b|
    1.upto(b) do |a|
      puts "(#{a},#{b},#{c})" if a * a + b * b == c * c
    end
  end
end
