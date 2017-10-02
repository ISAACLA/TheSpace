class CommentController < ApplicationController
  before_action :require_login

  def imagecomment
    @image = Image.find(params[:id])
    @comment = Comment.new (comment_params)
    if @comment.save
      # flash[:notice]=["You have submitted your comment"]
      redirect_to "/images/#{@image.id}/show"
    else
      flash[:errors]=@comment.errors.full_messages
      redirect_to :back
    end
  end

  def eventcomment
    @event = Event.find(params[:id])
    @comment = Comment.new (comment_params)
    if @comment.save
      # flash[:notice]=['You have submitted your comment']
      redirect_to "/events/#{@event.id}"
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to :back
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment,:commentable_id, :commentable_type).merge(user:current_user)
  end
end
