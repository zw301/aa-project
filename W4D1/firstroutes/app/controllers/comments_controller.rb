class CommentsController < ApplicationController

  def index
    comments = Comment.all
    render json: comments
  end

  def create
    comment = Comment.new(comment_params)

    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: 422
    end
  end

  def destroy
    comments = Comment.all
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comments
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id)
  end
end
