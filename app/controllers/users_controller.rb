class UsersController < ApplicationController

  before_action :authentication_required, except: [:new, :create]
  before_action :authorize_admin, only: [:index, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

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

  def destroy
    if @user.admin
      @users = User.all
      flash.now[:notice] ="You don't have permission to delete Admin"
      render :index
    else
      @user.destroy
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email, :phone_number, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

end