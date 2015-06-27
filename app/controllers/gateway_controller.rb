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
      unless @leave_type = @leave_types.find_by_name(@options["LeaveType"])
        render text: "Invalid leave type. Available leave types are #{@leave_types.pluck(:name)}"
        return
      end
      leave_request_create(leave_request_params(params))
      notify_team_and_admin
      render text: "Thanks for the Leave Request. Your Team Admin is notified for approval."
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
    valid_opts = VALID_COMMANDS[@command]
    opts = params[:text].split(" ")[1]

    unless opts
      render text: "Please provide valid options. Required options for #{@command} are #{valid_opts.join(", ")}"
      return
    end

    if opts !~ /[a-zA-z]+,((\d{,2}-\d{,2}-\d{2,4}),){2}\D+/
      render text: "Invalid Options. Required options and format for #{@command} are #{valid_opts.join(", ")}"
    elsif opts.split(",").size < valid_opts.size - 1
      render text: "Invalid number of options. Required options for #{@command} are #{valid_opts.join(", ")}"
    end
    opts = opts.split(",")
    @options = Hash[valid_opts[0..-2].map.with_index {|opt, i| [opt, opts[i]]}]
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
