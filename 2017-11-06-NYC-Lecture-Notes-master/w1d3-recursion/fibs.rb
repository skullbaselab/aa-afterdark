def first_n_fibs(n)
  return [0, 1].take(n) if n <= 2

  prev_fibs = first_n_fibs(n-1)
  first_to_last = prev_fibs[-1]
  second_to_last = prev_fibs[-2]

  prev_fibs << first_to_last + second_to_last
end

p  first_n_fibs(8)
# => [0, 1, 1, 2, 3, 5, 8, 13]
