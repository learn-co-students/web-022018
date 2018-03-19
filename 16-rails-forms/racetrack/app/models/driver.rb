class Driver < ApplicationRecord
  validates :name, { presence: true, uniqueness: true }
end
