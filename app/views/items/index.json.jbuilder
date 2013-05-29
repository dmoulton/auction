json.array!(@items) do |json, item|
  json.(item, :id, :name, :artist, :description, :image_url, :min_bid, :min_increment, :max_bid, :num_bids)
end