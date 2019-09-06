ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 465,
  domain: 'gmail.com',
  user_name: ENV['GMAIL_EMAIL'],
  password: ENV['GMAIL_PASSWORD'],
  authentication: :plain,
  enable_starttls_auto: true
}