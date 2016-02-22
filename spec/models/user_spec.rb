require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'validations' do
    it 'should have a valid factory' do
      FactoryGirl.build(:user)
    end

    it { should have_many(:posts) }
    it { should validate_presence_of(:name) }
  end

  describe '#save' do
    let(:user) { FactoryGirl.build(:user) }
    it "user is saved with the slug derived from name" do
      user.name = "Vanessa Šerka"
      user.save
      expect(user.reload.slug).to eq "vanessa-serka"
    end
  end
end
