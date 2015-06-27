# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password        :string
#  company_name    :string
#  slack_api_token :string
#  webhook_url     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slack_token     :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
