url = 'https://www.googleapis.com/books/v1/volumes?q=pineapple'

require 'rest-client'
require 'pry'
require 'json'

def get_books(url)
  response = RestClient.get(url)
  hash = JSON.parse(response)
  hash['items']
end

def print_books(book_array)
  book_array.each do |book|
    print_book(book)
  end
end

def print_book(book)
  authors = book['volumeInfo']['authors']

  # valid interpolation
  puts "'" + book["volumeInfo"]["title"]+ "'"
  puts "'#{book["volumeInfo"]["title"]}'"
  puts "\"#{book["volumeInfo"]["title"]}\""
  puts %Q["#{book['volumeInfo']['title']}"]
  # https://simpleror.wordpress.com/2009/03/15/q-q-w-w-x-r-s/

  # no bueno
  # puts '"#{book["volumeInfo"]["title"]}"'

  if authors
    puts authors.join(" & ")
  else
    puts 'Unknown'
  end
  puts '*' * 25
end

books = get_books(url)
print_books(books)
