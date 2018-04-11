class Board < ApplicationRecord
  belongs_to :company,
    primary_key: :id,
    foreign_key: :company_id,
    class_name: 'Company',
    optional: true
  # HAVE TO DO THIS IN RAILS 5.
  # Rails 5 validates presence of company without it whenever we create
  # a new board that doesn't have a company.

  has_many :memberships,
    primary_key: :id,
    foreign_key: :board_id,
    class_name: 'BoardMembership'

  has_many :members,
    through: :memberships,
    source: :member

  has_one :exchange,
    through: :company,
    source: :exchange
end
