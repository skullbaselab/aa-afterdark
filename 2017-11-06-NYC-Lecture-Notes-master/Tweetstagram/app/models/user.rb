class User < ApplicationRecord
  validates :username, :session_token, :password_digest, presence: true
  validates :session_token, uniqueness: true
  # have to allow nil because @password doesn't persist in database, only exists when password= method called
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password

  # below callback runs right after new user is initialized
  after_initialize :ensure_session_token

  has_many :tweets,
  class_name: 'Tweet',
  foreign_key: :author_id,
  primary_key: :id

  has_many :comments_on_my_tweets,
  through: :tweets, #tweets here is just the name of the association defined in this model
  source: :comments #comments is the name of the association in the destination model

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && user.is_password?(password)
    nil
  end

  def is_password?(password)
    # below is_password? method is a BCrypt::Password method
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

end
