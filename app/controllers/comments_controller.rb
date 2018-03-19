class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.article_id = @article.id
    if @comment.save
      redirect_to article_path(@article)
    else
      flash.alert = "Not created. Fields can't be blank."
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
