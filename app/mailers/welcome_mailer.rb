class WelcomeMailer < ApplicationMailer

  default from: 'jacob@blocipedia.com'

  def welcome_send(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Blocipedia!")
  end

end
