class User < ActiveRecord::Base

  has_many :reviews
  has_secure_password


  validates :firstname, :lastname, :email, :password_digest, presence: true
  validates_uniqueness_of :email
  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Invalid email Address"}
end
