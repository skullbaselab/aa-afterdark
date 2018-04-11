# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  location_id     :integer
#  session_token   :string           not null
#  password_digest :string           not null
#

class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank"}
  validates :session_token, presence: true, uniqueness: true
  # we need a password ivar with attr_reader for this validation to work
  # @password will be nil except right after signing up
  validates :password, length: { minimum: 6, allow_nil: true }
  # could use before_validation
  # this is a callback (a method that gets invoked at a certain time)
  after_initialize :ensure_session_token

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


  attr_reader :password
  # def password
  #   @password
  # end

  def self.find_by_credentials(name, password)
    user = User.find_by(name: name)
    return user if user && BCrypt::Password.new(user.password_digest).is_password?(password)
    nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    #set session_token to new random token
    self.session_token = User.generate_session_token
    #make sure to save!
    self.save!
    #return the new session token
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
