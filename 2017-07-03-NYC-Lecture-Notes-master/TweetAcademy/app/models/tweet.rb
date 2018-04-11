# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :string           not null
#

class Tweet < ApplicationRecord
  validates :author, :body, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User
end
