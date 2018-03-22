class Flight < ApplicationRecord
  belongs_to :airline
  has_many :tickets
  has_many :passengers, through: :tickets

  def self.destinations
    Flight.select(:destination).distinct.map {|f|f.destination}.sort
  end
end
