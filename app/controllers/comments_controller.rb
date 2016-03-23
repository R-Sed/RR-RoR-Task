class CommentsController < ApplicationController

  protect_from_forgery

  skip_before_filter :verify_authenticity_token

  def create
    @comment = Comment.new(
      text: params[:comment][:text],
      post_id: params[:comment][:post_id],
      user_id: current_user.id
      )
    if @comment.valid?
      @comment.save
      render nothing: true
    else
      render text: "invalid params"
    end
  end
end
