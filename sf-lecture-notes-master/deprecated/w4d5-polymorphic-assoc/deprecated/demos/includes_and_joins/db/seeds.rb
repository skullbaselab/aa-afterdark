User.destroy_all
Cat.destroy_all
CatLike.destroy_all

u1 = User.create!(name: "ned")
u2 = User.create!(name: "kush")

c1 = Cat.create!(name: 'gizmo', owner_id: u1.id)
c2 = Cat.create!(name: 'earl', owner_id: u1.id)
c3 = Cat.create!(name: 'breakfast', owner_id: u2.id)

u1.cat_likes.create!(cat_id: c1.id)
u2.cat_likes.create!(cat_id: c1.id)
u2.cat_likes.create!(cat_id: c2.id)
u2.cat_likes.create!(cat_id: c3.id)
