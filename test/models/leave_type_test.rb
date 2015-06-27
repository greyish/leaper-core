# == Schema Information
#
# Table name: leave_types
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  type       :string
#  quota      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class LeaveTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
