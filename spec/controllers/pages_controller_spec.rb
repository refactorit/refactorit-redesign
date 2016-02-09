require 'rails_helper'

describe PagesController do
  it "#home responds with 200" do
    get :home
    expect(response).to have_http_status 200
  end
end
