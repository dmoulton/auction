class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :artist
      t.string :size
      t.text :description
      t.string :image_url
      t.float :min_bid, :default=> 100.00
      t.float :min_increment, :default=> 20.00
      t.integer :order

      t.timestamps
    end
  end
end
