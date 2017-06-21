class StaticPagesController < ApplicationController

  def new
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
    @contact = Contact.new
    @user = User.new
	end
  end
 
end