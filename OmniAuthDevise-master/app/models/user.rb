class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable
  
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me
  
  has_many :authorizations, :dependent => :destroy
  
  has_many :tweets
  
  def twitter_client
    twitter_auth = authorizations.where(provider: "Twitter").first
    return [] unless twitter_auth
    Twitter::Client.new(
      :oauth_token => twitter_auth.token,
      :oauth_token_secret => twitter_auth.secret
    )
  end
end
