class AddMessageToRetweets < ActiveRecord::Migration[5.0]
  def change
    add_column :retweets, :message, :string
  end
end
