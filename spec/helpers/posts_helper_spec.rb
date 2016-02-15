require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PostsHelper, :type => :helper do
  describe "#markdown_to_html" do
    it "converts markdown to html correctly" do
      markdown_text = "This is a header\r======="
      expect(markdown_to_html(markdown_text)).to eq "<h1>This is a header</h1>\n"
    end
  end
end
