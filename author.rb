require 'sqlite3'

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

  def articles(db)
    query = 'SELECT * FROM articles WHERE author_id = ?'
    result = db.execute(query, id)
    result.map { |row| Article.new(row[0], row[1], row[2], row[3]) }
  end

  def magazines(db)
    query = 'SELECT magazines.* FROM magazines INNER JOIN articles ON magazines.id = articles.magazine_id WHERE articles.author_id = ?'
    result = db.execute(query, id)
    result.map { |row| Magazine.new(row[0], row[1], row[2]) }.uniq
  end

  def add_article(db, magazine, title)
    query = 'INSERT INTO articles (author_id, magazine_id, title) VALUES (?, ?, ?)'
    db.execute(query, id, magazine.id, title)
  end

  def topic_areas(db)
    query = 'SELECT DISTINCT magazines.category FROM magazines INNER JOIN articles ON magazines.id = articles.magazine_id WHERE articles.author_id = ?'
    result = db.execute(query, id)
    result.flatten
  end
end
