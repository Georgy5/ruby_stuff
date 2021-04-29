h = {
  'a' => '0',
  'b' => '1',
  'c' => '3',
}
# =>  {"a"=>"0", "b"=>"1", "c"=>"3"}

['a', 'c'].sum('', &h)
# => "03"

# Explain the &h
# & in argument position converts its argumnet into a proc and
# passes it as a block argument to the function.

# another way to think about it is that 
# .foo(..., &thing) is (almost)
# .foo(...) { |*a, **k| h.call(*a, **k) }

# Objects that respond to to_proc can be converted to procs with the & operator
# (which will also allow them to be passed as blocks).


# :+.to_proc performs addition, for a hash it looks up the argument
# and returns the corresponding value.
