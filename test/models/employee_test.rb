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

require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
