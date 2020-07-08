class User < ActiveRecord::Base
  has_secure_password
  has_many :places
  validates :name, uniqueness: true
  validates :name, :password, presence: true
end
