class CreatePassengers < ActiveRecord::Migration[5.1]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :luggage

      t.timestamps
    end
  end
end
