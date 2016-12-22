class RemoveAutoretweetFromTweets < ActiveRecord::Migration[5.0]
  def change
    remove_column :tweets, :autoretweet, :string
  end
end
