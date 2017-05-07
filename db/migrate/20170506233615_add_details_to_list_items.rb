class AddDetailsToListItems < ActiveRecord::Migration[5.0]
  def change
    add_column :list_items, :details, :string
  end
end
