class AddTweetIdFromTweetsUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets_users, :tweet_id, :bigint
  end
end
