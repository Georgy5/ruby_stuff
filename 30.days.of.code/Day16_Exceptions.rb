#!/bin/ruby

S = gets.strip

begin
  puts S.match(/\d+/)[0]	# OR  puts(Integer(S))
rescue
  puts "Bad String"
end 