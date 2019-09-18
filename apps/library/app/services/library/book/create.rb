# frozen_string_literal: true

module Library
  module Book
    class Create < ::SimpleTools::Operation
      step :build
      step :generate_slug
      step :validate
      step :persist
      # TODO:
      # step :add_to_elastic
      # step :store_cover

      def build
        book = Book.new(params[:book])

        update_context(:book, book)
      end

      def generate_slug
        result = Seo::GenerateSlug.call(object: not_uniq_book, attribute: :title)
        context[:book].seo = result.context[:slug]
      end

      def add_authors
        if params[:book][:authors_ids]
          item.authors = Author.where(id: params[:book][:authors_ids])
          params[:book].delete :authors_ids
        end
      end

      def validate
        errors!(context[:book].errors.messages) unless context[:book].validate
      end

      def persist
        errors!(context[:book].errors.messages) unless context[:book].save
      end
    end
  end
end
