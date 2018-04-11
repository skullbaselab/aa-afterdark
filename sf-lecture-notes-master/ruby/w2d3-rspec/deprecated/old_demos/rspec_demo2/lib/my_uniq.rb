def my_uniq(arr)
  [].tap do |new_arr|
    arr.each do |el|
      new_arr << el unless new_arr.include?(el)
    end
  end
end