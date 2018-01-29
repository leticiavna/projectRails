class ResetPasswordController < ApplicationController
  before_action :user_logged

  # GET reset_password/search
  def search
  end

  # POST reset_password/search
  def recover
    user = User.find_by(email: params[:user][:email])
    if user
      password = Passgen::generate(:length => 6)
      user.password = password
      user.password_confirmation = password
      user.save
      UserMailer.forgot_password(user, password).deliver_now

      flash[:notice] = "Email sent."
      redirect_to login_path
    else
      flash.now[:alert] = "User not found."
      render "search"
 	  end
  end

end
