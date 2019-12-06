class ContactsController < ApplicationController

  def send_welcome_mails #envoyer un mail à tout le monde avec ses identifiant et mdp
    # User.each do |user|
    user = User.find(1127)
    raise
      UserMailer.welcome_email(user).deliver_now
    # end
  end

end