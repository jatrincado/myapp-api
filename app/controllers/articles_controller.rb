class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, except: [:show]
  def index
    @articles = Article.all.order('created_at DESC')
    respond_to do |format|
      format.json {render :json => @articles, :status => 200, each_serializer: ArticlesSerializer}
    end
    #@articles = Article.all
    #json_response(@articles)
  end

  def show
    #respond_to do |format|
    #  format.json {render :json => @article, :status => 200}
    #end
    json_response(@article)
  end

  def new
    @article = current_user.articles.build
  end

  def edit
  end

  def create
    #@article = current_user.articles.build(article_params)
    #smart_add_url_protocol

    #respond_to do |format|
    #  if @article.save
    #    format.html {redirect_to @article, notice: "Noticia creada exitosamente"}
    #    format.json {render :show, status: :created, location: @article}
    #  else
    #    format.html {render 'new'}
    #    format.json {render json: @article.errors, status: :unprocessable_entity}
    #  end
    #end
    @article = Article.create!(article_params)
    json_response(@article, :created)
  end

  def update
    #respond_to do |format|
    #  if @article.update(article_params)
    #    format.html {redirect_to @article, notice: "Noticia modificada exitosamente"}
    #    format.json {render :show, status: :updated, location: @article}
    #  else
    #    format.html {render 'edit'}
    #    format.json {render json: @article.errors, status: :unprocessable_entity}
    #  end
    #end
    @article.update(article_params)
    json_response(@article)
  end

  def destroy
    @article.destroy
    json_response(@article)
    #respond_to do |format|
    #  if @article.destroy
        #format.html {redirect_to articles_path, notice: "Noticia eliminada exitosamente"}
    #    format.json {json_response(@article)}
    #  else
        #format.html{redirect_to articles_path, alert: "No se pudo eliminar la noticia"}
    #    format.json {json_response(@article)}
    #  end
    #end
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
    #params.require(:article).permit(:title, :summary, :body, :link)
    params.permit(:title, :summary, :body, :link)
  end
end
