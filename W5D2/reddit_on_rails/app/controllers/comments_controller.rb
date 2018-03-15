class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to post_url(@comment.post)
    end

  end

  def show
    @comment = Comment.find(params[:id])
  end

  
  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to post_url(@comment.post)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
