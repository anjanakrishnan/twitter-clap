class RemoveinvitationSentAtFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :invitation_sent_at
  end
end
