class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password
  validates :email, presence: true, uniqueness: true

  has_many :topics
end
