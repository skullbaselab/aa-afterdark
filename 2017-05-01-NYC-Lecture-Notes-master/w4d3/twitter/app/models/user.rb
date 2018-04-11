# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  location_id     :integer
#  password_digest :string
#  session_token   :string
#

class User < ActiveRecord::Base

  validates :name, :location, :password_digest, :session_token, presence: true
  validates :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  attr_reader :password


  belongs_to :location,
    class_name: 'Location',
    primary_key: :id,
    foreign_key: :location_id
  # user has foreign_key, so it holds the belongs_to association
  # belongs to is a method

  has_many :tweets,
    class_name: 'Tweet',
    primary_key: :id,
    foreign_key: :user_id

  def self.find_by_credentials(name, password)
    # useful for login
    user = User.find_by(name: name)
    if user && user.is_password?(password)
      return user
    else
      return nil
    end
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
