class User < ActiveRecord::Base

  has_many :reviews

  has_secure_password


  validates :firstname, :lastname, :email, :password_digest, presence: true
  validates :password, length: {minimum: 3, message: "is to short"}, on: :create
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Invalid email Address"}

  private

  def self.authenticate_with_credentials email_session, password_session
    user = User.find_by_email(email_session.strip.downcase)
    if user && user.authenticate(password_session)
      user
    else
      nil
    end
  end
end
