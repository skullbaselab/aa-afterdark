20.times do
  House.create!(address: Faker::Address.street_address,
                color: Faker::Commerce.color)
end

400.times do
  Person.create!(name: Faker::Name.name, house_id: rand(50) + 1)
end

2000.times do
  Cat.create!(name: Faker::Name.name,
              color: Faker::Commerce.color,
              person_id: rand(500) + 1)
end
