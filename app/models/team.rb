# == Schema Information
#
# Table name: teams
#
#  id           :integer          not null, primary key
#  name         :string
#  channel_name :string
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Team < ActiveRecord::Base
  belongs_to :user
  has_many :employees

  def populate_leave_reviews leave_request
    self.employees.each do |emp|
      leave_request.leave_reviews.create(:employee => emp)
    end
  end

end
