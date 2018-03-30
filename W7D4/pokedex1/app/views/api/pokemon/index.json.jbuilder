@pokemon.each do |pokeman|
    json.set! pokeman.id do
      json.extract! pokeman, :id, :name
      json.image_url asset_path(pokeman.image_url)
    end
end
