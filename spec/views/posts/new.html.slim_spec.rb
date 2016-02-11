require 'rails_helper'

RSpec.describe "posts/new", :type => :view do
  before(:each) do
    assign(:post, Post.new(
      :title => "MyString",
      :description => "MyString",
      :body => "MyText",
      :status => 1
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_title[name=?]", "post[title]"

      assert_select "input#post_description[name=?]", "post[description]"

      assert_select "textarea#post_body[name=?]", "post[body]"

      assert_select "input#post_status[name=?]", "post[status]"
    end
  end
end
