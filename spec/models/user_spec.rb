require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'validations' do
    it 'should have a valid factory' do
      FactoryGirl.build(:user)
    end
  end
end
