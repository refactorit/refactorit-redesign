class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index, :author_index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def admin_index
    @posts = Post.all
  end

  def index
    @posts = Post.published.includes(:author)
  end

  def author_index
    @author = User.friendly.find(params[:id])
    @posts = @author.posts.published
  end

  def show
    unless @post.published? || current_user.present?
      render_404
    end
  end


  def new
    @post = Post.new
  end

  def edit
  end


  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to admin_posts_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    @post.author = current_user

    if @post.update(post_params)
      redirect_to admin_posts_path, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description, :body, :status)
    end

    def render_404
      raise ActionController::RoutingError.new('Not Found')
    end
end
