class ContactMailer < ActionMailer::Base 
  default: 'verew@vps911.net' #email provided by temp-mail.org
  
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    
  
    mail(from: email, subject: 'Contact Form Message')
  end
end