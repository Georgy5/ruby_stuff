# Enter your code here. Read input from STDIN. Print output to STDOUT
aD, aM, aY = gets.strip.split(" ").map(&:to_i)
eD, eM, eY = gets.strip.split(" ").map(&:to_i)

fine = 0

if aY == eY
  if aM > eM
    fine = (aM - eM) * 500
  elsif aD > eD
    fine = (aD - eD) * 15
  end
elsif aY > eY
  fine = 10000
end

puts fine