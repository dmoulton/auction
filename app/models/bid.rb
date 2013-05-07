class Bid < ActiveRecord::Base
  attr_accessible :address, :amount, :attending, :email, :item_id, :name, :phone
end
