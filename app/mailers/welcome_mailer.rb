class WelcomeMailer < ApplicationMailer

  default from: 'jacob@blocipedia.com'

  def welcome_send(user)
    @user = user
    if user.saved_change_to_confirmed_at?
    mail(to: user.email, subject: "Welcome to Blocipedia!")
    end
  end
end
