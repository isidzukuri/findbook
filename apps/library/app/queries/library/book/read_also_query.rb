module Library
class Book
  class ReadAlsoQuery
    attr_reader :params

    def initialize(params = {})
      @params = params
    end

    def call
      items = []
      return items unless params[:tags_ids]

      sql = <<-SQL
            SELECT DISTINCT
              library_books.id,
              library_books.title,
              library_books.seo,
              library_books.optimized_cover
            FROM library_books_tags
            INNER JOIN library_books ON library_books_tags.book_id = library_books.id
            WHERE
              library_books_tags.tag_id IN(#{params[:tags_ids].join(',')})
                AND library_books.optimized_cover IS NOT NULL
                AND library_books.id > #{random_id}
                AND library_books.is_copy = false #{language}
            LIMIT #{limit}
      SQL

      ActiveRecord::Base.connection.exec_query(sql).to_hash
    end

    private

    def limit
      params[:limit] || 6
    end

    def language
      params[:language] ? " AND library_books.language = '#{params[:language]}'" : ''
    end

    def random_id
      rand(1..params[:book_id].to_i)
    end
  end
end
end
