# frozen_string_literal: true

module Admin
  class Book
    class Create < ::SimpleTools::Operation
      step :build
      step :generate_slug
      step :add_authors_by_ids
      step :persist
      # TODO:
      # step :add_to_elastic
      # step :store_cover

      def build
        book = Book.new(params[:book])

        update_context(:book, book)
      end

      def generate_slug
        result = Seo::GenerateSlug.call(object: context[:book], attribute: :title)

        context[:book].seo = result.context[:slug]
      end

      def add_authors_by_ids
        if params[:authors_ids]
          context[:book].authors = Author.where(id: params[:authors_ids])
        end
      end

      def persist
        errors!(context[:book].errors.messages) unless context[:book].save
      end
    end
  end
end
