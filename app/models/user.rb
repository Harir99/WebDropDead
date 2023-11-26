# models/user.rb
class User < ApplicationRecord
  attr_accessor :quarters, :sides, :overall_points
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    
    has_secure_password
  
    # Other associations or methods related to the user model can be added here
  end
  