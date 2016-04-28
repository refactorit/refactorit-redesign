require 'rails_helper'

describe ContactController do
  let(:valid_params) do
    { contact_form: {
      email: "valid@email.com",
      name: "Customer",
      message: "Valid message!"
      }
    }
  end

  let(:invalid_params) do
    { contact_form: {
      email: "",
      name: "",
      message: ""
      }
    }
  end

  it "#new responds with 200" do
    get :new
    expect(response).to have_http_status 200
  end

  context "#send_question with valid params" do
    it "redirects to contact_new_path when params are valid" do
      post :send_question, params: valid_params
      expect(response).to redirect_to thank_you_path
    end

    it "sends contact e-mail with an instance of contact form" do
      expect(ContactMailer).to receive(:contact_email)
                               .with(an_instance_of(ContactForm))
                               .and_return(double("mailer", deliver: true))
      post :send_question, params: valid_params
    end
  end

  context "#send_question with invalid params" do
    it "doesn't send an e-mail" do
      expect(ContactMailer).to_not receive(:contact_email)
      post :send_question, params: invalid_params
    end
  end
end
