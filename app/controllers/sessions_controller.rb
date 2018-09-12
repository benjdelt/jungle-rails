class SessionsController < ApplicationController

  def new
  end 

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user_id
      redirect_to '/'
    else  
      flash[:notice] = "Failed to log in"
      redirect_to '/login'
    end 
  end 

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end 
  
end
