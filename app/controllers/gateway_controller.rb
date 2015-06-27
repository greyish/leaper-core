class GatewayController < ApplicationController
  include LeaveRequestProcess
  include Slacker

  before_action :check_valid_commands
  before_action :check_valid_params

  def bouncer
    @user = User.find_by_slack_token(params[:token])
    @employee = @user.employees.find_by_slack_id(params[:user_id])
    @leave_types = @user.leave_types
    @team = @employee.team

    case @command
    when "reqleave"
      opts = @opts.split(",")
      @options = Hash[@valid_opts[0..-2].map.with_index {|opt, i| [opt, opts[i]]}]

      unless @leave_type = @leave_types.find_by_name(@options["LeaveType"])
        render text: "Invalid leave type. Available leave types are #{@leave_types.pluck(:name)}"
        return
      end

      unless valid_options_provided_leave_request
        render text: "Invalid number of options. Required options for #{@command} are #{@valid_opts.join(", ")}"
        return
      end

      leave_request_create(leave_request_params(params))
      notify_admin
      render text: "Thanks for the Leave Request. Your Team Admin is notified for approval."
    when "approveLeave", "askTeam"
      unless @requester = Employee.find_by_slack_name(@opts.downcase)
        render text: "Invalid UserName. We need Slack Username"
        return
      end

      unless @leave_record = LeaveRequest.pending.find_by_employee_id(@requester)
        render text: "The User has no pending leave requests. Perhaps misspelled?"
        return
      end

      unless @employee.leave_reviews.where(:leave_request_id => @leave_record).first.is_approved
        @leave_record.leave_reviews.where(:employee_id => @requester).first.update_attributes(:is_approved => true)
        if @command == "approveLeave" and @employee == @team.admin
          approve_team_behalf
          render text: "Successfully Approved Leave for #{@requester.slack_name}."
          return
        elsif @command == "askTeam"
          notify_team
          render text: "Have asked team as you asked."
          return
        end
      else
        render text: "You have already approved the leave request for the User."
      end
    end
  end

  private

  def check_valid_commands
    unless VALID_COMMANDS.keys.include? params[:text].split(" ").flatten.first
      render text: "Invalid Command. Available commands are #{VALID_COMMANDS.keys}"
    end
  end

  def check_valid_params
    @command = params[:text].split(" ").flatten.first
    @valid_opts = VALID_COMMANDS[@command]
    @opts = params[:text].split(" ")[1]

    unless @opts
      render text: "Please provide valid options. Required options for #{@command} are #{@valid_opts.join(", ")}"
      return
    end
  end

  def valid_options_provided_leave_request
    if @opts !~ /[a-zA-z]+,((\d{,2}-\d{,2}-\d{2,4}),){2}\D+/ or @opts.split(",").size < @valid_opts.size - 1
      return false
    else
      return true
    end
  end


  def leave_request_params params
    return {
      leave_type: @leave_type,
      from: @options["FromDate"],
      to: @options["ToDate"],
      status: "Pending",
      notes: @options["Notes"]
    }

  end

end
