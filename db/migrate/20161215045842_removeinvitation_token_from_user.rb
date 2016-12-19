class RemoveinvitationTokenFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :invitation_token
  end
end
