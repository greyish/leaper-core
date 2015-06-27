module Slacker

  def notify_admin
    admin = Employee.find_by_id(@team.admin_id)
    notifier("@#{admin.slack_name}", "@#{@employee.slack_name} has requested a #{@leave_type.name} leave from #{@options["FromDate"]} to #{@options["ToDate"]}.\n You can approve the leave by typing `\\leaper approveLeave #{@employee.slack_name.downcase}` or you can ask for the employee team's approval by typing `\\leaper askTeam #{@employee.slack_name.downcase}`.")
  end

  def approve_team_behalf
    @team.employees.each do |emp|
      @leave_record.leave_reviews.where(:employee_id => emp).first.update_attributes(:is_approved => true)
    end
    @leave_record.update_attributes(:status => 'Approved')
    notifier "@#{@requester.slack_name}", "Your Leave Request is successfully approved by your Team Admin."
  end

  def notify_team
    @team.employees.each do |emp|
      if emp.id != @team.admin_id
        notifier("@#{emp.slack_name}", "@#{@requester.slack_name} has requested leave from #{@leave_record[:from]} to #{@leave_record[:to]}.\n If you don't have any impediments, you can approve the leave by typing `\\leaper approveLeave #{@requester.slack_name.downcase}`.")
      end
    end
  end

  def notifier target, message
    HTTParty.post @user.webhook_url, body: {"text" => message, "username" => "Leaper Bot", "channel" => target}.to_json, headers: {'content-type' => 'application/json'}
  end
end
