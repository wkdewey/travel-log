class User < ActiveRecord::Base
  has_many :places
  validates :name, uniqueness: true
  validates :password, presence: true
end
