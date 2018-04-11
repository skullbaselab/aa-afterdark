- Switch to polymorphic/no_concerns branch

- Inverse_of
  - Do example from:
    - c = Customer.first
    - o = c.orders.first
    - c.first_name == o.customer.first_name # => true
    - c.first_name = 'Manny'
    - c.first_name == o.customer.first_name # => false
  - When two objects are in memory but haven't necessarily been updated in database


- Feed_ids =
  - Show user validates presence of feed
  - Show join table (subscriptions)
  - Show feed table


- Polymorphic
  - Show code for sword on polymorphic/no_concerns branch.
    - Point out swordable_type, swordable_id.
    - Swordable_id is a foreign key...to what?
    - Validating inclusion in: restricts what it can belong to.
  - "Able" name
    - Real Life Examples:
      - Pairs are "shuffleable" because you can shuffle them.
      - Cards are "shuffleable"
      - Teddy bears are "loveable"
      - Significant others are "loveable"
    - "Able to be BLANKed."
  - How do I actually "do" a polymorphic association?
    - Create minions
      - validates :minionable_type, :minionable_id, presence: true

      - belongs_to :minionable, polymorphic: true
- Concerns
  - Walk through with minions
    - Goes in "concerns" folder in models
    - extend ActiveSupport::Concern
    - included do
  - Show completed samurai and ninja.
  - Why do we do concerns and not class inheritance?
    - Maybe we only want some of the methods. E.g., low_ids but not a has_many relation.

- Doctor
  - https://github.com/appacademy/lecture-notes/blob/master/src/rails/polymorphic_and_concerns/rails_doctor.md
- ?'s
