# load gems
require 'pry'
require 'sqlite3'

# creating a database connection

DB = SQLite3::Database.new('db/chinook.db')
DB.results_as_hash = true

require_relative '../app/models/fan.rb'
