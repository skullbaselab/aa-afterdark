class Dog < ActiveRecord::Base
  after_create :send_welcome_email
  extend FriendlyId
  friendly_id :name, use: :slugged

  def send_welcome_email
    DogMailer.delay.welcome_email(self)
  end
end
