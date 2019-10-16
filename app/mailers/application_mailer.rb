class ApplicationMailer < ActionMailer::Base
  default from: 'mailgun@sandbox3791e2ddfc8a411a9fe9160b938e1fac.mailgun.org'

  layout 'mailer'
end