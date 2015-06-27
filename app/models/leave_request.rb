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
#  notes         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class LeaveRequest < ActiveRecord::Base
  belongs_to :leave_type
  belongs_to :employee

  has_many :leave_reviews

  after_create :populate_reviews

  scope :pending, -> {where(status: "Pending")}

  def populate_reviews
    team = self.employee.team.populate_leave_reviews self
  end
end
