class PagesController < ApplicationController
  def home
    @dribbble_shots = DribbbleShot.limit(6).order(likes_count: :desc)
    if @dribbble_shots.empty? || @dribbble_shots.first.created_at < 1.hour.ago
      ShotsUpdateJob.perform_later
    end
    @posts = Post.published.order(published_at: :desc).limit(2)
    @news  = News.published.order(published_at: :desc).first
  end

  def team
  end

  def services
  end

  def thank_you
  end

  def page_not_found
    render status: 404
  end
end
