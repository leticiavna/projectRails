class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :user_not_logged, except: [:new, :create]
	before_action :user_logged, only: [:new, :create]
  before_action :correct_user, only: [:edit, :update]
  before_action :correct_user_or_admin, only: :destroy


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    if @user.save
      flash[:notice] = "Welcome!"
      log_in @user
    else
      flash.now[:notice] = "Something wrong happened."
      render "new"
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User was successfully created.'
      log_in @user
    else
      flash.now[:notice] = "Something went wrong."
	    render "new"
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if @user.destroy
      redirect_to feed_path
    else
      show_user_path(id: @user.id)
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def correct_user
      if current_user != @user
        flash[:alert] = "Not allowed."
        redirect_to show_user_path(id: current_user.id)
      end
    end

    def correct_user_or_admin
      if !current_user.admin && current_user != @user
        flash[:alert] = "Not allowed."
        redirect_to show_user_path(id: current_user.id)
      elsif current_user == @user && current_user.admin
        flash[:alert] = "Not allowed."
        redirect_to show_user_path(id: current_user.id)
      end
    end

end
