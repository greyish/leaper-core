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

require 'test_helper'

class LeaveRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
