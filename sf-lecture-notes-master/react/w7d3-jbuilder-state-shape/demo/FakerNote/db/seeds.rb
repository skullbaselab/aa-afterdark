50.times do 
	User.create!(username: Faker::Internet.user_name, 
							 email: Faker::Internet.email, 
							 image_url: Faker::Avatar.image)
end

1_000.times do 
	Notebook.create!(author_id: rand(50), 
									 title: Faker::Book.title, 
									 description: Faker::ChuckNorris.fact)
end

10_000.times do
	Note.create!(notebook_id: rand(1_000), 
							 title: Faker::Company.catch_phrase, 
							 body: Faker::Hipster.paragraph(4, true, 2))
end

