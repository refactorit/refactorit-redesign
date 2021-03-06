require 'rails_helper'

describe PagesController do
  it "#home responds with 200" do
    get :home
    expect(response).to have_http_status 200
  end

  it "#services responds with 200" do
    get :services
    expect(response).to have_http_status 200
  end

  it "#thank_you responds with 200" do
    get :thank_you
    expect(response).to have_http_status 200
  end

  it "#page_not_found responds with 404" do
    get :page_not_found, params: { path: 'page-does-not-exist' }
    expect(response).to have_http_status 404
  end
end
