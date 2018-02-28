class Book
  attr_reader :copyright
  attr_reader :pages
  attr_reader :name
  attr_reader :authors

  # have many purchases
  # has many customers through purchases
  def initialize(name, pages=[], authors=[])
    @name = name
    # has many pages
    @pages = []
    @authors = []
    add_pages(pages)
    add_authors(authors)
  end

  def add_pages(pages) # array of Page instances
    @pages = @pages + pages.select { |page| page.instance_of?(Page) }
  end

  # has many authors
  def add_authors(authors)
    @authors = @authors + authors.select { |author| author.instance_of?(Author) }
    authors.each do |author|
      author.books << self
    end
  end

  def copyright=(c)
    @copyright = c
    if !c.book
      c.book = self
    end
  end

  def purchases
    Purchase.all.select { |purchase| purchase.book == self }
  end

  def customers
    # same thing - call through the purchases
    purchases.map { |purchase| purchase.customer } 
  end
end


# one-to-one
class Copyright
  attr_reader :book

  def book=(book)
    @book = book
    if !book.copyright
      book.copyright = self
    end
  end
end


# Many to one relationships

class Page
  # belongs to one book
  attr_reader :book

  def initialize(book)
    @book = book
    book.pages.push(self)
  end
end


class Author
  # has many books
  attr_accessor :books

  def initialize
    @books = []
  end
end

class Purchase
  # has_one customer
  # has_one book
  attr_accessor :customer, :book
  @@all = []

  def initialize(customer, book)
    @customer = customer
    @book = book
    @@all << self
  end

  def self.all
    @@all
  end
end

class Customer
  # have_many purchases
  # has_many books through purchases

  def books
    # find the purchases for this customer
    # pull off the books from those purchases
    self.purchases.map { |p| p.book }
  end

  def purchase(book)
    Purchase.new(self, book)
  end

  def purchases
    Purchase.all.select { |p| p.customer == self }
  end
end
