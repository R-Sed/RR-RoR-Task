class BlogController < ApplicationController

  protect_from_forgery

  #before_action :verify_authenticity_token

  def main
    @posts = Post.order( created_at: :desc ).take(5)
  end

  def show
    render json: { responseText: 'haha once again' }
  end

end
