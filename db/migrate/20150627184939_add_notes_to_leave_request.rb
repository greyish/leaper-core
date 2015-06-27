class AddNotesToLeaveRequest < ActiveRecord::Migration
  def change
    add_column :leave_requests, :notes, :string
  end
end
