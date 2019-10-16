Rails.application.configure do

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :authentication => :plain,
    :address => ENV["MAILGUN_SMTP_SERVER"],
    :port => ENV["MAILGUN_SMTP_PORT"],
    :domain => ENV["MAILGUN_DOMAIN"],
    :user_name => ENV["MAILGUN_SMTP_LOGIN"],
    :password => ENV["MAILGUN_SMTP_PASSWORD"]
  }

end

