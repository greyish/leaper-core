class CreateLeaveRequests < ActiveRecord::Migration
  def change
    create_table :leave_requests do |t|
      t.integer :employee_id
      t.integer :leave_type_id
      t.date :from
      t.date :to
      t.string :status

      t.timestamps null: false
    end
  end
end
