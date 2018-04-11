def check_excitement
  puts "How excited are you for Game of Thrones to start (1-10)"
  input = gets.chomp.to_i
  raise ArgumentError.new("Uhhh, what?") unless input == 10
rescue StandardError => e
  retry
end

check_excitement

