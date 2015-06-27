class CreateLeaveBalances < ActiveRecord::Migration
  def change
    create_table :leave_balances do |t|
      t.integer :employee_id
      t.integer :leave_type_id
      t.integer :balance

      t.timestamps null: false
    end
  end
end
