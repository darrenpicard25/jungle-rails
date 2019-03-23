class User < ActiveRecord::Base
  has_secure_password

  validates :firstname, :lastname, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
end
