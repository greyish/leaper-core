class User < ActiveRecord::Base
  has_many :employees
  has_many :teams

  private

  def update_employees
    slack_url = "https://slack.com/api/users.list?token=#{self.slack_token}"
    resp = HTTParty.get(slack_url).as_json
    unless resp["ok"]
      Rails.logger.info "Error Fetching URL"
      return
    end

    resp["members"].each do |emp|
      self.employees.create(:name => emp["real_name"], :slack_id => emp["id"], :slack_name => emp["name"], :email => emp["profile"]["email"])
    end
  end
end
