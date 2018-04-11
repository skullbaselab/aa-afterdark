# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  created_at      :datetime
#  updated_at      :datetime
#  location_id     :integer          default("1"), not null
#  session_token   :string           not null
#  password_digest :string           not null
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank"}
  validates :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token

  belongs_to :location,
    class_name: "Location",
    primary_key: :id,
    foreign_key: :location_id

  has_many :tweets,
    class_name: "Tweet",
    primary_key: :id,
    foreign_key: :author_id

  attr_reader :password #don't forget this. Hard to debug!

  def self.find_by_credentials(username, password) #must be a class method
    user = User.find_by(username: username)
    return user if user && BCrypt::Password.new(user.password_digest).is_password?(password)
    nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save! #make sure you save, always use save bang(!) unless you need true/false for control flow
    self.session_token #make sure to return this session token will be useful later
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    #this is called in initialize when you make a new User object. How ActiveRecord::Base works
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
