class ShotsUpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    dribbble_utility = DribbbleUtility.new(ENV['DRIBBBLE_TOKEN'])
    dribbble_utility.save_team_shots
  end
end
