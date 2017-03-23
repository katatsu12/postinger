class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :token_twitter, :string
    add_column :users, :secret_twitter, :string
  end
end
