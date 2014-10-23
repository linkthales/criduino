class User < ActiveRecord::Base
  attr_accessible :email, :full_name, :password, :password_confirmation
  
  validates_presence_of :email, :full_name
  validates_length_of :password, :minimum => 6, :allow_blank => false
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates_uniqueness_of :email
  
  has_secure_password
end
