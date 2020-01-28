class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome_email(user)
    #générer un token pour l'user
    generate_token(user)

    #envoyer le mail à l'user
    @user = user
    @sentence = sentence_invite(@user)
    @url  = 'camsetcharles.herokuapp.com'
    mail(to: @user.email, subject: 'Bienvenue au mariage de Cams et Charles')
  end

  def generate_token(user)
    @raw = nil
    raw, enc = Devise.token_generator.generate(user.class, :reset_password_token)
    user.reset_password_token   = enc
    user.reset_password_sent_at = Time.now.utc
    user.save(validate: false)
    @raw = raw
  end

  def sentence_invite(user)
    list = []
    @user.invites.each do |inv|
      list << inv.first_name
    end
    list.to_sentence(locale: :fr)
  end

  def general_message(contact)
    #Mail envoyé depuis le formulaire de contact
    @contact = contact
    mail(from:"camsetcharles", to: "noppe.charles@gmail.com", subject: 'Message du site')
  end

  def welcome_email_all
      #send welcome email to everybody
      User.all.each do |user|
      UserMailer.welcome_email(user).deliver_now
      end
  end

  def welcome_email_one(user)
    #send welcome email to everybody
    UserMailer.welcome_email(user).deliver_now
end


  def email_all
    #send welcome email to everybody
    User.all.each do |user|
      UserMailer.actual_email(user).deliver_now
      end
  end

  def actual_email(user)
    @user = user
    @sentence = sentence_invite(@user)
    @url  = 'camsetcharles.herokuapp.com'
    mail(to: @user.email, subject: 'Hello')
  end

end
