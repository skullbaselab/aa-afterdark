class Board < ActiveRecord::Base

  belongs_to :company,
    class_name: :Company,
    primary_key: :id,
    foreign_key: :company_id

  has_many :memberships,
    class_name: :BoardMembership,
    primary_key: :id,
    foreign_key: :board_id

  has_many :members,
    through: :memberships,
    source: :member
end
