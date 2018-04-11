require 'faker'

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def assess
    @score = rand(10)
    sleep(0.5) # potential bottleneck! supes slow... but not as implemented below :)
  end

  def compare(other_cat)
    sleep(0.05)
  end
end

def cat_compatibility_algorithm(all_cats) # overall time complexity: O(n^2)
  before_assessment_time = Time.now
  all_cats.each { |cat| cat.assess } # O(n) - one op per element

  puts "Catssessments completed in #{(Time.now - before_assessment_time)}s"

  before_compare_time = Time.now
  all_cats.each do |cat_1| # O(n^2) => our REAL bottleneck - n ops per element
    all_cats.each do |cat_2|
      next if cat_1 == cat_2 # micro-optimization; doesn't affect big O
      cat_1.compare(cat_2)
    end
  end

  puts "Catparisons completed in #{(Time.now - before_compare_time)}s"
  puts "\n\ncats 😹  will 😹  never 😹  love"
end

cats = []
100.times do
  cats << Cat.new(Faker::Cat.name)
end

print "Today's candidates are: "
p cats.map(&:name)
print "\n"

cat_compatibility_algorithm(cats)
