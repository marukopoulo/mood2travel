json.array!(@items) do |item|
  json.extract! item, :title, :place, :time, :walker, :director, :video
  json.url item_url(item, format: :json)
end