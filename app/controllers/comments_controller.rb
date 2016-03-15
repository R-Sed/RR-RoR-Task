class CommentsController < ApplicationController

  def index
    comment = Comment.all
    render json: comment
  end

  def new
    if user_signed_in?
      render :new
    else
      redirect_to '/users/sign_in'
    end
  end

  def create
    @comment = Comment.new(
      text: params[:comment][:text],
      post_id: params[:comment][:post_id],
      user_id: current_user.id
      )
    if @comment.valid?
      @comment.save
    else
      render text: "invalid params"
    end
  end
end
