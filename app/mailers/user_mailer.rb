class UserMailer < ActionMailer::Base
  default from: 'newsletter-attendance-vcsi@DONotReply.com'

  def newsletter(user)
    @user = user
    mail(to: @user.email, subject: 'My newsletter')
  end
end