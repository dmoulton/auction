json.array!(@bids) do |json, bid|
  json.(bid, :amount, :name, :address, :phone, :email, :created_at, :item_name, :ip_address)
end