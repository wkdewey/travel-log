class Place < ActiveRecord::Base
  has_many :user_places
  has_many :users, through: :user_places
  belongs_to :city
  validates :name, :city_id, presence: true
  validates :name, uniqueness: true
end
