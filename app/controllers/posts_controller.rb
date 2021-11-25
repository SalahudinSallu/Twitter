class PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :get_post, only: [:destroy, :edit, :update, :publish, :unpublish]

  def index
    @post = Post.new
    @posts = current_user.posts
  end

  def create
    current_user.posts.create(post_params)
    flash[:notice] = "Message"
    redirect_to posts_path
  end

  def edit
    @posts = current_user.posts
    render :index
  end

  def update
    @post.update(post_params) if @post.present?
    redirect_to posts_path
  end

  def destroy
    @post.destroy if @post.present?
    redirect_to posts_path
  end

  def publish
    @post.public_post! if @post.present?
    redirect_to posts_path
  end

  def unpublish
    @post.private_post! if @post.present?
    redirect_to posts_path
  end

  private

  def get_post
    @post ||= current_user.posts.find_by_id(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end

end