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

  describe "#save" do
    let(:default_post) { FactoryGirl.build(:post) }
    let(:published_post) { FactoryGirl.build(:published_post) }
    let(:published_post_with_date) { FactoryGirl.build(:published_post,
      published_at: Time.now) }
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

    it "post is saved without published_date if status is changed from published to draft" do
      published_post_with_date.status = "draft"
      published_post_with_date.save
      expect(published_post_with_date.reload.published_at).to eq nil
    end

    it "post is saved with the slug derived from title" do
      default_post.title = "Some cool title"
      default_post.save
      expect(default_post.reload.slug).to eq "some-cool-title"
    end
  end
end

