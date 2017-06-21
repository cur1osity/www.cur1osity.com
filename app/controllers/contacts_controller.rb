class ContactsController < ApplicationController
  def new
    redirect_to root_url
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request

    if verify_recaptcha(model: @contact) && @contact.save
      @contact.deliver_now 
      redirect_to root_url
      flash[:success] = 'Thank you for your message. We will contact you soon!'

    else
     
	  redirect_to root_url 	
      flash[:danger] = "Can't send message. Please try again"

    end
  end
end



