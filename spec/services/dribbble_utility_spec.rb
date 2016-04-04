require 'rails_helper'

describe DribbbleUtility do
  let(:dribbble) { DribbbleUtility.new(ENV['DRIBBBLE_TOKEN']) }

  describe '#user' do
    it 'returns instance of Dribbble::User' do
      expect(dribbble.user).to be_a Dribbble::User
    end
  end

  describe '#team' do
    it 'returns instance of Dribbble::Team' do
      expect(dribbble.team).to be_a Dribbble::Team
    end
  end

  describe '#save_team_shots' do
    it 'saves DribbbleShot' do
      expect { dribbble.save_team_shots }.to change { DribbbleShot.count }
    end
  end
end

