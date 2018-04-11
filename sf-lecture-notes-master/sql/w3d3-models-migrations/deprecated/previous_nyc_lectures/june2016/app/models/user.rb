# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  country_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  # Naming matters!
  # table -> plural, model -> singular, model filename -> singular
  # Rails knows how to pluralize (mostly)

  validates :name, presence: true, uniqueness: true
  # model validations run before it ever hits the database
  # database constraints just in case

  belongs_to(
    :country,
    class_name: "Country",
    foreign_key: :country_id,
    primary_key: :id
  )
  # users has a foreign_key of country_id -> use belongs_to
  # belongs_to -> foreign key is in MY table

  has_many(
    :tweets,
    class_name: "Tweet",
    foreign_key: :author_id,
    primary_key: :id
  )
  # has_many -> foreign key is in the other table
end
