# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  country_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#  session_token   :string           not null
#  password_digest :string           not null
#

class User < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank"}
  validates :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token

  attr_reader :password

  belongs_to(
    :country,
    class_name: "Country",
    foreign_key: :country_id,
    primary_key: :id
  )

  has_many(
    :tweets,
    class_name: "Tweet",
    foreign_key: :author_id,
    primary_key: :id
  )

  def self.find_by_credentials(username, password)
    user = User.find_by(name: username)
    return user if user && user.matches_password?(password)
    nil
  end

  def matches_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.generate_session_token
    token = SecureRandom::urlsafe_base64(16)

    while User.exists?(session_token: token)
      token = SecureRandom::urlsafe_base64(16)
    end
    token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    # REMEMBER TO SAVE. WORST BUG EVER
    self.save!
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
