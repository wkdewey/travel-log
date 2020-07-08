class Place < ActiveRecord::Base
  belongs_to :user
  validates :name, :country, :city, presence: true
  validates :name, uniqueness: true
end
