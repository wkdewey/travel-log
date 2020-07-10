class City < ActiveRecord::Base
  belongs_to :country
  has_many :places
  validates :name, :country_id, presence: true
end
