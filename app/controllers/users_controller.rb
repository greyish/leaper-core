class UsersController < ApplicationController
  def login
    if User.where(:email => login_params[:email], :password => [:password]).first.present?
      render json: "Ok"
    else
      render json: "Invalid Credentials"
    end
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end

end
