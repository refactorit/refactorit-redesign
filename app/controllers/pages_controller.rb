class PagesController < ApplicationController
  def home
    @dribbble_shots = DribbbleShot.limit(6)
    if @dribbble_shots.empty? || @dribbble_shots.first.created_at < 1.hour.ago
      ShotsUpdateJob.perform_later
    end
  end

  def about
  end

  def team
  end

  def services
  end
end
