class UserMailer < ApplicationMailer
  def welcome
    mail(to: "noppe.charles@gmail.com", subject: 'Welcome to Le Wagon')
    # This will render a view in `app/views/user_mailer`!
  end
end