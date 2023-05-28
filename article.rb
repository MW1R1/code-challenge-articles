require 'sqlite3'

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

  def author(db)
    query = 'SELECT * FROM authors WHERE id = ? LIMIT 1'
    result = db.execute(query, author_id)
    return nil if result.empty?

    Author.new(result[0][0], result[0][1])
  end

  def magazine(db)
    query = 'SELECT * FROM magazines WHERE id = ? LIMIT 1'
    result = db.execute(query, magazine_id)
    return nil if result.empty?

    Magazine.new(result[0][0], result[0][1], result[0][2])
  end
end
