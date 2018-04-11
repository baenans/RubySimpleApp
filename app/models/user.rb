class User < ApplicationRecord
  attr_accessor :remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  validates(
    :name,
    presence: true,
    length: { maximum: 50 }
  )

  validates(
    :email,
    presence: true,
    length: { maximum: 255 },
    uniqueness: { case_sensitive: false },
    format: { with: VALID_EMAIL_REGEX }
  )

  validates(
    :password,
    presence: true,
    length: { minimum: 6 },
    allow_nil: true  # Allow nil password on update
  )

  has_secure_password

  # Generates a password digest using BCrypt
  # check impl: https://goo.gl/BeCygN
  def self.digest(string)
    cost =
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        BCrypt::Engine.cost
      end
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers an user in the database in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest
  def authenticated?(remember_token)
    return false if remember_diges.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets an user
  def forget
    update_attribute(:remember_digest, nil)
  end
end
