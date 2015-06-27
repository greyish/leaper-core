module Slacker

  def notify_team_and_admin
    admin = Employee.find_by_id(@team.admin_id)
    notifier("@#{admin.slack_name}", "@#{@employee.slack_name} has requested a #{@leave_type.name} leave from #{@options["FromDate"]} to #{@options["ToDate"]}.\n You can approve the leave by typing `\\leaper approveLeave #{@employee.slack_name.downcase}` or you can ask for the employee team's approval by typing `\\leaper askTeam #{@employee.slack_name.downcase}`.")
  end


  def notifier target, message
    HTTParty.post @user.webhook_url, body: {"text" => message, "username" => "Leaper Bot", "channel" => target}.to_json, headers: {'content-type' => 'application/json'}
  end
end
