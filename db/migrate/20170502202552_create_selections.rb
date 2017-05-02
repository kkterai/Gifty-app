class CreateSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :selections do |t|
      t.integer :user_id
      t.integer :list_item_id
      t.timestamps
    end
  end
end
