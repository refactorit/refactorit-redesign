require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  it 'redirects legacy post path' do
    get '/2016/03/bath-ruby-2016-review'
    expect(response).to redirect_to('/posts/bath-ruby-2016-review')
  end
end

