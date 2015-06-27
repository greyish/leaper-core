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

class LeaveType < ActiveRecord::Base
end
