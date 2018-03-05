class Author < ActiveRecord::Base
 has_many :books

  # def books
  #   Book.where(author_id: self.id)
  # end

end
