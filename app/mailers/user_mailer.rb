class UserMailer < ApplicationMailer
  def send_simple_message
    RestClient.post "https://api:b47be5e4849315fe3ccccfa635444286-c27bf672-98da50cf"\
    "@api.mailgun.net/v3/YOUR_DOMAIN_NAME/messages",
    :from => "Excited User <mailgun@YOUR_DOMAIN_NAME>"
    :to => "bar@example.com, YOU@YOUR_DOMAIN_NAME",
    :subject => "Hello",
    :text => "Testing some Mailgun awesomness!"
  end
  
end