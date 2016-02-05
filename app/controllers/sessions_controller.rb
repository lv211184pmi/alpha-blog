class SessionsController < ApplicationController
  
  def new
  
  end
  
  def create
    #taking email from session form and find the same in database
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Wellcome on Alpha-blog"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Your login-information is incorrect"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You successfully logged out"
    redirect_to root_path
  end
  
end