class ContactsController < ApplicationController
  def new
    redirect_to root_url
  end

  def create
    @contact = Contact.new(contacts_params)
    @contact.request = request

   if verify_recaptcha(model: @contact) && @contact.deliver
   # if @contact.deliver
      redirect_to root_url
      flash[:success] = 'Thank you for your message. We will contact you soon!'

    else
     
	  redirect_to root_url 	
      flash[:danger] = "Can't send message. Please try again"

    end
  end

  private

def contacts_params
    params.require(:contact).permit(:name, :email, :message, :nickname)
  end

end



