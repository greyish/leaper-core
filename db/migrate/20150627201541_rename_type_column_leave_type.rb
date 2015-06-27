class RenameTypeColumnLeaveType < ActiveRecord::Migration
  def change
    rename_column :leave_types, :type, :name
    remove_column :leave_types, :quota
    add_column :leave_types, :quota, :integer
  end
end
