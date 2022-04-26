class CreateShopTags < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_tags do |t|
      t.integer :shop_id, null: false
      t.integer :tag_id, null: false
      t.timestamps
    end
  end
end
