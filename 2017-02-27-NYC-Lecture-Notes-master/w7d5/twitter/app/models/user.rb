class User < ActiveRecord::Base
  attr_reader :password
  validates :username, :password_digest, :session_token, presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, presence: true, allow_nil: true
  after_initialize :ensure_session_token

  has_many :tweets

  def self.find_by_credentials(credentials)
    user = User.find_by(username: credentials[:username])
    user && user.is_password?(credentials[:password]) ? user : nil
  end

  def self.random_token
    SecureRandom.urlsafe_base64
  end

  def is_password?(password)
    password_digest.is_password?(password)
  end

  def password_digest
    BCrypt::Password.new(super)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    password
  end

  def reset_session_token!
    update(session_token: User.random_token)
    session_token
  end

  private

  def ensure_session_token
    self.session_token ||= User.random_token
  end

end
