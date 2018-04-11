def expect_eq(value, expected)
  if value == expected
    puts "Passed with expected value: #{value.inspect}"
  else
    puts "*** Failed: expected #{expected.inspect}, but got #{value.inspect} ***"
  end
end

# EXERCISE 1

def sum_to(n)
  return nil if n < 1
  return n if n == 1

  n + sum_to(n - 1)
end

# Test Cases:
expect_eq(sum_to(5), 15)
expect_eq(sum_to(1), 1)
expect_eq(sum_to(9), 45)
expect_eq(sum_to(-8), nil)

# EXERCISE 2

def add_numbers(arr)
  return arr.first if arr.length <= 1

  arr[0] + add_numbers(arr.drop(1))
end

# Test Cases:
expect_eq(add_numbers([1,2,3,4]), 10)
expect_eq(add_numbers([3]), 3)
expect_eq(add_numbers([-80,34,7]), -39)
expect_eq(add_numbers([]), nil)

# EXERCISE 3

def gamma_fnc(num)
  return nil if num < 1
  return 1 if num == 1

  (num - 1) * gamma_fnc(num - 1)
end

# num = 4
# 3 * 2
# num = 3
# 2 * 1
# num = 2
# 1 * 1
# num = 1

# Test Cases:
expect_eq(gamma_fnc(0), nil)
expect_eq(gamma_fnc(1), 1)
expect_eq(gamma_fnc(4), 6)
expect_eq(gamma_fnc(8), 5040)
