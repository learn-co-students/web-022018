class BooksController < ApplicationController
  before_action :authorized

  def index
    @books = current_user.books
  end
end
