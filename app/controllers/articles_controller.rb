class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end
  def show
      @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to articles_path(@article)
  end
  def edit
    @article = Article.find(params[:id])
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end
end
