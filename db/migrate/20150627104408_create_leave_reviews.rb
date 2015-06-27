class CreateLeaveReviews < ActiveRecord::Migration
  def change
    create_table :leave_reviews do |t|
      t.integer :leave_request_id
      t.integer :employee_id
      t.string :comment
      t.boolean :is_approved

      t.timestamps null: false
    end
  end
end
