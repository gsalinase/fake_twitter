class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :retweets
  has_and_belongs_to_many :tags
  validates :content, presence: true
  attribute :total_like, :integer, default: 0
  attribute :total_retweet, :integer, default: 0
  paginates_per 50

  after_create do
    tweet = Tweet.find_by(id: self.id)
    hashtags = self.content.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      tweet.tags << tag
    end
  end

  before_update do
    hashtags = content.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      tags << tag
    end
  end

  scope :tweets_for_me, -> (user_ids) { where(user_id: user_ids) }
end
