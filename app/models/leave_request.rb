# == Schema Information
#
# Table name: leave_requests
#
#  id            :integer          not null, primary key
#  employee_id   :integer
#  leave_type_id :integer
#  from          :date
#  to            :date
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class LeaveRequest < ActiveRecord::Base
end
