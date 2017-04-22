class CreateStoreProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :store_products do |t|

      t.timestamps
    end
  end
end
