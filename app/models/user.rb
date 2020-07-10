class User < ActiveRecord::Base
  has_secure_password
  has_many :user_places
  has_many :places, through: :user_places
  has_many :cities, through: :places
  has_many :countries, through: :cities 
  validates :name, uniqueness: true
  validates :name, :password_digest, presence: true
end
