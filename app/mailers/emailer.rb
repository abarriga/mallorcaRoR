class Emailer < ActionMailer::Base
  default from: "info@mallorcaror.org"
  
  def new_user(user, email)
    @user = user
    mail(:to => email, :subject => I18n.translate('mails.partners.subject'))
  end
end
