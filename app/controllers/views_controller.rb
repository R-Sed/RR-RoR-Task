class ViewsController < ApplicationController

  def main
    @posts = Post.order( created_at: :desc ).take(5)
  end

  def show
    
  end

end
