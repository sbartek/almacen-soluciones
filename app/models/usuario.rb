class Usuario < ActiveRecord::Base
  validates :nombre, presence: true, length: {maximum: 50, minimum: 4}, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
end
