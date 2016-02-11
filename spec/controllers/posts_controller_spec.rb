require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
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

  describe 'POST create' do
    subject { post :create, params: { post: FactoryGirl.attributes_for(:post) } }

    it 'responds with 200' do
      expect(response).to have_http_status 200      
    end
  end

  describe 'GET edit' do
    let!(:post) { FactoryGirl.create(:post) }

    it 'responds with 200' do
      get :edit, params: { id: post.id }
      expect(response).to have_http_status 200
    end
  end

  describe 'PUT update' do
    let!(:post) { FactoryGirl.create(:post, title: 'Original title') }
    subject { put :update, params: { id: post.id, post: { title: 'Updated title' }}}
    
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
    subject { delete :destroy, params: { id: post.id }}

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
