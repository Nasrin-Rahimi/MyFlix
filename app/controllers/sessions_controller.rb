class SessionsController < ApplicationController
  def new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      #The person 100% trusted coming from github
      user  = User.find_or_create_by_omniauth(auth_hash)
      login(user)
      redirect_to root_path
    else
      #Normal login with an email and password
      user = User.find_by(name: params[:name])
      if user && user.authenticate(params[:password])
        login(user)
        redirect_to root_path
      else
        render 'sessions/new'
      end
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end
