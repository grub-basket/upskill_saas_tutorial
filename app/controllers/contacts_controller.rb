class ContactsController < ApplicationController
  
  # GET request /contact-us
  # Show new contact form
  
  def new
    @contact = Contact.new #{name: , email: , comments: }
  end
  
  # POST request /contacts
  def create
    # Mass assignment of form fields to Contact object
    @contact = Contact.new(contact_params) #{name: 'person', email: 'person@email.com', comments: 'something tasteful'} 
    # This mass assingment is formed by 'contact_params' and the values are stored in the blank Contact.new, 
    # which is probably stored in the instanced variable, '@contact'.
    # @variables are called instance variables | This point to new.html.erb
    # Save the Contact object to the database
    if @contact.save
      # Store form fields via parameters, into variables
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      # Plug variables into Contact Mailer...
      # email method and send email
      ContactMailer.contact_email(name, email, body).deliver
      # Store success message in flash hash so that it could be displayed...
      # and redirect to the new action
      flash[:success] = "Message sent successfully; thank you!"
       redirect_to new_contact_path
    else
      # If contact object doesn't save,
      # store errors in flash hash,
      # and redirect to the new action
       flash[:danger] = @contact.errors.full_messages.join(", ")
       redirect_to new_contact_path
    end
  end
  
  private
    # To collect data from form, we need to use 
    # strong parameters and whitelist the form fields
    def contact_params
       params.require(:contact).permit(:name, :email, :comments)
    end
end