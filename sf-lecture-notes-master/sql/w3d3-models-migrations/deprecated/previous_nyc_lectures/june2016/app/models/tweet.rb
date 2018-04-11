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
  validates(:body, :author_id, { presence: true })

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )
  # tweets have a foreign key of author_id


  # NB not belongs_to -> tweet doesn't have any foreign key pointing to country_id
  has_one(
    :country,
    through: :author,
    source: :country
  )
  # both the through and source associations must already exist
  # through: :author -> see line 16
  # source: :country -> see User model line 22
end

# save vs. save!
# if validations fail
  # save returns false (sometimes you want a true/false for control flow)
  # save! raises a RecordInvalid error
  # use save! unless you need the true/false value of save
