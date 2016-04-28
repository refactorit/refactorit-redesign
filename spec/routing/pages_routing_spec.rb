require 'rails_helper'

RSpec.describe PagesController, type: :routing do
  describe "routing" do

    context "when page does not exist" do
      it "routes to #page_not_found" do
        expect(get: "/page-does-not-exist").
          to route_to(controller: "pages", action: "page_not_found",
                      path: "page-does-not-exist")
      end
    end
  end
end

