#!/bin/ruby

N = gets.strip.to_i


if N.odd?
  print "Weird"
elsif ((2..5).include?(N) and N.even?)
  print "Not Weird"
elsif ((6..20).include?(N) and N.even?)
  print "Weird"
elsif (N>20 and N.even?)
  print "Not Weird"
end
  