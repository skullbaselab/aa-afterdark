module Swordable
  extend ActiveSupport::Concern

  included do
    has_many :swords, as: :swordable
  end

  module ClassMethods
    def low_id
      where("id < 5")
    end
  end

  def sword_sizes
    swords.map(&:size) 
  end
end
