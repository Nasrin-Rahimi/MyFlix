class UsersController < ApplicationController

  before_action :authentication_required, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'users/new'
      # We do not want to go to new action again. we just want to show user the new form. 
      #so with this render we have @user with errors in it.
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email, :phone_number)
  end

  def set_user
    @user = User.find(params[:id])
  end

end

# if @user.plan.nil?
#   @msg = "No plan found for this user"
# end