require "rails_helper"

RSpec.describe PostsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/posts").to route_to("posts#index")
    end

    it "routes to #admin_index" do
      expect(:get => "/pirates/posts").to route_to("posts#admin_index")
    end

    it "routes to #author_index" do
      expect(:get => "/author/some-author/posts").to route_to("posts#author_index", :id => "some-author")
    end

    it "routes to #new" do
      expect(:get => "pirates/posts/new").to route_to("posts#new")
    end

    it "routes to #show" do
      expect(:get => "/posts/some-post").to route_to("posts#show", :id => "some-post")
    end

    it "routes to #edit" do
      expect(:get => "pirates/posts/some-post/edit").to route_to("posts#edit", :id => "some-post")
    end

    it "routes to #create" do
      expect(:post => "posts").to route_to("posts#create")
    end

    it "routes to #update" do
      expect(:put => "posts/some-post").to route_to("posts#update", :id => "some-post")
    end

    it "routes to #destroy" do
      expect(:delete => "posts/some-post").to route_to("posts#destroy", :id => "some-post")
    end

  end
end
