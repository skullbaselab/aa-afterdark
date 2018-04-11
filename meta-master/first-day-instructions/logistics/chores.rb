# Trash Out: Sun/Tue/Thu
# Trash In: Mon/Wed/Fri
# Dishes: Every day.

require "active_support/core_ext"

start_date = Date.parse(gets.chomp)

names = readlines.map(&:chomp!).select(&:present?)
names = names.shuffle

14.times do
  if start_date.sunday? || start_date.tuesday? || start_date.thursday?
    puts "#{start_date}\tGARBAGE OUT\t#{names.pop}"
  end

  if start_date.monday? || start_date.wednesday? || start_date.friday?
    puts "#{start_date}\tGARBAGE IN\t#{names.pop}"
  end

  puts "#{start_date}\tDISHES\t#{names.pop}"

  start_date += 1
end
