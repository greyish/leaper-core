# == Schema Information
#
# Table name: leave_reviews
#
#  id               :integer          not null, primary key
#  leave_request_id :integer
#  employee_id      :integer
#  comment          :string
#  is_approved      :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class LeaveReview < ActiveRecord::Base
end
