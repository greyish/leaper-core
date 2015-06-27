# == Schema Information
#
# Table name: leave_balances
#
#  id            :integer          not null, primary key
#  employee_id   :integer
#  leave_type_id :integer
#  balance       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class LeaveBalance < ActiveRecord::Base
end
