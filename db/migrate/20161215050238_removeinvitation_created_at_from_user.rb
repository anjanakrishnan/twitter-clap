class RemoveinvitationCreatedAtFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :invitation_created_at
  end
end
