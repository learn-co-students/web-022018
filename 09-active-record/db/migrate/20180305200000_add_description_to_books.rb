class AddDescriptionToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :desciption, :string
  end
end
