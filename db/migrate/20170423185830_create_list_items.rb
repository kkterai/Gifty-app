class CreateListItems < ActiveRecord::Migration[5.0]
  def change
    create_table :list_items do |t|
      t.references :lists
      t.references :items
      t.timestamps
    end
  end
end
