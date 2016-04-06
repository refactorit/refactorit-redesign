require 'rails_helper'

feature "News administration" do
  context "logged in user and two news exist" do
   let(:user)   { FactoryGirl.create(:user) }
   let!(:news) { FactoryGirl.create_list(:published_news, 3) }

   before { login_as(user, scope: :user) }

    describe "on index page" do
      before { visit news_index_path }

      specify "user sees correct news items" do
        expect(page).to have_content news[0].title
        expect(page).to have_content news[1].title
      end

      specify "user sees edit news link" do
        expect(page).to have_link "Edit", href: edit_news_path(news[0].id)
      end

      specify "user sees destroy news link" do
        expect(page).to have_link "Destroy", href: news_path(news[0].id)
      end

      specify "user sees new news option" do
        expect(page).to have_link "New news", href: new_news_path
      end
    end

    describe "on new news page" do
      before { visit new_news_path }

      specify "user sees new news form" do
        expect(page).to have_field  :news_title
        expect(page).to have_field  :news_description
        expect(page).to have_field  :news_published
        expect(page).to have_field  :news_url
        expect(page).to have_button "Create news"
      end

      describe "and fills in the form correctly" do
        before do
          fill_in :news_title, with: "Some title"
          fill_in :news_description, with: "Some description"
          check 'Published'
          click_button "Create news"
        end

        specify "he can see the admin index page again" do
          expect(page).to have_content news[0].title
          expect(page).to have_link "New news", href: new_news_path
        end
      end

      describe "and fills in the form incorrectly" do
        before do
          fill_in :news_title, with: ""
          fill_in :news_description, with: "Some news"
          click_button "Create news"
        end

        specify "he can see the form again" do
          expect(page).to have_field  :news_title
          expect(page).to have_field  :news_description, with: "Some news"
          expect(page).to have_field  :news_published
          expect(page).to have_field  :news_url
          expect(page).to have_button "Create news"
        end

        specify "he can see the validation error" do
          expect(page).to have_content "can't be blank"
        end
      end
    end
  end
end
