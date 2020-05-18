class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  def photo_user(id)
    User.where('id = ?', id).pluck(:image_url).map{|url| url }
  end

  def add_like
    tweet.update(total_like: tweet.total_like += 1)
  end

  def delete_like
    tweet.update(total_like: tweet.total_like -= 1)
  end
end
