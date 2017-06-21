class SessionsController < ApplicationController

  def new
   redirect_to root_url  
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or root_url
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
       if user.nil?
        redirect_to root_url
        flash[:danger] = "Account doesn't exist - please sign up."
      
       else
        redirect_to root_url
        flash[:danger] = 'Invalid password - please try again.' 
     end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end