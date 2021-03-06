# frozen_string_literal: true

module Bibliotheca
  class AuthorsController < ApplicationController
    def index
      @items = Author.order(:full_name).paginate(page: params[:page], per_page: @per_page).all
    end

    def show
      @author = Author.find_by_seo(params[:id])

      redirect_to(:root, status: 410) if @author.hide

      @items = @author.books.select(Book::VIEW_ATTRIBUTES).paginate(page: params[:page], per_page: @per_page)
    end
  end
end
