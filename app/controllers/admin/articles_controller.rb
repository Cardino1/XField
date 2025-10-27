# frozen_string_literal: true

module Admin
  class ArticlesController < BaseController
    before_action :set_article, only: %i[show edit update destroy]

    def index
      @articles = Article.order(published_on: :desc)
    end

    def show; end

    def new
      @article = Article.new
    end

    def edit; end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to admin_article_path(@article), notice: "Article was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @article.update(article_params)
        redirect_to admin_article_path(@article), notice: "Article was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @article.destroy
      redirect_to admin_articles_path, notice: "Article was successfully removed."
    end

    private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :summary, :content, :published_on, :hero_image_url)
    end
  end
end
