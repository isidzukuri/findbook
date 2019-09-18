# frozen_string_literal: true

module Library
  module Seo
    class GenerateSlug < SimpleTools::Operation
      step :validate_params
      step :generate_slug

      def validate_params
        unless params[:obgect].is_a?(ActiveRecord::Base)
          raise ArgumentError, 'Object must be ar instance required'
        end

        unless params[:attribute].present?
          raise ArgumentError, ':attribute parameter required'
        end
      end

      def generate_slug
        transliterate
        add_uniqness unless valid?
      end

      def transliterate
        slug = params[:object][params[:attribute]].to_ascii.parameterize[0..70]

        update_context(:slug, slug)
      end

      def valid?
        !context[:object].exists?(context[:attribute] => context[:slug])
      end

      def add_uniqness
        slug = context[:slug] + '_' + SecureRandom.hex(2)
        update_context(:slug, slug)
      end
    end
  end
end
