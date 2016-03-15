class PostsController < ApplicationController

  #helper_method :current_user
  #require 'Time'

  def index
    post = Post.includes(:comments).all
    render json: post, include: :comments
  end

  def new
    if user_signed_in?
      render :new
    else
      redirect_to '/users/sign_in'
    end
  end

  def create
    @post = Post.new(
      title: params[:post][:title],
      text: params[:post][:text],
      user_id: current_user.id
      )
    if @post.valid?
      @post.save
    else
      render text: "invalid params"
    end
  end

end
