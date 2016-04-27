require 'rails_helper'

RSpec.describe PostsHelper, :type => :helper do
  describe "#markdown_to_html" do
    it "converts markdown to html correctly" do
      markdown_text = "This is a header\r======="
      expect(markdown_to_html(markdown_text)).to eq "<h1>This is a header</h1>\n"
    end
  end

  describe "#format_date" do
    it "converts dates correctly" do
      post = FactoryGirl.build(:published_post,
        published_at: Time.new(2015, 10, 31, 12, 0, 0))
      expect(format_date(post.published_at)).to eq " Oct 31, 2015"
    end
  end

  describe "#topic_icon" do
    it 'render correct image tag' do
      topic = FactoryGirl.create(:topic, name: "design")
      post = FactoryGirl.build(:published_post, topic: topic)
      expect(topic_icon(post)).to eq "#{post.topic_name}.svg"
    end
  end
end
