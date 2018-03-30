json.pokemon do
  json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type
  json.image_url asset_path(@pokemon.image_url)
  json.item_ids @pokemon.item_ids
end

# json.items do
#   json.set! @pokemon.item[id] do
#     json.extract! @pokemon.item_id, :id, :name
#   end
# end

@pokemon.items.each do |item|
  json.items do
    json.set! item.id do
      json.extract! item, :id, :name, :pokemon_id, :price, :happiness
      json.image_url asset_path(item.image_url)
    end
  end
end
