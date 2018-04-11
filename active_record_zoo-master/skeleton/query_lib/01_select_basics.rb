# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

def example_country_count
  Country.all.count
end

def select_population_of_germany
  #Show the population of germany
  
end

def per_capita_gdp
  # Show the name and per capita gdp (gdp/population) for each country where
  # the area is over 5,000,000 km^2

end

def small_and_wealthy
  # Show the name and continent of countries where the area is less than 2,000
  # and the gdp is more than 5,000,000,000.
end

def scandinavia
  # Show the name and the population for 'Denmark', 'Finland', 'Norway', and
  # 'Sweden'

end

def starts_with_g
  # Show each country that begins with the letter G

end

def just_the_right_size
  # Show the country and the area in 1000's of square kilometers for countries
  # with an area between 200,000 and 250,000.
  # BETWEEN allows range checking - note that it is inclusive.

end
