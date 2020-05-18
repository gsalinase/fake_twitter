class AddUserIdToTweet < ActiveRecord::Migration[5.2]
  def change
    add_reference :tweets, :user_id, foreign_key: true
  end
end
