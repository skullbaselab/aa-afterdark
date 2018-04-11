# require 'faker'

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def assess
    @score = rand(10)
    sleep(0.5)
  end

  def compare(other_cat)
    sleep(0.05)
  end
end

def cat_compatibility_algorithm(all_cats)
  before_assessment_time = Time.now
  # n time complexity
  all_cats.each { |cat| cat.assess }

  puts "Catssessments completed in #{(Time.now - before_assessment_time)}s"
  # n^2 time complexity
  before_compare_time = Time.now
  all_cats.each_with_index do |cat_1, i|
    next if i == self.length - 1
    all_cats[(i + 1)...(all_cats.length)].each do |cat_2|
      next if cat_1 == cat_2 # makes this time complexity be n^2 - n
      cat_1.compare(cat_2)
    end
  end

  puts "Catparisons completed in #{(Time.now - before_compare_time)}s"
  puts "\n\ncats 😹  will 😹  never 😹  love"
end

cats = []
cat_names = ['breakfast', 'tony', 'markov', 'sennacy', 'jack bauer']
100.times do
  cats << Cat.new(cat_names.sample)
  # cats << Cat.new(Faker::Cat.name)
end



print "Today's candidates are: "
p cats.map(&:name)
print "\n"

cat_compatibility_algorithm(cats)
