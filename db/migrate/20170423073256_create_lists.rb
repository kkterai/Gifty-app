class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.references :giver
      t.references :recipient
      t.timestamps
    end
  end
end
