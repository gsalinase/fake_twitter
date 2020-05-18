class RemoveUserFromTweet < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tweets, :user_id, foreign_key: true
  end
end
