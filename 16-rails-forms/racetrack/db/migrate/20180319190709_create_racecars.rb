class CreateRacecars < ActiveRecord::Migration[5.1]
  def change
    create_table :racecars do |t|
      t.string :make
      t.string :model

      t.timestamps
    end
  end
end
