class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index, :author_index, :topic_index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_authors, only: [:index, :author_index, :topic_index]

  def admin_index
    @posts = Post.all
  end

  def index
    @topics = Topic.all
    @posts = Post.published_with_authors
  end

  def author_index
    @topics = Topic.all
    @author = User.friendly.find(params[:id])
    @posts = @author.posts.published

    render template: 'posts/index'
  end

  def topic_index
    @topic = Topic.friendly.find(params[:id])
    @topics = Topic.all
    @posts = @topic.posts.published

    render template: 'posts/index'
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

    def set_authors
      @authors = User.all
    end

    def post_params
      params.require(:post).permit(:title, :description, :body, :status)
    end

    def render_404
      raise ActionController::RoutingError.new('Not Found')
    end
end
