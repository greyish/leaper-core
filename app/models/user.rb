class User < ActiveRecord::Base
  has_many :employees
  before_save :update_employees

  private

  def update_employees
    resp = HTTParty.get("https://slack.com/api/users.list?token=xoxp-6936400343-6936400359-6936978661-51d769&pretty=1").as_json
    unless resp["ok"]
      Rails.logger.info "Error Fetching URL"
      return
    end

    resp["members"].each do |emp|
      self.employees.create(:name => emp["real_name"], :slack_id => emp["id"], :slack_name => emp["name"], :email => emp["profile"]["email"])
    end
  end
end
