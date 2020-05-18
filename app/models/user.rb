class User < ApplicationRecord
  has_many :tweets
  has_many :likes
  attribute :image_url, :string, default: 'https://gcdn.net/wp-content/uploads/2018/10/default-avatar.png'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
