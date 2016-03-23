class PostsController < ApplicationController

  protect_from_forgery

  def main
    @posts = Post.order( created_at: :desc ).take(5)
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
    redirect_to "/users/" + current_user.name
  end

  def show
    posts = Post.includes(:user).order( created_at: :desc ).limit(5).offset(params[:count])
    render json: posts, include: :user, except: :text
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
    render json:  posts, include: :user, except: :text
  end

  def show_post
    user = User.find_by(name: params[:user_name])
    @post = Post.includes(:user, :comments).where(user_id: user.id).find(params[:post_id])
  end

  def search
    @posts = Post.includes(:user).where("title LIKE ? or text LIKE ?", '%' + params[:key] + '%', '%' + params[:key] + '%')
    .order(created_at: :desc)
    puts '--------->'
    puts @posts.length
    render json: @posts, include: :user
  end

end
