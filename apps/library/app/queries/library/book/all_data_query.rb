module Library
class Book
  class AllDataQuery
    attr_reader :params

    def initialize(params = {})
      @params = params
    end

    def call
      return book_data.with_indifferent_access, tags_data, authors_data
    end

    private

    def book_data
      return @book_data if @book_data

      sql = <<-SQL
        SELECT
          library_books.*,
          library_genres.title as genre_title,
          library_genres.seo as genre_seo,
          GROUP_CONCAT(DISTINCT library_authors_books.author_id SEPARATOR ',') as authors_ids,
          GROUP_CONCAT(DISTINCT library_books_tags.tag_id SEPARATOR ',') as tags_ids
        FROM library_books
        LEFT JOIN library_genres ON library_genres.id = library_books.genre_id
        LEFT JOIN library_authors_books ON library_authors_books.book_id = library_books.id
        LEFT JOIN library_books_tags ON library_books_tags.book_id = library_books.id
        WHERE library_books.seo = '#{params[:seo]}'
        GROUP BY library_books.id
      SQL

      @book_data = ActiveRecord::Base.connection.exec_query(sql).to_hash[0]
    end

    def tags_data
      if book_data&.fetch('tags_ids').present?
        Tag.where(id: book_data['tags_ids'].split(',')).to_a
      else
        []
      end
    end

    def authors_data
      if book_data&.fetch('authors_ids').present?
        Author.where(id: book_data['authors_ids'].split(',')).to_a
      else
        []
      end
    end
  end
end
end
