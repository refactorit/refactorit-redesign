require 'rails_helper'

RSpec.describe AttachmentsController, :type => :controller do
  context "user is logged in" do
    let(:user) { FactoryGirl.create(:user) }
    before { sign_in user }

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST create with valid params" do
      let(:attachment) { fixture_file_upload "test.png", 'image/png' }
      subject { post :create,
        params: { attachment: { image: attachment } }
       }

      it "returns http redirect" do
        subject
        expect(response).to have_http_status(:redirect)
      end

      it "creates an attachment" do
        expect{ subject }.to change { Attachment.count }.by(1)
      end
    end

    describe "POST create with invalid params" do
      subject { post :create,
        params: { attachment: { image: "" } }
       }

      it "returns http success" do
        subject
        expect(response).to have_http_status(:success)
      end

      it "doesn't create an attachment" do
        expect{ subject }.to_not change { Attachment.count }
      end
    end

    describe "DELETE destroy with valid params" do
      let!(:attachment) { FactoryGirl.create(:attachment) }
      subject {
        delete :destroy,
        params: { id: attachment.id }
      }

      it "returns http redirect" do
        subject
        expect(response).to have_http_status :redirect
      end

      it 'destroys the attachment' do
        expect{ subject }.to change{ Attachment.count}.by(-1)
      end
    end
  end

  context "user is not logged in" do
    describe "GET index" do
      it "returns http redirect" do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end

    describe "GET new" do
      it "returns http redirect" do
        get :new
        expect(response).to have_http_status(:redirect)
      end
    end

    describe "POST create with valid params" do
      let(:attachment) { fixture_file_upload "test.png", 'image/png' }
      subject { post :create,
        params: { attachment: { image: attachment } }
       }

      it "returns http redirect" do
        subject
        expect(response).to have_http_status(:redirect)
      end

      it "doesn't create an attachment" do
        expect{ subject }.to_not change { Attachment.count }
      end
    end

    describe "DELETE destroy with valid params" do
      let!(:attachment) { FactoryGirl.create(:attachment) }
      subject {
        delete :destroy,
        params: { id: attachment.id }
      }

      it "returns http redirect" do
        subject
        expect(response).to have_http_status :redirect
      end

      it 'destroys the attachment' do
        expect{ subject }.to_not change{ Attachment.count}
      end
    end
  end
end
