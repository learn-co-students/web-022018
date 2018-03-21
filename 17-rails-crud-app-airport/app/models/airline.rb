class Airline < ApplicationRecord
  has_many :flights, dependent: :destroy
end
