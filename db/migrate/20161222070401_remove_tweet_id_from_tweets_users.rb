class RemoveTweetIdFromTweetsUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :tweets_users, :tweet_id, :integer
  end
end
