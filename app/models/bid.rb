class Bid < ActiveRecord::Base
  attr_accessible :address, :amount, :attending, :email, :item_id, :name, :phone, :bid

  belongs_to :item
end
