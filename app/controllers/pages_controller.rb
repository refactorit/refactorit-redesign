class PagesController < ApplicationController
  def home
    dribbble = DribbbleUtility.new(ENV['DRIBBBLE_TOKEN'])
    @dribbble_shots = dribbble.team.shots
  end

  def about
  end

  def team
  end

  def services
  end
end
