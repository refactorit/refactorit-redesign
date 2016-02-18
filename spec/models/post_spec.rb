require 'rails_helper'

RSpec.describe Post, :type => :model do
  describe 'validations' do
    it 'should have a valid factory' do
      FactoryGirl.build(:post)
    end

    it { should belong_to(:author) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_uniqueness_of(:slug) }
  end

  describe "#strip_title" do
    let(:post) { FactoryGirl.build(:post) }

    it "strips whitespace around strings" do
      post.title = "   Title with a bunch of whitespace around    "
      expect(post.strip_title).to eq "Title with a bunch of whitespace around"
    end

    it "title is stripped before saving" do
      post.title = "   Title with a bunch of whitespace around    "
      post.save
      expect(post.title).to eq "Title with a bunch of whitespace around"
    end
  end

  describe "#title_to_slug" do
    let(:post) { FactoryGirl.build(:post) }

    it "returns correctly slugified text" do
      post.title = "This is a rails 5 text"
      expect(post.title_to_slug).to eq "this-is-a-rails-5-text"
    end

    it "returns correctly slugified text with multiple whitespace" do
      post.title = "Title WIth    whitespace"
      expect(post.title_to_slug).to eq "title-with-whitespace"
    end
  end

  describe "#save" do
    let(:default_post) { FactoryGirl.build(:post) }
    let(:published_post) { FactoryGirl.build(:published_post)}
    it "post is saved with default status value if no status is provided" do
      default_post.save
      expect(default_post.reload.status).to eq "draft"
    end

    it "post is not saved with published_at date if status is draft" do
      default_post.save
      expect(default_post.reload.published_at).to eq nil
    end

    it "post is saved with provided status value" do
      published_post.save
      expect(published_post.reload.status).to eq "published"
    end

    it "post is saved with published_at date if status is published" do
      published_post.save
      expect(published_post.reload.published_at).to_not eq nil
    end
  end
end

