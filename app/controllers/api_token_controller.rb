class ApiTokenController < ApplicationController
 before_action :get_user,         only: [:create]
 before_action :valid_user,       only: [:create]


  def create
    @user = current_user
    if @user
      @user.create_api_digest
      @user.send_api_token_email
      flash[:success] = "Email with API-token was sent"
      redirect_to root_url
    else
      flash[:info] = "Please try again"
      redirect_to root_url
    end
  end

private

    # Before filters

    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_user
      if logged_in?
      user = current_user
      unless (user.activated?)
        redirect_to root_url
      end
    end
  end

end