class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update,
                                        :following, :followers, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]


  def index 
  @users = User.where(activated: true).paginate(page: params[:page], :per_page => 30)
  end


  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], :per_page => 30) 
    redirect_to root_url unless logged_in? # disable user show before log in
  end
  
  def new
    @user = User.new
     if logged_in? 
       redirect_to root_url # disable sign-up form after log in action 
     end
  end

  def create
    @user = User.new(user_params)
    if @user.save
    # if verify_recaptcha(model: @user) && @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to edit_user_url
    else
      render 'edit'
    end
  end

   def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Account deleted"
    if current_user.admin? 
      redirect_to users_url
    else
      redirect_to root_url
    end    
  end

   def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :picture, :remove_picture)
    end

    # Confirms the correct user or admin user.
    def correct_user
      @user = User.find(params[:id])
      if current_user.admin? 
      elsif current_user?(@user)
      else 
     redirect_to(root_url)
     end
  end

end