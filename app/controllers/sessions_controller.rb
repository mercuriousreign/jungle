class SessionsController < ApplicationController
  
  def new
    redirect_to root_path if current_user
  end
  
  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully."
      redirect_to "/"
    else
      flash.now[:alert] = "There was something wrong with your login details."
      render 'new'
    end

  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end
  

end