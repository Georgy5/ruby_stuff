def circle_are(radius)
  unless radius.negative?
    return Math::PI * radius**2
  else
    return 0
  end
end

puts circle_are(1)
puts circle_are(5)
puts circle_are(-1)