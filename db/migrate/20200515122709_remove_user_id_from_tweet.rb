class RemoveUserIdFromTweet < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :users_id
  end
end
