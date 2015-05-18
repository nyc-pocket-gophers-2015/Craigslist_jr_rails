class ArticlesController < ApplicationController
  before_action :get_category, only: [:index, :new, :create, :show, :edit, :update]
  before_action :get_article, only: [:show, :edit, :update]
  def index
    @articles = @category.articles
  end

  def new
    @article = Article.new
  end

  def show
  end

  def create
    @article = Article.new(article_params)
    @article.category = @category
    @article.edit_link = @article.create_edit_link
    respond_to do |format|
      if @article.save
        session[:article_id] = @article.id
        format.html {redirect_to [@category, @article]}
      else
        format.html {render :new}
      end
    end
  end

  def edit
    if params[:edit_link]
      valid_link = @article.edit_link == params[:edit_link]
      redirect_to([@category, @article]) unless valid_link
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html {redirect_to [@category, @article]}
      else
        format.html {render :edit}
      end
    end
  end

  private
  def get_category
    @category = Category.find(params[:category_id])
  end

  def get_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :price, :email)
  end
end
