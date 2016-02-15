require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
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

    describe 'GET show' do
      let(:post) { FactoryGirl.create(:post) }
      it 'responds with 200' do
        get :show, params: { id: post.slug }
        expect(response).to have_http_status 200
      end
    end

    describe 'POST create' do
      subject { post :create, params: { post: FactoryGirl.attributes_for(:post) } }

      it 'responds with 200' do
        expect(response).to have_http_status 200
      end

      it 'increases the number of posts' do
        subject
        expect(Post.count).to eq 1
      end
    end

    describe 'GET edit' do
      let!(:post) { FactoryGirl.create(:post) }

      it 'responds with 200' do
        get :edit, params: { id: post.slug }
        expect(response).to have_http_status 200
      end
    end

    describe 'PUT update' do
      let!(:post) { FactoryGirl.create(:post, title: 'Original title') }
      subject { put :update, params: { id: post.slug, post: { title: 'Updated title' }}}

      it 'responds with redirect' do
        subject
        expect(response).to have_http_status :redirect
      end

      it 'updates post' do
        expect{ subject }.to change{ post.reload.title }.
          from('Original title').to('Updated title')
      end
    end

    describe 'DELETE destroy' do
      let!(:post) { FactoryGirl.create(:post) }
      subject { delete :destroy, params: { id: post.slug }}

      it 'responds with redirect' do
        subject
        expect(response).to have_http_status :redirect
      end

      it 'destroys post' do
        expect{ subject }.
        to change{ Post.count }.by(-1)
      end
    end
  end

  context "user is not signed in" do
    describe 'GET index' do
      it 'responds with 302' do
        get :index
        expect(response).to have_http_status 302
      end
    end

    describe 'GET new' do
      it 'responds with 302' do
        get :new
        expect(response).to have_http_status 302
      end
    end

    describe 'GET show' do
      let(:post) { FactoryGirl.create(:post) }
      it 'responds with 200' do
        get :show, params: { id: post.slug }
        expect(response).to have_http_status 200
      end
    end

    describe 'POST create' do
      subject { post :create, params: { post: FactoryGirl.attributes_for(:post) } }

      it 'responds with 302' do
        subject
        expect(response).to have_http_status 302
      end

      it "doesn't increase the number of posts" do
        subject
        expect(Post.count).to eq 0
      end
    end

    describe 'GET edit' do
      let!(:post) { FactoryGirl.create(:post) }

      it 'responds with 302' do
        get :edit, params: { id: post.slug }
        expect(response).to have_http_status 302
      end
    end

    describe 'PUT update' do
      let!(:post) { FactoryGirl.create(:post, title: 'Original title') }
      subject { put :update, params: { id: post.slug, post: { title: 'Updated title' }}}

      it 'responds with redirect' do
        subject
        expect(response).to have_http_status :redirect
      end

      it 'does not update post' do
        subject
        expect(post.title).to eq post.reload.title
      end
    end

    describe 'DELETE destroy' do
      let!(:post) { FactoryGirl.create(:post) }
      subject { delete :destroy, params: { id: post.slug }}

      it 'responds with redirect' do
        subject
        expect(response).to have_http_status :redirect
      end

      it 'does not destroy post' do
        subject
        expect(Post.count).to eq 1
      end
    end
  end

end
