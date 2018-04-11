# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  body       :string           not null
#  author_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Tweet < ActiveRecord::Base

  validates :body, :author_id, presence: true

  belongs_to :author,
    class_name: 'User',
    foreign_key: :author_id,
    primary_key: :id

  has_one :country,
    through: :author, # use the association written above
    source: :country # use the association in the class you're getting this through

end
