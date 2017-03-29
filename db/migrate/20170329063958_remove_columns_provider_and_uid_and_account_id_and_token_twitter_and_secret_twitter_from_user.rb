class RemoveColumnsProviderAndUidAndAccountIdAndTokenTwitterAndSecretTwitterFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
    remove_column :users, :token_twitter, :string
    remove_column :users, :secret_twitter, :string
    remove_column :users, :account_id, :string
  end
end
