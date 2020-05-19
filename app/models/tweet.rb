class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :retweets
  validates :content, presence: true
  attribute :total_like, :integer, default: 0
  attribute :total_retweet, :integer, default: 0
  paginates_per 50

  scope :tweets_for_me, -> (user_ids) { where(user_id: user_ids) }
end
