require 'rails_helper'

describe PagesController do
  it "#home responds with 200" do
    get :home
    expect(response).to have_http_status 200
  end

  it "#about responds with 200" do
    get :about
    expect(response).to have_http_status 200
  end

  it "#team responds with 200" do
    get :team
    expect(response).to have_http_status 200
  end

  it "#services responds with 200" do
    get :services
    expect(response).to have_http_status 200
  end
end
