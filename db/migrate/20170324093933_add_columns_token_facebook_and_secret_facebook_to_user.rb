class AddColumnsTokenFacebookAndSecretFacebookToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :token_facebook, :string
  end
end
