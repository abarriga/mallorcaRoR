class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :surname, :email, :image_path, :description, :web
  has_secure_password
  
  validates :image_path, :presence => true
  validates :name, :presence => true
  validates :email, :presence => true, :email=> true, :uniqueness=> true
  validates :surname, :presence => true
  validates :password, :presence => true
  validates :password_confirmation, :presence => true
  
end
