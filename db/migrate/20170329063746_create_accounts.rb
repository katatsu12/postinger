class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :token_tw
      t.string :secret_tw
      t.string :token_g
      t.string :token_vk
      t.string :token_fb
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
