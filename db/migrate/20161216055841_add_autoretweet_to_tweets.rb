class AddAutoretweetToTweets < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :autoretweet, :string
  end
end
