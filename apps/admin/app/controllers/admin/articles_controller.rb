module Admin
  class ArticlesController < ApplicationController


    def index

    # paginator
      @items = Article.all
    end

    def new
      @article = Article.new status: :unpublished
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to articles_path
      else
        flash[:danger] = @article.errors.full_messages.join(', ')
        render :new
      end
    end

    def edit
      @article = Article.find(params[:id])
      render :new
    end

    def update
      @article = Article.find(params[:id])
      if @article.update(article_params)
        redirect_to articles_path
      else
        flash[:danger] = @article.errors.full_messages.join(', ')
        render :edit
      end
    end

    def destroy
      Article.find(params[:id]).destroy
      redirect_to articles_path
    end

    def article_params
      params.require(:article).permit(:title, :description, :text, :status, :cover)
    end
  end
end
