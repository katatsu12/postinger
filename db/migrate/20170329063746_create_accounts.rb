class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :token
      t.string :secret
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end