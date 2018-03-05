class Episode < ActiveRecord::Base
  has_many :appearances
  has_many :characters, through: :appearances

  #episode.characters

end
