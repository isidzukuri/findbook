# frozen_string_literal: true

module Admin
  class Article
    class Create < ::SimpleTools::Operation
      step :build
      step :generate_slug
      step :persist

      def build
        article = Article.new(params[:article])

        update_context(:article, article)
      end

      def generate_slug
        result = Seo::GenerateSlug.call(object: context[:article], attribute: :title)

        context[:article].seo = result.context[:slug]
      end

      def persist
        errors!(context[:article].errors.messages) unless context[:article].save
      end
    end
  end
end
