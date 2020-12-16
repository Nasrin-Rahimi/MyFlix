class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render 'users/new'
      # We do not want to go to new action again. we just want to show user the new form. 
      #so with this render we have @user with errors in it.
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password_digest, :email, :phone_number, :plan_id)
  end

end
