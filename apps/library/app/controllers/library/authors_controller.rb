# frozen_string_literal: true

module Library
  class AuthorsController < ApplicationController

    def index
      @items = Author.all
    end
  end
end
