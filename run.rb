require_relative 'main'
require_relative 'author'
require_relative 'magazine'
require_relative 'article'
require 'sqlite3'

# Create a new SQLite3 database object
db = SQLite3::Database.new('database.db')

# Enable the results to be returned as a hash
db.results_as_hash = true
