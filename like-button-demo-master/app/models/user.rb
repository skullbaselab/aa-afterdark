class User < ActiveRecord::Base
  attr_reader :password

  validates :username, :password_digest, :session_token, presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  before_validation :ensure_session_token

  has_many :likes
  has_many :liked_photos, through: :likes, source: :photo

  def self.find_by_credentials(username, password)
    user = self.find_by_username(username)
    user && user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def photo_likes_hash
    zipped_likes = likes.pluck(:photo_id).zip(likes)
    likes_hash = {}

    zipped_likes.each do |(id, like)|
      likes_hash[id] = like
    end

    likes_hash
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    save!
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
