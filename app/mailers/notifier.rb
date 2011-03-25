class Notifier < ActionMailer::Base
  default :from => "notifications@todolys.com"

  def password_reset_instructions(user, token)
    @user = user
    @token = token
    mail(:to => user.email,
         :subject => t('reset_password.subject'))
  end
end
