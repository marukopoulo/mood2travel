json.array!(@favs) do |fav|
  json.extract! fav, :user_id, :movie_id, :value
  json.url fav_url(fav, format: :json)
end