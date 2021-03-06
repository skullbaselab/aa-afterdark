class Pokemon < ActiveRecord::Base
  TYPES = [
    "fire",
    "electric",
    "normal",
    "ghost",
    "psychic",
    "water",
    "bug",
    "dragon",
    "grass",
    "fighting",
    "ice",
    "flying",
    "poison",
    "ground",
    "rock",
    "steel"
  ].sort

  has_many :items

  validates :attack, :defense, :image_url, :name, :poke_type, presence: true
  validates :attack, :defense, numericality: true
  validates :poke_type, inclusion: { in: TYPES }

  def items_hash
    items_hash = {}
    items.each { |item| items_hash[item.id] = item }
    items_hash
  end

end
