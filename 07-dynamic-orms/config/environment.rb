# load gems
require 'pry'
require 'sqlite3'

# creating a database connection

DB = SQLite3::Database.new('db/chinook.db')
DB.results_as_hash = true

require_relative '../app/models/dynamic_record.rb'
require_relative '../app/models/fan.rb'
# DB.execute('create table if not exists fans (id INTEGER PRIMARY KEY, name varchar(255), artist_id int)')
