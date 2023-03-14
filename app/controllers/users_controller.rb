class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created."
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end


  def new
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
