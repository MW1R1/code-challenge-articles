require_relative 'main'
require_relative 'author'
require_relative 'magazine'
require_relative 'article'
require 'sqlite3'

# Create a new SQLite3 database object
db = SQLite3::Database.new('database.db')

# Enable the results to be returned as a hash
db.results_as_hash = true
# Create a new author
author = Author.new('name', 'id')

# Create a new magazine
magazine = Magazine.new('id', 'magazine_name', 'Category')

# Create a new article and associate it with the author and magazine
article = Article.new('id', 'author_id', 'magazine_id', 'title')

# Print the article title
puts article.title

# Print the author's name
puts author.name

# Print the magazine's name
puts magazine.name
puts magazine.category
