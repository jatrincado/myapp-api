class CommentsController < ApplicationController
  before_action :find_article, only: [:create, :destroy]
  def new
    @comment = Comment.new(article_id: params[:article_id])
  end

  def edit
  end

  def create
    @comment = @article.comments.new(comment_params)

    if @comment.save
      redirect_to @article
    else
      flash.alert = "Not created. Fields can't be blank."
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def find_article
      @article = Article.find(params[:article_id])
    end
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
