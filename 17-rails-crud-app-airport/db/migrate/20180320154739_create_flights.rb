class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer :airline_id
      t.string :destination
      t.string :etd
      t.string :eta
      t.string :number

      t.timestamps
    end
  end
end
