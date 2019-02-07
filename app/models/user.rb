class User < ApplicationRecord
  has_secure_password
  has_many :links, dependent: :destroy
  has_many :comments
  
  USER_FORMAT = /\A[A-Za-z0-9.-]+\z/
  
  PASSWORD_FORMAT = /\A
  (?=.{10,})          
  (?=.*\d)           
  (?=.*[a-z])        
  (?=.*[A-Z])        
  (?=.*[[:^alnum:]]) 
  /x
  
  validates :username,
             presence: true,
             length: { :within => 2..15 },
             uniqueness: { case_sensitive: false},
             format: { with: USER_FORMAT}
  
  validates :password,
             presence: true,
             format: { with: PASSWORD_FORMAT},
             length: { minimum: 10 }
end
