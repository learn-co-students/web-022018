class User < ApplicationRecord

  has_secure_password

  validates :username, presence: true, uniqueness: true

  has_many :users_snacks
  has_many :snacks, through: :users_snacks


  def snackify!
    number_of_snacks = rand(5..20)
    Snack.all.sample(number_of_snacks).each do |snack|
      self.snacks << snack
    end
  end

end
