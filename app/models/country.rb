class Country < ActiveRecord::Base
  has_many :cities
  has_many :places, through: :cities
  has_many :users, through: :places
  validates :name, presence: true
end
