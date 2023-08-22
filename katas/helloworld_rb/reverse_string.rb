def reverse_string(str)
    raise ArgumentError, "Input must be a string" if str == nil
    str.reverse
end