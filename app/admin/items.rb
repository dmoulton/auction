ActiveAdmin.register Item do
  index do
    column :name
    column :description
    column "Minimum Bid", :min_bid
    column "Minimum Bid Increment", :min_increment
    actions
  end
end
