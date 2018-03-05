class CreateAppearances < ActiveRecord::Migration[5.1]
  def change

    create_table :appearances do |t|
      t.integer :episode_id
      t.integer :character_id
    end
  end
end
