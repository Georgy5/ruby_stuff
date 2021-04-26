# TIL 26.04.2021
p [1,1,1,2,2,3,4].chunk(&:itself).map(&:first)


# chunk{_1}.map{|x,|x}
p [1,1,1,2,2,3,4].chunk(&:itself).map{|x,| x}

# |x,| - the comma tells ruby to unpack the array and
# only use the first argument as x
