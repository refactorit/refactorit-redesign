require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#mobile_device?" do
    context "when mobile device" do
      it "returns not nil" do
        controller.request.user_agent = "Mobile/1.0"
        expect(helper.mobile_device?).to_not be_nil 
      end
    end
    context "when desktop device" do
      it "returns nil" do
        controller.request.user_agent = "Linux x86_64/1.0"
        expect(helper.mobile_device?).to be_nil 
      end
    end
  end
end
