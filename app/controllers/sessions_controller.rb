class SessionsController < ApplicationController
  before_action :user_logged, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      log_in user
    else
      respond_to do |format|
        format.html {redirect_to login_path, alert: 'Erro no login.'}
      end
    end
   end

  def destroy
    log_out
	end

  private

  def session_params
      params.require(:session).permit(:email, :password)
  end

end
