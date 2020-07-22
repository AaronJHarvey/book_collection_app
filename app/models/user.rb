class User < ActiveRecord::Base
  has_many :books
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  has_secure_password
end
