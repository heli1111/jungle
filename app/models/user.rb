class User < ActiveRecord::Base

  has_secure_password

  #has_many :orders

  #attr_accessor :first_name, :last_name, :email, :password, :password_confirmation

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email

end
