# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  username    :string           not null
#  created_at  :datetime
#  updated_at  :datetime
#  location_id :integer          default("1"), not null
#

class User < ActiveRecord::Base
  validates(:username, presence: true)

  belongs_to( #belongs_to is a class method that creates an instance method
    :location, # instance method name; can name this method what you want, but best to follow convention
    {
      class_name: "Location", #options hash
      primary_key: :id,
      foreign_key: :location_id
    })

    #belongs to is always used when the foreign key exists in that model/table

  has_many :tweets,
      class_name: "Tweet",
      primary_key: :id,
      foreign_key: :author_id

end
