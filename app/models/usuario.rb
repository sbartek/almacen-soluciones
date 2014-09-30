class Usuario < ActiveRecord::Base
  has_secure_password
  before_create :create_remember_token
  before_save { email.downcase! }

  validates :nombre, presence: true, length: {maximum: 50, minimum: 4}, uniqueness: true
  validates :password, length: { minimum: 6 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  def to_s
    "#{nombre}"
  end

  def Usuario.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Usuario.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = Usuario.digest(Usuario.new_remember_token)
    end

end
