# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  team_id    :integer
#  name       :string
#  slack_id   :string
#  slack_name :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Employee < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  has_many :leave_requests
  has_many :leave_reviews
end
