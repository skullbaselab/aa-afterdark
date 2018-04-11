# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  country         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_token   :string           not null
#  password_digest :string           not null
#

class User < ApplicationRecord # this is Rails 5's version of ActiveRecord::Base
                               # works like ApplicationController but for models
  validates :username, :session_token, :password_digest, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  # when we do User.new(username: 'al', password: 'notstarwars'),
  # we DO have a password,
  # when we do User.find_by(username: 'al'),
  # we DON'T have a password (because those aren't store in the db), hence allow_nil
  after_initialize :ensure_session_token
  # before_validation is valid for the auth pattern, but our specs ask for after_initialize

  has_many :tweets, foreign_key: :author_id
  has_many :user_listings
  has_many :lists, through: :user_listings

  attr_reader :password
  # we need this reader because we're validating password and aren't given a reader
  # by AR::Base automatically since there's no `password` column

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user && user.is_password?(password)
      user
    else
      nil
    end
  end

  def self.generate_session_token # utility function that returns a random alphanumeric string
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(password) # convenient because elsewhere we can do user.is_password?(password)
                             # instead of BCrypt::Password.new(user.password_digest).is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  # password= gets called because we include `password` as a key when we initialize a user
  # e.g. User.new(username: 'al', password: 'notstarwars')
  def password=(password)
    @password = password # just for password validation
    self.password_digest = BCrypt::Password.create(password)
    # `BCrypt::Password.create` returns a BCrypt::Password object, but it gets
    # saved to the db as a string
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save! # make sure you save this user!!
    self.session_token # returning this for convenience, we use its value elsewhere
  end

  def ensure_session_token # gives this user a session token if they don't already have one
    self.session_token ||= User.generate_session_token
  end

end
