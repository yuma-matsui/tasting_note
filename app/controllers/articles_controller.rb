class ArticlesController < ApplicationController

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def category
    @article = Article.where(number: params[:number]).first
  end

end
