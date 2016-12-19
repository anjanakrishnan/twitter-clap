class ChangeuserEmailToidHash < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :user_email, :id_hash
  end
end
