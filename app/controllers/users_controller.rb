class UsersController < ApplicationController

  # this is used for back-end aministration, needs to be login
  # GET /users/admin
  def admin
    @sessionid = session[:user_id]
    if @sessionid == nil
      redirect_to root_url
    else
      @users = User.all
    end
  end

  # needs login user to create a new user
  # GET /users/new
  def new
    @sessionid = session[:user_id]
    if @sessionid == nil
      redirect_to root_url
    else
      @user = User.new
    end
  end

  # needs login user, show current user information
  # GET /users/index
  def index
    @sessionid = session[:user_id]
    if @sessionid == nil
       redirect_to root_url
    else
      @user = User.find(@sessionid)
      # used to show current user's app information
      @apps = App.all
      @apps = @apps.where(user_id: @sessionid) # choose apps for current user
    end
  end

  # create a new user
  # GET /users/create
  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to :root
    else
      render :new
    end
  end

  # show certain user information
  # GET /users/show
  def show 
    if logged_in?
      @user= User.find(params[:id])
    else
      redirect_to root_url
    end
  end

  # limit the paramater pass
  def users_params
    params.require(:user).permit(:login, :password)
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:login, :password)
    end
  
end
