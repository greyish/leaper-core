class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :user_id
      t.integer :team_id
      t.string :name
      t.string :slack_id
      t.string :slack_name
      t.string :email

      t.timestamps null: false
    end
  end
end
