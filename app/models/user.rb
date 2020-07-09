class User < ActiveRecord::Base
  has_secure_password
  has_many :user_places
  has_many :places, through: :user_places
  validates :name, uniqueness: true
  validates :name, :password, presence: true
end
