require 'rails_helper'

feature "Blog administration" do

  context "logged in user and two posts exist" do
   let(:user)   { FactoryGirl.create(:user) }
   let!(:posts) { FactoryGirl.create_list(:post, 3, author: user) }
   before { login_as(user, scope: :user) }

    describe "on index page" do
      before { visit posts_path }

      specify "user sees blog posts" do
        expect(page).to have_content posts[0].title
        expect(page).to have_content posts[1].title
      end
    end

    describe "on admin index page" do
      before { visit admin_posts_path }

      specify "user sees blog posts" do
        expect(page).to have_content posts[0].title
        expect(page).to have_content posts[1].title
      end

      specify "user sees edit post link" do
        expect(page).to have_link "Edit", href: edit_post_path(posts[0].slug)
      end

      specify "user sees destroy post link" do
        expect(page).to have_link "Destroy", href: post_path(posts[0].slug)
      end

      specify "user sees new post option" do
        expect(page).to have_link "New Post", href: new_post_path
      end
    end

    describe "on new post page" do
      before { visit new_post_path }

      specify "user sees new post form" do
        expect(page).to have_field  :post_title
        expect(page).to have_field  :post_slug
        expect(page).to have_field  :post_body
        expect(page).to have_field  :post_status
        expect(page).to have_button "Create post"
      end

      describe "and fills in the form correctly" do
        before do
          fill_in :post_title, with: "Some title"
          fill_in :post_body, with: "Some post content"
          click_button "Create post"
        end

        specify "he can see the admin index page again" do
          expect(page).to have_content posts[0].title
          expect(page).to have_link "New Post", href: new_post_path
        end
      end

      describe "and fills in the form incorrectly" do
        before do
          fill_in :post_title, with: ""
          fill_in :post_body, with: "Some post content"
          click_button "Create post"
        end

        specify "he can see the form again" do
          expect(page).to have_field  :post_title
          expect(page).to have_field  :post_slug
          expect(page).to have_field  :post_body, with: "Some post content"
          expect(page).to have_field  :post_status
          expect(page).to have_button "Create post"
        end

        specify "he can see the validation error" do
          expect(page).to have_content "can't be blank"
        end
      end
    end
  end
end
