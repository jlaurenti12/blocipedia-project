class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis, dependent: :destroy
  has_many :collaborators, dependent: :destroy
  has_many :shared_wikis, through: :collaborators, source: :wiki

  after_initialize { self.role ||= :standard }

  enum role: [:standard, :admin, :premium]

  def collaborator?(wiki)
    self.collaborators.where(wiki: wiki).present?
  end

  def downgrade
    self.wikis.each do |wiki|
      wiki.update_attribute(:private, false)
        wiki.collaborators.each do |collaborator|
          collaborator.destroy
        end
    end
    self.role = "standard"
  end

  private

  after_save :welcome_send
  def welcome_send
    if self.saved_change_to_confirmed_at?
    WelcomeMailer.welcome_send(self).deliver
   end
  end


end
