class Api::ArticlesController < ApplicationController
  def index
    @articles = Article.all
    respond_to do |format|
      format.json {render :json => @articles.to_json, :status => :ok}
    end
  end

  def create
  end

  def update
  end

  def destroy
  end

  def show
  end
  end
