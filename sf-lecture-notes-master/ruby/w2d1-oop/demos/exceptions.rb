class PowerError < StandardError
end

begin
  puts 'Vegeta, what does the scouter say about his power level?'
  power_level = gets.chomp.to_i
  raise PowerError.new if power_level > 9000
rescue
  puts 'It\'s over 9000!'
  retry
ensure
  puts "Current Power Level: #{power_level}"
end
