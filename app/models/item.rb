class Item < ActiveRecord::Base
  attr_accessible :description, :image_url, :min_bid, :min_increment, :name
end
