class AuthorsController < ApplicationController

  def post_index
    @user = User.find_by_slug(params[:name])
    @posts = User
  end
end
