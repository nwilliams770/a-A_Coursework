class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    render :new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash[:errors] = @comment.errors.full_messages
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
