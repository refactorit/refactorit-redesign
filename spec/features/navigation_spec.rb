require 'rails_helper'

feature 'Navigation' do
  context "guest visits home page" do
    before { visit root_path }

    specify "he sees correct navigation links" do
      expect(page).to have_link "", href: root_path
      expect(page).to have_link "Contact us", href: contact_new_path
      expect(page).to have_link "Services", href: services_path
      expect(page).to have_link "Blog", href: blog_index_path
      expect(page).to_not have_link "News", href: news_index_path
      expect(page).to_not have_link "Logout", href: destroy_user_session_path
    end
  end

  context "user visits home page" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      login_as user, scope: :user
      visit root_path
    end

    specify "he sees correct blog link" do
      expect(page).to have_link "Blog", href: admin_posts_path
      expect(page).to have_link "News", href: news_index_path
      expect(page).to have_link "Logout", href: destroy_user_session_path
    end
  end
end
