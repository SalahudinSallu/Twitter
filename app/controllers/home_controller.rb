class HomeController < ApplicationController
  def index
    @posts = Post.public_post
  end
end