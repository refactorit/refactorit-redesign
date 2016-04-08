module ApplicationHelper
  def determine_blog_path
    if current_user.present?
      admin_posts_path
    else
      posts_path
    end
  end

  def refactorit_twitter_url
    "https://twitter.com/refactorit/"
  end

  def refactorit_facebook_url
    "https://www.facebook.com/refactorit.co"
  end

  def refactorit_github_url
    "https://github.com/refactorit"
  end

  def refactorit_linkedin_url
    "https://www.linkedin.com/company/3495144"
  end

  def refactorit_dribbble_url
    "https://dribbble.com/refactorit"
  end
end
