module ApplicationHelper
  def determine_blog_path
    if current_user.present?
      admin_posts_path
    else
      blog_index_path
    end
  end

  def refactorit_twitter_url
    "https://twitter.com/refactorit"
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

  def facebook_share_url(url)
    "https://www.facebook.com/sharer/sharer.php?u=#{url}"
  end

  def twitter_share_url(url, title)
    "http://twitter.com/intent/tweet?original_referer=#{url}/&source=tweetbutton&text=#{title}&url=#{url}&via=refactorit"
  end

  def reddit_share_url(url, title)
    "https://www.reddit.com/submit?url=#{url}&title=#{title}"
  end

  def tapfiliate_partial_name
    current_page(thank_you_path) ? "layouts/tapfiliate_conversion" : "layouts/tapfiliate_landing"
  end

  def mobile_device?
    request.user_agent =~ /Mobile|webOS|Android/
  end

  def current_page(path)
    "current" if current_page?(path)
  end
end
