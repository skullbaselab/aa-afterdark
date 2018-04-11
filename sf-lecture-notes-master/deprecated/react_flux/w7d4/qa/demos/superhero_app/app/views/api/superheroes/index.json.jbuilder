# json.array! @superheroes, :id, :name, :power_level
#
@superheroes.each do |superhero|
  json.set! superhero.id do
    json.partial! 'api/superheroes/superhero', superhero: superhero
  end
end


