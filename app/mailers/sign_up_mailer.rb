class SignUpMailer < ActionMailer::Base
  
  include SendGrid
  
  default from: "no-reply@harpuun.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sign_up_mailer.confirm.subject
  #
  def starter_confirm(recipient)
    @starter = recipient
    @url = "http://www.harpuun.com"
    mail(:to => "#{recipient.email}", :subject => "Thanks for Signing Up!" )
  end  
  
  def client_confirm(recipient)
    @client = recipient
    @url = "http://www.harpuun.com"
    mail(:to => "#{recipient.email}", :subject => "Thanks for Signing Up!" )
  end  
  
  def project_accepted(offer)
    @client = offer.project.client
    @url = "http://www.harpuun.com"
    mail(:to => "#{offer.project.client.email}", :subject => "Your project has been accepted!" )
  end
end
