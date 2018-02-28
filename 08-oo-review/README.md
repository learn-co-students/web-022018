# OO Review

## Object-ives

* Review how to create classes and instances of classes
* Define attribute reader and writer methods on our classes using macros
* Define instance and class methods
* Identify what self is at any given time
* Relate two classes together - send methods from one class to another class
* Practice modeling one-to-one, one-to-many, and many-to-many object relationships
* Difference between .map and .select

## Object Permanence

Objects are instances of Classes
Class is an object
Blueprint for making lots of objects
Model

When we call Book.new(), the `#initialize` method gets called
we get back a new instance of the class

Parameters can have default values - what's the syntax?

```
def fake_method(argument="blank")
  argument # "not blank"
end

fake_method
fake_method("not blank")
```

What're these?
Shorthand for creating setter and getter methods for instance variables

Macro - a shortcut, compresses some lines of code into a shorter, easy to read statement

* `attr_reader` - macro to create a reader function to return the instance variable to the caller
* `attr_writer` - macro to create the writer function
* `attr_accessor` - macro to create _both_ reader and writer

```
class Book
  attr_reader :pages
  attr_writer :annotations
  attr_accessor :name

  # writer
  # Want other classes to be able to update, but not read
  def password=(secret)
    @password = secret
  end

  # reader
  # Not changing
  # Don't want other classes to be able to update this value
  def pages
    @pages
  end

  # accessor
  def name
    @name
  end

  def name=(name)
    @name = name
  end
end
```

## On The Nature Of The `self`

#### Class Variables

Syntax

#### Instance Variables

Syntax

```
class Character
  @@characters = []

  # pseudo-code
  def self.new(**args)
    ## Brand new Character
    character.initialize(**args)
  end

  def initialize
    # put instance into the array
    # (equivalently) @@characters << self
    self.class.all << self
  end

  def self.all
    # self is the class Character right now
    @@characters
  end

  def books
    # What is the self?
    # self is an instance of Character
    # self.class == Character
    # self.all # will blow up
  end
end

Character.all # => array of characters
```

Class Methods vs. Instance methods

## Relationship Issues

### One to one relationships

Book has one Copyright
Copyright belongs to one Book

### Many to one relationships

Books have many pages
Pages belong to one book

### Many To Many relationships

_many through_

Authors have many Books
AuthorBook
Books have many Authors

Books have many Characters
Characters belong to many Books

Books <-> Purchases <-> Customers
