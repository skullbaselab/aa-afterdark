# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  country_id :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates(:username, {presence: true, uniqueness: true})
  validates(:country_id, presence: true)
  # just a method: takes column name and options hash
  # can take an arbitrary number of column names
  # this runs when we try to save to the database
  # this is the first line of defense before a database constraint

  belongs_to :country, # this is the name of the method for the association
    class_name: "Country", # returns a Country object
    foreign_key: :country_id,
    primary_key: :id # this is what the foreign key references - pretty much always :id

  has_many :tweets,
    class_name: 'Tweet',
    foreign_key: :author_id,
    primary_key: :id

end
