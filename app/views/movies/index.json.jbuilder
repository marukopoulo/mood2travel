json.array!(@movies) do |movie|
  json.extract! movie, :videoId, :youtubeID, :city, :country, :hour, :minute, :director, :directorUrl, :walker, :walkerUrl
  json.url movie_url(movie, format: :json)
end