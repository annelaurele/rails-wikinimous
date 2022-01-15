class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params_article)
    @article.save
    redirect_to articles_path(@articles)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(params_article)
    redirect_to articles_path(@articles)
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path(@articles)
  end

  private

  def params_article
    params.require(:article).permit(:title, :content)
  end
end
