class UsersController < ApplicationController
  def login
    if @user = User.where(:email => params[:email], :password => params[:password]).first
      render json: {res_id: "1", res_msg: "Login Successful", user: show_user}
    else
      render json: {res_id: "0", res_msg: "Invalid Credentials"}
    end
  end

  private

  def show_user
    @user.as_json.except("email", "password", "slack_token", "webhook_url", "created_at", "updated_at")
  end

end
