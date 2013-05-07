class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.float :min_bid
      t.float :min_increment

      t.timestamps
    end
  end
end
