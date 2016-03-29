class PagesController < ApplicationController
  def home
    @dribbble_shots = DribbbleShot.limit(6)
  end

  def about
  end

  def team
  end

  def services
  end
end
