class Rename < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :twitter_email, :user_email
  end
end
