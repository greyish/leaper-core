class CreateLeaveTypes < ActiveRecord::Migration
  def change
    create_table :leave_types do |t|
      t.integer :user_id
      t.string :type
      t.string :quota

      t.timestamps null: false
    end
  end
end
