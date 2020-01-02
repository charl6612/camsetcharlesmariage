class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome_email(user)
    @user = user
    @sentence = sentence_invite(@user)
    @url  = 'camsetcharles.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def sentence_invite(user)
    list = []
    @user.invites.each do |inv|
      list << inv.first_name
    end
    list.to_sentence(locale: :fr)
  end
end
