class Book < ActiveRecord::Base
  belongs_to :author
  
  # def author
  #   Author.find(self.author_id)
  # end

end
