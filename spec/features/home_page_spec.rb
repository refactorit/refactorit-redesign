require 'rails_helper'

feature 'Home Page' do
  context "visitor visits home page when authors, topic and posts exist" do
    let(:author)   { FactoryGirl.create(:user) }
    let!(:topic) { FactoryGirl.create(:topic) }
    let!(:draft_post) { FactoryGirl.create(:post, author: author) }
    let!(:published_posts) { FactoryGirl.create_list(:published_post, 3,
       author: author, topic: topic) }
    let!(:news) { FactoryGirl.create(:news) }

    before { visit root_path }

    specify "he sees first two published blog posts" do
      # only the last two published posts are shown
      expect(page).to have_link published_posts[2].title, href: posts_path(published_posts[2])
      expect(page).to have_link published_posts[1].title, href: posts_path(published_posts[1])
    end

    specify "he doesn't see older published posts" do
      expect(page).to_not have_content published_posts[0].title
    end

    specify "he doesn't see posts in draft" do
      expect(page).to_not have_content draft_post.title
    end


    specify "he sees the index link of the post topic" do
      expect(page).to have_link published_posts[2].topic_name, href: topic_posts_path(topic)
    end

    context "there is no published news" do
      specify "visitor sees no news" do
        expect(page).to_not have_content news.title
      end
    end

    context "and there is a published news" do
      before do
        news.update(published: true)
      end

      specify "visitor sees correct news" do
        visit root_path
        expect(page).to have_content news.title
      end

      specify "visitor sees read more link when url for the news exists" do
        visit root_path
        expect(page).to have_link "Read more", href: news.url
      end

      specify "visitor doesn't see read more link when there's no url for the news" do
        news.update(url: nil)
        visit root_path
        expect(page).to_not have_link "Read more", href: news.url
      end
    end
  end
end
