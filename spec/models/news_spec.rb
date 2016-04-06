require 'rails_helper'

RSpec.describe News, :type => :model do
  describe 'validations' do
    it 'should have a valid factory' do
      FactoryGirl.build(:news)
    end

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description)}
  end

  describe '#save' do
    let(:news) { FactoryGirl.build(:news) }

    it 'news is saved without published_at if published is false' do
      news.save
      expect(news.published_at).to eq nil
    end

    it "news is saved with published_at if it's published and there is no existing published_at date" do
      news.published = true
      news.save
      expect(news.published_at).to_not eq nil
    end

    it "news is doesn't change published_at if it's published and there is an existing published_at date" do
      old_time = Time.now
      news.published = true
      news.published_at = old_time
      news.save
      expect(news.published_at).to eq old_time
    end
  end
end
