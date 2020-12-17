class SessionsController < ApplicationController
  def new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      #they logged in vio OAuth
      #The person 100% trusted coming from github
      oauth_name = request.env["omniauth.auth"]["info"]["name"]
      if user = User.find_by(:name => oauth_name)
           session[:user_id] = user.id
           redirect_to root_path
      else
          user = User.new(:name => oauth_name, :password => SecureRandom.hex)
          if user.save
              session[:user_id] = user.id
              redirect_to root_path
          else
              raise user.errors.full_messages.inspect
          end
      end
    else
      #Normal login with an email and password
      user = User.find_by(name: params[:name])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
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
