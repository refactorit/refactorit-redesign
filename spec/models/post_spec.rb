require 'rails_helper'

RSpec.describe Post, :type => :model do
  describe 'validations' do
    it 'should have a valid factory' do
      FactoryGirl.build(:post)
    end

    it { should belong_to(:author) }
  end
end

