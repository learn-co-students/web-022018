# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Airline.create(name: "#{Faker::Company.name} Airlines")
end

1000.times do
  passenger_attributes = {
    name: Faker::StarWars.character,
    luggage: "#{Random.new.rand(5)} bag(s)"
  }
  Passenger.create(passenger_attributes)
end

100.times do
  flight_attributes = {
    airline_id: Random.new.rand(10),
    destination: Faker::StarWars.planet,
    etd: "Some time",
    eta: "in one hour or so",
    number: Random.new.rand(10000).to_s
  }
  Flight.create(flight_attributes)
end

100.times do
  seat_row = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"].sample
  Ticket.create({
    flight_id: Random.new.rand(100),
    passenger_id: Random.new.rand(100),
    seat_number: "#{seat_row}#{Random.new.rand(100)}"
    })
end
