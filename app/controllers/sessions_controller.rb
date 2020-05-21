class SessionsController < ApplicationController

  def new
  end
  # create a new session when input login and password matches user record
  def create
    @user = User.find_by_login(params[:session][:login])
    if @user && (params[:session][:password]) == @user.password.to_s
      session[:user_id] = @user.id
      redirect_to apps_path
    else
      render 'new'  # stay in login page if not matched
    end
  end

  # destoy current session when called
  def destroy
    session.delete(:user_id)
    render 'new'
  end
end