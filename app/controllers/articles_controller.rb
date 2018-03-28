class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  def index
    @articles = Article.all.order('created_at DESC')
  end

  def show
  end

  def new
    @article = current_user.articles.build
  end

  def edit
  end

  def create
    @article = current_user.articles.build(article_params)
    smart_add_url_protocol
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

private
  def smart_add_url_protocol
    u = URI.parse(@article.link)
    if (!u.scheme)
      @article.link = "http://#{@article.link}"
    elsif (%w{http https}.include?(u.scheme))
    else
      flash[:alert] = "Error: link inválido."
    end
  end


  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :summary, :body, :link)
  end
end
