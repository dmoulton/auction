class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.float :amount
      t.integer :item_id
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.boolean :attending

      t.timestamps
    end
  end
end
