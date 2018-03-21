class Passenger < ApplicationRecord
  has_many :tickets
  has_many :flights, through: :tickets
  # Dan's question from first lecture -
  # Can we do this: ?
  # has_many :airlines, through: :flights

  validates :name, presence: true
end
