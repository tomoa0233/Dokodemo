class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :shop_hp, null: false
      t.string :address, null: false
      t.string :telephone, null: false
      t.float :lat
      t.float :lon
      t.string :image_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
