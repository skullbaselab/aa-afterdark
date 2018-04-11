# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  contact_id :integer          not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class ContactShare < ActiveRecord::Base
  belongs_to :contact
  belongs_to :user

  validates :contact, :user, presence: true # ensure contact and user exist in database
  # ^^ more robust than simply checking for contact_id and user_id
  validates :user_id, uniqueness: { scope: :contact_id } # ensure unique pair
end
