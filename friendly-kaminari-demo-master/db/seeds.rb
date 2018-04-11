1000.times do |dog|
  Dog.create!(:name => dog.to_s, :age => dog)
end

Dog.create!(:name => "Apollo", :age => 4)
