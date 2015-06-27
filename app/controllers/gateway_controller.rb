class GatewayController < ApplicationController
  before_action :check_valid_commands
  before_action :check_valid_params
  def bouncer
    @user = User.find_by_slack_token(params[:token])
  end

  private

  def check_valid_commands
    unless VALID_COMMANDS.keys.include? params[:text].split(" ").flatten.first
      render text: "Invalid Command. Available commands are #{VALID_COMMANDS.keys}"
    end
  end

  def check_valid_params
    command = params[:text].split(" ").flatten.first
    valid_opts = VALID_COMMANDS[command]
    opts = params[:text].split(" ")[1]

    unless opts
      render text: "Please provide valid options. Required options for #{command} are #{valid_opts.join(", ")}"
      return
    end

    if opts =~ /[a-zA-z]+,((\d{,2}-\d{,2}-\d{2,4}),){2}\D+/
      render text: 'Thanks. Leave Request is received, will proceed.'
    elsif opts.split(",").size < valid_opts.size - 1
      render text: "Invalid number of options. Required options for #{command} are #{valid_opts.join(", ")}"
    else
      render text: "Invalid Options. Required options and format for #{command} are #{valid_opts.join(", ")}"
    end
  end

end
