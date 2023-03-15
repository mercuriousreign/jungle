class User < ApplicationRecord
  has_secure_password

  before_save { email.downcase! }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, length: {minimum: 5}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email,pass)
    user = User.find_by(email: email.downcase)
    if user && user.authenticate(pass)
      return user
    end
    return nil
  end
end
