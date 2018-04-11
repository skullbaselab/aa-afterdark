require 'faker'

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def assess
    @score = rand(10)
    sleep(0.2)
  end

  def compare(other_cat)
    sleep(0.02)
  end
end

def cat_compatibility_algorithm(all_cats)
  before_assessment_time = Time.now # 1 step
  all_cats.each { |cat| cat.assess } # 1 step n times => n

  puts "Catssessments completed in #{(Time.now - before_assessment_time)}s" # 1 step
# nested loops indicate exponential growth in num steps
  before_compare_time = Time.now # 1 step
  all_cats.each do |cat_1| # outer loop happening n times
    all_cats.each do |cat_2| # inner loop also happening n times
      cat_1.compare(cat_2) # then this happens n * n times => n ^ 2
    end
  end

  puts "Catparisons completed in #{(Time.now - before_compare_time)}s"
  puts "\n\ncats 😹  will 😹  never 😹  love"
end

if __FILE__ == $PROGRAM_NAME
  cats = []
  20.times { cats << Cat.new(Faker::Cat.name) }

  puts "Today's candidates are: #{cats.map(&:name).join(', ')}"

  cat_compatibility_algorithm(cats)
end
