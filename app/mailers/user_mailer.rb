class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome_email(user)

    generate_token(user)

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
    @contact = contact
    mail(from:"camsetcharles", to: "noppe.charles@gmail.com", subject: 'Message du site')
  end
end
