require 'action_view'
class Bid < ActiveRecord::Base
  attr_accessible :address, :amount, :attending, :email, :item_id, :name, :phone, :bid

  belongs_to :item

  validate :ismax?

  def item_name
    item.name
  end

  private

  def ismax?
    i = Item.find(item_id)
    max_bid = i.max_bid
    if amount < (max_bid + i.min_increment)
      errors.add(:base, "The minimum bid is now #{ActionView::Base.new.number_to_currency(max_bid + i.min_increment)}")
    end
  end
end
