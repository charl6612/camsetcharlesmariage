class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def create
    @user = current_user
    @contact = Contact.new(contact_params)
    @contact.user_id = @user.id
    @contact.email = @user.email
    if @contact.save
      UserMailer.general_message(@contact).deliver_now
      flash[:success] = "Message envoyé"
      redirect_to contacts_thanks_path()
    else
      render :new
    end
  end
  
  def thanks

  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :message)
  end
    
end