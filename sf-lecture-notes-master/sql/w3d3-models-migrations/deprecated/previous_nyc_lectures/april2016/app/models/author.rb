class Author < ActiveRecord::Base
  # belongs_to is a method that accepts:
    # 1: a symbol which is the name of the new method you're creating
    # 2: an options hash. We're passing it
      # class_name, to tell it which table to look through
      # primary_key, to tell it which column to search from
          # the associated table
      # foreign_key, to tell it which attribute to search by

  belongs_to(
    :country,
    class_name: 'Country',
    primary_key: :id,
    foreign_key: :country_id
  )

  # has_many also creates a method
  # options hash includes:
    # class_name, to tell it which table to look through
    # primary_key, to tell it which attribute to search by
    # foreign_key, to tell it which table to search from
      # the associated table

  has_many(
    :posts,
    class_name: 'Post',
    primary_key: :id, # <-- author.id
    foreign_key: :author_id
  )


end
