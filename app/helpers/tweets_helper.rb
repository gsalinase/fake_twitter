module TweetsHelper
  def render_hashtag(body)
    body.gsub(/#\w+/) { |w| link_to w, "tweets/hashtags/#{w.delete('#')}" }.html_safe
  end
end
