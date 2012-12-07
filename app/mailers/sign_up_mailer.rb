class SignUpMailer < ActionMailer::Base
  default from: "no-reply@harpuun.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sign_up_mailer.confirm.subject
  #
  def confirm (recipient)
    @starter = recipient
    @url = "http://www.harpuun.com"
    mail(:to => "#{recipient.email}", :subject => "Thanks for Signing Up!" )
  end
end
