# frozen_string_literal: true

module Library
  class BooksController < ApplicationController
    def show
      @book, @tags, @authors = Book::AllDataQuery.new(seo: params[:id]).call

      redirect_to(:root, status: 410) unless @book
      redirect_to(:root, status: 410) if ActiveModel::Type::Boolean.new.cast(@book['hide'])

      @read_also = Book::ReadAlso.new(book: @book).call
    end
  end
end
