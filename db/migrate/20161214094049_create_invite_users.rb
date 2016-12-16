class CreateInviteUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :invite_users do |t|
      t.string :email
      t.integer :company_id
      t.string :role

      t.timestamps
    end
  end
end
