class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  private

  after_save :welcome_send
  def welcome_send
    if self.saved_change_to_confirmed_at?
    WelcomeMailer.welcome_send(self).deliver
  end
  end

end
