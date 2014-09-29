class Usuario < ActiveRecord::Base
  has_secure_password

  before_save { self.email = email.downcase }

  validates :nombre, presence: true, length: {maximum: 50, minimum: 4}, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true



  def to_s
    "#{nombre}"
  end
end
