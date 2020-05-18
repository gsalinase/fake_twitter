class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :retweets
  validates :content, presence: true
  attribute :total_like, :integer, default: 0
  attribute :total_retweet, :integer, default: 0
  paginates_per 50
end
