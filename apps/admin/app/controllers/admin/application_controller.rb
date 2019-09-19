# frozen_string_literal: true

module Admin
  class ApplicationController < ActionController::Base
    MAX_ITEMS_ON_PAGE = 100

    protect_from_forgery with: :exception

    before_action :authenticate_user!, :paginator_params, :set_vars

    def paginator_params
      @per_page = MAX_ITEMS_ON_PAGE
      @page = params[:page] ? params[:page].to_i : 0
      @offset = @page * @per_page
    end

    def set_vars
      @current_path = request.fullpath.split('?')[0]
    end
  end
end
