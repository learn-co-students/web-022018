class BooksController < ApplicationController

  get "/books" do
    @books = Book.all
    erb :"books/index"
  end

  get "/books/new" do
    @authors = Author.all
    erb :"books/new"
  end

  get "/books/:id" do
    @book = Book.find(params[:id])
    erb :"books/show"
  end

  post "/books" do
    @book = Book.create(params[:book])
    redirect "/books/#{@book.id}"
  end

  get "/books/:id/edit" do
    @book = Book.find(params[:id])
    @authors = Author.all
    erb :"books/edit"
  end

  patch "/books/:id" do
    @book = Book.find(params[:id])
    @book.update(params[:book])
    redirect "/books/#{@book.id}"
  end

  delete "/books/:id" do
    @book = Book.find(params[:id])
    @book.destroy()
    redirect "/books"
  end
end
