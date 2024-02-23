class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params_article)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new, status: :unprocesable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(params_article)
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocesable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def params_article
    params.required(:article).permit(:title, :content)
  end
end
