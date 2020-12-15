class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.float :amount
      t.datetime :created_at
      t.references :user, null: false, foreign_key: true
    end
  end
end
