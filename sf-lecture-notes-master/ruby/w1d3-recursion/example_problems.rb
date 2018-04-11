# def iter_sum(n)
#   sum = 0

#   (1..n).each do |num|
#     sum += num
#   end

#   sum
# end

# p iter_sum(1)
# p iter_sum(2)
# p iter_sum(3)
# p iter_sum(4)

# def rec_sum(n)
#   return 1 if n == 1
#   return nil if n < 1

#   rec_sum(n - 1) + n
# end

# p rec_sum(1)
# p rec_sum(2)
# p rec_sum(3)
# p rec_sum(4)


# def cons_nums(n)
#   nums = []

#   (1..n).each do |num|
#     nums << num
#   end

#   nums
# end

# def cons_nums(n)
#   return nil if n < 1
#   return [1] if n == 1

#   cons_nums(n - 1) << n
# end

# p cons_nums(1)
# p cons_nums(2)
# p cons_nums(3)
# p cons_nums(4)

def pascal(row)
  return [1] if row == 0

  new_row = [1]
  prev_row = pascal(row - 1)
  # memoization
  prev_row.each_index do |idx|
    if idx < prev_row.length - 1
      new_row << prev_row[idx] + prev_row[idx + 1]
    end
  end

  new_row << 1
end

# 10.times do |i|
#   p pascal(i)
# end

p pascal(2000)
