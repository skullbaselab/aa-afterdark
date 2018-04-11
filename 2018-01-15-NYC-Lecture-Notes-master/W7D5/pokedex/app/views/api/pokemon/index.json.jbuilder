@pokemon.each do |poke|
  json.set! poke.id do
    json.extract! poke, :id, :name
    # asset_path searches all of assets/
    # image_path searches specifically in assets/images/
    json.image_url image_path(poke.image_url)
    json.moves []
    json.item_ids []
  end
end
