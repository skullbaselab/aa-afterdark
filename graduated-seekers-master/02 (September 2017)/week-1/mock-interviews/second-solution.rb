def skyline(buildings)

  # find the max_x of all buildings
  max_x = buildings.max_by { |b| b[1] }[1]

  # create an array containing height information for every position
  # initialize it with [x,0] for every position up to max
  height_arr = []
  (max_x + 1).times do |i|
    height_arr << [i, 0]
  end

  # for each building go from its left to right coordinate and replace
  # the corresponding height info in our height_arr if greater
  buildings.each do |build|
    (build[0]..build[1]).each do |i|
      height_arr[i][1] = build[2] if build[2] > height_arr[i][1]
    end
  end

  # in order to output the skyline coordinates correctly we need to
  # consider drops in height to mean the LOWER number (see [7, 12])
  height_arr.each_with_index do |coord, i|
    next if i == 0
    height_arr[i-1][1] = coord[1] if coord[1] < height_arr[i-1][1]
  end

  p height_arr
  puts

  result = []

  # iterate over our height_arr and generate "key points"
  (0..height_arr.length-1).each do |i|

    # skipping until we hit our first building, as specified
    next if result.empty? && height_arr[i][1].zero?

    # if we have a height at x == 0 just register it
    if i == 0
      result << height_arr[i]
      next
    end

    # when we have a change in height we register it
    result << height_arr[i] if height_arr[i][1] != height_arr[i-1][1]

    # log the last point as zero, as specified
    result << [i, 0] if i == height_arr.length-1
  end

  result
end

p skyline([ [2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8] ]) == [[2, 10], [3, 15], [7, 12], [12, 0], [15, 10], [20, 8], [24, 0]]
