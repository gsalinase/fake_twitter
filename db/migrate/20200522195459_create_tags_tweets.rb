class CreateTagsTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tags_tweets do |t|
      t.references :tag, foreign_key: true
      t.references :tweet, foreign_key: true
    end
  end
end
