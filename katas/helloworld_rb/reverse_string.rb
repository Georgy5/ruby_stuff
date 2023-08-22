def reverse_string(str)
    raise ArgumentError, "Input must be a string" unless str.is_a?(String)
    str.reverse
end
