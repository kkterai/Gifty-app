class CreateListItems < ActiveRecord::Migration[5.0]
  def change
    create_table :list_items do |t|
      t.integer :list_id
      t.integer :item_id
      t.boolean :purchased, :default => false
    end
  end
end
