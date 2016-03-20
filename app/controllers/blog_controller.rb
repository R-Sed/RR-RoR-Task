class BlogController < ApplicationController

  protect_from_forgery

  #before_action :verify_authenticity_token

  def main
    @posts = Post.order( created_at: :desc ).take(5)
  end

  def show
    posts = Post.includes(:user).order( created_at: :desc ).limit(5).offset(params[:count])
    render json: posts, include: :user
  end

  def by_user
    @user = User.find_by(name: params[:user_name])
    @posts = Post.includes(:user).order( created_at: :desc )
    .where(user_id: @user.id).limit(5)
  end

  def show_by_user
    user = User.find_by(name: params[:user_name])
    posts = Post.includes(:user).order( created_at: :desc )
    .where(user_id: user.id).limit(5).offset(params[:count])
    render json:  posts, include: :user
  end

end
