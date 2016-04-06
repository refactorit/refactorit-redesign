class NewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_news, only: [:edit, :update, :destroy]

  def index
    @news = News.all
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)

    if @news.save
      redirect_to news_index_path, notice: 'News was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @news.update(news_params)
      redirect_to news_index_path, notice: 'News was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @news.destroy

    redirect_to news_index_path, notice: 'News was successfully destroyed.'
  end

  private

  def news_params
    params.require(:news).permit(:title, :description, :published, :url,
    :published_at)
  end

  def set_news
    @news = News.find(params[:id])
  end

end
