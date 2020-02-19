class User < ActiveRecord::Base
  validates :username, uniqueness:true
  validates :username, presence:true
  validates :email, uniqueness:true
  validates :email, presence:true
  has_secure_password
  has_many :tweets
end
