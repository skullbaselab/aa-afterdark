class Superhero < ActiveRecord::Base
  validates :name, :secret_identity, :power, presence: true

  def as_json(options={})
    { superhero_name: name, power: power }
  end
end
