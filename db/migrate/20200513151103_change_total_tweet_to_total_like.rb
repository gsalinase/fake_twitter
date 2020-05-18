class ChangeTotalTweetToTotalLike < ActiveRecord::Migration[5.2]
  def change
    rename_column :tweets, :total_tweet, :total_like
  end
end
