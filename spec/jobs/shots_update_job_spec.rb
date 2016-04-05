require 'rails_helper'

RSpec.describe ShotsUpdateJob, :type => :job do
  describe 'perform' do
    it 'saves team shots' do
      expect_any_instance_of(DribbbleUtility).to receive(:save_team_shots)

      ShotsUpdateJob.new.perform
    end
  end
end
