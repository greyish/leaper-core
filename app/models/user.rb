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

class User < ActiveRecord::Base
  has_many :employees
  has_many :teams
  has_many :leave_types
end
