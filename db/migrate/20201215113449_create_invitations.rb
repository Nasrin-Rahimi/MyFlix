class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.string :receiver_name
      t.string :receiver_email
      t.text :message
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
