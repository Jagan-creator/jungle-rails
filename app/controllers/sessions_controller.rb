class SessionsController < ApplicationController
  def new 
  end

  def create
    user = User.find_by_email(params[:email])
    # check if user already exists and autenticate if they do
    if user && user.authenticate(params[:password])
      # save the user_id session
      session[:user_id] = user.id
      redirect_to '/'
    else
    # redirect to login if the login does not work
      redirect_to '/login'
    end
  end

  def destroy
    # redirect to login if the user decides to logout
    session[:user_id] = nil
    redirect_to '/login'
  end
end