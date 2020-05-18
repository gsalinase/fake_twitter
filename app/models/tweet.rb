class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :retweets
  validates :content, presence: true
  paginates_per 50
end
