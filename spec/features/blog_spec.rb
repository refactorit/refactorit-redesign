require 'rails_helper'

feature "Blog" do


  context "visitor when authors, posts and topics exist" do
    let(:author)   { FactoryGirl.create(:user) }
    let(:other_author) { FactoryGirl.create(:user) }
    let!(:draft_post) { FactoryGirl.create(:post, author: author) }
    let!(:published_posts) { FactoryGirl.create_list(:published_post, 3, author: author) }
    let!(:other_authors_post) { FactoryGirl.create(:published_post, author: other_author) }
    let!(:topics) { FactoryGirl.create_list(:topic, 2)}

    describe "on index page" do
      before { visit posts_path }

      specify "he sees correct blog posts" do
        expect(page).to have_content published_posts[0].title
        expect(page).to have_content published_posts[1].title
        expect(page).to have_content other_authors_post.title
        expect(page).to_not have_content draft_post.title

        expect(page).to have_content author.name
        expect(page).to have_content other_author.name
      end

      specify "user can't see administration links" do
        expect(page).to_not have_link "Edit", href: edit_post_path(published_posts[0].slug)
      end

      specify "he sees author links in a special box" do
        within(".menu-text", text: "authors") do
          expect(page).to have_link author.name, href: author_posts_path(author)
          expect(page).to have_link other_author.name, href: author_posts_path(other_author)
        end
      end

      specify "he sees topic links" do
        expect(page).to have_link topics.first.name, href: topic_posts_path(topics.first)
        expect(page).to have_link topics.second.name, href: topic_posts_path(topics.second)
      end
    end

    describe "on author index page" do
      before { visit author_posts_path(id: author.slug) }

      specify "he sees author's posts" do
        expect(page).to have_content published_posts[0].title
        expect(page).to have_content published_posts[1].title
        expect(page).to have_content author.name
      end

      specify "he can't see other author's posts" do
        expect(page).to_not have_content other_authors_post.title
      end
    end

    describe "on topic index page" do
      let!(:design_post) { FactoryGirl.create(:published_post, author: author, topic: topics.first) }
      before { visit topic_posts_path(id: topics.first.slug) }

      specify "he sees posts for a topic" do
        expect(page).to have_content design_post.title
      end

      # specify "he can't see other author's posts" do
      #   expect(page).to_not have_content other_authors_post.title
      # end
    end

    describe "on show post page" do
      before { visit post_path(published_posts.first) }

      specify "user sees edit post link" do
        expect(page).to_not have_link "Edit", href: edit_post_path(published_posts[0].slug)
      end

      specify "user sees back link" do
        expect(page).to have_link "Back", href: posts_path
      end
    end
  end
end
