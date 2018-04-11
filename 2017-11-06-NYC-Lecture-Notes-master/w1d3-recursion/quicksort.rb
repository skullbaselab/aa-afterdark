def quicksort(arr)
  return arr if arr.length <= 1

  pivot = arr.pop
  left = arr.select { |el| el < pivot }
  right = arr.select { |el| el >= pivot }

  quicksort(left) + [pivot] + quicksort(right)
end
