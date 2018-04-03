class CommentsController < ApplicationController
  before_action :find_article
  before_action :set_article_comment, only: [:show, :update, :destroy]

  def index
    respond_to do |format|
      format.json {render :json => @article.comments, :status => 200, each_serializer: CommentsSerializer}
    end
    #json_response(@article.comments)
  end

  def show
    respond_to do |format|
      format.json {render :json => @comment, :status => 200, serializer: CommentsSerializer}
    end
  end

  def new
    @comment = Comment.new(article_id: params[:article_id])
  end

  def edit
  end

  def create
    #@comment = @article.comments.new(comment_params)
    #if @comment.save
    #  redirect_to @article
    #else
    #  flash.alert = "Not created. Fields can't be blank."
    #end
    @comment = @article.comments.create!(comment_params)
    #usa un serializer
    respond_to do |format|
      format.json {render :json => @comment, :status => :created, serializer: CommentsSerializer}
    end
  end

  def update
    @comment.update!(comment_params)
    json_response(@article)
  end

  def destroy
    #@comment = @article.comments.find(params[:id])
    #@comment.destroy
    #redirect_to article_path(@article)
    @comment.destroy
    respond_to do |format|
      format.json {render :json => @comment, :status => 200, serializer: CommentsSerializer}
    end
  end

  private
    def find_article
      @article = Article.find(params[:article_id])
    end

    def set_article_comment
      @comment = @article.comments.find_by!(id: params[:id]) if @article
    end

    def comment_params
      #params.require(:comment).permit(:commenter, :body)
      params.permit(:author, :comment)
    end
end
