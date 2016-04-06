require 'rails_helper'

RSpec.describe NewsController, :type => :controller do
  let(:user) { FactoryGirl.create(:user) }

  context "user is signed in" do
    before { sign_in user }

    describe 'GET index' do
      it 'responds with 200' do
        get :index
        expect(response).to have_http_status 200
      end
    end

    describe 'GET new' do
      it 'responds with 200' do
        get :new
        expect(response).to have_http_status 200
      end
    end

    describe 'POST create with valid params' do
      subject { post :create,
        params: {
          news: FactoryGirl.attributes_for(:news)
        }
      }

      it 'responds with 302' do
        subject
        expect(response).to have_http_status 302
      end

      it 'increases the number of news' do
        expect{ subject }.
        to change{ News.count }.by(1)
      end
    end

    describe 'POST create with invalid params' do
      subject do
        post :create, params: { news:
          { title: "", description: "Some description" }
        }
      end

      it 'responds with 200' do
        subject
        expect(response).to have_http_status 200
      end

      it "doesn't increase the number of news" do
        subject
        expect(News.count).to eq 0
      end
    end

    describe 'GET edit' do
      let!(:news) { FactoryGirl.create(:news) }

      it 'responds with 200' do
        get :edit, params: { id: news.id }
        expect(response).to have_http_status 200
      end
    end

    describe 'PUT update' do
      let!(:news) { FactoryGirl.create(:news, title: 'Original title') }
      subject { put :update, params:
        { id: news.id,
          news: { title: 'Updated title' }
        }
      }

      it 'responds with redirect' do
        subject
        expect(response).to have_http_status :redirect
      end

      it 'updates news' do
        expect{ subject }.to change{ news.reload.title }.
          from('Original title').to('Updated title')
      end
    end

    describe 'DELETE destroy' do
      let!(:news) { FactoryGirl.create(:news) }
      subject { delete :destroy, params: { id: news.id }}

      it 'responds with redirect' do
        subject
        expect(response).to have_http_status :redirect
      end

      it 'destroys news' do
        expect{ subject }.
        to change{ News.count }.by(-1)
      end
    end
  end

  context "user is not signed in" do
    describe 'GET index' do
      it 'responds with 200' do
        get :index
        expect(response).to have_http_status 302
      end
    end
  end
end
