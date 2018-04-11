# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Country.destroy_all
argentina = Country.create!(name: "Argentina")
usa = Country.create!(name: "USA")
dogland = Country.create!(name: "Dog land")
chicago = Country.create!(name: "Belgium")
catzastan = Country.create!(name: "Catzastan")

User.destroy_all
tommy = User.create!(username: "tommypickles", country_id: argentina.id)
fred = User.create!(username: "fredastaire", country_id: usa.id)
leen = User.create!(username: "leenmachine", country_id: chicago.id)
daniel = User.create!(username: "danielcraig", country_id: usa.id)
gigi = User.create!(username: "gigibuffon", country_id: usa.id)
patrick = User.create!(username: "isthisthekrustykrab", country_id: usa.id)
maurice = User.create!(username: "mauricecheeks", country_id: usa.id)
kurstie = User.create!(username: "kurstienotalley", country_id: usa.id)
oscar = User.create!(username: "therealoscarisaac", country_id: usa.id)
sennacy = User.create!(username: "sennacythegreatandpowerful", country_id: catzastan.id)
paprika = User.create!(username: "paprikathecat", country_id: catzastan.id)
ella = User.create!(username: "ellathedog", country_id: dogland.id)
luna = User.create!(username: "lunathedog", country_id: dogland.id)
