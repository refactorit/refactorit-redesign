require 'rails_helper'

describe ContactController do

  it "#send_question redirects to root" do
    post :send_question
    expect(response).to redirect_to root_path
  end

end
