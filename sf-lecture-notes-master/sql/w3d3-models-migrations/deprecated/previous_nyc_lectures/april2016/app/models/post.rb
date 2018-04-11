class Post < ActiveRecord::Base

  belongs_to(
    :author,
    class_name: 'Author',
    primary_key: :id,
    foreign_key: :author_id
  )

  has_one(
    :country,
    through: :author,
    source: :country
  )
end
