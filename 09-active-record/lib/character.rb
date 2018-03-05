class Character < ActiveRecord::Base
  has_many :appearances
  has_many :episodes, through: :appearances

  #character.episodes
  #character.episodes.map {|ep| ep.director}

end
