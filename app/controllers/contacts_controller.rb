class ContactsController < ApplicationController
  def new
    @contact = Contact.new #{name: , email: , comments: }
  end
  
  def create
    @contact = Contact.new(contact_params) #{name: 'person', email: 'person@email.com', comments: 'something tasteful'} This mass assingment is formed by 'contact_params' and the values are stored in the blank Contact.new, which is probably stored in the instanced variable, '@contact'.
    # @variables are called instance variables | This point to new.html.erb
    # This will create
    if @contact.save
       redirect_to new_contact_path, notice: "Message sent."
    else
       redirect_to new_contact_path, notice: "Error occured."
    end
  end
  
  private
    def contact_params
       params.require(:contact).permit(:name, :email, :comments)
    end
end