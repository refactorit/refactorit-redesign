class PagesController < ApplicationController
  def home
    dribbble_user = Dribbble::User.find(ENV['DRIBBBLE_TOKEN'], 'ivanlucev')
    dribbble_team = dribbble_user.teams.first
    @dribbble_shots = dribbble_team.shots
  end

  def about
  end

  def team
  end

  def services
  end
end
