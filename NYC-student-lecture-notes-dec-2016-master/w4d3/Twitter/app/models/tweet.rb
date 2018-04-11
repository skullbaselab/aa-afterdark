# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  body       :string           not null
#  created_at :datetime
#  updated_at :datetime
#  author_id  :integer          default("1"), not null
#   ^^ foreign key to users table, use includes to combat N + 1 query

class Tweet < ActiveRecord::Base
  validates :body, presence: true

  belongs_to :author,
    class_name: "User",
    primary_key: :id,
    foreign_key: :author_id

  has_one :location,
    through: :author,
    source: :location

  #all through associations are "has" because the foreign_key for that association
  # always exists in another table

end
