class User < ActiveRecord::Base
  #BCrypt
  attr_accessor :password
  validates_confirmation_of :password
  before_save :encrypt_password

  has_many :questions
  has_many :answers
  has_many :responses
  has_many :votes, as: :voteable

  def self.authenticate(username, password)
    user = User.where(username: username).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end
