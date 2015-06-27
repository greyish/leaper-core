class AddTokenToUser < ActiveRecord::Migration
  def change
    rename_column :users, :slack_token, :slack_api_token
    add_column :users, :slack_token, :string
  end
end
