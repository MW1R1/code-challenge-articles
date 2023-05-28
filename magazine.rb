require 'sqlite3'

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

  def self.find_by_name(db, name)
    query = 'SELECT * FROM magazines WHERE name = ? LIMIT 1'
    result = db.execute(query, name)
    return nil if result.empty?

    Magazine.new(result[0][0], result[0][1], result[0][2])
  end

  def self.article_titles(db, magazine_id)
    query = 'SELECT title FROM articles WHERE magazine_id = ?'
    result = db.execute(query, magazine_id)
    result.flatten
  end

  def self.contributing_authors(db, magazine_id)
    query = 'SELECT authors.* FROM authors INNER JOIN articles ON authors.id = articles.author_id WHERE articles.magazine_id = ? GROUP BY authors.id HAVING COUNT(articles.id) > 2'
    result = db.execute(query, magazine_id)
    result.map { |row| Author.new(row[0], row[1]) }
  end
end
