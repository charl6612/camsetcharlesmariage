Rails.application.configure do

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :authentication => :plain,
    :address => "smtp.mailgun.org",
    :port => 587,
    :domain => ENV["MAILGUN_DOMAIN"],
    :user_name => ENV["MAILGUN_USER_NAME"],
    :password => ENV["MAILGUN_PASSWORD"]
  }
end

