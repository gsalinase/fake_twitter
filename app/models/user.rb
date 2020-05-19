class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :retweets, dependent: :destroy
  # Active
  has_many :active_relationships, class_name:  "Relationship",
            foreign_key: "follower_id", dependent: :destroy
  # Passive
  has_many :passive_relationships, class_name:  "Relationship",
            foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  attribute :image_url, :string, default: 'https://gcdn.net/wp-content/uploads/2018/10/default-avatar.png'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
