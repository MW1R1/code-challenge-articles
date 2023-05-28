require 'sqlite3'

# Establish a connection to the SQLite database
db = SQLite3::Database.new('database.db')

# Define the Author class
class Author
  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def self.all(db)
    query = 'SELECT * FROM authors'
    result = db.execute(query)
    result.map { |row| Author.new(row[0], row[1]) }
  end

  # Other methods for CRUD operations
end

# Define the Magazine class
class Magazine
  attr_reader :id, :name, :category

  def initialize(id, name, category)
    @id = id
    @name = name
    @category = category
  end

  def self.all(db)
    query = 'SELECT * FROM magazines'
    result = db.execute(query)
    result.map { |row| Magazine.new(row[0], row[1], row[2]) }
  end

  # Other methods for CRUD operations
end

# Define the Article class
class Article
  attr_reader :id, :author_id, :magazine_id, :title

  def initialize(id, author_id, magazine_id, title)
    @id = id
    @author_id = author_id
    @magazine_id = magazine_id
    @title = title
  end

  def self.all(db)
    query = 'SELECT * FROM articles'
    result = db.execute(query)
    result.map { |row| Article.new(row[0], row[1], row[2], row[3]) }
  end

  # Other methods for CRUD operations
end

# Main program logic
def main(db)
  authors = Author.all(db)
  magazines = Magazine.all(db)
  articles = Article.all(db)

  # Perform operations on authors, magazines, and articles

  # Example: Print all authors
  puts 'Authors:'
  authors.each { |author| puts "ID: #{author.id}, Name: #{author.name}" }

  # Example: Print all magazines
  puts 'Magazines:'
  magazines.each { |magazine| puts "ID: #{magazine.id}, Name: #{magazine.name}, Category: #{magazine.category}" }

  # Example: Print all articles
  puts 'Articles:'
  articles.each { |article| puts "ID: #{article.id}, Author ID: #{article.author_id}, Magazine ID: #{article.magazine_id}, Title: #{article.title}" }
end

# Call the main function
main(db)
