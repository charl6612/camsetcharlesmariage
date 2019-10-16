Rails.application.configure do

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :authentication => :plain,
    :address => "smtp.mailgun.org",
    :port => 587,
    :domain => "sandboxec2324b2775a42bb968f5c921ffcbf2d.mailgun.org",
    :user_name => "postmaster@sandboxec2324b2775a42bb968f5c921ffcbf2d.mailgun.org",
    :password => "87727d30314d822bfac5e1dcad92da9f-c27bf672-da238548"
  }
end