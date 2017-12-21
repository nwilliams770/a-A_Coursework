json.pokemon @pokemon, :id, :name, :attack, :defense, :image_url, :moves
json.items @pokemon.items, :id, :name, :pokemon_id, :price, :happiness, :image_url
