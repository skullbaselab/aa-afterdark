class Array

  def my_recursive_each(&prc)
    # base case
    # not returning the original array
    return self if empty?

    # leverage base case to solve on step away
    prc.call(first)
    drop(1).my_recursive_each(&prc)
  end

end

def fibs(n)
  # base case
  return [1, 1].take(n) if n <= 2

  # leverage base case to solve on step away
  prev_fibs = fibs(n - 1)
  # store recursive call in a variable
  prev_fibs + [prev_fibs[-2] + prev_fibs[-1]]
end

args_matey("argument 1", [1,2,3,4], {hash: 'is', last: 'argument'}, new: 'hash')
