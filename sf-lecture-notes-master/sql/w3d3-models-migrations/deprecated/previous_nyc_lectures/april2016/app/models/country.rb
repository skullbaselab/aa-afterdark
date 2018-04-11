# filename is singular snake_case
# class name is singular SnakeCase
class Country < ActiveRecord::Base

  has_many(
    :authors,
    class_name: 'Author',
    primary_key: :id,
    foreign_key: :country_id
  )

  # has_many :through
  # options hash accepts:
    # through, the association in its own class it can use
    # source, the assocation in the through class which directs
      # it to to goal

  # the through and source associations must be defined FIRST
  # write the reverse with has_one

  has_many(
    :posts,
    through: :authors,
    source: :posts
  )




  def newest_author
    self.authors.order(:created_at).first
  end

  def name_twice
    name * 2 # good
    # @name * 2 # BAD
    self.name * 2 # good
  end

  # some fun methods from ActiveRecord::Base:
  # ::all
  # ::find (find by id)
  # ::where (returns a group)
  # ::find_by (returns just one instance)

  #  #save (saves to database, returns true on success, false on failure)
  #  #save! (saves to database, raises error on failure)
      # useful to have an error
  #  #first (queries database using LIMIT 1)



end
