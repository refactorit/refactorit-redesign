require 'rails_helper'

RSpec.describe News, :type => :model do
  describe 'validations' do
    it 'should have a valid factory' do
      FactoryGirl.build(:news)
    end

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description)}
  end
end
