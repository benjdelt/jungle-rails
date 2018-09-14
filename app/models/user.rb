class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password


  validates :first_name, presence: true 
  validates :email, uniqueness: true, presence: true
  validates :password, confirmation: true, presence: true 

end
