class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password

  validates :first_name, presence: true 
  validates :last_name, presence: true 
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, confirmation: true, presence: true, length: { minimum: 2 }
  validates :password_confirmation, presence: true


  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip unless email.nil?
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      return user
    end 
    nil
  end

end
