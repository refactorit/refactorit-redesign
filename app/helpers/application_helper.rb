module ApplicationHelper
  def determine_blog_path
    if current_user.present?
      admin_posts_path
    else
      posts_path
    end
  end
end
