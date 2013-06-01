class Item < ActiveRecord::Base
  attr_accessible :description, :image_url, :min_bid, :min_increment, :name, :artist, :size, :order

  has_many :bids

  def to_builder
    Jbuilder.new do |item|
      item.name name
      item.description description
      item.artist artist
      item.image_url image_url
      item.min_bid min_bid
      item.min_increment min_increment
      item.max_bid max_bid
      item.num_bids num_bids
    end
  end

  def max_bid
    begin
      b = bids.order("amount DESC").first.amount
    rescue Exception=>e
      b = min_bid
    end

    b
  end

  def top_two
    begin
      mybids = bids.order("amount DESC").limit(2)

    rescue   Exception=>e
      mybids = [Bid.new,Bid.new]
    end

    mybids
  end

  def num_bids
    bids.size
  end
end
