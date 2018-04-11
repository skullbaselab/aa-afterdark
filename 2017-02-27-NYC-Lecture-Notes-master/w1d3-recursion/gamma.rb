def factorial(n)
  return 1 if n == 0 || n == 1

  return n * factorial(n - 1)
end

def gamma_fnc(n)
  return nil if n == 0
  return 1 if n == 1

  factorial(n - 1)
end

puts gamma_fnc(0) == nil # => returns nil
puts gamma_fnc(1) == 1 # => returns 1
puts gamma_fnc(4) == 6 # => returns 6
puts gamma_fnc(8) == 5040 # => returns 5040
