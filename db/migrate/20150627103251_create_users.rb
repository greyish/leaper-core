class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :company_name
      t.string :slack_token
      t.string :webhook_url

      t.timestamps null: false
    end
  end
end
