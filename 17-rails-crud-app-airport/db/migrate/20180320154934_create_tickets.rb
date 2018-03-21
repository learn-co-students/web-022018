class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.integer :flight_id
      t.integer :passenger_id
      t.boolean :check_in
      t.string :seat_number

      t.timestamps
    end
  end
end
