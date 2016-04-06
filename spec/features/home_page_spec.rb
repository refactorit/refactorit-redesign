require 'rails_helper'

feature 'Home Page' do
  context "visitor visits home page when authors and posts exist" do
    let(:author)   { FactoryGirl.create(:user) }
    let!(:draft_post) { FactoryGirl.create(:post, author: author) }
    let!(:published_posts) { FactoryGirl.create_list(:published_post, 3, author: author) }
    let!(:news) { FactoryGirl.create(:news) }
    before { visit root_path }

    specify "he sees correct blog posts" do
      # only the last two published posts are shown
      expect(page).to have_content published_posts[2].title
      expect(page).to have_content published_posts[1].title
      expect(page).to_not have_content published_posts[0].title

      expect(page).to_not have_content draft_post.title
    end

    context "he doesn't see unpublished news" do
      specify "visitor sees correct news" do
        expect(page).to_not have_content news.title
      end
    end

    context "he sees published news" do
      before do
        news.update(published: true)
        visit root_path
      end
      
      specify "visitor sees correct news" do
        expect(page).to have_content news.title
      end
    end
  end
end
