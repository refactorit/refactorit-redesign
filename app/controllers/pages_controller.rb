class PagesController < ApplicationController
  def home
    @dribbble_shots = DribbbleShot.all
  end

  def about
  end

  def team
  end

  def services
  end
end
