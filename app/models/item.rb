class Item < ActiveRecord::Base
  attr_accessible :description, :image_url, :min_bid, :min_increment, :name

  has_many :bids

  def to_builder
    Jbuilder.new do |item|
      item.name name
      item.description description
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
    rescue
      b = min_bid
    end

    b
  end

  def top_two
    begin
      bids = Bid.order("amount DESC").limit(2)
    rescue
      bids = [Bid.new,Bid.new]
    end

    bids
  end

  def num_bids
    bids.size
  end
end
